Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DACDC611740
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbiJ1QPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbiJ1QOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:38 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B99D6DAE7
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:52 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id g12so7186531wrs.10
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsaHuu6Y31yjFurK0y6AWTkf6uxNbvk9C/GSLLGsJoc=;
        b=lGdWb/I3CcRP1R6nbFZoquN/vaBmUsCHG8k+FKX1zG81FcWlHFF4prnCYx5tOkVhlK
         3DG82AsnQg5r9qdUmAtg4eCKSKJTrFr/Vm6Jqa5CTgVFkxZp2TpwbTqP7JR6hZPr9cjH
         NdYd0NXtPaNmvMJ0iF0xf++KB2/MDIylUYzc9rPdhAzCi38FXSeA8EalvKMQUrOhUAHb
         bDlCW0ybEZFGu3mTgjYKAh+cP3aDIjW6EjKC+IwI+47MybJ862xLFrd3xyj36btyZ9pZ
         Fo/EmfT2D5paADKxPCn10DecJJfKILVcaL0j+7P70d2QOuXNDF2fzB2yrIWIU5xsUwp9
         hgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsaHuu6Y31yjFurK0y6AWTkf6uxNbvk9C/GSLLGsJoc=;
        b=0QnqVQustzvKq8Da4QtEMyhPLlZwJpkB2Qig+JNgt8SFCfYaDZZKPrzarzcgNgp/pu
         9Bt52Wprt8O/NElCeE5qcV941CLJgVBIjPBEfp0tT7Tu8JcRwmaBnTUk58sRy481l9Da
         Ktk0vwN7hkRepAdTdsYgT+Vb9QcvIgi2mCptiKSHtufZ6jZ6gLZcZ9A7TyyY+dFzRdvz
         tM60BpMlLqu8sFGZoTBQD7rJ1mcL6EQovXY8kXn6/v+eeQMC8/cT/SpIrCROP5ODWp05
         F6Ej/46RIlQyWQx+/aWUHe7TEtJGK7Jnga8bxEnp0cvySXNkBYxVt4Y70G4IEsHitRrE
         yg1w==
X-Gm-Message-State: ACrzQf3daeVYEzR9eLkpvu+DnCekQCPjDzcuElfexKMz1/syQtinEYzE
        Kdhu0ZaZ1Ac6aTE+iIEvzMFLZg==
X-Google-Smtp-Source: AMsMyM5CTX3ib6azI4ARgsJeoIct8cZyrvBaj4tzddS8VTJox46ZXuv47xqrr5aIlFCb+FfTTuXn3A==
X-Received: by 2002:a5d:5081:0:b0:236:75cc:be26 with SMTP id a1-20020a5d5081000000b0023675ccbe26mr63910wrt.379.1666973570754;
        Fri, 28 Oct 2022 09:12:50 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:50 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 07/16] media: i2c: ov9282: Reduce vblank_min values based on testing
Date:   Fri, 28 Oct 2022 17:08:53 +0100
Message-Id: <20221028160902.2696973-8-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The configured vblank_min setting of 151 (meaning VTS of
720 + 151 = 871) is far higher than the setting that works on
the sensor, and there are no obvious restrictions stated in the
datasheet.

Reduce the vblank_min to allow for faster frame rates.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 7e0b12b89655..35bc2b0438bc 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -262,7 +262,7 @@ static const struct ov9282_mode supported_modes[] = {
 		.height = 720,
 		.hblank = 250,
 		.vblank = 1022,
-		.vblank_min = 151,
+		.vblank_min = 41,
 		.vblank_max = 51540,
 		.link_freq_idx = 0,
 		.reg_list = {
-- 
2.34.1

