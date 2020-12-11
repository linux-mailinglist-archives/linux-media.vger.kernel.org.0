Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C66E2D7739
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 15:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbgLKN6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 08:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgLKN5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 08:57:48 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E60C0613D3
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 05:57:07 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r3so9150515wrt.2
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 05:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/kA40mSIrLnZ0RgEQ2Dpjs3F6f+M4jjau+UbsX3Ywow=;
        b=EcQVLUcdBvbn1YsbP+wEwu1A/ghGuwHAY6/pixBgGog1lTm6KJ/W3BmCKt7jdBZTeI
         +yko0DpUL1XuCQGbX3coFwO6rjq6p5HLxNbUd+YNtgsKTldh6m4NU8OYl7lyw94iNvXv
         LEl3H4SpoWT3lNz5NT7cW8Nip6LLX4Ic77uYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/kA40mSIrLnZ0RgEQ2Dpjs3F6f+M4jjau+UbsX3Ywow=;
        b=NIrSRot21mnFuXF+k/v95kOD5qhtvy8JqlRv34xcYWl29lTAZQSLcwG3VarotjhI0l
         Hra9++1m10sWFsLbzAyRZuxuXPQYaQk2GhOGzB27vju7tVKzpPMPzcEplJ5ryyyggkTL
         fWbQHYvqo9VsgcwCN9byVD6bBiYQgpOpnHuQdtk1cXAKhrs8l1dGZdhytqZ9ZgnfYBh9
         GvarVz0SJSm7cca4D8j6inIIoMCkYzG+eZ0SyWV3h6G9XK7Qcyj7G/LLcKHPFzTKpQJQ
         Wj8GeuMbcxbx1dx3A/XAkGxMmkFSHIG80yVNTDqA1i/X0iiUQAPM2UK3krc/9xgsCvkR
         oy7Q==
X-Gm-Message-State: AOAM531vsjCcNUEiQdkL2KZrLXm8Kj+0mRcw9Y/lqx3/rjxp9P/M8VN9
        s/wiKLzdXKdeM5MvKo11qsaRAg==
X-Google-Smtp-Source: ABdhPJzDlOC0c73ofKS9HsJmwMYeq4QQFi9oMxc4voraOETJBiStS3UUdAbSSnl/S7E+WUYJRiwC+g==
X-Received: by 2002:adf:8b5a:: with SMTP id v26mr6337057wra.138.1607695026266;
        Fri, 11 Dec 2020 05:57:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h16sm9075486wrq.29.2020.12.11.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 05:57:05 -0800 (PST)
Date:   Fri, 11 Dec 2020 14:57:03 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com,
        airlied@linux.ie, sumit.semwal@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v3 2/8] drm/ast: Only map cursor BOs during updates
Message-ID: <20201211135703.GR401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-3-tzimmermann@suse.de>
 <20201211101833.GQ401619@phenom.ffwll.local>
 <0c628bab-e4e0-170b-e695-abf3cde13c01@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c628bab-e4e0-170b-e695-abf3cde13c01@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 11, 2020 at 11:49:48AM +0100, Thomas Zimmermann wrote:
> 
> 
> Am 11.12.20 um 11:18 schrieb Daniel Vetter:
> > On Wed, Dec 09, 2020 at 03:25:21PM +0100, Thomas Zimmermann wrote:
> > > The HW cursor's BO used to be mapped permanently into the kernel's
> > > address space. GEM's vmap operation will be protected by locks, and
> > > we don't want to lock the BO's for an indefinate period of time.
> > > 
> > > Change the cursor code to map the HW BOs only during updates. The
> > > vmap operation in VRAM helpers is cheap, as a once estabished mapping
> > > is being reused until the BO actually moves. As the HW cursor BOs are
> > > permanently pinned, they never move at all.
> > > 
> > > v2:
> > > 	* fix typos in commit description
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Acked-by: Christian König <christian.koenig@amd.com>
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Now there's a pretty big issue here though: We can't take dma_resv_lock in
> > commit_tail, because of possible deadlocks on at least gpus that do real
> > async rendering because of the dma_fences. Unfortunately my annotations
> > patches got stuck a bit, I need to refresh them.
> > 
> > Rules are you can pin and unpin stuff in prepare/cleanup_plane, and also
> > take dma_resv_lock there, but not in commit_tail in-between. So I think
> > our vmap_local needs to loose the unconditional assert_locked and require
> > either that or a pin count.
> 
> I guess my commit description is misleading when it speaks of updates.
> ast_cursor_blit() is actually called from the cursor plane's prepare_fb
> function. [1] The vmap code in ast_cursor_show() could be moved into blit()
> as well, I think.

