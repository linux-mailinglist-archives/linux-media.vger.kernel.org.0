Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173B9638D7A
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiKYPbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiKYPbx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:31:53 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9288C25E8A
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:31:52 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id vv4so11141785ejc.2
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7xutFDYfxv2Xy2TxGLikGVF5LOdRp8bJ3PZY3ODS4k=;
        b=XUPHLQeUPNtB1gOhP/tR9W79tQ1jjiAvTDwHuS2ilQDSOOymQZtrNII0uBGDV3PYWS
         RwWrZedwzNVCCxh4BJwV/lEHBmMyHyopIIqz1i4nzFsauP9RuPd87oTVJmGsvHf2Sjis
         ut43W9/yBNc6SMY7q8RfhvLSzWEX4La4n8yx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7xutFDYfxv2Xy2TxGLikGVF5LOdRp8bJ3PZY3ODS4k=;
        b=IATjhqnxV/fzS5T+dKtYGwwl9dHR6Dm0pHTAXKxL+DuoA0fJWH2rYPLyRdmkK7baNi
         Ezr37ojA2DcI6H94Wa1QAUDAP70WZs/sNiiauhj3YLrM2jLkYL2j3T4RDKUmN9svtQkQ
         9GFF1mp6xjEL+O+EsPbntCigx9R7sA7538yVyaAwEr6UIMFhz8b3RYtWSAA9/5WhONjK
         j3Xtxj6UtlrAGkod4enHlmjBadCNAy9QLZp+hLu4hLRW8zpW5yGAmsh1opKVI6a9AIy9
         Ii0nx6VRMsf9DRNB83SwBewDObbcnltVSS+0SAx9EF+MqDzrgx0BWp36gzLQKbrvoWCy
         DSfg==
X-Gm-Message-State: ANoB5pnVaWLcq9wtE5Lfv1vuZyONvLfbvyTYFwUpZuwcfDuVnjMAj7mo
        KmvavVrpD85/SOtQnPz5UXqKJXDSt7ywmQ==
X-Google-Smtp-Source: AA0mqf5ffyFmityByOs/JOCceWPfZw+kQuNw1EgBj+gAbhyZV3Zexcz82scNQqjBm9zmN9TJ+K6rSg==
X-Received: by 2002:a17:906:cf85:b0:78d:b66d:749f with SMTP id um5-20020a170906cf8500b0078db66d749fmr31106432ejb.566.1669390293850;
        Fri, 25 Nov 2022 07:31:33 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p10-20020aa7cc8a000000b0045b4b67156fsm1878435edt.45.2022.11.25.07.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:31:33 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 5/5] media: i2c: add imx492 entry for make
Date:   Fri, 25 Nov 2022 17:31:20 +0200
Message-Id: <20221125153120.541298-6-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125153120.541298-1-petko.manolov@konsulko.com>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
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

Make sure the driver gets compiled in case it is selected in Kconfig.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/media/i2c/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index ba28a8f8a07f..8cdad7e25e5e 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_VIDEO_IMX334) += imx334.o
 obj-$(CONFIG_VIDEO_IMX335) += imx335.o
 obj-$(CONFIG_VIDEO_IMX355) += imx355.o
 obj-$(CONFIG_VIDEO_IMX412) += imx412.o
+obj-$(CONFIG_VIDEO_IMX492) += imx492.o
 obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
 obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
-- 
2.30.2

