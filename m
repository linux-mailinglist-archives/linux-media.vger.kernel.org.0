Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C455612685
	for <lists+linux-media@lfdr.de>; Sun, 30 Oct 2022 01:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiJ2X4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Oct 2022 19:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJ2X4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Oct 2022 19:56:47 -0400
X-Greylist: delayed 483 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 29 Oct 2022 16:56:44 PDT
Received: from webhetz.gkware.com (webhetz.gkware.com [85.10.239.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B8E441FFB5
        for <linux-media@vger.kernel.org>; Sat, 29 Oct 2022 16:56:44 -0700 (PDT)
X-AuthUser: dc6jgk@gkware.de
Received: from i7x ([87.139.33.217]:2639)
        by gkware.com with [XMail 1.27 ESMTP Server]
        id <S3F5589> for <linux-media@vger.kernel.org> from <gero.kuehn@gkware.com>;
        Sun, 30 Oct 2022 01:48:49 +0200
From:   "Gero Kuehn" <gero.kuehn@gkware.com>
To:     <linux-media@vger.kernel.org>
Subject: Anyone interested in a CI+ handshake code donation?
Date:   Sun, 30 Oct 2022 01:48:33 +0200
Message-ID: <JOEELIMKNMBDDPBCFELPOEHCKGAA.gero.kuehn@gkware.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello *.*!

I apologize upfront, if this is the wrong place or way to ask... but is
anyone here interested in a CI+ handshake code donation?
The market we commercially served&supported over many many years
(independent smaller STB builders) is completely suffocated/gone and I
consider making parts of the stack open source, if only it would help to set
a few things right and drain a few ugly swamps.

For obvious legal reasons, I have no intention to provide actual key
material or the few final bits of information that the CI+ extortion regime
puts into the "Licensee specification" under NDAs/SLAs.

 Motivation
------------
I am eternally disgusted by
- the entire rotten CI+ ecosystem
- the main cryptography part probably sold by the mafia to a few grey market
overpriced STB vendors who then redistribute this as questionable
closed-source plugins to endusers, relying on leaked keys
- disfunctional revocation of these keys (proving the argument to regulators
wrong, that all this is "for security" - of course it always only was about
market control and extortion)
- poisoned pseudo open source offers for CI+ (a.k.a. "sign this NDA and you
get access to our DVB codebase with CI+ for our R&D platform that only we
can support you on [for money]"...
   ... and you still pay 100.000€ for nonsense certifications to the CI+
mafia in the end)

 Offer
-------
If anyone is interested in taking, integrating and maintaining the
cryptography logic and APDU parsers/generators from our CI+ Contentcontrol
as open source project, please get in contact (not a fan of mailing lists).


 What you should (not) expect
------------------------------
The CI core that this CI+ is based on predates the Linux CI stack (at least
to my knowledge). So absolutely no part of this is a drop-in replacement for
existing Linux code. On Linux-based proprietary SoCs, our customers usually
executed all of this in user land. In most cases, CI & CI+ were completely
bypassing dvb apis and instead used simple ioctl APIs to read/write PCMCIA
memory on the external bus. Vendor-proprietary on-chip security was used to
protect the keys. The code depends on a couple of 3rd party crypography
components in the public domain or under BSD/MPL like licenses for
hashes,AES,RSA,DH... obviously nothing under GPL (yet).
But: I can guarantee that the handshake state handling and interfacing with
the cryptography work 100%. This is compiling&working on x86,SH4,MIPS,ARM,
certified and deployed on countless real devices, so maybe this is of some
value for you and the general public.

How the package I am willing to re-license can be turned into a useful open
source contribution without violating any laws or SLAs,
how you can install/manage/use/protect keys in a somehow generic Linux
official way or with a standardized TEE interface,
which parts exactly we provide, that would all have to be discussed in
detail. Way too much for this email, so I end at this point.

If no hands are raised and everyone here considers CI+ dead as television in
general or as poisoned fruit not worth supporting in any way... even better
and sorry for disturbing you.

Regards,

  Gero

