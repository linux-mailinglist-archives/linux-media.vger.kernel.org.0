Return-Path: <linux-media+bounces-56927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FeuD0UNw2lKnwQAu9opvQ
	(envelope-from <linux-media+bounces-56927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 23:16:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 005D731D3AA
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 23:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68967309026E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E545F3C8716;
	Tue, 24 Mar 2026 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8Ny/sb7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BA03C6603;
	Tue, 24 Mar 2026 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390502; cv=none; b=CKO1gtELySbkdURYbY+pX/Kzf18jfKjyCzT4gsG/lvRvomqHGhvD5WM0gEhCNBV7YwDX4l3m1023EQusLb9B46d0iKk039vNZFCt9DLUDx0i4Va5IAnaJHMoApsr1lddS5FdVh3QihnhCwPwW6NlClHTWQ+bCkY0Vqc65jKBA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390502; c=relaxed/simple;
	bh=FvyQegXbgiv0Awwi39Z3VPwCRxqZ+JNc3/oonK4coEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=esz2qiDewXxPcKOJnCuBCMj5pDrhKv9z/VAEdgVUvSgRAsY0DNAOopHK1T0WWuKl/cPRq4HWLJADIECWSjbuDhr+/nGdIAtIg/uLuCswK8cwdP4Q9FstDZtvotAH5jSriANyhKW1k06NTz1eMoVGw6WaxTHBC/HhJIx8FNKi9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8Ny/sb7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 229C7C2BCB7;
	Tue, 24 Mar 2026 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774390502;
	bh=FvyQegXbgiv0Awwi39Z3VPwCRxqZ+JNc3/oonK4coEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C8Ny/sb7JsYQ9orrO3ydtpoW8Ow7yhV1UcAClinaIFsixYvF/ykkY954nR5/6rLsy
	 cKby2Vy0J7zKmZ4gdHFDCsFSMax5nixsbRGGCjZaRfYv9WW9oPTI43ozXY0mokYuL7
	 ynOIuoq4hWBpCrqjZzmXcnq3fwWDvhSxNd0jOcW6hojVBI+BmXxgu8yPk8quCqu3Eg
	 VLpbrVt3aVGBUvu6/015s9KR1/YWkWkjy8/WOS1JSxfcLvtLi7jMQt0dxCq5A4h+wl
	 3RI9ZzEe3RE+lYkrmsqPfdASLvSBlKhzSUsqlPgI2nqBd1NlSfJafhpjm37l0NBQX3
	 bDYQrR4oFU4ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F68FEC11D;
	Tue, 24 Mar 2026 22:15:02 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekocwd.mainlining.org@kernel.org>
Date: Wed, 25 Mar 2026 01:15:01 +0300
Subject: [PATCH v4 3/3] MAINTAINERS: Add entry for Onsemi LC898217XC lens
 voice coil driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-media-i2c-lc898217xc-initial-driver-v4-3-6ad6fd74915e@mainlining.org>
References: <20260325-media-i2c-lc898217xc-initial-driver-v4-0-6ad6fd74915e@mainlining.org>
In-Reply-To: <20260325-media-i2c-lc898217xc-initial-driver-v4-0-6ad6fd74915e@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=790;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=Eo9bvXngPWC2RV/8gKjXFNTG4Tj+h2xSlMxai/WWYLE=;
 b=owGbwMvMwCVmXFbadLHr1XTG02pJDJmHeZ4ITU5akp/LM9/n+M0dnHXvi+dMkWzYttPa4dB1H
 t1/Ih9zOkpZGMS4GGTFFFm63x++92AeL2up+idemDmsTCBDGLg4BWAi9U0M/+vSi72OeM2I7HDO
 deEtF/ndW3p/lf290JSmAq3WleKfDjAyHFwh8vJ6/1HpZ01M+5xP/s/9p1JyLdSSw8SsXiJn0XE
 uZgA=
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=8BEFC3DEE09E0D057527F20D33767582D18AEA97
X-Endpoint-Received: by B4 Relay for nekocwd@mainlining.org/default with
 auth_id=692
X-Original-From: Vasiliy Doylov <nekocwd@mainlining.org>
Reply-To: nekocwd@mainlining.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56927-lists,linux-media=lfdr.de,nekocwd.mainlining.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,mainlining.org,protonmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[nekocwd@mainlining.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trustedfirmware.org:email,mainlining.org:email,mainlining.org:replyto,mainlining.org:mid,onsemi.com:url,linaro.org:email]
X-Rspamd-Queue-Id: 005D731D3AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasiliy Doylov <nekocwd@mainlining.org>

Add entry for Onsemi LC898217XC lens voice coil driver

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e61b4abb95fc..08ace2642f36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19817,6 +19817,13 @@ S:	Supported
 W:	http://www.onsemi.com
 F:	drivers/net/phy/ncn*
 
+ONSEMI LC898217XC LENS VOICE COIL DRIVER
+M:	Vasiliy Doylov <nekocwd@mainlining.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
+F:	drivers/media/i2c/lc898217xc.c
+
 OP-TEE DRIVER
 M:	Jens Wiklander <jens.wiklander@linaro.org>
 L:	op-tee@lists.trustedfirmware.org (moderated for non-subscribers)

-- 
2.50.1



