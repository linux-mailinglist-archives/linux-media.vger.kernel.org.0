Return-Path: <linux-media+bounces-44143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F65EBCB78B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 05:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05C3740548B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 03:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FB1257845;
	Fri, 10 Oct 2025 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzhaMnwi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D823958D;
	Fri, 10 Oct 2025 03:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760065571; cv=none; b=nZFi1w5c3WdUe25PIwfEhDPbUfR2+rzkMMWcjLRvtxe+rZQpc4oGTrNmxiLOfZbAVBMiSAyAKaGlKDpMzmeSnYZKfh43VTURy4cPu+id8h8c2avJkfH7rjz6hmOFqvUHkvoxHuO4/VYrIcMk4USXgSC6PqSwfMT4pl5bp/sn4oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760065571; c=relaxed/simple;
	bh=buAk8wBnnxRKzIO9z4KvtvZ4fe13vVALntGgUa8V84U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mn8KCApY2x/N29l6XoshDLGppgztMNd7CQQF120M//zuqjJ9py0iWo61DUkc5KefkaFFa3yMzdwn6H2ZBvtqrMZbUh8gQcJA8+KuKn1tJTKLUZtzFACioeKoU3pQHYOU5p3ZNp1jyKTSpe9vPepyB4Xy+JUf6Q+FhDqJZLWqGng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzhaMnwi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8330C4CEF7;
	Fri, 10 Oct 2025 03:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760065570;
	bh=buAk8wBnnxRKzIO9z4KvtvZ4fe13vVALntGgUa8V84U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TzhaMnwi5aRCYhMaD90wY45c6oDbwSynC3DzmDcd2EhMbW+bwg+q+4X9fBSSGY1F2
	 UCVKvmdzKVV7SEQFazNz4uOG+0TfFa5mYCvJFEC+eNsNuKunPAuuVxuLUbB5LfPC3C
	 /e1qKqg/luyqhbw3P9iqPsWQwihFgWHW6kk08Ocu3nIlh+rRG4UqyW5pviUzTTpOfp
	 n3Bp/NGJbd9NaqGKeN8Q7yt4ORDAokNot7/zqBCxszv8ZYxfp1gnXCjkbsEpyzDdN5
	 nKN710g3qVhlsfkHZ+pBaJvc1xym5U6zxr27GPvg/zXDYqNQhBwVQt1fVzFLoXfP5m
	 bPiTbNuPckfoQ==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 1/3] media: dvb-usb-v2: lmedm04: Fix firmware macro definitions
Date: Thu,  9 Oct 2025 20:06:07 -0700
Message-Id: <20251010030610.3032147-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010030348.it.784-kees@kernel.org>
References: <20251010030348.it.784-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=kees@kernel.org; h=from:subject; bh=buAk8wBnnxRKzIO9z4KvtvZ4fe13vVALntGgUa8V84U=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkvKuSNRHNWmjXf/L5HymbpuzmXT1dvC5DbqfTMuo5B3 l4qc/eNjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgImsEWL4w3efx9RaQeHBDsEv U06efXncNIQ7eqJh6uZUuZKs7WuDgxj+5zHeU5Dzljx0Zff2vPyVxx9mh1aKiFvPPlf+Z8FFWb6 TrAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The firmware filename macros incorrectly included semicolons in their
string literal definitions. Right now, this wasn't causing any real
problem, but coming changes to the MODULE_INFO() macro make this more
sensitive. Specifically, when used with MODULE_FIRMWARE(), this
created syntax errors during macro expansion:

    MODULE_FIRMWARE(LME2510_C_S7395);

expands to:

    MODULE_INFO(firmware, "dvb-usb-lme2510c-s7395.fw";)
                                                     ^
                                          syntax error

Remove the trailing semicolons from all six firmware filename macro
definitions. Semicolons should only appear at the point of use, not in
the macro definition.

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Malcolm Priestley <tvboxspy@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: <linux-media@vger.kernel.org>
---
 drivers/media/usb/dvb-usb-v2/lmedm04.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 0c510035805b..05c18b6de5c6 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -70,12 +70,12 @@
 #include "ts2020.h"
 
 
-#define LME2510_C_S7395	"dvb-usb-lme2510c-s7395.fw";
-#define LME2510_C_LG	"dvb-usb-lme2510c-lg.fw";
-#define LME2510_C_S0194	"dvb-usb-lme2510c-s0194.fw";
-#define LME2510_C_RS2000 "dvb-usb-lme2510c-rs2000.fw";
-#define LME2510_LG	"dvb-usb-lme2510-lg.fw";
-#define LME2510_S0194	"dvb-usb-lme2510-s0194.fw";
+#define LME2510_C_S7395	"dvb-usb-lme2510c-s7395.fw"
+#define LME2510_C_LG	"dvb-usb-lme2510c-lg.fw"
+#define LME2510_C_S0194	"dvb-usb-lme2510c-s0194.fw"
+#define LME2510_C_RS2000 "dvb-usb-lme2510c-rs2000.fw"
+#define LME2510_LG	"dvb-usb-lme2510-lg.fw"
+#define LME2510_S0194	"dvb-usb-lme2510-s0194.fw"
 
 /* debug */
 static int dvb_usb_lme2510_debug;
-- 
2.34.1


