Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF7029041F
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 13:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404639AbgJPLeq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 16 Oct 2020 07:34:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:49142 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394795AbgJPLeq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 07:34:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 936D2AD7C;
        Fri, 16 Oct 2020 11:34:42 +0000 (UTC)
Date:   Fri, 16 Oct 2020 13:34:40 +0200
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     luben.tuikov@amd.com, airlied@linux.ie,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        chris@chris-wilson.co.uk, melissa.srw@gmail.com, ray.huang@amd.com,
        kraxel@redhat.com, emil.velikov@collabora.com,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com,
        krzk@kernel.org, steven.price@arm.com,
        linux-rockchip@lists.infradead.org, kgene@kernel.org,
        alyssa.rosenzweig@collabora.com, linux+etnaviv@armlinux.org.uk,
        spice-devel@lists.freedesktop.org, bskeggs@redhat.com,
        etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
        xen-devel@lists.xenproject.org,
        virtualization@lists.linux-foundation.org, sean@poorly.run,
        apaneers@amd.com, linux-arm-kernel@lists.infradead.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        tomeu.vizoso@collabora.com, sw0312.kim@samsung.com,
        hjc@rock-chips.com, kyungmin.park@samsung.com,
        miaoqinglang@huawei.com, yuq825@gmail.com,
        alexander.deucher@amd.com, linux-media@vger.kernel.org,
        christian.koenig@amd.com
Subject: Re: [PATCH v4 10/10] drm/fb_helper: Support framebuffers in I/O
 memory
Message-ID: <20201016133440.65cadb6d@linux-uq9g>
In-Reply-To: <20201016105854.GB1042954@ravnborg.org>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-11-tzimmermann@suse.de>
 <20201016105854.GB1042954@ravnborg.org>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Fri, 16 Oct 2020 12:58:54 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Thomas.
> 
> On Thu, Oct 15, 2020 at 02:38:06PM +0200, Thomas Zimmermann wrote:
> > At least sparc64 requires I/O-specific access to framebuffers. This
> > patch updates the fbdev console accordingly.
> > 
> > For drivers with direct access to the framebuffer memory, the callback
> > functions in struct fb_ops test for the type of memory and call the rsp
> > fb_sys_ of fb_cfb_ functions.
> > 
> > For drivers that employ a shadow buffer, fbdev's blit function retrieves
> > the framebuffer address as struct dma_buf_map, and uses dma_buf_map
> > interfaces to access the buffer.
> > 
> > The bochs driver on sparc64 uses a workaround to flag the framebuffer as
> > I/O memory and avoid a HW exception. With the introduction of struct
> > dma_buf_map, this is not required any longer. The patch removes the rsp
> > code from both, bochs and fbdev.
> > 
> > v4:
> > 	* move dma_buf_map changes into separate patch (Daniel)
> > 	* TODO list: comment on fbdev updates (Daniel)
> 
> I have been offline for a while so have not followed all the threads on
> this. So may comments below may well be addressed but I failed to see
> it.
> 
> If the point about fb_sync is already addressed/considered then:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

It has not been brought up yet. See below.

