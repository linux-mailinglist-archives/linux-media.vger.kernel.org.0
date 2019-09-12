Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD7FB1016
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 15:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732138AbfILNfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 09:35:51 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34101 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731283AbfILNfv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 09:35:51 -0400
Received: from [IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985] ([IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8PGEiQ6kjV17O8PGHiytnX; Thu, 12 Sep 2019 15:35:49 +0200
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Proposal for a v4l2_ctrl_new_std_compound() function
Message-ID: <d07dc56c-1b70-3147-1ee8-abf486a291a2@xs4all.nl>
Date:   Thu, 12 Sep 2019 15:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfASJFrGVJbXouoYyyrKT9gmfeIB2BqrQ6fgNlwMEhs4pnGu2uPV8HfHhwSe7XOJTO5FL2YvxQ8Ijhf3734dliuvTxBNEXAcZvQWLdOS13RCpliox2EQH
 IDY4GItHzNHdIlA5oaIcLKD58yN9O4lxBnt3JEAda8Mf07OeZTM50GGoaJpLAl/ascDdScrCdRY9M/liHUV7b0yZZslG3ml8j5cCvQivWLIpnbLvhJTnk1cq
 oLwT6Y3d6zwStkToHddUgXujd5UllS0xboUZ0/7kyxisjLGMDhHShLg95HwRA1WR/Qqu0Dvf85dMZxhVrf9Ed/xmt8FPrL2lLRTZLgkL9Cs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

As per our irc discussion, here is a proposal how I think it can be done.
The core problem is that for compound types we want to provide a default
value that can be used in std_init_compound() without having to provide
our own type ops. The new v4l2_ctrl_new_std_compound would pass a const
pointer to the struct with the default value, and std_init_compound
should use that if p_def != NULL.

I think this is beneficial for the various codec compound types as well.

Implementing this in v4l2-ctrls.c is left as an exercise for the reader
(i.e., you!).

Regards,

	Hans

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 570ff4b0205a..7fdbf3abe49b 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -254,6 +254,7 @@ struct v4l2_ctrl {
 		s32 val;
 	} cur;

+	const union v4l2_ctrl_ptr p_def;
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 };
@@ -667,6 +668,27 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 					 u32 id, u8 max, u8 def,
 					 const s64 *qmenu_int);

+/**
+ * v4l2_ctrl_new_std_compound() - Allocate and initialize a new standard V4L2
+ *	compound control.
+ *
+ * @hdl:	The control handler.
+ * @ops:	The control ops.
+ * @id:		The control ID.
+ * @min:	The control's minimum value.
+ * @max:	The control's maximum value.
+ * @step:	The control's step value
+ * @p_def:	The control's default value.
+ *
+ * If the &v4l2_ctrl struct could not be allocated, or the control
+ * ID is not known, then NULL is returned and @hdl->error is set to the
+ * appropriate error code (if it wasn't set already).
+ */
+struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
+					     const struct v4l2_ctrl_ops *ops,
+					     u32 id, s64 min, s64 max, u64 step,
+					     const union v4l2_ctrl_ptr p_def);
+
 /**
  * typedef v4l2_ctrl_filter - Typedef to define the filter function to be
  *	used when adding a control handler.
