Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D26E1B4704
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 16:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgDVOT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 10:19:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46408 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgDVOT1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 10:19:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 7BCB82A1EA1
Message-ID: <c61815a2872c5092c72ccbf9656a2bd6501810a4.camel@collabora.com>
Subject: Re: [PATCH] media: MAINTAINERS: Fix Hantro, Rga and Rkvdec entries
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johan Jonker <jbx6244@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Heiko Stuebner <heiko@sntech.de>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Date:   Wed, 22 Apr 2020 11:19:17 -0300
In-Reply-To: <20200422160631.74390a06@coco.lan>
References: <20200422111403.19114-1-ezequiel@collabora.com>
         <73d3d8c1-1952-aeb1-5bc0-829503cf29bd@gmail.com>
         <20200422160631.74390a06@coco.lan>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-04-22 at 16:06 +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 22 Apr 2020 14:01:41 +0200
> Johan Jonker <jbx6244@gmail.com> escreveu:
> 
> > Hi Ezequiel,
> > 
> > On 4/22/20 1:14 PM, Ezequiel Garcia wrote:
> > > It seems recent merges introduced a couple issues
> > > here, so let's fix them all. Also, reorder Rockchip
> > > video decoder as per parse-maintainers.pl script
> > > and add linux-rockchip mailing list.
> > > 
> > > Reported-by: Johan Jonker <jbx6244@gmail.com>
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  MAINTAINERS | 20 ++++++++++----------
> > >  1 file changed, 10 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 09e0137df61d..4d5b06c6fe0f 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7460,7 +7460,7 @@ L:	linux-media@vger.kernel.org
> > >  L:	linux-rockchip@lists.infradead.org
> > >  S:	Maintained
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > -F:	Documentation/devicetree/bindings/media/rockchip-vpu.txt
> > > +F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > >  F:	drivers/staging/media/hantro/
> > >  
> > >  HARD DRIVE ACTIVE PROTECTION SYSTEM (HDAPS) DRIVER
> > > @@ -14465,13 +14465,6 @@ F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
> > >  F:	drivers/hid/hid-roccat*
> > >  F:	include/linux/hid-roccat*
> > >  
> > > -ROCKCHIP VIDEO DECODER DRIVER
> > > -M:	Ezequiel Garcia <ezequiel@collabora.com>
> > > -L:	linux-media@vger.kernel.org
> > > -S:	Maintained
> > > -F:	drivers/staging/media/rkvdec/
> > > -F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > -
> > >  ROCKCHIP ISP V1 DRIVER
> > >  M:	Helen Koike <helen.koike@collabora.com>
> > >  L:	linux-media@vger.kernel.org  
> > 
> > L:	linux-rockchip@lists.infradead.org
> > 
> > > @@ -14483,12 +14476,19 @@ ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
> > >  M:	Jacob Chen <jacob-chen@iotwrt.com>
> > >  M:	Ezequiel Garcia <ezequiel@collabora.com>
> > >  L:	linux-media@vger.kernel.org
> > > +L:	linux-rockchip@lists.infradead.org
> > >  S:	Maintained
> > > -F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > >  F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > > -F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > >  F:	drivers/media/platform/rockchip/rga/
> > >  
> > > +ROCKCHIP VIDEO DECODER DRIVER
> > > +M:	Ezequiel Garcia <ezequiel@collabora.com>
> > > +L:	linux-media@vger.kernel.org
> > > +L:	linux-rockchip@lists.infradead.org
> > > +S:	Maintained  
> > > +F:	drivers/staging/media/rkvdec/
> > > +F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml  
> > 
> > When I look at the other entries 'drivers/' is sort below 'Documentation/'.
> > 
> > ./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS
> > --order
> 
> Good point. It would be cool if checkpatch.pl could call it in order
> to verify if MAKEFILE changes are at the right order.
> 
> As I noticed other fields that are out of the order on media,
> due to some changes that didn't arrive upstream yet, I'll fix
> them all on a single patch.
> 

Thanks for taking care of this.

Ezequiel

