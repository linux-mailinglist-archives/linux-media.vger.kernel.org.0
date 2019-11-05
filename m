Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BADEF4A5
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 06:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfKEFAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 00:00:25 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37473 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfKEFAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 00:00:24 -0500
Received: by mail-oi1-f193.google.com with SMTP id y194so16396037oie.4;
        Mon, 04 Nov 2019 21:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QGgGQaFEZRAOWraIxNIv4g2Bv5QWueLj5WXSnd8kx80=;
        b=YFEhjgdrxfiUQ2PaME5EbHYYDODaj5R38CaCkiE0eD8jxAAI/MYB/Rcz28Cqbn+PCH
         OQ2VDSeBd5h5qVoSTOro0x+fQoOVFp4opgn8p72LxFcRQGcHEoaxFEFn4rVJMrbzJ4rF
         TmR5fusHPVATGNR9k5sqIhHO0EX+0F0nvmN3n5hqKgX8ulmhx50tdjJv2q5AD9tDPNC7
         scKpkT19XeJKVkIlz+f0NqTZu88R8+g370FSQDklwYNwxIAFoC3K2GymlJtljV6QZx70
         koZ4SQy+Reci+5hehBdgr10ZNMKOavMlg5CKZhcE4E/iloaPCwUVadelD6XS7bxA3dSF
         EtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QGgGQaFEZRAOWraIxNIv4g2Bv5QWueLj5WXSnd8kx80=;
        b=jrZlUqaahjqQDXYQ3bxJcsWMGVpUsbSfPRGy0v/EN8Cb/yMfvts/WfvNhIyxD7n1Xo
         ZtEbe0BwCEc1aPTbC+bArTygtvXzI80KknwBxrKfqXMTosnNAJCN21XAb1ixgGVQE0rg
         CMHAIz7NjE/NBoTsMwhKMDXlt6UaxTYergHm7NDQgyuRglXefAHxmL61RkQfut65sxLg
         VsYZThXwA9+4Qbpx9D1T7FonWi4kcSRvjBKstsH600h2UBi5fioMUca1qOc3Lrwam7t6
         QFmTbSQBl+CHhBhUFwPMUvp0rO2vpcxjtMrVCjsKQaSRNVNsX9te+DTYLmnxFGkN7MMj
         +PZg==
X-Gm-Message-State: APjAAAXWCm5ISDBu8x+Dxl2sqcEfv/WNqOWlsL7sOCanfRD0sm4bjGPd
        uGRv0knL7YYa3DO3YU2XKdU=
X-Google-Smtp-Source: APXvYqyxXtL3mEV0v4w+KpEl31fxktM6xe6xt5qmYDqWX2Zq+EQAay7XmZRQXj6vm8ZfyPhCAb9CtA==
X-Received: by 2002:aca:1e14:: with SMTP id m20mr2381639oic.20.1572930023573;
        Mon, 04 Nov 2019 21:00:23 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id e93sm6089553otb.60.2019.11.04.21.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 21:00:22 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2] media: v4l2-device.h: Explicitly compare grpmask to zero in v4l2_device_mask_call_all
Date:   Mon,  4 Nov 2019 21:59:08 -0700
Message-Id: <20191105045907.26123-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191024201240.49063-1-natechancellor@gmail.com>
References: <20191024201240.49063-1-natechancellor@gmail.com>
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
just comparing the mask result to 0 explicitly so that there is no
boolean conversion.

Link: https://github.com/ClangBuiltLinux/linux/issues/752
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2: https://lore.kernel.org/lkml/20191024201240.49063-1-natechancellor@gmail.com/

* Fix typo in commit message
* Add Nick's Reviewed-by.

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
2.24.0

