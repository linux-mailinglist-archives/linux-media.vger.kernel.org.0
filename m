Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB61B24B69A
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 12:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731903AbgHTKiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 06:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731902AbgHTKiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 06:38:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122FCC061757
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 03:38:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8242323D;
        Thu, 20 Aug 2020 12:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597919883;
        bh=BQNkOma8SsW/FO16mrdQ9tYjEcWbEHtz6mOlFPPGBjI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BFnROfHvAvOLIliOMzWLZUkxhxYusVtnG8RLdZ7bIloBeKnvLbeREzjTxa8eNIyl6
         Qw2/k4MewMxY0k1FTi1tYkX8vpg51RsXCphKjgAlRjSrwVOlaMLTlsJmJwQxWy+9g+
         AM/0sM8752ED3ip196JIpgIMlUjn9NlmiRje2P/I=
Date:   Thu, 20 Aug 2020 13:37:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] media: uvc: Silence shift-out-of-bounds warning
Message-ID: <20200820103746.GD6593@pendragon.ideasonboard.com>
References: <20200818235406.GE2360@pendragon.ideasonboard.com>
 <20200819000340.11616-1-laurent.pinchart@ideasonboard.com>
 <68984fef-1e18-9394-9e68-becabf83c85f@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68984fef-1e18-9394-9e68-becabf83c85f@acm.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bart,

On Wed, Aug 19, 2020 at 08:25:27PM -0700, Bart Van Assche wrote:
> On 2020-08-18 17:03, Laurent Pinchart wrote:
> > UBSAN reports a shift-out-of-bounds warning in uvc_get_le_value(). The
> > report is correct, but the issue should be harmless as the computed
> > value isn't used when the shift is negative. This may however cause
> > incorrect behaviour if a negative shift could generate adverse side
> > effects (such as a trap on some architectures for instance).
> > 
> > Regardless of whether that may happen or not, silence the warning as a
> > full WARN backtrace isn't nice.
> > 
> > Reported-by: Bart Van Assche <bvanassche@acm.org>
> > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 6c37aa018ad5..b2cdee0f7763 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -773,12 +773,16 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
> >  	offset &= 7;
> >  	mask = ((1LL << bits) - 1) << offset;
> >  
> > -	for (; bits > 0; data++) {
> > +	while (1) {
> >  		u8 byte = *data & mask;
> >  		value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
> >  		bits -= 8 - (offset > 0 ? offset : 0);
> > +		if (bits <= 0)
> > +			break;
> > +
> >  		offset -= 8;
> >  		mask = (1 << bits) - 1;
> > +		data++;
> >  	}
> >  
> >  	/* Sign-extend the value if needed. */
> 
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> 
> Thanks for having addressed this quickly!

You're welcome. Would you be able to test the patch to ensure it fixes
the issue on your system (and that there are no observable side effects)
?

-- 
Regards,

Laurent Pinchart
