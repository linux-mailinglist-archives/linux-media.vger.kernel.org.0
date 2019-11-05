Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 523AEEFADA
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 11:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388365AbfKEKUw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 05:20:52 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40267 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbfKEKUw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 05:20:52 -0500
Received: by mail-wm1-f66.google.com with SMTP id f3so8348618wmc.5
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2019 02:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=KAoSWrCtJnVcpstcf4OAoLsbVOrNLD5KlvPrGo8r4jM=;
        b=JuI5XtOHY7LoQsFTk4jDywK1uRw9ELtW9NVKlljlL0uip+bxZ3EmWUqCZ/qItEwHon
         TqMW1TLORQUJ2llAwjXH1IA5k/wQlvhuQAm0X2SdDnGZsiVEvybqQC9iyaV5C+CSaolV
         rdZ9nnPbxreo7pK+h06nzBIoQ+bW6SDsQsNEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=KAoSWrCtJnVcpstcf4OAoLsbVOrNLD5KlvPrGo8r4jM=;
        b=CAi+AKiVy83iENJrAyuskkXEUOlGsLwE7wl5gYaF8BNMPdZVf99yIHdtQKQ6o3kh5O
         OCc07BlstIBGt0hpttlik9N68v8uwwIQpbL+w3xDRr1TMlGbZmC6jm/HU/lVw3Bqy5Kz
         Lr1vk1ct/UUv6PMMQLuAbt6L6b4UKldlFmaAHpwx6TXLGhJIubrlrXcA9Q3sPFQeNf40
         zvBstS4xZYUe/k1tgU82m2n7WBb6TYLGfFPqjHJpG5gA0r57/qEiCXC8AVGf+XxWrHf9
         Gp+O6dOuvsmjjO721ccKItviQXipHUADSEtJ6UOl/SS+xGEe8B0DSLVygC3WI9il3iX7
         ZHKA==
X-Gm-Message-State: APjAAAXscohlnnaF0xsC/4SnxOpKeRXnR62ZJFds4izDXgjgDkiNqyYI
        J9t2KgZWysDErUwmdXVl1j6Ok39qSqY=
X-Google-Smtp-Source: APXvYqzh+bZx0x2hJ6H+2IUfINTGiZ1oaO9YVHm71WlEh7IuXsiNNUiGVu3CyaQNHQlVPhBeRqLCZQ==
X-Received: by 2002:a1c:3d08:: with SMTP id k8mr3222367wma.119.1572949247668;
        Tue, 05 Nov 2019 02:20:47 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id b186sm18453928wmb.21.2019.11.05.02.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:20:46 -0800 (PST)
Date:   Tue, 5 Nov 2019 11:20:45 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/5] dma-buf: add dynamic DMA-buf handling v14
Message-ID: <20191105102045.GC10326@phenom.ffwll.local>
References: <20191029104049.9011-1-christian.koenig@amd.com>
 <20191029104049.9011-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029104049.9011-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 29, 2019 at 11:40:45AM +0100, Christian K�nig wrote:
> On the exporter side we add optional explicit pinning callbacks. Which are
> called when the importer doesn't implement dynamic handling, move notification
> or need the DMA-buf locked in place for its use case.
> 
> On the importer side we add an optional move_notify callback. This callback is
> used by the exporter to inform the importers that their mappings should be
> destroyed as soon as possible.
> 
> This allows the exporter to provide the mappings without the need to pin
> the backing store.
> 
> v2: don't try to invalidate mappings when the callback is NULL,
>     lock the reservation obj while using the attachments,
>     add helper to set the callback
> v3: move flag for invalidation support into the DMA-buf,
>     use new attach_info structure to set the callback
> v4: use importer_priv field instead of mangling exporter priv.
> v5: drop invalidation_supported flag
> v6: squash together with pin/unpin changes
> v7: pin/unpin takes an attachment now
> v8: nuke dma_buf_attachment_(map|unmap)_locked,
>     everything is now handled backward compatible
> v9: always cache when export/importer don't agree on dynamic handling
> v10: minimal style cleanup
> v11: drop automatically re-entry avoidance
> v12: rename callback to move_notify
> v13: add might_lock in appropriate places
> v14: rebase on separated locking change
> 
> Signed-off-by: Christian K�nig <christian.koenig@amd.com>

