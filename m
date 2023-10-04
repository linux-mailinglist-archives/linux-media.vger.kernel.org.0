Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEAED7B7890
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 09:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241501AbjJDHUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 03:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241498AbjJDHUN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 03:20:13 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBF9BB
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 00:20:09 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9b281a2aa94so317212166b.2
        for <linux-media@vger.kernel.org>; Wed, 04 Oct 2023 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1696404008; x=1697008808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4ZgBmHteA4wHsLrCFexpXA7K7drP5ZEJIQkSB/aVxY=;
        b=DID62vkPq/VUnxOpfFxAi/VHOlGNhCBgZwIH01rEgXpebAha4q7zIXt/O6KwcHYEhV
         qwT9DIp3oApxmv62u98bIOVz/RXwCOgp0orbsgZJxN5Ck1i2TLcawSj8V28hnUymMdKM
         fH0A75k/Nyk2IKhFihdsIC+UbKZZgCogdiIDtgfN8g53MaAz5tKfAHqkz9Sv/9LIP/7B
         JYMXADrthpM4dAIUIP34HSPR7i32gwRMXDV9SZHGrOlnzfO18EQRJQcbuMPQTljuKDan
         dq+F0Ddnh/iinRzzOnObKaKQcaeLKSntu1xqbDdPx52BhspAeGCTTn0WNsQu2zc3rCmA
         3vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696404008; x=1697008808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4ZgBmHteA4wHsLrCFexpXA7K7drP5ZEJIQkSB/aVxY=;
        b=cu/XFggegpQpgaTKZV9SdZt6me4Mw0zwKVcxsR5YWCrwxdB2t4BLgaE27sZoFiG5qO
         iWCjvdax/Ua4QgiklmVBVjIIfgiKt3hVVxnAuNZmhrbMZXIIDBTcvwXskOvHlPAqXBBR
         dZ+FCU1ps0Zm3vmNenY8OMRfq1APJmsiUxXJok3rM4gTjiB1ZuZCXzIcPiv1ImrA8qzt
         CMoJufghn66fbyuxkcQ25HDvrSp3MNXjTORwILMHC/OlikrvjJHbpzAuZX2xhw3+GxML
         AnMtf/JemgrLoOClvdRmKwqd669vqAvUZbSdo2XdVJ1UG0Af6HFG4Z2Kf/P3yPCa1kia
         E34A==
X-Gm-Message-State: AOJu0Yym73rF0lq/5UNKry8GVIk3wR6ndzBJJC2hfkhHFZM8/n6nxk3b
        cJ6SMhnqFEtlAqOkRqy/wLZUJldDodUzXpqYMm5ul11i7QaVtgZTCtbJCCr3g0Bfb4IndMlvd4z
        F/X8zCDgexaLydNtSk+v1cSUl6gs4RykauBVWnaT+y0GcxyxzUXYOn9FT2THa9vRNxxUcMpeQ72
        CJuQ==
X-Google-Smtp-Source: AGHT+IHjaQnPJiOBXT2srG6qiWyWozTCOtRExhfL43SYkbnCTGkV0QlIu7hyxYuUdHGNL7GoroyFCw==
X-Received: by 2002:a17:906:259:b0:9ad:c763:c3fd with SMTP id 25-20020a170906025900b009adc763c3fdmr1282878ejl.28.1696404007907;
        Wed, 04 Oct 2023 00:20:07 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id h14-20020a170906590e00b0099e12a49c8fsm2295468ejq.173.2023.10.04.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:20:07 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     <linux-media@vger.kernel.org>
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v5 5/8] media: v4l: ctrls: Add user control base for mlx7502x
Date:   Wed,  4 Oct 2023 10:19:44 +0300
Message-Id: <825edc1f9ed194a8478ca1432edd9a26c7a11934.1696347109.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1696347109.git.vkh@melexis.com>
References: <cover.1696347109.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control base for mlx7502x and reserve 16 controls.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 92b3957d5720..28af0b3e2240 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -204,6 +204,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ASPEED_BASE		(V4L2_CID_USER_BASE + 0x11a0)
 
+/*
+ * The base for Melexis ToF 7502x driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_MLX7502X_BASE		(V4L2_CID_USER_BASE + 0x11b0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
BR,
Volodymyr Kharuk

