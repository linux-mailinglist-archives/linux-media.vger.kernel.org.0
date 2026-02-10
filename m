Return-Path: <linux-media+bounces-52526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OstByRTi2kMUAAAu9opvQ
	(envelope-from <linux-media+bounces-52526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 16:47:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34911CB57
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 16:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F343305833E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 15:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434C93815FC;
	Tue, 10 Feb 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/WZZSyj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA72D28E0F;
	Tue, 10 Feb 2026 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738340; cv=none; b=pv9QZ3InhizvxxjXwgsnL3T+Bq1XJm6NpFVe8XbAe7oPN5OUK85NJPmxMJLIf7Q7ANctRaBrJK1Azif8zFCM2iuVvuH1IimaBocx33JfJWG+su+iOAS6ZRCzUcZwn+7F2/78o/oGFBXLgd4lPbK9sy7UUkkqoPbgkUm2RkJIc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738340; c=relaxed/simple;
	bh=f/yXqF8MtqWCkk+l6WPtkqJBbYUKSHSNM30NkMJmZiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qYiYBTJF3ugpwWS/CFV8hBxlIFuZnftif6zCc2bNuBD0XxKG1ndXyB5ye7WwMiOF3rQHz67F7QDMrZ/sBin3nkdPqnFoYJLGtODWGw6IVty+KQi8inEoPgrN48xISu5iAjBNGij454mSSb+7HBnF2TmNrqK1qvxRNq/GIzq1FAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/WZZSyj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72BD2C116C6;
	Tue, 10 Feb 2026 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770738340;
	bh=f/yXqF8MtqWCkk+l6WPtkqJBbYUKSHSNM30NkMJmZiA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=o/WZZSyj0qh+6+pJDySuzGkxX9i6A3YpvZ9hvNNCus1EJi66ITtKlFlJAF223NIWG
	 FKBW3LvSW8LR+TJip7VJ3LE9y0t+FOlo43kc1DeQLdmVBogwVolDfpXxWkecC+o8bK
	 kmhneDoc354Ew7udF+yWzaGGzsaygAoaL34mG0CRjR4D40jy+4NKfV+FELxNkSgje0
	 jRVxEsTe2HPVJW/WMJWrnVRxBcuDnxNLPqQfXg+mX2IpRTYAq7RJyBOB+2qpVV7ron
	 TuS5Q/Ate7q/7TJiHIKxnq1eELkYBuieAfRqbwdeU+UoucwKkEiQ3vYQL2l7x3AM6s
	 QReTkuep3F00w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59587EA8131;
	Tue, 10 Feb 2026 15:45:40 +0000 (UTC)
From: Soufiane Dani via B4 Relay <devnull+soufianeda.tutanota.com@kernel.org>
Date: Tue, 10 Feb 2026 16:45:23 +0100
Subject: [PATCH v3] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-atomisp-fix-v3-1-b2efe28a6c53@tutanota.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32MQQ7CIBAAv9JwFsMutEVP/sN4oHWxHFoaQKJp+
 ndpj8Z4nElmFhYpOIrsXC0sUHbR+amAPFSsH8z0IO7uhRkKbASC4Cb50cWZW/fimoSWtq1lozU
 rxRyo6P12vRUeXEw+vPd5hs3+/mTgwAUqhae+s1bCJT2TmXwyx96PbFtl/JNjyZGAoLbQta36y
 td1/QDW9w9z6AAAAA==
X-Change-ID: 20260210-atomisp-fix-8e083f753688
To: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
 sakari.ailus@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Soufiane Dani <soufianeda@tutanota.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770738339; l=1297;
 i=soufianeda@tutanota.com; s=20260210; h=from:subject:message-id;
 bh=i+oYeKTwhxW/Os8v+MNwen7EPT3/rCXrDM2kh4h2xEg=;
 b=0r32OaiNqqSaLESr+pcgBcZfU3auqLuL711WDCgcl/bT9bYDO55FbJW7yw7zWS2XqK5ET9Wdk
 ZdeTwmxVrsJCxaAfLkR/dqhwqLNFRg6Rj4JwJdm37gV8UFMp8SE4DV+
X-Developer-Key: i=soufianeda@tutanota.com; a=ed25519;
 pk=UzU2pI3/kdLVX1NbSuU4LzRt28OBKkEmk+xBRMw7P+Q=
X-Endpoint-Received: by B4 Relay for soufianeda@tutanota.com/20260210 with
 auth_id=631
X-Original-From: Soufiane Dani <soufianeda@tutanota.com>
Reply-To: soufianeda@tutanota.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52526-lists,linux-media=lfdr.de,soufianeda.tutanota.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tutanota.com:mid,tutanota.com:email,tutanota.com:replyto]
X-Rspamd-Queue-Id: 8C34911CB57
X-Rspamd-Action: no action

From: Soufiane Dani <soufianeda@tutanota.com>

Validate sizeimage against the allocated frame buffer size before
hmm_store() to prevent out-of-bounds write.

Signed-off-by: Soufiane Dani <soufianeda@tutanota.com>
---
Changes in v3:
-
-
- Link to v2: https://lore.kernel.org/r/20260210-atomisp-fix-v2-1-2e1e15f1b774@tutanota.com

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
Soufiane Dani <soufianeda@tutanota.com>



