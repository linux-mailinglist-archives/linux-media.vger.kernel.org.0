Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9FE4127BEA
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 14:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfLTNrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 08:47:36 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46481 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727344AbfLTNrg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 08:47:36 -0500
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1iiIcx-0007Q5-40; Fri, 20 Dec 2019 14:47:35 +0100
Date:   Fri, 20 Dec 2019 14:47:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 0/5] Stateful Encoding: final bits
Message-ID: <20191220144734.31667e9c@litschi.hi.pengutronix.de>
In-Reply-To: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On Tue, 19 Nov 2019 12:34:52 +0100, Hans Verkuil wrote:
> This series adds support for fractions in the control framework,
> and a way to obtain the min and max values of compound controls
> such as v4l2_fract.
> 
> Next it adds the V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE control to
> set the framerate for the encoder.
> 
> The next patch adds support for the V4L2_BUF_FLAG_TOO_SMALL flag
> to signal that the capture buffer was too small.
> 
> The final patch adds the encoder spec (unchanged from v3).
> 
> Michael, can you add support for V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
> to your encoder driver? Let me know if something isn't working.

I implemented the control and hooked it up with S_PARM as well. The
implementation was straightforward without any real issues. I'll send a
patch in reply to this mail. Having a control for configuring the frame
rate that is encoded into the SPS feels correct. This is in line with
configuring the bitrate, level, etc.

However, after seeing the implementation and fiddling around with it in
userspace, I am not convinced that S_PARM should be used signal the
rate at which frames are submitted.

Setting the frame submission rate to something different than the
frame rate of the stream would be most interesting for transcoding use
cases. The user space would either want to run the encoding as fast as
possible or, if there are multiple encoding processes, as fast as
possible with properly shared resources. Boiling this information down
into a single number (and calling is "rate at which frames are
submitted") sounds kind of wrong, because the userspace does not know
which submission rate would lead to a good result.

Using the frame rate for such a setting seems pretty unique to the
allegro encoder. Other encoders might use different mechanisms to boost
the encoding speed, e.g., might be able to temporarily increase the
clock rate of the codec. In these cases, the driver would need to
translate the "framerate" set via S_PARM to a clock rate for the codec.
This does not sound right.

However, in the end, this would lead to exposing single parameters that
allow to tune the codec via generic controls. This does not seem to be
the right way, at all. Maybe we could have a control that tells the
encoder to "run as fast as possible" or to "run with as little
resources as possible", which would be applicable to more encoders and
the driver would have to decide how to implement this "profile".

Still, I am not really sure, if this is the proper way to solve this.

> I need to add a test control for this to vivid as well and add support
> for this to v4l2-ctl, that's on my TODO list.
> 
> Open questions:
> 
> 1) Existing encoder drivers use S_PARM to signal the frameperiod,
> but as discussed in Lyon this should be the rate at which frames are
> submitted for encoding, which can be different from
> V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE. But given the current use-cases
> I was wondering if calling S_PARM should set the ENC_FRAME_RATE
> control as well, and you would need to explicitly set the control
> after S_PARM if the two are not the same. This would mean that
> existing applications that don't know about the control can keep working.

In the patch I did exactly that and we should be backwards compatible
to applications that use only S_PARM.

Michael
