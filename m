Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138A5530A11
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 10:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbiEWH1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 03:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbiEWH1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 03:27:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A982193C8
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 00:24:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A55C960F4E
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 07:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C05C385AA;
        Mon, 23 May 2022 07:24:14 +0000 (UTC)
Message-ID: <4558ae65-b5af-5cc3-9159-c2d134441226@xs4all.nl>
Date:   Mon, 23 May 2022 09:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH 3/2] media: vivid.rst: document HDMI Video Guard Band control
Content-Language: en-US
To:     linux-media@vger.kernel.org
Cc:     Johan Fjeldtvedt <johfjeld@cisco.com>
References: <20220513125307.3494442-1-hverkuil-cisco@xs4all.nl>
 <20220513125307.3494442-3-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220513125307.3494442-3-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document this new vivid test control.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 6d7175f96f74..41b2f668134e 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -714,6 +714,20 @@ The Test Pattern Controls are all specific to video capture.

 	does the same for the EAV (End of Active Video) code.

+- Insert Video Guard Band
+
+	adds 4 columns of pixels with the HDMI Video Guard Band code at the
+	left hand side of the image. This only works with 3 or 4 byte RGB pixel
+	formats. The RGB pixel value 0xab/0x55/0xab turns out to be equivalent
+	to the HDMI Video Guard Band code that precedes each active video line
+	(see section 5.2.2.1 in the HDMI 1.3 Specification). To test if a video
+	receiver has correct HDMI Video Guard Band processing, enable this
+	control and then move the image to the left hand side of the screen.
+	That will result in video lines that start with multiple pixels that
+	have the same value as the Video Guard Band that precedes them.
+	Receivers that will just keep skipping Video Guard Band values will
+	now fail and either loose sync or these video lines will shift.
+

 Capture Feature Selection Controls
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

