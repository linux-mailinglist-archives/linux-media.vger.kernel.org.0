Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BA9345996
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhCWIYB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbhCWIXj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:23:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6EACC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 01:23:39 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lOcKA-0003Pk-CG; Tue, 23 Mar 2021 09:23:38 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lOcKA-0006nK-2g; Tue, 23 Mar 2021 09:23:38 +0100
Date:   Tue, 23 Mar 2021 09:23:38 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] allegro-dvt/nal-h264.h: fix kernel-doc: hdr -> hrd
Message-ID: <20210323082338.GD31778@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <03e0ce22-1ebe-24f4-0f49-f4c41ae8f598@xs4all.nl>
 <20210323075258.GC31778@pengutronix.de>
 <fc54c78a-997e-f1e6-aca4-9f0453579d1a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc54c78a-997e-f1e6-aca4-9f0453579d1a@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:00:03 up 33 days, 11:23, 86 users,  load average: 0.94, 0.65,
 0.46
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, 23 Mar 2021 08:57:53 +0100, Hans Verkuil wrote:
> On 23/03/2021 08:52, Michael Tretter wrote:
> > On Tue, 23 Mar 2021 08:49:13 +0100, Hans Verkuil wrote:
> >> Give typo in kernel-doc documentation: hdr -> hrd
> >>
> >> Fixes this warning:
> >>
> >> drivers/media/platform/allegro-dvt/nal-h264.h:33: warning: expecting prototype for struct nal_h264_hdr_parameters. Prototype was for struct
> >> nal_h264_hrd_parameters instead
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > 
> > Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
> 
> Since you made the mistake of replying :-) I want to point out that the allegro headers
> produce a large number of kernel-doc warnings since none of the parameters are documented.

:)

> 
> You can look at the daily build log for all the warnings, but I've copied them below as
> well.
> 
> I think you should either document it all, or change /** to /*.

IMO documenting the parameters is rather pointless, because they are straight
copies from the specifications and the documentation would be "see H264
specification" for every single one of them. I guess, I'll go for changing /**
to /*.

Actually, I thought about using the sps/pps structs defined in
include/media/v4l2-ctrls.h. I was not convinced, because these are userspace
facing API. Are the sps/pps definitions something, that would help other
drivers, too, or should we rather avoid global definitions to discourage
sps/pps parsing/generation in drivers?

Michael
