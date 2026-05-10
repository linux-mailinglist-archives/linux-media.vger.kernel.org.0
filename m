Return-Path: <linux-media+bounces-61009-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIEYIEHm/2kVAAEAu9opvQ
	(envelope-from <linux-media+bounces-61009-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 03:58:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F295022A2
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 03:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28040300E2A9
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 01:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FF621D5B0;
	Sun, 10 May 2026 01:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leLSfoWB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36C233704
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 01:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778378297; cv=none; b=avrDA+MGJkthsxcrWMvn9eXX4/p7qp90xDRf6F0+6vLCbn+Lt7kt27NkqWxTKgm6F3O/Yy/DoCJ6C8iV0gXT78P2cpKQEQ966Pu7/l8NA4CMZkANGpQGw5xbTxEn34CwEpomNAkqkLuTOdf9V9PIDZVJMiXEs4bvQVegxsdF5Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778378297; c=relaxed/simple;
	bh=Jmc7FZyAV6btWZGl27ks6ZDZn+TGKGs6KfFTrlrQsJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UABwCROh0GLA0V007e9gWhh9TkIf4v+sgNKm03yM0OHD0c5kP4BT2H1sOYEfq6pJ78e+3DyIvSCIgWCV7QTL0qyeXlkcsKR21fMkuL6U80tAGp63Vky5LlqKZHKKGXIsaSn8o2lp3sMZXr/j+v5E64rhksadJocAccV9AysyJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leLSfoWB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2baca4df358so18845215ad.2
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 18:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778378296; x=1778983096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bFO6dXimqUuV/KpPExekl81GojsLF7t8fm95Ox85qE8=;
        b=leLSfoWBMMunhSKXU2EQ4TZLjZcTCwxfAqunvoskT9GAj5EgKs9iScZmoaAAOcgnEm
         6gXTSJNt4M164JqiCpAaLk9mzeojs1t2CIeb1RFauonIleNAsCUYVVtn9/dDfBU9pSRO
         dR9k6wNemd81mcNhb5zUvSKetaiNnqoPSkZ/zjXZUhOPoO+RRiRoUtEfKnlOLnfPZxkZ
         heKEAxsB7MawtgWtZjoY09AumdG/hvb65PqejQ7X8UvpVjtEFZtrhbV1bAndAWaerDHS
         AXxZxye8gBw0GykTLG2+1v802g947FVDM5b/z0mylKeVA0xQobZs3GlkXWlP94skyRvl
         XdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778378296; x=1778983096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFO6dXimqUuV/KpPExekl81GojsLF7t8fm95Ox85qE8=;
        b=r1KlsJl5cYOeKNBIXNLz+exgRxLWpTjjQZGBLw77YxVGTWk8jrBVZjBWN0SzOmQ0Ca
         ryb7PHwwdA8fB96Tp+INiNv4viIb8PKP0+Satwp4UbWN0KuSUXtx3MY83zCDkIsdPn83
         FFV5MK7DCO5ocy+WnQRcKcP1kmmo/+YPwPPeIeR3dHhQO1awi5lCiA+eU9Ck6oskSvfa
         NxNseB6sBifFlndkBphyzgAtIxk1JIAZQjmweDOML9iy7M/JTWKj+aYy7/8mTzwHm9l0
         BzcohOd7FH+kIjVhTou7+br71YRO9vrs5SQ6LWpdm86CDvwYqe1YrT0iknSL8Iw803oE
         N9mQ==
X-Gm-Message-State: AOJu0YxViB9HkLNuDPAG8fQ4FWCOuVZSbXVmM7uQKNFD2/LNnLBuzq1a
	8AauzFQN8WWaTkfeRRTPfJNZNrPKgAoN+m7huToA2ANxe4BblRc8INj7Qerp6Q==
X-Gm-Gg: Acq92OEPGb+tFN06Gx3qsPeIW+QvwP0IoIuaoaG6WlJx8zoy+roAKbZCgAlEZ+Nbr7S
	ywN4BN2W5hp3n11LqTl8d0s3/oV/msVOUjWv3oMvziOHAY7nEJ4LGj4ybk0STXVNFwuFqfDUjLp
	6NfkxKRUVZ3tTbUvcy3O4spsrBi+hHNn3/pmDJ+hLDfKnbriypJBL1bi/Yz2fevHw0HswmmlnPM
	F7jCVRduzI6jheMAcabuKyqorgNEuH/GbqA/CGNapoy9JhbsZazPCKS+IfJ5pImUHtRvXrkheU7
	Jcok8IGd7M9rYWUjK+52Zjt5Nk4qaeMRRGTo1xGhFK3oPFgu3E7OEar8xsLScg48iPNdXFnr5TS
	yxIdhRSUBdeS9LMOVaqgHgp8E3xuocRI8JIwY3J4h7yxESz8dbJ3gtphFsAKH6e28DvZXkG/OKj
	CktcbN+/UuWAWQVv32Wna7u3HG/sG1lDT9AtJuy+5WGxm8hHuSoL4RShv2874fu/GBK45M5rsTG
	ycd6z+lsG0d33Jh8jJQFD/jIDE0h5fsXPCuhkL5ehXHHdb65ljTbWw7
X-Received: by 2002:a17:902:cf09:b0:2ba:73c4:4a77 with SMTP id d9443c01a7336-2ba792b02a4mr223006615ad.9.1778378291953;
        Sat, 09 May 2026 18:58:11 -0700 (PDT)
Received: from ip-10-1-46-91.ap-northeast-1.compute.internal (ec2-176-32-72-196.ap-northeast-1.compute.amazonaws.com. [176.32.72.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40677sm62741515ad.33.2026.05.09.18.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 18:58:11 -0700 (PDT)
From: Daiki Harada <daiky0325@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daiki Harada <daiky0325@gmail.com>,
	Kees Cook <kees@kernel.org>,
	syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
Subject: [PATCH] media: msi2500: fix memory leak in msi2500_probe error path
Date: Sun, 10 May 2026 01:57:55 +0000
Message-ID: <20260510015755.198274-1-daiky0325@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 23F295022A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,syzkaller.appspotmail.com];
	TAGGED_FROM(0.00)[bounces-61009-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daiky0325@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,b1de0d5fd8a15fac11aa];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Action: no action

When video_register_device() fails in msi2500_probe(), the error path
jumps to err_unregister_v4l2_dev, which skips the call to
v4l2_ctrl_handler_free(). This leaks memory allocated by
v4l2_ctrl_handler_init() and v4l2_ctrl_add_handler().

Fix this by jumping to err_free_controls instead, which properly frees
the control handler before unregistering the v4l2 device.

Reported-by: syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
Tested-by: syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
Signed-off-by: Daiki Harada <daiky0325@gmail.com>
---
 drivers/media/usb/msi2500/msi2500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 1ff98956b680..76e1f2bfab0c 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -1265,7 +1265,7 @@ static int msi2500_probe(struct usb_interface *intf,
 	if (ret) {
 		dev_err(dev->dev,
 			"Failed to register as video device (%d)\n", ret);
-		goto err_unregister_v4l2_dev;
+		goto err_free_controls;
 	}
 	dev_info(dev->dev, "Registered as %s\n",
 		 video_device_node_name(&dev->vdev));
-- 
2.54.0


