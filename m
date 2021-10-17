Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9737430A88
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343994AbhJQQW7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344044AbhJQQW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:22:56 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A56C06161C;
        Sun, 17 Oct 2021 09:20:47 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n11so9620833plf.4;
        Sun, 17 Oct 2021 09:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U00ruTBIXRJgbnte4h6umYs04Hf2Jn1ltdCVoHTbMog=;
        b=j8t9n4DTolVN2UjTZru9R8vl6ztjRFfSczDy0L8gN4I/QfGrR+79kKppwfOlQJVQBL
         I3nNBBw/I0/Ra82gWazQQKcrZUT9qqiQFNnOUmmfM/+EE8IzkOwzT1td3LjeoqqR/6sy
         ks+yDJ90WY4+To7A24+Zp8eRfqTb0AxxGnHvsMCRIVrNYpTWCfF6PUqa2z0NnWvB3UQi
         IzNPS3sMFr2SugSQZm/a6fhW7OpNBKncmhhesi67hj8EGIshmf1DbNUSuzKFx0eOyikA
         XdqLwRAQUnyloYh92bHj40c1P1TWq6cA5IITw1K05PWZfzoiJvA4bIyiNF6DLM4WyGPV
         dNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U00ruTBIXRJgbnte4h6umYs04Hf2Jn1ltdCVoHTbMog=;
        b=wGL3QvRS6CAaxpmI/EomqqUa0xETSdwqNpMMiMDwEhqbnKQFDdK1Ri3ct4D7E07mrL
         hBpZd6uvvbUBKwj7b3Xrib4F600W3jcNDVR6vkrOa4gIz3rQS23xUbeWbVKcAJLILMKO
         zdyXleV5e12fnTGsap+CT/OJHKrWVkqqoAIs/B7aSTvE6XlmaYdDgLZDSGErvVtlGSPR
         HQEqKzXphm/m01Ar/M6oE51se0vc0sRA2r5ib504RKuGiuHd804VcKEh1MH1hVcpUGMJ
         Xi/ArycYzWZyEKm2eQ9cDUXDXnuuqA+uHfqk6Qo3+B7LBc7qBFLGFzgMwKaP4qajGzuX
         76NQ==
X-Gm-Message-State: AOAM531qX28P6/DTaiZLKRhC4IzAY3CHJD3js2OM8Ndvp5ehdrHB1M4+
        Gjw0luWdkT5C33vxU/beZxU=
X-Google-Smtp-Source: ABdhPJw9hheYwIYL5WJPaGEsn6dIeE1Ivg3cE1fIj8Pf+5a/ylyGzvit1kHMgVyAXgbYp+d90G+m6g==
X-Received: by 2002:a17:902:c942:b0:13f:d1c:819a with SMTP id i2-20020a170902c94200b0013f0d1c819amr22616523pla.64.1634487646654;
        Sun, 17 Oct 2021 09:20:46 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:20:46 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/17] media: atomisp: pci: fix punit_ddr_dvfs_enable() argument for mrfld_power up case
Date:   Mon, 18 Oct 2021 01:19:42 +0900
Message-Id: <20211017161958.44351-3-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When comparing with intel-aero atomisp [1], it looks like
punit_ddr_dvfs_enable() should take `false` as an argument on mrfld_power
up case.

Code from the intel-aero kernel [1]:

        int atomisp_mrfld_power_down(struct atomisp_device *isp)
        {
        [...]
        	/*WA:Enable DVFS*/
        	if (IS_CHT)
        		punit_ddr_dvfs_enable(true);

        int atomisp_mrfld_power_up(struct atomisp_device *isp)
        {
        [...]
        	/*WA for PUNIT, if DVFS enabled, ISP timeout observed*/
        	if (IS_CHT)
        		punit_ddr_dvfs_enable(false);

This patch fixes the inverted argument as per the intel-aero code, as
well as its comment. While here, fix space issues for comments in
atomisp_mrfld_power().

Note that it does not seem to be possible to unify the up/down cases for
punit_ddr_dvfs_enable(), i.e., we can't do something like the following:

        if (IS_CHT)
        	punit_ddr_dvfs_enable(!enable);

because according to the intel-aero code [1], the DVFS is disabled
before "writing 0x0 to ISPSSPM0 bit[1:0]" and the DVFS is enabled after
"writing 0x3 to ISPSSPM0 bit[1:0]".

[1] https://github.com/intel-aero/linux-kernel/blob/a1b673258feb915268377275130c5c5df0eafc82/drivers/media/pci/atomisp/atomisp_driver/atomisp_v4l2.c#L431-L514

Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0511c454e769..f5362554638e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -711,15 +711,15 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 
 	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
 
-	/*WA:Enable DVFS*/
+	/* WA for PUNIT, if DVFS enabled, ISP timeout observed */
 	if (IS_CHT && enable)
-		punit_ddr_dvfs_enable(true);
+		punit_ddr_dvfs_enable(false);
 
 	/*
 	 * FIXME:WA for ECS28A, with this sleep, CTS
 	 * android.hardware.camera2.cts.CameraDeviceTest#testCameraDeviceAbort
 	 * PASS, no impact on other platforms
-	*/
+	 */
 	if (IS_BYT && enable)
 		msleep(10);
 
@@ -727,7 +727,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
 			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
 
-	/*WA:Enable DVFS*/
+	/* WA:Enable DVFS */
 	if (IS_CHT && !enable)
 		punit_ddr_dvfs_enable(true);
 
-- 
2.33.1

