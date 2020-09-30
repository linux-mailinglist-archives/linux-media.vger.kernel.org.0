Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA3527E139
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgI3GgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727657AbgI3GgG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:06 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2698920789;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=fGuA8x7aobLjgIXBAWpt4kbxMSb/E0CqUQQQ+agzl9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BbxeTH/lFXVak1ugJcx0ksy06TxK+M8fTxCEXfKBLVsa4YBzfkWEEImA8mfeKZGke
         MHRDAtINPldr8CHX4iRTRrMl2qmausSmcz3JA6h4sb+9w8DlZpJHOhI8NeUsX/SBCG
         VFMAVOm8Tmjo1fncXDEv/jStSGo+NIqr4sGdaeEI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVie-001Qmb-0p; Wed, 30 Sep 2020 08:36:04 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] media: v4l2-subdev.h: fix a kernel-doc markup
Date:   Wed, 30 Sep 2020 08:36:00 +0200
Message-Id: <c3de5a86c73169459754aa86186ba79446609693.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601447236.git.mchehab+huawei@kernel.org>
References: <cover.1601447236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by Sphinx:

	./Documentation/driver-api/media/v4l2-subdev:490: ./include/media/v4l2-subdev.h:384: WARNING: Unparseable C cross-reference: 'struct'
	Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
	  struct
	  ------^

The markup there is wrong:
	&struct &v4l2_input -> &struct v4l2_input

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/media/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 6f6795bab737..1de960bfcab9 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -381,7 +381,7 @@ struct v4l2_mbus_frame_desc {
  *	OUTPUT device. This is ignored by video capture devices.
  *
  * @g_input_status: get input status. Same as the status field in the
- *	&struct &v4l2_input
+ *	&struct v4l2_input
  *
  * @s_stream: used to notify the driver that a video stream will start or has
  *	stopped.
-- 
2.26.2

