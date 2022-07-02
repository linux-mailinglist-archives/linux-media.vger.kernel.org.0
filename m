Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF31F563F13
	for <lists+linux-media@lfdr.de>; Sat,  2 Jul 2022 10:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbiGBIRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jul 2022 04:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiGBIRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Jul 2022 04:17:21 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E38313DF3
        for <linux-media@vger.kernel.org>; Sat,  2 Jul 2022 01:17:19 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BD2AB100094; Sat,  2 Jul 2022 09:17:18 +0100 (BST)
Date:   Sat, 2 Jul 2022 09:17:18 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <Yr//Dr1X3jjjBvzW@gofer.mess.org>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
 <Yrk5faigZEiZ7KXk@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yrk5faigZEiZ7KXk@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 27, 2022 at 08:00:45AM +0300, Marko Mäkelä wrote:
> Sun, Jun 26, 2022 at 03:33:48PM +0300, Marko Mäkelä wrote:
> > How about the following improvement? If IR_RX_BC is a simple cursor to
> > the 128-byte IR_RX_BUF, then rtl2832u_rc_query() could avoid sending
> > refresh_tab[] but simply remember where the previous call left off. We
> > could always read the 128 bytes at IR_RX_BUF, and process everything
> > between the previous position reported by IR_RX_BC and the current
> > position reported by IR_RX_BC, and treat buf[] as a ring buffer.
> 
> I experimented with this on the 5.19.0-rc3 kernel. With the attached patch
> applied on top of this patch series, "ir-keytables -t" reported only one RC5
> encoded key-down event. I had to unplug and plug in the adapter in order to
> receive another RC5 event. The refresh command seems to be necessary for the
> device to store and forward further IR data.
> 
> > Last time I tested it, the patch was a significant improvement. I think
> > that "perfect" is the enemy of "good enough", and the patch should be
> > included in the kernel.
> 
> The remaining problem definitely is a limitation of the interface. There is
> little that can be done to work around it.

This particular device is really badly designed. Unless we come up with a
better solution to work around its limitations, it's just broken.


Sean
