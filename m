Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66E2249194
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 01:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgHRXy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 19:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgHRXy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 19:54:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A39EC061389
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 16:54:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4CB129E;
        Wed, 19 Aug 2020 01:54:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597794864;
        bh=g/MwoGFQgXT7bjX43Z4DIgdil04j9ZSlZJ63zvQsVns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LKOsP+Z7eGxtsEThiLEeVGq+bGhCaQzmjSfDI+UTJmB4UuDAzcMssCvBUF7Zztg8J
         aIQsLT34q+E6OQohU4h+FwZ5gVQCilF/faV1y1MsS/ouEYlVPTZQjZ+NuxR2KYLT5g
         /9zPmnWZbP1SXEjV2hUNG9Zbo/tWcHzxSwBzv0Vg=
Date:   Wed, 19 Aug 2020 02:54:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Bart Van Assche <bvanassche@acm.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: UBSAN: shift-out-of-bounds in
 drivers/media/usb/uvc/uvc_ctrl.c:781
Message-ID: <20200818235406.GE2360@pendragon.ideasonboard.com>
References: <132c541a-58b7-4f5c-47f3-855ac5818377@acm.org>
 <CAOMZO5BhURkMW9Syw88OzuXGroqWAa+0fhttQqTT6GdRknX+Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5BhURkMW9Syw88OzuXGroqWAa+0fhttQqTT6GdRknX+Xg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Tue, Aug 18, 2020 at 02:58:22PM -0300, Fabio Estevam wrote:
> Hi Bart/Laurent,
> 
> On Tue, Aug 18, 2020 at 2:41 PM Bart Van Assche <bvanassche@acm.org> wrote:
> >
> > Hi,
> >
> > This morning I installed a debug build of kernel v5.8.1 on my laptop.
> > The complaint shown below appeared in the kernel log. Is this a known
> > issue?
> >
> > ================================================================================
> > UBSAN: shift-out-of-bounds in drivers/media/usb/uvc/uvc_ctrl.c:781:13
> > shift exponent -7 is negative
> 
> Should we fix it like this?
> 
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -778,7 +778,7 @@ static s32 uvc_get_le_value(struct
> uvc_control_mapping *mapping,
>                 value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
>                 bits -= 8 - (offset > 0 ? offset : 0);
>                 offset -= 8;
> -               mask = (1 << bits) - 1;
> +               mask = (1LL << bits) - 1;
>         }

No, the issue is that bits is equal to -7, 1LL won't change that.

Once bits become negative, the loop stops, and the mask value isn't used
afterwards. This would only cause an issue if a shift with a negative
value generated side effects (such as a trap for instance) on top of
producing an incorrect result. Can this happen ? I suppose we should
silence the warning even if it's a false positive, as it doesn't look
good in the kernel log.

-- 
Regards,

Laurent Pinchart
