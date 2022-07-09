Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B21A856C7B1
	for <lists+linux-media@lfdr.de>; Sat,  9 Jul 2022 09:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiGIHbP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jul 2022 03:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiGIHbO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jul 2022 03:31:14 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE79B6A9D4
        for <linux-media@vger.kernel.org>; Sat,  9 Jul 2022 00:31:13 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a9so1093963ejf.6
        for <linux-media@vger.kernel.org>; Sat, 09 Jul 2022 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v1Lg+9/XLyPoErjbCXTlZNTBgRHWE5n41jAnUaep9yA=;
        b=cbOQHtSnLTkKwmrDf65LoSYzOub1rNfTby/ruAqdg3ll7P/QpnaC376zptLgjTHgW+
         PDMVuVysNtH16tXBiRye6OML+jiQg5O5htLoMoATrQ0wH1+T4a+Fwjp5vE6AXtZC1v4m
         BVays8iMzUPB445CjUe7QmhcNkJY6dGh97QTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v1Lg+9/XLyPoErjbCXTlZNTBgRHWE5n41jAnUaep9yA=;
        b=jXKV0Ip0CTVlf5uu//ApV75fPHAfr1x+J3RwWAVteEVKIPDTRYfDjhv/TE3nNZkZ45
         XpwXoD7sCkSlZWFybwGij8T1ZTZxSJG0gjC7dQfVgyHiX/aegMrSNpj3hFNCYkRDhFrt
         YRkftDoC2Y2XTWaszSb+lmjC4WCumNkDcKHQo8PNWe0g/+NcUMnrwjAptCyWbDZBrlba
         rrdHp3stIvtdoo2rUf7I9mqrc12FhwmrJGKv206p+JrF7XImNcj9ONUAlN+n9pIUnsqq
         RqqUQHw46UUqnq/00bktYKz61nOV7YMD/N0xiuewPK06MpKLGSZtWBfPc02EiyEvZXOb
         wCUw==
X-Gm-Message-State: AJIora++SL/H58CMFNU/+TjX19GtBnyw+b4AO7O2790J+lwl88+DfT+c
        +Zz51pRQLE5mHydM4uwKiWke6n1TmplnrA==
X-Google-Smtp-Source: AGRyM1tIiIKEyO/Fb50rK37RUFtp/IbXppTr9wUd1ffTZBu5xLN1heCEOjAIPbs/1ynhmaIvodTBhQ==
X-Received: by 2002:a17:906:84fa:b0:72b:3257:527b with SMTP id zp26-20020a17090684fa00b0072b3257527bmr3329817ejb.477.1657351872344;
        Sat, 09 Jul 2022 00:31:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id f10-20020a05640214ca00b0043a09f6fc24sm520248edx.47.2022.07.09.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 00:31:12 -0700 (PDT)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 1/1] staging: media: imx: imx7-media-csi: Increase video mem limit
Date:   Sat,  9 Jul 2022 10:31:00 +0300
Message-Id: <20220709073100.158374-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220709073100.158374-1-petko.manolov@konsulko.com>
References: <20220709073100.158374-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some high resolution (like Sony IMX492 47Mpix) sensors requre large amount space
for buffering.  64MB is far from sufficient so this patch increases the limit to
512MB.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 0066af8d111f..c62f893cd769 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -160,7 +160,7 @@
 
 #define IMX7_CSI_VIDEO_NAME		"imx-capture"
 /* In bytes, per queue */
-#define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_64M
+#define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_512M
 #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
 
 #define IMX7_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8
-- 
2.30.2

