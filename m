Return-Path: <linux-media+bounces-58587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHFkGZFJ2mnWzggAu9opvQ
	(envelope-from <linux-media+bounces-58587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:16:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC43E017D
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6ECD30674CA
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855CD26F288;
	Sat, 11 Apr 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nunJRZKv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF641212548;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775913194; cv=none; b=mDtKjRWZK9fc0tVNU+AF/sR4/y0t7GW8fmvTB+nw7J8S2TUbmukDyutYFZFOBFjC3pFT7rrjVx57KMdjNqoZvxG45eY0DIRmTQp19/FXSlEf9E5Q10I18qn81YnoaKucpSeLdzypUSOmaARH+OYres/48bqMPEt+MdA2hsCmNq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775913194; c=relaxed/simple;
	bh=gYvw5ZKRCl0RH8BgUOu5V3anD1d0+Iic81fLL49D928=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaSxdJi2bbpvb5MBC6ULe9fmKNtuNanZ/3mHVt52rFymTwz2gflRO+Ldyvu0svn+r7f+8jh3zfdRBiV/jjJ5cZUsTOv/ubOsg+70qYXA0NW/A2cD1YRiGWFYCTZV1UJWHbA1JVLQWzTlOvkY4fvcBQYIhgbcUrfJkay74kEgU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nunJRZKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5625C2BCB3;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775913193;
	bh=gYvw5ZKRCl0RH8BgUOu5V3anD1d0+Iic81fLL49D928=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nunJRZKv+bX5GutT7y2MU+Ql+3/2vb2vEHZFTNhhznSFU/QtmH/XsHFZymosX4azG
	 O/fLz0c/cNm1PXrDEe5xEU0BLDLjJCFVSpT5GZ+cVebstRPN0tyB43vZ2LhRjQLyqa
	 XBJdK/gYB7MkQRJ8N78xEIey8nrs6u/cnv82lysG5F3ZEEdLp1EWrCAlSuxPLyiq5T
	 tOucuHkFMYaVjrL8B7vqfaChpKGqKNC4IEBdGmCOu0HAUYEimfxh/fRlJnnljJ/DHo
	 zCcDGKDptulKUTjhWZBV4HSTRLPrE+ZL4DEB4p6OxKCn9x/hNbWDqjbcpa1MAwgf+h
	 vwJ1JtsHL2JMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE32F3ED53;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekocwd.mainlining.org@kernel.org>
Date: Sat, 11 Apr 2026 16:13:10 +0300
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for Onsemi LC898217XC lens
 voice coil driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-media-i2c-lc898217xc-initial-driver-v5-3-c71ddcf40bad@mainlining.org>
References: <20260411-media-i2c-lc898217xc-initial-driver-v5-0-c71ddcf40bad@mainlining.org>
In-Reply-To: <20260411-media-i2c-lc898217xc-initial-driver-v5-0-c71ddcf40bad@mainlining.org>
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
 bh=47zPYZVQfTlmz5yR21UDZYEArwVIUE2fjhcCknakC2A=;
 b=owGbwMvMwCVmXFbadLHr1XTG02pJDJm3PF7oOn+d/NHi/3RJ+9A9a9JL/c280jTeRNv+Ph/a5
 3Yt8XlSRykLgxgXg6yYIkv3+8P3HszjZS1V/8QLM4eVCWQIAxenAEzkmRjDP6scCb98vyzG8vR1
 KWvLc+dx3kzbqsf9/e7S3EednySXejD8d5rBWuY5jT/2h2DlscC7d+J+M6slPRfd0xUyQ8328qH
 P/AA=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58587-lists,linux-media=lfdr.de,nekocwd.mainlining.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[nekocwd@mainlining.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:replyto,mainlining.org:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,onsemi.com:url,trustedfirmware.org:email]
X-Rspamd-Queue-Id: D0BC43E017D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasiliy Doylov <nekocwd@mainlining.org>

Add entry for Onsemi LC898217XC lens voice coil driver

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4b396dccfe9..a87c03ad740b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19938,6 +19938,13 @@ S:	Supported
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



