Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44B311F70C
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 10:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfLOJqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 04:46:10 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:46271 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726061AbfLOJqK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 04:46:10 -0500
Received: from [IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de]
 ([IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de])
        by smtp-cloud9.xs4all.net with ESMTPA
        id gQTWitSbnGyJwgQTYi4guA; Sun, 15 Dec 2019 10:46:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576403168; bh=pP8ujBoOOQssMhdAiujchoLHN7eoHZSsNlo41bIA61M=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TXYPEn1AxHWrtOChyT06AkbguN/biPw+cMfoLcUHO3att2kaxheHToWa3e5fG4J7Y
         mgQaLi+1NmE0sJp5jxct+a4qHKcOViS3irlkdVLQ7lV9hOUpc2awQ8fDorSyXJVUN1
         n33xeIv6d1ZPDp68Sm422w6I1MatzBty5pv6wgfXp2gll/LuyC0Er4/v+ZIWM/60Hg
         GH8Mk5Hg2b4GPQFJg2XV7OOtj/3dcy2GL7VoMEdUk9Oa0ACtNWWVdT2iMQU7BBpSrQ
         penebJm5/KsSHns38qEbhyRlG4s2TJiAVTcdgHK/ilF+O9Xzu/HwvHzv2y0MLe3hyb
         Rn5MIN7ootr3A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Vandana BN <bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vivid: set field to NONE for touch
Message-ID: <30b7f868-ed57-b940-d8c0-553e47a9c436@xs4all.nl>
Date:   Sun, 15 Dec 2019 10:46:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOdmJobvrj4fP84uk8n+g/s+O72Ur1QCw+LuiQDVDojvCknm16bHZX1TGlwiB4IS+c+UbXZ0oSbsBApq+9XTMqFAqV6w+0LffMrahnjt55zk9ekFg0Jm
 WbmqhoceSCln37zJ5FnaiwCHU0SSfUWL5qCuc3UNRD6ctYr0DAo3Hxu1ZavCHL3xjQU35XQoA6YB10P0sr4e24UXk1jwhOXj29Kmvz9Toir4epD19em11pFa
 rLrjc6gAmbAHpgcpGcHSDVha6BIIS90dwcjd6OAdWRg6OV57WZoiHLX+92T16QesotiiHnEIOGnjfkjE81ziVA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_buffer's 'field' value was never initialized in vivid for the
touch capture device, causing v4l2-compliance errors.

Set it to NONE.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/vivid/vivid-touch-cap.c b/drivers/media/platform/vivid/vivid-touch-cap.c
index fbd7bc2bde07..070df227e29b 100644
--- a/drivers/media/platform/vivid/vivid-touch-cap.c
+++ b/drivers/media/platform/vivid/vivid-touch-cap.c
@@ -59,6 +59,7 @@ static void touch_cap_buf_queue(struct vb2_buffer *vb)
 	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
 	struct vivid_buffer *buf = container_of(vbuf, struct vivid_buffer, vb);

+	vbuf->field = V4L2_FIELD_NONE;
 	spin_lock(&dev->slock);
 	list_add_tail(&buf->list, &dev->touch_cap_active);
 	spin_unlock(&dev->slock);
