Return-Path: <linux-media+bounces-61607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOQaDPfGBWrDbAIAu9opvQ
	(envelope-from <linux-media+bounces-61607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 14:58:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD902542083
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 14:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B00E530728AA
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3EA3D6CB9;
	Thu, 14 May 2026 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwBmyNgQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B539D275B15
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763414; cv=none; b=VkUPaHl7EzxTjep5ap/Zl1w2hxeYCTgzjspDuC3eOLhpe/sOckm82I3jIeS0xUO52/PhosZo4eA47gsKdiCnQS8uV19gYMh58pgZVHuhVL2VqEVnot40OG0gyDcTZEzjue8432u5B3GZPLNoMjnGXhDUX/tvfz+Pnw/GdWgW9dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763414; c=relaxed/simple;
	bh=+ZrAn0YoYpG8cCQfdBBWFyA8S85tRV7sUgFgc1JKBJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=koRhjpPKOTto7WIpiSzNA+B0je44pe6krE9iGeAWTLeDNQQgFm30jtWiYwM32wzj/n50ZxT5WsiR2u39aNZ3P7c24ipe+k+0vPprodvAH6w70lLv0T5OlmK2F69VKwPKUEjYUWlAsFSurY8oWMhLWBv6kc7MbgsUcnh7Z4HD4W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwBmyNgQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso85108575e9.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 05:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778763411; x=1779368211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NUh46W47x8xj+WSU9cJZ50lkhrV6DxblvWC5UugrCS0=;
        b=OwBmyNgQ7gzIi3RMf67iVX5duKbCDbp810VdtrhbYm59HpE6GD39ms0g5jXluOk1Hz
         zXX3cwThM2jpIOddPPuu67lpFjzx6BwjJFj6oaBJNWkotgz6mIXzjhyFBCU/qgY71C27
         i2jjDCl15348AX/T+VJQFz0DUQKrTjYFO5fUP2Q3L6ljprNPC4FvH2F1oguZlGwQHUgh
         K3odIHY+wCskTdliIls1HX3hHRp62MvfkFficqqwe33YjQ6gL+IejScClxVsr1cK7uC5
         oL5nOuT2icUCU2YMQITNmaMlLhLJN5Cfv6J0f3qyjPGbJu/BSxTyuFzDtO/5b26o4cHK
         NPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778763411; x=1779368211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUh46W47x8xj+WSU9cJZ50lkhrV6DxblvWC5UugrCS0=;
        b=L/dCG7XDAusZQm1Xzt433rsIBQuCCiDUNJirX57i4bO/2OA5yUicpmGq+UkPq+KXh9
         HSBicNBXHErYG+6ILRjxjsSK5uUDcSA7eXjdH5sbFC+EuOBMfv11dhu9/tezkRrbLbBV
         EqEdYit6IMkQvCBzIcIPglnH6CtaxgGKuyLxs4Rx+93OeRhJcGneRALyZNNNArVS+QYX
         sSjGlHOspRQCO//0EUtGeWTT0CVvW5n7keb+7fnzZu0eK01W6T4zaOsU+B/3rmNsR9bE
         O3RMK6bmTbbx69QwX22ehlshFQ/UuJmoFjIl9onaBHHb1bI4U6Oiu38ku+GTdXZ/USDu
         HzCg==
X-Forwarded-Encrypted: i=1; AFNElJ9werF+PptxKcOrvaeN/ly5npS8ptw26pSQ3JagwBTrCsl0k1PuWPJrHS5ZFMeva4Z0iXq/o78fer1HPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6d3InK6HgUyPPghMcwR8/JWXgIghcsSfvP7Q2ySndERvmpf+
	qXovA9LBbRkyuKz1Yz82zzd37RxjoPPxsmRy/bjLWRd7wVBAQane02I=
X-Gm-Gg: Acq92OEc/ZxSHcKe9kWw0RMl5acatTBnuzHGz5kzvDcMN5GIZah5/w8VoWLbGWMB5P2
	+uq7RGrbqu9d6DSIazt+L36i3z9Mi/99wXkK0H9+YN4enR/50qtx59vq8MKB4Gpgo/S9i2cq46o
	GCLIYVjZrqk17VwAgTnb9WE7WQW2DZZIHAmzsTJevsT7/mcLGIMiOYgPQiP3wL5iYwo2cCB30ZP
	W1n+bki7EwtbxYXhTRs2x+aZRd1/JXGCFiOFZPxTLE+q5XbPZ8MmZH1RPLVFaa9Z3OJyKDpg3l+
	ky8ISvTp3WTxdE4R3YRve0fU50MJAAurXzijfLREI1gWbJKBbXXwnAgJbXi6SFiKa8Pt2c1sqNb
	dzwzS5HAg+NijGmxoDbohFxAe9jGfWye9IzSPf6KVRUsz9jnm+Qsvt3lSYnmuFE547JCqtzlLqu
	M1mhQRWltcagweaqICL9/V9f3qw6dC2BXyqGu9gPyEj5UtMj5Io8hb9DkkW27YhVBM5Clfc1lJZ
	HpZmP4tLLs+0A5jw9guXQ==
X-Received: by 2002:a05:600c:a405:b0:48a:5970:2005 with SMTP id 5b1f17b1804b1-48fce99d7fbmr89137315e9.2.1778763411040;
        Thu, 14 May 2026 05:56:51 -0700 (PDT)
Received: from archtop.localdomain ([2a01:599:90c:dba3:30bf:d5d7:a927:136b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62df4d3sm29368595e9.2.2026.05.14.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:56:50 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: jakovnovak30@gmail.com,
	crope@iki.fi,
	mchehab@kernel.org,
	skhan@linuxfoundation.org,
	syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com
Subject: [PATCH v2] media: dvb-usb-v2: ce6230: add ctr_msg check usb_control_msg of size 0
Date: Thu, 14 May 2026 14:56:34 +0200
Message-ID: <20260514125634.30640-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BD902542083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61607-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,iki.fi,kernel.org,linuxfoundation.org,syzkaller.appspotmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jakovnovak30@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,427909a2e3b2f83d78cb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Currently, the function ce6230_ctrl_msg, doesnt't check the size of the
control message that is supposed to be read/written, which causes the
error Syzbot reported at the usb core function usb_submit_urb after calling
usb_control_msg in the driver code. This patch fixes the issue by returning
an error code if the req->data_len == 0 inside ce6230_ctrl_msg.

Fixes: eebb876b0b8f ("V4L/DVB (11216): Add driver for Intel CE6230 DVB-T USB2.0")
Reported-and-tested-by: syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=427909a2e3b2f83d78cb
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/ce6230.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/ce6230.c b/drivers/media/usb/dvb-usb-v2/ce6230.c
index 7ebaf3ee4491..dd3aa45b56a3 100644
--- a/drivers/media/usb/dvb-usb-v2/ce6230.c
+++ b/drivers/media/usb/dvb-usb-v2/ce6230.c
@@ -23,6 +23,13 @@ static int ce6230_ctrl_msg(struct dvb_usb_device *d, struct usb_req *req)
 	value = req->value;
 	index = req->index;
 
+	if (!req->data_len) {
+		dev_err(&d->udev->dev,
+				"%s: cannot send crtl_msg of size 0",
+				KBUILD_MODNAME);
+		return -ENOBUFS;
+	}
+
 	switch (req->cmd) {
 	case I2C_READ:
 	case DEMOD_READ:
-- 
2.53.0


