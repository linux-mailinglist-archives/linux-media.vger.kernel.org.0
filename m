Return-Path: <linux-media+bounces-48642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF798CB6CDF
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 18:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AE3D301E173
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 17:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFDC3191D8;
	Thu, 11 Dec 2025 17:23:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from postmaster.electro-mail.ru (postmaster.electro-mail.ru [109.236.68.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B03315D30;
	Thu, 11 Dec 2025 17:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.236.68.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473794; cv=none; b=GQUV5CICnlDAS7D49ZldDqIGi/ohcHrkavlZYZLHXPYWJ6l90pNJb3XKcKwpYLMc44cNcL5URh6bEmdSF8169JpCEWvSkr8bJ03Mcvk7jVgbs2gJWIFB2Jv8s0350Cs9rdEujxf4DBiwhB9XUCIVnKSudalucDEFN8C0Jm+hGnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473794; c=relaxed/simple;
	bh=5kTnzLw9h0nqYQ0Da0jFetKmIps/O1s/hhlFyqbaM2M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X7cTirmODMi5Puoyyje7KlBxRLeRlUrQWuuftMAaSxYGbCM0avraA6/9NUeI/mY5+DuUH/nlokJKccZLuASNchkXoX2Mr4vOSYTg5o06h3xlL/rG41ibt926K07Y3ZIbfnvMnTPUmrL4U7Xc7RW6jGKqiaC7PuMCHaol+Zzw0uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tpz.ru; spf=pass smtp.mailfrom=tpz.ru; arc=none smtp.client-ip=109.236.68.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tpz.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tpz.ru
Received: from localhost (localhost [127.0.0.1])
	by postmaster.electro-mail.ru (Postfix) with ESMTP id BB4781006D27;
	Thu, 11 Dec 2025 20:23:05 +0300 (MSK)
Received: from postmaster.electro-mail.ru ([127.0.0.1])
	by localhost (postmaster.electro-mail.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id RtWFXYXG8TJ7; Thu, 11 Dec 2025 20:23:01 +0300 (MSK)
Received: from postmaster.electro-mail.ru (localhost [127.0.0.1])
	by postmaster.electro-mail.ru (Postfix) with ESMTPS id 8D4251006E44;
	Thu, 11 Dec 2025 20:23:01 +0300 (MSK)
Received: from email.electro-mail.ru (unknown [10.10.0.10])
	by postmaster.electro-mail.ru (Postfix) with ESMTPS id 71B4C1006D27;
	Thu, 11 Dec 2025 20:23:01 +0300 (MSK)
Received: from lvc.d-systems.local (109.236.68.122) by email.electro-mail.ru
 (10.120.0.4) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 11 Dec 2025
 20:23:00 +0300
From: Ilya Krutskih <devsec@tpz.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Ilya Krutskih <devsec@tpz.ru>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH v2] media: dvb-frontends: Fix out of bound for buffer
Date: Thu, 11 Dec 2025 17:22:49 +0000
Message-ID: <20251211172251.852254-1-devsec@tpz.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-KSE-ServerInfo: srv-mail-01.tpz.local, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 09.10.2024 20:59:00
X-KSE-Attachment-Filter-Scan-Result: Clean
X-KSE-Attachment-Filter-Scan-Result: skipped
Content-Transfer-Encoding: quoted-printable

Result of pointer shifting is out of bound for buffer 'prev_swp_freq'
because of incrementation inside 'while' cycle in case more than
20 steps of it.

Add check: prev_freq_num < 20

Cc: stable@vger.kernel.org # v5.10+
Fixes: 9a0bf528b4d6 ([media] move the dvb/frontends to drivers/media/dvb-=
frontends)
Signed-off-by: Ilya Krutskih <devsec@tpz.ru>
---
 drivers/media/dvb-frontends/mb86a16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-fr=
ontends/mb86a16.c
index 9033e39d75f4..da8985b91475 100644
--- a/drivers/media/dvb-frontends/mb86a16.c
+++ b/drivers/media/dvb-frontends/mb86a16.c
@@ -1188,7 +1188,7 @@ static int mb86a16_set_fe(struct mb86a16_state *sta=
te)
=20
 			signal_dupl =3D 0;
 			for (j =3D 0; j < prev_freq_num; j++) {
-				if ((abs(prev_swp_freq[j] - swp_freq)) < (swp_ofs * 3 / 2)) {
+				if ((prev_freq_num < 20) && (abs(prev_swp_freq[j] - swp_freq)) < (sw=
p_ofs * 3 / 2)) {
 					signal_dupl =3D 1;
 					dprintk(verbose, MB86A16_INFO, 1, "Probably Duplicate Signal, j =3D=
 %d", j);
 				}
--=20
2.43.0


