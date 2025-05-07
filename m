Return-Path: <linux-media+bounces-31971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76236AADFCC
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 14:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACE693AB64F
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 12:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C952820A8;
	Wed,  7 May 2025 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMfaLJUD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCA02135D0;
	Wed,  7 May 2025 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622392; cv=none; b=RjtikHjS0FJ3TEU5Ljm0Yl/mHoDdi87aJPsaL5vWZT6RJtOF+2GiI1kOZGIe+KaW3JZ4GP8agtGCHOaKPuVHu544S43xCIv1jY19x0YtehYE+R0HUYOMY1PdCFIIift5zZwuIzTFKJdcTIlHIDQfhxEcIDl7wZkxUbKyfxRrFlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622392; c=relaxed/simple;
	bh=im10zCPO48DJVksV0r0nTYWoHjvZi8pKqsbOdSPnI58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsagYlldHKIYPpqMbj5ddVBjWbUsD72etxWuKomaYDLfCa1IvytBeuzhsENcugcWN3x8JLnc2eU2oxAKvRIMQM2Yp6RMTO80r+TFV9r0327PAONdojcMFl0HmpW2n69PeL7UeJNdt8oEzpaTt458AsDak063RGEW1JpXqjxU2ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMfaLJUD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1640C4CEE7;
	Wed,  7 May 2025 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746622391;
	bh=im10zCPO48DJVksV0r0nTYWoHjvZi8pKqsbOdSPnI58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMfaLJUD9Ygyo0cTN4iwPP+0E+c5nPnoxz1KeP/YcUUFrLae7FrribbCy0tCLU/KG
	 /8wfJceYEZ9Vp9S4Er0xYCyYGWirlcpNAmsa4vxh5/CESwZCrat3ritG7fLzoefLy5
	 AGVFS+rtCtaPxt1OPZMjl7PyEVUFNR9g+NLvdgiuuQ9du+UStu9guAKi7HknZHWBsM
	 XGV3jwrcOoMa2uO2vkjx/KGcbCLQk1obRfRBmTRk4lxPTQGh2M1jKNrEqDx313R4MA
	 qjNMIfQaBoNdNwTmrLF9JM94fwr93ky3ZnTroaMnYXAyJb7SH+ZZ0Jnu82MVKcaWO/
	 XA9geYEFtG8AQ==
Date: Wed, 7 May 2025 18:23:01 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Subject: Re: [PATCH v8 07/14] tee: refactor params_from_user()
Message-ID: <aBtXrbZ6DByMl6b4@sumit-X1>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-8-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502100049.1746335-8-jens.wiklander@linaro.org>

On Fri, May 02, 2025 at 11:59:21AM +0200, Jens Wiklander wrote:
> Break out the memref handling into a separate helper function.
> No change in behavior.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
>  1 file changed, 54 insertions(+), 40 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 685afcaa3ea1..820e394b9054 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -353,6 +353,55 @@ tee_ioctl_shm_register(struct tee_context *ctx,
>  	return ret;
>  }
>  
> +static int param_from_user_memref(struct tee_context *ctx,
> +				  struct tee_param_memref *memref,
> +				  struct tee_ioctl_param *ip)
> +{
> +	struct tee_shm *shm;
> +
> +	/*
> +	 * If a NULL pointer is passed to a TA in the TEE,
> +	 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
> +	 * indicating a NULL memory reference.
> +	 */
> +	if (ip->c != TEE_MEMREF_NULL) {
> +		/*
> +		 * If we fail to get a pointer to a shared
> +		 * memory object (and increase the ref count)
> +		 * from an identifier we return an error. All
> +		 * pointers that has been added in params have
> +		 * an increased ref count. It's the callers
> +		 * responibility to do tee_shm_put() on all
> +		 * resolved pointers.
> +		 */
> +		shm = tee_shm_get_from_id(ctx, ip->c);
> +		if (IS_ERR(shm))
> +			return PTR_ERR(shm);
> +
> +		/*
> +		 * Ensure offset + size does not overflow
> +		 * offset and does not overflow the size of
> +		 * the referred shared memory object.
> +		 */
> +		if ((ip->a + ip->b) < ip->a ||
> +		    (ip->a + ip->b) > shm->size) {
> +			tee_shm_put(shm);
> +			return -EINVAL;
> +		}
> +	} else if (ctx->cap_memref_null) {
> +		/* Pass NULL pointer to OP-TEE */
> +		shm = NULL;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	memref->shm_offs = ip->a;
> +	memref->size = ip->b;
> +	memref->shm = shm;
> +
> +	return 0;
> +}
> +
>  static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  			    size_t num_params,
>  			    struct tee_ioctl_param __user *uparams)
> @@ -360,8 +409,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  	size_t n;
>  
>  	for (n = 0; n < num_params; n++) {
> -		struct tee_shm *shm;
>  		struct tee_ioctl_param ip;
> +		int rc;
>  
>  		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
>  			return -EFAULT;
> @@ -384,45 +433,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> -			/*
> -			 * If a NULL pointer is passed to a TA in the TEE,
> -			 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
> -			 * indicating a NULL memory reference.
> -			 */
> -			if (ip.c != TEE_MEMREF_NULL) {
> -				/*
> -				 * If we fail to get a pointer to a shared
> -				 * memory object (and increase the ref count)
> -				 * from an identifier we return an error. All
> -				 * pointers that has been added in params have
> -				 * an increased ref count. It's the callers
> -				 * responibility to do tee_shm_put() on all
> -				 * resolved pointers.
> -				 */
> -				shm = tee_shm_get_from_id(ctx, ip.c);
> -				if (IS_ERR(shm))
> -					return PTR_ERR(shm);
> -
> -				/*
> -				 * Ensure offset + size does not overflow
> -				 * offset and does not overflow the size of
> -				 * the referred shared memory object.
> -				 */
> -				if ((ip.a + ip.b) < ip.a ||
> -				    (ip.a + ip.b) > shm->size) {
> -					tee_shm_put(shm);
> -					return -EINVAL;
> -				}
> -			} else if (ctx->cap_memref_null) {
> -				/* Pass NULL pointer to OP-TEE */
> -				shm = NULL;
> -			} else {
> -				return -EINVAL;
> -			}
> -
> -			params[n].u.memref.shm_offs = ip.a;
> -			params[n].u.memref.size = ip.b;
> -			params[n].u.memref.shm = shm;
> +			rc = param_from_user_memref(ctx, &params[n].u.memref,
> +						    &ip);
> +			if (rc)
> +				return rc;
>  			break;
>  		default:
>  			/* Unknown attribute */
> -- 
> 2.43.0
> 

