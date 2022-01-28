Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A4349F54D
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 09:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347371AbiA1IgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 03:36:13 -0500
Received: from mga17.intel.com ([192.55.52.151]:52647 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238638AbiA1IgM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 03:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643358972; x=1674894972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VeQInHmHVOmhjLd436GKM+ceZUYLSpJbxttjZYailqQ=;
  b=V5o87AyqPXdZ7sfo2U05Vid8yVZyq4EWtRzAE/8SVGcB2rZL0aQJh8Qd
   lh5hisz+yVbz/VsrFV44bzT0b83RWEIpe1CDot67DERuLfvKuIO0uxv6l
   ncAlI0vOI3UmCvmvE97HuX4ckqRBgcR4X8SO3jTUpFgAuqEjH2ZGonsU4
   GjYivyLvBata0epTHMSzJ8nGTBvOZWZgPF7Fi3FGqEN0uSg+H8j+D0xs8
   3Pt16d0xpgTetUb5hb4DSLUhpCXi1Ty0TDQvlWodad+5hBzFs4m0J/TN7
   6G7mg4BpaUfnWt9/d9usztXtLzsVoRiEgjuFYriCcYQcV0Z1ru6V97OOh
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227749350"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; 
   d="scan'208";a="227749350"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 00:36:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; 
   d="scan'208";a="581788723"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 00:36:11 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     srinivas.kandagatla@linaro.org, gregkh@linuxfoundation.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        daniel.vetter@ffwll.ch, airlied@linux.ie, lyude@redhat.com,
        tzimmermann@suse.de, linux-media@vger.kernel.org,
        nouveau@lists.freedesktop.org
Subject: [PATCH 02/14] misc: fastrpc: Replace dma-buf-map with iosys-map
Date:   Fri, 28 Jan 2022 00:36:14 -0800
Message-Id: <20220128083626.3012259-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

iosys-map is the new name for dma-buf-map and will gain new
capabitilities. Replace with the new API.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4ccbf43e6bfa..5c0503655212 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -587,11 +587,11 @@ static void fastrpc_dma_buf_detatch(struct dma_buf *dmabuf,
 	kfree(a);
 }
 
-static int fastrpc_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
+static int fastrpc_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 {
 	struct fastrpc_buf *buf = dmabuf->priv;
 
-	dma_buf_map_set_vaddr(map, buf->virt);
+	iosys_map_set_vaddr(map, buf->virt);
 
 	return 0;
 }
-- 
2.35.0

