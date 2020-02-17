Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7CC1616A0
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgBQPuv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:50:51 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50411 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgBQPuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:50:51 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so17616703wmb.0
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 07:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=8tneq4cKbjw4M83AJwCzWJYkK4pRVK0YqY3+dncAXxs=;
        b=O8nnSjFFOfg9TDDv75n+TRaozOhKMAGlMQAlD6FL9yCvveUpvGEdQOGxiubspCM8IF
         IQoV3kEVYMI7AF1RMEc7lg8gISNeRkcOBYrr+1ZEdtrhEKYiswCHr5RQjqqRqPf4fdOk
         AkGhbjgH5Rvdrdjcl9o4jxH38rYpUOy/su4HxGaZPHLx5zYk+bOK0/dZ7mD+JMLwD6sM
         GnOB+uv39dhURTnFpb0wfUKdEe9E4JYJ+7FUq44xr0jxf89wUxCA96fEvlifst7Ga8p4
         gcVPAg9KcxaKSq+woxdIDJthFf3ZfijOVwvKwODzmOW9xTZBaEP4DhMtc6waKpBh26Iz
         rNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8tneq4cKbjw4M83AJwCzWJYkK4pRVK0YqY3+dncAXxs=;
        b=jc+g/14xxLcoq9eAdttwE+Ls8JkGCsUFW+mc3bNQMxm03i/aPdEH8GjiNe+hIzC4YL
         WnNxPusPvjYKtct97YS74wZEXI/pEja4eFsHQKVENpsvv6TUn2Jq2XXFPAtZBWg4pGIZ
         kOHwoDzJFlVic+cJC0qT62B4sJXxCshDtvtyCz7ZXs7KAIJxJ6gZLOkYa1d5VnvISF1p
         Z/TzX1+wnFTaS8y8YY5V/TKRT0G1apI39X+NbHbbt9bZwSVgg3Ce9A5cozG215WYP4Rx
         MarvwF59gqQjdg6D/YAAHMm9dj0THk3mKSXRkdj7CBnWh/dJEpKHS4EC9j2lOyCbtR+T
         VMmw==
X-Gm-Message-State: APjAAAXaUF7iTo8fnHvSu/33+AuOdLf3QeCmZ0lujW48Zs01kr7hXSJ4
        wtZkHpAiHojau0VLFjwuYjY=
X-Google-Smtp-Source: APXvYqwNYycOlUJv0kl7d2GX2UlFNnOZRsZZkNY7zGyo0zomzTUmnzI+DODj1bpZSCbJYu5kgKHsMA==
X-Received: by 2002:a7b:ce18:: with SMTP id m24mr22875924wmc.123.1581954649217;
        Mon, 17 Feb 2020 07:50:49 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id v14sm1572364wrm.28.2020.02.17.07.50.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 07:50:48 -0800 (PST)
Subject: Re: [PATCH 1/5] dma-buf: add dynamic DMA-buf handling v14
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
References: <20200217154509.2265-1-christian.koenig@amd.com>
 <20200217154509.2265-2-christian.koenig@amd.com>
Message-ID: <88966f5e-2852-24c1-994e-fa8a1cfb9a3c@gmail.com>
Date:   Mon, 17 Feb 2020 16:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217154509.2265-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please ignore this one, I've send out the wrong version without Daniels 
latest comment nit picks fixed.

The interesting one in this series is the last patch.

Regards,
Christian.

