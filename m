Return-Path: <linux-media+bounces-1437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 554FC80007F
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 01:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 100152816ED
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 00:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2647FF;
	Fri,  1 Dec 2023 00:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FQModiun"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C17610E5
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 16:46:58 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 81BF9660737B;
	Fri,  1 Dec 2023 00:46:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701391617;
	bh=OmQfV+raKCbNQCwVGNMCv7AO1fDacjlICTczTOD/FsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FQModiunXVwTvAHiCN9UjP3OpBz4O+LZmH6B+WYng8ElibF7BoynaHdqxbVU+ff04
	 6ySDSWONdebe3aA42oJ7RD2Ta5fcSJzOBTl9jgRopFbiVoatIWRJG3hgqwWlHGrkd/
	 VZIaoEo0UGjsleNh5YQGsYXuOIE2Rv6D1CGUQGeo+ZtwnnLmX/EHMirWgXWQi5lwZs
	 u5N3EemVB6g+K9SJwp6QLUpR1bl+qEtxA1WLQyJ51Px42fBc5zBlq1JPQPpbCCDkLy
	 qkLEZUPNZoueNDGLm44Oyj3okrXyjqW0Z+4CY5SoekTmLDfB9Y5ummgoiSNXm53XCr
	 fKUak49JyGveA==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 1/6] v4l2-tracer: look in more places for libv4l2tracer
Date: Thu, 30 Nov 2023 16:46:29 -0800
Message-ID: <5498b213f40e99addd4e84ca1dbd9e1412b867eb.1701390439.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701390439.git.deborah.brouwer@collabora.com>
References: <cover.1701390439.git.deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The v4l2-tracer already looks in the build and install directories for its
library, but now it will also look in a truncated version of the
LIBTRACER_PATH which is helpful if it was installed by a cross-build. If
all else fails, it also allows the user to set a custom path using the
LD_PRELOAD environment variable.

Exit if the libv4l2tracer.so can’t be found.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer.cpp | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index a039f528..37e17eb6 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -306,13 +306,31 @@ int tracer(int argc, char *argv[], bool retrace)
 	else
 		idx++;
 
-	/* look for libv4l2tracer next to the executable */
 	libv4l2tracer_path = program.replace(program.begin() + idx, program.end(), "libv4l2tracer.so");
 
-	/* otherwise, use the installation path */
-	if (stat(libv4l2tracer_path.c_str(), &sb) == -1)
+	if (stat(libv4l2tracer_path.c_str(), &sb) == -1) {
+		/* If not found, get the libv4l2tracer library from the meson install path 'prefix' */
 		libv4l2tracer_path = std::string(LIBTRACER_PATH) + "/libv4l2tracer.so";
 
+		/* Otherwise, guess where the library might be for a cross-build. */
+		if (stat(libv4l2tracer_path.c_str(), &sb) == -1) {
+			std::size_t idx =  libv4l2tracer_path.find("/home");
+			libv4l2tracer_path = libv4l2tracer_path.substr(idx);
+
+			/* Finally, check if the user set a custom path using LD_PRELOAD. */
+			if (stat(libv4l2tracer_path.c_str(), &sb) == -1) {
+				if (getenv("LD_PRELOAD"))
+					libv4l2tracer_path = std::string(getenv("LD_PRELOAD"));
+
+				if (stat(libv4l2tracer_path.c_str(), &sb) == -1) {
+					fprintf(stderr, "Exiting: can't find libv4l2tracer library\n");
+					fprintf(stderr, "Set a custom libv4l2tracer library path using: LD_PRELOAD\n");
+					exit(EXIT_FAILURE);
+				}
+			}
+		}
+	}
+
 	if (is_verbose())
 		fprintf(stderr, "Loading libv4l2tracer: %s\n", libv4l2tracer_path.c_str());
 	setenv("LD_PRELOAD", libv4l2tracer_path.c_str(), 0);
@@ -355,6 +373,7 @@ int tracer(int argc, char *argv[], bool retrace)
 	fprintf(stderr, "%s", trace_filename.c_str());
 	fprintf(stderr, "\n");
 
+	unsetenv("LD_PRELOAD");
 	return exec_result;
 }
 
-- 
2.41.0


