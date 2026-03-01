Return-Path: <linux-media+bounces-53955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGfaHzOpo2nfJQUAu9opvQ
	(envelope-from <linux-media+bounces-53955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:49:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD121CDF2E
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBC0D31C062D
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F5C2E5B09;
	Sun,  1 Mar 2026 01:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luKNZuCI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2F1243969;
	Sun,  1 Mar 2026 01:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329273; cv=none; b=A/nEDRfAmHQr99RIuldteoYYAJuWCmTPP3jJVtQsqvvuNxGss7OpQK8vRtFC3eAOFmMFZtXffyVE/MawP9TiDIJBwJAogbzfHsjAOOo7DoexS2wY1ohhW5Jd0ATClom5cYMwkpyyq2R96oCVksfOau47m4hLx7xLFE6dy3MYRVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329273; c=relaxed/simple;
	bh=7MXlaiWThIA7iA8+nr5mmaG/dMzmfS6mlcgwr5tL5tE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKECOw21psFLpCmgmDi3I63WXmql9+bgdhcZvThVnoh5lxSncaTDJyqUiRNtpr4tuXjnFpXPpw310ngnPskz+pjRdmyYSlpPxw8jKeI3y4luPmb9pWERUPJvgNzzK/pYRqZvOIfXldTMS4Z7zugSR4mD3gFq+BLWYN7Ud43++l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luKNZuCI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AF3C19421;
	Sun,  1 Mar 2026 01:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329273;
	bh=7MXlaiWThIA7iA8+nr5mmaG/dMzmfS6mlcgwr5tL5tE=;
	h=From:To:Cc:Subject:Date:From;
	b=luKNZuCI7k/OJbTx/WUL8iXPDqFoZa3DfVtmW49VbzfOsRxU6b/J9526kWrhx95YQ
	 5poESsk7E58mgfbqMld1MgpMJ3nQSyUehNpneWEEWdOJgo3fZwjYZ15HZfpHoXhwjO
	 BXCc5faGzY+gEOvKhuX38oqzZV5GuD1XVW4ootkg0qctJD16Cn+e/bW5rF99KZIu4O
	 h0YiPNy2v2A+QlIn93r+lxD+NlbvnfnqmS4IRxlkacaT6m1Ekpn2PLTh25yUn3nMNB
	 LPxaaRAKPe3fi74tjitnftjEYAL5lLRxLOxnm/J3pUknpjaob/jsT99GV/HNnZ4Pcl
	 wXN0EdoyAfTkA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ssrane_b23@ee.vjti.ac.in
Cc: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: radio-keene: fix memory leak in error path" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:11 -0500
Message-ID: <20260301014112.1702729-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53955-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,a41b73dce23962a74c72,cisco];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email,vjti.ac.in:email]
X-Rspamd-Queue-Id: CFD121CDF2E
X-Rspamd-Action: no action

The patch below does not apply to the 6.1-stable tree.
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





