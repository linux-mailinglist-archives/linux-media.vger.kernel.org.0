Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2363564E8F
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 09:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbiGDHVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 03:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233116AbiGDHVo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 03:21:44 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D55755B9
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 00:21:41 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 28629100090; Mon,  4 Jul 2022 08:21:39 +0100 (BST)
Date:   Mon, 4 Jul 2022 08:21:39 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YsKVA4bKNuRUOZpf@gofer.mess.org>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
 <YrmMQNPHkDGZ843v@gofer.mess.org>
 <YrqfTnY4Azqt44e4@jyty>
 <Yr/+g/j20kb5kzki@gofer.mess.org>
 <YsHLlg9CccrEzOjL@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsHLlg9CccrEzOjL@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 03, 2022 at 08:02:14PM +0300, Marko Mäkelä wrote:
> Sat, Jul 02, 2022 at 09:14:59AM +0100, Sean Young wrote:
> > Hi,
> > 
> > On Tue, Jun 28, 2022 at 09:27:26AM +0300, Marko Mäkelä wrote:
> > > Mon, Jun 27, 2022 at 11:53:52AM +0100, Sean Young wrote:
> > > > Hi Marko,
> > > >
> > > > On Sun, Jun 26, 2022 at 03:33:47PM +0300, Marko Mäkelä wrote:
> > > > > I finally took the time to get a deeper understanding of the infrared remote
> > > > > control subsystem. I think that I now understand the translation into
> > > > > key-down, key-up, and key-repeat events. For the RC5 protocol, rc_repeat()
> > > > > will not be called by ir-rc5-decoder.c but instead, ir_do_keydown() will
> > > > > handle the repeat. For lirc_scancode_event() it will never set the
> > > > > LIRC_SCANCODE_FLAG_REPEAT bit, even if !new_event and the protocol does
> > > > > support the toggle bit. That might qualify as a bug.
> > > >
> > > > You are right, this was missed. Patches welcome.
> > > 
> > > Attached (for 5.19.0-rc3, on top of the two commits of this patch series).
> > > 
> > > I thought that it would be the least amount of trouble to slightly change
> > > the interpretation of the "toggle" parameter of
> > > rc_keydown(). My intention was to use the values 1 and 2 when the toggle
> > > flag is present. Any nonzero values would work.
> > 
> > I don't understand why this is needed.
> 
> For protocols that do not use a toggle bit, the last parameter of
> rc_keydown() will usually be toggle=0, and explicit calls to rc_repeat()
> will be issued when needed. For those protocols, I thought that we would not
> want rc_keydown() to set any LIRC_SCANCODE_FLAG_REPEAT flag under any
> circumstances.

Toggle and repeat are distinct concepts.

rc_repeat() is for protocols which have a special repeat message, which
carry no information other that "repeat the last message". However,
all protocols repeat. Whether they use a special repeat message or not.

It's right that if a protocol repeats a message, LIRC_SCANCODE_FLAG_REPEAT
is set.


Sean
