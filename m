Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C7A295B87
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 11:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509618AbgJVJSp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 05:18:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:44336 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505549AbgJVJSp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 05:18:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E375DB240;
        Thu, 22 Oct 2020 09:18:42 +0000 (UTC)
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     luben.tuikov@amd.com, airlied@linux.ie,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        chris@chris-wilson.co.uk, melissa.srw@gmail.com, ray.huang@amd.com,
        kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com,
        krzk@kernel.org, steven.price@arm.com,
        linux-rockchip@lists.infradead.org, kgene@kernel.org,
        bskeggs@redhat.com, linux+etnaviv@armlinux.org.uk,
        spice-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
        etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
        xen-devel@lists.xenproject.org,
        virtualization@lists.linux-foundation.org, sean@poorly.run,
        apaneers@amd.com, linux-arm-kernel@lists.infradead.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        tomeu.vizoso@collabora.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
        sw0312.kim@samsung.com, hjc@rock-chips.com,
        kyungmin.park@samsung.com, miaoqinglang@huawei.com,
        yuq825@gmail.com, alexander.deucher@amd.com,
        linux-media@vger.kernel.org, christian.koenig@amd.com
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-9-tzimmermann@suse.de>
 <20201022084919.GU401619@phenom.ffwll.local>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 08/10] drm/gem: Store client buffer mappings as struct
 dma_buf_map