> 
> 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  Documentation/gpu/todo.rst        |  19 ++-
> >  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
> >  drivers/gpu/drm/drm_fb_helper.c   | 217 ++++++++++++++++++++++++++++--
> >  include/drm/drm_mode_config.h     |  12 --
> >  4 files changed, 220 insertions(+), 29 deletions(-)
> > 
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 7e6fc3c04add..638b7f704339 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -197,13 +197,28 @@ Convert drivers to use drm_fbdev_generic_setup()
> >  ------------------------------------------------
> >  
> >  Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
> > -atomic modesetting and GEM vmap support. Current generic fbdev emulation
> > -expects the framebuffer in system memory (or system-like memory).
> > +atomic modesetting and GEM vmap support. Historically, generic fbdev
> > emulation +expected the framebuffer in system memory or system-like
> > memory. By employing +struct dma_buf_map, drivers with frambuffers in I/O
> > memory can be supported +as well.
> >  
> >  Contact: Maintainer of the driver you plan to convert
> >  
> >  Level: Intermediate
> >  
> > +Reimplement functions in drm_fbdev_fb_ops without fbdev
> > +-------------------------------------------------------
> > +
> > +A number of callback functions in drm_fbdev_fb_ops could benefit from
> > +being rewritten without dependencies on the fbdev module. Some of the
> > +helpers could further benefit from using struct dma_buf_map instead of
> > +raw pointers.
> > +
> > +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
> > +
> > +Level: Advanced
> > +
> > +
> >  drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
> >  -----------------------------------------------------------------
> >  
> > diff --git a/drivers/gpu/drm/bochs/bochs_kms.c
> > b/drivers/gpu/drm/bochs/bochs_kms.c index 13d0d04c4457..853081d186d5
> > 100644 --- a/drivers/gpu/drm/bochs/bochs_kms.c
> > +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> > @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
> >  	bochs->dev->mode_config.preferred_depth = 24;
> >  	bochs->dev->mode_config.prefer_shadow = 0;
> >  	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> > -	bochs->dev->mode_config.fbdev_use_iomem = true;
> >  	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order =
> > true; 
> >  	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> Good to see this workaround gone again!
> 
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c
> > b/drivers/gpu/drm/drm_fb_helper.c index 6212cd7cde1d..462b0c130ebb 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -372,24 +372,22 @@ static void drm_fb_helper_resume_worker(struct
> > work_struct *work) }
> >  
> >  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper
> > *fb_helper,
> > -					  struct drm_clip_rect *clip)
> > +					  struct drm_clip_rect *clip,
> > +					  struct dma_buf_map *dst)
> >  {
> >  	struct drm_framebuffer *fb = fb_helper->fb;
> >  	unsigned int cpp = fb->format->cpp[0];
> >  	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
> >  	void *src = fb_helper->fbdev->screen_buffer + offset;
> > -	void *dst = fb_helper->buffer->map.vaddr + offset;
> >  	size_t len = (clip->x2 - clip->x1) * cpp;
> >  	unsigned int y;
> >  
> > -	for (y = clip->y1; y < clip->y2; y++) {
> > -		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> > -			memcpy(dst, src, len);
> > -		else
> > -			memcpy_toio((void __iomem *)dst, src, len);
> > +	dma_buf_map_incr(dst, offset); /* go to first pixel within clip
> > rect */ 
> > +	for (y = clip->y1; y < clip->y2; y++) {
> > +		dma_buf_map_memcpy_to(dst, src, len);
> > +		dma_buf_map_incr(dst, fb->pitches[0]);
> >  		src += fb->pitches[0];
> > -		dst += fb->pitches[0];
> >  	}
> >  }
> >  
> > @@ -417,8 +415,9 @@ static void drm_fb_helper_dirty_work(struct
> > work_struct *work) ret = drm_client_buffer_vmap(helper->buffer, &map);
> >  			if (ret)
> >  				return;
> > -			drm_fb_helper_dirty_blit_real(helper,
> > &clip_copy);
> > +			drm_fb_helper_dirty_blit_real(helper,
> > &clip_copy, &map); }
> > +
> >  		if (helper->fb->funcs->dirty)
> >  			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
> >  						 &clip_copy, 1);
> > @@ -755,6 +754,136 @@ void drm_fb_helper_sys_imageblit(struct fb_info
> > *info, }
> >  EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
> >  
> So far everything looks good.
> 
> > +static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user
> > *buf,
> > +				      size_t count, loff_t *ppos)
> > +{
> > +	unsigned long p = *ppos;
> > +	u8 *dst;
> > +	u8 __iomem *src;
> > +	int c, err = 0;
> > +	unsigned long total_size;
> > +	unsigned long alloc_size;
> > +	ssize_t ret = 0;
> > +
> > +	if (info->state != FBINFO_STATE_RUNNING)
> > +		return -EPERM;
> > +
> > +	total_size = info->screen_size;
> > +
> > +	if (total_size == 0)
> > +		total_size = info->fix.smem_len;
> > +
> > +	if (p >= total_size)
> > +		return 0;
> > +
> > +	if (count >= total_size)
> > +		count = total_size;
> > +
> > +	if (count + p > total_size)
> > +		count = total_size - p;
> > +
> > +	src = (u8 __iomem *)(info->screen_base + p);
> screen_base is a char __iomem * - so this cast looks semi redundant.

I took the basic code from fbdev. Maybe there's a reason for the case,
otherwise I'll remove it.

> 
> > +
> > +	alloc_size = min(count, PAGE_SIZE);
> > +
> > +	dst = kmalloc(alloc_size, GFP_KERNEL);
> > +	if (!dst)
> > +		return -ENOMEM;
> > +
> Same comment as below about fb_sync.
> 
> 
> > +	while (count) {
> > +		c = min(count, alloc_size);
> > +
> > +		memcpy_fromio(dst, src, c);
> > +		if (copy_to_user(buf, dst, c)) {
> > +			err = -EFAULT;
> > +			break;
> > +		}
> > +
> > +		src += c;
> > +		*ppos += c;
> > +		buf += c;
> > +		ret += c;
> > +		count -= c;
> > +	}
> > +
> > +	kfree(dst);
> > +
> > +	if (err)
> > +		return err;
> > +
> > +	return ret;
> > +}
> > +
> > +static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char
> > __user *buf,
> > +				       size_t count, loff_t *ppos)
> > +{
> > +	unsigned long p = *ppos;
> > +	u8 *src;
> > +	u8 __iomem *dst;
> > +	int c, err = 0;
> > +	unsigned long total_size;
> > +	unsigned long alloc_size;
> > +	ssize_t ret = 0;
> > +
> > +	if (info->state != FBINFO_STATE_RUNNING)
> > +		return -EPERM;
> > +
> > +	total_size = info->screen_size;
> > +
> > +	if (total_size == 0)
> > +		total_size = info->fix.smem_len;
> > +
> > +	if (p > total_size)
> > +		return -EFBIG;
> > +
> > +	if (count > total_size) {
> > +		err = -EFBIG;
> > +		count = total_size;
> > +	}
> > +
> > +	if (count + p > total_size) {
> > +		/*
> > +		 * The framebuffer is too small. We do the
> > +		 * copy operation, but return an error code
> > +		 * afterwards. Taken from fbdev.
> > +		 */
> > +		if (!err)
> > +			err = -ENOSPC;
> > +		count = total_size - p;
> > +	}
> > +
> > +	alloc_size = min(count, PAGE_SIZE);
> > +
> > +	src = kmalloc(alloc_size, GFP_KERNEL);
> > +	if (!src)
> > +		return -ENOMEM;
> > +
> > +	dst = (u8 __iomem *)(info->screen_base + p);
> > +
> 
> The fbdev variant call the fb_sync callback here.
> noveau and gma500 implments the fb_sync callback - but no-one else.

These drivers implement some form of HW acceleration. If they have a HW
blit/draw/etc op queued up, they have to wait for it to complete. Otherwise,
the copied memory would contain an old state. The fb_sync acts as the fence.

Fbdev only uses software copying, so the fb_sync is not required.

From what I heard, the HW acceleration is not useful on modern machines. I
hope to convert more drivers to generic fbdev after these patches for
I/O-memory support have been merged.

> 
> 
> > +	while (count) {
> > +		c = min(count, alloc_size);
> > +
> > +		if (copy_from_user(src, buf, c)) {
> > +			err = -EFAULT;
> > +			break;
> > +		}
> > +		memcpy_toio(dst, src, c);
> When we rewrite this part to use dma_buf_map_memcpy_to() then we can
> merge the two variants of helper_{sys,cfb}_read()?
> Which is part of the todo - so OK

I'm not sure if dma_buf_map is a good fit here. The I/O-memory function does
an additional copy between system memory and I/O memory. Of course, the top
and bottom of both functions are similar and could probably be shared.

Best regards
Thomas

> > +
> > +		dst += c;
> > +		*ppos += c;
> > +		buf += c;
> > +		ret += c;
> > +		count -= c;
> > +	}
> > +
> > +	kfree(src);
> > +
> > +	if (err)
> > +		return err;
> > +
> > +	return ret;
> > +}
> > +
> >  /**
> >   * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
> >   * @info: fbdev registered by the helper
> > @@ -2027,6 +2156,66 @@ static int drm_fbdev_fb_mmap(struct fb_info *info,
> > struct vm_area_struct *vma) return -ENODEV;
> >  }
> >  
> > +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
> > +				 size_t count, loff_t *ppos)
> > +{
> > +	struct drm_fb_helper *fb_helper = info->par;
> > +	struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		return drm_fb_helper_sys_read(info, buf, count, ppos);
> > +	else
> > +		return drm_fb_helper_cfb_read(info, buf, count, ppos);
> > +}
> > +
> > +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char
> > __user *buf,
> > +				  size_t count, loff_t *ppos)
> > +{
> > +	struct drm_fb_helper *fb_helper = info->par;
> > +	struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		return drm_fb_helper_sys_write(info, buf, count, ppos);
> > +	else
> > +		return drm_fb_helper_cfb_write(info, buf, count, ppos);
> > +}
> > +
> > +static void drm_fbdev_fb_fillrect(struct fb_info *info,
> > +				  const struct fb_fillrect *rect)
> > +{
> > +	struct drm_fb_helper *fb_helper = info->par;
> > +	struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		drm_fb_helper_sys_fillrect(info, rect);
> > +	else
> > +		drm_fb_helper_cfb_fillrect(info, rect);
> > +}
> > +
> > +static void drm_fbdev_fb_copyarea(struct fb_info *info,
> > +				  const struct fb_copyarea *area)
> > +{
> > +	struct drm_fb_helper *fb_helper = info->par;
> > +	struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		drm_fb_helper_sys_copyarea(info, area);
> > +	else
> > +		drm_fb_helper_cfb_copyarea(info, area);
> > +}
> > +
> > +static void drm_fbdev_fb_imageblit(struct fb_info *info,
> > +				   const struct fb_image *image)
> > +{
> > +	struct drm_fb_helper *fb_helper = info->par;
> > +	struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		drm_fb_helper_sys_imageblit(info, image);
> > +	else
> > +		drm_fb_helper_cfb_imageblit(info, image);
> > +}
> > +
> >  static const struct fb_ops drm_fbdev_fb_ops = {
> >  	.owner		= THIS_MODULE,
> >  	DRM_FB_HELPER_DEFAULT_OPS,
> > @@ -2034,11 +2223,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
> >  	.fb_release	= drm_fbdev_fb_release,
> >  	.fb_destroy	= drm_fbdev_fb_destroy,
> >  	.fb_mmap	= drm_fbdev_fb_mmap,
> > -	.fb_read	= drm_fb_helper_sys_read,
> > -	.fb_write	= drm_fb_helper_sys_write,
> > -	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> > -	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> > -	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> > +	.fb_read	= drm_fbdev_fb_read,
> > +	.fb_write	= drm_fbdev_fb_write,
> > +	.fb_fillrect	= drm_fbdev_fb_fillrect,
> > +	.fb_copyarea	= drm_fbdev_fb_copyarea,
> > +	.fb_imageblit	= drm_fbdev_fb_imageblit,
> >  };
> >  
> >  static struct fb_deferred_io drm_fbdev_defio = {
> > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> > index 5ffbb4ed5b35..ab424ddd7665 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -877,18 +877,6 @@ struct drm_mode_config {
> >  	 */
> >  	bool prefer_shadow_fbdev;
> >  
> > -	/**
> > -	 * @fbdev_use_iomem:
> > -	 *
> > -	 * Set to true if framebuffer reside in iomem.
> > -	 * When set to true memcpy_toio() is used when copying the
> > framebuffer in
> > -	 * drm_fb_helper.drm_fb_helper_dirty_blit_real().
> > -	 *
> > -	 * FIXME: This should be replaced with a per-mapping is_iomem
> > -	 * flag (like ttm does), and then used everywhere in fbdev code.
> > -	 */
> > -	bool fbdev_use_iomem;
> > -
> >  	/**
> >  	 * @quirk_addfb_prefer_xbgr_30bpp:
> >  	 *
> > -- 
> > 2.28.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
