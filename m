Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70E4FDF04A
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 16:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbfJUOrs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 21 Oct 2019 10:47:48 -0400
Received: from mailoutvs56.siol.net ([185.57.226.247]:52165 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726289AbfJUOrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 10:47:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 9BF3452273D;
        Mon, 21 Oct 2019 16:47:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3LVhTk5es8hh; Mon, 21 Oct 2019 16:47:44 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 334C352273A;
        Mon, 21 Oct 2019 16:47:44 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id C25E052273D;
        Mon, 21 Oct 2019 16:47:43 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 5/6] media: sun4i: Add H3 deinterlace driver
Date:   Mon, 21 Oct 2019 16:47:43 +0200
Message-ID: <2174547.3yqp6rY4Nl@jernej-laptop>
In-Reply-To: <8137fbb3-036a-95e4-2642-5dd46fb55eb9@xs4all.nl>
References: <20191017183738.68069-1-jernej.skrabec@siol.net> <20191017183738.68069-6-jernej.skrabec@siol.net> <8137fbb3-036a-95e4-2642-5dd46fb55eb9@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 21. oktober 2019 ob 13:13:20 CEST je Hans Verkuil napisal(a):
> On 10/17/19 8:37 PM, Jernej Skrabec wrote:
> > Allwinner H3 SoC contains deinterlace unit, which has several modes of
> > operation - bypass, weave, bob and mixed (advanced) mode. I don't know
> > how mixed mode works, but according to Allwinner it gives best results,
> > so they use it exclusively. Currently this mode is also hardcoded here.
> > 
> > For each interleaved frame queued, this driver produces 2 deinterlaced
> > frames. Deinterlaced frames are based on 2 consequtive output buffers,
> > except for the first 2, where same output buffer is given to peripheral
> > as current and previous.
> > 
> > There is no documentation for this core, so register layout and fixed
> > values were taken from BSP driver.
> > 
> > I'm not sure if maximum size of the image unit is capable to process is
> > governed by size of "flag" buffers, frequency or it really is some HW
> > limitation. Currently driver can process full HD image in ~15ms (7.5ms
> > for each capture buffer), which allows to process 1920x1080@60i video
> > smoothly in real time.
> > 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  MAINTAINERS                                   |    7 +
> >  drivers/media/platform/Kconfig                |   12 +
> >  drivers/media/platform/sunxi/Makefile         |    1 +
> >  .../media/platform/sunxi/sun8i-di/Makefile    |    2 +
> >  .../media/platform/sunxi/sun8i-di/sun8i-di.c  | 1028 +++++++++++++++++
> >  .../media/platform/sunxi/sun8i-di/sun8i-di.h  |  237 ++++
> >  6 files changed, 1287 insertions(+)
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-di/Makefile
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c7b48525822a..c375455125fb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4646,6 +4646,13 @@ M:	"Maciej W. Rozycki" <macro@linux-mips.org>
> > 
> >  S:	Maintained
> >  F:	drivers/net/fddi/defxx.*
> > 
> > +DEINTERLACE DRIVERS FOR ALLWINNER H3
> > +M:	Jernej Skrabec <jernej.skrabec@siol.net>
> > +L:	linux-media@vger.kernel.org
> > +T:	git git://linuxtv.org/media_tree.git
> > +S:	Maintained
> > +F:	drivers/media/platform/sunxi/sun8i-di/
> 
> This is missing the bindings file added in the previous patch.

Well, I listed Maxime and Chen-Yu as binding maintainers in patch 4, so that's 
why I didn't include it here. If you think I should be maintainer of that 
binding too, I can change that. I took sun6i-csi as example where binding 
maintainers are Maxime and Chen-Yu and driver maintainer is Yong Deng.

Best regards,
Jernej

> 
> Regards,
> 
> 	Hans
> 
> > +
> > 
> >  DELL SMBIOS DRIVER
> >  M:	Pali Rohár <pali.rohar@gmail.com>
> >  M:	Mario Limonciello <mario.limonciello@dell.com>




