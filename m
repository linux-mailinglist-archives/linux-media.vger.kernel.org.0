Return-Path: <linux-media+bounces-11864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFB8CED1D
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 02:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D4D71F23337
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 00:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CA02F2F;
	Sat, 25 May 2024 00:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Hnn8pprL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E3C197;
	Sat, 25 May 2024 00:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716595365; cv=none; b=ajOeocAu24Rz555SH1psgSESxnNEBckcAYrBOkWKMJDWYVSX/UXS0MLWBJy0ae8CLIEcmFmRE5Fo7eIvtep7iuYJcFKgFQMzFF4hKrTC6PlmB++Mt1oMTJiY65tpRnD5Z5gTsfR0xMpdD5xBa4arEmSBHh3QHWOYq1mnu2nMJwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716595365; c=relaxed/simple;
	bh=PQ1FKcCUCeRWDVTvkdg1KM0e85klmalQaoUcQrh9OsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMSVyev0fTUevuppGQ7zCJB3XlmDVyy+nvL4L4yuXtUHH9vH9JS4+eyUUadAghjPYP9YCu+CLGMgogxKxtjIrcvAZxEXyNVjdP3ndi73QrJxhRENPJ0BvPP43iLkIeNBnh5rJfO3w3HBPhWjL37inHI0hHtG1/xx4rLeMqE4Qnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Hnn8pprL; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=z+2wS/pFD/rzX9s5/BP3xqTq5VR+XvUAMuFhzTB9kkw=; b=Hnn8pprLxv6kCCjQ
	31AYxdCj9hAHXI9ETaweIM2Oik5u+lqSR0JrIClfLoxLtpoKv2Aot8KKiVIlGt7bdRCMRK6YccfTO
	1ReqvQf5XK3L3RhtUn0gYH0MCQSh40YZOkB11jyhL3r/16RvcJUzirPcB9Cz3NahkdGJsri2hCXh4
	Aj5FeSphGQTwVQBE17c3L1BQcnfAXtYi+00WUQTNTBvLRlfO0SvsZapQguBwSdzzHrjg/rnltjHB8
	LThpSGk8oMnVRzWf0HVqZSEyF8lhNxmKbiWgTTcd+VhdSFuV/WgFzcZhVB8ekYQVZY3h0vu+7IMS0
	4FsJ0AV+7IawW0bI3g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAert-002TKv-2D;
	Sat, 25 May 2024 00:02:38 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	digetx@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] media: m2m-deinterlace: remove unused struct 'vb2_dc_conf'
Date: Sat, 25 May 2024 01:01:45 +0100
Message-ID: <20240525000146.282500-3-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240525000146.282500-1-linux@treblig.org>
References: <20240525000146.282500-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'vb2_dc_conf' has been unused since the original
commit 8f0755c06b90 ("[media] media: Add mem2mem deinterlacing driver").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/platform/m2m-deinterlace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 96b35a5d6174..5adcef80c698 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -724,10 +724,6 @@ static const struct v4l2_ioctl_ops deinterlace_ioctl_ops = {
 /*
  * Queue operations
  */
-struct vb2_dc_conf {
-	struct device           *dev;
-};
-
 static int deinterlace_queue_setup(struct vb2_queue *vq,
 				unsigned int *nbuffers, unsigned int *nplanes,
 				unsigned int sizes[], struct device *alloc_devs[])
-- 
2.45.1


