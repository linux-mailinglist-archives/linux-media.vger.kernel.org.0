Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEC0336FBF
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbhCKKUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:48 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45183 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232251AbhCKKU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQelKo4r; Thu, 11 Mar 2021 11:20:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458028; bh=akFV2ND26kHedFGHVihnt7SWgHstfR2ajd4wr3MO/ZQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=DVJoCa2zvKTJZY4U5IlZDDIZX1l7HwE0COGoJS2enkYBN2YuZyboSablkU0JAfwtr
         lCOxvzT2EG8Zn8NqAWz7OtyehB9tM8m3Qh67Z9t4WrsMWuYrs7vKMRvxAPG1hZA3Ia
         XodEOZheFccxKdG3nARe4kBsksB3Gv1Oo/G9EoorhCsSr7EGedBEodUBQ1Rboe+dlU
         eZWteVcOZwWhlScZ+8Dy3ODWzrIVLzWJj3E4ySl1meELm4kcTTUhMrufE0KWj/Td1V
         TBIfCTkW14Q/UIZV8hvARcgLqCVDBDQGgU12Jx1KAZXpc1XEgSfTNL1Vb2UdpRbCOg
         Pso6W9QxHqlTQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 02/13] s5p-jpeg: fix kernel-doc warnings
Date:   Thu, 11 Mar 2021 11:20:11 +0100
Message-Id: <20210311102022.96954-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI2xPb/zUiB1u72ER64GdeqlP5VATSz1rK0PzXa8A/OqDFQ+9I+MEpAR3WYnAs21EYlBUZ6IxwHRH6xiF5pUwmHqHeW73aKBo1Cd+mE10150Hj0IjQg7
 ecQCpfUlobofQ4V2L0ZWzyWiBBpQFk0AB9QJ8+ZMYGJf2IQyv28zB5+HYc8rqQ7O6rPCkoVzKowBnfff9HGYHvNFMbYHTFG1bmNDpI13ufBtXq+hNuWXjWyn
 jeoQpbah2/Uj2UDuK3EmlqgUdWHmqVZnOC6yQDOx0O5LE0Luis24Q0X4Hsvuaqim
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- added missing 'struct' kernel-doc keywords
- add missing '*' in kernel-doc comment blocks

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/s5p-jpeg/jpeg-core.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.h b/drivers/media/platform/s5p-jpeg/jpeg-core.h
index 4407fe775afa..fcd21ae8bcbe 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.h
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.h
@@ -115,8 +115,7 @@ enum s5p_jpeg_ctx_state {
  * @dev:		JPEG IP struct device
  * @variant:		driver variant to be used
  * @irq_status		interrupt flags set during single encode/decode
-			operation
-
+ *			operation
  */
 struct s5p_jpeg {
 	struct mutex		lock;
@@ -149,7 +148,7 @@ struct s5p_jpeg_variant {
 };
 
 /**
- * struct jpeg_fmt - driver's internal color format data
+ * struct s5p_jpeg_fmt - driver's internal color format data
  * @fourcc:	the fourcc code, 0 if not applicable
  * @depth:	number of bits per pixel
  * @colplanes:	number of color planes (1 for packed formats)
@@ -169,7 +168,7 @@ struct s5p_jpeg_fmt {
 };
 
 /**
- * s5p_jpeg_marker - collection of markers from jpeg header
+ * struct s5p_jpeg_marker - collection of markers from jpeg header
  * @marker:	markers' positions relative to the buffer beginning
  * @len:	markers' payload lengths (without length field)
  * @n:		number of markers in collection
@@ -181,7 +180,7 @@ struct s5p_jpeg_marker {
 };
 
 /**
- * s5p_jpeg_q_data - parameters of one queue
+ * struct s5p_jpeg_q_data - parameters of one queue
  * @fmt:	driver-specific format of this queue
  * @w:		image width
  * @h:		image height
@@ -205,7 +204,7 @@ struct s5p_jpeg_q_data {
 };
 
 /**
- * s5p_jpeg_ctx - the device context data
+ * struct s5p_jpeg_ctx - the device context data
  * @jpeg:		JPEG IP device for this context
  * @mode:		compression (encode) operation or decompression (decode)
  * @compr_quality:	destination image quality in compression (encode) mode
@@ -239,7 +238,7 @@ struct s5p_jpeg_ctx {
 };
 
 /**
- * s5p_jpeg_buffer - description of memory containing input JPEG data
+ * struct s5p_jpeg_buffer - description of memory containing input JPEG data
  * @size:	buffer size
  * @curr:	current position in the buffer
  * @data:	pointer to the data
-- 
2.30.1

