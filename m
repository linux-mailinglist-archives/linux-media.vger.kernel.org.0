Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53680337815
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbhCKPlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234118AbhCKPlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:08 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C70C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:08 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so13067349wmj.1
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/r3aZbcoQSdd2XlNz/UGKekZlF4ttbt76qWK9B/aFNk=;
        b=UqPLiW74XyVzX+/8i1wFG4KYZv4JtNlR+POcaYks2dw73DeibmIKY+eAfxocTv4QAh
         m9w9FOgQIXx2pUE9rEwweK+GY755VQKjBGotptkRCyy8y/l3JDsvEICCZy0is/lshXts
         25Fkooa49fmVuLkqtZO/QxcRnmnBLdeEstgwA4AStWv8aLNj2GsICxNApRrUPj0+BrSt
         TUJWmeRncmVYDie3V5+U9UuCLewznQfsnKDauWAqvXyMVM6VvPoobxp6YVC6aAw/TqVN
         Xh6IMh1C+9cxKO47tOV9FxhK2NTLgubFMJiYVQEju+0SA+LVZ/6gljVO2LMjljWhksl7
         3lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/r3aZbcoQSdd2XlNz/UGKekZlF4ttbt76qWK9B/aFNk=;
        b=dAMETHGW7tkP0+3UgsQZln1ArkUwgKqTR2Lv4nnKloZPxXieDXIfMWj09vdj+lGV86
         Kc1iZsOF0TBV2i3dsSrse8iigqY7Dld8rdGY/8BCrI3ie/KB+cHocDG648+q/6u4Nya9
         ahzUdblixEXEBndddfCCcWfYgp8vi73vFeYgRv2m+fWHHMPCaBqvGW1eXZpJzRZtRsJJ
         t5wL3cBOra7u2eN0zyV8lKIxGrYmFM+iLnqAcdcpViOyLJ2OZhUACC7BLxjJ5RsTjb4s
         bbIDH5sqXs/pSNcbEvSVtTP1yCOWC61Hw99+odlSpTf+2/9HarUTC2/LNApddfg3Znz5
         bvpg==
X-Gm-Message-State: AOAM531RY5YH//kvdjGlHf8F8YnhpMI9IggN+PAwD8U1OKeTYoXVdoLr
        AQN8lvInMjvtCiYtvmVxQiA=
X-Google-Smtp-Source: ABdhPJwZaFjAOAqytix5m62/UG9vW5dE/VZ2CndcnxU4JL0UkXJxjs5A40JB6/bpCXjBwhvuJunELw==
X-Received: by 2002:a1c:a306:: with SMTP id m6mr8517880wme.13.1615477266868;
        Thu, 11 Mar 2021 07:41:06 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:06 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v2 04/10] media: hantro: imx: remove unused include
Date:   Thu, 11 Mar 2021 15:40:49 +0000
Message-Id: <20210311154055.3496076-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The current imx8 code does not use the jpeg encoder. Remove the
unnecessary include.

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index cb1ac02c03d2..f36c1bd681ba 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -9,7 +9,6 @@
 #include <linux/delay.h>
 
 #include "hantro.h"
-#include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
 
 #define CTRL_SOFT_RESET		0x00
-- 
2.30.1

