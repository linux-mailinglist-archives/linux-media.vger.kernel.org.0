Return-Path: <linux-media+bounces-23107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEE89EBBC8
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7801F281532
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 21:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6A2230D3A;
	Tue, 10 Dec 2024 21:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YXHfBSgV"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CAA23ED4A;
	Tue, 10 Dec 2024 21:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733865945; cv=none; b=YUuTVsPbLryGEjK9rJTJQ9hS+PghwJ8ztOX+OOxRaM7bI/wVnF3RVeDhCYXO8hev2AsJOIRMKg3NtByXmN0jHIQix08lsmb7P4qmX3O1RKDVnibmG2cCEQL7z00qw1N9fDEKVc89b213tPn7Hj23u9CLjigKB6nWG4LOTdPSOKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733865945; c=relaxed/simple;
	bh=HpklVVKV+tUCokf9h02FJlrQ6G4LkY8oP1AxulOL8V0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F2ezc2njl4sgB8wt6qhYM5Qni+HXeW8kRWyzdDzQ/EAGZKp28DIqr5h6jbIVrIXxowHI9Xluw5geHojrdn1ipTPaw+toBFpLYY9owROxIsWaaUnIjSJ0EadizV5t+n8rkKgU97vh5bTxeXo2trMrBm2+oE9nc5m7Idr21rPmSoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YXHfBSgV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733865941;
	bh=HpklVVKV+tUCokf9h02FJlrQ6G4LkY8oP1AxulOL8V0=;
	h=From:To:Cc:Subject:Date:From;
	b=YXHfBSgVhJxGEaQIbNC5zwmPk2cnZjMrTKoQ2+SOfWAQ56bHJj3ejSJYiBEtS/Y12
	 DaXLsJ160BtkrzRUMKBwjgiyRGt+XDWDDDJC/QLSlGEq1wC24/sxQHKMd8H+vY0iBS
	 zjJZWTytzx7vaP725hPwfEE5b0WjWzhX5AyX3n81LmwPGphcyjWeHjgbJgvbTFwtv6
	 33tOhyF5w0yoUBfqQXUduflGohjjf37ebHnsLkjYQ9KsvitktitpWbodrwoADsMxpA
	 Xqyzkm/CctC1hWSnvLmukAJz1HlRpvVBN+4DuZRCQ3XxIMPyvnfIwtqqvgQ5V//P8B
	 o8VhIPOCJK0Hg==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EBDF17E37F9;
	Tue, 10 Dec 2024 22:25:39 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: 
Cc: ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	benjamin.gaignard@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: hantro: Replacement maintainers
Date: Tue, 10 Dec 2024 16:25:16 -0500
Message-ID: <20241210212518.1587395-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per a long time request from Ezequiel who left the project around
2020, replace the top maintainers with Benjamin and myself, keeping
Philipp who is still active in the subsystem.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..00e95d6512f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10030,7 +10030,8 @@ F:	include/trace/events/handshake.h
 F:	net/handshake/
 
 HANTRO VPU CODEC DRIVER
-M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+M:	Nicolas Dufresne <nicolas.dufresne@collabora.com>
+M:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org

base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1


