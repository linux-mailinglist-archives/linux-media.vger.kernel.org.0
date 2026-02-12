Return-Path: <linux-media+bounces-52626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIlgBriMjWnq3wAAu9opvQ
	(envelope-from <linux-media+bounces-52626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:18:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F06F12B2FB
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFF66315ACEF
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 08:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A372C324E;
	Thu, 12 Feb 2026 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYEB0uwO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95E1D9663
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884215; cv=none; b=mZVhlthHDuHx5FcduoBu9/A0V+vSVPeaTYZEw2nNiC1CLh4AYlTNUc4uTK75TaoGAo6ivXpmCgBnVBIjTkkc7ghmrroJyGuQPMKCAJ7jiyglEoLtsvo3dRB8vjB/58BjPT/vkXbdz6KCRTdtuRmiG8NrGln7tmGQE9TQpKIuhPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884215; c=relaxed/simple;
	bh=kafWJ6B9k2rI9cT8zyjxxAFUtcmahQoFyXHYAv8H/bw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=hTxGGROUc+kX6UVeRgv8ICJp+GNt59c1AXpLUn6wKsnC42NzecveE5UB1NU2L/Fo2aiWzVg/NsylB5c0UH6Q73gCOBSR6rZefyEH+OovbeJuuSEBID4WDzPqF99GHggT7PhD+VNrKSXEJfB/npEaYNIvZyuEAUxPX2zelrCAxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYEB0uwO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AD6C4CEF7;
	Thu, 12 Feb 2026 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770884215;
	bh=kafWJ6B9k2rI9cT8zyjxxAFUtcmahQoFyXHYAv8H/bw=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=WYEB0uwOU9iplDwwumceHE3VRMC2k/PTzilep5LfjYsMXuUWK3akq9+obtJUuk7ZB
	 oPCpj0p3bmH2xGTaiC7/VuV8ptYqSyhMilCkICLF3SMIBPMOV4W/N66j8PaIb1YH91
	 1el+zauX2Uhv6gL6OhWo3EHGsgEVHPGw/nClbBv8GGMEASVL5SmiU0XyVu2OObHvLF
	 NZDOxqoQvw7C0U1EyA3iEHUtA3vEZQOQnUzav6qNufREayt9u2ItWICd087kKpIJlF
	 c2UWg/iwHm34ZdOM2TSilcu3cgbJOp5W+D3wXtssTPUageholqiNGPMMOrWLst1Kf6
	 +SxeYgST7CfAw==
Message-ID: <69097d9d-3c4d-49b6-b9ad-7c8b75d4c777@kernel.org>
Date: Thu, 12 Feb 2026 09:16:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4l-utils] v4l-utils: Add support for AV1 stateful decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 linux-media@vger.kernel.org
References: <20260107-av1_stateful-v1-1-a691013af2b7@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260107-av1_stateful-v1-1-a691013af2b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-52626-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 3F06F12B2FB
X-Rspamd-Action: no action

On 07/01/2026 21:20, Deepa Guthyappa Madivalara wrote:
> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
> V4l2 uapi. This format is intended for AV1
> bitstreams in stateful decoding workflows.
> The fourcc code 'AV10' is used to distinguish
> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
> which is used for stateless AV1 decoder implementation
> 
> Add support for this in v4l2-compliance and v4l2-ctl.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

All these changes are already in v4l-utils.

The sync-with-kernel.sh script v4l-utils generates all these changes
when syncing to the latest kernsl, and I ran that after this pixelformat
was added.

No need to do anything manually :-)

Only adding the format to determine_codec_mask() was something that needs
to be done manually, and I did that too.

Marking patch as Obsoleted.

Regards,

	Hans

