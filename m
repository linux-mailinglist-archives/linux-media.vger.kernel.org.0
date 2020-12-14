Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF052D972E
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbgLNLMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730519AbgLNLLU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:11:20 -0500
Received: from faui03.informatik.uni-erlangen.de (faui03.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90FEC0613CF;
        Mon, 14 Dec 2020 03:10:21 -0800 (PST)
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [IPv6:2001:638:a000:4130:131:188:30:90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 77CBE240AC7;
        Mon, 14 Dec 2020 12:10:20 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id 28C22328043C; Mon, 14 Dec 2020 12:02:59 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        ij72uhux@stud.informatik.uni-erlangen.de,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@i4.cs.fau.de, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: [PATCH v2 11/12] media: atomisp: Write function decleration in one line
Date:   Mon, 14 Dec 2020 12:01:55 +0100
Message-Id: <20201214110156.6152-12-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
References: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
WARNING:LEADING_SPACE: please, no spaces at the start of a line
Avoid these errors by writing the function decleration in one line.

Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
---
 .../atomisp/pci/runtime/queue/src/queue.c     | 44 +++++--------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index aea6c66a3cee..2f1c2df59f71 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -22,9 +22,7 @@
 /*****************************************************************************
  * Queue Public APIs
  *****************************************************************************/
-int ia_css_queue_local_init(
-    ia_css_queue_t *qhandle,
-    ia_css_queue_local_t *desc)
+int ia_css_queue_local_init(ia_css_queue_t *qhandle, ia_css_queue_local_t *desc)
 {
 	if (NULL == qhandle || NULL == desc
 	    || NULL == desc->cb_elems || NULL == desc->cb_desc) {
@@ -43,9 +41,7 @@ int ia_css_queue_local_init(
 	return 0;
 }
 
-int ia_css_queue_remote_init(
-    ia_css_queue_t *qhandle,
-    ia_css_queue_remote_t *desc)
+int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *desc)
 {
 	if (NULL == qhandle || NULL == desc) {
 		/* Invalid parameters, return error*/
@@ -69,8 +65,7 @@ int ia_css_queue_remote_init(
 	return 0;
 }
 
-int ia_css_queue_uninit(
-    ia_css_queue_t *qhandle)
+int ia_css_queue_uninit(ia_css_queue_t *qhandle)
 {
 	if (!qhandle)
 		return -EINVAL;
@@ -84,9 +79,7 @@ int ia_css_queue_uninit(
 	return 0;
 }
 
-int ia_css_queue_enqueue(
-    ia_css_queue_t *qhandle,
-    uint32_t item)
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 {
 	int error = 0;
 
@@ -143,9 +136,7 @@ int ia_css_queue_enqueue(
 	return 0;
 }
 
-int ia_css_queue_dequeue(
-    ia_css_queue_t *qhandle,
-    uint32_t *item)
+int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
 	int error = 0;
 
@@ -200,9 +191,7 @@ int ia_css_queue_dequeue(
 	return 0;
 }
 
-int ia_css_queue_is_full(
-    ia_css_queue_t *qhandle,
-    bool *is_full)
+int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 {
 	int error = 0;
 
@@ -234,9 +223,7 @@ int ia_css_queue_is_full(
 	return -EINVAL;
 }
 
-int ia_css_queue_get_free_space(
-    ia_css_queue_t *qhandle,
-    uint32_t *size)
+int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	int error = 0;
 
@@ -268,9 +255,7 @@ int ia_css_queue_get_free_space(
 	return -EINVAL;
 }
 
-int ia_css_queue_get_used_space(
-    ia_css_queue_t *qhandle,
-    uint32_t *size)
+int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	int error = 0;
 
@@ -302,10 +287,7 @@ int ia_css_queue_get_used_space(
 	return -EINVAL;
 }
 
-int ia_css_queue_peek(
-    ia_css_queue_t *qhandle,
-    u32 offset,
-    uint32_t *element)
+int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 {
 	u32 num_elems = 0;
 	int error = 0;
@@ -354,9 +336,7 @@ int ia_css_queue_peek(
 	return -EINVAL;
 }
 
-int ia_css_queue_is_empty(
-    ia_css_queue_t *qhandle,
-    bool *is_empty)
+int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 {
 	int error = 0;
 
@@ -388,9 +368,7 @@ int ia_css_queue_is_empty(
 	return -EINVAL;
 }
 
-int ia_css_queue_get_size(
-    ia_css_queue_t *qhandle,
-    uint32_t *size)
+int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	int error = 0;
 
-- 
2.20.1

