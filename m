Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA6A22B36E
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 18:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgGWQXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 12:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgGWQXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 12:23:44 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C36FC0619DC
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 09:23:44 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t6so3373676pgq.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yfVZE7NtYdJUGsjP3O6STFOxzndL23VX/D2iT0ffJ+g=;
        b=V1ktARFIhvMKQ1IxYdxFJADL/UylqOQ00z+Am7Kd1qUnu0QySTpk5Uamc3GH1QHKfo
         2/jqVG1jrdxCJhq/1iw/AYy8jDxZi6irE1+/49+4quaDN6xu83Dz6cbaQKxbl5zVIPWm
         Ffn9OEawxeYHWvtOdi5/rP2jokjo2HmSR9oTy0h97yTnL10RCaMYpg2kKQTXx0zy51ju
         5cPyRScGda2zL33Aw41pHcDh0rRm/Y2OEcnZvj6gA1hI/0U16Nshg6soXCLQDmuo+DOe
         4G+ofNLr9j6ybSmmJoHlVUoW9ldJXGsaG3I/lDmXeu6kGfIe17e8evUvFvkk9YOXwtNw
         Tabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yfVZE7NtYdJUGsjP3O6STFOxzndL23VX/D2iT0ffJ+g=;
        b=oNqWKfS556hDGHdbi0NhWeet1Ezvaw2aHxHlwEYgzE7vColblauU91WQIDu1az8LQk
         M2GTISwxeI76Lh5SSlDl/YIgf59l7EjJP2MUvQX8FTI1HEmdvs/uIFe6pUTEyLnwKL6H
         fiK3L8WQlNFljsTKqrHSEBTkAG7Tm7KholuHte8Hjwxb6BRn3r4VNbYFylfzjAmCUkHo
         +ljrYuG2zoqqxmtlONL0Mf8ZJIFC93OXxDikmKbq59zIjVSkXslTrz8a6rYCFKef9pHC
         Omj6NKVWuE43/B7Bh64DhD6g/IqkSL3ytpGmXDQOJto09nBpjzoGp2PD84uLmPU9W17P
         AOZg==
X-Gm-Message-State: AOAM530u6hIQzW0YuM5kxdLcX/TpWesp7aWxKN6xtUCVKOaw+EVIxxVK
        tTilyPB1vX4fmNLmA8AI0PXcTPk0iJC51ns5
X-Google-Smtp-Source: ABdhPJzbnnnE6Rh2XjQbhhJ7ROlLAfGKGGLbdklkCo4gn8qqnsOroCD1/9SBEizlhDfPxXMcwd1RSw==
X-Received: by 2002:a63:141:: with SMTP id 62mr4743428pgb.366.1595521424009;
        Thu, 23 Jul 2020 09:23:44 -0700 (PDT)
Received: from pop-os.localdomain ([117.99.80.188])
        by smtp.googlemail.com with ESMTPSA id p11sm3166866pfq.91.2020.07.23.09.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 09:23:43 -0700 (PDT)
From:   Aditya Jain <aditya.jainadityajain.jain@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        Aditya Jain <aditya.jainadityajain.jain@gmail.com>
Subject: [PATCH] media: atomisp: Fix braces placement coding style errors
Date:   Thu, 23 Jul 2020 21:51:33 +0530
Message-Id: <20200723162133.27227-1-aditya.jainadityajain.jain@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix braces placement errors as reported by checkpatch.pl

Signed-off-by: Aditya Jain <aditya.jainadityajain.jain@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8ea65bef35d2..b64a153d37fd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -877,7 +877,8 @@ static struct atomisp_video_pipe *__atomisp_get_pipe(
 
 enum atomisp_metadata_type
 atomisp_get_metadata_type(struct atomisp_sub_device *asd,
-			  enum ia_css_pipe_id pipe_id) {
+			  enum ia_css_pipe_id pipe_id)
+{
 	if (!asd->continuous_mode->val)
 		return ATOMISP_MAIN_METADATA;
 
@@ -1211,8 +1212,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	default:
 		break;
 	}
-	if (vb)
-	{
+	if (vb) {
 		vb->ts = ktime_get_ns();
 		vb->field_count = atomic_read(&asd->sequence) << 1;
 		/*mark videobuffer done for dequeue*/
@@ -1234,8 +1234,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	 * Requeue should only be done for 3a and dis buffers.
 	 * Queue/dequeue order will change if driver recycles image buffers.
 	 */
-	if (requeue)
-	{
+	if (requeue) {
 		err = atomisp_css_queue_buffer(asd,
 					       stream_id, css_pipe_id,
 					       buf_type, &buffer);
@@ -1940,9 +1939,9 @@ int atomisp_get_frame_pgnr(struct atomisp_device *isp,
  * Get internal fmt according to V4L2 fmt
  */
 static enum ia_css_frame_format
-v4l2_fmt_to_sh_fmt(u32 fmt) {
-	switch (fmt)
-	{
+v4l2_fmt_to_sh_fmt(u32 fmt)
+{
+	switch (fmt) {
 	case V4L2_PIX_FMT_YUV420:
 				return IA_CSS_FRAME_FORMAT_YUV420;
 	case V4L2_PIX_FMT_YVU420:
-- 
2.25.1

