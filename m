Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2AD11A1ADF
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 06:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgDHEUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 00:20:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33530 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgDHEUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 00:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=GvKjamk4sUiFDTkcqp3XAfdPqgx9QZfLYdf2cSZ1qKc=; b=SO1uPZFWq9Nmiok273flcRjei6
        zMiNn9DgT7zswypc0bl0FaKR3j57q4haOMi/ZvDXdsDn/3OobU92p2wJlwbawnvymVX1qvpIJTXia
        eA5VuDo+6U2R22v7+dEkLEV3Jxw2d1rNX8SdjOI0O/qcaZXaHXgE/rKUkLw9EsIHl3//62waCO7gW
        DW9Jozfe6VY+rz3vvdupHppSqaaj5yy+pOYrwfsVweB4OzZSpoBbTJ6MIiWpvlFdbiGVS1VRWwqbe
        yN84Q6GV05opH3H0DoKSBYsdHt/q54LqF64CWoxAwWpSxs++GDzfOuJzsIfzpXa55/oOrnR4xdOXu
        U0+7g4ig==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jM2Ca-0004vT-R1; Wed, 08 Apr 2020 04:20:36 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] dma-buf: fix documentation build warnings
Message-ID: <7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org>
Date:   Tue, 7 Apr 2020 21:20:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix documentation warnings in dma-buf.[hc]:

../drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
../drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'
../include/linux/dma-buf.h:339: warning: Incorrect use of kernel-doc format:          * @move_notify

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-buf.c |    4 ++--
 include/linux/dma-buf.h   |    3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

--- linux-next-20200407.orig/drivers/dma-buf/dma-buf.c
+++ linux-next-20200407/drivers/dma-buf/dma-buf.c
@@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
  * calls attach() of dma_buf_ops to allow device-specific attach functionality
  * @dmabuf:		[in]	buffer to attach device to.
  * @dev:		[in]	device to be attached.
- * @importer_ops	[in]	importer operations for the attachment
- * @importer_priv	[in]	importer private pointer for the attachment
+ * @importer_ops:	[in]	importer operations for the attachment
+ * @importer_priv:	[in]	importer private pointer for the attachment
  *
  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
  * must be cleaned up by calling dma_buf_detach().
--- linux-next-20200407.orig/include/linux/dma-buf.h
+++ linux-next-20200407/include/linux/dma-buf.h
@@ -329,13 +329,12 @@ struct dma_buf {
 
 /**
  * struct dma_buf_attach_ops - importer operations for an attachment
- * @move_notify: [optional] notification that the DMA-buf is moving
  *
  * Attachment operations implemented by the importer.
  */
 struct dma_buf_attach_ops {
 	/**
-	 * @move_notify
+	 * @move_notify: [optional] notification that the DMA-buf is moving
 	 *
 	 * If this callback is provided the framework can avoid pinning the
 	 * backing store while mappings exists.

