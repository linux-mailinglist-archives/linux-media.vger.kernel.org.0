Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61DE131B6EA
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 11:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhBOKQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 05:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhBOKQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 05:16:06 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25402C061574
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 02:15:24 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1lBauX-00027Q-0k; Mon, 15 Feb 2021 11:15:21 +0100
Message-ID: <10bfc6f5aaa02ad5858186ccee1894424fc0dd39.camel@pengutronix.de>
Subject: Re: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp
 only
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Philipp Zabel <pza@pengutronix.de>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 15 Feb 2021 11:15:19 +0100
In-Reply-To: <CAGngYiWAohHXYPfd5NJc4URVuMA4GP01jvRV78uM5P+H7zKx-A@mail.gmail.com>
References: <20210203163348.30686-1-TheSven73@gmail.com>
         <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
         <CAGngYiWt9Q4jWksiniC6vqUw29L3mOFuQpw7Dz_BK9Ye9FbQ1Q@mail.gmail.com>
         <20210211143233.GA1360@pengutronix.de>
         <CAGngYiWAohHXYPfd5NJc4URVuMA4GP01jvRV78uM5P+H7zKx-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sven,

Am Freitag, dem 12.02.2021 um 18:52 -0500 schrieb Sven Van Asbroeck:
> Philipp, Fabio,
> 
> I was able to verify that the PREs do indeed overrun their allocated ocram area.
> 
> Section 38.5.1 of the iMX6QuadPlus manual indicates the ocram size
> required: width(pixels) x 8 lines x 4 bytes. For 2048 pixels max, this
> comes to 64K. This is what the PRE driver allocates. So far, so good.
> 
> The trouble starts when we're displaying a section of a much wider
> bitmap. This happens in X when using two displays. e.g.:
> HDMI 1920x1088
> LVDS 1280x800
> X bitmap 3200x1088, left side displayed on HDMI, right side on LVDS.
> 
> In such a case, the stride will be much larger than the width of a
> display scanline.

Urgh, bad tested corner case.

> This is where things start to go very wrong.
> 
> I found that the ocram area used by the PREs increases with the
> stride. I experimentally found a formula:
> ocam_used = display_widthx8x4 + (bitmap_width-display_width)x7x4
> 
> As the stride increases, the PRE eventually overruns the ocram and...
> ends up in the "ocram aliased" area, where it overwrites the ocram in
> use by the vpu/coda !
> 
> I could not find any PRE register setting that changes the used ocram area.

There is no such setting. The PRE always prefetches a doublebuffer of
2x4 scanlines and the scanline size is defined by the store engine
pitch.

The straight forward way to fix this would be to just disable the PRE
when the stride is getting too large, which might not work well with
all userspace requirements, as it effectively disables the ability to
scan GPU tiled surfaces when the stride is getting too large.

I'm not sure if this works in practice, as the PRG address rewriting
might make this harder than it seems, but on could probably try to
rewrite the prefetch start address, input pitch, input width/height and
store pitch of the PRE settings to cover only the area used by the the
CRTC to reduce OCRAM requirements.

Regards,
Lucas

