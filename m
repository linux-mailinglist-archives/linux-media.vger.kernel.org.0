Return-Path: <linux-media+bounces-65063-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h8jOMKLDMWpGpwUAu9opvQ
	(envelope-from <linux-media+bounces-65063-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 23:44:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B169573B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 23:44:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KlLwcq3e;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65063-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65063-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55B5B306AD06
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 21:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886653AC0D0;
	Tue, 16 Jun 2026 21:43:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE5B35292A
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 21:43:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781646225; cv=none; b=BGjh1DjkI22o8qZ/sc2TrDJNQbEVC4NOWZmcoJVSR4ErdLmNaIzqPUZYgVn51ISMCSIbVqvbtsonr3fR+O07rmHqrt/uJCBj7CpKHQTNIgb4JnXUtWuaVSlM6qYnpEpBHzLe3mCN35rAygu4Hk+oWt+LwwzJLObkAkXEiRfgpA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781646225; c=relaxed/simple;
	bh=/Hs37zcNpwtyVvT2hh9IfdFDnL3CdV9f49cUgJRpxko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y0CIHSQBvyXjVBFwb8I2tFCU0mDpC7LFPG6PzB5o2tFUAtiTW8mJhJGdC7BSyNa7vzfop7xOSH8MilamAsmZmKgBs8KyOedbKDiOl4Wg2TCSmllDKZIOYhyEGe8z5uqW6XOJcy17GcV1+eneXLgoL9fy23gKE7puRO7MbGsSps0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlLwcq3e; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so3519209a91.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 14:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781646222; x=1782251022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wuf6hY6fJuP1Fob6GRl/CCrYfo/S8Iq/mxxXiZHMvDc=;
        b=KlLwcq3esYn5OjnWQ2Ypghh/KkHhzkwrte+5aYWlTYhjRVK2poVf5q0JB7zVpUqTgG
         7/lwEWlY51yf/N+8YqdSHJRtZ7GuFh7o4KTcoeOr2SYtX+lfZ7e0JxiJiuU9ck6YUmQ8
         eu3ksujvxGWJTKSo+olGzZN6GpCMT3V4/1OZIaAotkNrZgH4f0YzBVqKEY3iXiTZh/kH
         YKbge1LEDwS3bBf+Lb+jBl3D0ImBDWn7fHC08iCAR3IF7/DoXP4Vkza3jJ6sDTmQwCyC
         0OSUPXgJaShSDxEcIg8PurQR/4fUIBnvXSMWLx3VmNtsYgWVenMk3h6U1e+/7wotdmyg
         7nAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781646222; x=1782251022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wuf6hY6fJuP1Fob6GRl/CCrYfo/S8Iq/mxxXiZHMvDc=;
        b=ZAk9KHlWPKrNKYu5foG2f1zgEK5ThXGIqXbnC41C4F6TxKA4W48WlCJyWG+guXDuJU
         xK+/XCGIEnAhj0IluMGhZZAZze3g2pfB8Uk2JCdbKQV+8SXr9Dt+jwTxgHrwgwWFBqgX
         9vPUtRdkky2ifkYMKVDcV/DeSOIQaoo/2neQ+OaZrDoXhO6ho7uLeCIdD0RRrC6q23al
         2ale4dgOY+MIFycGXti6OflIKGwS9r5SADuszssrdz3cIDyAwiJzyAFDMN4gjtNfhq02
         FN1Uc1I7rYJUzkLsFTNn00LJhW2+Bcv/0PxMCIZaa0V+axQ9LD7zQD41buN3nqHd/cK6
         PqoA==
X-Forwarded-Encrypted: i=1; AFNElJ8JJz9Kj49Aeje7/hXNwGB359vzzGJ/lkfC2TE70/LvteHYWU2xKCpyVqY2eeyCaZQEIJwDckLgKEHm3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc2hgVcBEAwVxjpdn7rrZX/2Kp6Jih2wddikIwNF21pRMWxqsD
	biTw1DJqpD9Payru2/17GQcc1pANHHEDklcFxN7fPdsoyA+RKrKis1Qa
X-Gm-Gg: Acq92OFnQsmlDrPXM6bsljuodfkBpU6baekPgh1Eqrdr2pFsuNPwB9x2wwGSv7bxTbc
	qKOl6hltYQUzxqsOkSmDGz9sonl7qxxIvj0XdILfT5nDpANacPfcK/uL7nSMs3qGL9nmAKck10Q
	AIWJFuElaXiDhree0cP5HsJiDuWGeM1dxj4tYpmhN3o6fg5PSE40v4/DkeI+xIe3UTcpzYUVqpi
	PzytaCEaq+Quel57sHOlyRMpoxC4naevhpJhnq2MR8UCjbIijQ7EZAsEA1pv9WKgibjMoruNjB8
	DY9eHar4KA8sI6QlHZAWgK31B8Ry3rOiuGIUl10nfT7E6Rx8Re0VM/+ukQOMVNM+V8HnOmniJAh
	9i9kFRH3kghnwgaTv92YihOCwL2QYjOZjmnDp95vKpo7gDjImj0tljowXdw6UHMmRRqKNgD79TF
	bzCnv7kfO7XnioG36nb91TLswranZpOVaTdYgivqPUf+bJ5UVFFpt2DOTWXB/fO2kuIR+YWCAOI
	PVsW4+wVGkz6uc=
X-Received: by 2002:a05:6a21:6190:b0:3b3:bdf5:1166 with SMTP id adf61e73a8af0-3b8b7feb3f5mr1115960637.39.1781646221920;
        Tue, 16 Jun 2026 14:43:41 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.192.239.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325e477sm12067256a12.10.2026.06.16.14.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:43:41 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	syzbot+2599e08a22e4565ea9f9@syzkaller.appspot.com
Subject: [PATCH] media: rc: igorplugusb: Fix wrong pointer passed to usb_fill_control_urb()
Date: Tue, 16 Jun 2026 21:43:34 +0000
Message-Id: <20260616214334.36525-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,gmail.com,syzkaller.appspot.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65063-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:mokshpanicker.7@gmail.com,m:syzbot+2599e08a22e4565ea9f9@syzkaller.appspot.com,m:mokshpanicker7@gmail.com,m:syzbot@syzkaller.appspot.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,2599e08a22e4565ea9f9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,syzkaller.appspot.com:url,syzkaller.appspot.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F4B169573B

ir->request is already a pointer to struct usb_ctrlrequest, so passing
&ir->request passes the address of the pointer rather than the pointer
itself. This causes usb_submit_urb() to read garbage as the URB setup
packet, resulting in a direction mismatch warning:

  usb 1-1: BOGUS control dir, pipe doesn't match bRequestType

Fix this by passing ir->request directly instead of &ir->request.

Reported-by: syzbot+2599e08a22e4565ea9f9@syzkaller.appspot.com
Closes: https://syzkaller.appspot.com/bug?extid=2599e08a22e4565ea9f9
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/media/rc/igorplugusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index 3e10f6fe8..b5117ee9f 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -184,7 +184,7 @@ static int igorplugusb_probe(struct usb_interface *intf,
 	if (!ir->buf_in)
 		goto fail;
 	usb_fill_control_urb(ir->urb, udev,
-		usb_rcvctrlpipe(udev, 0), (uint8_t *)&ir->request,
+		usb_rcvctrlpipe(udev, 0), (uint8_t *)ir->request,
 		ir->buf_in, MAX_PACKET, igorplugusb_callback, ir);
 
 	usb_make_path(udev, ir->phys, sizeof(ir->phys));
-- 
2.34.1


