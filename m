Return-Path: <linux-media+bounces-41841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 156C7B457F4
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 14:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B00443A78DB
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CD934DCD2;
	Fri,  5 Sep 2025 12:38:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF151F1513
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 12:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075916; cv=none; b=eRD26MUlpA+AoJzAleQ43KRZZGST1dn/cSpmzQraDJotNAIv/j4hoRFVUwlpTYrpjmKEJlx7YN0vOuRIG45U6fJBlUPP89Vam7kwMtOVaIgU4QpMc4w58WBWe+ggsKdqFEWxhG0ePc6REh6iPuGlrhXH2A7KIdyZe5btu6HSqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075916; c=relaxed/simple;
	bh=Kh+LHr4Lf2MdUpSCZ86JQY/ipgIrF0HXsiUpxJXc8IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cyyPdv9Y7LEWJx2jv5q5UF0JHNiSTg0dMP340Keaij2aNd1jOb6SUNWU98O1NhSu6PudS462An7IN9Hf8qbPoq7XkmTz6p7YWVlEAj2Z8lABwIN+R14GvqcLRMMtUf6iUoeMkzUGdbs3G2+zU2Q+Rnv3LMtOrA7Ehl7zlCbyDEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cJG9N35fszlM4;
	Fri,  5 Sep 2025 14:38:32 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cJG9N0WfKzYg8;
	Fri,  5 Sep 2025 14:38:32 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 05 Sep 2025 14:38:15 +0200
Subject: [PATCH 3/3] README.md: fix requiried typo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-readme-typo-v1-3-4262d4acd65c@cherry.de>
References: <20250905-readme-typo-v1-0-4262d4acd65c@cherry.de>
In-Reply-To: <20250905-readme-typo-v1-0-4262d4acd65c@cherry.de>
To: linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

One too many i.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 741cea5052f34c4319b64dec04b81fc05dc2a232..ccf286c2f0d75472990ca7a8fac17a0a828e1a55 100644
--- a/README.md
+++ b/README.md
@@ -38,7 +38,7 @@ On Fedora, the package list for a minimal install with `dnf` or `yum` is:
 gcc gcc-c++ gettext-devel git meson perl which
 ```
 
-(git is only requiried if you're cloning from the main git repository at
+(git is only required if you're cloning from the main git repository at
 linuxtv.org).
 
 And, to be able to compile it with all usual functionality with qt5, you'll need

-- 
2.51.0


