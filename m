Return-Path: <linux-media+bounces-57376-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKr8AQMDx2lORgUAu9opvQ
	(envelope-from <linux-media+bounces-57376-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:21:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5673934BF0A
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8194230721B5
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8E8395261;
	Fri, 27 Mar 2026 22:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apqQQEDe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F9B258EDA
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649952; cv=none; b=QjQ/FRJkjC7FSSo9j8ph5T6g9q80I9DgnmGio3GLL3NzHQVpU2zcdMU9A8AYjczazyI7dGA13H51oXZAJABLQ/ihVIiC8OKeXqqIFNqchfMK/ffOOfbiFBpwYc5ahYD5kS2BYyjZb00FIeo7w1/lc2RTJCD0hl/62/mW+1oERfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649952; c=relaxed/simple;
	bh=Mr1jyz+Ve6GrZCxntbR1QcCoQ8B70nqLcqbVN1POHhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E0ybGxmA8WFui9FXBzg4v+NHmAUUBBRn03bfjL6jiNDLjNyH9eGqfcXEVEuQy4O5L5C1FeuYdS1o5AeSV0GQETNalLeidA9nrwauBHADmrzJCtmPGEJYiDipSZtFNjZWgsHchmLWus9PJmnNl/jS4xKWNN/JW2vB6oU2tAiTA54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apqQQEDe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fb14227cso33054995e9.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774649949; x=1775254749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOr5ARwTTylH9deTx77kYmBkTdRY5+SBIZ8AjtFWZFY=;
        b=apqQQEDeO9tsuCQcFkTEOTScM6WXPqUJZIIjMcL3BnM0MgVaX30S70le3kV4C2dwMM
         PZcrl/bzh8nqJMavsZSuk98Yyey3E1gCWGchgPHHdVOtFuAUpcLHOK1yfRaEMX0S5ngi
         YIN7OXY8+shHpcivVns3P59SnOoCgP0UWksIvJ1bwxAOasTZAtnC0n8W4nBO2gYiueGf
         FbKkgCOk4np8qASlqe1iMegw/IpmS7NAZFSqxEW3V5OTx4O6o2Unou0J39UPAO5Nvz/8
         ziB73YOtXyU14HPpgyF+JJ4WfmdeMVijHxxb2diqYTKsHETOC0G8ssk2PuxpE7MyC4fb
         ZclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774649949; x=1775254749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOr5ARwTTylH9deTx77kYmBkTdRY5+SBIZ8AjtFWZFY=;
        b=TUSPOpaTkDcpvyp7/OrOoYnQCyKCFSI9LNeFb0/XXoFrTp/fvSybYEyjbWTpU09H0s
         SBpkpnHypyNG8AbHQ92gqnewpy+melXDlPdfMc10TyP7304QLk8X3GFiNCvy4BK3OQm3
         yJsBwoVdRa+omO7Bc7J47KUqxjydJ2f1h4Mgw02PuXTuX4XW1MYvb0Cl6ABySBE/JFy1
         cUnb//i7MQmZ8UuJjzLGmf2ArKbTRps3BTbAOZHiA3KXmHcaxxwmQVbNvrlnYNt9ZbsZ
         aZn70CudKaZMzyXJTJjnOWJpqQ+xj16bLnySS1fIqUHSCRc/w0ssMKcTD+d2DHCZT0f4
         ixlQ==
X-Gm-Message-State: AOJu0YwmIdbwaWfsy7JJW83zpDojm0ixNjVlRcYRTaCsq4fnCk5M9eWb
	O7UbivnOuXaX2VZdcxno9aK9Zx1SnfR1FalPLuMEL+jn2jA3wi1huelP
X-Gm-Gg: ATEYQzyF/8NpyGYE4IvqHh8eA0bj+S8ES/fijJXDpWqNOcxFVDG3+ZqXUePzdVuvzP5
	GzyHuwMBQl2YQVHpv+iXzbxUF2kbLEAunY7Ztimos3y0hxi9lxvT7vPPmWjz8op+Ysfhqu6Hhrn
	kmi6pIO6xvg+8qxmAh+5Dh5brTY6yNWAWjpTKG3l/+wVGwUTmKW3LuHMqbOg2a5KrhWRpLqvPrm
	weHrEK92ZlyoFRjUr7ajJqZGT6ChTwuZEyp6TKdr0p01QXBQx/1/mEBzGiMU+Fzbh7e2V7rXnUB
	H2Ur3tiStHoIh+C6KJDdk9Jb3dPsUz13NWauvs3Qx5ACPCYDRCliAvcC8SF9awP3gjJ2ZP75T99
	c7wgvA8CVI8fLgD+OXA/AFfHyB9zyYxF62k+MmXTmCLnfNnYz1IGAq/83kAtFuovDFf1/8hfAmN
	EQ+PW8DdSiEnQ+1EriWuODo/J/On1S+yAFPbGBcQ8/M685/9zZgTtLN3Mk6YuRvK/65l1Lkyzeh
	7a6HwogWn2u
X-Received: by 2002:a05:600c:3112:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-48727ea2803mr72526885e9.14.1774649949040;
        Fri, 27 Mar 2026 15:19:09 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487306acb47sm8489965e9.15.2026.03.27.15.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:19:08 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 1/2] media: nuvoton: npcm-video: fix error handling in npcm_video_init()
Date: Fri, 27 Mar 2026 22:19:04 +0000
Message-ID: <20260327221905.267410-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57376-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5673934BF0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

npcm_video_init() has two error handling issues after
of_reserved_mem_device_init() is called:

When dma_set_mask_and_coherent() fails, the function releases the
reserved memory but does not return, allowing execution to fall through
into npcm_video_ece_init() with a failed DMA configuration.

When npcm_video_ece_init() fails, the function returns an error without
calling of_reserved_mem_device_release(), leaking the reserved memory
association.

Fix both by adding the missing return after the DMA mask failure and
adding the missing of_reserved_mem_device_release() call on the ECE init
error path.

Fixes: 7c3a5e744482 ("media: nuvoton: Add driver for NPCM video capture/encode engine")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index b2a562e1ee1c..5c6bddfe8073 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1720,10 +1720,12 @@ static int npcm_video_init(struct npcm_video *video)
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
 		of_reserved_mem_device_release(dev);
+		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
+		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
-- 
2.53.0


