Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEC62FCE5E
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733277AbhATKi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:38:59 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:49687 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731639AbhATJnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:43:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A18l8jE1; Wed, 20 Jan 2021 10:43:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135790; bh=JZzkiPmVAaBmQuP/1MtsV6/a+PnMIh7Hh1MIHYnWOrk=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=jiOL0K7siGBgE14+bwao2bL4Ltgr3sivd+Kei6XmUVouyo28M8QkMwdcvAihjCIon
         mo4IMW9Z4ZIjVlqVkpzlgsjiUPR7p0Crzmrp0X++AtGhaitN7CchznVk5sir2oEQV7
         bM90AsxWGa0VdWQ4DErlKwJQmsJNHjIdTj32zoRdpmd8Km3i+8FtkfusKlsrlkSCud
         ODXDJ8djZoIJwOHkR39UuE5GxMugePc7gcUVycq0ANBLlozza+DhsFKGSlX75ztaSw
         9R27IXLc2xDa7EHIp/xMkNJ6k4eGaRIqwPouk0LCRWHPB5BaWbjFEsRpftv19SqUc6
         3g0RpsMClXZSA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        syzbot+42d8c7c3d3e594b34346@syzkaller.appspotmail.com
Subject: [PATCH 02/14] v4l2-ctrls.c: fix shift-out-of-bounds in std_validate
Date:   Wed, 20 Jan 2021 10:42:54 +0100
Message-Id: <20210120094306.784318-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGCYqhuwV3+Yk1rv2QJDZScmo32gHmrOGHUW680tMvz8mG7tCBVf9OnohmtN4nL1GUNY/zfLKBZtYzV8Xbr2NOg5rrxGzfqKLgJgrvnqWJC4O9RuLB9k
 4+VfNDbmV2VhmkuyyJOenL24yx7QFERp9o2SQ72ibKL0wbJ7Hf8SEVIm0JL+mHbYV7hUgZNj6H36R7elzTCc5UMO46UrRVuc1Fq0Arh/79aSp4oBJ79kDWjk
 32sBleXhNHyUT+nYtbDuI0FKCA/YsGqezDlArjJfBIo+M3+KWoarFf4bhXy5OYcD/ApKwPBU3V7b4F22rCuJxw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a menu has more than 64 items, then don't check menu_skip_mask
for items 65 and up.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: syzbot+42d8c7c3d3e594b34346@syzkaller.appspotmail.com
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index f7b310240af2..016cf6204cbb 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -2181,7 +2181,8 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_INTEGER_MENU:
 		if (ptr.p_s32[idx] < ctrl->minimum || ptr.p_s32[idx] > ctrl->maximum)
 			return -ERANGE;
-		if (ctrl->menu_skip_mask & (1ULL << ptr.p_s32[idx]))
+		if (ptr.p_s32[idx] < BITS_PER_LONG_LONG &&
+		    (ctrl->menu_skip_mask & BIT_ULL(ptr.p_s32[idx])))
 			return -EINVAL;
 		if (ctrl->type == V4L2_CTRL_TYPE_MENU &&
 		    ctrl->qmenu[ptr.p_s32[idx]][0] == '\0')
-- 
2.29.2

