Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 444A911F757
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 12:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfLOLHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 06:07:37 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:58547 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726083AbfLOLHh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 06:07:37 -0500
Received: from [IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de]
 ([IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de])
        by smtp-cloud7.xs4all.net with ESMTPA
        id gRkLiyNRAapzpgRkNipnL6; Sun, 15 Dec 2019 12:07:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576408055; bh=ecuB9vYcsEl0iQN/DW11FE9GmRwpWX1a5TNslzg3Yfo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gGJ7rsGupStaQ9cWFyCzvaoYuxOn7dmmORwUS7H7zOPfuavXkuESBPzxUBXO2Ypfo
         KNfKepbaPuKeCwgw7F+fr5+EP4g6d+1NX0E+NQHicLO+FMU3BFQn82J7MsXV3mqOcl
         DeTTsDWsOe/Kc1R7LWjVSwQyQyyx41cr/XLB0+h7Z4VbyncE5c1QyFQnf2kVwi+Fjw
         Xz7A8/6OkUPq6kH3jX45PmbKlK9M2W+ndQ4VdCv28VFjaDoYpM3JQL1YAKjp6M8R0y
         9qOy9OYbYY03b+g5KjB+EWLLW8MSXznXDQAu7qZbNl0KEl0up7qozLeEXLVzIE2vCQ
         HS8CSFV6bRuAw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Vandana BN <bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-ioctl.c: allow multiplanar for touch
Message-ID: <c5aa87f0-fa05-9f83-ef1f-1d57631b19c9@xs4all.nl>
Date:   Sun, 15 Dec 2019 12:07:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPXU//R4Ngkj69eimVYwwjWWpcL35Cc41FzFfsgg16idds6dtoJQ1XUFFyi+J+dX2KpHXpu/OSrr/VuHljCHxusSrsTtw9WAxn99Oe5Gf7pr9PmvEVGQ
 D2TkGyJ/fhOyUbMQYh534w91aoRxLtBiy/5IkUJCGR0tS27+5F8wTwrswGfaWk4e7u6ce9FtsI2am7ZoA7UB5Kkg9Zf97nZMqve2ewOcd1J/UeBYOyPa6zI1
 oZ0VR4ux0QJBKwNOZ18MwFc6XInzgXXmqPSDCdsAP8CE55FWvRucRlAyzwxacf862/99dZB3zzf1gM6G2h5iXA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no reason to prohibit multiplanar support for touch devices,
so just allow it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4e700583659b..282ffeef778f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -961,7 +961,7 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 			return 0;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (is_vid && is_rx && ops->vidioc_g_fmt_vid_cap_mplane)
+		if ((is_vid || is_tch) && is_rx && ops->vidioc_g_fmt_vid_cap_mplane)
 			return 0;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
