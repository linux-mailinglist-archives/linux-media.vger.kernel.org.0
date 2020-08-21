Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D743B24D55D
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 14:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgHUMsp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 08:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgHUMso (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 08:48:44 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC893C061385;
        Fri, 21 Aug 2020 05:48:43 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o13so971219pgf.0;
        Fri, 21 Aug 2020 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YAj+ZHFEhi6DkE5EadqxNJjUQhpwoFMrhs/00bSdKUM=;
        b=GN2/HyCMile6eX0I8wDeO11bNFyoKrKRkByJ5dBfneQo1rktDNPo4H8eMjfCGnC7FC
         euGiEDsn1TWo9kS2CPHT95v9cPTtzDUJs2AGfNBbY+FTfsXw/VCEZoi3vmmS2+HsZwB3
         7kLk6NRz2gRKvZfVlMv9Xe8B84c7G9Gg3PcRZmEs/k6gPxYEqenwBLdfPiQCooSO2HBb
         Vm0QsFlUlV8VjYMWbEDVlqLhL2z5I4ZzDa5sN0nczTmYQT31lfGDJ7hwvJmnT6MwSwG/
         AsmtLuhutRpWwm7J8cRMLdHxcvlKRu2S6VBsjgYCrqzPb7SQXPl0cpjDHyiitnZWSTWN
         YJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YAj+ZHFEhi6DkE5EadqxNJjUQhpwoFMrhs/00bSdKUM=;
        b=SUZJgvWB8FlmSvZJtnmA+3U0xacUpYDCpvBcL+BbRyS/fSj5O6IWRd9CxKSQBZP9iG
         vYbOYMG6l5GQrRZUUqym0k4s3MNQpln5+tvxk5TOvQEUJElUh+OnZbOzDqSDW6XHO5UL
         hX5ENQDeEm6JjvCgQoHsVWSfAOmPE8nT/kpq2TFFsvMOXyK0HMRvhIYTIDQQzbn2YK9b
         uOMmKSopOZ2gkwDAayhALP3Kjj8R1U/jjSvDg9EwvZoiMnpTKCQYK8xhEqpF7lnn9gAa
         bfEU/7HPlYMYA4UwYUjmaf2diIjXGOVH07VgKnZmv9I9YGEWWO/rM9T+616s0aLC5Xrn
         rxqQ==
X-Gm-Message-State: AOAM533ppX7eqGBUA8VSblJCAPZfSUVq6kPaOn6uDtnjUJoI3jbZBheh
        EH7/rvSGRHS+qC5xcH5yDA==
X-Google-Smtp-Source: ABdhPJycqqj97WmndmIB3OwSgFsbVw33CadUqAHlJRa6VhQFdVhwboO2MZyWw3P6qvzoqZWcTTMUtA==
X-Received: by 2002:a62:1c58:: with SMTP id c85mr2341720pfc.105.1598014122415;
        Fri, 21 Aug 2020 05:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:3c01::f03c:91ff:fe6e:64cd])
        by smtp.gmail.com with ESMTPSA id d13sm2598787pfq.118.2020.08.21.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 05:48:42 -0700 (PDT)
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Vandana BN <bnvandana@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] vivid: Fix global-out-of-bounds read in precalculate_color()
Date:   Fri, 21 Aug 2020 08:46:45 -0400
Message-Id: <20200821124645.495649-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810050532.640075-1-yepeilin.cs@gmail.com>
References: <20200810050532.640075-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vivid_meta_out_process() is setting `brightness`, `contrast`, `saturation`
and `hue` using tpg_s_*(). This is wrong, since tpg_s_*() do not provide
range checks. Using tpg_s_*() here also makes the control framework
out-of-sync with the actual values. Use v4l2_ctrl_s_ctrl() instead.

This issue has been reported by syzbot as an out-of-bounds read bug in
precalculate_color().

Fixes: 746facd39370 ("media: vivid: Add metadata output support")
Reported-and-tested-by: syzbot+02d9172bf4c43104cd70@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=02d9172bf4c43104cd70
Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
I'm not very sure how to name this patch since we are fixing a bug in
v4l2-tpg by modifying vivid.

Change in v2:
    - Solve the root of the problem instead of adding more boundary checks
      in precalculate_color(). (Suggested by Hans Verkuil
      <hverkuil@xs4all.nl>)

 drivers/media/test-drivers/vivid/vivid-meta-out.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
index ff8a039aba72..95835b52b58f 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
@@ -164,10 +164,11 @@ void vivid_meta_out_process(struct vivid_dev *dev,
 {
 	struct vivid_meta_out_buf *meta = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
 
-	tpg_s_brightness(&dev->tpg, meta->brightness);
-	tpg_s_contrast(&dev->tpg, meta->contrast);
-	tpg_s_saturation(&dev->tpg, meta->saturation);
-	tpg_s_hue(&dev->tpg, meta->hue);
+	v4l2_ctrl_s_ctrl(dev->brightness, meta->brightness);
+	v4l2_ctrl_s_ctrl(dev->contrast, meta->contrast);
+	v4l2_ctrl_s_ctrl(dev->saturation, meta->saturation);
+	v4l2_ctrl_s_ctrl(dev->hue, meta->hue);
+
 	dprintk(dev, 2, " %s brightness %u contrast %u saturation %u hue %d\n",
 		__func__, meta->brightness, meta->contrast,
 		meta->saturation, meta->hue);
-- 
2.25.1

