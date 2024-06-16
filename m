Return-Path: <linux-media+bounces-13340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FF790A0B7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A69491C2103B
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705B07345E;
	Sun, 16 Jun 2024 23:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CfF210QG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739CA6CDA1;
	Sun, 16 Jun 2024 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579221; cv=none; b=SmpBtuYvnB3H+L0uPFrGqBozgAYUDMXCOREUfRbCbs3QfDOfZ3a9kcdTlyofiN/egkY3x3/JMsuTVJ3XKbJG69LPP07Tw5sg+rVV31SaIczSsLnjIm8be1ovQAuDI3nFIZxKif+ggQf8mNkgPUNMmNx/ze40vc8SEuRlB/bYf2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579221; c=relaxed/simple;
	bh=x3iLr4pxiW1iwZt2c4UPNvZuHqSRbqVJimekOnRYvQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1ajXr1NFopmqK9fXD2EwhEDlRNJ5TlnTkGdu8HQTn2NT39ZUkWhKWNT7Qj4Cs3if4M388YpG1osiPYkKUAlEVhamnpplJADP3BiaZIpxaOf8DsWiqVjlVCr6tXmMz3s3Xgq6diqZIx4t2w0s1v4aXL9BxB7aQbNI/SP+roUDvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CfF210QG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 485762D5;
	Mon, 17 Jun 2024 01:06:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579202;
	bh=x3iLr4pxiW1iwZt2c4UPNvZuHqSRbqVJimekOnRYvQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfF210QGlM2gyaAff5TugzqxOQZ9MD/O9n7sv6xlHFVuroMRH8l/fBDAhWWvN/k4o
	 /ei/dM12AofyvRCK4WweoS25WzsE05bjMsNKo63xOivviQtbTS4vyc5Uo9rT8iJQXG
	 1e9WtPrID5xm9i8RW5c4aPKpziL2oXwI1AD++2VU=
Date: Mon, 17 Jun 2024 02:06:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] media: uvcvideo: Allow custom control mapping
Message-ID: <20240616230637.GE4782@pendragon.ideasonboard.com>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
 <20240610-billion-v2-1-38e861475f85@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610-billion-v2-1-38e861475f85@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Jun 10, 2024 at 11:09:52PM +0000, Ricardo Ribalda wrote:
> Some advanced controls might not be completely implemented by vendors.
> 
> If the controls are a enumeration, UVC does not gives a way to probe
> what is implemented and what is not.
> 
> Let's create a new callback function where heuristics can be implemented
> to detect what is implemented and what not.
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 10 +++++++++-
>  drivers/media/usb/uvc/uvcvideo.h |  5 +++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e59a463c2761..44ec185a8c8b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2360,7 +2360,7 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
>  /*
>   * Add a control mapping to a given control.
>   */
> -static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> +static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
>  {
>  	struct uvc_control_mapping *map;
> @@ -2434,6 +2434,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	return -ENOMEM;
>  }
>  
> +static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> +	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
> +{
> +	if (mapping && mapping->add_mapping)
> +		return mapping->add_mapping(chain, ctrl, mapping);
> +	return __uvc_ctrl_add_mapping_to_list(chain, ctrl, mapping);
> +}
> +
>  int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	const struct uvc_control_mapping *mapping)
>  {
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 6fb0a78b1b00..fa0396dd5b35 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -84,7 +84,9 @@
>  
>  struct gpio_desc;
>  struct sg_table;
> +struct uvc_control;
>  struct uvc_device;
> +struct uvc_video_chain;
>  
>  /*
>   * TODO: Put the most frequently accessed fields at the beginning of
> @@ -123,6 +125,9 @@ struct uvc_control_mapping {
>  	s32 master_manual;
>  	u32 slave_ids[2];
>  
> +	int (*add_mapping)(struct uvc_video_chain *chain,
> +			   struct uvc_control *ctrl,
> +			   const struct uvc_control_mapping *mapping);
>  	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
>  		   const u8 *data);
>  	void (*set)(struct uvc_control_mapping *mapping, s32 value,

-- 
Regards,

Laurent Pinchart

