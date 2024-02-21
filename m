Return-Path: <linux-media+bounces-5513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3F85CC80
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 01:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A070E1C20D1D
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 00:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B855AA35;
	Wed, 21 Feb 2024 00:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="sL4ypquH"
X-Original-To: linux-media@vger.kernel.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A52368;
	Wed, 21 Feb 2024 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708473817; cv=none; b=N1bsp45cQPfN9xneprMQdki8LrfIWYstMXALJf02RTJ7jziNr7eiCbg5eoDBwJNMBxJv2izXiBRWO80Lwg86/PRxwMkiDpGzyWZtnbsvBiTA19vSMzSGjXcaydGqEwhMBqG3/5CF3ERcavA289XNGmiMvkY11QsGa7eJH1m6PHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708473817; c=relaxed/simple;
	bh=6lvUn+C/j0fNP/8+yUQCN4/RJ9aVo+rUL+TbSe1ZyHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=md8nTyoUxMo9G+uawYsr5boqXpJIhKYRmCBxe1ni1rtyJQW9+C2WncuTVQ29xLYU1fgkz5ZcFRMWKeZtPS3sTNJnRBngPmF/zXncrQpPi5a1ZZVaiJ51NziurUumjm65fbEJo0nQWDQvqY2hVXJ3lktjAkvovdTDav0NsupXmBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=sL4ypquH; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1708473395; bh=6lvUn+C/j0fNP/8+yUQCN4/RJ9aVo+rUL+TbSe1ZyHY=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=sL4ypquHKN/JkzV80/vKNTwPeMicgmxFiuC1sY0sip6Qs4CUb0J2v3ur2tEs2MPRK
	 AgjUlfMS3z48Msi8go3PHSbx5RPCX1GLI5eipvOahjGa6PCYrOkygFiKOSI+Xt/HXo
	 zvfEa7F8C/uux9OZEuOTHQIpQ82iCrYOAX1Z3Jrk=
Date: Wed, 21 Feb 2024 00:56:34 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, 
	Adam Ford <aford173@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-kernel@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>, 
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: rkisp1: Allow higher input resolution
Message-ID: <amx55bzbmbuvuroulrsv5dxdlmsm7f32srut2e7ivpybl2lzze@ehonmk7wlowt>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Paul Elder <paul.elder@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Adam Ford <aford173@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-kernel@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>, 
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240217185202.1754750-1-megi@xff.cz>
 <20240218205908.GA12766@pendragon.ideasonboard.com>
 <pftafukuzq7qzbhlvwtmeg3mburnttylgy4246timlghtrdgx4@r6munvmj6oqt>
 <CAHCN7x+zi3WxnY-mxZFKePs1cS=-DprEmh_CnypJ4XK7xBzjMQ@mail.gmail.com>
 <b500676e-431f-40fc-868b-9f9bb359a109@ideasonboard.com>
 <ZdMpSLqYVFbU7sF0@pyrite.rasen.tech>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdMpSLqYVFbU7sF0@pyrite.rasen.tech>