Bunch of nitpicks/safety check comments here, I'll post the big question
stuff on the cover letter.

> ---
>  drivers/dma-buf/dma-buf.c                   | 106 ++++++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |   6 +-
>  include/linux/dma-buf.h                     |  78 ++++++++++++--
>  3 files changed, 170 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d377b4ca66bf..ce293cee76ed 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -529,6 +529,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  		    exp_info->ops->dynamic_mapping))
>  		return ERR_PTR(-EINVAL);
>  
> +	if (WARN_ON(!exp_info->ops->dynamic_mapping &&
> +		    (exp_info->ops->pin || exp_info->ops->unpin)))
> +		return ERR_PTR(-EINVAL);

Imo make this stronger, have a dynamic mapping iff there's both a pin and
unpin function. Otherwise this doesn't make a lot of sense to me.

> +
>  	if (!try_module_get(exp_info->owner))
>  		return ERR_PTR(-ENOENT);
>  
> @@ -653,7 +657,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>   * calls attach() of dma_buf_ops to allow device-specific attach functionality
>   * @dmabuf:		[in]	buffer to attach device to.
>   * @dev:		[in]	device to be attached.
> - * @dynamic_mapping:	[in]	calling convention for map/unmap
> + * @importer_ops	[in]	importer operations for the attachment
> + * @importer_priv	[in]	importer private pointer for the attachment
>   *
>   * Returns struct dma_buf_attachment pointer for this attachment. Attachments
>   * must be cleaned up by calling dma_buf_detach().
> @@ -669,7 +674,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>   */
>  struct dma_buf_attachment *
>  dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> -		       bool dynamic_mapping)
> +		       const struct dma_buf_attach_ops *importer_ops,
> +		       void *importer_priv)
>  {
>  	struct dma_buf_attachment *attach;
>  	int ret;
> @@ -683,7 +689,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  
>  	attach->dev = dev;
>  	attach->dmabuf = dmabuf;
> -	attach->dynamic_mapping = dynamic_mapping;
> +	attach->importer_ops = importer_ops;
> +	attach->importer_priv = importer_priv;
>  
>  	if (dmabuf->ops->attach) {
>  		ret = dmabuf->ops->attach(dmabuf, attach);
> @@ -702,15 +709,19 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	    dma_buf_is_dynamic(dmabuf)) {
>  		struct sg_table *sgt;
>  
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> +		if (dma_buf_is_dynamic(attach->dmabuf)) {
>  			dma_resv_lock(attach->dmabuf->resv, NULL);
> +			ret = dma_buf_pin(attach);
> +			if (ret)
> +				goto err_unlock;
> +		}
>  
>  		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
>  		if (!sgt)
>  			sgt = ERR_PTR(-ENOMEM);
>  		if (IS_ERR(sgt)) {
>  			ret = PTR_ERR(sgt);
> -			goto err_unlock;
> +			goto err_unpin;
>  		}
>  		if (dma_buf_is_dynamic(attach->dmabuf))
>  			dma_resv_unlock(attach->dmabuf->resv);
> @@ -724,6 +735,10 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	kfree(attach);
>  	return ERR_PTR(ret);
>  
> +err_unpin:
> +	if (dma_buf_is_dynamic(attach->dmabuf))
> +		dma_buf_unpin(attach);
> +
>  err_unlock:
>  	if (dma_buf_is_dynamic(attach->dmabuf))
>  		dma_resv_unlock(attach->dmabuf->resv);
> @@ -744,7 +759,7 @@ EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev)
>  {
> -	return dma_buf_dynamic_attach(dmabuf, dev, false);
> +	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_attach);
>  
> @@ -767,8 +782,10 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  
>  		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
>  
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> +		if (dma_buf_is_dynamic(attach->dmabuf)) {
> +			dma_buf_unpin(attach);
>  			dma_resv_unlock(attach->dmabuf->resv);
> +		}
>  	}
>  
>  	dma_resv_lock(dmabuf->resv, NULL);
> @@ -781,6 +798,44 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_detach);
>  
> +/**
> + * dma_buf_pin - Lock down the DMA-buf
> + *
> + * @attach:	[in]	attachment which should be pinned
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int dma_buf_pin(struct dma_buf_attachment *attach)
> +{
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +	int ret = 0;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	if (dmabuf->ops->pin)
> +		ret = dmabuf->ops->pin(attach);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_pin);
> +
> +/**
> + * dma_buf_unpin - Remove lock from DMA-buf
> + *
> + * @attach:	[in]	attachment which should be unpinned
> + */
> +void dma_buf_unpin(struct dma_buf_attachment *attach)
> +{
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	if (dmabuf->ops->unpin)
> +		dmabuf->ops->unpin(attach);
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_unpin);
> +
>  /**
>   * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
>   * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
> @@ -800,6 +855,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  					enum dma_data_direction direction)
>  {
>  	struct sg_table *sg_table;
> +	int r;
>  
>  	might_sleep();
>  
> @@ -821,13 +877,23 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  		return attach->sgt;
>  	}
>  
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> +	if (dma_buf_is_dynamic(attach->dmabuf)) {
>  		dma_resv_assert_held(attach->dmabuf->resv);
> +		if (!attach->importer_ops->move_notify) {

Imo just require ->move_notify for importers that give you an ops
function. Doesn't really make sense to allow dynamic without support
->move_notify.

> +			r = dma_buf_pin(attach);
> +			if (r)
> +				return ERR_PTR(r);
> +		}
> +	}
>  
>  	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>  	if (!sg_table)
>  		sg_table = ERR_PTR(-ENOMEM);
>  
> +	if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
> +	    !attach->importer_ops->move_notify)
> +		dma_buf_unpin(attach);
> +
>  	if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
>  		attach->sgt = sg_table;
>  		attach->dir = direction;
> @@ -866,9 +932,33 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>  		dma_resv_assert_held(attach->dmabuf->resv);
>  
>  	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> +
> +	if (dma_buf_is_dynamic(attach->dmabuf) &&
> +	    !attach->importer_ops->move_notify)
> +		dma_buf_unpin(attach);
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
>  
> +/**
> + * dma_buf_move_notify - notify attachments that DMA-buf is moving
> + *
> + * @dmabuf:	[in]	buffer which is moving
> + *
> + * Informs all attachmenst that they need to destroy and recreated all their
> + * mappings.
> + */
> +void dma_buf_move_notify(struct dma_buf *dmabuf)
> +{
> +	struct dma_buf_attachment *attach;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	list_for_each_entry(attach, &dmabuf->attachments, node)
> +		if (attach->importer_ops && attach->importer_ops->move_notify)
> +			attach->importer_ops->move_notify(attach);
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_move_notify);
> +
>  /**
>   * DOC: cpu access
>   *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index d5bcdfefbad6..8e5a68107556 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -415,6 +415,9 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>  	return ERR_PTR(ret);
>  }
>  
> +static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
> +};
> +
>  /**
>   * amdgpu_gem_prime_import - &drm_driver.gem_prime_import implementation
>   * @dev: DRM device
> @@ -447,7 +450,8 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>  	if (IS_ERR(obj))
>  		return obj;
>  
> -	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, true);
> +	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
> +					&amdgpu_dma_buf_attach_ops, NULL);
>  	if (IS_ERR(attach)) {
>  		drm_gem_object_put(obj);
>  		return ERR_CAST(attach);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index af73f835c51c..7456bb937635 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -93,14 +93,40 @@ struct dma_buf_ops {
>  	 */
>  	void (*detach)(struct dma_buf *, struct dma_buf_attachment *);
>  
> +	/**
> +	 * @pin:
> +	 *
> +	 * This is called by dma_buf_pin and lets the exporter know that the
> +	 * DMA-buf can't be moved any more.

I think we should add a warning here that pinning is only ok for limited
use-cases (like scanout or similar), and not as part of general buffer
management.

i915 uses temporary pins through it's execbuf management (and everywhere
else), so we have a _lot_ of people in dri-devel with quite different
ideas of what this might be for :-)

> +	 *
> +	 * This is called with the dmabuf->resv object locked.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success, negative error code on failure.
> +	 */
> +	int (*pin)(struct dma_buf_attachment *attach);
> +
> +	/**
> +	 * @unpin:
> +	 *
> +	 * This is called by dma_buf_unpin and lets the exporter know that the
> +	 * DMA-buf can be moved again.
> +	 *
> +	 * This is called with the dmabuf->resv object locked.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*unpin)(struct dma_buf_attachment *attach);
> +
>  	/**
>  	 * @map_dma_buf:
>  	 *
>  	 * This is called by dma_buf_map_attachment() and is used to map a
>  	 * shared &dma_buf into device address space, and it is mandatory. It
> -	 * can only be called if @attach has been called successfully. This
> -	 * essentially pins the DMA buffer into place, and it cannot be moved
> -	 * any more
> +	 * can only be called if @attach has been called successfully.
>  	 *
>  	 * This call may sleep, e.g. when the backing storage first needs to be
>  	 * allocated, or moved to a location suitable for all currently attached
> @@ -141,9 +167,6 @@ struct dma_buf_ops {
>  	 *
>  	 * This is called by dma_buf_unmap_attachment() and should unmap and
>  	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
> -	 * It should also unpin the backing storage if this is the last mapping
> -	 * of the DMA buffer, it the exporter supports backing storage
> -	 * migration.

This is still valid for non-dynamic exporters. Imo keep but clarify that.

>  	 */
>  	void (*unmap_dma_buf)(struct dma_buf_attachment *,
>  			      struct sg_table *,
> @@ -336,6 +359,34 @@ struct dma_buf {
>  	} cb_excl, cb_shared;
>  };
>  
> +/**
> + * struct dma_buf_attach_ops - importer operations for an attachment
> + * @move_notify: [optional] notification that the DMA-buf is moving
> + *
> + * Attachment operations implemented by the importer.
> + */
> +struct dma_buf_attach_ops {
> +	/**
> +	 * @move_notify
> +	 *
> +	 * If this callback is provided the framework can avoid pinning the
> +	 * backing store while mappings exists.
> +	 *
> +	 * This callback is called with the lock of the reservation object
> +	 * associated with the dma_buf held and the mapping function must be
> +	 * called with this lock held as well. This makes sure that no mapping
> +	 * is created concurrently with an ongoing move operation.
> +	 *
> +	 * Mappings stay valid and are not directly affected by this callback.
> +	 * But the DMA-buf can now be in a different physical location, so all
> +	 * mappings should be destroyed and re-created as soon as possible.
> +	 *
> +	 * New mappings can be created after this callback returns, and will
> +	 * point to the new location of the DMA-buf.
> +	 */
> +	void (*move_notify)(struct dma_buf_attachment *attach);
> +};
> +
>  /**
>   * struct dma_buf_attachment - holds device-buffer attachment data
>   * @dmabuf: buffer for this attachment.
> @@ -344,8 +395,9 @@ struct dma_buf {
>   * @sgt: cached mapping.
>   * @dir: direction of cached mapping.
>   * @priv: exporter specific attachment data.
> - * @dynamic_mapping: true if dma_buf_map/unmap_attachment() is called with the
> - * dma_resv lock held.
> + * @importer_ops: importer operations for this attachment, if provided
> + * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
> + * @importer_priv: importer specific attachment data.
>   *
>   * This structure holds the attachment information between the dma_buf buffer
>   * and its user device(s). The list contains one attachment struct per device
> @@ -362,7 +414,8 @@ struct dma_buf_attachment {
>  	struct list_head node;
>  	struct sg_table *sgt;
>  	enum dma_data_direction dir;
> -	bool dynamic_mapping;
> +	const struct dma_buf_attach_ops *importer_ops;
> +	void *importer_priv;
>  	void *priv;
>  };
>  
> @@ -438,16 +491,19 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>  static inline bool
>  dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>  {
> -	return attach->dynamic_mapping;
> +	return !!attach->importer_ops;

Hm why not do the same for exporters, and make them dynamic iff they have
pin/unpin?
-Daniel

>  }
>  
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev);
>  struct dma_buf_attachment *
>  dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> -		       bool dynamic_mapping);
> +		       const struct dma_buf_attach_ops *importer_ops,
> +		       void *importer_priv);
>  void dma_buf_detach(struct dma_buf *dmabuf,
>  		    struct dma_buf_attachment *attach);
> +int dma_buf_pin(struct dma_buf_attachment *attach);
> +void dma_buf_unpin(struct dma_buf_attachment *attach);
>  
>  struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
