Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32E3CE66B
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbfJGPGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:06:47 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33931 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbfJGPGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:06:46 -0400
Received: by mail-lj1-f195.google.com with SMTP id j19so14066686lja.1;
        Mon, 07 Oct 2019 08:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m6p9TCl1q4PmCyDnNVWS8vM5CeKoKD3/SoQWgI0Yo4g=;
        b=Jvb3r9przn80NoTG9vxZv4zyHFUhcovsRIVQS3FmkXc89WcP+PW8+fqwB1vhb3lEjx
         GyhAMrlcpdPfkWpicbub1yWTL9VY61Ce+xDhwkoDQ1i2eGFDmnxeiYyuPtg4xjd8BzZU
         uSnPa8tbGnC4GyAjOGUZBTAFNHJabaq9jzWX4xU+dZ5WDvJeW3OcJGTWtPrET+b7K19J
         RI479C8Pyb+8Y/l36reAZ6pnxAFPNOs0w96DCYyWuvpEI66KUFvoBjrMz9nXb11qFEwY
         0aFVNSaFOyuiXwwZ013VNn4QR45H/LbY09jW7Lmb74XVgLstZ4RzkRsSn/Uj7OzuCH+f
         aqsw==
X-Gm-Message-State: APjAAAXalZTny+pAZipGOg+g7ibL9ZxRNRoE+fox/trjBiR3m24IazoF
        CdgmkD32MhD8zWhwqLwdxjxSTwQtZkf/tw==
X-Google-Smtp-Source: APXvYqzQ62/7eOw3kCCHPcQR4PUxvoHH6rTrHMPNU7g2TKMmU2i6hbmiKbEaCpklhgYl4Nli2V42PA==
X-Received: by 2002:a2e:88cd:: with SMTP id a13mr16353954ljk.102.1570460802827;
        Mon, 07 Oct 2019 08:06:42 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id n2sm3145517ljj.30.2019.10.07.08.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 08:06:41 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v12 2/8] Documentation: v4l2_ctrl_new_std_compound
Date:   Mon,  7 Oct 2019 17:06:30 +0200
Message-Id: <20191007150636.16458-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007150636.16458-1-ribalda@kernel.org>
References: <20191007150636.16458-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Function for initializing compound controls with a default value.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/kapi/v4l2-controls.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
index ebe2a55908be..b20800cae3f2 100644
--- a/Documentation/media/kapi/v4l2-controls.rst
+++ b/Documentation/media/kapi/v4l2-controls.rst
@@ -140,6 +140,15 @@ Menu controls with a driver specific menu are added by calling
                        const struct v4l2_ctrl_ops *ops, u32 id, s32 max,
                        s32 skip_mask, s32 def, const char * const *qmenu);
 
+Standard compound controls can be added by calling
+:c:func:`v4l2_ctrl_new_std_compound`:
+
+.. code-block:: c
+
+       struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
+                       const struct v4l2_ctrl_ops *ops, u32 id,
+                       const union v4l2_ctrl_ptr p_def);
+
 Integer menu controls with a driver specific menu can be added by calling
 :c:func:`v4l2_ctrl_new_int_menu`:
 
-- 
2.23.0

