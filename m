Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75B1D83C6
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 00:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732572AbfJOWev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 18:34:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55789 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732040AbfJOWev (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 18:34:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so695003wma.5
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BR/+JcLXGlF7qNlnYNXPVWo3Nql+mobYo3ybFiUKVk4=;
        b=XE5sn3iXKdNmwXYBgSR/Fm7Fn+i5kb49u8oZLnlZNLAqvDO/yQY3vXi0OryQZUyTyz
         1Rqv3gw8NiClH2JJsSE6iIGkl/rPMP9B5ndr7PlbXe8b4bwU8b1Lw9LLhUSqPuL1ATdP
         m0iWdn8fkmAC9HeT8IZWVRJ49WmpPdU44Rb5zGopErJYhidVQlOaOctQ+Fgp9D+kDgHj
         h0zXwqMNPIbo0tzROn/kplccKVmXownn0VSmLlqB3zlxfB/txeQ0L+MOgjN2C6khacyw
         YVtmSb86Uh/LpT6tqbeIkHhVzDHH1hjbX5uTnFE9/0A6QibobxjJqtQd9LSGnkSk954Y
         pRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BR/+JcLXGlF7qNlnYNXPVWo3Nql+mobYo3ybFiUKVk4=;
        b=fojLnCDE9lqhz1mDVaFn+iNBW5ORUfFtPgmKbVoboToHvkJB8zL1swEVlFqyLUI5tn
         PGbKGEYvGKP9Cg4yT8tkNfG0x8GW+h/3aGWdP4t6ag0wKGbcHNk7m1s5ed1YAI4/OcBj
         LrlBxDaWSKo3PTdcsl0ZIYLuKaCMu3Der0hSM/6W0WcG8fRL0EuzXiY/js+vmrjpOMLk
         TQYVcox9p9xem7CHhdFak+oZPAsMb/oSxLzZGQKxG1vyQ0+FZjCaazq9mKGilmcuEz6p
         Av1fu1vszNTDkxyATE8j1/klD6HnAA3I53vEh9ldywkxgZ5WTtk7s8KKcZ84OYYkz9Vn
         TZMQ==
X-Gm-Message-State: APjAAAVDHi9RxqY6JJl0BknZnHaKeylPWiNbcoJXnk4JjSb7V+/Ee7oJ
        ZdoDf7pSl3tKKOpj6p22fg==
X-Google-Smtp-Source: APXvYqzqUGoPSLX+7JYm9yA0K6F9C1MPGaKFQPDRoDB+p/yP/3sBWaNiiSzVRo6x6Tx4Npz6Ljp4fQ==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr543117wmc.33.1571178887899;
        Tue, 15 Oct 2019 15:34:47 -0700 (PDT)
Received: from ninjahub.lan (host-2-102-13-201.as13285.net. [2.102.13.201])
        by smtp.googlemail.com with ESMTPSA id m18sm35667084wrg.97.2019.10.15.15.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 15:34:47 -0700 (PDT)
From:   Jules Irenge <jbi.octave@gmail.com>
To:     outreachy-kernel@googlegroups.com
Cc:     mjourdan@baylibre.com, gregkh@linuxfoundation.org,
        mchehab@kernel.org, khilman@baylibre.com,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devel@driverdev.osuosl.org, Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH] staging: meson: add space to fix check warning
Date:   Tue, 15 Oct 2019 23:34:33 +0100
Message-Id: <20191015223433.18784-1-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix "alignment should mactch open parenthesis" check.
Issue detected by checkpatch tool

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 48869cc3d973..21e93a13356c 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -81,7 +81,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 	}
 
 	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
-					(u32[]){ 8, 0 });
+				  (u32[]){ 8, 0 });
 	if (ret)
 		goto free_workspace;
 
-- 
2.21.0

