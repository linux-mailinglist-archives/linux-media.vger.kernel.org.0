Return-Path: <linux-media+bounces-10833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F438BC927
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D5781C2149E
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 08:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553C4140E22;
	Mon,  6 May 2024 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mSuLoJ0z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B5142ABE;
	Mon,  6 May 2024 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714983008; cv=none; b=RmzgGP9yHmNQIc98ANF++/rmY91XYyx0G6IFIMYHIfHNgQ18YC4beBMPild0zyKtbDdrcFxYaSEDfRrC34tmApMaXyvsSbUaFb8MJSgYimWqkVL0gEJ0HblzDuco5HAPNjG91QQ5sJlhlqtPaVwwxnQHj6zZImKP/OvBMW+8pLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714983008; c=relaxed/simple;
	bh=uueVkEXQte2dtsPHgPjLO2lMWWjMZz5UrumdaJwjjz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjWuZtQAEOB9JGNHDAm+k8hwi33ddnJcLVt5FPUaIxQF9XeYSh0JeVsZKyPvyl7cQJcH3LS0MAN++nXzjwIVKUqiGtjvvV5FTUmAmtWSqLFGUP6PTmIL1OD7vLNM6WMFx4slSMousIlNm3vISf1YSewjXHvdmpVm1LlnxpWVzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mSuLoJ0z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 324301014;
	Mon,  6 May 2024 10:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714983003;
	bh=uueVkEXQte2dtsPHgPjLO2lMWWjMZz5UrumdaJwjjz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSuLoJ0z6YXctAxIM1W5cNm8PteGGG2eQY2xpEUxJjdNImsPZtOOwr7IM6shbbNP6
	 BHQWP4XW1c3iYUnAxbRwpSQ78yGoIslrVEfUBwScCs4rftj6w/gC7eFr0aHCdk0rdX
	 3H9qIW6brzsD8/3QKGxY9ANw7cOGHV+zct/DaErk=
Date: Mon, 6 May 2024 10:10:00 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/11] media: adv748x-csi2: Implement enum_mbus_codes
Message-ID: <lj7mhgt62wzkdoqdforp7dyztwyn5xiz4jwjrxsqjkfq5aeqo5@t2g7o5dd6ual>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-7-jacopo.mondi@ideasonboard.com>
 <20240505210740.GD23227@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240505210740.GD23227@pendragon.ideasonboard.com>

Hi Laurent

On Mon, May 06, 2024 at 12:07:40AM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Fri, May 03, 2024 at 05:51:21PM +0200, Jacopo Mondi wrote:
> > Define a list of supported mbus codes for the TXA and TXB CSI-2
> > transmitters and implement the enum_mbus_code operation.
>
> The commit message should explain why, not just what. Explaining why the

Should I explain why the driver has to implement enum_mbus_codes ?

> formats for TXA and TXB differ would also be useful.

ok

>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/adv748x/adv748x-csi2.c | 35 ++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > index 9da7f6742a2b..219417b319a6 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > @@ -21,6 +21,18 @@ static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
> >  	.field = V4L2_FIELD_NONE,
> >  };
> >
> > +static const unsigned int adv748x_csi2_txa_fmts[] = {
> > +	MEDIA_BUS_FMT_YUYV8_1X16,
> > +	MEDIA_BUS_FMT_YUYV10_1X20,
>
> CSI-2 uses UYVY, not YUYV.
>

As this a recurring comment in the series (rightfully, I'm not
questioning that) how does it work with existing test scripts assuming
YUYV ? The same question could be asked about the issue Niklas had: is
changing what pad an operation is allowed to be called on legit ?

My answer would be yes, otherwise we'll be forever stuck, but I would
like to check, especially with Niklas which maintains vin-tests.

> > +	MEDIA_BUS_FMT_RGB565_1X16,
> > +	MEDIA_BUS_FMT_RGB666_1X18,
> > +	MEDIA_BUS_FMT_RGB888_1X24,
> > +};
> > +
> > +static const unsigned int adv748x_csi2_txb_fmts[] = {
> > +	MEDIA_BUS_FMT_YUYV8_1X16,
> > +};
> > +
> >  int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
> >  {
> >  	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
> > @@ -146,6 +158,28 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
> >   * But we must support setting the pad formats for format propagation.
> >   */
> >
> > +static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
> > +				       struct v4l2_subdev_state *sd_state,
> > +				       struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> > +	const unsigned int *codes = is_txa(tx) ?
> > +				    adv748x_csi2_txa_fmts :
> > +				    adv748x_csi2_txb_fmts;
> > +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> > +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> > +
> > +	if (code->pad != ADV748X_CSI2_SOURCE)
> > +		return -EINVAL;
> > +
> > +	if (code->index >= num_fmts)
> > +		return -EINVAL;
> > +
> > +	code->code = codes[code->index];
> > +
> > +	return 0;
> > +}
> > +
> >  static struct v4l2_mbus_framefmt *
> >  adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
> >  			    struct v4l2_subdev_state *sd_state,
> > @@ -235,6 +269,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
> > +	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
> >  	.get_fmt = adv748x_csi2_get_format,
> >  	.set_fmt = adv748x_csi2_set_format,
> >  	.get_mbus_config = adv748x_csi2_get_mbus_config,
>
> --
> Regards,
>
> Laurent Pinchart

