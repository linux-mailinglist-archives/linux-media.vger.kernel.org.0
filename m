Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C05B47661
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfFPSXV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:23:21 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35103 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfFPSXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:23:20 -0400
Received: by mail-lf1-f67.google.com with SMTP id a25so4902452lfg.2
        for <linux-media@vger.kernel.org>; Sun, 16 Jun 2019 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28N3PePFT9joKDkGzCl16JvPLy5A0HrfnCUTU2OTqP4=;
        b=SyiKWDptkFLCYYj6TUEMVaE94fIC0nK5AdJIgF6vFzBVeILCNaH3ewfEMu3b9c/0uW
         JRPf3jnT8c+NgIYkPHFnMxi01xuY6SFkHammAbn5x2ShNOg7/P5A/nlEt+3a8+tqHqh2
         Mel73kPm+HLLsYhVWSjVP5fQMlTKJprN7fjRzIQ0mRD+pdMnZRvRxYRzR5WQDSeIZ4YG
         2wGJs8S1wWGGy9Ye1N0Ecfurgjb+vIfpklKlmCj8i1jctwoUuOuU14pw6wMgE5IfPc2S
         Ht+aX57OIAIQkXguR9N4QksQ978r3To/7UYbcJ2Kuwv1wHckebeZhQEt2IfJsoGw8lUo
         n+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28N3PePFT9joKDkGzCl16JvPLy5A0HrfnCUTU2OTqP4=;
        b=bL/4zbXwbpkysmA5qae4+NYijjexNIz21+r6Rc+FbONIdQw6qiX2vqu7SIFpcT5WkV
         I5eOoE1mXYKDAEqXs861Auwik8PUlQwesgnSbadsBR3ZEqJikZEj9LbQeGawjS9IQPdU
         dU1WH2tk72LshFCL3izSOs0Chbe5+uRInS8YNsGJC478ql220EYlZEdVvUAShKaTAzWl
         C2UgW/l/FWxq18UvU0UAC5HA6PrIBZ2OfIDYonkohaFo1NgEdpx772aujaUlfyGr5F/L
         w1IcxqTNwn1f9rPPqp+CbLSGrQMJJi2ZYx6xQgB7JCLpe/QTGBdMqqPrh9/hi1ChdasV
         yyLA==
X-Gm-Message-State: APjAAAWkyJopSRjDHwWVK0FcOqhmhdiD2qdn+5xh5Y++CxdcNFmyVYlI
        J3dfvIQhPe3J2A6Y0j+AO0HScfLTxx4=
X-Google-Smtp-Source: APXvYqyn0THagGyB0CjeFOY8qTjtyiy79GJN7enl3HOlVpsReZcMTMQAEnLPtRB1sZUg9p6PmV9tqg==
X-Received: by 2002:a19:a50b:: with SMTP id o11mr49080442lfe.183.1560709397899;
        Sun, 16 Jun 2019 11:23:17 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id z85sm1714081ljb.101.2019.06.16.11.23.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:23:17 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v2 9/9] media: vivid.rst: describe display present control
Date:   Sun, 16 Jun 2019 11:22:18 -0700
Message-Id: <20190616182218.37726-10-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616182218.37726-1-johan.korsnes@gmail.com>
References: <20190616182218.37726-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 Documentation/media/v4l-drivers/vivid.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/media/v4l-drivers/vivid.rst b/Documentation/media/v4l-drivers/vivid.rst
index edb6f33e029c..7082fec4075d 100644
--- a/Documentation/media/v4l-drivers/vivid.rst
+++ b/Documentation/media/v4l-drivers/vivid.rst
@@ -941,6 +941,11 @@ Digital Video Controls
 	affects the reported colorspace since DVI_D outputs will always use
 	sRGB.
 
+- Display Present:
+
+	sets the presence of a "display" on the HDMI output. This affects
+	the tx_edid_present, tx_hotplug and tx_rxsense controls.
+
 
 FM Radio Receiver Controls
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.19.1

