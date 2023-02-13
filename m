Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7FA269440E
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 12:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjBMLMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 06:12:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjBMLMc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 06:12:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32D218AA1;
        Mon, 13 Feb 2023 03:12:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BBD7501;
        Mon, 13 Feb 2023 12:12:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676286720;
        bh=Yy46wH/mf96v5p5pMRefcwtktK2/TYKYOsS2FRfOVnA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VZ7gfwUuJ+WwDBqCjIh/yMnNG/nBOeMD1+3B5828ZOMfkInzP5oOPHtFXgPpexI4a
         6h/aIX4ky0eqclnre8whKsyGnkgZwNb0lScVGvtwoXH/QdSvH1g7HQV9bMHG5GuNgm
         JKDmSu2f9CpFIvH0auqPZbQf/VUJ3l+7g2uaclcI=
Date:   Mon, 13 Feb 2023 13:12:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/2] media: i2c: adv7604: Fix range of hue control
Message-ID: <Y+obAApZXgtb08k5@pendragon.ideasonboard.com>
References: <20230210225622.24411-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230210225622.24411-3-laurent.pinchart+renesas@ideasonboard.com>
 <e2f92695-c681-616d-a565-89d348f00a3b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2f92695-c681-616d-a565-89d348f00a3b@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergei,

On Sat, Feb 11, 2023 at 12:11:17PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 2/11/23 1:56 AM, Laurent Pinchart wrote:
> 
> > The ADV7604, ADV7611 and ADV7612 software manuals different the CP_HUE
> 
>    s/different/document/?

Indeed. I'll fix this in v2, but will wait for Hans to test the patches
on ADV7604 and/or ADV7611 before sending the new version.

> > value differently:
> > 
> > - For ADV7604 and ADV7611, the hue is specified as an unsigned 8-bit
> >   value, and calculated as
> > 
> >   (CP_HUE[7:0] * 180) / 256 - 90
> > 
> >   with the range set to [-90°, 90°]. Additionally, the values 0x00, 0x0f
> >   and 0xff are documented as corresponding to -90°, 0° and 90°
> >   respectively.
> > 
> > - For ADV7612, the hue is specified as a signed 8-bit value in the range
> >   [0°, 360°[ without any formula. Additionally, the value 0x00 is
> >   documented as corresponding to 0°.
> > 
> > The ADV7604 and ADV7611 documentation is clearly wrong as the example
> > values don't correspond to the formula. Furthermore, the [-90°, 90°]
> > range seems incorrect as it would cover only half of the hue space.
> > 
> > The ADV7612 documentation is better, although the range should likely be
> > [-180°, 180°[ if the value is signed. Given that the values wrap around,
> > this makes no difference in practice.
> > 
> > The hue values have been verified on ADV7612 to follow the
> > documentation. There is a high chance they do as well on ADV7604 and
> > ADV7611.
> > 
> > In any case, all software manuals document the register as 8-bit, so the
> > current range of the V4L2 hue control [0, 128] is not correct. Expand it
> > to cover the full 8-bit space, using unsigned values to avoid breaking
> > any application that may rely on 128 being a valid value.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> [...]
> 
> MBR, Sergey

-- 
Regards,

Laurent Pinchart
