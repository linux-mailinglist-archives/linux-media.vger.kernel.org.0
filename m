Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91AB33D1E3B
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 08:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhGVFqy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 01:46:54 -0400
Received: from ni.piap.pl ([195.187.100.5]:58548 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229955AbhGVFqy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 01:46:54 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 11C8BC3F3ECE;
        Thu, 22 Jul 2021 08:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 11C8BC3F3ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1626935248; bh=TZewdDZgacZtUowhOPGlDkORvlBWD6gtkVnIfG3c0Qk=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=B5qTK65ITrysEw6KTSRKFzW6wePNIYmF3eYVs0XiVMPWoMTte/rbhNfCV+faoWpv1
         kmmHvk5rc9qoLv5J/aTwnoSwmO0FPIre+2URwyzexvbvW/QjXGrrmADA/AGEH9+tY/
         O2RK9ud6el0tcmh3oGUrA0t8vgNluX9DHh9STOYo=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH REPOST] TDA1997x: replace video detection routine
References: <m3k0lmejlw.fsf@t19.piap.pl>
        <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl>
Sender: khalasa@piap.pl
Date:   Thu, 22 Jul 2021 08:27:27 +0200
In-Reply-To: <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl> (Hans Verkuil's
        message of "Wed, 21 Jul 2021 09:12:08 +0200")
Message-ID: <m3mtqedfsg.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165168 [Jul 22 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;piap.pl:7.1.1;127.0.0.199:7.1.2;t19.piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/22 06:10:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/22 02:59:00 #16939391
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

I have a problem with matching H/V sync polarities. It appears the
standard modes use different polarity settings, and HDMI doesn't have
separate sync lines, it uses in-band signaling. I don't know what
polarity should I set for the v4l2_find_dv_timings_cap() ->
v4l2_match_dv_timings() to succeed.

1. I can try all 4 combinations (+/+, +/-, -/+, -/-) and see if there is
a match. Seems weird to me.

2. I can add a flag to v4l2_find_dv_timings_cap() ->
v4l2_match_dv_timings() which asks for the polarities to be ignored.

3. I could add
 #define V4L2_DV_VSYNC_POS_POL   0x00000001
 #define V4L2_DV_HSYNC_POS_POL   0x00000002
+#define V4L2_DV_VSYNC_ANY_POL   0x00000004
+#define V4L2_DV_HSYNC_ANY_POL   0x00000008

and v4l2_match_dv_timings() would skip comparing them. A bit hacky.

4. I could also add
 #define V4L2_DV_VSYNC_POS_POL   0x00000001
 #define V4L2_DV_HSYNC_POS_POL   0x00000002
+#define V4L2_DV_VSYNC_NEG_POL   0x00000004
+#define V4L2_DV_HSYNC_NEG_POL   0x00000008

and, likewise, v4l2_match_dv_timings() would know what to do. This is
IMHO cleaner but requires much more changes in other code (like
drivers).

Any other idea?
Perhaps I should do "2"?

Thanks,
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
