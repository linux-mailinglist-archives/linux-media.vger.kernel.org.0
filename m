Return-Path: <linux-media+bounces-39397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F486B20045
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 09:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F4E18976B0
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 07:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97422D979C;
	Mon, 11 Aug 2025 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="irKdBM8/"
X-Original-To: linux-media@vger.kernel.org
Received: from forward200d.mail.yandex.net (forward200d.mail.yandex.net [178.154.239.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075D22D879D
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754897367; cv=none; b=XwmipSFD8coHlsPhHj+hgKh7LSHcQ5t8URnDw/YsNEG9DKaHXZxdmfezUpCVo9gxl6Wlz181h2jZwfReNDmYj2H8OTPtKvgP5yFAhMa2EGhp7hBitJE5a6hDx8QMpRnJnfTxmqBi9Gb6OsLVmVX/emT+tr8gmtdYFsn1stsBOJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754897367; c=relaxed/simple;
	bh=0QblFKt4KtT3o68zQb6/52ICN2vqwrFsixzr/mRSBxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qhpc87VjhZP6q3t33MXdVOJfu1jLoq8T6WZl+fJ0GSU/3AtAqNvF/VTcBuhtaWQfVGcV++084RJzkz3jlQyxYVdAd9jbSMygTHVPi6xKVkEzbdJhKRW9H+HjwLj2WKA7DZGbsze5+KpTTUPgMpuAtwnXsMoCO/HH9Z1vzqVp3t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=irKdBM8/; arc=none smtp.client-ip=178.154.239.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward200d.mail.yandex.net (Yandex) with ESMTPS id E20CE83070
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 10:23:36 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:c54a:0:640:9224:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 461DBC0082;
	Mon, 11 Aug 2025 10:23:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id RNDqVk8Mva60-CaWXqXSR;
	Mon, 11 Aug 2025 10:23:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1754897008; bh=KReswnU6R0K2wqBncAGDKX9PedBoxskZjqbSflDcOdY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=irKdBM8/iU9d3AJ1TBXj5cpzId9BYZ1AvD01UfBFjS8QyzdGgOYcaQlnLbIArq+xd
	 MzmA87yR0x1Yg3lBa85QDDeCNxHCC5B2YijswP6AuO2FBZZqOiO0tod7u8HHCWozDh
	 cIltPdkRvRS70jqwk//wUsv5ZkYjd8srA7B48R1Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2 1/2] Revert "media: xc2028: avoid use-after-free in load_firmware_cb()"
Date: Mon, 11 Aug 2025 10:23:25 +0300
Message-ID: <20250811072326.44569-1-dmantipov@yandex.ru>
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
v2: adjust to match the series
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