Am 17.02.20 um 16:45 schrieb Christian König:
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
>      lock the reservation obj while using the attachments,
>      add helper to set the callback
> v3: move flag for invalidation support into the DMA-buf,
>      use new attach_info structure to set the callback
> v4: use importer_priv field instead of mangling exporter priv.
> v5: drop invalidation_supported flag
> v6: squash together with pin/unpin changes
> v7: pin/unpin takes an attachment now
> v8: nuke dma_buf_attachment_(map|unmap)_locked,
>      everything is now handled backward compatible
> v9: always cache when export/importer don't agree on dynamic handling
> v10: minimal style cleanup
> v11: drop automatically re-entry avoidance
> v12: rename callback to move_notify
> v13: add might_lock in appropriate places
> v14: rebase on separated locking change
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-buf.c                   | 106 ++++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |   6 +-
>   include/linux/dma-buf.h                     |  78 ++++++++++++--
>   3 files changed, 170 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d377b4ca66bf..ce293cee76ed 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -529,6 +529,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   		    exp_info->ops->dynamic_mapping))
>   		return ERR_PTR(-EINVAL);
>   
> +	if (WARN_ON(!exp_info->ops->dynamic_mapping &&
> +		    (exp_info->ops->pin || exp_info->ops->unpin)))
> +		return ERR_PTR(-EINVAL);
> +
>   	if (!try_module_get(exp_info->owner))
>   		return ERR_PTR(-ENOENT);
>   
> @@ -653,7 +657,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>    * calls attach() of dma_buf_ops to allow device-specific attach functionality
>    * @dmabuf:		[in]	buffer to attach device to.
>    * @dev:		[in]	device to be attached.
> - * @dynamic_mapping:	[in]	calling convention for map/unmap
> + * @importer_ops	[in]	importer operations for the attachment
> + * @importer_priv	[in]	importer private pointer for the attachment
>    *
>    * Returns struct dma_buf_attachment pointer for this attachment. Attachments
>    * must be cleaned up by calling dma_buf_detach().
> @@ -669,7 +674,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>    */
>   struct dma_buf_attachment *
>   dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> -		       bool dynamic_mapping)
> +		       const struct dma_buf_attach_ops *importer_ops,
> +		       void *importer_priv)
>   {
>   	struct dma_buf_attachment *attach;
>   	int ret;
> @@ -683,7 +689,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   
>   	attach->dev = dev;
>   	attach->dmabuf = dmabuf;
> -	attach->dynamic_mapping = dynamic_mapping;
> +	attach->importer_ops = importer_ops;
> +	attach->importer_priv = importer_priv;
>   
>   	if (dmabuf->ops->attach) {
>   		ret = dmabuf->ops->attach(dmabuf, attach);
> @@ -702,15 +709,19 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	    dma_buf_is_dynamic(dmabuf)) {
>   		struct sg_table *sgt;
>   
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> +		if (dma_buf_is_dynamic(attach->dmabuf)) {
>   			dma_resv_lock(attach->dmabuf->resv, NULL);
> +			ret = dma_buf_pin(attach);
> +			if (ret)
> +				goto err_unlock;
> +		}
>   
>   		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
>   		if (!sgt)
>   			sgt = ERR_PTR(-ENOMEM);
>   		if (IS_ERR(sgt)) {
>   			ret = PTR_ERR(sgt);
> -			goto err_unlock;
> +			goto err_unpin;
>   		}
>   		if (dma_buf_is_dynamic(attach->dmabuf))
>   			dma_resv_unlock(attach->dmabuf->resv);
> @@ -724,6 +735,10 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	kfree(attach);
>   	return ERR_PTR(ret);
>   
> +err_unpin:
> +	if (dma_buf_is_dynamic(attach->dmabuf))
> +		dma_buf_unpin(attach);
> +
>   err_unlock:
>   	if (dma_buf_is_dynamic(attach->dmabuf))
>   		dma_resv_unlock(attach->dmabuf->resv);
> @@ -744,7 +759,7 @@ EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);
>   struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>   					  struct device *dev)
>   {
> -	return dma_buf_dynamic_attach(dmabuf, dev, false);
> +	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_attach);
>   
> @@ -767,8 +782,10 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   
>   		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
>   
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> +		if (dma_buf_is_dynamic(attach->dmabuf)) {
> +			dma_buf_unpin(attach);
>   			dma_resv_unlock(attach->dmabuf->resv);
> +		}
>   	}
>   
>   	dma_resv_lock(dmabuf->resv, NULL);
> @@ -781,6 +798,44 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_detach);
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
>   /**
>    * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
>    * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
> @@ -800,6 +855,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   					enum dma_data_direction direction)
>   {
>   	struct sg_table *sg_table;
> +	int r;
>   
>   	might_sleep();
>   
> @@ -821,13 +877,23 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   		return attach->sgt;
>   	}
>   
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> +	if (dma_buf_is_dynamic(attach->dmabuf)) {
>   		dma_resv_assert_held(attach->dmabuf->resv);
> +		if (!attach->importer_ops->move_notify) {
> +			r = dma_buf_pin(attach);
> +			if (r)
> +				return ERR_PTR(r);
> +		}
> +	}
>   
>   	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>   	if (!sg_table)
>   		sg_table = ERR_PTR(-ENOMEM);
>   
> +	if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
> +	    !attach->importer_ops->move_notify)
> +		dma_buf_unpin(attach);
> +
>   	if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
>   		attach->sgt = sg_table;
>   		attach->dir = direction;
> @@ -866,9 +932,33 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   		dma_resv_assert_held(attach->dmabuf->resv);
>   
>   	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> +
> +	if (dma_buf_is_dynamic(attach->dmabuf) &&
> +	    !attach->importer_ops->move_notify)
> +		dma_buf_unpin(attach);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
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
>   /**
>    * DOC: cpu access
>    *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index e2eec7b66334..b2ca78b6abce 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -414,6 +414,9 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>   	return ERR_PTR(ret);
>   }
>   
> +static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
> +};
> +
>   /**
>    * amdgpu_gem_prime_import - &drm_driver.gem_prime_import implementation
>    * @dev: DRM device
> @@ -446,7 +449,8 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>   	if (IS_ERR(obj))
>   		return obj;
>   
> -	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, true);
> +	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
> +					&amdgpu_dma_buf_attach_ops, NULL);
>   	if (IS_ERR(attach)) {
>   		drm_gem_object_put(obj);
>   		return ERR_CAST(attach);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index af73f835c51c..7456bb937635 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -93,14 +93,40 @@ struct dma_buf_ops {
>   	 */
>   	void (*detach)(struct dma_buf *, struct dma_buf_attachment *);
>   
> +	/**
> +	 * @pin:
> +	 *
> +	 * This is called by dma_buf_pin and lets the exporter know that the
> +	 * DMA-buf can't be moved any more.
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
>   	/**
>   	 * @map_dma_buf:
>   	 *
>   	 * This is called by dma_buf_map_attachment() and is used to map a
>   	 * shared &dma_buf into device address space, and it is mandatory. It
> -	 * can only be called if @attach has been called successfully. This
> -	 * essentially pins the DMA buffer into place, and it cannot be moved
> -	 * any more
> +	 * can only be called if @attach has been called successfully.
>   	 *
>   	 * This call may sleep, e.g. when the backing storage first needs to be
>   	 * allocated, or moved to a location suitable for all currently attached
> @@ -141,9 +167,6 @@ struct dma_buf_ops {
>   	 *
>   	 * This is called by dma_buf_unmap_attachment() and should unmap and
>   	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
> -	 * It should also unpin the backing storage if this is the last mapping
> -	 * of the DMA buffer, it the exporter supports backing storage
> -	 * migration.
>   	 */
>   	void (*unmap_dma_buf)(struct dma_buf_attachment *,
>   			      struct sg_table *,
> @@ -336,6 +359,34 @@ struct dma_buf {
>   	} cb_excl, cb_shared;
>   };
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
>   /**
>    * struct dma_buf_attachment - holds device-buffer attachment data
>    * @dmabuf: buffer for this attachment.
> @@ -344,8 +395,9 @@ struct dma_buf {
>    * @sgt: cached mapping.
>    * @dir: direction of cached mapping.
>    * @priv: exporter specific attachment data.
> - * @dynamic_mapping: true if dma_buf_map/unmap_attachment() is called with the
> - * dma_resv lock held.
> + * @importer_ops: importer operations for this attachment, if provided
> + * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
> + * @importer_priv: importer specific attachment data.
>    *
>    * This structure holds the attachment information between the dma_buf buffer
>    * and its user device(s). The list contains one attachment struct per device
> @@ -362,7 +414,8 @@ struct dma_buf_attachment {
>   	struct list_head node;
>   	struct sg_table *sgt;
>   	enum dma_data_direction dir;
> -	bool dynamic_mapping;
> +	const struct dma_buf_attach_ops *importer_ops;
> +	void *importer_priv;
>   	void *priv;
>   };
>   
> @@ -438,16 +491,19 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>   static inline bool
>   dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>   {
> -	return attach->dynamic_mapping;
> +	return !!attach->importer_ops;
>   }
>   
>   struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>   					  struct device *dev);
>   struct dma_buf_attachment *
>   dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> -		       bool dynamic_mapping);
> +		       const struct dma_buf_attach_ops *importer_ops,
> +		       void *importer_priv);
>   void dma_buf_detach(struct dma_buf *dmabuf,
>   		    struct dma_buf_attachment *attach);
> +int dma_buf_pin(struct dma_buf_attachment *attach);
> +void dma_buf_unpin(struct dma_buf_attachment *attach);
>   
>   struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
>   

