Return-Path: <linux-media+bounces-940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3477F680B
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 21:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEF12B20F17
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 20:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2BC4D5A5;
	Thu, 23 Nov 2023 20:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="blq3IhC0"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2BCD40;
	Thu, 23 Nov 2023 12:04:50 -0800 (PST)
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F0D726607394;
	Thu, 23 Nov 2023 20:04:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700769889;
	bh=evQpatdSpAPghrML22AafRCMA0dH56j0IXL66sdx8zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=blq3IhC03Ed7uBL4SLJO08fgcc0CcrQOW7ElJV5uF3ewtwdDLtgN7x30F6LSX2J8u
	 2cKl3/I/jY/xK7996HrbEvofMc2MZzVC5EV6KomLJrRPPVvx8M6Roq0OweI4L0L4Ek
	 5aGimsviZIfq54XsfG2l2TGS4UxOZsEtsE9RTLOQxyEXp5h7zyfLSDrwSe8fu9Qpsq
	 8PEvIkuF1iyPS4TemJmIPvWw/dWWtAOYbShGL+hQ031FFFVVbUNT9wik5lvYGoT8yP
	 2y2rzCfj7JLSRPISlx/SnPZR5cIItilXEvZlNTKCm6A4uqLcmE/ZYemyiztH6MF16s
	 WjKIDebwC+EZw==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 3/4] doc: visl: Document stable_output parameter
Date: Thu, 23 Nov 2023 14:57:46 -0500
Message-ID: <20231123200451.148097-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123200451.148097-1-detlev.casanova@collabora.com>
References: <20231123200451.148097-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/admin-guide/media/visl.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/media/visl.rst b/Documentation/admin-guide/media/visl.rst
index 4328c6c72d30..1a555e42a81a 100644
--- a/Documentation/admin-guide/media/visl.rst
+++ b/Documentation/admin-guide/media/visl.rst
@@ -49,6 +49,10 @@ Module parameters
   visl_dprintk_frame_start, visl_dprintk_nframes, but controls the dumping of
   buffer data through debugfs instead.
 
+- stable_output: Limit the information written on each output frame to make
+  sure that, for a given input, the output frames are always exactly the same.
+  This is useful for automated tests to check that output frames are correct.
+
 What is the default use case for this driver?
 ---------------------------------------------
 
-- 
2.41.0


