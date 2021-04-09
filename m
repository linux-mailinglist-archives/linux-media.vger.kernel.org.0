Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B355359F7F
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 15:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhDINEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 09:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbhDINEF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 09:04:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AECC061760
        for <linux-media@vger.kernel.org>; Fri,  9 Apr 2021 06:03:51 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lUqne-00078u-7d; Fri, 09 Apr 2021 15:03:50 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lUqnd-00055J-95; Fri, 09 Apr 2021 15:03:49 +0200
Date:   Fri, 9 Apr 2021 15:03:49 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@pengutronix.de, pza@pengutronix.de,
        maintainers@bluecherrydvr.com
Subject: Re: [PATCH] allegro-dvt/nal-h264.h: fix kernel-doc: hdr -> hrd
Message-ID: <20210409130349.GD13457@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@pengutronix.de, pza@pengutronix.de,
        maintainers@bluecherrydvr.com
References: <03e0ce22-1ebe-24f4-0f49-f4c41ae8f598@xs4all.nl>
 <20210323075258.GC31778@pengutronix.de>
 <fc54c78a-997e-f1e6-aca4-9f0453579d1a@xs4all.nl>
 <20210323082338.GD31778@pengutronix.de>
 <8fb4ccef-fdee-7257-01a2-e9fbaed96579@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8fb4ccef-fdee-7257-01a2-e9fbaed96579@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:17:21 up 50 days, 15:41, 95 users,  load average: 0.09, 0.18,
 0.24
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, 23 Mar 2021 09:33:38 +0100, Hans Verkuil wrote:
> On 23/03/2021 09:23, Michael Tretter wrote:
> > On Tue, 23 Mar 2021 08:57:53 +0100, Hans Verkuil wrote:
> >> On 23/03/2021 08:52, Michael Tretter wrote:
> >>> On Tue, 23 Mar 2021 08:49:13 +0100, Hans Verkuil wrote:
[...]
> >> I think you should either document it all, or change /** to /*.
> > 
> > IMO documenting the parameters is rather pointless, because they are straight
> > copies from the specifications and the documentation would be "see H264
> > specification" for every single one of them. I guess, I'll go for changing /**
> > to /*.
> > 
> > Actually, I thought about using the sps/pps structs defined in
> > include/media/v4l2-ctrls.h. I was not convinced, because these are userspace
> > facing API. Are the sps/pps definitions something, that would help other
> > drivers, too, or should we rather avoid global definitions to discourage
> > sps/pps parsing/generation in drivers?
> 
> There is nothing wrong with using v4l2_ctrl_h264_sps/pps in your driver
> instead of your own structs.
> 
> Just note that these structs are now part of the uAPI, so can't be changed.
> 
> If you need allegro specific data as well, then you might be better off
> keeping your own structs.

I checked this and, unfortunately, I need more data than what is available in
the uAPI structs (at least cropping information is missing) and cannot reuse
the uAPI structs.

> 
> I'm not sure what you mean with your last question. If a driver needs to do
> sps/pps parsing/generation, then why would it matter if it uses global or local
> definitions? It still has to do it, right? And having reusable code might help
> others.

The question arises from the stateful video encoder interface specification [0]:

	Performing software stream processing, header generation etc. in the
	driver in order to support this interface is strongly discouraged. In
	case such operations are needed, use of the Stateless Video Encoder
	Interface (in development) is strongly advised.

However, at least the drivers for the Techwell TW5864 and the CODA at least
have partial support for writing sps/pps. I guess, having something reusable
would be actually pretty helpful.

That being said, the API and the documentation of the current sps/pps
parsing/generation code is at least a bit sketchy - inconsistent
documentation, h264 function being used for h264 and hevc, etc. I'm adding a
cleanup of the interface to my todo list. Maybe at one point we could move
this code from the driver to some common directory, if possible.

Michael

[0] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#memory-to-memory-stateful-video-encoder-interface
