Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852771B3407
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgDVAhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgDVAhp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:45 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4CAC0610D5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:45 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d17so230497pgo.0
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VUyUxdZMp9MG1RdHKiRpf2SfXiWcM2Xk3kgdF713aYg=;
        b=HlFVi1fZP+RzQrlTe/TjrKtT0vVcq260bZ62/R94iA6QPK+hyyFlgYkYYbtVDQlo2t
         iWIwrvHDavYCcenjPsmj7GcahUgd2Fk+JuzUTT1OGtW/dz+Fqz7fpeLZMehN/jZJgY36
         F/14KwFvzBlttI8+zJdWMAYJdBcLBotcfzbJ3Ib+IOSFiuVeE+PxoaVMtnf502gopEUD
         qc8hHMmLOpcZPY+H/hUi/SdeIPuPNLaqiLMR0JttsxnQmmRZfE5xqdF95s929IFno84m
         r0Q4q3J/0LvOEvOX89LjiKWBO8v1UwHg4mhvoPQGWauw3ZsF2le+k5gyMl0/NiTT/ldU
         ogLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VUyUxdZMp9MG1RdHKiRpf2SfXiWcM2Xk3kgdF713aYg=;
        b=P4YUd7XUYrCNZF4VeHIxvP58HIPwafvHW9KUCg8lO1tIBkZqZVJjHA7P5Ff7iK2aR3
         lrNJLlKIq2KjHitusOpIMqP8UqKm9+m8d/APyUtz+tnh+smzq4vvwUP0Vllgh62/Ijfu
         OpTnXKyOTM+pfRjys2Nl52YkI4ClelKw8MnmQpSZOEr5ymRH6er3Gwyb2gGFrvmnJJAK
         z/BixEnn2e6Nnv5mzn26y9tTmWDJ9GmxWbQeZZ0IgHFrBf3xowA/BrdV3xvAKcFEnIep
         Nrhi6FSjCfvd30LrJJPn9+BReAUotQXj1Ea1BHn4ZfU/UREt1LOAuORGyj1r999EGEK0
         RCjA==
X-Gm-Message-State: AGi0PuZT7Q0QpuXX2auURkgjty9Tecbuwe1RGjt3P8MFE83v4WxkoRrg
        qmDDBxV2K1AZzOi1rXYYLI/IDUGh
X-Google-Smtp-Source: APiQypLnzzNScCQBRXOQL86qQCNh5SotHZ1MwwSPUfG3gSRV3d3jASSbXduDqqxlEmIYgm13U2c/dg==
X-Received: by 2002:a62:4e88:: with SMTP id c130mr2805930pfb.122.1587515864676;
        Tue, 21 Apr 2020 17:37:44 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:44 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 07/12] utils: fix implicit double promotion
Date:   Tue, 21 Apr 2020 17:37:30 -0700
Message-Id: <20200422003735.3891-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wimplicit-float-conversion

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/rds-ctl/rds-ctl.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 0e497b2a..cc1d3bf7 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -525,7 +525,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
 
 	if (statistics->block_cnt)
 		block_error_percentage =
-			(static_cast<float>(statistics->block_error_cnt) / statistics->block_cnt) * 100.0;
+			(static_cast<float>(statistics->block_error_cnt) / statistics->block_cnt) * 100.0f;
 	printf("block errors / group errors: %u (%3.2f%%) / %u \n",
 		statistics->block_error_cnt,
 		block_error_percentage, statistics->group_error_cnt);
@@ -534,7 +534,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
 
 	if (statistics->block_cnt)
 		block_corrected_percentage = (
-			static_cast<float>(statistics->block_corrected_cnt) / statistics->block_cnt) * 100.0;
+			static_cast<float>(statistics->block_corrected_cnt) / statistics->block_cnt) * 100.0f;
 	printf("corrected blocks: %u (%3.2f%%)\n",
 		statistics->block_corrected_cnt, block_corrected_percentage);
 	for (int i = 0; i < 16; i++)
-- 
2.25.2

