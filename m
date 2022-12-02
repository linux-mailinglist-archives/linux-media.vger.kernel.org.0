Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFAC640A3C
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 17:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbiLBQIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 11:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233655AbiLBQH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 11:07:56 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBE528E0F
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 08:07:55 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id fc4so5648779ejc.12
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 08:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvsEer0eAhZpCimLetQdww1a1gupEhutnU7stA4HzFo=;
        b=OKtWTp8C6nIg3GXI5R5gq+ANBZtmdXWni8JRe/qfw779uWYJ3q0g91ahXTyrG2f8bL
         iTMyrbV151bvklYGHuTkgb+h8wm8HPcqQBruQgofe0luex/0bl1l88MYBXVOWpnm0xis
         sWeiOB/kgclgFYLS1B7H97cnK64MzTEFvWMMl10NQOrmEcJvn9ffZZ9W9ytY89Gq4jKX
         AwJ7jKDNUdnrYYDRoPonKNlmgLqNn1ImQ+qDnBqKmIut8q08tIZMS1wRf8JFYL2wX5E7
         ycRpna0SCgX+v//TtXiXeGZIl0N9aLoMa0s0cVtgh8A5Gxn1cu44dtMPHpUwtzTBrMQm
         5zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvsEer0eAhZpCimLetQdww1a1gupEhutnU7stA4HzFo=;
        b=fIhGVORaaGqJlk8O33/cw3HvhtSxrrxLj57gtQgaO2/lmgFE2Zz2Jk0wfJVuaxhTAT
         qGNKoBgWlQ5cMsegTnzi1hPfrEBiHQl30IBtLdvJDShAsFupLt/Vwxg584GxbimTJkP3
         uI1UOIDZp6bEaIYlVRvOm2nFzqgSO6r9vN0JZvWo4lDiIAkRr/0HnP+hV6dqcHoN9/et
         3Z6NjwCi/IPklwpOaCEwGY0XZF3YRvKJ+hHUSbU6Ool62xCmCOZgnYVORugzUZ3PpeKx
         +FfU2gO1IFg7ZxSlv9N4HvmuqjfK4KG7fFkqACv9mprJaLVOtqkm/WNAriVmBpjTsRhV
         cvLg==
X-Gm-Message-State: ANoB5pmv3yrMZgRfTa8/yuf/Q0BEMFKx7pY/WZ3sb8+k/3hyN06jXpgW
        vCwyjfroJdag8hXzh0E95oJqAfIv7iAFp5tx20zfhx7sXtUKjye0hYy0dX1qMDNrCxbjBSvJjEm
        6sOd56Df8Kn13P+ALLNKaWnl8WMOPNTQoFoe7M/hEd8Ui4NNQ59eF3t6/LsNQIY07oabJq/EWu+
        c=
X-Google-Smtp-Source: AA0mqf4f7s7pwnjqaWkhQH/om/gsMHv3xW3C8DPWsxd1MIzQ838A1+QffNpSSaRz0jMYUpkeH0ZHQw==
X-Received: by 2002:a17:906:3505:b0:7c0:390:d35b with SMTP id r5-20020a170906350500b007c00390d35bmr20330512eja.570.1669997274417;
        Fri, 02 Dec 2022 08:07:54 -0800 (PST)
Received: from melexis ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id j9-20020a17090623e900b007bc30c06aa1sm3125006ejg.186.2022.12.02.08.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:07:53 -0800 (PST)
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
Subject: [PATCH v4 5/8] media: v4l: ctrls: Add user control base for mlx7502x
Date:   Fri,  2 Dec 2022 18:07:35 +0200
Message-Id: <c3e548ec7b64e79634195ed7b5ee5592682d471f.1669978791.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669978791.git.vkh@melexis.com>
References: <cover.1669978791.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
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
index 3a6b6231b6f7..02bb1dcf02f5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -238,6 +238,12 @@ enum v4l2_colorfx {
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

