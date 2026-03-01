Return-Path: <linux-media+bounces-53886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FSlDWOUo2khHQUAu9opvQ
	(envelope-from <linux-media+bounces-53886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:20:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 172D81CA3A8
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D0A63014A2C
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD8A2BD0B;
	Sun,  1 Mar 2026 01:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVlF+dv3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD7426ED35;
	Sun,  1 Mar 2026 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327998; cv=none; b=THdAT76Rmp662U+8CmSo04dQA8Xe1V73Jw/HiD7sVwd7HDO1ThyRkQ7b7Hcuevglioc6qdXCQaI+si12csX7yjYiFy4ZuapKQtiBBhcWBXRc5LRGWvDyYyRUQEztsgq86W+R3TQcy7B/cwhLTIxIVwIHjSmi0S/kt+ve0FjERXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327998; c=relaxed/simple;
	bh=/LCkcOJx+08BBjZtI7SctqD4/d/w9Dhf9rqi95o9Occ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I3elxCatwYfMgZQ5jcklmG1Q5iv7DDHnIA7z5+Ma1cnrPkgxBwoxXTtmv7/BoYAEw1i1lXnrJkFUbOFDX/WYWwWiHBrhEo++x9QYrRYAblciTQRpCQ5iatHNo4V+DecmYpI1xfr4yYM5AMRUwsER/smfouOg476kpZT8K5fp0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVlF+dv3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F185DC19421;
	Sun,  1 Mar 2026 01:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327997;
	bh=/LCkcOJx+08BBjZtI7SctqD4/d/w9Dhf9rqi95o9Occ=;
	h=From:To:Cc:Subject:Date:From;
	b=FVlF+dv36yQxo/9kiJbRpKRvupGIY2YltutuSfFNp4VgNR7BNuQpLqFVJ5bEyT0ss
	 wMArt9hQzZYiTm5KEsZE/C2AqaENFjuyjiMy2ZJV7zRxjAkSxJyt5nJLFuYranMQdl
	 DUeIEXGNbm0ZIrXhMbxUu51mgHhykV9EypNcGWnU2EBHWzNtzuP4w0DGOhhtadgWGb
	 eJ+DIcNL2q86D1NCRJrngSphLPPAqRqVNgAEWE8cUZCQ0R7/rxz9ErdeBPS4DKRULO
	 puN+iZsfTvPoamAEBimvYxmUWKYw99AT6iNAor3qgBCB5oRu9XEXH+lgPwhUbMM6jD
	 XjfAh/7Htm8KQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ssrane_b23@ee.vjti.ac.in
Cc: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: radio-keene: fix memory leak in error path" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:55 -0500
Message-ID: <20260301011955.1675289-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53886-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,a41b73dce23962a74c72,cisco];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 172D81CA3A8
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From b8bf939d77c0cd01118e953bbf554e0fa15e9006 Mon Sep 17 00:00:00 2001
From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Date: Thu, 27 Nov 2025 00:34:10 +0530
Subject: [PATCH] media: radio-keene: fix memory leak in error path

Fix a memory leak in usb_keene_probe(). The v4l2 control handler is
initialized and controls are added, but if v4l2_device_register() or
video_register_device() fails afterward, the handler was never freed,
leaking memory.

Add v4l2_ctrl_handler_free() call in the err_v4l2 error path to ensure
the control handler is properly freed for all error paths after it is
initialized.

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
Fixes: 1bf20c3a0c61 ("[media] radio-keene: add a driver for the Keene FM Transmitter")
Cc: stable@vger.kernel.org
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/radio/radio-keene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index f3b57f0cb1ec4..c133305fd0194 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -338,7 +338,6 @@ static int usb_keene_probe(struct usb_interface *intf,
 	if (hdl->error) {
 		retval = hdl->error;
 
-		v4l2_ctrl_handler_free(hdl);
 		goto err_v4l2;
 	}
 	retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
@@ -384,6 +383,7 @@ static int usb_keene_probe(struct usb_interface *intf,
 err_vdev:
 	v4l2_device_unregister(&radio->v4l2_dev);
 err_v4l2:
+	v4l2_ctrl_handler_free(&radio->hdl);
 	kfree(radio->buffer);
 	kfree(radio);
 err:
-- 
2.51.0





