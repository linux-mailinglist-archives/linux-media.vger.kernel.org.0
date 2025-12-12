Return-Path: <linux-media+bounces-48716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC40CB955E
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 17:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7D4630E6241
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 16:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7ECA2D6630;
	Fri, 12 Dec 2025 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="CnV+OsvK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C41A2D4B69
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557830; cv=none; b=ib4EyoCUldzMgJwPHY6u6uPEPklaHJUySdz31k0kZ5urvVLuJov27iOfnmxl0ZLoUq0k8y3Sij1EFs+uQlTCDxB8N6d7G9B6fle6xTs3cAJd838mu0y8ewRme94EnCvh7pzwT7WQFe9EPCxy8LeZNq7zq4m5g+V5YuHBwU6oCPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557830; c=relaxed/simple;
	bh=kvhTBtIQkJDcuCLLVUoLZ6nqHNkbX358bx5qwcsg9lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enZIaO2iy74rjHzGNJ2Xo98FH4vaHDOw5IqhkaYETWZpabsdRkY6PbK/L3IN6Y4lLoBjLjid/Kx8lw910wCRCJdhwogAIK9q7UhXX/4jGySPwmqeBS0IYaNDU5+Je5pfn9xO5I6ntdItyEilUEVMCm0DqDmDNzq98IO2mst2MA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=CnV+OsvK; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1765557826;
 bh=fL6p+yF29ZL9GtYFRZVMvgUfhS85FhnBSPlLMEjmfe8=;
 b=CnV+OsvKz7GG+f89nZF/H0dD8N+XVm8PWMRedzQIGBw1pyq8Awm01nSHETHPpKb0GRm3uEn4n
 +OjrwLsoU0Qu1sVGuS4pBcj2CZjkkbxtHjfcktQ7M+ci1xlkAL9fnaldkXIGQ9ge5Z2tPr10DV5
 UokeYdeQzpGRy9Pdw3Kp3L3z6HlOPgR27mJtF4pPfBn5xz78QZQKgFJTpFnZaePAC3caDAFttcd
 6BsGNHb2pQAmUUfHcBXkuf9rnN8Ta1JbIKLsM5Kjuy5CQoq5jFheVvS/uCegtTCj8IY6jXZGQlu
 F+O1TPmGBglXSFmVpwAIBt6yZYWILSgBBOp1Duj0AZXA==
X-Forward-Email-ID: 693c463c2aa8940b84330861
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.6.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5c2dec91-667f-48f6-b958-e0cf81cab569@kwiboo.se>
Date: Fri, 12 Dec 2025 17:43:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkvdec: set ctx->image_fmt in rkvdec_s_capture_fmt
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251212154138.3042300-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251212154138.3042300-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/2025 4:41 PM, Jianfeng Liu wrote:
> ctx->image_fmt is initialized as RKVDEC_IMG_FMT_ANY at
> rkvdec_s_output_fmt, and get set at rkvdec_s_ctrl when userspace sends
> SPS info via VIDIOC_S_EXT_CTRLS. This works fine with gstreamer because
> it sends SPS info to kernel driver before requesting capture queue bufs.
> 
> But chromium requests capture queue bufs first and then sends SPS info
> to kernel, then rkvdec_s_ctrl will return -EBUSY, and the video is
> displayed green.
> 
> Chromium calls VIDIOC_S_FMT to capture queue instead before requesting
> capture queue bufs, so setting ctx->image_fmt in rkvdec_s_capture_fmt
> will make rkvdec_s_ctrl return 0 when the first SPS info sent to driver.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> Fixes: d35c64eccf3b1 ("media: rkvdec: Add get_image_fmt ops")
> ---
> 
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 5af9aa5ab353..e7939d604f64 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -537,6 +537,18 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
>  		return ret;
>  
>  	ctx->decoded_fmt = *f;
> +
> +	u32 fourcc = f->fmt.pix_mp.pixelformat;
> +
> +	if (fourcc == V4L2_PIX_FMT_NV12)
> +		ctx->image_fmt = RKVDEC_IMG_FMT_420_8BIT;
> +	else if (fourcc == V4L2_PIX_FMT_NV15)
> +		ctx->image_fmt = RKVDEC_IMG_FMT_420_10BIT;
> +	else if (fourcc == V4L2_PIX_FMT_NV16)
> +		ctx->image_fmt = RKVDEC_IMG_FMT_422_8BIT;
> +	else if (fourcc == V4L2_PIX_FMT_NV20)
> +		ctx->image_fmt = RKVDEC_IMG_FMT_422_10BIT;

ctx->image_fmt is used to limit what CAPTURE pixel format can be set and
forcing it here violates this.

Chromium should be fixed to follow spec at 4.5.3.2. Initialization [1]:

  1. Set the coded format on the OUTPUT queue via VIDIOC_S_FMT().
  2. Call VIDIOC_S_EXT_CTRLS() to set all the controls (parsed headers,
     etc.) required by the OUTPUT format to enumerate the CAPTURE formats.
  ...
  5. [optional] Choose a different CAPTURE format than suggested via
     VIDIOC_S_FMT() on CAPTURE queue.

Regards,
Jonas

[1] https://docs.kernel.org/userspace-api/media/v4l/dev-stateless-decoder.html

> +
>  	return 0;
>  }
>  


