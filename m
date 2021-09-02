Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07563FEE04
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 14:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344810AbhIBMuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 08:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344750AbhIBMuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 08:50:20 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471AAC0613D9
        for <linux-media@vger.kernel.org>; Thu,  2 Sep 2021 05:49:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7822:25bf:8b52:7a36])
        by michel.telenet-ops.be with bizsmtp
        id p0pF2500A13ssow060pFKt; Thu, 02 Sep 2021 14:49:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mLm9a-001Ldo-QY; Thu, 02 Sep 2021 14:49:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mLm9a-00BK7n-CY; Thu, 02 Sep 2021 14:49:14 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hridya Valsaraju <hridya@google.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/3] dma-buf: DMABUF_DEBUG should depend on DMA_SHARED_BUFFER
Date:   Thu,  2 Sep 2021 14:49:12 +0200
Message-Id: <20210902124913.2698760-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902124913.2698760-1-geert@linux-m68k.org>
References: <20210902124913.2698760-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DMA-BUF debug checks are an option of DMA-BUF.  Enabling DMABUF_DEBUG
without DMA_SHARED_BUFFER does not have any impact, as drivers/dma-buf/
is not entered during the build when DMA_SHARED_BUFFER is disabled.

Fixes: 84335675f2223cbd ("dma-buf: Add debug option")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/dma-buf/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index de5a17c40a33d336..d53782f4f51b54f7 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -53,6 +53,7 @@ config DMABUF_MOVE_NOTIFY
 
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
+	depends on DMA_SHARED_BUFFER
 	default y if DMA_API_DEBUG
 	help
 	  This option enables additional checks for DMA-BUF importers and
-- 
2.25.1

