Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B843D1E6D
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 08:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhGVGDC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 02:03:02 -0400
Received: from ni.piap.pl ([195.187.100.5]:60940 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhGVGDA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 02:03:00 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id B9440C3F3ECE;
        Thu, 22 Jul 2021 08:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl B9440C3F3ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1626936213; bh=QBdm2p+QSeNLdiseFpUuaUBT1xNKHEtEcSWQ/raiArw=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=Pyxf+rDpFZqwQ0ptJGNqkE2Mk1syPOIjwIiaYezFnqNr9Q0HtB62zxo2kkOOqPioL
         l7vkvRUDLvgQ+qnzBJvuo7j92w1t92+ZAWp34YeauqY43nRvnqJz+J7kWHdYBEd1Up
         fuM0v6im1MBco3V+E0d1jFmmY9ShdYMpq1MnHWLc=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH REPOST] TDA1997x: replace video detection routine
References: <m3k0lmejlw.fsf@t19.piap.pl>
        <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl>
        <m3mtqedfsg.fsf@t19.piap.pl>
Sender: khalasa@piap.pl
Date:   Thu, 22 Jul 2021 08:43:33 +0200
In-Reply-To: <m3mtqedfsg.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
        "Thu, 22 Jul 2021 08:27:27 +0200")
Message-ID: <m3im12df1m.fsf@t19.piap.pl>
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
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;t19.piap.pl:7.1.1;piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/22 06:10:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/22 02:59:00 #16939391
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also, I have spotted an interesting loop condition in
drivers/media/v4l2-core/v4l2-dv-timings.c (dated 2013,
d1c65ad6a44b0ff79d2f0bf726fa6fd9248991f4).
It obviously works (unless the table grows to 600+ entries), but I guess
I should make it "standard", shouldn't I?

The first case is pretty normal:
@@ -159,10 +161,10 @@ int v4l2_enum_dv_timings_cap(struct v4l2_enum_dv_timi=
ngs *t,
     u32 i, idx;
=20
     memset(t->reserved, 0, sizeof(t->reserved));
-    for (i =3D idx =3D 0; i < ARRAY_SIZE(timings); i++) {
-        if (v4l2_dv_valid_timings(timings + i, cap) &&
+    for (i =3D idx =3D 0; v4l2_dv_timings_presets[i].bt.width; i++) {
+        if (v4l2_dv_valid_timings(v4l2_dv_timings_presets + i, cap) &&
             idx++ =3D=3D t->index) {
-            t->timings =3D timings[i];
+            t->timings =3D v4l2_dv_timings_presets[i];
             return 0;
         }
     }

This is the interesting part:
@@ -179,10 +181,10 @@ bool v4l2_find_dv_timings_cap(struct v4l2_dv_timings =
*t,
     if (!v4l2_dv_valid_timings(t, cap))
         return false;
=20
-    for (i =3D 0; i < ARRAY_SIZE(timings); i++) {
-        if (v4l2_dv_valid_timings(timings + i, cap) &&
-            v4l2_match_dv_timings(t, timings + i, pclock_delta)) {
-            *t =3D timings[i];
+    for (i =3D 0; i < v4l2_dv_timings_presets[i].bt.width; i++) {
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+        if (v4l2_dv_valid_timings(v4l2_dv_timings_presets + i, cap) &&
+            v4l2_match_dv_timings(t, v4l2_dv_timings_presets + i, pclock_d=
elta)) {
+            *t =3D v4l2_dv_timings_presets[i];
             return true;
         }
     }

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
