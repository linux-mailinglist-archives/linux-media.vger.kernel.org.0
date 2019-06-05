Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B775365AE
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfFEUlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:41:10 -0400
Received: from casper.infradead.org ([85.118.1.10]:37114 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfFEUlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 16:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=h98u8H7RfP5qJN0kCyqIabwfZ68OoIG1a6EpwEt8FWo=; b=aPJ1cnA0f/UZYVjZUKtwfuWMb5
        vKz7K7uIjdvvTt7FI5ZNUONLESbeimFe9dKnYZooD2ZYm4yzq9WhVK9bLmYuF/mctvbtMMidzidl8
        JSgQAjo2NBhYacmYSta7LS2rmcP2ZiuoEIdN4PcItWiVmewmwOx6mH1ijxIfhCX9LrCpw4BxhXU2V
        IgDqKXg6eVvKxHUHUND4zQ9evsScTrXXBP3dAFdyh0DiQqp6ymensVDZPiffP6KaDAwdpH3YnX6Ft
        5u69dBOiIjUucOdLQ7k8NaFOACSS9fXysZrWD1wPHn8iplGS4KCaWuoMP0DdkKWIkVcw0wX4tw9zV
        HbRkufNQ==;
Received: from [179.182.172.34] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYciZ-00073A-BD; Wed, 05 Jun 2019 20:41:07 +0000
Date:   Wed, 5 Jun 2019 17:41:02 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM VENUS VIDEO ACCELERATOR
        DRIVER),
        linux-arm-msm@vger.kernel.org (open list:QUALCOMM VENUS VIDEO
        ACCELERATOR DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] Revert "media: hfi_parser: don't trick gcc with a wrong
 expected size"
Message-ID: <20190605174044.65ac1e4a@coco.lan>
In-Reply-To: <20190605201941.4150-1-jonathan@marek.ca>
References: <20190605201941.4150-1-jonathan@marek.ca>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  5 Jun 2019 16:19:40 -0400
Jonathan Marek <jonathan@marek.ca> escreveu:

> This reverts commit ded716267196862809e5926072adc962a611a1e3.
> 
> This change doesn't make any sense and breaks the driver.

The fix is indeed wrong, but reverting is the wrong thing to do.

The problem is that the driver is trying to write past the
allocated area, as reported:

	drivers/media/platform/qcom/venus/hfi_parser.c:103 parse_profile_level() error: memcpy() 'proflevel' too small (8 vs 128)
	drivers/media/platform/qcom/venus/hfi_parser.c:129 parse_caps() error: memcpy() 'cap' too small (16 vs 512)

If you check the memcpy() logic at the above lines, you'll see that
hfi_capability.data may have up to 32 entries, and
hfi_profile_level_supported.profile level can have up to it can be up
to 16 entries.

So, the buffer should either be dynamically allocated with the real
size or we need something like the enclosed patch.

Thanks,
Mauro

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7a3feb5cee00..06a84f266bcc 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -59,7 +59,6 @@ struct venus_format {
 
 #define MAX_PLANES		4
 #define MAX_FMT_ENTRIES		32
-#define MAX_CAP_ENTRIES		32
 #define MAX_ALLOC_MODE_ENTRIES	16
 #define MAX_CODEC_NUM		32
 
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 34ea503a9842..ca8033381515 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -560,6 +560,8 @@ struct hfi_bitrate {
 #define HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS	0x15
 #define HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE		0x16
 
+#define MAX_CAP_ENTRIES                32
+
 struct hfi_capability {
 	u32 capability_type;
 	u32 min;
@@ -569,7 +571,7 @@ struct hfi_capability {
 
 struct hfi_capabilities {
 	u32 num_capabilities;
-	struct hfi_capability *data;
+	struct hfi_capability data[MAX_CAP_ENTRIES];
 };
 
 #define HFI_DEBUG_MSG_LOW	0x01
@@ -726,7 +728,7 @@ struct hfi_profile_level {
 
 struct hfi_profile_level_supported {
 	u32 profile_count;
-	struct hfi_profile_level *profile_level;
+	struct hfi_profile_level profile_level[HFI_MAX_PROFILE_COUNT];
 };
 
 struct hfi_quality_vs_speed {



