Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8572832F2E6
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 19:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhCESkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 13:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhCESjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 13:39:47 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7478C061761
        for <linux-media@vger.kernel.org>; Fri,  5 Mar 2021 10:39:38 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id p8so5364895ejb.10
        for <linux-media@vger.kernel.org>; Fri, 05 Mar 2021 10:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aHERaCb1u1sNTTmIBcxgTpCWC+DW/pRIiKz9xPLnHbA=;
        b=FTYBdkvIe0gUlyOUXdCKjyz0cfOOEzyotpGqU4K/vnTzQXLbKkwZUrm8a+0yBpotKV
         MwcBNU6M+09RdiGjGOj3DVHefrM6ZWjxkCvwJy4ONCp5ZDeKZL6s6iBS9xiGP0qMjgPt
         OIb84AAumaTSau//1ZwWkO7/5K9eF7qPCnhXpuLuGSN6xJIEPahEMXWI/iUCV+bvF53B
         2q25CVaRXVwfBOr7pBBtnYGuODJYojX6X5xoyBRBljuqwbpRAqV1/WytVntn04sFH9LY
         7QaclC+h6xbJgCbSXd0Uxc05KGYCo++IHsy7W/SXcIxtynav2gwySEop7rnhKtvK919p
         mmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aHERaCb1u1sNTTmIBcxgTpCWC+DW/pRIiKz9xPLnHbA=;
        b=g0d4i3I21DHabHvnQLS83p2s/t6kcyYJp6xrjtwBn8pJ+SnTbpSEHwOjD9bl/NhhyD
         e2PCUevMd3NgLzhGjbOWYVbMPkXoohJLYsIMBdwdOh9CWwesI6jytKXgP8awvjevsabX
         pKR49OEAs3UmqDernzXsPFWGxS0a1aisP0K9jsBbAbr1+HyqCisVqKpaUThfsnOaGOnT
         B4Ic7ahiczyVeMebrdF7GiVev6Cv4WkqGgJe8IaCX62kKFimkJMzDQc1vb437sMoN0Ow
         E5TUyrh84NzE1xm8VnGv+lGbA/9/g/IOmIKmlYNMr6fysv6w5aQopOg/616HNVQ8fnAV
         LO7w==
X-Gm-Message-State: AOAM530kItnZaKr2lhhLNMwvNJ0al9SVVtQyjiLGOL3z13hcxvW+s8+x
        Oltfs9fRJE/SUIlTKI34sjg=
X-Google-Smtp-Source: ABdhPJwFcoYQW+23vhO3nVr0t4cUdcT+S+48ptXSA7tC1DlvVT2VavzFhF92Lg4XXmGSijqw0a5Qfg==
X-Received: by 2002:a17:906:1754:: with SMTP id d20mr3541915eje.221.1614969577562;
        Fri, 05 Mar 2021 10:39:37 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:39:36 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 2/7] media: hantro: imx: reuse MB_DIM define
Date:   Fri,  5 Mar 2021 18:39:19 +0000
Message-Id: <20210305183924.1754026-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Swap the hardcoded 16 with MB_DIM define.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index c222de075ef4..1f48c1956cd2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -109,10 +109,10 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 3840,
-			.step_width = 16,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 2160,
-			.step_height = 16,
+			.step_height = MB_DIM,
 		},
 	},
 	{
-- 
2.30.1

