Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F31934A760
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 13:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhCZMeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 08:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhCZMeH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 08:34:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859C1C0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 05:34:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 887A4443;
        Fri, 26 Mar 2021 13:34:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616762043;
        bh=Wnf40Ilesv1yHntQYZH9xGeKUiM63iXI4OOt7UXGriA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N19BgQ+y34gTobz0y8SX952bZejm/cW901muu15cBrrAR7L6iNnHaEOgAol/FmB+y
         aGz5s4MzfIxq24J+TcL5Ok4GOjiARRH0C2ti22QkWeasRyqXWi1d/A9zkwajcHOrOS
         ng4Bgkkf1q6YXwWhF9Kc8pA+BrrjSnsjXDjqK5z0=
Date:   Fri, 26 Mar 2021 14:33:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH] drm/bridge: adv7511: fix support for large EDIDs
Message-ID: <YF3Ujx+FxeL2eZbA@pendragon.ideasonboard.com>
References: <904185be-19ea-a321-a227-d4e659fe1b68@xs4all.nl>
 <YF0yIDWC+7HtMBLb@pendragon.ideasonboard.com>
 <712f7355-482c-b8e3-701b-5a19774aeb5c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <712f7355-482c-b8e3-701b-5a19774aeb5c@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Mar 26, 2021 at 07:31:09AM +0100, Hans Verkuil wrote:
> On 26/03/2021 02:00, Laurent Pinchart wrote:
> > On Wed, Mar 24, 2021 at 09:53:32AM +0100, Hans Verkuil wrote:
> >> While testing support for large (> 256 bytes) EDIDs on the Renesas
> >> Koelsch board I noticed that the adv7511 bridge driver only read the
> >> first two blocks.
> >>
> >> The media V4L2 version for the adv7511 (drivers/media/i2c/adv7511-v4l2.c)
> >> handled this correctly.
> >>
> >> Besides a simple bug when setting the segment register (it was set to the
> >> block number instead of block / 2), the logic of the code was also weird.
> >> In particular reading the DDC_STATUS is odd: this is unrelated to EDID
> >> reading.
> > 
> > Bits 3:0 of DDC_STATUS report the DDC controller state, which can be
> > used to wait until the DDC controller is idle (it reports, among other
> > possible states, if an EDID read is in progress). Other options are
> > possible of course, including waiting for ADV7511_INT0_EDID_READY as
> > done in adv7511_wait_for_edid(), but I wonder if the !irq case in
> > adv7511_wait_for_edid() wouldn't be better of busy-looping on the DDC
> > status instead of running the interrupt handler manually. That's
> > unrelated to this patch though.
> 
> The DDC status tests for other things as well, including HDCP.

I haven't read the chip's documentation in details, but if HDCP
negotiation is in progress, doesn't that keep the DDC bus busy,
preventing an EDID read ?

> I think it is pure luck that this code even worked:
> 
>         if (adv7511->current_edid_segment != block / 2) {
>                 unsigned int status;
> 
>                 ret = regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
>                                   &status);
>                 if (ret < 0)
>                         return ret;
> 
>                 if (status != 2) {
>                         adv7511->edid_read = false;
>                         regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
>                                      block);
>                         ret = adv7511_wait_for_edid(adv7511, 200);
>                         if (ret < 0)
>                                 return ret;
>                 }
> 
> What happens on power on is that the adv7511 starts reading the EDID.
> So the DDC_STATUS is 1 (Reading EDID). This code is called, it falls
> in the status != 2 block, it writes the EDID_SEGMENT with 0 (it already
> is 0 after a power on), then waits for the EDID read to finish.
> 
> The only reason this works is that this code is called fast enough
> after the device is powered on that it is still reading the EDID.

Yes, I agree with you. Luck is nice, except when it makes us merge
incorrect code :-)

> It fails if you want to read the next segment, since in that case the
> status is 2 (IDLE) and it will never write the new segment to the
> EDID_SEGMENT register.
> 
> And besides, status wasn't ANDed with 0xf either, and HDCP might
> also be ongoing (should that be enabled in the future).

-- 
Regards,

Laurent Pinchart
