Return-Path: <linux-media+bounces-27930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDB8A58EB9
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 09:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C334A16C55A
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D76B2248A8;
	Mon, 10 Mar 2025 08:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZJ4VUDA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D8380;
	Mon, 10 Mar 2025 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597054; cv=none; b=e2iVDcowNpFzPkCYFsMNui8ualYU0lWV0UauXmOq9WzX6x9QZ+4ip3up0Hffn/vgSS6upgiyRgJe0Q0GoBe8uvdcWMLpQ7MgCtm+va2RdwNALWVtLphDkXQajN0bw9JTNOozLm+lhX1PBSAB5CwLFNpqIWQVKHd5ZBghm3QGA4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597054; c=relaxed/simple;
	bh=z3HdFE82Z/4RXvpeoyqLFCEFSfIoebqZu/6FnbCAKPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8DebYmOdciFLYHbiTlJr+neHG6Xw+/DJ+Vi6euADKXP7hQq+qnekFet0eqkF95q2Bilq+TIBzp5XdqI6T+Ph4f1t5nZBMFdcYTW/TjaYbfrmzKAGNr9IOb5DvEkv2GLRnThmHt+XovEMx3uUNFlDQJqWqPNL2glhLMvnAMZJcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZJ4VUDA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA1FC4CEE5;
	Mon, 10 Mar 2025 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741597054;
	bh=z3HdFE82Z/4RXvpeoyqLFCEFSfIoebqZu/6FnbCAKPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZJ4VUDAQQIR20H8jXi0mJDIV4ID0WB2CwAbFjl2aHinP/A02XERw7A32F808dODs
	 Ms6hnBnhEkluGmKGSr8CotjSnHmRNbh6spwMl0xPpc4m1ZbrJ5sMUMpM+G67mVGhNx
	 X35Ch+E+1og6Qz9xslNfPzGlCEzjGoqxovfOr6rpQ4l+iN4iH6KtKWOsR6iiWCpABE
	 7iCsRWsmE2MoCl4HDhknfBYhB3nQAsy5aKnVZIr8ZEmis/9NTWXTZiKwL+oDaCW0hn
	 HJoOTn/s2hUF4+PFutLzlgPuxCrTbs9/Iw3T32MkFrgUqH2fvnHex6a0zaVKKCS62R
	 EAYuC89BVv8Bg==
Date: Mon, 10 Mar 2025 14:27:24 +0530
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
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 02/10] optee: pass parent device to tee_device_alloc()
Message-ID: <Z86pdKQY440edHNx@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-3-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-3-jens.wiklander@linaro.org>

On Wed, Mar 05, 2025 at 02:04:08PM +0100, Jens Wiklander wrote:
> During probing of the OP-TEE driver, pass the parent device to
> tee_device_alloc() so the dma_mask of the new devices can be updated
> accordingly.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/ffa_abi.c | 8 ++++----
>  drivers/tee/optee/smc_abi.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Sumit Garg <sumit.garg@kernel.org>

-Sumit

> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index f3af5666bb11..4ca1d5161b82 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -914,16 +914,16 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
>  	    (sec_caps & OPTEE_FFA_SEC_CAP_RPMB_PROBE))
>  		optee->in_kernel_rpmb_routing = true;
>  
> -	teedev = tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
> -				  optee);
> +	teedev = tee_device_alloc(&optee_ffa_clnt_desc, &ffa_dev->dev,
> +				  optee->pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_free_pool;
>  	}
>  	optee->teedev = teedev;
>  
> -	teedev = tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
> -				  optee);
> +	teedev = tee_device_alloc(&optee_ffa_supp_desc, &ffa_dev->dev,
> +				  optee->pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_unreg_teedev;
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index f0c3ac1103bb..165fadd9abc9 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1691,14 +1691,14 @@ static int optee_probe(struct platform_device *pdev)
>  	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
>  		optee->in_kernel_rpmb_routing = true;
>  
> -	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
> +	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_free_optee;
>  	}
>  	optee->teedev = teedev;
>  
> -	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
> +	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_unreg_teedev;
> -- 
> 2.43.0
> 

