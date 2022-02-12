Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845BE4B3470
	for <lists+linux-media@lfdr.de>; Sat, 12 Feb 2022 12:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbiBLLQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Feb 2022 06:16:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbiBLLQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Feb 2022 06:16:27 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32108245A5
        for <linux-media@vger.kernel.org>; Sat, 12 Feb 2022 03:16:24 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DA277101BFE; Sat, 12 Feb 2022 11:16:21 +0000 (UTC)
Date:   Sat, 12 Feb 2022 11:16:21 +0000
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YgeXBRR8YUH8H61t@gofer.mess.org>
References: <20220103110743.GA22001@gofer.mess.org>
 <YdLqL2ViSwWzS/Ig@jyty>
 <YdRwqt1pwb8osT6V@jyty>
 <20220105095355.GA6428@gofer.mess.org>
 <YdbVfObDZZnFIDc3@jyty>
 <YeBZmM0ISnFGcsVa@gofer.mess.org>
 <YeEYxwUkCV7rSa0A@jyty>
 <YfV2TeOgSiVShmZN@jyty>
 <YgKeZ+vAynWvvijz@gofer.mess.org>
 <YgN3cq+utQAFFnEW@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgN3cq+utQAFFnEW@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

On Wed, Feb 09, 2022 at 10:12:34AM +0200, Marko Mäkelä wrote:
> Tue, Feb 08, 2022 at 04:46:31PM +0000, Sean Young wrote:
> > On Sat, Jan 29, 2022 at 07:15:57PM +0200, Marko Mäkelä wrote:
> > > Did you have a chance to repeat my findings with a remote control unit that
> > > uses the RC5 protocol?
> > 
> > Yes, I've reproduced the problem now. It's very weird.
> > 
> > After pressing button 1, waiting for a second or two, and then pressing button
> > 3, the device reports some old IR from button 1 before reporting the IR from
> > button 3.
> > 
> > The IR is not a copy of old data, it so presumably its IR that was not
> > reported before. Now I don't know why this IR gets reported so late.
> 
> When I repeated the problem, the delay between subsequent button presses
> could have been even less than a second.
> 
> How did you determine that it is not a copy of old data? I assume that you
> can do that fairly easily for any kernel-side buffers, but what about the
> buffer on the USB device itself?

I've spent some more time debugging this. The problem is that we need to
increase the timeout to prevent key up events from arriving to early, but
the same timeout is used for the raw IR timeout.

I think rc-core needs a little refactoring to split out the timeout into
keyup_timeout and rawir_timeout. For this driver, the rawir_timeout needs
to be set to 0xbf * 51us, and the keyup_timeout to the query interval
(which 200ms).

My patch increased the timeout to 210ms but the IR receiver never sends
a space that long. So this IR will only get processed once *more* IR
arrives, so you get ghost key presses.


Sean
