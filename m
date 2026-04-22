Return-Path: <linux-media+bounces-59344-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KbYB5vf6GmeRAIAu9opvQ
	(envelope-from <linux-media+bounces-59344-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 16:47:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7675644773A
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 16:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E7D9307ABB2
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561A03EDAB2;
	Wed, 22 Apr 2026 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6vQOg1G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9E33ED5CF
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776868954; cv=none; b=jDq42IcWqHkVgtcYMTAhA+qlTUBUY2U04/dl6QVhmmdp7UVCSGFV31pTg7B0bsO6LLdKqi/NbURCPUfyzvAJ9NuajMB/WDd0CfoP4V/Rp3htORyo4u/qTM5QqbWbTbp3EeY0rCEgyhKvrdN33yk5pN6eUqUTMVXK2p2oM2UWLS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776868954; c=relaxed/simple;
	bh=6dGN6Sq4pulKWzbvWVOYJFY20pxbzEfT1MRlfUCn07E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hn+/7QdsSx0O3uv0wq6tP8ZlbXhxrccwgdFNDbNku+Q2bw9r4Guf2tchALguO1OI3v86BNIBuP6LhPcrhODDqrBjGonstPLwpiYNitQnr6dxNsLPpXj1hq3WNmr83nL7U4c/+uhivm0BIY2YLoylwGWSvonpu+J7P0VnR4UhB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6vQOg1G; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d90833cacso3550232a91.2
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776868953; x=1777473753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BHaNKO4Vutd56sTBzf6LEct1U2PUWECXwrtGsxsQdI=;
        b=Q6vQOg1GD6sM9OURS7LFyoJU7tLASwZrHSIKTgqM/SNX1LqY0LFVtiLNFzIG3Q9Sbn
         Fe9nO8iZNPmjrZWvg23v1Nv3YWAOq6+47jt73IFZng0pcJM3Tp6LMRsr6NfAxOslt+Rg
         na4o/MdWZnza+XX616h7vvUGOfh3HEpsBxlIUVIPvoea6Xc5bN0wchDBScKn4RpHXoqe
         izK/Z+Fol7xq+jdLKRC/OjXecxOHozTgcF33Ey0bpozHfOf0o9+AYGq2/Jdoqu5Unz0i
         rXLLBUq8cNq14ZDFRgfSg+hUUkaeINycdKZtRmGyUl9SeUw/OTaMwiW5fHzyMBYshH7Y
         tvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776868953; x=1777473753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BHaNKO4Vutd56sTBzf6LEct1U2PUWECXwrtGsxsQdI=;
        b=edsmo0W0E34L6MK8bCprG6a7lgdtjTqXp3rKVSLSQjlInkgsBFqiAJ9zqU6wcZUpkM
         l4JCCSk+kIwanCjb1NU/XX6xX7egGXrO9Xi9CV72LE6DkCUoqvN7SLpPjgUeNvgFSzNE
         QOUMYrGlAL/Q9G68ms4FzyVH25yYFetkLgnXkICaa93gwjg1TTvq1gwMFhpyhcAwFvWE
         rtBEoZOjpT2YbmVgYcNQnBi9YGYliutcAix9n8fHalLVrSFDyO2objbumGlPrA+hLjhA
         FoRs+Yo+NYC2V68Oq9JUrU4JmIfQ9uoNdmXIkSdDS7vBiABETqwPV8cICcb8Sz+58vJV
         8vQA==
X-Forwarded-Encrypted: i=1; AFNElJ9PlAEuy+JwYXgZQmQFmuIDjWp9j+cgIGCXXIMujFuOAZqxQ/Z4wNRA3uqPL3xgA6NQRHQVTjrAgc+jhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXwD5Y26iMnaPzuQpYHRUm93VY/fuOvOtXxC89oACt/3NnmNVK
	Dtnb9WF93+Rw48XvwO1iY33VGNwXYagDhT4v3/dThvMvf9187A3/Ao4hI3Y/fJsX
X-Gm-Gg: AeBDieuDDv96z8k0P7YRplX73zjGlJNUIvy91pkju5BoNVqQ5PaZNZSlssG05gZvGBY
	Wd4dm+UYyJKhYkIc9yYRsEIDpS63Yi6ywsd7KGlEQCatcAj+KMOwu8lQ8GyX9p2xUuaIV43vYBZ
	fKjG1pjqZLE+veqZBUBTNEvfcgwibr8DHKZqzrplhDcc/s2ZkPC9AGzjSJNB8k5dT9uYfsL4nil
	Q/Rom/qiCfy3zqPgAC4+VtdDViFCQuoWIwzILu+kKfPe0lunGqppVx0cHTWCcxUEUsua1cDYJLj
	Z+0X6UgQsYr8okMRCTE3I6TtGUibYnOr0C18kwHF1aiafkbpJl+DxQbCgh984/bBZL8+KRAbZc3
	z8NHHJSE6KuYB3bbVuGchWe419C9Oay5Cw0PU6WiczEo9mEZU+1oDszzY3We/M9xjxzDB8MsOkS
	f5c7lt1JvcOtN2Aj7nPfLo2eZ3LCxtilmqDzqnlWRuDzd1VllfSYCcOdBmaxD5dVbq7FXw7DFRc
	0Z8k5uuoq2L6o1eKA==
X-Received: by 2002:a17:903:17cb:b0:2b4:6083:6c15 with SMTP id d9443c01a7336-2b5fa055a6bmr214881525ad.41.1776868952844;
        Wed, 22 Apr 2026 07:42:32 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:3191:a257:32a3:b02c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20d33sm177878725ad.63.2026.04.22.07.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:42:32 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org
Cc: kees@kernel.org,
	peda@axentia.se,
	wsa@kernel.org,
	crope@iki.fi,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	stable@vger.kernel.org,
	syzbot+019ced393ab913002b75@syzkaller.appspotmail.com
Subject: [PATCH] media: rtl2832: fix use-after-free in rtl2832_remove()
Date: Wed, 22 Apr 2026 20:12:21 +0530
Message-ID: <20260422144221.25544-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,axentia.se,iki.fi,vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59344-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,019ced393ab913002b75];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 7675644773A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

