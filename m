Return-Path: <linux-media+bounces-34239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84210AD0211
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2BC83B007A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5681D28853A;
	Fri,  6 Jun 2025 12:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="S48dUPRQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PNPEKMyg"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD802253355;
	Fri,  6 Jun 2025 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212070; cv=none; b=SpZO6L9OYWNrTABytH6rfkn7UuEcIbCPR3dtoPwUT/9sIDV0mDpyyHqurQi0g6O3uKRq2WwLjKx/vvCcwLb95z46+uMytca+17B4HJ7IO+JhqnWIgLrXS6sIHrcgp64RfOjuFsaUogBnW8zI1AOLRAUpwo1wwXtlHJkFMbdj4tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212070; c=relaxed/simple;
	bh=qdxOxEI9x96A9XjkglB81iLIIYJwSgZOX1DcgLYY7SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqdp2d8qEJ52g3If/u5hDoXXQHgE0cPItbZ0GK4kC7ZV86ZYt7j4N959u6Bv6MmSSLC/JZGIxGZJnu1ku69xDQlDx9xeIQI60NhBB7A2zwdxb2+hSQkpNHlpIMbWbA0wmIXRTDNw7zCXU7t7fRJNhPGFcjHYPTRAeEMGiJF9AVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=S48dUPRQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PNPEKMyg; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id DD0CA138033D;
	Fri,  6 Jun 2025 08:14:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 06 Jun 2025 08:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749212067;
	 x=1749298467; bh=Z84X3cRTGcgyKLWc3Ch2d3gKywmMCUsq5T9sb22yUnc=; b=
	S48dUPRQa90Gky8GVAVbsQXZ5wu/So3y6IlK39TSVWnGjogvwya7cwkUJw1c1m4i
	+xJNXeRf0Q858bol16Ot1bskbwbiJysTZywFSTwTZEwB402PuSkPMqHX/WZ5UMHp
	kn2m3MrUrZ96fJZpZpAXODb4p6ZCcdHO5z8EyEKRjlm9r4UyyVGhEKdDx5y24lef
	LT32ieJBZAXxkjLtzreePOHvA1P6G3AbQG0hkSLnBWEvX9cuEwXkVxFWpuN32tu9
	NwpE7NJWMB6rzZB0eNtoGEMJLCplrXMWuWoxXb8UciyPFX0+nlbm+jGEhTz9EAL5
	jiFpCPPM8cQ28YJxtBreOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749212067; x=
	1749298467; bh=Z84X3cRTGcgyKLWc3Ch2d3gKywmMCUsq5T9sb22yUnc=; b=P
	NPEKMyg3FRtMV8A4wkk34z5RvhEautqc8vzquGY3XO+73VZTGpAXcfPXHvZL3rLt
	vHj3H3JjZTw3nfc3t1rEOsXBfewfMu3KkKc0RA2VGqmmVQwIoyLJ08Pa2cDUgyh8
	zFGcS3T+3EpLYbYe35hFWSXUTuyX4XpCSQ23fOGoDMtfIvOC+PmNtcgfEVYVgLFF
	ZPuharY6rsyuz0Q8GNyeIvgaGucamxAj2JsiK0DM308mLrIVOsI0MoDUIsf4AsyV
	dE3tbZvdQKBwY4/SDHpB16WQPI8rz2S1dVrh3Yyr4c8v1Dpe+RHPewrgCI4hloLl
	vpjm6FfW9qTDJRoacsq/w==
X-ME-Sender: <xms:o9tCaBEBwj0Q4fk7HDm81DC1uuko__A5H5JoFK7UBONMmJ71c3ae7g>
    <xme:o9tCaGXWMZq4pfe2iO3PniPSsB5AsfAtiDC_qq2OgQazGNS9jKQyxNPgzzqiuBrPp
    iYZ4w9DBsPgpoptQ3c>
X-ME-Received: <xmr:o9tCaDJfU6B-IK-D3yYFVyy8TWTl0shns41RvFCfVM3Z_OdVabQMnOeApmdwDBatTdpyAx105h7V-HzwUtDLNb5bwjfR9eTFag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeelfefg
    tddtleeljeeuuddvteefledtfeefjeduheeiffffudetgeejieegffduffenucffohhmrg
    hinheptghsihdvrdhvtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeht
    ohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpth
    htoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepmhgthhgvhhgrsgdohhhurgifvghisehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgr
    rhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsg
    horghrugdrtghomh
X-ME-Proxy: <xmx:o9tCaHHgAY6QDNBtpiE_O6LFSt5zoeC3FS0d4USW4j-fy6Wr6-xExA>
    <xmx:o9tCaHXa4UjxDh1sFNvGTE5UgWjQfRtfd-Xi4IZpxw1U-e_uVujb4g>
    <xmx:o9tCaCO-MU3D2pgZE5joK7Aslm5TDdxkOvtiWe6ecYfDoT6B-i3qvg>
    <xmx:o9tCaG344qOcGofRsXHEBgCUV8MNFCYemiogFMPXVTfqUmWKxPXWbA>
    <xmx:o9tCaCbtjMunXHy-6cg0GIBaSqJCiLpOtp3NwNQis3X-TgBcZ9dBCGmd>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 08:14:27 -0400 (EDT)
Date: Fri, 6 Jun 2025 14:14:26 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 10/15] media: rcar-csi2: Add .get_frame_desc op
Message-ID: <20250606121426.GG2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-10-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-10-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2025-05-30 16:50:39 +0300, Tomi Valkeinen wrote:
> Add v4l2_subdev_pad_ops.get_frame_desc() implementation.
> 
> We also implement a fallback for the case where the upstream subdevice
> does not implement .get_frame_desc. It assumes a single stream with VC =
> 0 and DT based on the configured stream mbus format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 56 ++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 20bd44274bd2..65c7f3040696 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1676,12 +1676,68 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
> +					 unsigned int pad,
> +					 struct v4l2_mbus_frame_desc *fd)
> +{
> +	const struct rcar_csi2_format *format;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
> +	if (!fmt) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	format = rcsi2_code_to_fmt(fmt->code);
> +	if (!format) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	fd->num_entries = 1;
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].pixelcode = fmt->code;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = format->datatype;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	int ret;
> +
> +	if (WARN_ON(!priv->info->use_isp))
> +		return -ENOTTY;

This looks odd, why can't we support the frame descriptor and streams on 
Gen3 that do not use the ISP Channel Selector?

> +
> +	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
> +	if (ret == -ENOIOCTLCMD)
> +		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
> +	return ret;
> +}
> +
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.enable_streams = rcsi2_enable_streams,
>  	.disable_streams = rcsi2_disable_streams,
>  
>  	.set_fmt = rcsi2_set_pad_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
> +
> +	.get_frame_desc = rcsi2_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

