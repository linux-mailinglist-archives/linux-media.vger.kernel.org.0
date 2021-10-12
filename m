Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368CA42AF42
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 23:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbhJLVtc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 17:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbhJLVtb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 17:49:31 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21879C061570;
        Tue, 12 Oct 2021 14:47:29 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y26so2604666lfa.11;
        Tue, 12 Oct 2021 14:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VUVv9MTjN3o4lS4ubMPiD1BExy7qbG6BXOOhNOMCzhI=;
        b=FooP3E8Nhhx6bq4Jp1qsHB6rl4d1cGpg9dHHqtC1eQENLPUqhufHKiJR6HmpbYKC89
         XSE8KQaTXvhRjA/reL/kDv65k3lly5oXpuHojoitApvUH1j9P30m/xoT5DVMt3uY3KPA
         K85kr9uxfKRh2+QAhf7RgCgqtywUce9NvEGeI1jfd2ymCjL4A4H79UzpNBHN82U/uVTd
         yjkobqhckq8ffxdniBD0lMPELsPoTGzrZ5A6TXmoP/zgVDBUOwlsJKLs+dlSAd0b8xEp
         mUTMU+LhlMNYw8hMb+gisSs5R7XvuID1vOkjDLpxS5GhaSUzN3QJQ0AA8YtMJsceGEvE
         8WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VUVv9MTjN3o4lS4ubMPiD1BExy7qbG6BXOOhNOMCzhI=;
        b=w9inFoecON7cUdZXME2r1OeKWRgMSyjGaRLBUqoOIQPP5XGgCNPThxsn/mE4Xf74Cj
         Y8g5vNGsLHHczG9amivzBBBYPNRiwYcl62SBIfdm5ufUomVNdQd/X3GyzzA/FiOMIRHP
         81I76+qb9RGjCzCDmwdFbhW4F3nHw+lL1dcQU4X8mFqK0wFle2pWBUQ9Bnu97wzHXDEe
         e4xWjJqj/7qpVrqARSefbFGSKJN108JX6hbPg3s5yIBsWYC9rgm8VDJLffxZ8BOl6XU3
         9ZnyMwz4knl8Xw6FRUHGpWd+TRDJmWTYITSGyoMIus1u54P0JBeoaPI7UfWtJMtarq7M
         n2bA==
X-Gm-Message-State: AOAM532Y6WbVeJeViptJ5r4Vxk+CxGUcnx1iLkpPtHP7Jek2Q+X2+KBb
        lifk8rJZ8dF7NperwJP4bE4=
X-Google-Smtp-Source: ABdhPJyRBMDkpJFUTFQS7G+4/N1LZlZozF2NmOFa4a06BCK87fLlm7HZcfaClFpk+h1lXvzKFoozXQ==
X-Received: by 2002:a05:6512:10c5:: with SMTP id k5mr4758736lfg.617.1634075247497;
        Tue, 12 Oct 2021 14:47:27 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-5.NA.cust.bahnhof.se. [158.174.22.5])
        by smtp.gmail.com with ESMTPSA id e15sm344837lfs.35.2021.10.12.14.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 14:47:27 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: imx: Constify static struct v4l2_m2m_ops
Date:   Tue, 12 Oct 2021 23:47:03 +0200
Message-Id: <20211012214703.25433-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only usage of m2m_ops is to pass its address to v4l2_m2m_init(),
which  takes a pointer to const v4l2_m2m_ops as argument. Make it const
to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index eb6da9b9d8ba..1fd39a2fca98 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -820,7 +820,7 @@ static const struct v4l2_file_operations ipu_csc_scaler_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
-static struct v4l2_m2m_ops m2m_ops = {
+static const struct v4l2_m2m_ops m2m_ops = {
 	.device_run	= device_run,
 	.job_abort	= job_abort,
 };
-- 
2.33.0

