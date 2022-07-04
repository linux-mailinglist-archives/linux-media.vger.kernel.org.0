Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF35565D63
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 20:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbiGDSMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 14:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiGDSMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 14:12:18 -0400
X-Greylist: delayed 426 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Jul 2022 11:12:18 PDT
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E69811148
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 11:12:18 -0700 (PDT)
Date:   Mon, 04 Jul 2022 18:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
        s=protonmail3; t=1656958336; x=1657217536;
        bh=ZnzzJtn16ug2VxJv1P4n2c+HWc+tuEZfLUP/p3UOZoE=;
        h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=ZOVVKmPpIIanUf5H/adjMmzA9HSxBQFf31TmZofNzw4u1PEPy5myX0z5RfwSs7gr+
         qdbC1ZTUZibXhpiQwQ4cxmwvcsHmfBO1sc7S/BFNB8zeaZyoGqT760G6Kfgh1Bdx7e
         Yj7MaymkMzC8Vi/cOLMglDv4YHo115DlVbL8g8+P1hOB4rau1xq3wVUo8dzjsuxR5j
         XhPeKZyToR0qLWd7Y6nzbhPvTli0HiUVCW5+fnlDZn3m2apPhR4BvaR21KxEbM/y/Y
         J5YryBz/Iftv0mnJNoHKC7rFt3MKhwsbcH5eY/0h2fcm/btF6mPaBtQMWiLX4CfspP
         SXHm0cCBKO+/g==
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   =?utf-8?B?44GL44GI44Gn?= <kaede-kaede@protonmail.ch>
Reply-To: =?utf-8?B?44GL44GI44Gn?= <kaede-kaede@protonmail.ch>
Subject: Undocumented DTMB(DMB-TH) TV Tuner in Linux
Message-ID: <-tU3OPX9YqadLpJ81gNZczgxJYJBHz6oc6r8BO5GvcDrTKag70UyQIpbkuiOV_KdoFrjczt3Ul7OuxFxgvdzUiMPo1mnNA76SiMh_q14ork=@protonmail.ch>
Feedback-ID: 28282037:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
I just got my hands on 2 DTMB(DMB-TH) tuners. One of them is USB, and the o=
ther is PCI. Yes, PCI, not PCIe. I am not sure how to get them to work in L=
inux.

I checked the LinuxTV Wiki but no success. Neither of my tuners are documen=
ted anywhere as far as I can tell.

These cards/sticks=C2=A0are very hard to come by(I got these 2 used) as I b=
elieve none of the manufacturers still makes them, So I couldn't just get a=
 card that is supported by Linux out of the box. I asked many local shops a=
nd all of them says there are no stock.


Both of them:
- included a remote control and seems to have a IR receiver.
- Acts like a DVB-T tuner card when used in Windows
- Usable in=C2=A0VLC on=C2=A0Windows after installing the driver from the i=
ncluded CD.


The model of the USB stick is MyGica D675.
It has 3 chips on it.

- Legend Silicon LGS-8G75-A1-C-LB1 (Demodulator)
- MAXIM 2165E (Tuner)
- Cypress CY7C68013A-56LTXC (USB Interface)

Which is=C2=A0simiar to=C2=A0https://www.linuxtv.org/wiki/index.php/Coship_=
CDV5060-TH

The model of the PCI card is MagicPro ProHDTV Deluxe

It has the following chips:
- Legend Silicon LGS-8G75-A1-C-LB1 (Demodulator)
- NXP TDA18271HDC2 (Tuner)
- NXP SAA7135HL/203
- NXP TDA8295
- ATMLH952
- HC4052
- KS012


I hope it's possible to get both of them working in Linux, but I=C2=A0have =
no prior knowledge in any serious development project. Please point me to t=
he correct direction if possible. Thank you.

Best regards,
Kaede