Oh I failed to check this properly. Even better.

> I guess the clean solution is to integrate the cursor code with the
> modesetting code in ast_mode. From there, locks and mappings can be
> established in prepare_fb and the HW state can be updated in atomic_commit.

Yup. I'll still refresh my series with lockdep annotations, keeps paranoid
me at peace :-)
-Daniel

> 
> Best regards
> Thomas
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/ast/ast_mode.c#n646
> 
> > -Daniel
> > 
> > > ---
> > >   drivers/gpu/drm/ast/ast_cursor.c | 51 ++++++++++++++++++--------------
> > >   drivers/gpu/drm/ast/ast_drv.h    |  2 --
> > >   2 files changed, 28 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> > > index 68bf3d33f1ed..fac1ee79c372 100644
> > > --- a/drivers/gpu/drm/ast/ast_cursor.c
> > > +++ b/drivers/gpu/drm/ast/ast_cursor.c
> > > @@ -39,7 +39,6 @@ static void ast_cursor_fini(struct ast_private *ast)
> > >   	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
> > >   		gbo = ast->cursor.gbo[i];
> > > -		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
> > >   		drm_gem_vram_unpin(gbo);
> > >   		drm_gem_vram_put(gbo);
> > >   	}
> > > @@ -53,14 +52,13 @@ static void ast_cursor_release(struct drm_device *dev, void *ptr)
> > >   }
> > >   /*
> > > - * Allocate cursor BOs and pins them at the end of VRAM.
> > > + * Allocate cursor BOs and pin them at the end of VRAM.
> > >    */
> > >   int ast_cursor_init(struct ast_private *ast)
> > >   {
> > >   	struct drm_device *dev = &ast->base;
> > >   	size_t size, i;
> > >   	struct drm_gem_vram_object *gbo;
> > > -	struct dma_buf_map map;
> > >   	int ret;
> > >   	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
> > > @@ -77,15 +75,7 @@ int ast_cursor_init(struct ast_private *ast)
> > >   			drm_gem_vram_put(gbo);
> > >   			goto err_drm_gem_vram_put;
> > >   		}
> > > -		ret = drm_gem_vram_vmap(gbo, &map);
> > > -		if (ret) {
> > > -			drm_gem_vram_unpin(gbo);
> > > -			drm_gem_vram_put(gbo);
> > > -			goto err_drm_gem_vram_put;
> > > -		}
> > > -
> > >   		ast->cursor.gbo[i] = gbo;
> > > -		ast->cursor.map[i] = map;
> > >   	}
> > >   	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
> > > @@ -94,7 +84,6 @@ int ast_cursor_init(struct ast_private *ast)
> > >   	while (i) {
> > >   		--i;
> > >   		gbo = ast->cursor.gbo[i];
> > > -		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
> > >   		drm_gem_vram_unpin(gbo);
> > >   		drm_gem_vram_put(gbo);
> > >   	}
> > > @@ -168,31 +157,38 @@ static void update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int h
> > >   int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
> > >   {
> > >   	struct drm_device *dev = &ast->base;
> > > -	struct drm_gem_vram_object *gbo;
> > > -	struct dma_buf_map map;
> > > -	int ret;
> > > -	void *src;
> > > +	struct drm_gem_vram_object *dst_gbo = ast->cursor.gbo[ast->cursor.next_index];
> > > +	struct drm_gem_vram_object *src_gbo = drm_gem_vram_of_gem(fb->obj[0]);
> > > +	struct dma_buf_map src_map, dst_map;
> > >   	void __iomem *dst;
> > > +	void *src;
> > > +	int ret;
> > >   	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
> > >   	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
> > >   		return -EINVAL;
> > > -	gbo = drm_gem_vram_of_gem(fb->obj[0]);
> > > -
> > > -	ret = drm_gem_vram_vmap(gbo, &map);
> > > +	ret = drm_gem_vram_vmap(src_gbo, &src_map);
> > >   	if (ret)
> > >   		return ret;
> > > -	src = map.vaddr; /* TODO: Use mapping abstraction properly */
> > > +	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
> > > -	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
> > > +	ret = drm_gem_vram_vmap(dst_gbo, &dst_map);
> > > +	if (ret)
> > > +		goto err_drm_gem_vram_vunmap;
> > > +	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
> > >   	/* do data transfer to cursor BO */
> > >   	update_cursor_image(dst, src, fb->width, fb->height);
> > > -	drm_gem_vram_vunmap(gbo, &map);
> > > +	drm_gem_vram_vunmap(dst_gbo, &dst_map);
> > > +	drm_gem_vram_vunmap(src_gbo, &src_map);
> > >   	return 0;
> > > +
> > > +err_drm_gem_vram_vunmap:
> > > +	drm_gem_vram_vunmap(src_gbo, &src_map);
> > > +	return ret;
> > >   }
> > >   static void ast_cursor_set_base(struct ast_private *ast, u64 address)
> > > @@ -243,17 +239,26 @@ static void ast_cursor_set_location(struct ast_private *ast, u16 x, u16 y,
> > >   void ast_cursor_show(struct ast_private *ast, int x, int y,
> > >   		     unsigned int offset_x, unsigned int offset_y)
> > >   {
> > > +	struct drm_device *dev = &ast->base;
> > > +	struct drm_gem_vram_object *gbo = ast->cursor.gbo[ast->cursor.next_index];
> > > +	struct dma_buf_map map;
> > >   	u8 x_offset, y_offset;
> > >   	u8 __iomem *dst;
> > >   	u8 __iomem *sig;
> > >   	u8 jreg;
> > > +	int ret;
> > > -	dst = ast->cursor.map[ast->cursor.next_index].vaddr;
> > > +	ret = drm_gem_vram_vmap(gbo, &map);
> > > +	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret))
> > > +		return;
> > > +	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
> > >   	sig = dst + AST_HWC_SIZE;
> > >   	writel(x, sig + AST_HWC_SIGNATURE_X);
> > >   	writel(y, sig + AST_HWC_SIGNATURE_Y);
> > > +	drm_gem_vram_vunmap(gbo, &map);
> > > +
> > >   	if (x < 0) {
> > >   		x_offset = (-x) + offset_x;
> > >   		x = 0;
> > > diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> > > index ccaff81924ee..f871fc36c2f7 100644
> > > --- a/drivers/gpu/drm/ast/ast_drv.h
> > > +++ b/drivers/gpu/drm/ast/ast_drv.h
> > > @@ -28,7 +28,6 @@
> > >   #ifndef __AST_DRV_H__
> > >   #define __AST_DRV_H__
> > > -#include <linux/dma-buf-map.h>
> > >   #include <linux/i2c.h>
> > >   #include <linux/i2c-algo-bit.h>
> > >   #include <linux/io.h>
> > > @@ -133,7 +132,6 @@ struct ast_private {
> > >   	struct {
> > >   		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
> > > -		struct dma_buf_map map[AST_DEFAULT_HWC_NUM];
> > >   		unsigned int next_index;
> > >   	} cursor;
> > > -- 
> > > 2.29.2
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
