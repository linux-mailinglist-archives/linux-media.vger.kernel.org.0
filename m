Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585513D57C0
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 12:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhGZKGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 06:06:02 -0400
Received: from ni.piap.pl ([195.187.100.5]:41428 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231421AbhGZKGB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 06:06:01 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id B5FB0C3EEAF4;
        Mon, 26 Jul 2021 12:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl B5FB0C3EEAF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1627296388; bh=ZkJrXiDbEUSVRRGepR3fY2i121HkkHGkjcgykLuX9uQ=;
        h=From:To:Cc:Subject:Date:From;
        b=OK/NdLdtyhoyrRzWruroNcHNz+ofVswrgHvgqfXw9PeyR5sYMU2hc2w1cMqh+pZYk
         BMIeJZUlznNFeTgx6LmPMAMKqJZ65lhZbAjIJPrWn2qpPS5CLJgnuYeWTUGooH5sQa
         Ga6MkcmOg2NyD/YQdgIfpVThvtZZRSCHz8zrd/cg=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] TDA1997x: fix tda1997x_query_dv_timings() return value
Sender: khalasa@piap.pl
Date:   Mon, 26 Jul 2021 12:46:28 +0200
Message-ID: <m31r7lcpyz.fsf@t19.piap.pl>
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
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;t19.piap.pl:7.1.1;127.0.0.199:7.1.2;piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/26 09:41:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/26 07:37:00 #16957752
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 043cc8275d00..cbfe58e413e9 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1695,14 +1695,15 @@ static int tda1997x_query_dv_timings(struct v4l2_su=
bdev *sd,
 				     struct v4l2_dv_timings *timings)
 {
 	struct tda1997x_state *state =3D to_state(sd);
+	int ret;
=20
 	v4l_dbg(1, debug, state->client, "%s\n", __func__);
 	memset(timings, 0, sizeof(struct v4l2_dv_timings));
 	mutex_lock(&state->lock);
-	tda1997x_detect_std(state, timings);
+	ret =3D tda1997x_detect_std(state, timings);
 	mutex_unlock(&state->lock);
=20
-	return 0;
+	return ret;
 }
=20
 static const struct v4l2_subdev_video_ops tda1997x_video_ops =3D {
