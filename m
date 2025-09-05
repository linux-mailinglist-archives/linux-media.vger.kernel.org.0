Return-Path: <linux-media+bounces-41840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65520B457F3
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 14:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38D871C87F5D
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6232B345745;
	Fri,  5 Sep 2025 12:38:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59214145B3F
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 12:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075916; cv=none; b=kB+lrJneKiCrvYZikw68C0fgDv7elx3DHDJt/0ZLTTUNm6P9t2lqp3PAe9JjSaFh7tCtDLoRO0NrzNcUZQAyoS0X6IvfR82Lmd+VvPNb4a2bny2GcP86ILcoTLg1h6J48ReTNlSuVnSe3kOjojSCDxTe2cCzrqDARom0Fp7gcwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075916; c=relaxed/simple;
	bh=LleV/p/p9B+eG2XmrJ50orPON4gyOKZecV5BCuGvzQ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=akkFiY0r3sxsVJ+zPaU9cG3DRJS5tKBNebWa7IbxAcJIzcCHKTFBwDlDHRJoOj+yEgWYrITLwUHyGjww6hTGgmkjZBhsrQHwIW3/I44VzSYIzgdErPUhgO2vs+jCXuy62XJIWay5ZJpZGzgDeaEiBFptagBYnnmYE62l+u5cbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cJG9M2FRjzkyZ;
	Fri,  5 Sep 2025 14:38:31 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cJG9L6QPSzZXs;
	Fri,  5 Sep 2025 14:38:30 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/3] README.md: couple of typo fixes
Date: Fri, 05 Sep 2025 14:38:12 +0200
Message-Id: <20250905-readme-typo-v1-0-4262d4acd65c@cherry.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTZumgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNT3aLUxJTcVN2SyoJ8XUPLlGTzRFNzw8REUyWgjoKi1LTMCrBp0bG
 1tQDJR4X3XQAAAA==
X-Change-ID: 20250905-readme-typo-19dc7a571aa5
To: linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (3):
      README.md: fix mailinglist typo
      README.md: fix derivated typo
      README.md: fix requiried typo

 README.md | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
base-commit: fc46fc8771bff905204e7463ab03ed1f355436b1
change-id: 20250905-readme-typo-19dc7a571aa5

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


