Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A99575DAB
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 10:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiGOInK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 04:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiGOInJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 04:43:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF875814A2
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 01:43:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 104DC993;
        Fri, 15 Jul 2022 10:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657874586;
        bh=3GokSK55oWNN//kSQ3pcQzCjGI182k9pc9Hdmg7nkSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sGVaSubLbaF3aojzzAiF3jUuq1FA3MxUzwtbgj6vIGOflHYxrt6EYNeqouFQ7r17t
         k7+S3XVWoPKFltTCHA2PyYJW/aQX3npOAQPaELBZaF0MeN3pftJahQ3OtGVLPfj3Kn
         QsnG0zr8db5Jd2CFZyEKXREROiEIb5uf+ue+ldhY=
Date:   Fri, 15 Jul 2022 11:42:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
Message-ID: <YtEoeh4cGtFMbnap@pendragon.ideasonboard.com>
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jul 15, 2022 at 10:15:04AM +0200, Hans Verkuil wrote:
> Hi all,
> 
> The Linux Foundation organized a meeting room for us to use on Monday September 12
> at the Convention Centre Dublin. It is co-located with the Open Source Summit Europe,
> see https://events.linuxfoundation.org/open-source-summit-europe/ for more info.
> 
> To attend this Media Summit no registration is required for the OSSE, but you do need
> to register with me by sending me an email. There is a maximum of 20 participants.

Please count me in :-)

> I send out a request for topics in May and got quite a few replies:
> 
> https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.camel@ndufresne.ca/T/
> 
> If you have more ideas for topics, then reply either to that message (preferred) or this
> one.
> 
> See here for more details about the conference:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> It is primarily meant for media developers to meet face-to-face. Whether there will
> be a possibility to participate remotely is not certain at this time. Past experience
> shows that meetings like this are a poor fit for remote attendance, unless you have
> a meeting room that is designed for such purposes, which we don't have.

I wouldn't expect remote attendance to be possible, indeed. The audio
and video equipment required to do so efficiently won't be within
budget.

> The actual agenda will depend on who will attend, I hope to be able to put that
> together around mid August. But the link above with the 'Request for Topics' thread
> will give a good indication of what to expect.
> 
> So, if you want to attend, then let me know by email. Please reply as soon as possible,
> even if you are not entirely certain yet if you can attend.
> 
> The health and safety regulations will be those of the OSSE LF:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/
> 
> Code of conduct:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/attend/code-of-conduct/
> 
> A final note: the total cost is at most $650 (depends on the number of people):
> that's for a whiteboard, powerstrips and refreshments (coffee, tea, soda, water).
> 
> It would be nice if this can be sponsored by one or more companies. I'll ask
> my manager if Cisco can contribute to this (once he's back from vacation), but
> if other companies want to contribute as well, then let me know and we can
> split the bill. And start off the meeting with a nice slide saying: "Sponsored by:".

-- 
Regards,

Laurent Pinchart
