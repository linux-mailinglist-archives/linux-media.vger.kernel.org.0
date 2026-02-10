Return-Path: <linux-media+bounces-52525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLiSHsxQi2nwTwAAu9opvQ
	(envelope-from <linux-media+bounces-52525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 16:37:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D2511C966
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 16:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39AAE3033A91
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 15:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53163815FC;
	Tue, 10 Feb 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLMND+6z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B202EDD40;
	Tue, 10 Feb 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737746; cv=none; b=PIfcKZ8TqYN0EkJiwkA1i38iGXQkVGiR84FBmJpR/DTrkFZJnjWtHuRsudgIxAcctTr/Pw1UahFeZVmj22gI7Dj4dU2+3DqHpU7nTPMb9Wom/LFd+ayhdR1aMKnh9ohij+DJ0wGPhOBsBJ1FlH4B2BIuWFnEfNV+DEeUWa8mPi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737746; c=relaxed/simple;
	bh=/D9WayX2RyezQv/BMFEI20I2X4SxmXeXzlv+0+3fv8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NBuEmOjeWtpxyjCkIEm+m3Erl2aHzb2yYVVlnssbkGQDny5L70i0E/SRY1bo7In5UwEJSRLr3eN42c1G0h4bVdFaXRLnKxXmb3a7KRCzQI/PcXVTGZJc8dJgUpLumrCESdxedyWX5FyJBPIOoKev9f5Z3n0CQWDhCkhFQFt4GGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLMND+6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA0A5C116C6;
	Tue, 10 Feb 2026 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770737746;
	bh=/D9WayX2RyezQv/BMFEI20I2X4SxmXeXzlv+0+3fv8I=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=MLMND+6zO1mw6D5D2vRgotwECtaX49Vsw5oshv1RQk+oH0W3x1jcywrKF9adtvjy7
	 sBrOXpwVobU2TowG8xxAB8caE9riDYnVebmNYl2pAc7m2NkOh7rRTFLVKK5wV0pwzU
	 kt0umUOPiHTypmbka2yq+f6mTHf7n6TnhCGxuCBzdf67u7+leIiar+NHwU3sLKoW/g
	 CTji1PYz52V7RQgU+4iTbmpM0gaKrbJ8/eqVWiozfInT1RNBqROjFFZVushCR8c7PI
	 MZbKR28kfuCAiZ97SUJVFtVDQfJRnpydb860mjGwKhQJhMx9XmUGsPciOSgpDnSluj
	 tR4wzLf3uJvgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E71EA812D;
	Tue, 10 Feb 2026 15:35:45 +0000 (UTC)
From: Soufiane via B4 Relay <devnull+soufianeda.tutanota.com@kernel.org>
Date: Tue, 10 Feb 2026 16:35:27 +0100
Subject: [PATCH v2] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-atomisp-fix-v2-1-2e1e15f1b774@tutanota.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQ7CIBAAv9LsWQwstWJP/sP0gAh2D4UGkGga/
 i727HEmmdkg2Ug2wdhtEG2hRME3wEMHZtb+aRk9GgNyHDgKznQOC6WVOXozZbmS7nySg1LQijX
 apvfbbWo8U8ohfvZ5ET/7/1MEE4xj3+PF3J2T4ppfWfuQ9dGEBaZa6xfRn5UsqQAAAA==
X-Change-ID: 20260210-atomisp-fix-8e083f753688
To: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
 sakari.ailus@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Soufiane <soufianeda@tutanota.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770737743; l=1170;
 i=soufianeda@tutanota.com; s=20260210; h=from:subject:message-id;
 bh=LIUHpU74WY0uQyqdYbvaZ7O7xKufBT6aHUwY0/k5w9k=;
 b=rvOtB6aPKYanBXLUZDLJTTwFiLVGt8ns4rKokbVb1Lmbrgf+UW2zv3H2/mRt0aiN2A0mwC7u9
 HtRzFBEMl6OBe36d9HpHylgcNkZE13kZ8DnBzwKoo+xO/LcjfOHqODQ
X-Developer-Key: i=soufianeda@tutanota.com; a=ed25519;
 pk=UzU2pI3/kdLVX1NbSuU4LzRt28OBKkEmk+xBRMw7P+Q=
X-Endpoint-Received: by B4 Relay for soufianeda@tutanota.com/20260210 with
 auth_id=631
X-Original-From: Soufiane <soufianeda@tutanota.com>
Reply-To: soufianeda@tutanota.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52525-lists,linux-media=lfdr.de,soufianeda.tutanota.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[soufianeda@tutanota.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22D2511C966
X-Rspamd-Action: no action

From: Soufiane <soufianeda@tutanota.com>

Validate sizeimage against the allocated frame buffer size before
hmm_store() to prevent out-of-bounds write.

Signed-off-by: Soufiane <soufianeda@tutanota.com>
---
Changes in v2:
- Resend with all recipients (v1 only reached sakari and linux-staging)
- Link to v1: https://lore.kernel.org/r/20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..ca7ffc7855ac 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3326,6 +3326,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 		goto err;
 	}
 
+	if (arg->fmt.sizeimage > res->data_bytes) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	tmp_buf = vmalloc(arg->fmt.sizeimage);
 	if (!tmp_buf) {
 		ret = -ENOMEM;

---
base-commit: 72c395024dac5e215136cbff793455f065603b06
change-id: 20260210-atomisp-fix-8e083f753688

Best regards,
-- 
Soufiane <soufianeda@tutanota.com>



