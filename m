Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73733B565F
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 02:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhF1Amj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Jun 2021 20:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbhF1Ami (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Jun 2021 20:42:38 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E67C061574;
        Sun, 27 Jun 2021 17:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=lra+cUKfxwndGLkV7ZWKLMN4hPRlMGF3o/8Xt0/nRac=; b=bJx5T8WWjr/W2k/br2OI9ZqEsE
        iwsRP2qCtB7KQOjyszj+otTS5KTtffDEDByBCOWoJK+Cf61AV5EbBcajb0eneIRrF1b13b4AqK7Ed
        YjoQEeeSQzswxHSwWoa7RS4l4wmvV/rEvrb/XUM0AqdpHXRQwTSkGpXu6ZWYM+boeeTtdNQp8RcVe
        MirbaL5h84zzr3BfCSQTJQm3uzQQlwSrcMEQvYW+GxtTvTBxy0udL50t9BxzF0lEvxQ/RNFAxDFjj
        7zPcuvZbL8KIYbT9AKkz5EApJRNUMQneccicByPk4JVsy7yMmR8CMP6LbQ8DAMvfRrhoGyfdWAJ3s
        WyHgmAGQ==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lxfJt-006MWD-LC; Mon, 28 Jun 2021 00:40:13 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH -next] <linux/dma-resv.h>: correct a function name in kernel-doc
Date:   Sun, 27 Jun 2021 17:40:12 -0700
Message-Id: <20210628004012.6792-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix kernel-doc function name warning:

../include/linux/dma-resv.h:227: warning: expecting prototype for dma_resv_exclusive(). Prototype was for dma_resv_excl_fence() instead

Fixes: 6edbd6abb783d ("ma-buf: rename and cleanup dma_resv_get_excl v3")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
---
 include/linux/dma-resv.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210625.orig/include/linux/dma-resv.h
+++ linux-next-20210625/include/linux/dma-resv.h
@@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struc
 }
 
 /**
- * dma_resv_exclusive - return the object's exclusive fence
+ * dma_resv_excl_fence - return the object's exclusive fence
  * @obj: the reservation object
  *
  * Returns the exclusive fence (if any). Caller must either hold the objects
