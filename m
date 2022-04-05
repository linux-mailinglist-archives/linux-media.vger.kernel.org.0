Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E259E4F4AEB
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1573729AbiDEWwy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 5 Apr 2022 18:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1454268AbiDEP6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:58:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB806CD33F
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 08:03:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nbkia-0006aU-2h; Tue, 05 Apr 2022 17:03:40 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nbkia-001FRi-P9; Tue, 05 Apr 2022 17:03:39 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nbkiY-0007UZ-MN; Tue, 05 Apr 2022 17:03:38 +0200
Message-ID: <d9398b1b6bd96cfff80e91bca930281f77bd749b.camel@pengutronix.de>
Subject: Re: [PATCH 7/7] media: coda: enable capture S_PARM for stateful
 encoder
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 05 Apr 2022 17:03:38 +0200
In-Reply-To: <bda20ff01f8aa7898416810743dac300f997e9c0.camel@ndufresne.ca>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-7-p.zabel@pengutronix.de>
         <bda20ff01f8aa7898416810743dac300f997e9c0.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

thank you for the review. You bring up a good point here, I think this
part of the spec is not very easy to understand.

On Di, 2022-04-05 at 10:22 -0400, Nicolas Dufresne wrote:
> Le lundi 04 avril 2022 à 18:35 +0200, Philipp Zabel a écrit :
> > Allow to call S_PARM with type == V4L2_BUF_TYPE_VIDEO_OUTPUT,
> > to fix the following v4l2-compliance test failure:
> > 
> >                 fail: v4l2-test-formats.cpp(1413): got error 22
> > when setting parms for buftype 1
> >         test VIDIOC_G/S_PARM: FAIL
> 
> That one may be missing something though. As you don't implement performance
> target, you need to override the value somehow with the value you wrote into the
> bitstream no ? Otherwise we just ignore what userland sets silently ?

You are right that we don't implement any performance targets.
But the spec also says [1]:

  Changing the OUTPUT frame interval also sets the framerate that the
  encoder uses to encode the video. So setting the frame interval to
  1/24 (or 24 frames per second) will produce a coded video stream that
  can be played back at that speed. The frame interval for the OUTPUT
  queue is just a hint, the application may provide raw frames at a
  different rate. It can be used by the driver to help schedule
  multiple encoders running in parallel.

  In the next step the CAPTURE frame interval can optionally be changed
  to a different value. This is useful for off-line encoding were the
  coded frame interval can be different from the rate at which raw
  frames are supplied.

And

  Changing the CAPTURE frame interval sets the framerate for the coded
  video. It does not set the rate at which buffers arrive on the
  CAPTURE queue, that depends on how fast the encoder is and how fast
  raw frames are queued on the OUTPUT queue.

[1] https://docs.kernel.org/userspace-api/media/v4l/dev-encoder.html?highlight=stateful%20encoder

So far I'm only implementing the OUTPUT->CAPTURE rate passthrough part
to make v4l2-compliance happy.

Since the "frame interval for the OUTPUT queue is just a hint" and the
spec only says that "the encoder may adjust it to match hardware
requirements", I felt free to just ignore the raw frame interval part
for now.
My understanding is that the driver may limit this value to the
achievable real time encoding speed (if it even knows).

One thing I'm not doing according to spec right now is that calling
S_PARM on CAPTURE will also change the OUTPUT interval, as the driver
just stores them in the same variable.
Also the driver does not set the V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL
to signal it supports S_PARM on CAPTURE.
My understanding is that the CAPTURE frame interval is the value that
should be written to the bitstream and that should be used for the
bitrate control algorithm.

> I might not have got exactly how this case is supposed to be handled.
> Looking for feedback on what is proper behaviour for drivers that do
> not implement performance targets (resource reservation).

Same here. I'd love to learn whether my understanding of the spec is
correct or not.

regards
Philipp
