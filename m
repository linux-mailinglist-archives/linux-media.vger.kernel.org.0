Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00621163D2
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2019 22:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfLHVNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Dec 2019 16:13:47 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37571 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfLHVNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Dec 2019 16:13:47 -0500
Received: by mail-ot1-f66.google.com with SMTP id k14so10495072otn.4;
        Sun, 08 Dec 2019 13:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0kwV+KswtHN7mYaC55RJRRsqfRs6Nx3Ld51+tu4vFoQ=;
        b=HQjxQZbnHf+jlQhInZKQ+e1iABi36NuPsOr4suD1ytiVAWqgvu/W7LRx1NgoepTw8j
         Z1rv9heWIOYCPxULSnCSR0DgvItmztDLABRtRbxqphZGpgeVeqEE+eaxJWWnWz2ERR95
         cGDbPyfH+RJVuATL4CMm/9Uv6GGVyQxO2bfvHgzNqd93GxKlEZX43LSPhVApi5o9X9jT
         im2oanflYmwpnIT5ORHJmHEi7BzHxi78oXaju1LFQRwXdkvqucP/ndJ6YOoCTyqvaHO1
         HJ//4A6Hw6+3ECp8DgneeZnyoUOPb5NQs54Yyx8e3qBg3/oPz/WFrsQa2J8n0coJN2Qt
         5yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0kwV+KswtHN7mYaC55RJRRsqfRs6Nx3Ld51+tu4vFoQ=;
        b=pITilW3+eXRBnoma9oo96+9W9VVKI/cTBJGYGv0eXRNYBo/tquXilX6QvRYoIttUS2
         CX8f1PsGgFaD5LvfYRYH4V4Jr5Pr5ufPEDOb64Qg9OYG62r9vvkit/HPHt/2s0oqsQJa
         XweAHGGYsem/7q4BmoS6xWZ2fXVNAjTijSq8jgND85N7T4I5JgZvQkHbmKCem4BiNgKl
         HRpcRcYHWgbhgMzdsN+rm+O/rdXGshw961JfG6Fw7qASTikBFgMr/0N66wKuD/sXcmP+
         CBoRxl0Sr3T/bYyYZOauo1upExL2M8qSRKt5jXDBuxUl1hLj1Ytzu4PSOycuy5nA2qfg
         fyzA==
X-Gm-Message-State: APjAAAUlyhJzzdIgQq/33jRP9Xti19j1s/P6Si+wOw6k0fQlzSApf5OL
        Gd/AcROqpVpsXe+0fo28Z8c=
X-Google-Smtp-Source: APXvYqy7bZUrmTKtzvftWC/PbGIijpAIJL/5cklq+ZEYSotaEgnaQ+SE80XCvspKE8h+QUbEWABNJQ==
X-Received: by 2002:a9d:5552:: with SMTP id h18mr18315822oti.122.1575839626207;
        Sun, 08 Dec 2019 13:13:46 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id e65sm6099639otb.62.2019.12.08.13.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 13:13:45 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v3] media: v4l2-device.h: Explicitly compare grp{id,mask} to zero in v4l2_device macros
Date:   Sun,  8 Dec 2019 14:11:40 -0700
Message-Id: <20191208211139.18514-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191105045907.26123-1-natechancellor@gmail.com>
References: <20191105045907.26123-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When building with Clang + -Wtautological-constant-compare, several of
the ivtv and cx18 drivers warn along the lines of:

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

This warning happens because the shift operation is implicitly converted
to a boolean in v4l2_device_mask_call_all before being negated. This can
be solved by just comparing the mask result to 0 explicitly so that
there is no boolean conversion. The ultimate goal is to enable
-Wtautological-compare globally because there are several subwarnings
that would be helpful to have.

For visual consistency and avoidance of these warnings in the future,
all of the implicitly boolean conversions in the v4l2_device macros
are converted to explicit ones as well.

Link: https://github.com/ClangBuiltLinux/linux/issues/752
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2: https://lore.kernel.org/lkml/20191024201240.49063-1-natechancellor@gmail.com/

* Fix typo in commit message
* Add Nick's Reviewed-by.

v2 -> v3: https://lore.kernel.org/lkml/20191105045907.26123-1-natechancellor@gmail.com/

* Improve reasoning for change (Ezequiel)
* Patch all implicit boolean conversions (Ezequiel)
* Add Ezequiel's reviewed-by.

 include/media/v4l2-device.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 5f36e0d2ede6..95353ae476a1 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -371,7 +371,7 @@ static inline bool v4l2_device_supports_requests(struct v4l2_device *v4l2_dev)
 		struct v4l2_subdev *__sd;				\
 									\
 		__v4l2_device_call_subdevs_p(v4l2_dev, __sd,		\
-			!(grpid) || __sd->grp_id == (grpid), o, f ,	\
+			(grpid) == 0 || __sd->grp_id == (grpid), o, f ,	\
 			##args);					\
 	} while (0)
 
@@ -403,7 +403,7 @@ static inline bool v4l2_device_supports_requests(struct v4l2_device *v4l2_dev)
 ({									\
 	struct v4l2_subdev *__sd;					\
 	__v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,		\
-			!(grpid) || __sd->grp_id == (grpid), o, f ,	\
+			(grpid) == 0 || __sd->grp_id == (grpid), o, f ,	\
 			##args);					\
 })
 
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
@@ -462,8 +462,8 @@ static inline bool v4l2_device_supports_requests(struct v4l2_device *v4l2_dev)
 ({									\
 	struct v4l2_subdev *__sd;					\
 	__v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,		\
-			!(grpmsk) || (__sd->grp_id & (grpmsk)), o, f ,	\
-			##args);					\
+			(grpmsk) == 0 || (__sd->grp_id & (grpmsk)), o,	\
+			f , ##args);					\
 })
 
 
-- 
2.24.0

