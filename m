Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89CA4F5E8B
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 15:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbiDFNDW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Apr 2022 09:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbiDFNCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 09:02:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C02B5C27B4
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 02:28:22 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nc1xS-0004S8-0v; Wed, 06 Apr 2022 11:28:10 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nc1xQ-001OAG-Qw; Wed, 06 Apr 2022 11:28:07 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nc1xO-0003nc-FL; Wed, 06 Apr 2022 11:28:06 +0200
Message-ID: <5978f480edc49a49eea60b1122885d10543ae88b.camel@pengutronix.de>
Subject: Re: CODA MJPG Decoder Problems after Wakeup/Resume
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hager Stefan <Stefan.Hager@ginzinger.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Date:   Wed, 06 Apr 2022 11:28:06 +0200
In-Reply-To: <AM5PR06MB315348317AD584BA4709B37584E49@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <AM5PR06MB315348317AD584BA4709B37584E49@AM5PR06MB3153.eurprd06.prod.outlook.com>
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

Hi Stefan,

On Di, 2022-04-05 at 07:53 +0000, Hager Stefan wrote:
> Hi.
> 
> I observed a problem within the Coda MJPEG Decoder:
> 
> An MJPG Stream over Ethernet is decoded - and displayed to a screen
> afterwards - with 30 frames per second (as sent by the external
> source) on am i.MX6D 2 Core Processor.
> If the System was then sent so sleep ('$ echo mem >
> /sys/power/state') and woken up again, the stream is only decoded
> with a framerate of about 1 frame per second. This happens on each
> wakeup.

Which kernel version are you using and how are you driving coda-vpu
from userspace? Can you reproduce the issue without the network
streaming or display parts?

> Before going to sleep there were 30 Interrupts per Second on the
> Decoder, afterwards only 1 per Second. I also observed a kthread
> worker taking nearly 100% of one Core.

Could you use perf top to find out where the CPU time is spent?

> What could be the issue? How to resolve it?

Is the decoder still fed frames at 30 fps after resume? You could use
ftrace to trace the coda:*, v4l2:*, and vb2:* trace events to verify
this, and to check whether the hardware still is processing frames at
the expected speed.

regards
Philipp
