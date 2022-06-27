Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8197755D508
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbiF0Kx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 06:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233895AbiF0Kxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 06:53:55 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F84640E
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 03:53:54 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B296610007F; Mon, 27 Jun 2022 11:53:52 +0100 (BST)
Date:   Mon, 27 Jun 2022 11:53:52 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YrmMQNPHkDGZ843v@gofer.mess.org>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrhSK5l0uQZT76Fi@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

On Sun, Jun 26, 2022 at 03:33:47PM +0300, Marko Mäkelä wrote:
> I finally took the time to get a deeper understanding of the infrared remote
> control subsystem. I think that I now understand the translation into
> key-down, key-up, and key-repeat events. For the RC5 protocol, rc_repeat()
> will not be called by ir-rc5-decoder.c but instead, ir_do_keydown() will
> handle the repeat. For lirc_scancode_event() it will never set the
> LIRC_SCANCODE_FLAG_REPEAT bit, even if !new_event and the protocol does
> support the toggle bit. That might qualify as a bug.

You are right, this was missed. Patches welcome.

> Sat, Feb 12, 2022 at 04:32:19PM +0000, Sean Young wrote:
> > This device presents an IR buffer, which can be read and cleared.
> > Clearing the buffer is racey with receiving IR, so wait until the IR
> > message is finished before clearing it.
> > 
> > This should minimize the chance of the buffer clear happening while
> > IR is being received, although we cannot avoid this completely.
> 
> I just realized that this limitation of the interface may be causing exactly
> what I was observing when I was testing this. If a constant stream of data
> is being received because a button is being held down, a buffer overflow or
> wrap-around glitch is inevitable, maybe expect if the wrap-around occurs
> exactly at the 128-byte boundary.
> 
> How about the following improvement? If IR_RX_BC is a simple cursor to the
> 128-byte IR_RX_BUF, then rtl2832u_rc_query() could avoid sending
> refresh_tab[] but simply remember where the previous call left off. We could
> always read the 128 bytes at IR_RX_BUF, and process everything between the
> previous position reported by IR_RX_BC and the current position reported by
> IR_RX_BC, and treat buf[] as a ring buffer.

This is a great idea. Very original.

> Last time I tested it, the patch was a significant improvement. I think that
> "perfect" is the enemy of "good enough", and the patch should be included in
> the kernel.

The idea sounds really good. I'll review/test the patch and get back to you.

Thanks,

Sean
