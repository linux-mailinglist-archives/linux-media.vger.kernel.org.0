Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA74E3D0E
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 22:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbfJXURB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 16:17:01 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:47021 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfJXURB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 16:17:01 -0400
Received: by mail-oi1-f193.google.com with SMTP id k25so21741192oiw.13;
        Thu, 24 Oct 2019 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NoDa2hDhS4AMPTGgcpEaE/wDOgHtq9oF44sew+cusWM=;
        b=TknIaVe1DwXQf304trnDKU8fu+4npe0Dv2lbNNU+6ivN6habXLaemRKGjVVphPrCvB
         vZrxLM/T7hlRUeve3Gxxzq0d1GYe+SFtFG+ZIklbomY4Yq31J/8yaX9nWzRJCTjWqe8r
         7Aoyb7ieYejjpnQBPg/zP6d0tJtp3B3+9wCpHFD7J6FgqDlp1z3rplu5FVoysmTrcn30
         XKIgrbv/JGvQk2SYeQvoqcpbJxq+fRwzrKH2ou6CP9OopYzX5DCwSui3gbdieVx30Gls
         xIHv3dJpcWKjD+7Xyj6lkzGtKOgJJDh2ZOWzoL9EC/JwRAFZasM/WWS/uhFtXPhNs16g
         pA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NoDa2hDhS4AMPTGgcpEaE/wDOgHtq9oF44sew+cusWM=;
        b=GyqUgOdwN2sR3C8hdKP+1VsqhD0HvlLrwPIL0wCosx1IEck3HRMQqp7tcRjs5aTZbw
         /MkHtH3q9S6Ibv9HrDLWxcfSUA3/w3ecF0P9XCyOYoeM6i91ww+rUJtVd1qt65b0qWB/
         2zW+/Jzepow/ljQ0xSnqWqX41LybOXP6MAgAQSjo2JW4sOW3pLCLIw6dtkpyjnWCIZK0
         HmukVbeoI3YfhNwIGmWFw+ZqTeN0thDNWpRSzrbUze/iv1CdpugrmmLPJkdYQP75Vxfm
         Vf6QIx1sRmsscQwzaZxnYGEJB4pDwLk6AS8minlQuAEdPdTmY2eRvjaZ1FwCg7FIzK6e
         /7bQ==
X-Gm-Message-State: APjAAAWQpPEsCGKEeJt9oYutEeZ0ievcZcsN7UOi1oTz6D/Gg6Rfb+cR
        T320Y8dtVzbaYcEVbZ89qTCvrpoQ
X-Google-Smtp-Source: APXvYqxzB+wVw/ariPdKi1TZg9s+xZYhCUYj4CVs9iE1EKS+ulfnanJF1JSuBueX/tM60NE5yl1gfA==
X-Received: by 2002:aca:4584:: with SMTP id s126mr6348066oia.21.1571948218335;
        Thu, 24 Oct 2019 13:16:58 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id z5sm7323655oto.77.2019.10.24.13.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 13:16:57 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] media: v4l2-device.h: Explicitly compare grpmask to zero in v4l2_device_mask_call_all
Date:   Thu, 24 Oct 2019 13:12:41 -0700
Message-Id: <20191024201240.49063-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When building with Clang + -Wtautological-constant-compare, several of
the ivtv drivers warn along the lines of:

 drivers/media/pci/cx18/cx18-driver.c:1005:21: warning: converting the
 result of '<<' to a boolean always evaluates to true
 [-Wtautological-constant-compare]
                         cx18_call_hw(cx, CX18_HW_GPIO_RESET_CTRL,
                                         ^
 drivers/media/pci/cx18/cx18-cards.h:18:37: note: expanded from macro
 'CX18_HW_GPIO_RESET_CTRL'
 #define CX18_HW_GPIO_RESET_CTRL         (1 << 6)
                                           ^
 1 warning generated.

This is because the shift operation is implicitly converted to a boolean
in v4l2_device_mask_call_all before being negated. This can be solved by
just comparing the mask result to 0 explicity so that there is no
boolean conversion.

Link: https://github.com/ClangBuiltLinux/linux/issues/752
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

I am aware that there is suddenly a style mismatch (some macros using
!(grpmask) and this one using (grpmask) == 0) but I chose to display the
minimal fix. If you want me to update all the macros to use this style,
I'd be happy to in a followup patch.

There are 19 of these warnings in the drivers/media/pci folder, which
can be seen here:

https://github.com/ClangBuiltLinux/linux/issues/488#issuecomment-545218125

This is the simplest fix but if you all prefer an alternative one, I
would be happy to see/review/test it. The ultimate goal is to get
-Wtautological-compare enabled because there are several subwarnings
that would be helpful to have and right now they are all disabled:

https://github.com/ClangBuiltLinux/linux/issues/488

 include/media/v4l2-device.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index e0b8f2602670..8564b3227887 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -431,8 +431,8 @@ static inline bool v4l2_device_supports_requests(struct v4l2_device *v4l2_dev)
 		struct v4l2_subdev *__sd;				\
 									\
 		__v4l2_device_call_subdevs_p(v4l2_dev, __sd,		\
-			!(grpmsk) || (__sd->grp_id & (grpmsk)), o, f ,	\
-			##args);					\
+			(grpmsk) == 0 || (__sd->grp_id & (grpmsk)), o,	\
+			f , ##args);					\
 	} while (0)
 
 /**
-- 
2.24.0.rc1

