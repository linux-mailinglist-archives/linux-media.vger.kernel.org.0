Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA611AEB7A
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDRJp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725869AbgDRJp7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:45:59 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A08EC061A0C;
        Sat, 18 Apr 2020 02:45:59 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y24so5463595wma.4;
        Sat, 18 Apr 2020 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0UEuFIPjoNbxDYPu32NzT8SOSNkovRtH6W5cOCdsS90=;
        b=YtK4TUya4m/vtt85dkcu1lvnVB2s3OsUYcP6cX+GWKsuw2jUIBkPqolREhwLQ4za2K
         rKioVN1zwUIT0dvmYhXY92Qcetc3U96S38I75jT0y9Re/ljjqMOev6er9P/uFwUsQ3t3
         w47PTc0tZhT4GLFZJfIIZU23OhR3fvEWogygDBvQfFCv5gVWbbE/3Z9fC+RfvB+elGXO
         MDpzX8ZP8vf3/cwpwdkbRL2FQ2AgQoHln3jm057pCkbqs+ojnOdwpnzk8EOKE9pwq+wb
         SeP4+5DjeUk4x4c7tpXQq9oxmK2uvQhXiQVWb69H2uDvUrlQiayq1Y7GW5jCNZrdwcqz
         AiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0UEuFIPjoNbxDYPu32NzT8SOSNkovRtH6W5cOCdsS90=;
        b=CcZZmI4bqrUXVt0tCJCUOa/yjR8Zm6IxM6BOzPkgePyGjKi7VFA7FwR29KucTUjRDk
         kiH2+n0U1qHqYfVXQCRjVeY7L9EX8hKcL7064ADgHJLboL4yowZspUbdUjGyyz7CE4Du
         HpFaU1jFRUCovPuZfl12L7ZfASMb/toM48kOWg/GH1ysyiqrYGM7Q+7e1YeAfjOF22lD
         dPJuy0GWP9a2gj0vCxeTKOR7tBfMruSykS2Sj50p6ei30gy561InXvmuceLrCVHdnz0W
         ScgOHskypWUAElxnsINuAOukJQBB4praaF85PqJ6ODTvUGLcdDwGrt1Y24Mya3f8pjxf
         52Pw==
X-Gm-Message-State: AGi0Pua8LJ7sHqYk3H0WWELn4I0kdw6ISbLMMpjr8lfKZrY3Zo1ji56d
        d6BD4E72sAvjgNtcVFKGh6I=
X-Google-Smtp-Source: APiQypIyMO+4/quEJujpMCvgvclxIYY0si540fnIpBwrnWIVcZg7e3h0SnEd7u0Z+EkdgrrFIVzQhw==
X-Received: by 2002:a05:600c:21d6:: with SMTP id x22mr7837208wmj.95.1587203157912;
        Sat, 18 Apr 2020 02:45:57 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d7a:4700:391d:588b:ee8c:e294])
        by smtp.gmail.com with ESMTPSA id z18sm28917997wrw.41.2020.04.18.02.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 02:45:57 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Joe Perches <joe@perches.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust entries to moving CEC USB drivers
Date:   Sat, 18 Apr 2020 11:45:46 +0200
Message-Id: <20200418094546.6742-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit a81068181aad ("media: move CEC USB drivers to a separate directory")
moved drivers/media/usb/{pulse8,rainshadow}-cec to
drivers/media/cec/usb/{rainshadow,pulse8}, but did not adjust the entries
in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: drivers/media/usb/pulse8-cec/*
  warning: no file matches F: drivers/media/usb/rainshadow-cec/*

Update the MAINTAINERS entries to the new file locations.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Hans, please ack.
Mauro, please pick this non-urgent minor clean-up patch on top of the
CEC USB driver moves.

applies cleanly on next-20200417

This is the 'minimal' patch to address the warning.

Alternatively, we could simply merge the two entries into one entry
CEC USB (RAINSHADOW/PULSE8) DRIVERS.


 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e965e5467a4d..3083282134de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13736,7 +13736,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/admin-guide/media/pulse8-cec.rst
-F:	drivers/media/usb/pulse8-cec/*
+F:	drivers/media/cec/usb/pulse8/
 
 PVRUSB2 VIDEO4LINUX DRIVER
 M:	Mike Isely <isely@pobox.com>
@@ -14152,7 +14152,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	drivers/media/usb/rainshadow-cec/*
+F:	drivers/media/cec/usb/rainshadow/
 
 RALINK MIPS ARCHITECTURE
 M:	John Crispin <john@phrozen.org>
-- 
2.17.1

