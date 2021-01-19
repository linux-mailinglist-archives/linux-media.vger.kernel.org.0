Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7898E2FB8B5
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 15:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393141AbhASNkk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 19 Jan 2021 08:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390618AbhASMJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 07:09:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008AEC061573
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 04:08:31 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1l1poB-0006J2-OX; Tue, 19 Jan 2021 13:08:27 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1l1poA-0005Rp-So; Tue, 19 Jan 2021 13:08:26 +0100
Message-ID: <eb52b15885682f7c356f8d67afa18ad21e85b8f2.camel@pengutronix.de>
Subject: Re: Coda: imx53 plays video with incorrect colors
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 19 Jan 2021 13:08:26 +0100
In-Reply-To: <CAOMZO5Cu_=vEe23R+siqcH2UKPUvaBnCo=WD5FvKcSmbdX6Tbg@mail.gmail.com>
References: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
         <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com>
         <f8d2536fb5dadf7b7bdb4bfb6b3aaadf68318a88.camel@ndufresne.ca>
         <CAOMZO5DBRGqn5DTsMG3RRHdN1HMo7CtP6HYw3PajK3A6Y6iCoQ@mail.gmail.com>
         <CAKQmDh-KgO4TameRQs_D3_rdW8n0oY-ZLmbsQzWQPOkUJdiObw@mail.gmail.com>
         <CAOMZO5DCzodXDVygMfnhJi=DF3W64NZJQxLBT6LoOJ_V6NJ9Hg@mail.gmail.com>
         <4366a936909a3f33788719f00441e81b1f3576f7.camel@pengutronix.de>
         <CAOMZO5CyDtEW4Uo3u9ANRro5fV4DBx3WLKDc_ok8HB41mNKF5w@mail.gmail.com>
         <180eccb13a035e6245da319b285c6cd622fb30ec.camel@pengutronix.de>
         <CAOMZO5Cu_=vEe23R+siqcH2UKPUvaBnCo=WD5FvKcSmbdX6Tbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Mon, 2021-01-18 at 15:36 -0300, Fabio Estevam wrote:
> Hi Philipp,
> 
> On Mon, Jan 18, 2021 at 12:29 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > Please try forcing decoder output to NV12 instead of I420.
> 
> Your suggestion works, thank you. After applying your IPU patch and
> using this Gstreamer pipeline:
> 
> gst-launch-1.0 filesrc location=/media/clip.mp4 ! qtdemux ! h264parse
> ! v4l2h264dec ! video/x-raw,format=NV12  !  kmssink
> 
> The video is played with correct colors.

Ok, thank you. It looks to me like the I420 issue is either a bug in
coda-dev, or an interaction issue between GStreamer and coda-dev, where
coda-dev doesn't let GStreamer change the format at a point where it
expects to be able to. The b/w image (with slight discolorations in a
regular pattern) could very well be actual NV12 interpreted as I420 by
GStreamer (and thus kmssink). I'll have closer look.

> Can we make the NV12 format be used automatically so that a simple
> 'gst-play-1.0 /media/clip.mp4' works?

That would be a matter of increasing the rank of the NV12 format
in gst_v4l2_object_format_get_rank() above that of I420 and YV12.

> > Yes. Please try if the following patch makes it work:
> 
> With this Gstreamer patch, I don't see the segfault anymore, but it
> plays in black-and-white.

Thanks for testing. I've opened

https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/856

to track this.

regards
Philipp
