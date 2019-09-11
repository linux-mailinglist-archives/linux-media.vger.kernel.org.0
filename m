Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD5E2AFF0C
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 16:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbfIKOo6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 10:44:58 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40305 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfIKOo6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 10:44:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id t9so3890108wmi.5
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=MoEpvsQswgJbAQqBitPB53w7SW52PzJiIgebcPmHaIU=;
        b=PRWDx5Qh1QnjTCr1afPH+KqtIEcuLTnx75lbL4dOfJ05B5oNKI7csmMDwMj1I60z9I
         E38Q4CsqHMPQ7sNvT6MLdE6h61HaleJkv6ILFFtj48vm9lZiUJHQUGdla8LInUJpwdCp
         LfuWgY6w/1wNiGUIsuz4LScO0DPdHCxaPMqMtvzJRBo5c4kZzDXY6AkYbxD8eg08mbLE
         A2z4oCHNwCKgBfJbPKgT9hw1Qzi5LnOGPArT1K/Ca2lcsZONf5VOr7VLQHSg8jcqpawc
         0ggBJBaatfwJ1+V/EoCxZAp+D1kdx5MTstoQCRHInXgM4+gAdJbFm8D+SqOmgT9D+xj2
         tASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MoEpvsQswgJbAQqBitPB53w7SW52PzJiIgebcPmHaIU=;
        b=aU9bTjfeXXCfWGZoyHLZzmJpVAcnchslD0kZT/AwdUF4xILg8ZB3wue1SAsjmnl9o5
         FkGUxXkfdHLkrn59tWoHsUN1IxbyOTSIbF5yfjjarIthEHNpsW0RMz5s7htRvXJUymDx
         Kt4WBtGcW4aUwZyrMuWH0u9jVjMTOZKhCO655fqAbwLi1TRX6+R6wnA6SpdBUzkzqGe2
         TkQfyQbnijjotTotqACjObCSaDC8Ge1Fi/mmfJ7RTIXQ5+xCH9Vgqi0WSW0RpSNnWzp6
         Cdo2gEDlx8kCMnyXVB5i750tq939IV0geZNdRRC2SnGhKlyaRfKpPRTaC6Z/0nyRGgPx
         pE6g==
X-Gm-Message-State: APjAAAU/8/394doMBpRSNAg2WQNcVb0UWQe+JnYsjK3y4tcP82M0Ezhj
        ZuBD2oz1zqVahiIIKkQr7Re/5g==
X-Google-Smtp-Source: APXvYqyj7zbTb3KytdLDphQUPXHwA5pwNTZFeVws4AJ8JjZA/P2mf8sSJdT0QmzoSm0ZrLpVKa1vLQ==
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr4405079wmo.142.1568213096101;
        Wed, 11 Sep 2019 07:44:56 -0700 (PDT)
Received: from lpoulain-ThinkPad-T470p.home (lfbn-tou-1-177-187.w86-201.abo.wanadoo.fr. [86.201.27.187])
        by smtp.gmail.com with ESMTPSA id e3sm27799636wrh.12.2019.09.11.07.44.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 11 Sep 2019 07:44:55 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] media: venus: core: Fix msm8996 frequency table
Date:   Wed, 11 Sep 2019 16:45:59 +0200
Message-Id: <1568213159-7828-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In downstream driver, there are two frequency tables defined,
one for the encoder and one for the decoder:

/* Encoders /
<972000 490000000 0x55555555>, / 4k UHD @ 30 /
<489600 320000000 0x55555555>, / 1080p @ 60 /
<244800 150000000 0x55555555>, / 1080p @ 30 /
<108000 75000000 0x55555555>, / 720p @ 30 */

/* Decoders /
<1944000 490000000 0xffffffff>, / 4k UHD @ 60 /
< 972000 320000000 0xffffffff>, / 4k UHD @ 30 /
< 489600 150000000 0xffffffff>, / 1080p @ 60 /
< 244800 75000000 0xffffffff>; / 1080p @ 30 */

It shows that encoder always needs a higher clock than decoder.

In current venus driver, the unified frequency table is aligned
with the downstream decoder table which causes performance issues
in encoding scenarios. Fix that by aligning frequency table on
worst case (encoding).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 0acc757..e0d5a10 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -427,10 +427,11 @@ static const struct venus_resources msm8916_res = {
 };
 
 static const struct freq_tbl msm8996_freq_table[] = {
-	{ 1944000, 490000000 },	/* 4k UHD @ 60 */
-	{  972000, 320000000 },	/* 4k UHD @ 30 */
-	{  489600, 150000000 },	/* 1080p @ 60 */
-	{  244800,  75000000 },	/* 1080p @ 30 */
+	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
+	{  972000, 520000000 },	/* 4k UHD @ 30 */
+	{  489600, 346666667 },	/* 1080p @ 60 */
+	{  244800, 150000000 },	/* 1080p @ 30 */
+	{  108000,  75000000 },	/* 720p @ 30 */
 };
 
 static const struct reg_val msm8996_reg_preset[] = {
-- 
2.7.4

