Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B245231AD0
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 10:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgG2IFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 04:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgG2IFo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 04:05:44 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97158C0619D2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 01:05:44 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k13so3650507plk.13
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=students-iitmandi-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W8J9alNt9j182Qo6m9IaWrfQJWEuKo3Ae7Fy1SBu7uw=;
        b=DTrz2FM1MLC8vGx39HW6Jry1xeb06rXJcHKnWh+HuCeMvKJ9oq5Vj4RrlidvaGX++A
         CQMgWwfIo31vSimiVcxkVJITMaIN0XU4JXi4jmbwP2V2bnlE1aSMxGyPB4TVGu3jmz4W
         zIyi0kLyPirkkU4SiR6KUMrZk1L0zn3+ciByG4fqqHGFONIbBiiXQ+20D71vihyoNfK+
         uioMps8mu8Qjn//jPrxkCphrELaxfnbsQvYmrst9tD06SDyfOs+ym9ur5u3fN0BzEzYu
         IOadSSCCdz+CjFhpRTXTCIGWO2820zzu+w3pthYtJ++F74jxIvf9Xa75Wefq31v+RqVz
         94Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W8J9alNt9j182Qo6m9IaWrfQJWEuKo3Ae7Fy1SBu7uw=;
        b=JIu5QTeu8liAuvL5pdklm04dgcRR5XWrxi6gNwUlMBHFH//V63ptQBklDvC5Eyvi3b
         chhKeI5HNOBk76dqfgfH57F7PCmeh9gc0A1y0/x9edeDRTh+nXH8QOhwSdzZ7eHT65xb
         5RHzirZ87jAj1bmSwU9ER9oHLq/qOz7LZR70QvHoe4extO9EVO/Jkb0M2YCq16Wayt9Z
         gC6oAXc4B4lkJgXfzZInI+IahxEOrFJFSsL7dSQoXiqd6eeqcILvOJ98Hqh2iuuVpqPT
         lm/r7ShSN7xcfgL7p/pumJuDKOYxa1nGoOGtDhghnta2XvojSqMOeg+oBw5IRi7wgQoT
         gGLg==
X-Gm-Message-State: AOAM532dhSt0N6chYWN2qXwJFdCAwYPIsC2Wco4KC1sd1eHgyu7FUhMw
        N/+pmXFqSdTREB53QBIt6YzpHA==
X-Google-Smtp-Source: ABdhPJzp5tMn3uZPlfTXXh5uqofStWTTKRqKNv7x0hK6omQGXyLlQH5Pv7C20nQSSpcXNjFC/1qC4w==
X-Received: by 2002:a17:90a:1a83:: with SMTP id p3mr7912459pjp.113.1596009943908;
        Wed, 29 Jul 2020 01:05:43 -0700 (PDT)
Received: from devil-VirtualBox.www.tendawifi.com ([103.198.174.215])
        by smtp.gmail.com with ESMTPSA id a3sm1399383pgd.73.2020.07.29.01.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:05:43 -0700 (PDT)
From:   Ankit Baluni <b18007@students.iitmandi.ac.in>
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, b18007@students.iitmandi.ac.in
Subject: [PATCH v2] Staging: media: atomisp: Fixed a brace coding sytle issue
Date:   Wed, 29 Jul 2020 13:35:16 +0530
Message-Id: <20200729080516.2830-1-b18007@students.iitmandi.ac.in>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728021518.19639-1-b18007@students.iitmandi.ac.in>
References: <20200728021518.19639-1-b18007@students.iitmandi.ac.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed braces in 'if else' condition as it only consists of 
one line each and according to coding style rules , in this case 
the braces are not required.

Signed-off-by: Ankit Baluni <b18007@students.iitmandi.ac.in>
---
Change in -v2:
	-Removed space before ':' in subject line.
	-Added space before '<' in 'From' and 'Signed-off-by' line.
	-Added detailed description.

 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index f8d616f08b51..701de098cb29 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1828,11 +1828,10 @@ static int atomisp_streamon(struct file *file, void *fh,
 			dev_err(isp->dev, "master slave sensor stream on failed!\n");
 			goto out;
 		}
-		if (!IS_ISP2401) {
+		if (!IS_ISP2401)
 			__wdt_on_master_slave_sensor(isp, wdt_duration);
-		} else {
+		else
 			__wdt_on_master_slave_sensor_pipe(pipe, wdt_duration, true);
-		}
 		goto start_delay_wq;
 	} else if (asd->depth_mode->val && (atomisp_streaming_count(isp) <
 					    ATOMISP_DEPTH_SENSOR_STREAMON_COUNT)) {
-- 
2.25.1

