Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB30550D98D
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 08:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbiDYGjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 02:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiDYGjV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 02:39:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A471995
        for <linux-media@vger.kernel.org>; Sun, 24 Apr 2022 23:36:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E81B611C3
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 06:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB670C385A4;
        Mon, 25 Apr 2022 06:36:15 +0000 (UTC)
Message-ID: <62b53cbb-f3e2-ed8a-bba2-3f4145d9b8db@xs4all.nl>
Date:   Mon, 25 Apr 2022 08:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] ext-ctrls-codec.rst: fix indentation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The indentation was wrong, causing the documentation build to
fail with:

Sphinx parallel build error:
docutils.utils.SystemMessagePropagation: <system_message level="3" line="1202" source="/home/hans/work/src/v4l/media-git/Documentation/media/userspace-api/v4l/ext-ctrls-codec.rst"
type="ERROR"><paragraph>Error parsing content block for the "flat-table" directive: two-level bullet list expected, but row 1 does not contain a second-level bullet list.</paragraph><literal_block
xml:space="preserve">.. flat-table::
    :header-rows:  0
    :stub-columns: 0

    * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM``
      - The whole frame is completely refreshed randomly
      after the specified period.
    * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC``
      - The whole frame MBs are completely refreshed in cyclic order
      after the specified period.

</literal_block></system_message>
make[1]: *** [Documentation/Makefile:96: htmldocs] Error 2
make: *** [Makefile:1678: htmldocs] Error 2

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c24977fa7329..6183f43f4d73 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1197,10 +1197,10 @@ enum v4l2_mpeg_video_intra_refresh_period_type -

     * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM``
       - The whole frame is completely refreshed randomly
-      after the specified period.
+        after the specified period.
     * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC``
       - The whole frame MBs are completely refreshed in cyclic order
-      after the specified period.
+        after the specified period.

 ``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
     Intra macroblock refresh period. This sets the period to refresh
