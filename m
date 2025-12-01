Return-Path: <linux-media+bounces-47947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B118C97527
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 13:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D2C0C343458
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 12:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D5730C371;
	Mon,  1 Dec 2025 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CqT9sYgt";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="zpX5eeDo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC102550AF;
	Mon,  1 Dec 2025 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592885; cv=none; b=E9eSkkzrTgDZKdP5bmalk5rTs1/zjMDzsc0MZdxlanQG3n5OehYr6gmYov4G8IAXLbdV+B4FDuZND37GgWGxy5oSTVi81isxTWsSKCErLbfcACcDzMLm+YrYtChB2xVMnCVZcufsiaTwuYH+qHAMlvPB7hOu/ao6AyuLRbx2upM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592885; c=relaxed/simple;
	bh=iYqrlYK75CmMlF5MP8d8/qU+BFPZKFn68XuoE9ljf1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rhvv26lfViaK4496gKZ/tGSI0DBHKzjRLcNLj2EjbniVWPRUNqvS9ZVia5O9o+KOM/zrNpWFqKrJFBVQYxKMGFRdFRHs0tsnxMd8/qqRFAoMkFyRDP7NNcsmMT6ylf11j7Gff2odg4hgOBruN/y0YOiSoR2ZCsaEC9zkoFxYGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CqT9sYgt; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=zpX5eeDo; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1764592857; bh=REo7ODwV8ajMnQtMZi6zlDs
	o2DVrquSY/dQ2qFb5zO0=; b=CqT9sYgtRTQ+J8CPqqIClt7A8md0TPuESaaGPG6sh0AIg2ZiYM
	gylbblMLXoM5DNlz8K9OMBSBHY8lkNRX1ACiqgVUQUs7LBmtvaCMDgQpC2hjV2lY9jT0ndXPDWR
	PQhXwIXEU/0Gl2gWWvZeHbzt7DP4y9aPLGuvSxpV8fFDlKAtf7lgqdybUf+CxuNgSFyiIzqh8w6
	HT3WNJH/WISUijB7njd7fHbidPZR39w9JKh4TTVem9jZ48omqgsdagv6Y8sw4+ZyUQaPGM2bbHE
	QSMyMNTLp8PW3KUAZDhw4yozjwbhHHCTARYWrYTn3UzMhwpYT+YUTu8/FGtJthfVNig==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1764592857; bh=REo7ODwV8ajMnQtMZi6zlDs
	o2DVrquSY/dQ2qFb5zO0=; b=zpX5eeDouHCEsxluDTvotfyDrqufQMM4CuRQg0CjT35U/hlMsV
	SR367Fg6rFzBZRDmPdDLt/MetL0q3bqlYkDw==;
From: Vasiliy Doylov <nekocwd@mainlining.org>
Date: Mon, 01 Dec 2025 15:40:45 +0300
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for Onsemi LC898217XC lens
 voice coil driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-media-i2c-lc898217xc-initial-driver-v3-3-46e23897e921@mainlining.org>
References: <20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org>
In-Reply-To: <20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=nekocwd@mainlining.org;
 h=from:subject:message-id; bh=iYqrlYK75CmMlF5MP8d8/qU+BFPZKFn68XuoE9ljf1E=;
 b=owGbwMvMwCXGd//xporA/cmMp9WSGDJ1e67/bF05Z7k7t8T2rQLqnhGzP8bPuHh4W9SEWX9yl
 ypYSYtu7yhlYRDjYpAVU2T5b7hI7sANZc+63NRnMHNYmUCGMHBxCsBEDrxhZHgltmwG4ywNt/Ct
 6zV0brGo3jhbq3c+Tnue7kNBdpk7J+oZfrMk6cZ9joqJm/bwaWfzkczy3xe+31r59O9MhmvfF7Y
 8OM4EAA==
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=FF31A21EC0D823497E6D65E60EDFE3B27851BF63

Add entry for Onsemi LC898217XC lens voice coil driver

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 80dcd13687e6..004ff1ab535b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19501,6 +19501,13 @@ S:	Supported
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
 L:	op-tee@lists.trustedfirmware.org

-- 
2.52.0