cancel_delayed_work_sync() is called before i2c_mux_del_adapters()
in rtl2832_remove(). While the cancel waits for any running instance
of i2c_gate_work to finish, it does not prevent the timer from being
rescheduled by a concurrent thread.

During probe, the r820t_attach() call attempts I2C transfers through
the mux adapter. These transfers go through i2c_mux_master_xfer(),
which calls rtl2832_deselect() after the transfer completes,
rescheduling i2c_gate_work via schedule_delayed_work(). If this
transfer is still in flight when rtl2832_remove() runs,
rtl2832_deselect() can reschedule i2c_gate_work after it has been
cancelled, causing a use-after-free when kfree(dev) is called.

Fix this by calling i2c_mux_del_adapters() before
cancel_delayed_work_sync(). Once the mux adapter is unregistered, no
new I2C transfers can go through it, so rtl2832_deselect() can no
longer reschedule i2c_gate_work. The subsequent
cancel_delayed_work_sync() is then guaranteed to be final.

Fixes: cddcc40b1b15 ("[media] rtl2832: convert to use an explicit i2c mux core")
Cc: stable@vger.kernel.org
Reported-by: syzbot+019ced393ab913002b75@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=019ced393ab913002b75
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2:
  - Fix Signed-off-by email address (lowercase k)
  - Add Cc: stable@vger.kernel.org for stable backport
---
 drivers/media/dvb-frontends/rtl2832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index d8e1546aea5e..9898f729304a 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -1115,10 +1115,10 @@ static void rtl2832_remove(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "\n");
 
-	cancel_delayed_work_sync(&dev->i2c_gate_work);
-
 	i2c_mux_del_adapters(dev->muxc);
 
+	cancel_delayed_work_sync(&dev->i2c_gate_work);
+
 	regmap_exit(dev->regmap);
 
 	kfree(dev);
-- 
2.43.0


