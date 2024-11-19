Return-Path: <linux-media+bounces-21576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D3F9D21C6
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E19A92858D5
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 08:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E577C1991B4;
	Tue, 19 Nov 2024 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dVrn11Mj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD09812CDAE;
	Tue, 19 Nov 2024 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732005877; cv=none; b=Sg44SVLc2bBjo0CJJUuqwi8Tivpk3lJSx7/44P7EWraP4BcqzRqgMIsUsqsOS1QKon0SFNsBHx5H/ZEdfq9QlP+ieZvfqVnrktSCaG1kL3MQ8zWzRU+Cy6evqhpK/ytQfjtaGHM+FuxLqaQzQRyOk/yaPanS+y6Yq6QakEmeLms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732005877; c=relaxed/simple;
	bh=QcpDfBoVkb+QZjrtYYcXpzP58I43mTNNLH/ELm/Qjx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RucbgIvnnkYqmqPqwTYN8XKiRBAcqOa95RcqtKmo3p6x9oPPRw1dbeRIGnMJ9vugArJ+G6vVSneTA/953wuakkBHRuAdHRYWMaNHn4NAuScAX6hdmpROYYKoDYUXFyhFerYip3lLF3rN9CxR3eEQXHF79TRkFtHoewxXwJUuS34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dVrn11Mj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00578D52;
	Tue, 19 Nov 2024 09:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732005850;
	bh=QcpDfBoVkb+QZjrtYYcXpzP58I43mTNNLH/ELm/Qjx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVrn11Mjv+tYY13PIbhrigc4/F8b8GVkr+aY0OGWT7MFuMNb1iVKxfNIsuTn8cTmU
	 fKiIcwjepZLBIt1xccEO/ygiV64xyrzyKk4z8KaTPzdjU0EGwx0deBykAJQs+5aHKd
	 oiYeRY/QGXMvDiL/R96kgZjyGaVNnW9VkrZ84Nf4=
Date: Tue, 19 Nov 2024 09:44:19 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>, 
	dafna@fastmail.com, linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 media-next] media: rkisp1: Fix unused value issue
Message-ID: <fsjezolrkejn7ekcq2fpfiics3y4iliisakbswbknun3evkfk6@vwxra4edj3nb>
References: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>
 <20241119075944.GA31681@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119075944.GA31681@pendragon.ideasonboard.com>

HI Dheeraj

On Tue, Nov 19, 2024 at 09:59:44AM +0200, Laurent Pinchart wrote:
> Hi Dheeraj,
>
> Thank you for the patch.
>
> On Tue, Nov 19, 2024 at 12:56:53PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > This commit fixes an unused value issue detected by Coverity (CID
> > 1519008). The error condition for the invalid MIPI CSI-2 is not
> > properly handled as the break statement would only exit the switch block
> > and not the entire loop. Fixed this by returning the error immediately
> > after the switch block.
>
> The patch doesn't "return immediately". You can write "Fix this by
> breaking from the look immediately after the switch block when an error
> occurs." or something similar.
>
> >
> > 'Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
> > optional")'
>
> The Fixes tag should be formatted on a single line, without outer
> quotes, and without a blank line between it and the Signed-off-by line:
>
> Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")
>
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
>
> I can update the commit message when applying the patch, there's no need
> to submit a v5, unless if you want to. Please let me know if I should
> take this version and update the commit message, or if you will send a
> v5.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

And when you receive a tag in a previous patch version, please carry
it over to the next version you'll send ;)

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index dd114ab77800..9ad5026ab10a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> >  			break;
> >  		}
> >
> > +		if (ret)
> > +			break;
> > +
> >  		/* Parse the endpoint and validate the bus type. */
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  		if (ret) {
>
> --
> Regards,
>
> Laurent Pinchart
>

