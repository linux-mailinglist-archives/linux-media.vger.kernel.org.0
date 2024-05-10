Return-Path: <linux-media+bounces-11280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6918C1E2F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 159B21F227CA
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 06:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99B756B9C;
	Fri, 10 May 2024 06:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qFmq/hcB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B01361;
	Fri, 10 May 2024 06:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715323023; cv=none; b=T9E0pgNC1bKQ+XrcaaJCkI0LIeq8Fcj+sZv6413wMXHgt9udN6DB8bYZ3LW9xFFxmIR4aiYvf6JCcWG1eI+Pyi/SNicSVoHxcbGFSsedsxqJAm/405QaESnht51jQomy5Gq0pf9m1hIKWdQoDIHvaY7h8iie1M4q9M8gZfgnlFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715323023; c=relaxed/simple;
	bh=ClGh93yuLpSaGUX6XnzXxE56MkXQZYtxPLHtYh3ikJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gC5jtCEfWs2yotSlDNhDSqhbXfHdqKiznnQBoHVa+CTIE2HCs1DhM4vlmMigkhIpaTWL/JCeDatss6D35Tyh65jAJR8nfmn9tnLDi75TOqs1+F308NBBIHjEfOokCPeMBpbKmEk7KPbvsVPVFPicy7fx8kMR4rILH0q3+ZLwQV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qFmq/hcB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi [91.158.144.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDDC5397;
	Fri, 10 May 2024 08:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715323013;
	bh=ClGh93yuLpSaGUX6XnzXxE56MkXQZYtxPLHtYh3ikJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qFmq/hcBndQ9bg5wUG6OKwNp0UxRw85KYGxn/fUMMq9clH64zGRAfZg9UYuuPnLuN
	 H67ify6nPB7qoesTUOLyT4/zw2BBy6Z0N0uQesaJGQINmMR3PTKtPm5VWaJpW3cLQ+
	 0MoSg5KIS3OBD2HFtuunqKv2VN7vKM9Hp5mupXQI=
Message-ID: <1fc8609d-a85d-461a-acbb-50d6637d79b8@ideasonboard.com>
Date: Fri, 10 May 2024 09:36:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: rkisp1: Mark subdev state pointers as const
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna@fastmail.com>, linux-rockchip@lists.infradead.org
References: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240508214045.24716-4-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240508214045.24716-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2024 00:40, Laurent Pinchart wrote:
> Several subdev state pointers are used to access the state read-only.
> Mark them as const.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c     | 8 ++++----
>   drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 8 ++++----
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index e45a213baf49..91301d17d356 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -173,7 +173,7 @@ static void rkisp1_gasket_disable(struct rkisp1_device *rkisp1)
>    * or at the frame end interrupt
>    */
>   static void rkisp1_config_ism(struct rkisp1_isp *isp,
> -			      struct v4l2_subdev_state *sd_state)
> +			      const struct v4l2_subdev_state *sd_state)
>   {
>   	const struct v4l2_rect *src_crop =
>   		v4l2_subdev_state_get_crop(sd_state,
> @@ -201,7 +201,7 @@ static void rkisp1_config_ism(struct rkisp1_isp *isp,
>    * configure ISP blocks with input format, size......
>    */
>   static int rkisp1_config_isp(struct rkisp1_isp *isp,
> -			     struct v4l2_subdev_state *sd_state,
> +			     const struct v4l2_subdev_state *sd_state,
>   			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
>   {
>   	struct rkisp1_device *rkisp1 = isp->rkisp1;
> @@ -309,7 +309,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>   	if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
>   		rkisp1_params_disable(&rkisp1->params);
>   	} else {
> -		struct v4l2_mbus_framefmt *src_frm;
> +		const struct v4l2_mbus_framefmt *src_frm;
>   
>   		src_frm = v4l2_subdev_state_get_format(sd_state,
>   						       RKISP1_ISP_PAD_SOURCE_VIDEO);
> @@ -429,7 +429,7 @@ static void rkisp1_config_clk(struct rkisp1_isp *isp)
>   }
>   
>   static int rkisp1_isp_start(struct rkisp1_isp *isp,
> -			    struct v4l2_subdev_state *sd_state,
> +			    const struct v4l2_subdev_state *sd_state,
>   			    struct media_pad *source)
>   {
>   	struct rkisp1_device *rkisp1 = isp->rkisp1;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index 6f3931ca5b51..1fa991227fa9 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> @@ -135,11 +135,11 @@ static void rkisp1_dcrop_disable(struct rkisp1_resizer *rsz,
>   
>   /* configure dual-crop unit */
>   static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz,
> -				struct v4l2_subdev_state *sd_state)
> +				const struct v4l2_subdev_state *sd_state)
>   {
>   	struct rkisp1_device *rkisp1 = rsz->rkisp1;
> -	struct v4l2_mbus_framefmt *sink_fmt;
> -	struct v4l2_rect *sink_crop;
> +	const struct v4l2_mbus_framefmt *sink_fmt;
> +	const struct v4l2_rect *sink_crop;
>   	u32 dc_ctrl;
>   
>   	sink_crop = v4l2_subdev_state_get_crop(sd_state, RKISP1_RSZ_PAD_SINK);
> @@ -264,7 +264,7 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
>   }
>   
>   static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> -			      struct v4l2_subdev_state *sd_state,
> +			      const struct v4l2_subdev_state *sd_state,
>   			      enum rkisp1_shadow_regs_when when)
>   {
>   	const struct rkisp1_rsz_yuv_mbus_info *sink_yuv_info, *src_yuv_info;


