Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A126D2CBAC
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbfE1QTu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:19:50 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38275 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbfE1QTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:19:49 -0400
Received: by mail-ed1-f66.google.com with SMTP id g13so2811395edu.5
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2jL0k47v9NmwQ+xrcSOtmaPHgPmnH2sze7BUfWxBV/8=;
        b=sDVZHD6TRfeBWO5XUlRQoLKOpvMbFGsGsp/Jgmj+bbVc/RDbL6JLqixKj1QBuvAh5S
         +/rqM13aoDuiRePkaq92dR61AMf1CufGMqkzlJ7AC+e+rjuZkza8lG5yphaRKawwtUoF
         GMHefGgRhB06QT1+aFqm7QGaeDL+f1UUC3Z3NcJ53DPrVzoqb+zpk/SbXI6yvBiAGQ1S
         KBth0WfPCnTnm9omfjSVnOV8IkDOOccN5RqgCeOMfa1u+YMWO55qnDAOboyPRsgLsneb
         pavJTavBrtTLGGpM4jg0xlMCDVUhiyy5lIzJlpX0Qz/1bo7m8OO1tvsNdsgIKATaijeV
         LCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2jL0k47v9NmwQ+xrcSOtmaPHgPmnH2sze7BUfWxBV/8=;
        b=ArkIz7Y3MY5ih7DfHdsi9Oc4wi6SzpXL30B872GKsWB9PQ0tfRZ7i0qGIvFNMmgfix
         N7UOR5rIB2MH50kDgzKHwTqEGg0DutOmuzHHXjMFFS62NdAgjQ1YmWSWaB2pesxa8C07
         P/geG/oFkuhFceOJIjF2ywJovOT4eXG9+UGyA2d8EFVUgJJVFYKFt4p5vMutNrN6LXgo
         LlUpXrNpbjxPg4hxnmJgCM4qI8JhAN0X+8CcykIMAY29fdoFA3a0Zjvcu7MYWSWLmxao
         edi144sqyAPDdnaS0IKpaDy8ZsKsrhDSXLShKi5SWNfNZpMkjk+6p5tYjiZHDii7wfMC
         FZHg==
X-Gm-Message-State: APjAAAUdWXUi4ZeR+GJ+h0lj15Bg1SqYdRvjmk1Nak7wzX3WfbtYzTQK
        7EerIsc8Iddqc4/Z3XnV/Hnd3coxf8A=
X-Google-Smtp-Source: APXvYqxedlRKrnY0iaK3tm81xSIXG8M25X+Ef0kZuJ8GeJLs/8GUurlx1O3EkD+VmC6XoXNLrg29ZQ==
X-Received: by 2002:aa7:d0c2:: with SMTP id u2mr25693362edo.303.1559060387692;
        Tue, 28 May 2019 09:19:47 -0700 (PDT)
Received: from ubuntu.localdomain ([173.38.220.62])
        by smtp.gmail.com with ESMTPSA id c38sm4313002edc.22.2019.05.28.09.19.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:19:47 -0700 (PDT)
From:   johan.korsnes@gmail.com
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH 4/8] media: vivid: add number of HDMI ports to device state
Date:   Tue, 28 May 2019 10:19:08 -0700
Message-Id: <20190528171912.3688-5-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528171912.3688-1-johan.korsnes@gmail.com>
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Johan Korsnes <johan.korsnes@gmail.com>

This will be used for HDMI-specific controls such as hotplug detection
and power present.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.c | 2 ++
 drivers/media/platform/vivid/vivid-core.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index 20a0dcebd783..b2b4ee48cef0 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -722,6 +722,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		in_type_counter[HDMI]--;
 		dev->num_inputs--;
 	}
+	dev->num_hdmi_inputs = in_type_counter[HDMI];
 
 	/* how many outputs do we have and of what type? */
 	dev->num_outputs = num_outputs[inst];
@@ -744,6 +745,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
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
2.17.1

