Return-Path: <linux-media+bounces-34106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC5ACEE38
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD3BA3AA4B4
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B199321FF39;
	Thu,  5 Jun 2025 10:59:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B01C215198
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121164; cv=none; b=tXyE9gML4Ea+hi4wHfDCl7NoVIGpSZ3+Gl/QiiVg+TdNMsVkN6Op6RJs4d8zqz9tvjhO12JeAWtqEsAsCNlIl11MhN4USv9HhZMwzeQahni31PMwBXtqoMyOyjvU7aULT0np8+nguYnVG1GrPQSvSLHw7kIioM40X1SqJofi7rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121164; c=relaxed/simple;
	bh=YC4VDKzycm13ypD4eoM3F6cYTlKbtGsznt47M5PjvkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BV0IlgVnYf4vL6FabV5P9HkiWnyntNEc3A4LAHXxOd5atCLwmD2eAHzGVNzUxDAqGSL3Kq/m+0bmH9q3OkcJf7LncanXWtC4loH5n1IewW9j4pzEzgOMAwvBaZDKi+QlMlFTwzfLD6NX5ou7Xd5gHk8AqHxwxm6AJXNqjiya/QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F015DC4CEE7;
	Thu,  5 Jun 2025 10:59:22 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 5/9] dvbv5-scan: add -R streaming option
Date: Thu,  5 Jun 2025 12:58:28 +0200
Message-ID: <2d1cdb4d25c3ee0b8efb2be26a4bb43fabffd09d.1749121112.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749121112.git.hverkuil@xs4all.nl>
References: <cover.1749121112.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the --streaming/-R option to enable streaming I/O.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 utils/dvb/dvbv5-scan.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/utils/dvb/dvbv5-scan.c b/utils/dvb/dvbv5-scan.c
index c84c90fd..b4ff8fc3 100644
--- a/utils/dvb/dvbv5-scan.c
+++ b/utils/dvb/dvbv5-scan.c
@@ -48,6 +48,7 @@
 #include "libdvbv5/dvb-dev.h"
 #include "libdvbv5/dvb-v5-std.h"
 #include "libdvbv5/dvb-scan.h"
+#include "libdvbv5/dvb-vb2.h"
 #include "libdvbv5/countries.h"
 
 #define PROGRAM_NAME	"dvbv5-scan"
@@ -80,6 +81,7 @@ static const struct argp_option options[] = {
 	{"wait",	'W',	N_("time"),		0, N_("adds additional wait time for DISEqC command completion"), 0},
 	{"nit",		'N',	NULL,			0, N_("use data from NIT table on the output file"), 0},
 	{"get_frontend",'G',	NULL,			0, N_("use data from get_frontend on the output file"), 0},
+	{"streaming",	'R',	NULL,			0, N_("uses streaming I/O"), 0},
 	{"verbose",	'v',	NULL,			0, N_("be (very) verbose"), 0},
 	{"output",	'o',	N_("file"),		0, N_("output filename (default: ") DEFAULT_OUTPUT ")", 0},
 	{"file-freqs-only", 'F', NULL,			0, N_("don't use the other frequencies discovered during scan"), 0},
@@ -95,6 +97,7 @@ static const struct argp_option options[] = {
 };
 
 static int verbose = 0;
+static int streaming = 0;
 #define CHANNEL_FILE "channels.conf"
 
 #define ERROR(x...)                                                     \
@@ -394,6 +397,9 @@ static error_t parse_opt(int k, char *optarg, struct argp_state *state)
 	case 'p':
 		args->other_nit++;
 		break;
+	case 'R':
+		streaming++;
+		break;
 	case 'v':
 		verbose++;
 		break;
@@ -521,6 +527,9 @@ int main(int argc, char **argv)
 	dvb_dev_set_log(dvb, verbose, NULL);
 	dvb_dev_find(dvb, NULL, NULL);
 	parms = dvb->fe_parms;
+	if (streaming) {
+		parms->stream_ctx = dvb_v5_stream_alloc();
+	}
 
 	dvb_dev = dvb_dev_seek_by_adapter(dvb, args.adapter_dmx, args.demux, DVB_DEVICE_DEMUX);
 	if (!dvb_dev) {
@@ -559,6 +568,10 @@ int main(int argc, char **argv)
 
 	err = run_scan(&args, dvb);
 
+	if (streaming) {
+		dvb_v5_stream_free(parms->stream_ctx);
+		parms->stream_ctx = NULL;
+	}
 	dvb_dev_free(dvb);
 
 	return err;
-- 
2.47.2


