Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC4323E908
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgHGIg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgHGIgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:25 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBF9C061574;
        Fri,  7 Aug 2020 01:36:25 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id c12so720642qtn.9;
        Fri, 07 Aug 2020 01:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pCOUWfwQGCxx4xFgjgJzdmxB0Ku9U+xacNCA0bE4G4U=;
        b=udMu3s8Ircb0KhEzwcbUl+bWG0t6TlZ4yD7XGtGLAx06W9xJG+ChSHoS8QExNhTzw+
         xJ4cU2B2s1vrXlEqBa0CUM2m6ovQcMMDFkplruuc7N+quTmuvdopwoQLq2a1Akrs693J
         /sfMpTSp4+TNK/b9IH59SHlRUE7tIdTKZB0FEGlIduU0pBOfierHlhK79k43s630fF5W
         vizvvLIO0mndB1OwRDG0YMrj2BsWurDE8l+Dp3P/KFx7jZnIJ25RFDnUhyRWid5y759k
         986bjo7xZZp/uOHCoAlM/hlhqeqMaRSN2fzjlQf664Dnk3bTyj4kJmuMftVQW3Xzl8EC
         OcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pCOUWfwQGCxx4xFgjgJzdmxB0Ku9U+xacNCA0bE4G4U=;
        b=bmwHRkmA7GVEW4A85ffhzPr+FNKWXqXqe0DE+HZIiTtjQic6nUPnzuVBpv/ch18vem
         ftdkFvq7bkUtao2kf8k3Ohhyxiu3gzmWulszcHGCBilc5YBFfiWdpuq2+rKPvFvYRFUK
         +yQM3mqW++hhSvNKE9vlb9mYoIJc7PosSqonX3yvavBxfE3Pkg/I0GjCQsYvAhuKoemx
         FGO72YCN54jX5n7xVNGR+Oz/4bKsP3PSxsb0TNps/oxDYuiNTacxwn7sYx3jNw46Qm05
         pCbgYUdBSjj7lPupQ71bObhhd3BN+AI0eQy5Pl20ADcZRu+YnpyM39NKRFMNFdCcyLOV
         uDaA==
X-Gm-Message-State: AOAM5322xVGUSG5PcIqZ/QqyyJ2YUd1BWFL3a4yXkQruG76hWaNuPjHP
        umkkY0ou5dGjKyJObrqt9C8=
X-Google-Smtp-Source: ABdhPJwdaoeBIf850FLeS5VojFgiOIwoQ2jg8MtkRmkfskN8YOCIayKqkj0kohLNVbJbVEly7fORdA==
X-Received: by 2002:aed:2091:: with SMTP id 17mr12775857qtb.322.1596789384704;
        Fri, 07 Aug 2020 01:36:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:24 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/20] media: cobalt: cobalt-omnitek.c: fix comparison to bool
Date:   Fri,  7 Aug 2020 05:35:32 -0300
Message-Id: <20200807083548.204360-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle report:

drivers/media/pci/cobalt/cobalt-omnitek.c:119:5-19:
WARNING: Comparison to bool

By using "!cond" instead of "cond == false"

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/pci/cobalt/cobalt-omnitek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-omnitek.c b/drivers/media/pci/cobalt/cobalt-omnitek.c
index 4c137453e679..01b82a2e8d33 100644
--- a/drivers/media/pci/cobalt/cobalt-omnitek.c
+++ b/drivers/media/pci/cobalt/cobalt-omnitek.c
@@ -116,7 +116,7 @@ void omni_sg_dma_abort_channel(struct cobalt_stream *s)
 {
 	struct cobalt *cobalt = s->cobalt;
 
-	if (is_dma_done(s) == false)
+	if (!is_dma_done(s))
 		iowrite32(ABORT, CS_REG(s->dma_channel));
 }
 
-- 
2.28.0

