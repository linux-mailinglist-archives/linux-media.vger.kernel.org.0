Return-Path: <linux-media+bounces-6052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA386A0A6
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 21:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60FAB28E37F
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 20:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8BD14A0A2;
	Tue, 27 Feb 2024 20:06:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3868114A4C1
	for <linux-media@vger.kernel.org>; Tue, 27 Feb 2024 20:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709064417; cv=none; b=JQmtzy0FKWzzfbCVpSPW/gUTeYnWPb9B31OwCtaAWXAGuxztLlgxxzw5o8twFP6sVHC6icagNWdAApVYu6BnOVq/oFQ3bSZ9D2dzpZeUArK8wCkk171lpgxxnuJKXqkJ6aJZqM1lTerC66MN5n387CCBbrAqGO7NCM+knLCLS0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709064417; c=relaxed/simple;
	bh=cLkBlU22rMEynF9I8lLu6I6Tk9wuGsOLR67mtKG6j7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gk4GqyHAbWsY98GHRRQcOKzhJC/ua+6MM6VGcpCA5TfLtPvpnoL+tE2naLkvm0QOLMJzRLAbW8Yx8XvSAa6lmdSW73C/BB+NbwatxZ35HMLhh7hYiOxkVlT1Qw9VYVdU3WxCiWNOCwrXGxZrxSHxxwFQOGNb7XiWil8LC0/nKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: from nicolas-tpx395.lan (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C9C753781FE3;
	Tue, 27 Feb 2024 20:06:52 +0000 (UTC)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Deborah Brouwer <deborah.brouwer@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH] v4l2-tracer: Rewrite libv4l2tracer.so lookup
Date: Tue, 27 Feb 2024 15:06:39 -0500
Message-ID: <20240227200640.578868-1-nicolas@ndufresne.ca>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dufresne <nicolas.dufresne@collabora.com>

The lookup had become messy and unreliable. In this rewrite, we
honor LD_PRELOAD if already set. Following, we use the new env
V4L2_TRACER if set. This env is now set by meson devenv to point
to the build version whenever uninstalled setup is used. Finally,
lookup for the installed path. Simply fail without fallback if the
env are set but aren't pointing to a file.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 utils/v4l2-tracer/meson.build     |  5 ++++
 utils/v4l2-tracer/v4l2-tracer.cpp | 42 ++++++++++---------------------
 2 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/utils/v4l2-tracer/meson.build b/utils/v4l2-tracer/meson.build
index d30e2eae..d059eb6d 100644
--- a/utils/v4l2-tracer/meson.build
+++ b/utils/v4l2-tracer/meson.build
@@ -71,3 +71,8 @@ v4l2_tracer = executable('v4l2-tracer',
                          include_directories : v4l2_tracer_incdir)
 
 man_pages += [[ meson.current_source_dir(), 'v4l2-tracer', 1 ]]
+
+# devenv support
+env = environment()
+env.set('V4L2_TRACER', libv4l2tracer.full_path())
+meson.add_devenv(env)
diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index 05e5b368..d9e4561c 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -296,41 +296,25 @@ int tracer(int argc, char *argv[], bool retrace)
 	fclose(trace_file);
 
 	/*
-	 * Preload the libv4l2tracer library. The libv4l2tracer is looked up next to
-	 * the executable first in order to support uninstalled build.
+	 * Preload the libv4l2tracer library. The tracer is looked up using following order:
+	 * 1. Check if LD_PRELOAD is already set, in which case just honor it
+	 * 2. Check V4L2_TRACER_PATH env is set (meson devenv / uninstalled)
+	 * 3. Check in the prefix/libdir path for an installed tracer.
 	 */
 	std::string libv4l2tracer_path;
-	std::string program = argv[0];
-	std::size_t idx = program.rfind("/");
-	struct stat sb;
-
-	if (idx == std::string::npos)
-		idx = 0;
+	if (getenv("LD_PRELOAD"))
+		libv4l2tracer_path = std::string(getenv("LD_PRELOAD"));
+	else if (getenv("V4L2_TRACER"))
+		libv4l2tracer_path = std::string(getenv("V4L2_TRACER"));
 	else
-		idx++;
-
-	libv4l2tracer_path = program.replace(program.begin() + idx, program.end(), "libv4l2tracer.so");
-
-	if (stat(libv4l2tracer_path.c_str(), &sb) == -1) {
-		/* If not found, get the libv4l2tracer library from the meson install path 'prefix' */
 		libv4l2tracer_path = std::string(LIBTRACER_PATH) + "/libv4l2tracer.so";
 
-		/* Otherwise, guess where the library might be for a cross-build. */
+	struct stat sb;
+	if (stat(libv4l2tracer_path.c_str(), &sb) == -1) {
 		if (stat(libv4l2tracer_path.c_str(), &sb) == -1) {
-			std::size_t idx =  libv4l2tracer_path.find("/home");
-			libv4l2tracer_path = libv4l2tracer_path.substr(idx);
-
-			/* Finally, check if the user set a custom path using LD_PRELOAD. */
-			if (stat(libv4l2tracer_path.c_str(), &sb) == -1) {
-				if (getenv("LD_PRELOAD"))
-					libv4l2tracer_path = std::string(getenv("LD_PRELOAD"));
-
-				if (stat(libv4l2tracer_path.c_str(), &sb) == -1) {
-					fprintf(stderr, "Exiting: can't find libv4l2tracer library\n");
-					fprintf(stderr, "Set a custom libv4l2tracer library path using: LD_PRELOAD\n");
-					exit(EXIT_FAILURE);
-				}
-			}
+			fprintf(stderr, "Exiting: can't find libv4l2tracer library in %s\n", libv4l2tracer_path.c_str());
+			fprintf(stderr, "If you are using a different location, try setting the env 'V4L2_TRACER'\n");
+			exit(EXIT_FAILURE);
 		}
 	}
 
-- 
2.43.0


