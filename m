Return-Path: <linux-media+bounces-3814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E11830904
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 017DF28850A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5C420DE5;
	Wed, 17 Jan 2024 15:02:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8900720DC9
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503765; cv=none; b=O2eWRlfXPLxeA4wqz9C+qIghzUTyTbm6I3x/Cfavvd6vSrAh6TxWcixfvCNJ05Kj+SHGmoxIt0wZS4RTjK6X2NC1UKlN9CoON3bmCDfsD9SXGlaNIzMgjhkzHAtTWlyVdUPhcnXg8ygcK0NNaTabXtbmqXjODxBdexX33dH8/YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503765; c=relaxed/simple;
	bh=O8nJWRN4IlXH4QxG11t+fxfNkM0nAzazg1mwplEvjNI=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding; b=ZgelwgkyRXONPIpr+lRpJBkLy8WHKYN7xQK66EioQ4N79VP4i2H2JLdhHTDEBcAGhXyE8XZZ6rdIKEMcVR8Z75D0Q9P3CobZ49eYpMtd44eTFX0uJaKoSRs8bknVJyx1A9fzE9gHjEjr+uvdI0lOCff3ABuYW1kZXT3CekzeVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38295C43399;
	Wed, 17 Jan 2024 15:02:44 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 05/10] libv4l2util: recognize V4L2_CAP_AUDIO_M2M
Date: Wed, 17 Jan 2024 16:02:13 +0100
Message-ID: <b121a0deed5eb4d34fe16ce9d21915532b74cdaa.1705503477.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
References: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detect the V4L2_CAP_AUDIO_M2M capability.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/libv4l2util/v4l2_driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_driver.c
index 6b6366fa..0c881b0c 100644
--- a/utils/libv4l2util/v4l2_driver.c
+++ b/utils/libv4l2util/v4l2_driver.c
@@ -164,6 +164,8 @@ static char *prt_caps(uint32_t caps)
 		strcat (s,"META_OUTPUT ");
 	if(V4L2_CAP_TOUCH & caps)
 		strcat (s,"TOUCH ");
+	if(V4L2_CAP_AUDIO_M2M & caps)
+		strcat (s,"AUDIO_M2M ");
 	if(V4L2_CAP_IO_MC & caps)
 		strcat (s,"IO_MC ");
 
-- 
2.42.0


