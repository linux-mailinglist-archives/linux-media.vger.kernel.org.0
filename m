Return-Path: <linux-media+bounces-27498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ACFA4E414
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 16:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EBC319C355E
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 15:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA1D2992D5;
	Tue,  4 Mar 2025 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cNgoJZwn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE47225524B;
	Tue,  4 Mar 2025 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101995; cv=none; b=vAHkCM1Vz4DIqlEPKWfvWCD2fjmwSe7anPWlyA72kKw2R63Vujm4z1Z7vRa+yLj8O8yHgkOjEsnm5GYUwnJ282w3i1gC+nh3+56wIXV2lYHQH/EDQzrr7onOLiK2Lhay7g7ogs6IHjcdfCyJZX14qQSfg+lsKL/+LVXdyBkCUoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101995; c=relaxed/simple;
	bh=eqLoiRddp8EsPvEYF6OWcXzyp3WGdUM4H+6GYoWqG7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0t/JOzQOalZcVwvB7Yg/Zci1zT/s6J/0zAc4hhxrZ5rLB/3Y5gP1Sfb6vHbRqbQ/BOZH7GSYYdFZAuJendeNS5equPoPsopUDPWERrdp4H2QuD+B+zc6Vq6pK9Kl531bzgTkCoJ2iJ00YdBDWViiZA3Nz0kKA1cM90cK7GM8LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cNgoJZwn; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.78] (unknown [45.136.247.92])
	by mail.mainlining.org (Postfix) with ESMTPSA id 135E9BBEE6;
	Tue,  4 Mar 2025 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741101673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=31/oCz2a/ONrfFM9ai3Wh69nx3m5R0ju7JO40am2Iqo=;
	b=cNgoJZwn45lmi+/N7nVidYKALJ6Ubv3B1csmJ9Y4psPgP/ow/2XoUQuegHLn0o2zZBYseX
	6Lt5/KxzwKTchMRPxeiF/pjH1g9rMut4XUX9sijnJc0omEnak4B64KmMtpJ9q4s06aBSPx
	ZBb/wDKtUYQ94h/CsBqTE3ih9h3p0uFYuWI9XSs4oKjvKU16T4t+xifprwBH/KpNgrL4iD
	S3kl7KS7v0wqSHn8VVzn2AXK+6re/nMQq4VhmyjKT6nODIa6KS0JWXPNapHQD4+TzCgVng
	kzruPXB2VcegV42vtSR7jv8mWg92Mf3eddJAqx7L9kcJyXXdrDani0liZ6aXVg==
From: Vasiliy Doylov <nekocwd@mainlining.org>
Date: Tue, 04 Mar 2025 18:21:02 +0300
Subject: [PATCH 1/3] MAINTAINERS: Add entry for Onsemi LC898217XC lens
 voice coil driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-media-i2c-lc898217xc-initial-driver-v1-1-e2ffd2b2fd5e@mainlining.org>
References: <20250304-media-i2c-lc898217xc-initial-driver-v1-0-e2ffd2b2fd5e@mainlining.org>
In-Reply-To: <20250304-media-i2c-lc898217xc-initial-driver-v1-0-e2ffd2b2fd5e@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=852; i=nekocwd@mainlining.org;
 h=from:subject:message-id; bh=eqLoiRddp8EsPvEYF6OWcXzyp3WGdUM4H+6GYoWqG7g=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNKPS6XfL7a6Y+T0anPg+m37VedevWS+dYrabwv20qXnd
 Lb/f25/v6OUhUGMi0FWTJHFZqPHbLH8cMlJ054qwMxhZQIZwsDFKQATcT3M8Fe4t/2J/IEzf7y/
 TcmY4hj1mHv+Zh4G94U/Oq6YePieOyjM8D+KYaE9W83FS+9mWlsu4WHb4MprkrJj9adui3Nx5aH
 8unwA
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582

Add entry for Onsemi LC898217XC lens voice coil driver

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29e1a423eee5bcf9df7938aaffe5bd3e2f6a2bbe..c15223f063357a8f89cf12f46ebcb7bd062903f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17781,6 +17781,14 @@ S:	Supported
 W:	http://www.onsemi.com
 F:	drivers/net/phy/ncn*
 
+ONSEMI LC898217XC LENS VOICE COIL DRIVER
+M:	Vasiliy Doylov <nekocwd@mainlining.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
+F:	drivers/media/i2c/lc898217xc.c
+
 OP-TEE DRIVER
 M:	Jens Wiklander <jens.wiklander@linaro.org>
 L:	op-tee@lists.trustedfirmware.org

-- 
2.48.1


