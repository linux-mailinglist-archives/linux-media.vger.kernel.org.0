Return-Path: <linux-media+bounces-61031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id isk0JmeyAGryLgEAu9opvQ
	(envelope-from <linux-media+bounces-61031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:29:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8BF5051A8
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B04F300AB2D
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 16:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F633AF668;
	Sun, 10 May 2026 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoDnW+bQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD1347C6
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778430560; cv=none; b=b0dMuvohpA7kLHfEqjgJo7HrpLNSmiFdqnV0n553bYSdZIrQ045bflrL0/ndLwcYCWl6F5wephaBhNx8OFbQKaQacHcm57viBgeEEDgPeMSbcV+wnAMp4M6nGmR8JFfrRlMKqYlqBSGjexb3ytwx/lASYJJUELMPAAsFxCHuYhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778430560; c=relaxed/simple;
	bh=ZN+rnf9IlZfdljMMe+2pZP2fRETzi/gGpb6q56acdNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zvs/zFIbkvO7j4K/D9vtL0aIxPciS4geIg/MSgcVHoyR2bqHMEwb07YFYN9JlqUUSGLQBVrUvVTXbvh6DVXvCYc3ghdQlgwSCka7Ddz5ZgcImrLQ5eGbpZ9fkyIzKiGZz/l7O3t0noTxmJlBjnB5osIy+lJ0zlM5Bjb/t2XAq90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoDnW+bQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba856db1c0so24144045ad.3
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 09:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778430559; x=1779035359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC3PTWC1dIvQid0I/PeI5EZxV160ZDKd7RDV/vYwlM0=;
        b=BoDnW+bQDKzLAagrD0/9tQ6QKqUY/89Ots1UydBwPFnvyVUJF5JRlSIkPaMEXDc+TV
         GEEkxuxkFOf+ZG6uBckmpmmCRKOi1d2AM1D9OgFZ067eYDrnEmNQ7vUWwMjXLvGKCo1D
         fwicCnO8pb5/UqcwW5PP9/QBxu3gjtaCdMYe44ci8wBi0KlpfwJuCuEu9+sf1RAWKOar
         Y078oTGTsKF1NyNdD2JkQV8oAiEdLHgBIl+GhePu2ILcw3pfLhRFHQ+wOZVhJMXiCyhr
         XgbvU+mbUimyoaN+GSSLqI5BczkkaH5TNLhY9pqLbjaZtaBWXRq4wXrNQQovsSParfT7
         QqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778430559; x=1779035359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IC3PTWC1dIvQid0I/PeI5EZxV160ZDKd7RDV/vYwlM0=;
        b=BkmC/dgMGY5cZ5aw32PoijxfF+1QCJ7x0ingKGLf4gmdHQ9Qwyq08wxjq0SEYbclwN
         uI/BaaDQN2WWNSnGYygkVu4FuTuM4aMmyxQxf3hcMD6zWW4xsYObH9uUQwzYPV79rbUP
         hFYVaXXqTwDn20K+4lO4WGujbLN8Vr3ZY86Qjc8hQhIWSUUnHWqyZt/9SoqQhsoyP7Z4
         iXiho/DC2o6emvnnPfyQkEFOI2YQ4usYJYzAXBDuv5/798/k3hl1fBW29r/3eWABNZpX
         7dmYpdCEskRxXVU0k5wr6o5NEkQbUrDOFqF7y0Qc+xfP7czswWpLD/E3vO8TPsuZBL58
         sXWg==
X-Gm-Message-State: AOJu0Yz57/CVgX23hvks0T2HEKPJdACUn5mOzNCD6X2Js79/UWDaW3aA
	0VHzBSZsNzCdhOxN/VpLkf/8T6OYDPABzVcXDaLb3hE32AYUDEDw8CH1qjAQ2UtfC2A=
X-Gm-Gg: Acq92OGQiur5XQBGEPs234fc4wKgrzeSMwSEUiVNNqPgn+615zcT+PEvXH8cb6VZgwB
	zWDfE3BgzFy31oO/2m58Cgvjzgs7ySzIcvPAG6jSlOvAqkaDYNW/I0/yGa1GFchIPiQLnw/oBHZ
	p6220YkMPWYfzzjo0mV/dwvAA1InjIm8418pWIIyKuJ53PAZmfxq9GWKMLgxcdrPKOLFwglkpfC
	lIOvPmg6fEkE+U3LyrjKD8lx9b0VYv7krdh/WBy3Jp5ut0q9YGH60hTTNKb2Hdwqy0aHASqRWUt
	wJUwwVynzXnzIpSb+CteFpmXM27N+E2bGep+5Ue/FSr0YPbId00wZlpgZpkGU5R56rWSkmjFN3R
	LfYqzj+bCzRRvZ2WKo5VyWcTm3E4nc9JhxoTiB2v+CB0bEBWsmUOGEQPFdK8Mg8GHlUGK4SqxFy
	kUMzucIlaiT/tezzSqmB25i+6BcDWpCXODQ+bFCEdGPjCKTpWciTw43//TZqxjwUwv7qyFibgDC
	KY=
X-Received: by 2002:a17:902:da90:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2bc7a9a3787mr71776555ad.13.1778430559003;
        Sun, 10 May 2026 09:29:19 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.96.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d41022sm78064865ad.34.2026.05.10.09.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 09:29:18 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	syzbot+f9f333782a8f54509322@syzkaller.appspotmail.com
Subject: [PATCH v2] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Sun, 10 May 2026 16:29:12 +0000
Message-Id: <20260510162912.67381-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260510162435.67048-1-mokshpanicker.7@gmail.com>
References: <20260510162435.67048-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DD8BF5051A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,syzkaller.appspotmail.com];
	TAGGED_FROM(0.00)[bounces-61031-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,f9f333782a8f54509322];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Action: no action

When mxl111sf_ctrl_msg() is called during early probe, state->d
may not yet be initialized, causing a null pointer dereference in
dvb_usbv2_generic_write() when it accesses d->usb_mutex.

Add a null check for d before proceeding with the USB transfer.

Fixes: d90b336f3f65 ("[media] mxl111sf: Fix driver to use heap allocate buffers for USB messages")
Reported-by: syzbot+f9f333782a8f54509322@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f9f333782a8f54509322
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 870ac3c8b085..9908675c355e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -56,6 +56,9 @@ int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
 	int wo = (rbuf == NULL || rlen == 0); /* write-only */
 	int ret;
 
+	if (!d)
+		return -ENODEV;
+
 	if (1 + wlen > MXL_MAX_XFER_SIZE) {
 		pr_warn("%s: len=%d is too big!\n", __func__, wlen);
 		return -EOPNOTSUPP;
-- 
2.34.1


