Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB10A5EF18B
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 11:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235670AbiI2JMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 05:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235714AbiI2JMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 05:12:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBAD142E30
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 02:12:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B110460A06
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 09:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD23AC433C1;
        Thu, 29 Sep 2022 09:11:24 +0000 (UTC)
Message-ID: <1ecd74b1-05ff-ce65-23c3-ca80b4b6469e@xs4all.nl>
Date:   Thu, 29 Sep 2022 11:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Daniel Gomez <daniel@qtec.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] videodev2.h: add p_s32 and p_s64 pointers
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

Added p_s32 and p_s64 pointers to the union in struct v4l2_ext_control to
simplify INTEGER and INTEGER64 control array support.

Internally the control framework handles such arrays just fine, but user space
is missing corresponding pointers to access array elements of these types.

The internal union v4l2_ctrl_ptr which the control framework uses already
has these types, they just were never added to the public API.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 86cae23cc446..a6f5c008a5a8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1779,6 +1779,8 @@ struct v4l2_ext_control {
 		__u8 __user *p_u8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
+		__u32 __user *p_s32;
+		__u32 __user *p_s64;
 		struct v4l2_area __user *p_area;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps *p_h264_pps;
