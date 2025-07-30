Return-Path: <linux-media+bounces-38653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD63B1593E
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 09:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D42017D91B
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 07:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0936B1F4C92;
	Wed, 30 Jul 2025 07:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="i3OjCV0V"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59248E55B
	for <linux-media@vger.kernel.org>; Wed, 30 Jul 2025 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859068; cv=none; b=cEGvuFfr85SObmaDL9Z7PVJ3hHjx/bo0ToUJfwFSPUsB1RPdI8ma7V4QU/HpYCuoreE7Gxup4sWgBrqwfWgIdlvvv+HA/7Fpafip91v6dqb5CzUNLmgx2Ay/54AarBl4rSVTeuOHzGBsYAmHoT8iLs0lR/7rxCXKQYEd1VL+TrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859068; c=relaxed/simple;
	bh=acmYQHveT6enlvSsW1OaTBIwoUn6l4DQhiFxH9WVVN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ofi5WN1DgVy0YaEoXQ2EJSG0q9R3HjZRSiQm8hfrj0ZGhv1Xc3I02MRld415us2psk0tnxf9SjSUo08wERltno+liUd5Fim0Josl70+mYfyV0Cj3Vj2lr8pfvquLmLmq8dxnC0owV1QzGH4Fra8pZxsmc75eoR4hVNjzFti35v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=i3OjCV0V; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250730070418euoutp010b854d68d82a30c69c5cd076ea7eac1c~W9YVbfbR-1816618166euoutp01Q
	for <linux-media@vger.kernel.org>; Wed, 30 Jul 2025 07:04:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250730070418euoutp010b854d68d82a30c69c5cd076ea7eac1c~W9YVbfbR-1816618166euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753859058;
	bh=s9RRy3R2yj+oaDdoueZGj4W8D+VQRo8mLrErLkrXN0Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=i3OjCV0VYGLuDlLuq6civ9J5+Jyt6vDpW5quN/xgaV4PYfi8rdSYHGRX9NiCFM5IX
	 w0XQAUPBD8fgXjUQaV3YbMqgnNPssQNfthCepWdbh9/NhCcoA+DA4u8PYI7gyawb1r
	 qGMf7gjoNssbbEUkix/cUPJ3TpbobhvSo0WuEZ48=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a~W9YVMkP7Y0123601236eucas1p2L;
	Wed, 30 Jul 2025 07:04:17 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250730070417eusmtip166d12f714da9471398e06bfe6c5012b4~W9YUpSzBS0768707687eusmtip1e;
	Wed, 30 Jul 2025 07:04:17 +0000 (GMT)
Message-ID: <205d3356-5ebe-4e73-b888-6765e5a673ea@samsung.com>
Date: Wed, 30 Jul 2025 09:04:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
To: Nathan Chancellor <nathan@kernel.org>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a
X-EPHeader: CA
X-CMS-RootMailID: 20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a
References: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
	<CGME20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a@eucas1p2.samsung.com>

On 16.07.2025 00:13, Nathan Chancellor wrote:
> A new warning in clang [1] points out a few places in s5p_mfc_cmd_v6.c
> where an uninitialized variable is passed as a const pointer:
>
>    drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:45:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
>       45 |                                         &h2r_args);
>          |                                          ^~~~~~~~
>    drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:133:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
>      133 |                                         &h2r_args);
>          |                                          ^~~~~~~~
>    drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:148:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
>      148 |                                         &h2r_args);
>          |                                          ^~~~~~~~
>
> The args parameter in s5p_mfc_cmd_host2risc_v6() is never actually used,
> so just pass NULL to it in the places where h2r_args is currently
> passed, clearing up the warning and not changing the functionality of
> the code.
>
> Cc: stable@vger.kernel.org
> Fixes: f96f3cfa0bb8 ("[media] s5p-mfc: Update MFC v4l2 driver to support MFC6.x")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2103
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  From what I can tell, it seems like ->cmd_host2risc() is only ever
> called from v6 code, which always passes NULL? It seems like it should
> be possible to just drop .cmd_host2risc on the v5 side, then update
> .cmd_host2risc to only take two parameters? If so, I can send a follow
> up as a clean up, so that this can go back relatively conflict free.
> ---
>   .../platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c      | 22 +++++-----------------
>   1 file changed, 5 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> index 47bc3014b5d8..735471c50dbb 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> @@ -31,7 +31,6 @@ static int s5p_mfc_cmd_host2risc_v6(struct s5p_mfc_dev *dev, int cmd,
>   
>   static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
>   {
> -	struct s5p_mfc_cmd_args h2r_args;
>   	const struct s5p_mfc_buf_size_v6 *buf_size = dev->variant->buf_size->priv;
>   	int ret;
>   
> @@ -41,33 +40,23 @@ static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
>   
>   	mfc_write(dev, dev->ctx_buf.dma, S5P_FIMV_CONTEXT_MEM_ADDR_V6);
>   	mfc_write(dev, buf_size->dev_ctx, S5P_FIMV_CONTEXT_MEM_SIZE_V6);
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6,
> -					&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6, NULL);
>   }
>   
>   static int s5p_mfc_sleep_cmd_v6(struct s5p_mfc_dev *dev)
>   {
> -	struct s5p_mfc_cmd_args h2r_args;
> -
> -	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6,
> -			&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6, NULL);
>   }
>   
>   static int s5p_mfc_wakeup_cmd_v6(struct s5p_mfc_dev *dev)
>   {
> -	struct s5p_mfc_cmd_args h2r_args;
> -
> -	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6,
> -					&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6, NULL);
>   }
>   
>   /* Open a new instance and get its number */
>   static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
>   {
>   	struct s5p_mfc_dev *dev = ctx->dev;
> -	struct s5p_mfc_cmd_args h2r_args;
>   	int codec_type;
>   
>   	mfc_debug(2, "Requested codec mode: %d\n", ctx->codec_mode);
> @@ -130,14 +119,13 @@ static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
>   	mfc_write(dev, 0, S5P_FIMV_D_CRC_CTRL_V6); /* no crc */
>   
>   	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_OPEN_INSTANCE_V6,
> -					&h2r_args);
> +					NULL);
>   }
>   
>   /* Close instance */
>   static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
>   {
>   	struct s5p_mfc_dev *dev = ctx->dev;
> -	struct s5p_mfc_cmd_args h2r_args;
>   	int ret = 0;
>   
>   	dev->curr_ctx = ctx->num;
> @@ -145,7 +133,7 @@ static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
>   		mfc_write(dev, ctx->inst_no, S5P_FIMV_INSTANCE_ID_V6);
>   		ret = s5p_mfc_cmd_host2risc_v6(dev,
>   					S5P_FIMV_H2R_CMD_CLOSE_INSTANCE_V6,
> -					&h2r_args);
> +					NULL);
>   	} else {
>   		ret = -EINVAL;
>   	}
>
> ---
> base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
> change-id: 20250715-media-s5p-mfc-fix-uninit-const-pointer-cbf944ae4b4b
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


