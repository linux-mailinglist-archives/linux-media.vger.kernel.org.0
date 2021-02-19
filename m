Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E22331F66E
	for <lists+linux-media@lfdr.de>; Fri, 19 Feb 2021 10:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhBSJSW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Feb 2021 04:18:22 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:41807 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhBSJSC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Feb 2021 04:18:02 -0500
Date:   Fri, 19 Feb 2021 09:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1613726238;
        bh=sR5eqGuv4KeYzvnmVGjTl/V7OxkGJoasXjnzq2k12+w=;
        h=Date:To:From:Reply-To:Subject:From;
        b=aXQb1depJzbPRZK9uFGYORB2b34pcO7Fj+zPfUzacn/oVuRqyurvTKaKrj6e02M4w
         C4LA0dG+3yKdqGYhiMYEl4fH/v3H1O19r+P86W9Ow+Czxrs3yo7jJeA/mlAzp86E6V
         TU3RKI+NTqDYjzfSF1HBlCpCc6SXVnNI3X6y5E4IQePkVjEWQ+1MzQLpkfSk13nFSx
         p2v+Sm8uolaxlE2EQ/C5xyBcXmcBoq16grIb9RAjA3oz2rH39oblg3jmBlaHAP5UoQ
         0cQRX2Y1yLoDPLdjBctkzfD4qRM5eGR8t2Uiy6JMogxC04j8hCLBgLYUH2k2woS6nO
         HxqKbq6HEGCJA==
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Nomeji <nomeji@emersion.fr>
Reply-To: Nomeji <nomeji@emersion.fr>
Subject: [UNKNOWN IVTV CARD] Sony Vaio [4444:0016]
Message-ID: <9brq4bzh3iOdgN_xYdtatDjws7V_-dA4M-kqhL3VKMbp_u2tCKwqwmX_mnq9nGsjNQDzy82C11l017C1xOwgMe1gXa1eSnnXwGvd31xXIbQ=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I've found an old PCI TV Card gathered from a Sony Vaio desktop PC. It look=
s really similar to a Haupauge PVR-150 or PVR-250 except it's recognized as=
 a Sony device in lspci.
ivtv default it to PVR-150 but it's probably more similar to a PVR-250. Is =
there a way to default it to PVR-250 instead of PVR-150?

Here is dmesg log:

[   16.163433] ivtv: Start initialization, version 1.4.3
[   16.163486] ivtv0: Initializing card 0
[   16.163490] ivtv0: Unknown card: vendor/device: [4444:0016]
[   16.163491] ivtv0:               subsystem vendor/device: [104d:816d]
[   16.163492] ivtv0:               cx23416 based
[   16.163493] ivtv0: Defaulting to Hauppauge WinTV PVR-150 card
[   16.163494] ivtv0: Please mail the vendor/device and subsystem vendor/de=
vice IDs and what kind of
[   16.163495] ivtv0: card you have to the linux-media mailinglist (<a targ=
et=3D"_blank" rel=3D"noreferrer nofollow noopener" href=3D"http://www.linux=
tv.org">www.linuxtv.org</a>)
[   16.163496] ivtv0: Prefix your subject line with [UNKNOWN IVTV CARD].
[   16.221120] tveeprom: Encountered bad packet header [aa]. Corrupt or not=
 a Hauppauge eeprom.
[   16.221125] ivtv0: Invalid EEPROM
[   16.286450] iTCO_vendor_support: vendor-support=3D0
[   16.287559] cx25840 10-0044: Unable to detect h/w, assuming cx23887
[   16.288569] cx25840 10-0044: cx23887 A/V decoder found @ 0x88 (ivtv i2c =
driver #0)

I2C mapping looks different:

[   16.486000] wm8775 10-001b: I2C: cannot write 000 to register R23
[   16.489015] wm8775 10-001b: I2C: cannot write 000 to register R7
[   16.492025] wm8775 10-001b: I2C: cannot write 021 to register R11
[   16.494767] ieee80211 phy0: rt2x00_set_rf: Info - RF chipset 0003 detect=
ed
[   16.494815] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht=
'
[   16.495228] wm8775 10-001b: I2C: cannot write 102 to register R12
[   16.498773] wm8775 10-001b: I2C: cannot write 000 to register R13
[   16.501784] wm8775 10-001b: I2C: cannot write 1d4 to register R14
[   16.505141] wm8775 10-001b: I2C: cannot write 1d4 to register R15
[   16.508270] wm8775 10-001b: I2C: cannot write 1bf to register R16
[   16.511266] wm8775 10-001b: I2C: cannot write 185 to register R17
[   16.514249] wm8775 10-001b: I2C: cannot write 0a2 to register R18
[   16.517250] wm8775 10-001b: I2C: cannot write 005 to register R19
[   16.520254] wm8775 10-001b: I2C: cannot write 07a to register R20
[   16.523256] wm8775 10-001b: I2C: cannot write 102 to register R21
[   16.531703] ivtv0: Registered device video0 for encoder MPG (4096 kB)
[   16.531746] ivtv0: Registered device video32 for encoder YUV (2048 kB)
[   16.531893] ivtv0: Registered device vbi0 for encoder VBI (1024 kB)
[   16.531930] ivtv0: Registered device video24 for encoder PCM (320 kB)
[   16.531960] ivtv0: Registered device radio0 for encoder radio
[   16.531961] ivtv0: Initialized card: Hauppauge WinTV PVR-150
[   16.532019] ivtv: End initialization

As you can see in the log, card as a "cx23416" (same as PVR-250) but ivtv s=
till load "cx25840". Could I get it to load "cx23416"?

Nomeji





