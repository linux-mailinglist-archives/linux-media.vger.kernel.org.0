Return-Path: <linux-media+bounces-38955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6176EB1C1C0
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 10:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51B1620FD4
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 08:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD11B2264CD;
	Wed,  6 Aug 2025 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="VVFk85KV"
X-Original-To: linux-media@vger.kernel.org
Received: from forward205d.mail.yandex.net (forward205d.mail.yandex.net [178.154.239.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3721D3E4
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467319; cv=none; b=fMbwevCxl3teNExHX4v7yTc6TEK/T+RSYESsLjPi/CvHSsrfQDYsetXcwpYo+rcC2et+ZbyLWDWJWVD7dDK0i50DNc+GFLATzKkMp75fojeNsaitwNdfKmJIIlFuiXQKXWyveCxqsdDBvbwdTgqaIdcZ0cFtCdE8WX8xW7hqn0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467319; c=relaxed/simple;
	bh=6O98WA5dPkOln/mPCTwak8JqQOFcD4GVbu7oqZUe1sw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XnaTdSEd95Z1RQkZ+hxJwuPt7wxlWMyw/6USLvIB/FBJzzYDDrOnmNPa/gdx1FBBxgEJvBMs6fwIJd2PWVZ1uNwE9XH1MfP0LuWFohwUTyPQp1FZsW1ijeedyHsc9f2AyUblVvQ1SAJSwnyrsH7gsS9Uqpn4ePVA12CppX82AD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=VVFk85KV; arc=none smtp.client-ip=178.154.239.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d102])
	by forward205d.mail.yandex.net (Yandex) with ESMTPS id 9850386A10
	for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 10:55:15 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1ba9:0:640:b084:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 16A19C0136;
	Wed, 06 Aug 2025 10:55:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 5tb4x7DMHmI0-kTEqHNYR;
	Wed, 06 Aug 2025 10:55:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1754466907; bh=kOIvAyWX8hBsN3Q13yOB85ipwSo5DGyrdvt2k5SQ3CQ=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=VVFk85KVFCn2dseMKJLx/UTn9VGoB+B2oDEkzvkT/vDnm0EaeKT1OHJZJU7ekjM1Q
	 iyglq+2W3M2yk1jkTiFe+ZR0Jgh3A15yFTqF38EKcjY9q0hbgBHAMfyetdaCD3/Pp+
	 RL82o/Axv3zOlFMDnpvsyv102D8/J9BgJeN06cw8=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 1/2] Revert "media: xc2028: avoid use-after-free in load_firmware_cb()"
Date: Wed,  6 Aug 2025 10:54:08 +0300
Message-ID: <20250806075409.210489-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert commit 68594cec291f ("media: xc2028: avoid use-after-free
in load_firmware_cb()") since it doesn't make sense to check
dangling 'struct dvb_frontend *' passed to 'load_firmware_cb()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/tuners/xc2028.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/tuners/xc2028.c b/drivers/media/tuners/xc2028.c
index 8e6638e5f688..807585d2dfde 100644
--- a/drivers/media/tuners/xc2028.c
+++ b/drivers/media/tuners/xc2028.c
@@ -1361,16 +1361,9 @@ static void load_firmware_cb(const struct firmware *fw,
 			     void *context)
 {
 	struct dvb_frontend *fe = context;
-	struct xc2028_data *priv;
+	struct xc2028_data *priv = fe->tuner_priv;
 	int rc;
 
-	if (!fe) {
-		pr_warn("xc2028: No frontend in %s\n", __func__);
-		return;
-	}
-
-	priv = fe->tuner_priv;
-
 	tuner_dbg("request_firmware_nowait(): %s\n", fw ? "OK" : "error");
 	if (!fw) {
 		tuner_err("Could not load firmware %s.\n", priv->fname);
-- 
2.50.1