> ---
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
> 		Driver name      : iris_driver
> 		Card type        : Iris Decoder
> 		Bus info         : platform:aa00000.video-codec
> 		Driver version   : 6.17.0
> 		Capabilities     : 0x84204000
> 				Video Memory-to-Memory Multiplanar
> 				Streaming
> 				Extended Pix Format
> 				Device Capabilities
> 		Device Caps      : 0x04204000
> 				Video Memory-to-Memory Multiplanar
> 				Streaming
> 				Extended Pix Format
> 		Detected Stateful Decoder
> 
> Required ioctls:
> 		test VIDIOC_QUERYCAP: OK
> 		test invalid ioctls: OK
> 
> Allow for multiple opens:
> 		test second /dev/video0 open: OK
> 		test VIDIOC_QUERYCAP: OK
> 		test VIDIOC_G/S_PRIORITY: OK
> 		test for unlimited opens: OK
> 
> Debug ioctls:
> 		test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 		test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 		test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not
> Supported)
> 		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 		test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 		test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 		test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 		test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 		Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 		test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 		test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 		test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 		test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 		Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 		test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 		test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not
> Supported)
> 		test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 		test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 		test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 		test VIDIOC_QUERYCTRL: OK
> 		test VIDIOC_G/S_CTRL: OK
> 		test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 		test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 		test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 		Standard Controls: 12 Private Controls: 0
> 
> Format ioctls:
> 		test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 		test VIDIOC_G/S_PARM: OK (Not Supported)
> 		test VIDIOC_G_FBUF: OK (Not Supported)
> 		test VIDIOC_G_FMT: OK
> 		test VIDIOC_TRY_FMT: OK
> 		test VIDIOC_S_FMT: OK
> 		test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 		test Cropping: OK
> 		test Composing: OK
> 		test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 		test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 		test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 		test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 		test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 		test CREATE_BUFS maximum buffers: OK
> 		test VIDIOC_REMOVE_BUFS: OK
> 		test VIDIOC_EXPBUF: OK
> 		test Requests: OK (Not Supported)
> 		test blocking wait: OK
> 
> Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
> Warnings: 0
> 
> V4l2-ctl Test verified for 2 streams as well.
> ---
>  contrib/freebsd/include/linux/videodev2.h | 1 +
>  include/linux/videodev2.h                 | 1 +
>  utils/common/v4l2-pix-formats.h           | 1 +
>  utils/v4l2-compliance/v4l2-compliance.cpp | 1 +
>  utils/v4l2-tracer/v4l2-tracer-info-gen.h  | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
> index 0b1465842b3f0c0cfa7b6dd1802171c69b4753d0..6657998a11fdee9e1e3941d506a84f24ec2661a0 100644
> --- a/contrib/freebsd/include/linux/videodev2.h
> +++ b/contrib/freebsd/include/linux/videodev2.h
> @@ -782,6 +782,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>  #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
>  #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
> +#define V4L2_PIX_FMT_AV1 v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
>  #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>  #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>  #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> index a1f30e0382914801c56c0ffec3a90186721e9c95..2503003f8ee6a04acaa9b8e564be51fd86c7dc8f 100644
> --- a/include/linux/videodev2.h
> +++ b/include/linux/videodev2.h
> @@ -751,6 +751,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>  #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>  #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
> +#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 (stateful) */
>  
>  /*  Vendor-specific formats   */
>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
> diff --git a/utils/common/v4l2-pix-formats.h b/utils/common/v4l2-pix-formats.h
> index b0a7fe10bd5d439b2705da536ef4f80350dec353..135a06a8660f19e1787a00554dbc39eeb85b7091 100644
> --- a/utils/common/v4l2-pix-formats.h
> +++ b/utils/common/v4l2-pix-formats.h
> @@ -260,6 +260,7 @@
>  	case V4L2_PIX_FMT_QC10C: return "QCOM Compressed 10-bit Format";
>  	case V4L2_PIX_FMT_AJPG: return "Aspeed JPEG";
>  	case V4L2_PIX_FMT_AV1_FRAME: return "AV1 Frame";
> +	case V4L2_PIX_FMT_AV1: return "AV1";
>  	case V4L2_PIX_FMT_MT2110T: return "Mediatek 10bit Tile Mode";
>  	case V4L2_PIX_FMT_MT2110R: return "Mediatek 10bit Raster Mode";
>  	case V4L2_PIX_FMT_HEXTILE: return "Hextile Compressed Format";
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index b82d7dad326907d42edeb3d503cf4e6652fe9b6e..be0fd98537951485c61a1cd0df01ec0593eaf341 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -585,6 +585,7 @@ static void determine_codec_mask(struct node &node)
>  			case V4L2_PIX_FMT_VP8:
>  			case V4L2_PIX_FMT_VP9:
>  			case V4L2_PIX_FMT_HEVC:
> +			case V4L2_PIX_FMT_AV1:
>  			case V4L2_PIX_FMT_FWHT:
>  				mask |= STATEFUL_DECODER;
>  				break;
> diff --git a/utils/v4l2-tracer/v4l2-tracer-info-gen.h b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
> index b54ee579166c84c01403cd3f207f9a590ebd9e1c..bca4556edbd2dd0537b915dc62bade677fb80e41 100644
> --- a/utils/v4l2-tracer/v4l2-tracer-info-gen.h
> +++ b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
> @@ -1422,6 +1422,7 @@ constexpr val_def v4l2_pix_fmt_val_def[] = {
>  	{ V4L2_PIX_FMT_H264_SLICE,	"V4L2_PIX_FMT_H264_SLICE" },
>  	{ V4L2_PIX_FMT_HEVC_SLICE,	"V4L2_PIX_FMT_HEVC_SLICE" },
>  	{ V4L2_PIX_FMT_AV1_FRAME,	"V4L2_PIX_FMT_AV1_FRAME" },
> +	{ V4L2_PIX_FMT_AV1,	"V4L2_PIX_FMT_AV1" },
>  	{ V4L2_PIX_FMT_SPK,	"V4L2_PIX_FMT_SPK" },
>  	{ V4L2_PIX_FMT_RV30,	"V4L2_PIX_FMT_RV30" },
>  	{ V4L2_PIX_FMT_RV40,	"V4L2_PIX_FMT_RV40" },
> 
> ---
> base-commit: ea9e12ad2131e2471d719fbfee17e89f0fca71f3
> change-id: 20260107-av1_stateful-04524166d097
> 
> Best regards,


