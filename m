Return-Path: <linux-media+bounces-62734-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJqCHyXcFGqvQwcAu9opvQ
	(envelope-from <linux-media+bounces-62734-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 01:32:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A405CF2E2
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 01:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB4623016801
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 23:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F6C35F5E3;
	Mon, 25 May 2026 23:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMHK6k71"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39FE2D8382;
	Mon, 25 May 2026 23:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779751963; cv=none; b=UbrHwts0sPs5r29ozE//IK/HpYnoAXJYZ56DYl0YWRaroHkCp48+SCEzuWIEVYdTM8TMS8b4Xy8Nmo6X5zNt+EgVonJPtLuJnu4das5oHSMKeFbi5E0T0JvaPr70boUpNABc7yuxeTC0qLaz443DUpYdiYEMuYWREKqw5I0qUtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779751963; c=relaxed/simple;
	bh=I+eStNjdBRAcB7eu1Sad5mIHqECmYRReAKCBNE5GLEA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sKnr0PSHeFVJTYqHlkD+Yz+XmwO7OnCynLLOb4/6bSHTbrKpblVsvOyQFQlonL9bUMMCQeLfCoN50BhMLEWgygu0gVCeK5NRUGiyaCijggt4QgInJ9fE5Zk73iOAU4LOxU58po3te4bYegZrLK2jLnXk+nTQlYql9Mv4a7doNWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMHK6k71; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BE31F000E9;
	Mon, 25 May 2026 23:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779751961;
	bh=eu+HljQeuT61GgcMUAZmPW50YM46AOV2JSQsJ7dGpLg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fMHK6k713NDLlQsdl5OrExDNCYAnODrlfMhnENFrhP6zLCXSF/AHsHgcuOGvRbt25
	 SYVqvD4cHMUcByqcaYN+9Igam4pLuOL0rdwmfDe1q+hskGSoKSHfmxHbuW5ZMRiR8B
	 i5KGm7CW/wwhmjj5kbGijEFm15+SJ2OsPtGDTPqTHiiDURGQArl83yOBjw2C3axfW0
	 oPlPA4s+ZpP7qzhJ7bQ4/ZxDa5jhzK0hJkNlkp0gpkUVcVjGDRiA0d7L6U5PtO3YOZ
	 zLGvQfHD/jovc1wyUIrkh31heEf3tmLu3eTCAtD2eEQEQuGCVFgx6+eFrTZ819sh90
	 NmEU7MIaa2PnQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/6] media: qcom: iris: add QC10C & P010 buffer size
 calculations
From: bod@kernel.org
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-2-8ff8fce3f904@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <20260521-topic-sm8x50-iris-10bit-decoding-v4-2-8ff8fce3f904@linaro.org>
Date: Tue, 26 May 2026 00:32:36 +0100
Message-Id: <177975195659.14006.7791935711673833026.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10838; i=bod@kernel.org;
 h=from:subject:message-id; bh=I+eStNjdBRAcB7eu1Sad5mIHqECmYRReAKCBNE5GLEA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqFNwW0FXRnwqVCAVYdueBAKlmR1vtipOFTi/gj
 IiluEeLJ2yJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahTcFgAKCRAicTuzoY3I
 Oil9D/sF1oAwVI3zNYV4vSmt2LO/dbBeWZRXhTCO0i9Nf153UTZZdu36B3OUqHXcpBEkW9PUVjr
 Nv2vjrtJKCMwQm96S0WrsKk6pBsDnykOUj3oJwWVdneHCJcv4UTUdu5no2RZbcvZPLOb1XeimgG
 RUv47Oylq393CxvUyEKaClBk9oC1lMk/T2FctHGQn1zW6KNHtw5EhfgWcvQVJgyPVdpCloN2/KH
 tadgLV0RwrH6XoLG4W7UM5A26+xgka4T+HyARzy7c5mHSx0LhpVU0ufp0o/pUQytEQNK3KQkRfA
 hZnDthMs6PfKqmD1hDpDqRkv1X/NfSwoB5hFn26gDxqm+POOuMu51W6iYWEjXRw3s03dpqcL40c
 0xnoWybDxseFJk768yn4D+D61JpTc3asCegLhWkVjCrW+iFbTZ/pzHhDP/t6A8ltO5KviRrUqlg
 Lt2+vRZy4p6rQBaOQHAnmQVaZfcrVc8P+xa2IO88Zzyfx8z1HwTN4XmgAb/GaiiSk9FWMSzPJYj
 W4puhXhwHvBXv/XVtmKkpih12eBl2ZieDEe0xDFKgigCzsHiICvth4P4PCTqZE+ijbR81Vhg2FX
 aWpHjRkAxk38RXoxVqWg5lOToE/ahtwUlhDaLeDqhA0wc1E5lMhSatOxD8sKOOZ7EnLNJyVZDFY
 fW2r00z0pWyqCQA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62734-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E9A405CF2E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-21 11:24 +0200, Neil Armstrong wrote:
