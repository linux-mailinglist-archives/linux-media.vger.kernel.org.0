Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29A73DAD77
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 22:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbhG2UXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 16:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhG2UXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 16:23:42 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD9FC061765;
        Thu, 29 Jul 2021 13:23:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g13so13225992lfj.12;
        Thu, 29 Jul 2021 13:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YTuTvlpDqL92MlB4o0KFyx2gXH0SdepRuFelwR/FXCM=;
        b=PxtUQEo2y9PlJ4zmnDrJ5Da//5W1yoLJKvrKhmuyp8lrBfij3iwmSUWjoKOymCVn0Q
         E7k0FQ7ybKGyvttxlJ7KA6Bit7YNB2niiFENtIMbgBkkQYQ6tl4/BoxUl79M1g6V8aJm
         UexZwLUbN77SAiTSZBRgZsiSig6L9OLBjFsf/AFVEqdX2BuZsu/Fvs+Q1sgHvFEJiSSS
         t7T3pZ1lnpvwt9bWsZanJ0i1PLkVUyAhwaaK9Br0bGBPDYiaDOOUubvGwMu32DDYurgx
         HddfZADDFihyhtjVcTZf9+aRKdzHnAVVXc+sylI6+5tqrB3InXDAtTrb6dv6cg0BSGBY
         xg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YTuTvlpDqL92MlB4o0KFyx2gXH0SdepRuFelwR/FXCM=;
        b=tQi37eUz8F6IO41Yv/eI3iyYNOeKD4bS5j3bvpgwEB2+DTysZUvnbmKi9TbkvAuIvn
         ptROmK8fSJDsLjDS3D4fWECuQE6I8IlCi+a2INneP0I70FdsIQxJghnj6CwC9+DaXXEG
         q3lZarzFD0bR6p+wfzm6p73R1pBBK8XIjgzEB8jyWUmEJV5XrTMWBZMZ50acLtBy1smC
         KlL7pYm3itrgm6pKS6TQO0JmIapzGO7mDKEyWLQ2cURzGhuML+2huB90ndTzpwQy67nX
         WkyxPF4jFF4OPYEJKt9Q+LETovbNddDQKXCHOOGUlMgqYAj/k8WnS3eWN9LEDEhagBfJ
         3FMw==
X-Gm-Message-State: AOAM531s8VPAdBhP5WZ6ntY0t0w9SUpvZ8Kr/jRJcbFSUa+tZcVlCr2L
        32mraL5vsdi1ekC/L9kkwVo=
X-Google-Smtp-Source: ABdhPJwbHZlW+gOatSY71Xf3bi6AfnVyuaz9JXjTfzy/H8LbOnLqGugau7z3T5FjNlAR1Y24GMgKJw==
X-Received: by 2002:ac2:4d86:: with SMTP id g6mr4967457lfe.549.1627590216606;
        Thu, 29 Jul 2021 13:23:36 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.213])
        by smtp.gmail.com with ESMTPSA id m23sm392004lfc.116.2021.07.29.13.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 13:23:36 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
Subject: [PATCH v3] media: em28xx: add missing em28xx_close_extension
Date:   Thu, 29 Jul 2021 23:23:33 +0300
Message-Id: <20210729202333.21605-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <aa8b3e18-7903-9380-d0d6-2303d09110fe@xs4all.nl>
References: <aa8b3e18-7903-9380-d0d6-2303d09110fe@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If em28xx dev has ->dev_next pointer, we need to delete ->dev_next list
node from em28xx_extension_devlist on disconnect to avoid UAF bugs and
corrupted list bugs, since driver frees this pointer on disconnect.

Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code to a proper place")
Reported-and-tested-by: syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v3:
	Changed order of em28xx_close_extension() and
	em28xx_release_resources() as Hans suggested

Changes in v2:
	Previous patch was completely broken. I've done some debugging
	again and found true root case of the reported bug.

---
 drivers/media/usb/em28xx/em28xx-cards.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index c1e0dccb7408..948e22e29b42 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -4139,8 +4139,11 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
 
 	em28xx_close_extension(dev);
 
-	if (dev->dev_next)
+	if (dev->dev_next) {
+		em28xx_close_extension(dev->dev_next);
 		em28xx_release_resources(dev->dev_next);
+	}
+
 	em28xx_release_resources(dev);
 
 	if (dev->dev_next) {
-- 
2.32.0