Message-ID: <f2d83a8b-91b3-ac64-b77f-2b1c78729014@suse.de>
Date:   Thu, 22 Oct 2020 11:18:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201022084919.GU401619@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 22.10.20 10:49, Daniel Vetter wrote:
> On Tue, Oct 20, 2020 at 02:20:44PM +0200, Thomas Zimmermann wrote:
>> Kernel DRM clients now store their framebuffer address in an instance
>> of struct dma_buf_map. Depending on the buffer's location, the address
>> refers to system or I/O memory.
>>
>> Callers of drm_client_buffer_vmap() receive a copy of the value in
>> the call's supplied arguments. It can be accessed and modified with
>> dma_buf_map interfaces.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Tested-by: Sam Ravnborg <sam@ravnborg.org>
>> ---
>>  drivers/gpu/drm/drm_client.c    | 34 +++++++++++++++++++--------------
>>  drivers/gpu/drm/drm_fb_helper.c | 23 +++++++++++++---------
>>  include/drm/drm_client.h        |  7 ++++---
>>  3 files changed, 38 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
>> index ac0082bed966..fe573acf1067 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -235,7 +235,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>>  {
>>  	struct drm_device *dev = buffer->client->dev;
>>  
>> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
>> +	drm_gem_vunmap(buffer->gem, &buffer->map);
>>  
>>  	if (buffer->gem)
>>  		drm_gem_object_put(buffer->gem);
>> @@ -291,25 +291,31 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
>>  /**
>>   * drm_client_buffer_vmap - Map DRM client buffer into address space
>>   * @buffer: DRM client buffer
>> + * @map_copy: Returns the mapped memory's address
>>   *
>>   * This function maps a client buffer into kernel address space. If the
>> - * buffer is already mapped, it returns the mapping's address.
>> + * buffer is already mapped, it returns the existing mapping's address.
>>   *
>>   * Client buffer mappings are not ref'counted. Each call to
>>   * drm_client_buffer_vmap() should be followed by a call to
>>   * drm_client_buffer_vunmap(); or the client buffer should be mapped
>>   * throughout its lifetime.
>>   *
>> + * The returned address is a copy of the internal value. In contrast to
>> + * other vmap interfaces, you don't need it for the client's vunmap
>> + * function. So you can modify it at will during blit and draw operations.
>> + *
>>   * Returns:
>> - *	The mapped memory's address
>> + *	0 on success, or a negative errno code otherwise.
>>   */
>> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>> +int
>> +drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map_copy)
>>  {
>> -	struct dma_buf_map map;
>> +	struct dma_buf_map *map = &buffer->map;
>>  	int ret;
>>  
>> -	if (buffer->vaddr)
>> -		return buffer->vaddr;
>> +	if (dma_buf_map_is_set(map))
>> +		goto out;
>>  
>>  	/*
>>  	 * FIXME: The dependency on GEM here isn't required, we could
>> @@ -319,13 +325,14 @@ void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>>  	 * fd_install step out of the driver backend hooks, to make that
>>  	 * final step optional for internal users.
>>  	 */
>> -	ret = drm_gem_vmap(buffer->gem, &map);
>> +	ret = drm_gem_vmap(buffer->gem, map);
>>  	if (ret)
>> -		return ERR_PTR(ret);
>> +		return ret;
>>  
>> -	buffer->vaddr = map.vaddr;
>> +out:
>> +	*map_copy = *map;
>>  
>> -	return map.vaddr;
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL(drm_client_buffer_vmap);
>>  
>> @@ -339,10 +346,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>>   */
>>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>>  {
>> -	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buffer->vaddr);
>> +	struct dma_buf_map *map = &buffer->map;
>>  
>> -	drm_gem_vunmap(buffer->gem, &map);
>> -	buffer->vaddr = NULL;
>> +	drm_gem_vunmap(buffer->gem, map);
>>  }
>>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
>>  
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index c2f72bb6afb1..6212cd7cde1d 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -378,7 +378,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
>>  	unsigned int cpp = fb->format->cpp[0];
>>  	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
>>  	void *src = fb_helper->fbdev->screen_buffer + offset;
>> -	void *dst = fb_helper->buffer->vaddr + offset;
>> +	void *dst = fb_helper->buffer->map.vaddr + offset;
>>  	size_t len = (clip->x2 - clip->x1) * cpp;
>>  	unsigned int y;
>>  
>> @@ -400,7 +400,8 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>>  	struct drm_clip_rect *clip = &helper->dirty_clip;
>>  	struct drm_clip_rect clip_copy;
>>  	unsigned long flags;
>> -	void *vaddr;
>> +	struct dma_buf_map map;
>> +	int ret;
>>  
>>  	spin_lock_irqsave(&helper->dirty_lock, flags);
>>  	clip_copy = *clip;
>> @@ -413,8 +414,8 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>>  
>>  		/* Generic fbdev uses a shadow buffer */
>>  		if (helper->buffer) {
>> -			vaddr = drm_client_buffer_vmap(helper->buffer);
>> -			if (IS_ERR(vaddr))
>> +			ret = drm_client_buffer_vmap(helper->buffer, &map);
>> +			if (ret)
>>  				return;
>>  			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
>>  		}
>> @@ -2060,7 +2061,8 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>>  	struct drm_framebuffer *fb;
>>  	struct fb_info *fbi;
>>  	u32 format;
>> -	void *vaddr;
>> +	struct dma_buf_map map;
>> +	int ret;
>>  
>>  	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
>>  		    sizes->surface_width, sizes->surface_height,
>> @@ -2096,11 +2098,14 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>>  		fb_deferred_io_init(fbi);
>>  	} else {
>>  		/* buffer is mapped for HW framebuffer */
>> -		vaddr = drm_client_buffer_vmap(fb_helper->buffer);
>> -		if (IS_ERR(vaddr))
>> -			return PTR_ERR(vaddr);
>> +		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
>> +		if (ret)
>> +			return ret;
>> +		if (map.is_iomem)
>> +			fbi->screen_base = map.vaddr_iomem;
>> +		else
>> +			fbi->screen_buffer = map.vaddr;
>>  
>> -		fbi->screen_buffer = vaddr;
>>  		/* Shamelessly leak the physical address to user-space */
>>  #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
>>  		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0)
> 
> Just noticed a tiny thing here: I think this needs to be patched to only
> set smem_start when the map is _not_ iomem. Since virt_to_page isn't
> defined on iomem at all.
> 
> I guess it'd be neat if we can set this for iomem too, but I have no idea
> how to convert an iomem pointer back to a bus_addr_t ...

Not that I disagree, but that should be reviewed by the right people.
The commit at 4be9bd10e22d ("drm/fb_helper: Allow leaking fbdev
smem_start") appears to work around specific userspace drivers.

Best regards
Thomas

> 
> Cheers, Daniel
> 
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index 7aaea665bfc2..f07f2fb02e75 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -3,6 +3,7 @@
>>  #ifndef _DRM_CLIENT_H_
>>  #define _DRM_CLIENT_H_
>>  
>> +#include <linux/dma-buf-map.h>
>>  #include <linux/lockdep.h>
>>  #include <linux/mutex.h>
>>  #include <linux/types.h>
>> @@ -141,9 +142,9 @@ struct drm_client_buffer {
>>  	struct drm_gem_object *gem;
>>  
>>  	/**
>> -	 * @vaddr: Virtual address for the buffer
>> +	 * @map: Virtual address for the buffer
>>  	 */
>> -	void *vaddr;
>> +	struct dma_buf_map map;
>>  
>>  	/**
>>  	 * @fb: DRM framebuffer
>> @@ -155,7 +156,7 @@ struct drm_client_buffer *
>>  drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
>>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
>>  int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
>> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
>> +int drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map);
>>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>>  
>>  int drm_client_modeset_create(struct drm_client_dev *client);
>> -- 
>> 2.28.0
>>
> 

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
