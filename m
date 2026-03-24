Return-Path: <linux-media+bounces-56778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAgtJLjYwWkaXQQAu9opvQ
	(envelope-from <linux-media+bounces-56778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:20:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D922FF8F6
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96DD3302DE64
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 00:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B6D1FC0FC;
	Tue, 24 Mar 2026 00:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIODlUvH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C05157487
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 00:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311335; cv=none; b=NOwdlqzmRL1XciSYdPSkggjniVttlfuNDjapadaK+oCUKz71DrBZ+8QxqiXwASWe2Oz55+PIbLMqGkeymsUIcuYSLyi4Xp26xn+WPZJO6AAz60bZEnpO78Phre7p5yW7z7DxcUqXCu2jzGjSyHlGdPO7j7LveHcHTjFaEmL8TX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311335; c=relaxed/simple;
	bh=0XnIeuoBL9/zpFJ9cjYmpYoAHPbJ65gaVNc4WrpxdSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNiOpPupyi0Ia+16HSHVdJGl/wIF1249FQMbAcDnstErdov+Krek/qFDRX3ZpHYnTbz67FbIOm+zVYGY3RIjlq3MTenma1Slpc9/gP9e6o5T9uWx1I01DjklQXrdUivlbH+5it5BpADJ+iW/phYfmPeE82n8ViZHBWq4XRnu3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIODlUvH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2adbfab4501so14366835ad.2
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 17:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774311332; x=1774916132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Imw73KIsNf6XGciGB5JMzoOm9TnS1SfksK0UHAy+nUY=;
        b=oIODlUvHPYStJ46zRgCxkaII19XcypUEq8R7q56RKVAJmvw+0AUUWrXClKQtIsgFAN
         uMy9LQKXIQThuhb2Vc0H9tGzAV3nzTeTQTlYcI4+qUkN4/Ilzv37dXckIxtV7AEF4S/S
         3dMXjIPyfghiDDba+J6Uj8Jjr/6YCEZ+Frj/mZQj2HkWZ4me9HkW1CGaWyhG+VX6LkmG
         YISMmAgJflFOY29WPqwU+icat/thCcmbpMm3rvPHmR5HjP23OLLc05gj2EEccNusEu6L
         74gmNotVk8dBljoM6FZpC5Y7vUYZHFDv6gE0w0aoA8or0jOPeqxxQ/q25LCpbh2YLa4S
         IK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311332; x=1774916132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Imw73KIsNf6XGciGB5JMzoOm9TnS1SfksK0UHAy+nUY=;
        b=hjXIdzcFubVIoT82s6x34YtuVOzKxiisD0rdRNpaPPcYFE45bRAA9zU1Pld/j7rIh4
         clS+RGNDNBvKjpbFCDcTaZzNt2l7y5bWOt3yTSZ4plMebcjSOFyr45KiGgd+o0F32pYa
         xWzB6q8UMsu6alMU7YVBnzQFz6jtRYjV64WXXkAsYu47+8pg237yQ6bAkR3vBXt34kNj
         yKt/bg2rNiTYpLWPJm3EY68/duaZ+m8hjjsGCyGjNtRuiHTOUAtaVODAIJ8Bm1BWpA5u
         qtRb/DI0nvga8y/g4vZDEVm1C0pza4XJRzekS1QcsX2i8q1hzLCxNrVZTiMIO3IpBxyM
         /7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLRUJek4qxm1GhgLshaleZPylsqikCGWQX0LsoIrJb21NFaHv9TI5l8dIyLtxIHNsLQXm5hLs43Hh5QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBflX+4V04Wt4DxRDE/0yMMgdfeQ9Rb1bFnZ7q1bxhi+gOudLf
	hPdaLKZB+v6ZEC4BuL/r4/uWjXEDiaijAD37OX3oEkNz8q9Pj7A+ypM7
X-Gm-Gg: ATEYQzxTNNpGCWUDBNcm/F0ZoP3LvpXOHwnNHQWu3fOE14WhOiRjI6eKTtfFAVJFibU
	i+9sfdZBb1Sdcx4Q+Y3UpbZBlFmfkpl0ZqEez29UwLBOsX1oLM80TDo3Y6IzFKaYnJewPhfd/LI
	2jd0CxCAujyuLOkn+pR2NpKThsYvLp6Tn5b+/gICYX0NbS+h6LBE5WMiTrJSJAgUgp2AqM6MSSP
	VMSaqJDR6W9I0qurfWBp4h9y67vOqr5tAC43cfEAz2z9VBhh85KkCnmFynaB6RsIyNC1Xqk092J
	yGPFd7Xjijvt15dX9iC8gEPiNwMUHcWDZCM0MyqZ1eoZjLP6KOKmFzrUtCzRcOvNFfYZkCicWY8
	sZRbKwe3J4Tsq+WWc8iWUh2O1Ts8iHhsOSh6l3fMLfo5YBJlgxRQp3xW5/DSBdgpvsPL54jwhGT
	BauLf8/d6sPDLdFLjY/452JYYQ2Eh5brnAvR9rAhoGCQSnh0N7LXE2tGgKKgzXEVc7DiKM8AcDd
	tEjTg==
X-Received: by 2002:a17:902:cece:b0:2ae:c816:ec5d with SMTP id d9443c01a7336-2b0827a76b6mr146735815ad.32.1774311332075;
        Mon, 23 Mar 2026 17:15:32 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:62d5:79a:7a92:c774])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08353e94asm121799435ad.25.2026.03.23.17.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:15:31 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org
Cc: harperchen1110@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com,
	Deepanshu Kartikey <Kartikey406@gmail.com>
Subject: [PATCH] media: ec168: fix slab-out-of-bounds in ec168_i2c_xfer
Date: Tue, 24 Mar 2026 05:45:23 +0530
Message-ID: <20260324001523.1446434-1-kartikey406@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56778-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,64485d3659c4c07111b4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,appspotmail.com:email,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 35D922FF8F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The WRITE_DEMOD path in ec168_i2c_xfer() checks msg[i].len < 1
before accessing the buffer, but then reads both buf[0] (register)
and buf[1] (value). If userspace supplies a 1-byte I2C message,
the read of buf[1] goes out of bounds, triggering a KASAN
slab-out-of-bounds error.

Fix by checking msg[i].len < 2 and returning -EOPNOTSUPP if the
buffer is too short to contain both register and value bytes.

Fixes: a6dcefcc08ec ("media: dvb-usb-v2: ec168: fix null-ptr-deref in ec168_i2c_xfer()")
Reported-by: syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=64485d3659c4c07111b4
Tested-by: syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <Kartikey406@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/ec168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
index 973b32356b17..ebfb02826b20 100644
--- a/drivers/media/usb/dvb-usb-v2/ec168.c
+++ b/drivers/media/usb/dvb-usb-v2/ec168.c
@@ -135,7 +135,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			}
 		} else {
 			if (msg[i].addr == ec168_ec100_config.demod_address) {
-				if (msg[i].len < 1) {
+				if (msg[i].len < 2) {
 					i = -EOPNOTSUPP;
 					break;
 				}
-- 
2.43.0


