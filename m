Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79458C98C9
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 09:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbfJCHF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 03:05:27 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33413 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfJCHF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 03:05:27 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so1144039pfl.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Ze6yy0sluI0UEmG5g9IS9lQSBmlz/fX32FncZJu1IaI=;
        b=M/NCrlA8kxT5YISgvZAD7ujtgteHHzDI/LUpEgDFL5o+Ywka+bjI3p/69QL/ApjhOt
         LwKDMrbynjbdNZ/5FbPc8hfAEbXYov+7ygjfFFycseH6Kd6SifwqBg1spzxzbqTBwYl8
         G5ooiCOrZivvobW2LHm1ahZqp6yeJ1HE0NouhjkdEUT1EHBqvuIRFjwUtL2Kf4g3LRDx
         Mdjoe6dgy6JQ0BAQPXuEh9jjpTgs5ac5oZ7j9cx0UeVU08tcd3Km/nE68L/+NS5ODL8c
         f65uv9+oebQJM5qJMEHO4qN/KfT4CNv1ECH3AHw7RtQm8lsUgADC+VBVj/8UOQqWcQDV
         pXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ze6yy0sluI0UEmG5g9IS9lQSBmlz/fX32FncZJu1IaI=;
        b=fU6Z1GEm11ySKyq6BW1P5ntgMQu2ceCPIQbPLDZkSkYgQL+by2fDSCUOO88harNP7W
         8UNuDPbkOLMz7M0+3yVTcxVBlVQq+Kaz2uLSgLDB6oNTIbW7ho7sEbgNJV/llTx80Ftj
         uVgM4HijjlWQGool1ayDnr5gue/GgfXyK9DGyIrdTmJIQhqrN5TlTKr21Nz6rNjBZMwi
         chOktaUJOTQaAOvaDAvKfTKAkMDOKnsI2gttKCs8XFnXtMC+doxVW0yI96zn8VVE3edC
         7nDsnFklJxQHJpvm6QPoto/rO8TZbEHstaABIuGhgH6MpVmVpD8OqTa+sQpo/feEO8lE
         rULw==
X-Gm-Message-State: APjAAAWs2BiUEj8ZH7ROBcEVrlup8ybKN51iwgIxgLykQTiKKHTEWUQJ
        Wd8qjVVEAfBKz6VnisssbK4xmv0W
X-Google-Smtp-Source: APXvYqxA5diorDaS/DlG4XEdTnqv7MVw4Ra0H3ZCvdNEs/EqLmsOBGW+NrB0b9OZQCwgWMyWB8zLpA==
X-Received: by 2002:a63:6f46:: with SMTP id k67mr8153199pgc.444.1570086324749;
        Thu, 03 Oct 2019 00:05:24 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.207.214])
        by smtp.gmail.com with ESMTPSA id c1sm2201096pfb.135.2019.10.03.00.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 00:05:24 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] v4l2-compliance: fix metadata output support
Date:   Thu,  3 Oct 2019 12:35:13 +0530
Message-Id: <20191003070513.21762-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes test failure in the v4l2-compliance
for metadata output support.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index b9860f1e..a2378d8e 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -960,7 +960,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 			 V4L2_CAP_META_CAPTURE))
 		node.has_inputs = true;
 	if (node.g_caps() & (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VBI_OUTPUT |
-			 V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_SLICED_VBI_OUTPUT))
+			 V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_SLICED_VBI_OUTPUT |
+			 V4L2_CAP_META_OUTPUT))
 		node.has_outputs = true;
 	if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
 			 V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_VIDEO_M2M_MPLANE |
-- 
2.17.1

