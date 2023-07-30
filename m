Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 223BC76863A
	for <lists+linux-media@lfdr.de>; Sun, 30 Jul 2023 17:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjG3Peh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jul 2023 11:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjG3Peg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jul 2023 11:34:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C371A7
        for <linux-media@vger.kernel.org>; Sun, 30 Jul 2023 08:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690731228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jlLjtS510H7HKdsQ/NNxEjvgDaS15PCh9IRvsbLYu90=;
        b=O14pc1hXV39sg8Pjb5U8WylDMWT6X1H1rTzb3dIfX0HWzgo6+NUcohoJp5eI4XBc97R6LE
        YUZZBrdCR3vMk9ZfDk187pYU+p4eS2gsgmP35rQIpiBz6jRpganEVilWPok/obJuMxDzaw
        E8O2wokmPXhOW8GgOlHxC9P1+IXLBW4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-VD7NjZgHO2K4sF58RwmD7Q-1; Sun, 30 Jul 2023 11:33:47 -0400
X-MC-Unique: VD7NjZgHO2K4sF58RwmD7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AA2D800159;
        Sun, 30 Jul 2023 15:33:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7A87DC57964;
        Sun, 30 Jul 2023 15:33:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v2 1/2] media: atomisp: Fix smatch warnings caused by atomisp custom assert() usage
Date:   Sun, 30 Jul 2023 17:33:42 +0200
Message-ID: <20230730153343.22033-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp code base has a custom assert() macro, a couple of functions
use this in a construction like the following:

   assert(pipe);
   assert(pipe->stream);
   if ((!pipe) || (!pipe->stream)) {
           ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
                               "allocate_mipi_frames(%p) exit: ...\n",
                               pipe);
           return -EINVAL;
   }

The second assert is seen by smatch as dereferencing "pipe" in the above
example (and dereferencing "dvs_6axis_config" in the other case).

Following by the dereferenced variable being checked (a second time)
in the following if () statement.

This triggers the following smatch warnings:
drivers/staging/media/atomisp/pci/sh_css_mipi.c:356 allocate_mipi_frames() warn: variable dereferenced before check 'pipe' (see line 355)
drivers/staging/media/atomisp/pci/sh_css_mipi.c:562 send_mipi_frames() warn: variable dereferenced before check 'pipe' (see line 561)
drivers/staging/media/atomisp/pci/sh_css_param_dvs.c:208 free_dvs_6axis_table() warn: variable dereferenced before check 'dvs_6axis_config' (see line 206)

The custom assert() macro actually expands to a BUG() call and BUG()
calls should not be used in the kernel.

Remove the assert() calls to fix the smatch warnings and in case of
[allocate|send]_mipi_frames() also remove the if () return -EINVAL
block since these functions are never called with a NULL pipe.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note:
1. No Closes: tag since Hans Verkuil reported this in an offlist email.
2. All the other assert() calls really should also be removed.
   I've put this on my todo list.
---
Changes in v2:
- Drop the sh_css_sp.c bits, just dropping the assert() calls is
  not enough there
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c  | 16 ----------------
 .../staging/media/atomisp/pci/sh_css_param_dvs.c |  3 ---
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index b20acaab0595..ced21dedf7ac 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -351,15 +351,6 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "allocate_mipi_frames(%p) enter:\n", pipe);
 
-	assert(pipe);
-	assert(pipe->stream);
-	if ((!pipe) || (!pipe->stream)) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "allocate_mipi_frames(%p) exit: pipe or stream is null.\n",
-				    pipe);
-		return -EINVAL;
-	}
-
 	if (IS_ISP2401 && pipe->stream->config.online) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
@@ -557,13 +548,6 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 
 	IA_CSS_ENTER_PRIVATE("pipe=%p", pipe);
 
-	assert(pipe);
-	assert(pipe->stream);
-	if (!pipe || !pipe->stream) {
-		IA_CSS_ERROR("pipe or stream is null");
-		return -EINVAL;
-	}
-
 	/* multi stream video needs mipi buffers */
 	/* nothing to be done in other cases. */
 	if (pipe->stream->config.mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index ff0082d02af3..5174bc210ae1 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -202,9 +202,6 @@ generate_dvs_6axis_table_from_config(struct ia_css_dvs_6axis_config
 void
 free_dvs_6axis_table(struct ia_css_dvs_6axis_config  **dvs_6axis_config)
 {
-	assert(dvs_6axis_config);
-	assert(*dvs_6axis_config);
-
 	if ((dvs_6axis_config) && (*dvs_6axis_config)) {
 		IA_CSS_ENTER_PRIVATE("dvs_6axis_config %p", (*dvs_6axis_config));
 		if ((*dvs_6axis_config)->xcoords_y) {
-- 
2.41.0

