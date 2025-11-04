Return-Path: <linux-media+bounces-46278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F0C308CC
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 11:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 69A8F34BFBE
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 10:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEF92D738A;
	Tue,  4 Nov 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlNk83dt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6527E04C;
	Tue,  4 Nov 2025 10:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252794; cv=none; b=UGZfcRROW5h4kDe6Al9rA8eUPPT64W8J28hvtRSNWNwSAqq3U8utCTRpzwS82ekJtXYI5ImCnR0pGZ2fbfBPGHpBmE0AObcHqkgsiOQqWKP2CFMs5KRKXnBFpwCWNQlmdO2NgNtabFEMskoQtfs4Gi2wbbzgA8zSU8BXNJM0qZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252794; c=relaxed/simple;
	bh=bVSOpVrl2E+aD2iwJShLNXwchdC6N4vvdH0xbq0Wv7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHnstrxNg9yS17ADWxmx1s9gfBvrCfTsubepi5uSg9zSLUcpJJ8DUmAq6YxaEc3OyDHvBxN7XJe3PA7c4JRkVvF85U7UabNrcAMR6NsLrA+52/S/eWfyDdRnZV6Xw3DgEp2PkrsFCgevBXj8qf0GUGHN0ix/zN6QrtFHJJ/Lb7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlNk83dt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DC6C116B1;
	Tue,  4 Nov 2025 10:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762252794;
	bh=bVSOpVrl2E+aD2iwJShLNXwchdC6N4vvdH0xbq0Wv7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SlNk83dt1Smbc3hLuSAOFwWkfmmmmga4QZ2/iN/3hvrii36ah911xR1PZR6CrIzMW
	 bZw4faGQ5Y7SCpkJqDpd5uAX1CHrdxz7S5+rPLO3U6mHZy06WdlubrhGRZIXF8WJrD
	 7RHzF3sRp7Iez191RHjK0bMbNeIKDsYy0CaroJe1tyQvGL6Qc1/PNYmSE6BGlkjdfl
	 lkycl49PkuqE5g7LvXy4gZC10Vy2odMekVQYQOk/17egZGcFZxQB9IK6WqNYNbO9sz
	 FmLc0IesnZ3Yr3DHYFgYF9BHORkyuY/hKO6esZwjP5rJWFmz2pIhYx175Z1C9RAVf1
	 Jl1MhdXrOJ2BQ==
Message-ID: <0735f540-8085-440c-9c0f-7ac23b52b838@kernel.org>
Date: Tue, 4 Nov 2025 10:39:50 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: qcom: iris: Improve format alignment for
 encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 quic_qiweil@quicinc.com, quic_renjiang@quicinc.com
References: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
 <k3umzf0z69-Hbh7jbT-Gjp4pyquNAYVC3VfIXQcdVZstI5FTtcGU_NEgb8l796Z3Cr6Dz0DQ0BoVQQPd4fr6sQ==@protonmail.internalid>
 <20251104-iris_encoder_enhancements-v3-1-63b0c431b4d0@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251104-iris_encoder_enhancements-v3-1-63b0c431b4d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2025 08:11, Wangao Wang wrote:
> Add members enc_raw_width, enc_raw_height to the struct iris_inst to
> support codec alignment requirements.
> 
> HFI_PROP_CROP_OFFSETS is used to inform the firmware of the region
> of interest, rather than indicating that the codec supports crop.
> Therefore, the crop handling has been corrected accordingly.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 23 ++++++++++++++++------
>   drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
>   drivers/media/platform/qcom/iris/iris_venc.c       | 10 ++++++++--
>   3 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 4ce71a14250832440099e4cf3835b4aedfb749e8..2469e027706fb6c9c0b95be11109c3cd0f8d70ce 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -168,8 +168,7 @@ static int iris_hfi_gen2_session_set_property(struct iris_inst *inst, u32 packet
> 
>   static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
>   {
> -	u32 resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
> -		inst->fmt_src->fmt.pix_mp.height;
> +	u32 resolution = inst->enc_raw_width << 16 | inst->enc_raw_height;
>   	u32 port = iris_hfi_gen2_get_port(inst, plane);
> 
>   	return iris_hfi_gen2_session_set_property(inst,
> @@ -216,8 +215,11 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>   	u32 port = iris_hfi_gen2_get_port(inst, plane);
>   	u32 bottom_offset, right_offset;
>   	u32 left_offset, top_offset;
> +	u32 codec_align;
>   	u32 payload[2];
> 
> +	codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +
>   	if (inst->domain == DECODER) {
>   		if (V4L2_TYPE_IS_OUTPUT(plane)) {
>   			bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
> @@ -231,10 +233,19 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>   			top_offset = inst->compose.top;
>   		}
>   	} else {
> -		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
> -		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
> -		left_offset = inst->crop.left;
> -		top_offset = inst->crop.top;
> +		if (V4L2_TYPE_IS_OUTPUT(plane)) {
> +			bottom_offset = (inst->enc_raw_height - inst->crop.height);
> +			right_offset = (inst->enc_raw_width - inst->crop.width);
> +			left_offset = inst->crop.left;
> +			top_offset = inst->crop.top;
> +		} else {
> +			bottom_offset = (ALIGN(inst->enc_raw_height, codec_align) -
> +					inst->enc_raw_height);
> +			right_offset = (ALIGN(inst->enc_raw_width, codec_align) -
> +					inst->enc_raw_width);
> +			left_offset = 0;
> +			top_offset = 0;
> +		}
>   	}
> 
>   	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..fbae1662947df73bb3d10b7892839fa1076b7e61 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -64,6 +64,8 @@ struct iris_fmt {
>    * @frame_rate: frame rate of current instance
>    * @operating_rate: operating rate of current instance
>    * @hfi_rc_type: rate control type
> + * @enc_raw_width: raw image width for encoder instance
> + * @enc_raw_height: raw image height for encoder instance
>    */
> 
>   struct iris_inst {
> @@ -102,6 +104,8 @@ struct iris_inst {
>   	u32				frame_rate;
>   	u32				operating_rate;
>   	u32				hfi_rc_type;
> +	u32				enc_raw_width;
> +	u32				enc_raw_height;
>   };
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0294725860305254c4cad1ec88d7e..7ad747d2272f029e69a56572a188a032f898a3fb 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -62,12 +62,15 @@ int iris_venc_inst_init(struct iris_inst *inst)
> 
>   	inst->crop.left = 0;
>   	inst->crop.top = 0;
> -	inst->crop.width = f->fmt.pix_mp.width;
> -	inst->crop.height = f->fmt.pix_mp.height;
> +	inst->crop.width = DEFAULT_WIDTH;
> +	inst->crop.height = DEFAULT_HEIGHT;
> 
>   	inst->operating_rate = DEFAULT_FPS;
>   	inst->frame_rate = DEFAULT_FPS;
> 
> +	inst->enc_raw_width = DEFAULT_WIDTH;
> +	inst->enc_raw_height = DEFAULT_HEIGHT;
> +
>   	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
>   	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> 
> @@ -249,6 +252,9 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>   	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
>   	inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> 
> +	inst->enc_raw_width = f->fmt.pix_mp.width;
> +	inst->enc_raw_height = f->fmt.pix_mp.height;
> +
>   	if (f->fmt.pix_mp.width != inst->crop.width ||
>   	    f->fmt.pix_mp.height != inst->crop.height) {
>   		inst->crop.top = 0;
> 
> --
> 2.43.0
> 

To me reading this patch you seem to have three or four different 
alignment changed bunched into one.

I would prefer to see more granular and specific patches for each change.

Please break this up into more bite size chunks.

---
bod

