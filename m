Return-Path: <linux-media+bounces-57044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD4yGJX1w2lZvAQAu9opvQ
	(envelope-from <linux-media+bounces-57044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 15:47:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B235C32712E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 15:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F011F30C4DC8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70F83E3150;
	Wed, 25 Mar 2026 14:35:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1353E2761
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449325; cv=none; b=BUiAwPViPZaHuIqeI3eI3o3VtWXrFY7K4za+nh2+zqxnrgk6HQsk/s/OAEsZB13AQuquV5MPqEaitXIjp1ouJoMY/ZleYs7CeDQbYSHbx6lit1DXh7yG95QKYIpN/6Gc2Vk1NBvFd5p9ldEOaf/lA4FZ+iJaFSp6JoZ3pkvjrFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449325; c=relaxed/simple;
	bh=BakvxVBcDJLLB/j0CZ4SEvLZKl9BkOUjxHr1vc2IsUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPI93w9zpUFuK05KlHoD+8PYgbg+1CkX2M5nLJueXtfDPj2a5QD7rxAmPf0m73Jg1CQgayaGLksw11WT8Pc916ENYIy6saBtV9qe8hQCsHyt18wqhZ6LeEy+qT3vi0Q+jqC9zQ40y2zBnhlm1nRME3WkH6rILIhQotrjOR7Ci6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PJr-0000cB-Aa; Wed, 25 Mar 2026 15:34:51 +0100
Message-ID: <749d0b93-8b6d-4daf-af64-6834c7f5efe4@pengutronix.de>
Date: Wed, 25 Mar 2026 15:34:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] media: Add P010 video format
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, hverkuil@xs4all.nl,
 ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 paul.kocialkowski@bootlin.com, wens@csie.org, jernej.skrabec@siol.net,
 emil.l.velikov@gmail.com, andrzej.p@collabora.com, jc@kynesim.co.uk,
 jernej.skrabec@gmail.com, nicolas@ndufresne.ca, cphealy@gmail.com
Cc: kernel@pengutronix.de, linux-imx@nxp.com, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
 <20210625141143.577998-5-benjamin.gaignard@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <20210625141143.577998-5-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,xs4all.nl,pengutronix.de,kernel.org,gmail.com,linuxfoundation.org,bootlin.com,csie.org,siol.net,kynesim.co.uk,ndufresne.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57044-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,pengutronix.de:mid]
X-Rspamd-Queue-Id: B235C32712E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Benjamin,

On 6/25/21 4:11 PM, Benjamin Gaignard wrote:
> P010 is a YUV format with 10-bits per pixel with interleaved UV.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> Note that P010 is already known in GStreamer, only the mapping with
> v4l2 pixel format is missing.
>
> version 2:
>   - Add documentation about P010 padding
>   - Fix the number of bits per component (16)
>
>   .../media/v4l/pixfmt-yuv-planar.rst           | 78 ++++++++++++++++++-
>   drivers/media/v4l2-core/v4l2-common.c         |  1 +
>   drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>   include/uapi/linux/videodev2.h                |  1 +
>   4 files changed, 79 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 090c091affd2..af400d37c8fd 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -100,8 +100,13 @@ All components are stored with the same number of bits per component.
>         - Cb, Cr
>         - No
>         - 64x32 macroblocks
> -
> -        Horizontal Z order
> +    * - V4L2_PIX_FMT_P010
> +      - 'P010'
> +      - 16
> +      - 4:2:0
> +      - Cb, Cr
> +      - No
> +      - Linear
>       * - V4L2_PIX_FMT_NV12MT_16X16
>         - 'VM12'
>         - 8
> @@ -171,6 +176,7 @@ horizontally.
>   .. _V4L2-PIX-FMT-NV21:
>   .. _V4L2-PIX-FMT-NV12M:
>   .. _V4L2-PIX-FMT-NV21M:
> +.. _V4L2-PIX-FMT-P010:
>   
>   NV12, NV21, NV12M and NV21M
>   ---------------------------
> @@ -470,6 +476,74 @@ number of lines as the luma plane.
>         - Cb\ :sub:`33`
>         - Cr\ :sub:`33`
>   
> +.. _V4L2_PIX_FMT_P010:
> +
> +P010
> +----
> +
> +The number of bytes in one luminance row must be divisible by 16,
> +which means there will be padded 0 in the right edge when necessary.
> +
> +.. raw:: latex
> +
> +    \begingroup
> +    \small
> +    \setlength{\tabcolsep}{2pt}
> +
> +.. tabularcolumns:: |p{2.6cm}|p{0.70cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +
> +.. flat-table:: P010 16 Bits per component
> +    :header-rows:  2
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - :cspan:`7` Byte 0 in memory
> +
> +      - :cspan:`7` Byte 1
> +    * -
> +      -
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * - ``V4L2_PIX_FMT_P010``
> +      - 'P010'
> +
> +      - Y\ :sub:`9`
> +      - Y\ :sub:`8`
> +      - Y\ :sub:`7`
> +      - Y\ :sub:`6`
> +      - Y\ :sub:`5`
> +      - Y\ :sub:`4`
> +      - Y\ :sub:`3`
> +      - Y\ :sub:`2`
> +
> +      - Y\ :sub:`1`
> +      - Y\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +
> +.. raw:: latex
> +
> +    \endgroup
>   
>   Fully Planar YUV Formats
>   ========================
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 04af03285a20..37b5d82359dd 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -266,6 +266,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>   		{ .format = V4L2_PIX_FMT_NV61,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
>   		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>   		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },

Just stumbled on this. Shouldn't the bpp be 2, 4 (instead of 2,2) and 
the vdiv also 2, given that it's basically NV12 with 10bit data 
contained in 16bit values [1]? Or did I miss something?


[1] 
https://docs.kernel.org/userspace-api/media/v4l/pixfmt-yuv-planar.html#p010-and-tiled-p010

Sincerely
     Sven

>   
>   		{ .format = V4L2_PIX_FMT_YUV410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
>   		{ .format = V4L2_PIX_FMT_YVU410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 05d5db3d85e5..0044987a727a 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1282,6 +1282,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>   	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
>   	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
>   	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
> +	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/CrCb 4:2:0"; break;
>   	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
>   	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
>   	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9260791b8438..e5f7acde0730 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -602,6 +602,7 @@ struct v4l2_pix_format {
>   #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
>   #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
>   #define V4L2_PIX_FMT_HM12    v4l2_fourcc('H', 'M', '1', '2') /*  8  YUV 4:2:0 16x16 macroblocks */
> +#define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 15  Y/CbCr 4:2:0 10-bit per pixel*/
>   
>   /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
>   #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */

