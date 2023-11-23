Return-Path: <linux-media+bounces-916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB57F6363
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 16:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 831A6B212F8
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 15:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871D63E46A;
	Thu, 23 Nov 2023 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bKti0DFE"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FB3D5A;
	Thu, 23 Nov 2023 07:53:38 -0800 (PST)
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D6D1E6607397;
	Thu, 23 Nov 2023 15:53:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700754817;
	bh=Kpz4GbzKraVfywCJCP/gIgyjQGH1m53lANmGVN3Ca1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bKti0DFEYmHlpeXJV9noTlvtJLOAdKGuIDW8heMkGxu7Z550f30WrM3utFJSj3Moj
	 Dgo0Dn2p0nBfGwOxBAePD2MM30ge8/vUy5En3m2020ipAGRgKwmWs9gI4MVmphV9mf
	 jbwnDej0ntos86yjf8OzwQZiKg15KvSiaBoCwklsdFM1sowoFeUcS3BqGjxamdit2j
	 pJHtg7191/pQorAMyvInpl04m0qdr6tlStsnO+w1KVciVrI2G+aNSeGP0KrHfssKdJ
	 DlA/eUii0vFozE0avq14DplOwBtekUTKFuR7TYVac/hUKj0blLCTATidwkIBMXrIvi
	 Rn+t8AaMKnlIA==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 2/2] doc: visl: Add AV1 support
Date: Thu, 23 Nov 2023 10:52:26 -0500
Message-ID: <20231123155342.56277-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123155342.56277-1-detlev.casanova@collabora.com>
References: <20231123155342.56277-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add AV1 information in visl documentation.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/admin-guide/media/visl.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/admin-guide/media/visl.rst b/Documentation/admin-guide/media/visl.rst
index 4328c6c72d30..db1ef29438e1 100644
--- a/Documentation/admin-guide/media/visl.rst
+++ b/Documentation/admin-guide/media/visl.rst
@@ -71,6 +71,7 @@ The following codecs are supported:
 - VP9
 - H.264
 - HEVC
+- AV1
 
 visl trace events
 -----------------
@@ -79,6 +80,7 @@ The trace events are defined on a per-codec basis, e.g.:
 .. code-block:: bash
 
         $ ls /sys/kernel/tracing/events/ | grep visl
+        visl_av1_controls
         visl_fwht_controls
         visl_h264_controls
         visl_hevc_controls
-- 
2.41.0


