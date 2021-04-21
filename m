Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7B2366627
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235083AbhDUHVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232194AbhDUHVK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:21:10 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD7AC06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:38 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id h20so21131296plr.4
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kAAOsS/FtGPnyLMlTHYD0eKa7nIeeaFOaw4EILg7ps=;
        b=Mj5fbrbEX4bmxQzxcGbCZV3s5oCVNGkLH1z6XdemvV8RKjdyQAP+3ZoqELNXz9wyih
         pGPc4LLjgrNIdXNQZSbfBosI4khGQ0AGhT5HlxjdbpB9Qfnh/0SL6TW1zPDd7tU6QD9p
         2FRumCwQEEoIrqdfQL7dZKQPshNttYgbKKWkuMdwyUbk2rFKbCeq1pIRFDeAmwwIVrqu
         /6Vqn9pe4MpYjLx/JupaHCHseBRShp//apHpy/P+7BJxZbs/KfS9/TqR25NrDk0CfIHD
         pC46fewHYVJ9/bJ8lbvxcaLkCgQXsuPxKnHMTd8cyRYVGDTE7Tqo78DEa/oDdDCrXHZE
         mk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kAAOsS/FtGPnyLMlTHYD0eKa7nIeeaFOaw4EILg7ps=;
        b=FbUJ5a2YLQyc41Luw52I1MQSBuy/ydvnYkimRcqqv96npqxEqnobY7Of151QP3KDRQ
         WMVGVGVJetUzIVJYl/ibwFsnpDPJkQ5Nx5H1sxyY+fZKWLSg9TCSAL8fZq3NE1C1iQ8p
         CuJDdlOKt2vIa51zPyfrNS8h3TsjqLOkjxKEOIQg0cTMueT/H8hd/hNznBQpHPgsYFWz
         662/FbKAoCi77PKGha4lB80tzcKnY8XLmRratle6mafEtfP9hHqGZ/3uzF51g/Fp/o0g
         Ev25aN0iJu5JJ/FmNY/GEnHOh3LavygMDq9SmgjTo6jGvhMkeX4UhDq5OtonlyP1Cc5P
         PYdQ==
X-Gm-Message-State: AOAM533TU0aityoRymto2I+waygXcW2lMoRAPn7LDtjOOA59bnua/R9p
        6Ykwdk1FhsImG7VTAtAaJE0Bbd+SZL2vzQ==
X-Google-Smtp-Source: ABdhPJxYyWuvaZ6b6uOKXdGNbJNWKz7b6HB5PtrPkV0nX8CxtDicDqB45bvtUJV1shPIWIsN80mCYA==
X-Received: by 2002:a17:902:b08a:b029:ec:af20:5602 with SMTP id p10-20020a170902b08ab02900ecaf205602mr11468570plr.71.1618989637267;
        Wed, 21 Apr 2021 00:20:37 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id p10sm907815pfo.210.2021.04.21.00.20.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:20:36 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/8] clang-tidy: use auto
Date:   Wed, 21 Apr 2021 00:20:28 -0700
Message-Id: <20210421072035.4188497-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with modernize-use-auto

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-ctl/cec-ctl.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 107dcfab2..c17265a5c 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -1833,7 +1833,7 @@ static __u16 parse_phys_addr_from_edid(const char *edid_path)
 
 static void *thread_edid_poll(void *arg)
 {
-	struct node *node = static_cast<struct node *>(arg);
+	auto node = static_cast<struct node *>(arg);
 	__u16 phys_addr;
 	bool has_edid;
 	char dummy;
-- 
2.30.2

