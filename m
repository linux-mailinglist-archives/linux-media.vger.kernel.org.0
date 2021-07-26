Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B063E3D57B4
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 12:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbhGZKCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 06:02:25 -0400
Received: from ni.piap.pl ([195.187.100.5]:40898 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231421AbhGZKCY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 06:02:24 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 4CB21C3EEAFB;
        Mon, 26 Jul 2021 12:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 4CB21C3EEAFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1627296169; bh=h5F/ccIc1LjBkesZOGDYTqVeXsD195AfNPyVZvbGQd4=;
        h=From:To:Cc:Subject:Date:From;
        b=XEHXhSH3b9j6Um0DbIZwfWX73FM8Al9ZtpFY0bIXRK8MabUuYlIxJpkvX6u9aLa3k
         RcfQrnNEZBrntyLpdD9oNtbjNeTybn4RPdka6d/QKPxWdj9PukB7dZm2QbacB/vxIK
         Rtqirrx1ZggqtQ4euHqBri2fsCFyX5no3VaxP54U=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Fix cosmetic error in TDA1997x driver
Sender: khalasa@piap.pl
Date:   Mon, 26 Jul 2021 12:42:49 +0200
Message-ID: <m3a6m9cq52.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165240 [Jul 26 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;t19.piap.pl:7.1.1;piap.pl:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/26 09:41:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/26 07:37:00 #16957752
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The colon isn't followed by anything here.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 91e6db847bb5..e55e4afaae8a 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -563,7 +563,7 @@ static void tda1997x_delayed_work_enable_hpd(struct wor=
k_struct *work)
 						    delayed_work_enable_hpd);
 	struct v4l2_subdev *sd =3D &state->sd;
=20
-	v4l2_dbg(2, debug, sd, "%s:\n", __func__);
+	v4l2_dbg(2, debug, sd, "%s\n", __func__);
=20
 	/* Set HPD high */
 	tda1997x_manual_hpd(sd, HPD_HIGH_OTHER);
