Return-Path: <linux-media+bounces-3803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CAB8306A4
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 14:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A686F1F24F9A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 13:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68B71F19D;
	Wed, 17 Jan 2024 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M4qOZW3/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A293C1EA95
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705496915; cv=none; b=V6s0CX8zJjWy8zntn7AZHHV7S44ZU3IAIesb9BwYTnqrxJBGQWZMVet+0y+JkjYRCENIOkhiYt8LuSFzkOQfgcu2RRPq0TxV5kxWTuvur4KJsSOupHN3Q+FOdp5fg3+23u6yl6sayoM0gPG+xVREziqetfE7zJH9kbsoqDoMU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705496915; c=relaxed/simple;
	bh=jAfmmaS8Bclp4ZJmZZ4/lxERktgwTfSi5kYAVWyHrLI=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=KiJgX4/Uxiu8dXSJ+BGkGG/FaYu2LnJHRsqDq2abnUsdUQAr7b2oCv/tnGXvlSWLTwxjFlxb7+puYhWA5ZtRjk9Y5PR0+u3g9wgOtB/1+RBnyFFdQ4dGF0yk6V+4g9kmpVv3Vyc+r6iQ5qyFHK2KrcxpKowG/ibrV+ZScYsA15U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M4qOZW3/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCC3014F6;
	Wed, 17 Jan 2024 14:07:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705496842;
	bh=jAfmmaS8Bclp4ZJmZZ4/lxERktgwTfSi5kYAVWyHrLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M4qOZW3/rKjkvitw9FKcheiAUzUfS4GNSEKKibNIspXqsNO9rJ7HjHokro8M6O200
	 flrv5/oC3uXVtkKLaIQvMMo9Vm0ZMGBCEE4ucNz7DUtmgGyx3FXmoyb+HiRru/pnq6
	 AO3404el8C6KstGenltRSHJRxUXP7gkGj1iB4H/M=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 2/2] media-ctl: Re-order setting format and routes
Date: Wed, 17 Jan 2024 13:08:05 +0000
Message-Id: <20240117130805.939312-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117130805.939312-1-dan.scally@ideasonboard.com>
References: <20240117130805.939312-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently media-ctl attempts to set formats that are passed to it
with -V _before_ setting routes passed to it with -R. This is a
problem, because the formats that one wants may not be valid until
routing has been configured (for example, if the format is for a
route that is inactive by default).

Reorder things so that setting routes comes before setting formats.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 utils/media-ctl/media-ctl.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 961d10c8..2081f111 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -751,20 +751,20 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (media_opts.formats) {
-		ret = v4l2_subdev_parse_setup_formats(media,
-						      media_opts.formats);
+	if (media_opts.routes) {
+		ret = v4l2_subdev_parse_setup_routes(media, media_opts.routes);
 		if (ret) {
-			printf("Unable to setup formats: %s (%d)\n",
+			printf("Unable to setup routes: %s (%d)\n",
 			       strerror(-ret), -ret);
 			goto out;
 		}
 	}
 
-	if (media_opts.routes) {
-		ret = v4l2_subdev_parse_setup_routes(media, media_opts.routes);
+	if (media_opts.formats) {
+		ret = v4l2_subdev_parse_setup_formats(media,
+						      media_opts.formats);
 		if (ret) {
-			printf("Unable to setup routes: %s (%d)\n",
+			printf("Unable to setup formats: %s (%d)\n",
 			       strerror(-ret), -ret);
 			goto out;
 		}
-- 
2.34.1


