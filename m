Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF82410062
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 22:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240600AbhIQUso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 16:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhIQUsn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 16:48:43 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D20DC061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 13:47:20 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso7643241ota.8
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQf9L3//XnW9O9ontzu6BRk4OWW06kVzWb9hiQ/48sw=;
        b=IjALyIwlorwiVJsUOh4MNWfO2g2ftvWMcMFMIpK5ABp/u5uPv1PGKGn8ODs2WbJPEk
         fJrL35VRjkVr0OrPU5bsob2VAWJnM6Kb3q64Gbx5m0BzlZGqaycT7HLWuKWWNeBMPXh0
         mFBh2X2999Hd37IpFxXbooXKt13+KewqkwCQhT46atcqpdhlYcwWv/akniF1n6a5Bpcv
         ozutfPJMmQwlQKP+T3FGuAK+lNioVnKPHp28q36rl8DJJ8VZhEPUmFWNm5i/vfUNycq4
         r0fSsiXZKBK0BwxXpqjCfxGp1uUCjsI9PicKwmDsxokKHddHYOjnrvOUGukXD68ASAsS
         cSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQf9L3//XnW9O9ontzu6BRk4OWW06kVzWb9hiQ/48sw=;
        b=qQ1b/9XMAhDP1fm4QUsOWI7ZFrNVLCDzkcnnBGCG5NZ14EIgCN99GE6eNSonWjzuQb
         xSKa09MfGVCIVeaaZQh7sD6sV3Obs4zTWN/eQPMEyjDo0sw7CyYSWDkHc5u+bYY/nwa8
         PvW5chnIkWF3zBKIyfBGTT4PnQIGMkOEbcAjERs0EB5YUfVd2p5aobgc0rlZ3tNyQbAD
         7bqAc1yB+yVGyJiJcsk7yH4ite7IYS6B11hpU0h+tN718c/uoE+KssEJ/d6wbauO10re
         tojD++AEwKS7wOUGwNpOkSJ/vyAsPKQr/A8FFYISvYp78atVhl5VN/7ygIlSJfi87ZuP
         rNbg==
X-Gm-Message-State: AOAM531A/UIDK5T0Q0Fsz8dJHSbtvv2Y6sTf5oZeDm48Z28V5YCRUEOZ
        9TCTmvI8ssWAVppQrrViKvWzdepB69t2
X-Google-Smtp-Source: ABdhPJxqqr7RDfwWeH3go0z9W0PxNZ3ojaXyslvlWSnIzDJaf16dKUNA9MKbYRyWHl9MQeI4OaHrDg==
X-Received: by 2002:a05:6830:20c2:: with SMTP id z2mr11406035otq.285.1631911639747;
        Fri, 17 Sep 2021 13:47:19 -0700 (PDT)
Received: from localhost.localdomain ([181.197.204.212])
        by smtp.gmail.com with ESMTPSA id x8sm1730026ooq.41.2021.09.17.13.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 13:47:19 -0700 (PDT)
From:   Jorge Maidana <jorgem.seq@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, Jorge Maidana <jorgem.seq@gmail.com>
Subject: [PATCH] qv4l2: enable the play action on non-streaming radio rx
Date:   Fri, 17 Sep 2021 17:47:15 -0300
Message-Id: <20210917204715.3663-1-jorgem.seq@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The commit 37f42eb35d87 ("qv4l2: reorganize colorspace handling")
disabled the play action on non-streaming devices.

This patch enables the play action 'm_capStartAct' on non-streaming
radio rx (audio-only) devices, assuming that 'isCapture' should exclude
radio tx. In addition, it also disables the step-frame action
'm_capStepAct' on radio devices.

Signed-off-by: Jorge Maidana <jorgem.seq@gmail.com>
---
 utils/qv4l2/qv4l2.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/qv4l2/qv4l2.cpp b/utils/qv4l2/qv4l2.cpp
index b57178e4..d9141ad1 100644
--- a/utils/qv4l2/qv4l2.cpp
+++ b/utils/qv4l2/qv4l2.cpp
@@ -456,9 +456,9 @@ void ApplicationWindow::setDevice(const QString &device, bool rawOpen)
 	else
 		m_convertData = v4lconvert_create(g_fd());
 	bool canStream = has_rw() || has_streaming();
-	bool isCapture = v4l_type_is_capture(g_type());
-	m_capStartAct->setEnabled(canStream);
-	m_capStepAct->setEnabled(canStream && isCapture);
+	bool isCapture = v4l_type_is_capture(g_type()) && !has_radio_tx();
+	m_capStartAct->setEnabled(canStream || isCapture);
+	m_capStepAct->setEnabled(canStream && isCapture && !has_radio_rx());
 	m_saveRawAct->setEnabled(canStream && has_vid_cap());
 	m_snapshotAct->setEnabled(canStream && has_vid_cap());
 	m_capMenu->setEnabled(canStream && isCapture && !has_radio_rx());
-- 
2.30.2

