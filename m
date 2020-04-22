Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C181B46CC
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 16:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgDVOGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 10:06:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:43076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgDVOGh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 10:06:37 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 973282077D;
        Wed, 22 Apr 2020 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587564396;
        bh=hnfD5flNiiNWgsc8kUqJcYA1AVMFiXNsm/3nr4gUEw4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=biwsd5Gs3I+ESWnZk53/8oTTY1L1P/QItvUp1xpsOwAKXiEGSTNy38zBXWw25oG70
         FDJsf5Xj0mqj7pQ/lhmA7cXZ4Pv+vpPsLyBm9Xt+SX9zvaYKtCHAck36aeIslb5GRc
         t3x1LwvFhY2qE9I+zjUjTCTH8C5TQ7QSV3LM0JOM=
Date:   Wed, 22 Apr 2020 16:06:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Heiko Stuebner <heiko@sntech.de>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] media: MAINTAINERS: Fix Hantro, Rga and Rkvdec entries
Message-ID: <20200422160631.74390a06@coco.lan>
In-Reply-To: <73d3d8c1-1952-aeb1-5bc0-829503cf29bd@gmail.com>
References: <20200422111403.19114-1-ezequiel@collabora.com>
        <73d3d8c1-1952-aeb1-5bc0-829503cf29bd@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 22 Apr 2020 14:01:41 +0200
Johan Jonker <jbx6244@gmail.com> escreveu:

> Hi Ezequiel,
> 
> On 4/22/20 1:14 PM, Ezequiel Garcia wrote:
> > It seems recent merges introduced a couple issues
> > here, so let's fix them all. Also, reorder Rockchip
> > video decoder as per parse-maintainers.pl script
> > and add linux-rockchip mailing list.
> > 
> > Reported-by: Johan Jonker <jbx6244@gmail.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  MAINTAINERS | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 09e0137df61d..4d5b06c6fe0f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7460,7 +7460,7 @@ L:	linux-media@vger.kernel.org
> >  L:	linux-rockchip@lists.infradead.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > -F:	Documentation/devicetree/bindings/media/rockchip-vpu.txt
> > +F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> >  F:	drivers/staging/media/hantro/
> >  
> >  HARD DRIVE ACTIVE PROTECTION SYSTEM (HDAPS) DRIVER
> > @@ -14465,13 +14465,6 @@ F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
> >  F:	drivers/hid/hid-roccat*
> >  F:	include/linux/hid-roccat*
> >  
> > -ROCKCHIP VIDEO DECODER DRIVER
> > -M:	Ezequiel Garcia <ezequiel@collabora.com>
> > -L:	linux-media@vger.kernel.org
> > -S:	Maintained
> > -F:	drivers/staging/media/rkvdec/
> > -F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > -
> >  ROCKCHIP ISP V1 DRIVER
> >  M:	Helen Koike <helen.koike@collabora.com>
> >  L:	linux-media@vger.kernel.org  
> 
> L:	linux-rockchip@lists.infradead.org
> 
> > @@ -14483,12 +14476,19 @@ ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
> >  M:	Jacob Chen <jacob-chen@iotwrt.com>
> >  M:	Ezequiel Garcia <ezequiel@collabora.com>
> >  L:	linux-media@vger.kernel.org
> > +L:	linux-rockchip@lists.infradead.org
> >  S:	Maintained
> > -F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> >  F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > -F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> >  F:	drivers/media/platform/rockchip/rga/
> >  
> > +ROCKCHIP VIDEO DECODER DRIVER
> > +M:	Ezequiel Garcia <ezequiel@collabora.com>
> > +L:	linux-media@vger.kernel.org
> > +L:	linux-rockchip@lists.infradead.org
> > +S:	Maintained  
> 
> > +F:	drivers/staging/media/rkvdec/
> > +F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml  
> 
> When I look at the other entries 'drivers/' is sort below 'Documentation/'.
> 
> ./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS
> --order

Good point. It would be cool if checkpatch.pl could call it in order
to verify if MAKEFILE changes are at the right order.

As I noticed other fields that are out of the order on media,
due to some changes that didn't arrive upstream yet, I'll fix
them all on a single patch.

Thanks,
Mauro
