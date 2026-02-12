Return-Path: <linux-media+bounces-52654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yInhIfHIjWlB6wAAu9opvQ
	(envelope-from <linux-media+bounces-52654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:34:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B12912D796
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A776D300A334
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 12:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE2C357715;
	Thu, 12 Feb 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQmldpjv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522101E868
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770899687; cv=none; b=DcV3wX5R2GeXnmUE1hwTRzX6QgJ+ijJgvuLiObRkEEJsGpPxkQGAcG1ZGrlnT8ASLIMx21FNBzO2hZBCH+ZigQLOiEV86gmIgYJp0Rdekl3PEC7zbO0rf0hGFlXkPWhiPOQkALgTn26uSD0086uGSZMsCBk/gmVvZucpLAEuN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770899687; c=relaxed/simple;
	bh=pTlLENM4KFN1fV0AsQ7fLu7ezsv6CatNa3QmIAJqWXg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dhiHs49eOrUCswc21SOKesteYY6qhdgGVunrPmqFUWpZpp/PAo6f8OLeJPWcgm0JTW5klogck4mgzJtv4i9oH1L2P6pvKKfNH9oxkUZ09BZXMcojO8voZaSKXn3w2PJyPsn+Oub8wR4BW1vBs9qnNuknsUUZ+7Rl9oZTpjQhAQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQmldpjv; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2aae38670daso1805265ad.3
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 04:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770899684; x=1771504484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQSolRZnr9mm+ZmPdt1LC6FFwmI84can5nHMywbBuoE=;
        b=UQmldpjvgWlubi+5sTbFH7TVP5iesAZ3RZfHu6vlUyz4eRY4FVO3CTefZDm/+Ej/gT
         VurOs6YEiNGcv+TAJoQ6ab42MUw8G4P9kBUJpRjAdc5XFHkit0sxJnQNPOD+IsxZIXNT
         /iRgK9JARorI/1ZTk1wdrRIkP60+Vj4IG7+e/R3qyPGAltSDK8BfwVThNXOvaPFThDaT
         9xldHilH6b3SUgPFKa5h9KDEzBEe5xtqW5E+65woQ5wv/BK+2qhxRzBgiK12UoS2fkF3
         LgiwF/E6rCqVV5i7wb8qyFa3+9wzLaRwh/0DOkBeNTYjLnoZNHjPtKqRFn72lSRnV/jQ
         y8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770899684; x=1771504484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQSolRZnr9mm+ZmPdt1LC6FFwmI84can5nHMywbBuoE=;
        b=Y7tsGf3eNksDZ5LgHoeY8TFoEFAOjoVpotsFpEYftcYlPKwDX6+HZh9H7JAClwLBD7
         h8qEaJWUVOqJg+N8lxOpUaMngRyV/jFSnwzsRcDPPNE/eAAVZWtDDABbdB54tkRkVECG
         n38NHWk57qoQJeteueBN9HHaUp/oY1bJWPNu0K0gqVr2/Q76ieuadn9Zvdfoku7jzdLg
         47uQIJ6iSig82ZSvpo0m7A7C9AtsYKKioMfxO1nUYYq4wNG0nE3A8UIcn6UMqsHw6G0j
         2kAHP8+TC780djL6xM8bQayChPDCnTmIRCHkolyGHJOrARHAFo+Zaj7x+3XRMNpHmc59
         gRug==
X-Gm-Message-State: AOJu0YwEKUUkXfU+mB4d5oR/OC32mUzx6eMxX3oGRnmAhy/lTWBJ0t2n
	fTpVSz78z4e4IMjD/GTjK9P7as3qMDggk6JzMP8lEAP/YDDGfu4K5DGQB3VYejzKaXk=
X-Gm-Gg: AZuq6aLOPjO1oM9Xdpc7o88b+bV2WsZ08LZn0NJQyyEn7JiJDOiksMKHJjWT/VFY/s3
	LjkC9uKmlknx5GpoPgk/YId7hZL0eHAHGR0BbuDEJfNPwy9Tuhl5LIMoiJQTKy/YT2rSxmc4LNF
	7wkEFwU5q384JdU9OUyLIGnC/19KTDMLcUREvkGBQ/sBb9P0t1iVVQhVow1J7lTvl9DwgkM+qPU
	7PY5wSrt2EcVVXmr9ErDxsoxBkOdE9Nov7KG7nS7y+WiB2jNZr/CCGk+WQlUoFgqfyg+FJihYP6
	ob+hSQaEbG2WXZCvhq8sbKVL9H0R9cZNhAiLWFWeKql+MhlSTFrFrP/paOitfi7kIqqAMCWL0Eo
	R9wiOYx1mflqIvk1AyyqgQ9v4y3e7REtRGILbGmnX6x3n8kVvkDPrunY1ovql1L6lkkDp+Dz3NJ
	fifQkwlAUCqqSyS3scV9aqKrftNx8YPx9D30EPhjh09NM/c/9HynwrGJ/mx8q3TerXfWmpMMunJ
	Xa9ZjFNYn09yb4=
X-Received: by 2002:a17:903:198e:b0:2a9:5b48:2b1f with SMTP id d9443c01a7336-2ab393ba3c1mr17479465ad.0.1770899684525;
        Thu, 12 Feb 2026 04:34:44 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:1c4d:265b:8163:813b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29966d91sm55324925ad.45.2026.02.12.04.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:34:44 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH] media: dvb-core: protect dvr_buffer reinitialization with lock
Date: Thu, 12 Feb 2026 18:01:11 +0530
Message-Id: <20260212123111.12393-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,syzkaller.appspotmail.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-52654-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[officialsohamkute@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,ab12f0c08dd7ab8d057c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B12912D796
X-Rspamd-Action: no action

dvb_dvr_open() updates dvr_buffer fields without holding
dmxdev->lock. This can race with concurrent readers and
lead to inconsistent ringbuffer state.

Protect dvr_buffer reinitialization with spin_lock_irq()
to serialize against concurrent access.

Reported-by: syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ab12f0c08dd7ab8d057c
Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 8c6f5aafd..e5e666866 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -168,7 +168,12 @@ static int dvb_dvr_open(struct inode *inode, struct file *file)
 			mutex_unlock(&dmxdev->mutex);
 			return -ENOMEM;
 		}
-		dvb_ringbuffer_init(&dmxdev->dvr_buffer, mem, DVR_BUFFER_SIZE);
+		spin_lock_irq(&dmxdev->lock);
+		dmxdev->dvr_buffer.data = mem;
+		dmxdev->dvr_buffer.size = DVR_BUFFER_SIZE;
+		dvb_ringbuffer_reset(&dmxdev->dvr_buffer);
+		spin_unlock_irq(&dmxdev->lock);
+
 		if (dmxdev->may_do_mmap)
 			dvb_vb2_init(&dmxdev->dvr_vb2_ctx, "dvr",
 				     file->f_flags & O_NONBLOCK);
-- 
2.34.1


