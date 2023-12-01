Return-Path: <linux-media+bounces-1441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E8800084
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 01:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B9C42817B7
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 00:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B7217CF;
	Fri,  1 Dec 2023 00:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mHXr9LGY"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C1210E2
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 16:47:07 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C1FA660737B;
	Fri,  1 Dec 2023 00:47:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701391626;
	bh=4Hq/uWtQ8beTKXf9zNOJqH3Ehbv5sPy0kl/OgAh7sPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mHXr9LGYIH16RfeaIrngUj4dp4+ejKxcn+9QRG8YcMCOwC7Zy+yywu5fs+LQn4JjN
	 jNbGDuOTaq99KcaR525N+zqSKnU9DNIJiYvNSb7H4+AatgkRFjN3VYWYxmatzdwDft
	 oM23hTvJw0CKa5k7CPr5FnkawQB/BvOcRCywwcKZhaIneJV4fl0ZcRkh72yM19cWSb
	 cuMnwXgdgVFH3n8EF5ywAsr2sX4vitoce0iZfS67mqit8HhQQmlnFpiFxGPGo0khXK
	 jt/HfU8OJpHaVgj1kkUzwEX2rSdjnXCUaaiDB8xRI0Cg9qtJZqP6zHa6EzmA3+mykI
	 X5EEHOwc4Ut7Q==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 5/6] v4l2-tracer: stop waiting to handle a signal
Date: Thu, 30 Nov 2023 16:46:33 -0800
Message-ID: <2297fc0ea49ad201d213950c7f32d7ab5e998163.1701390439.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701390439.git.deborah.brouwer@collabora.com>
References: <cover.1701390439.git.deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usually the v4l2-tracer will wait for its tracee to handle a signal e.g.
from ctrl+c before the v4l2-tracer exits, but if there is no tracee,
then the v4l2-tracer waits forever.

Exit gracefully by waiting only if a tracee exists.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer.cpp | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index 37e17eb6..05e5b368 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -16,9 +16,12 @@ pid_t tracee_pid = 0;
 void v4l2_tracer_sig_handler(int signum)
 {
 	line_info("\n\tReceived signum: %d", signum);
-	kill(tracee_pid, signum);
-	/* Wait for tracee to handle the signal first before v4l2-tracer exits. */
-	wait(nullptr);
+
+	/* If there is a tracee, wait for it to handle the signal first before exiting. */
+	if (tracee_pid) {
+		kill(tracee_pid, signum);
+		wait(nullptr);
+	}
 }
 
 enum Options {
-- 
2.41.0


