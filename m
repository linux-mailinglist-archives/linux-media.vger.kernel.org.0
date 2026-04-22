Return-Path: <linux-media+bounces-59345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL1HAmrh6GkHRQIAu9opvQ
	(envelope-from <linux-media+bounces-59345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 16:55:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D539447940
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 16:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D55730DEB68
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCD4223DD4;
	Wed, 22 Apr 2026 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCrBVQ07"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C21318EE4
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869267; cv=none; b=i6shX+V+xHx2pwIFqLsn/AJWWR8FARcR0RRhWOTAYdB1J6f5bBKE3cOkHhZYshUz+8bIlNFeUawuIs8mHYTyKRuOeJIlUbbbwdaW6QQnPXBxhZU+w8n273libJpAhUsdDlsLXqnAak8dS/qtUNCPzUzay2t/DQb6m2AbCObk3jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869267; c=relaxed/simple;
	bh=+B/NESwsCaw3fNDb4vLX9lXWsiTZ4GQCNwTVw3G0D2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/zUA1brTj+1lwkQF0b8wJxtelXMlzypITRd8J1454d8EA6Kzm+5hLAEzvgdZiiHYk3ldzuZH4gPKx9ER4dpLssFGBvph+aWnoAk/y+1oaPS/qXrn9KseKiQpJPG8AGnMZej6Bbo4CvtNh2X6ddlnc1eeKWe9iy7PaPcIk0Fkd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCrBVQ07; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c795a47186bso2274445a12.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 07:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776869265; x=1777474065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAB1mHA/CNfSisiTk2OltjgaZv+ctRVr27O5r3zLjx8=;
        b=FCrBVQ07EM+6iL1AjYw0R/xYf1EyxdCPu6jBM0AxvP4Zn0lMAEsXiecU9RURw962q/
         ZCLpaRSkUWk4eyC3sZFItLk+6vL3/Ts++dBYFJntd4aO//j5xSdk5wUCBDtIrkc5azuX
         cz68SObwBxlqlgxoqeZK+MrFRWOnd69fgtk+cYTiuTowl/F9jwvvrfZF/cC5VCA4+Zw4
         tM77v8cgJulf2ZroHULqMbbJWDximBP8oXEMtoN2e8Rk7gqnTuNzy1oB1NpmnF8FAg4U
         e8KwP5tYtVsl/2XfscznNYG5692RM0PESPnYsjqoj4vxMUNpQHZC+oEv3WkLOXDdXQKW
         tcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869265; x=1777474065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAB1mHA/CNfSisiTk2OltjgaZv+ctRVr27O5r3zLjx8=;
        b=hGZc1yPxzHh3zPEe10hQFSZ5N0i/o29UGATEOMM8OxQDU86qhhT8GPcVMVgr4AxvIG
         Yog9wqWgiwQwPsa8f3FoqThQFmLSzx0rJn/SGft3va+GAScy31tSKyepAeJ9CekQHo1u
         e41w2cKROIWYs9MZYfl2jv5DDqGcZoTuVd+w6Wv1S/nYIVuTXtldwNS08813FLPCFAsP
         WRn0DlHehhBaynRqH3+wjCIAxfbiL2cYlgYlvTHMwzgbYLvpHfRGY6L4c2qgGk2AW6Ah
         auPmg4TufXNcF1z6099eKikLFpFKCXZTb1VA2JttYxXk3XXFtZS9BTrGhAsjNozWq4Md
         /R3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8xwGVLq+FFESwhJd+Xf+0AXpji33bHRkLJiWQ9f7nL9Ef8ptH1rGle+OtvVvb6JEx05gtjBQayUsyEVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT1vC5fgdwXJLHvmn2MokWHsUCfJwM9/5Irkqo5ePHNEpgLI8U
	pgrOF4edTuVEr8dohCBqgN98YN1ujgM6cz4tFvJrJt2OlOqVgOJVjJcT
X-Gm-Gg: AeBDies3rMFEbDlxlic9QR1xiEFNn6abPFbV+KzJoDHA2h6AbTu3ZfUn+v3qPIlXPG3
	/dg9YhTcHbpWoEZDUputXJ7gObReqxUhp7VrERl89hwscZWmjQcPs5JbC9PDNWZMyBu3zgpGOPw
	D3r9NEytqJwhMz9HdXW+AQirltUxvlz38UKP5WXQy7pyICtUPaQXC4YXdg2jKeKnbu5RrBmfvkI
	oVGuLKHCebgXG+bu0LOgTNPNq09FmdAyYlR4X2m356p7KpPB4v8DNkILGgnmKxch/ymHIq+d45I
	4OOPzjLm5MJBiICLw2WWCTnP5Ifi7jIdlpfwYIqvWTlWQMGhQ9Y/5PXbByzZljD+HbnELPrf7zF
	dSHK7JfQc5ANoglfZqRylCSmdzVCKOt0HBq5CyD0+cFML+eN0qxOtSg1XZvUBQfsGvYh8tdyyMK
	PafrbVRC/sA/x4WQP/YrqvxzW4cxm4qFcN4I1FY+f7JKdBEJcHjLSSTjeRTfTJyKNiAR8dbSlhm
	hR0YJ2bI9F/2bP2tQ==
X-Received: by 2002:a05:6a21:790b:b0:3a0:c285:e511 with SMTP id adf61e73a8af0-3a0c285f10bmr10916495637.24.1776869264848;
        Wed, 22 Apr 2026 07:47:44 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:3191:a257:32a3:b02c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f370sm13748370a12.7.2026.04.22.07.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:47:44 -0700 (PDT)
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
Subject: [PATCH v3] media: rtl2832: fix use-after-free in rtl2832_remove()
Date: Wed, 22 Apr 2026 20:17:34 +0530
Message-ID: <20260422144734.25650-1-kartikey406@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,axentia.se,iki.fi,vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59345-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,appspotmail.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D539447940
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
v3:
  - Fix missing PATCH v2 prefix in subject line
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