On Mon, Feb 19, 2024 at 07:11:20PM +0900, Paul Elder wrote:
> On Mon, Feb 19, 2024 at 02:33:21PM +0530, Umang Jain wrote:
> > Hi All,
> > 
> > On 19/02/24 7:39 am, Adam Ford wrote:
> > > On Sun, Feb 18, 2024 at 3:02 PM Ondřej Jirman <megi@xff.cz> wrote:
> > > > On Sun, Feb 18, 2024 at 10:59:08PM +0200, Laurent Pinchart wrote:
> > > > > Hi Ondrej,
> > > > > 
> > > > > (CC'ing Paul and Umang)
> > > > > 
> > > > > Thank you for the patch.
> > > > > 
> > > > > On Sat, Feb 17, 2024 at 07:51:58PM +0100, Ondřej Jirman wrote:
> > > > > > From: Ondrej Jirman <megi@xff.cz>
> > > > > > 
> > > > > > In BSP driver, it is allowed, and it works in practice. Tested on
> > > > > > Pinephone Pro/RK3399 with IMX258 at full res.
> > > > > Paul, Umang, do I recall correctly that you have a similar change ?
> > > > > Could you review and test this (especially on the i.MX8MP) ?
> > > > It's also a limit from the datasheet, so the change should not be that
> > > > controversial:
> > > > 
> > > >    https://megous.com/dl/tmp/d2b333043ecebaf3.png
> > > > 
> > > > (so that it doesn't sound like I just copied the BSP values)
> > > > 
> > >  From what I see in the i.MX8M Plus reference manual, it has a max
> > > resolution of 4096x3072, so it might be necessary to move this off
> > 
> > This is what I (and I assume Paul too) have been working with on i.MX8M
> > Plus. So it's the known and tested value of max ISP input from out side.
> > > from a #define into a structure that varies by product family.
> 
> Yes, this is what needs to be done. Here's what I have in my notes:
> 
> - The RK3399 TRM says 4416x3312 max input and output on main path, with
>   1920x1080 max output on self path.
> - The PX30 datasheet [1] says 3264x2448 max input and output on main
>   path, with 1920x1080 max output on self path.
> - The RK3288 documentation [2] (under "Camera Interface and Image
>   Processor") says 4416x3312 max input and output on main path, with
>   1920x1080 max output on self path.
> - The i.MX8MP reference manual (the open one) [3] (in table 13-1) says
>   4096x3072 max resolution in single ISP mode

Yeah, RKISP1_RSZ_SP_SRC_MAX_HEIGHT in the driver also seems weird in
this respect:

  #define RKISP1_RSZ_SP_SRC_MAX_WIDTH             1920
  #define RKISP1_RSZ_SP_SRC_MAX_HEIGHT            1920

regards,
	o.

> The i.MX8M Plus seems to indeed be limited to 4096x3072, but the TPG is
> capable of generating 4416x3312, and the ISP works fine in bypass (and
> therefore raw) mode, so technically it has different maximum sizes
> depending on the format which makes this more exciting.
> 
> In any case, the PX30 (assuming the datasheet is correct) only supports
> up to 3264x2448, so the existing #define is incorrect anyway.
> 
> I don't have a PX30 nor an RK3288 so I can't test those, and I haven't
> set up my OV64A40 yet which (I've heard) can be used to test even bigger
> resolutions.
> 
> 
> Paul
> 
> [1] https://opensource.rock-chips.com/images/8/87/Rockchip_PX30_Datasheet_V1.4-20191227.pdf
> [2] https://opensource.rock-chips.com/images/4/49/Rockchip_RK3288_Datasheet_V2.7-20191227.pdf
> [3] (requires login) https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-8-applications-processors/i-mx-8m-plus-arm-cortex-a53-machine-learning-vision-multimedia-and-industrial-iot:IMX8MPLUS
> 
> 
> > 
> > Yeah!
> > > 
> > > adam
> > > > regards,
> > > >          o.
> > > > 
> > > > > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > > > > ---
> > > > > >   drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 4 ++--
> > > > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > > > index 4b6b28c05b89..74098ddbeeb3 100644
> > > > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > > > @@ -33,8 +33,8 @@ struct dentry;
> > > > > >   #define RKISP1_ISP_SD_SINK                 BIT(1)
> > > > > > 
> > > > > >   /* min and max values for the widths and heights of the entities */
> > > > > > -#define RKISP1_ISP_MAX_WIDTH                       4032
> > > > > > -#define RKISP1_ISP_MAX_HEIGHT                      3024
> > > > > > +#define RKISP1_ISP_MAX_WIDTH                       4416
> > > > > > +#define RKISP1_ISP_MAX_HEIGHT                      3312
> > > > > >   #define RKISP1_ISP_MIN_WIDTH                       32
> > > > > >   #define RKISP1_ISP_MIN_HEIGHT                      32
> > > > > > 
> > > > > --
> > > > > Regards,
> > > > > 
> > > > > Laurent Pinchart
> > 

