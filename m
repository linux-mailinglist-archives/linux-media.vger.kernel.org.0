Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2951181A44
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbgCKNwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:52:05 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42298 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729718AbgCKNwD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:52:03 -0400
Received: by mail-wr1-f65.google.com with SMTP id v11so2701952wrm.9
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zTmN9DEXOaBKxy4tMmFv7mOnUJY2ke5/2F4me6DvZxM=;
        b=BAeSTC9mAbQYlziodp36mbOGFsKH7iH3q092S9yg/JaB8KzrHSjHA75LCPhnkgOXWy
         rPq1mMbAkhv99dEpTtwdyRxvT//fEPGoOr3FpSxAMwwwylFdYazU+S7qE/k1/U6wcO9z
         rz6YxqI9KOs+KRS1WDGs8DZ754b1KUsvXZKEAImad7Ypui1EcXCKy9znmi2UU7FuSeKB
         lYVXVtZv1d9TvemNGvwTHI0wCloJ5sMwnlJlPCAPR1miGRgCl7H8B8x2uU55VdQLeF8w
         /JsODq5PKPptAVb+jR60P0gpPWcmz2aU1zALeQ+st8NSe/g3pzYf2jkOUdf6vkSFZ1YP
         R0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zTmN9DEXOaBKxy4tMmFv7mOnUJY2ke5/2F4me6DvZxM=;
        b=F6uYN7jzf+7cIGQl9OiJlp/2OM5NIg7AVG8rX/+qB2wbJcXtMHxrexYKqwGPL5s4G2
         I40Hn/iQ7rWYXU8xC6ErhQLFqnDcI6iur18fMLf1XI5ardZsmVl7Zy9KvgD/a9mVF6y4
         0yrvk/cz4Q1IAcQLsSwxNxQNaVEczN9ZdVgcizX9fGh7nPgtAiVv32PKQotQAvVRt+Qh
         mw7OIRZfVZgvvRFM6RFGnF8zAY1xrFj9nIV+kys1rTPZYBvrf0b9nmYP81kUPk5MMw3Z
         0Tvoa7fza9/P5hyzjDZfUtQPvv3mbFCFO52CFKqWvIsCEuAOmipF/Xm1F1wNWyZW0L5a
         gwkQ==
X-Gm-Message-State: ANhLgQ1FsGPB0t2VLPutxkGSM16Td/zMAzfaSzyiLAJaB2AiRq19Yu1k
        epmoP+2u3cDofMTbwR0VuHo=
X-Google-Smtp-Source: ADFU+vsOOz12ce5eYJpqK2qbmEnKZS+AmEeu/Oz2KmbCkMjsmBPhswTyMx1kwU26TJkE3M/mMkmkIQ==
X-Received: by 2002:a5d:6208:: with SMTP id y8mr4791359wru.64.1583934721964;
        Wed, 11 Mar 2020 06:52:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
        by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:52:01 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Date:   Wed, 11 Mar 2020 14:51:53 +0100
Message-Id: <20200311135158.3310-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This can be used by drivers to setup P2P DMA between device
memory which is not backed by struct pages.

The drivers of the involved devices are responsible for
setting up and tearing down DMA addresses as necessary
using dma_map_resource().

The page pointer is set to NULL and only the DMA address,
length and offset values are valid.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/scatterlist.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 6eec50fb36c8..28a477bf0bdf 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -145,6 +145,29 @@ static inline void sg_set_buf(struct scatterlist *sg, const void *buf,
 	sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
 }
 
+/**
+ * sg_set_dma_addr - Set sg entry to point at specified dma address
+ * @sg:		 SG entry
+ * @address:	 DMA address to set
+ * @len:	 Length of data
+ * @offset:	 Offset into page
+ *
+ * Description:
+ *   Use this function to set an sg entry to point to device resources mapped
+ *   using dma_map_resource(). The page pointer is set to NULL and only the DMA
+ *   address, length and offset values are valid.
+ *
+ **/
+static inline void sg_set_dma_addr(struct scatterlist *sg, dma_addr_t address,
+				   unsigned int len, unsigned int offset)
+{
+	sg_set_page(sg, NULL, len, offset);
+	sg->dma_address = address;
+#ifdef CONFIG_NEED_SG_DMA_LENGTH
+	sg->dma_length = len;
+#endif
+}
+
 /*
  * Loop over each sg element, following the pointer to a new list if necessary
  */
-- 
2.17.1

