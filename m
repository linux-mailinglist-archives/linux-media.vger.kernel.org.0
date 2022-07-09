Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD1956C7B0
	for <lists+linux-media@lfdr.de>; Sat,  9 Jul 2022 09:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiGIHbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jul 2022 03:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiGIHbO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jul 2022 03:31:14 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0046A9C1
        for <linux-media@vger.kernel.org>; Sat,  9 Jul 2022 00:31:13 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id j22so1113196ejs.2
        for <linux-media@vger.kernel.org>; Sat, 09 Jul 2022 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DkJh6K/gynycKlJ+AKKxc0fFpl6fhu5Jh+eT0rsme6s=;
        b=k8ulsJfM544DWa6loULmnoy61LP9WGL4U6hsYsNIWOZXhic5StElgfgOxOiZTM9JoL
         j93qYf3uGR1mpXL2OUNKJXy2LcIJTVn6TkRcv6c8hVnHa3ejsVYTTZtTJhjgp4JJD5Bs
         oxMlLg3JfGcdyETgkMH9aezsFVXwBCd5kuQxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DkJh6K/gynycKlJ+AKKxc0fFpl6fhu5Jh+eT0rsme6s=;
        b=ythtx0Gn9BT5sRkpnLVY0b+AWc24pDSTD9R5H+GrQQIMJCLiiw1NdS6AgVPl08XlmL
         eUmSp+CG0Fi3ab12SEoo86iANkQ42i2vUH2q5DL+Q0MC9Yn47JjS40Lt0vPxNcRIYaxM
         OV1mH3EwmGS5lSfHaCyoJlEx47Bc28zk1fwLc75Nay3U+1swiwQWYVQLFTvx8JSDbB29
         BiIz9OMcG/7MJSTnDLcOXiP0oLDlV/15E/FoclxjK9oDNzAlQez2Z1LDmtpfauCglaeK
         3t407qR61KA7Qtis9TXEFSjYi5ZXnIL4fncRPGv/+ZiyO/4A6MSn31RUeaLGClMqKzSg
         VpeA==
X-Gm-Message-State: AJIora9AJUQQ4u603kxbzXx8qf3aoOZL4Ag8KE+0Nrr5x13k+89weLQE
        uCTnUKXhYDZaDorZqgcNEJehRu+p0UlkXw==
X-Google-Smtp-Source: AGRyM1u8XQp1SNJkt0Zbmr+RkAO+a8YE25NrODr0PwPtctp4KQZYHfjC8Vss0a3sctuX9WF+S1mpfA==
X-Received: by 2002:a17:907:2c67:b0:72b:17ae:c721 with SMTP id ib7-20020a1709072c6700b0072b17aec721mr7528521ejc.557.1657351871586;
        Sat, 09 Jul 2022 00:31:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id f10-20020a05640214ca00b0043a09f6fc24sm520248edx.47.2022.07.09.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 00:31:11 -0700 (PDT)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 0/1] staging: media: imx: imx7-media-csi: Increase video mem limit
Date:   Sat,  9 Jul 2022 10:30:59 +0300
Message-Id: <20220709073100.158374-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
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

Some high resolution sensors require larger amounts of RAM than the default
IMX7_CSI_VIDEO_MEM_LIMIT value.  Increasing it to 512MB so IMX492 and such can
run in 8192x5556 mode.

Based on git://linuxtv.org/pinchartl/media.git tags/imx7-next-20220707

Petko Manolov (1):
  staging: media: imx: imx7-media-csi: Increase video mem limit

 drivers/staging/media/imx/imx7-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.30.2