> The P010 (YUV format with 16-bits per pixel with interleaved UV)
> and QC10C (P010 compressed mode similar to QC08C) requires specific
> buffer calculations to allocate the right buffer size for the DPB
> (decoded picture buffer) frames and frames consumed by userspace.
> 
> Similar to 8bit, the 10bit DPB frames uses QC10C format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 195 ++++++++++++++++++++++++-
>  1 file changed, 194 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index ef7f6f931557..fbe2dd87f0d6 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -15,8 +15,11 @@
>  #define MAX_WIDTH 4096
>  #define MAX_HEIGHT 2304
>  #define Y_STRIDE_ALIGN 128
> +#define Y_STRIDE_ALIGN_P010 256
>  #define UV_STRIDE_ALIGN 128
> +#define UV_STRIDE_ALIGN_P010 256
>  #define Y_SCANLINE_ALIGN 32
> +#define Y_SCANLINE_ALIGN_QC10C 16
>  #define UV_SCANLINE_ALIGN 16
>  #define UV_SCANLINE_ALIGN_QC08C 32
>  #define META_STRIDE_ALIGNED 64
> @@ -80,6 +83,63 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>  	return ALIGN(y_plane + uv_plane, PIXELS_4K);
>  }
>  
> +/*
> + * P010:
> + * YUV 4:2:0 image with a plane of 10 bit Y samples followed
> + * by an interleaved U/V plane containing 10 bit 2x2 subsampled
> + * colour difference samples.
> + *
> + * <-Y/UV_Stride (aligned to 256)->
> + * <----- Width*2 ------->
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          y_scanlines (aligned to 32)
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .              V
> + * U V U V U V U V U V U V . . . .  ^
> + * U V U V U V U V U V U V . . . .  |
> + * U V U V U V U V U V U V . . . .  |
> + * U V U V U V U V U V U V . . . .  uv_scanlines (aligned to 16)
> + * . . . . . . . . . . . . . . . .  |
> + * . . . . . . . . . . . . . . . .  V
> + * . . . . . . . . . . . . . . . .  --> Buffer size aligned to 4K
> + *
> + * y_stride : Width*2 aligned to 256
> + * uv_stride : Width*2 aligned to 256
> + * y_scanlines: Height aligned to 32
> + * uv_scanlines: Height/2 aligned to 16
> + * Total size = align((y_stride * y_scanlines
> + *          + uv_stride * uv_scanlines , 4096)
> + *
> + * Note: All the alignments are hardware requirements.
> + */
> +static u32 iris_yuv_buffer_size_p010(struct iris_inst *inst)
> +{
> +	u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
> +	struct v4l2_format *f;
> +
> +	if (inst->domain == DECODER)
> +		f = inst->fmt_dst;
> +	else
> +		f = inst->fmt_src;
> +
> +	y_stride = ALIGN(f->fmt.pix_mp.width * 2, Y_STRIDE_ALIGN_P010);
> +	uv_stride = ALIGN(f->fmt.pix_mp.width * 2, UV_STRIDE_ALIGN_P010);
> +	y_scanlines = ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN);
> +	uv_scanlines = ALIGN((f->fmt.pix_mp.height + 1) >> 1, UV_SCANLINE_ALIGN);
> +	y_plane = y_stride * y_scanlines;
> +	uv_plane = uv_stride * uv_scanlines;
> +
> +	return ALIGN(y_plane + uv_plane, PIXELS_4K);
> +}
> +
>  /*
>   * QC08C:
>   * Compressed Macro-tile format for NV12.
> @@ -204,6 +264,132 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>  	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>  }
>  
> +/*
> + * QC10C:
> + * UBWC-compressed format for P010.
> + * Contains 4 planes in the following order -
> + * (A) Y_Meta_Plane
> + * (B) Y_UBWC_Plane
> + * (C) UV_Meta_Plane
> + * (D) UV_UBWC_Plane
> + *
> + * Y_Meta_Plane consists of meta information to decode compressed
> + * tile data in Y_UBWC_Plane.
> + * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
> + * UBWC decoder block will use the Y_Meta_Plane data together with
> + * Y_UBWC_Plane data to produce loss-less uncompressed 10 bit Y samples.
> + *
> + * UV_Meta_Plane consists of meta information to decode compressed
> + * tile data in UV_UBWC_Plane.
> + * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
> + * UBWC decoder block will use UV_Meta_Plane data together with
> + * UV_UBWC_Plane data to produce loss-less uncompressed 10 bit 2x2
> + * subsampled color difference samples.
> + *
> + * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
> + * and randomly accessible. There is no dependency between tiles.
> + *
> + * <----- Y Meta stride -----> (aligned to 64)
> + * <-------- Width ----------> (aligned to 48)
> + * M M M M M M M M M M M M . .      ^           ^
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      Height      |
> + * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines (aligned to 16)
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      V           |
> + * . . . . . . . . . . . . . .                  |
> + * . . . . . . . . . . . . . .                  |
> + * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> + * . . . . . . . . . . . . . .                  V
> + * <--Compressed tile Y stride --> (aligned to 256)
> + * <------- Width * 4/3 ---------> (aligned to 48)
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines (aligned to 16)
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> + * . . . . . . . . . . . . . . . .              V
> + * <---- UV Meta stride ----> (aligned to 64)
> + * <----- Width / 2 --------> (aligned to 24)
> + * M M M M M M M M M M M M . .    ^           ^
> + * M M M M M M M M M M M M . .    |           |
> + * M M M M M M M M M M M M . .    Height/2    |
> + * M M M M M M M M M M M M . .    V           M_UV_Scanlines (aligned to 16)
> + * . . . . . . . . . . . . . .                |
> + * . . . . . . . . . . . . . .                V
> + * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> + * <--Compressed tile UV stride--> (aligned to 256)
> + * <------- Width * 4/3 ---------> (aligned to 48)
> + * U* V* U* V* U* V* U* V* . . . .  ^
> + * U* V* U* V* U* V* U* V* . . . .  |
> + * U* V* U* V* U* V* U* V* . . . .  |
> + * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines (aligned to 16)
> + * . . . . . . . . . . . . . . . .  |
> + * . . . . . . . . . . . . . . . .  V
> + * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> + *
> + * y_stride: width aligned to 256
> + * uv_stride: width aligned to 256
> + * y_scanlines: height aligned to 16
> + * uv_scanlines: height aligned to 16
> + * y_plane: buffer size aligned to 4096
> + * uv_plane: buffer size aligned to 4096
> + * y_meta_stride: width aligned to 64
> + * y_meta_scanlines: height aligned to 16
> + * y_meta_plane: buffer size aligned to 4096
> + * uv_meta_stride: width aligned to 64
> + * uv_meta_scanlines: height aligned to 16
> + * uv_meta_plane: buffer size aligned to 4096
> + *
> + * Total size = align( y_plane + uv_plane +
> + *           y_meta_plane + uv_meta_plane, 4096)
> + *
> + * Note: All the alignments are hardware requirements.
> + */
> +static u32 iris_yuv_buffer_size_qc10c(struct iris_inst *inst)
> +{
> +	u32 y_plane, uv_plane, y_stride, uv_stride;
> +	u32 uv_meta_stride, uv_meta_plane;
> +	u32 y_meta_stride, y_meta_plane;
> +	struct v4l2_format *f;
> +
> +	if (inst->domain == DECODER)
> +		f = inst->fmt_dst;
> +	else
> +		f = inst->fmt_src;
> +
> +	y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, 48),
> +			      META_STRIDE_ALIGNED);
> +	y_meta_plane = y_meta_stride * ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height, 4),
> +					     META_SCANLINE_ALIGNED);
> +	y_meta_plane = ALIGN(y_meta_plane, PIXELS_4K);
> +
> +	y_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, Y_STRIDE_ALIGN_P010);
> +	y_plane = ALIGN(y_stride * ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN_QC10C),
> +			PIXELS_4K);
> +
> +	uv_meta_stride = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.width + 1) >> 1, 24),
> +			       META_STRIDE_ALIGNED);
> +	uv_meta_plane = uv_meta_stride *
> +			ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.height + 1) >> 1, 4),
> +			      META_SCANLINE_ALIGNED);
> +	uv_meta_plane = ALIGN(uv_meta_plane, PIXELS_4K);
> +
> +	uv_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, UV_STRIDE_ALIGN_P010);
> +	uv_plane = ALIGN(uv_stride * ALIGN((f->fmt.pix_mp.height + 1) >> 1, UV_SCANLINE_ALIGN),
> +			 PIXELS_4K);
> +
> +	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
> +}
> +
>  static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
>  {
>  	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> @@ -268,10 +454,17 @@ int iris_get_buffer_size(struct iris_inst *inst,
>  		case BUF_OUTPUT:
>  			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
>  				return iris_yuv_buffer_size_qc08c(inst);
> +			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C)
> +				return iris_yuv_buffer_size_qc10c(inst);
> +			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)
> +				return iris_yuv_buffer_size_p010(inst);
>  			else
>  				return iris_yuv_buffer_size_nv12(inst);
>  		case BUF_DPB:
> -			return iris_yuv_buffer_size_qc08c(inst);
> +			if (iris_fmt_is_10bit(inst->fmt_dst->fmt.pix_mp.pixelformat))
> +				return iris_yuv_buffer_size_qc10c(inst);
> +			else
> +				return iris_yuv_buffer_size_qc08c(inst);
>  		default:
>  			return 0;
>  		}
> 
> -- 
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


