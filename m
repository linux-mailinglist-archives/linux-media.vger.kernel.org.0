Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 913424765C
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfFPSXP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:23:15 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:35056 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfFPSXO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:23:14 -0400
Received: by mail-lj1-f174.google.com with SMTP id x25so7164771ljh.2
        for <linux-media@vger.kernel.org>; Sun, 16 Jun 2019 11:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oTACBj1SNotKeh448jg6GXSUlcVrP4s2D18F0yKnfus=;
        b=t4uX4evPUttsrAPL5OljElbkI9jRECClFgMK9rOopOtPoulrzw5SIqja+iYmOBVzrH
         YWaemJPOAEcpr6GJTs1SkwvWtr3xsja8t3JC5jVF02CkkhPnHCrB86PD7TbhbzSvpl2F
         Nl4ZDPWJsBaJVZmN5RCc1d90L0GP7NOWpXR85UR6f7u5bIBV2HWNgPAoMvTUgZXy3oXx
         eBUIZNr7Zl+KsAkjwmnNWxAVilsWi6+AcQpfu+vmhokkSg84rRU61hCB4L5J1PfVCzCJ
         NjbuL7vFW6kSh4h4vE1Ng9IlDWFAJtcNl9nvFotbzONXNf4mAPMpT0sXtQzXPdXBTqXC
         yoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oTACBj1SNotKeh448jg6GXSUlcVrP4s2D18F0yKnfus=;
        b=gv+W4mMnyZMAgd3R91tEFe7dXiRi80MDmSdzudDh/1D1GhNoQJV0GesY0LijrVJU8g
         6AAMLD+o83+pmQ2LMXb6GHT+qxhLuO5V7RsnlaFAxBHjA5ichwjRIenNJwmHYNjsCRWD
         0JXMunQ9pMthORz4e/PI6DFCthUZ+ZmzIS0grz4kXnlCNehiAn4H2ABkbfeBWEAap4nM
         O8ubzMOfV8EqmsZW1jyI+PuW0KdSlz2rSHKt9pKpA3m9BzHT0jGqTeYEubtzssgSeGg3
         5Kp0Bpx+Hy7HklTGf9JqqSyLEkmLVlDP6qBxRTWx07lqo57S2ckVGzlhQsMRHQxlX+cO
         3fHw==
X-Gm-Message-State: APjAAAVqGZjFmkZb4FOjIix20naqXm6UC8y8VDHUXRFAemCDhnWCfdev
        TrszAFEkBT+m649rSkk3ydZ7t+44/O8=
X-Google-Smtp-Source: APXvYqx3ulkDwMZFnYoLbF3r7/coJcGztUhU1iKtMYgEORwCLHX/K7XDRwDxr+AQ00fSrNcsEFoDRA==
X-Received: by 2002:a2e:968e:: with SMTP id q14mr15180724lji.195.1560709392347;
        Sun, 16 Jun 2019 11:23:12 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id z85sm1714081ljb.101.2019.06.16.11.23.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:23:11 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v2 4/9] media: vivid: add number of HDMI ports to device state
Date:   Sun, 16 Jun 2019 11:22:13 -0700
Message-Id: <20190616182218.37726-5-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616182218.37726-1-johan.korsnes@gmail.com>
References: <20190616182218.37726-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This will be used for HDMI-specific controls such as hotplug detection
and power present.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.c | 2 ++
 drivers/media/platform/vivid/vivid-core.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index b1d5332b363f..8c211fba3c66 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -720,6 +720,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		in_type_counter[HDMI]--;
 		dev->num_inputs--;
 	}
+	dev->num_hdmi_inputs = in_type_counter[HDMI];
 
 	/* how many outputs do we have and of what type? */
 	dev->num_outputs = num_outputs[inst];
@@ -742,6 +743,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		out_type_counter[HDMI]--;
 		dev->num_outputs--;
 	}
+	dev->num_hdmi_outputs = out_type_counter[HDMI];
 
 	/* do we create a video capture device? */
 	dev->has_vid_cap = node_type & 0x0001;
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index 24104df6c444..1d04b7209f2b 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -180,9 +180,11 @@ struct vivid_dev {
 	/* supported features */
 	bool				multiplanar;
 	unsigned			num_inputs;
+	unsigned			num_hdmi_inputs;
 	u8				input_type[MAX_INPUTS];
 	u8				input_name_counter[MAX_INPUTS];
 	unsigned			num_outputs;
+	unsigned			num_hdmi_outputs;
 	u8				output_type[MAX_OUTPUTS];
 	u8				output_name_counter[MAX_OUTPUTS];
 	bool				has_audio_inputs;
-- 
2.19.1

