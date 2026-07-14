Return-Path: <linux-media+bounces-67570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fyPlG3lGVmq22gAAu9opvQ
	(envelope-from <linux-media+bounces-67570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:23:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB988755BFB
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:23:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qKo++IFT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67570-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67570-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1332E32DE5C5
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363AE48034B;
	Tue, 14 Jul 2026 14:11:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA447F2F9
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 14:11:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038282; cv=none; b=tWgP6Svm489U9O8Yw9fH/C/T0fTib3V1JYgd+7HHirgulFows6yW2VAxOecO75cUM3aT3C7t9TNgggY+5dv2nJTr+2WwxJG1ZNhepMjmUbPGnhfBkmYQEEc/9vSPFDVVvxEb+HpulTBCMVtitpEcdOB4JzQg/aDJi0dzyhbo994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038282; c=relaxed/simple;
	bh=OwybD2uBs/wUrm5i2CpQEyB7SgIl3ZP7n2YWpoD4BkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqBzDGz7HIJWqTka998MTAblXvd5CqJopbPjPucoZl5+OiNgo5OT+F75fMZeCEb5UD+5vVp8l390MeJI9+Qih1xsuWmnkExt9jI+Bx0r+YkPiDUPgEnqKrQa61JRzPBLvpOru/J5KXTVDdccnCIA+YnkSrFBRLkUizpjQnl5ZqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKo++IFT; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso31770585e9.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038276; x=1784643076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=57DmToGB+ZEdZKgwoyVbvaECYpm5bszrCqHLiqk8iao=;
        b=qKo++IFTqnShGZ9oW41ktxlLp1k3YppTCJc4SVnWMAkYDdgmY0UtiQLFCZ87vEQmpU
         3cTpQQDjwX72Y3saESP4L6mic2bXfJ0v9HIpY8MYsEg4kqNNw7yUswU9Gashdy5X319U
         UNKlAAXyWZJZDvIACh7bCGS1bESlbXIJx326IbXriM3K9rD8fSlgloP0idItFWqATGhb
         Le6RL3HyHD2C5CvNSiEM7CpmBNKx/0WQcL0qHEsdQbU70bloxHlWNRiRrUcJUJzyhOF0
         GNSnsJRyCnyrh2MyH4MP+qV9hxSXLxUJUoT9tlFpr1R053uOjpShQrxVk6lfLC5dkCtl
         HIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038276; x=1784643076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57DmToGB+ZEdZKgwoyVbvaECYpm5bszrCqHLiqk8iao=;
        b=Sh8BmASi+ebC+mMOJrTkraIl7cQ5jOr5YitTx8litKlrJdOSK+2dOfd3ha1k8NqPh1
         tBGUxSXc7uN1t6WWsR+UNWsweADJqqJ3L2PhwdEXBkCug1URk+KY31esmQmvInAKZWgV
         luT0FRqdNJhnBT3POViAnXlViiDc621hG5LtueE6fXQf3sjhNlDbz8WT9rjwJvk3Pe4X
         kLnBXT+ZyzPYKJteoqWBAN+ydcT9OieQLdNI3PsQDoiJLaTp7bLNuOxMtxBB1SLY2qpB
         LIkSd1e9ZYoSX982vIWVwIMF7cB49766yYRuwXd8g9Kco3Cn6ekSItX7Jqr0Xxxq9f73
         G4LA==
X-Gm-Message-State: AOJu0Yyt6B+E1+579MPCzsGZATDat5q1+bRfLrhNYMmSQX6RhRycOboO
	5mzGamRaZ2pI3uw62Bpl8+7lVoKxzM9OzbjFoKEW1WT/ToYiDqqS1CyDhz77IX0tTDg=
X-Gm-Gg: AfdE7clHuz0eArh6aKMc/h9Yh0CQnSZDmTeIw8UqvYDggjvUo59hYZG9lnBYKe8oOQe
	j1wGg9j/1+1uky641oXUX5JIQYQeU6IUJeE0TBAj4r+DhRQxZD55OZfB8lDY0COO3l12m+I01Oc
	FhzS1GCmzc1lWH7iRBwkbUUVKfMv1OFif9prHqatNjGjfAsyHHGy7FfcpjZbePdsPRH3aSUY4CW
	hAQkeJ2NzsMnUPmGVk8h2sTfIUXLmEwkZNcFioarYF9PlSgi5zwh2tAi9OyWVU8zCJlVDZTMEAk
	zpyNk/6RD7O+5BEt5/MbMFEe5795/NfqP3VbyjuMKAvDpL4npkQTmSJ3Xbc1piE4aW9ZWDiC+2E
	yhqbwy15jhMqRIhHM3L4X+sVW5YWsyz9AM8n4CGvDlLZHbKOEv3wKbLpBimmWTjOMR/ZxWyYhzx
	/o7IcLAnwn5In4RHrIMXkcWPGmbRMN0zV0LyeUytOnClda/vbittduvEbLOIvhtasfdEtIDglJ1
	2OCWjYh31DLjS5TFukNBPQGRbOPw3Iq6urYL1xnqI6xHCiLz0hBCNOX+8MeKU6ZaSkiQPaK5A==
X-Received: by 2002:a05:600c:2e55:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-495158d666emr25042895e9.14.1784038275934;
        Tue, 14 Jul 2026 07:11:15 -0700 (PDT)
Received: from localhost.localdomain (p200300fcd7032080f4b140b3d1b24071.dip0.t-ipconnect.de. [2003:fc:d703:2080:f4b1:40b3:d1b2:4071])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2ed840sm73686275e9.10.2026.07.14.07.11.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 07:11:15 -0700 (PDT)
From: Rituparna Warwatkar <rwarwatkar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rituparna Warwatkar <rwarwatkar@gmail.com>,
	syzbot+e9a1f5e196de6663631b@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-core: fix feed leak on failed DMX_ADD_PID
Date: Tue, 14 Jul 2026 16:10:59 +0200
Message-ID: <20260714141059.63582-1-rwarwatkar@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67570-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[rwarwatkar@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rwarwatkar@gmail.com,m:syzbot+e9a1f5e196de6663631b@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rwarwatkar@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,e9a1f5e196de6663631b];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,vger.kernel.org:from_smtp,appspotmail.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB988755BFB

dvb_dmxdev_add_pid() allocates a new dmxdev_feed, links it into
filter->feed.ts and, when the filter is already running, immediately
starts the feed.

If starting the feed fails, the newly allocated feed remains on the
list. Subsequent restart and rollback paths may then operate on this
stale entry, leaving feed resources allocated and causing leaks in
drivers that allocate resources from ->start_feed() and release them
from ->stop_feed().

Remove the feed from the list and free it when
dvb_dmxdev_start_feed() fails.

Reported-by: syzbot+e9a1f5e196de6663631b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e9a1f5e196de6663631b
Signed-off-by: Rituparna Warwatkar <rwarwatkar@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6..6a825d9bae4 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -884,6 +884,7 @@ static int dvb_dmxdev_add_pid(struct dmxdev *dmxdev,
 			      struct dmxdev_filter *filter, u16 pid)
 {
 	struct dmxdev_feed *feed;
+	int ret;
 
 	if ((filter->type != DMXDEV_TYPE_PES) ||
 	    (filter->state < DMXDEV_STATE_SET))
@@ -901,8 +902,14 @@ static int dvb_dmxdev_add_pid(struct dmxdev *dmxdev,
 	feed->pid = pid;
 	list_add(&feed->next, &filter->feed.ts);
 
-	if (filter->state >= DMXDEV_STATE_GO)
-		return dvb_dmxdev_start_feed(dmxdev, filter, feed);
+	if (filter->state >= DMXDEV_STATE_GO) {
+		ret = dvb_dmxdev_start_feed(dmxdev, filter, feed);
+		if (ret < 0) {
+			list_del(&feed->next);
+			kfree(feed);
+			return ret;
+		}
+	}
 
 	return 0;
 }
-- 
2.47.3


