Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C3B1CC171
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 14:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgEIMwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 08:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgEIMwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 08:52:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6716C061A0C;
        Sat,  9 May 2020 05:52:03 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 13BBF2A2CA6
Message-ID: <458fcdc1d934c12a81a3bd9728cdca9cd2ad874c.camel@collabora.com>
Subject: Re: [PATCH v2 7/9] media: MAINTAINERS: rkisp1: add path to
 dt-bindings
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com
Date:   Sat, 09 May 2020 09:51:49 -0300
In-Reply-To: <9a95d227-9592-2c5c-fe6d-dff9b84f4292@xs4all.nl>
References: <20200403161538.1375908-1-helen.koike@collabora.com>
         <20200403161538.1375908-8-helen.koike@collabora.com>
         <9a95d227-9592-2c5c-fe6d-dff9b84f4292@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, 2020-04-17 at 09:18 +0200, Hans Verkuil wrote:
> On 03/04/2020 18:15, Helen Koike wrote:
> > The Rockchip ISP bindings was moved out of staging.
> > Update MAINTAINERS file with the new path.
> 
> Shouldn't there be a reference to Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> as well in MAINTAINERS?
> 

Indeed, and I can take care of that later. I was planning to move
this PHY driver out of staging, but was waiting on patches 4 and 5
of this series.

They seem fine, would you mind picking them?

Thanks!
Ezequiel

> Regards,
> 
> 	Hans
> 
> > Suggested-by: Johan Jonker <jbx6244@gmail.com>
> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > ---
> > 
> > V2:
> > - This is a new patch in the series
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d66ac41ef5872..726044b84cf23 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14303,6 +14303,7 @@ M:	Helen Koike <helen.koike@collabora.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  F:	drivers/staging/media/rkisp1/
> > +F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> >  
> >  ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
> >  M:	Jacob Chen <jacob-chen@iotwrt.com>
> > 
> 
> 


