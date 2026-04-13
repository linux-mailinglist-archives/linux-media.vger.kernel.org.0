Return-Path: <linux-media+bounces-58646-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OHUOv2p3GlfVAkAu9opvQ
	(envelope-from <linux-media+bounces-58646-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:31:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3903E9275
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E287030046AA
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318C53A9D83;
	Mon, 13 Apr 2026 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZAyKEiL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF90C39DBC3
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069112; cv=none; b=TX5VuHSFn+3mMcLwu4sT4rlRi0EZfQxJdMu9FBVt5v1D6mC4nGDoyPoR8JDN+AYoNr75RzYk+UsEZ7XLHYfdVe2OSOyN2BbdKUP9vZTeGvB4biwM2ahmtyXF8c2Hso39iSv5LVG1K/ynJBOLvQDlO8royQEJzTj6vMzSXM8GKNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069112; c=relaxed/simple;
	bh=ygX3QGpmpzQ4vDb35DrfpC80ywfwMhPNQFU2B1S833A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSKhXdI7Rvk6gbzZacbEWX23GRvjl9jHZqU6RrhtwCgND5JRnQoK75TT4qDU/RrMFubIJ8nX67IHSB02aY3uEICoPSZptprYPJsfrssRZkmyDx6hjygh7CvAKv2AgZ6M7+WGQPhEdjUt8qnjOMoVpJtNex4/b7eT6Nw7OtDVMJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZAyKEiL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776069111; x=1807605111;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ygX3QGpmpzQ4vDb35DrfpC80ywfwMhPNQFU2B1S833A=;
  b=eZAyKEiLNDAcCguLfo7h0TEfW001AB6mONoY+EKiN8Qu2mA9/GRvdJDc
   XOHmCyQwWNLpnjFgmT/s/JJdckUuQatpd0iX21BOR86bO5Zc603+PfIZz
   SUilkH9itz1tPCXEO6FDiDpzbpDL5orVT2K6sHXNC1lKt8stJpPr9/rL8
   dWF2BtlOvzYEbJJ3/Soj9+YW7fdWJdSt7uJVZabNitHYA5ZVkdEKJ24lp
   ZWaVdAkh3Di4NWr8VbJFTKIdcBiyuK7GMf+/5i8YufXNpLPgghwQ5zxuq
   N2XI2A/qRlaLciBhJ2BJyZ80NpvrCkiOB/L7xxjbiSOcou5lthtcsJnmc
   Q==;
X-CSE-ConnectionGUID: UTjkdVqKQbyKcYKHFo3Y1Q==
X-CSE-MsgGUID: oe+I5SSHSFeaqdophozxIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76907456"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76907456"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:31:51 -0700
X-CSE-ConnectionGUID: kRnB8EohQb611Ginyevg6g==
X-CSE-MsgGUID: AiU4VxdXSISX/Yzv4b1gFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="233756454"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:31:47 -0700
Message-ID: <f4e2171a-da58-488f-be02-26a39b5afbe3@linux.intel.com>
Date: Mon, 13 Apr 2026 16:29:59 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/26] vfio/pci: Change the DMA-buf exporter to use
 mapping_type
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <12-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <12-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baolu.lu@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58646-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: EF3903E9275
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/18/26 08:11, Jason Gunthorpe wrote:
> Simple conversion to add a match_mapping() callback that offers an
> exporter SGT mapping type. Later patches will add a physical address
> exporter so go straight to adding the match_mapping() function.
> 
> The check for attachment->peer2peer is replaced with setting
> exporter_requires_p2p=true. VFIO always uses MMIO memory.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/vfio/pci/vfio_pci_dmabuf.c | 31 +++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d4d0f7d08c53e2..c7addef5794abf 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -25,9 +25,6 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>   {
>   	struct vfio_pci_dma_buf *priv = dmabuf->priv;
>   
> -	if (!attachment->peer2peer)
> -		return -EOPNOTSUPP;
> -
>   	if (priv->revoked)
>   		return -ENODEV;
>   
> @@ -75,11 +72,35 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>   	kfree(priv);
>   }
>   
> -static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> -	.attach = vfio_pci_dma_buf_attach,
> +static const struct dma_buf_mapping_sgt_exp_ops vfio_pci_dma_buf_sgt_ops = {
>   	.map_dma_buf = vfio_pci_dma_buf_map,
>   	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> +};
> +
> +static int vfio_pci_dma_buf_match_mapping(struct dma_buf_match_args *args)
> +{
> +	struct vfio_pci_dma_buf *priv = args->dmabuf->priv;
> +	struct dma_buf_mapping_match sgt_match[1];
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);

My understanding of this lock assertion is that priv and the underlying
priv->vdev are accessed within this function. Therefore, the lock is
necessary to protect them. Do I understand it right?

However, callers - for example, dma_buf_mapping_attach() - do not
acquire dma_resv_lock() before calling this function. So kernel traces
will always be triggered.

> +
> +	/*
> +	 * Once we pass vfio_pci_dma_buf_cleanup() the dmabuf will never be
> +	 * usable again.
> +	 */
> +	if (!priv->vdev)
> +		return -ENODEV;
> +
> +	sgt_match[0] = DMA_BUF_EMAPPING_SGT_P2P(&vfio_pci_dma_buf_sgt_ops,
> +						priv->vdev->pdev);
> +
> +	return dma_buf_match_mapping(args, sgt_match, ARRAY_SIZE(sgt_match));
> +}
> +
> +static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> +	.attach = vfio_pci_dma_buf_attach,
>   	.release = vfio_pci_dma_buf_release,
> +	.match_mapping = vfio_pci_dma_buf_match_mapping,
>   };
>   
>   /*

Thanks,
baolu

