Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 757CA712607
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 13:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242713AbjEZLxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 07:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjEZLxa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 07:53:30 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F01116
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 04:53:29 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so592833f8f.2
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685102007; x=1687694007;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JA3Z031EuYV7G9C1xFF3gOewbaEqhRavFGyCZzLQ4k0=;
        b=dp/JrIV318+le9Ak1KhpMRXxRp1rnWIJLBmLEngjbOuEFXT4n/tfxEQlpXoZQf5+Ln
         ztVO6WxXHSCwsa3wV3vCndy2xtRfhS8aeIYZyImCG5ZcKosXsH93mfIktYV+svbe3u9M
         0QOfrno/Z9EUL5/7CcO9cHMVQYr0ZcekO7zQmyinYcBuWGtHdyydXjZANFhnnro2Zdzg
         7a7Ea2B1bglkabSyU7GZTcEGLWGcYhL8bKaApIsakPFLQXmOI41NgyJqCS0lxkmMklbu
         0ji48BfrQiEq/DI7d8dEEJ1er+qpTWUQ0teWQeTJHs41oKkHPh7dsjHA0nE339frw0IF
         1Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685102007; x=1687694007;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JA3Z031EuYV7G9C1xFF3gOewbaEqhRavFGyCZzLQ4k0=;
        b=Of7Ds5ZDMJdMVWio+7VespI/z4BCzZem6Z5UPp7CmHoonh1RNRnqej2Mq2k/e8zSoc
         lwtm75MdshNxDF5v8qv281K2arUj3mQwLTSs9puUxlPwKsB7Nbm2OvEaBeJ1MDreufu0
         in1meW70/xNPr5v6PpsQeEXoV08gNf/EAEjIE1YTPdblnMhIygeNzsy14Iv0r+JtDn/E
         Vmd1za39XTZuNKkkcJRAU7H4Nok7qFfx0SxRKuS19pfAtWBr2omZNYI9PXD2zWbxci72
         H97f1SKMHckOMFmdDd28rcDxFVhSkqiQtEdH4rStEcIVTiFN2dXfarZQwgOfG8lclmgu
         i/JQ==
X-Gm-Message-State: AC+VfDz55Y1+2uXJ7bjvgeff/v1rEPi67NUVH1cBt+OIFpZ6qbQ7Pmz1
        vfnkZfiHMw1pZmBoK0gS42N9kaYBTXcAbN26Ld8=
X-Google-Smtp-Source: ACHHUZ5A65Cfn9A34sTFV6Uw0LxcLFBMzuZVTgqdX73nwws6y2XfvNz69/bHKDGYRGRa/4yegmQmpw==
X-Received: by 2002:a5d:6a44:0:b0:2dc:cad4:87b9 with SMTP id t4-20020a5d6a44000000b002dccad487b9mr1237941wrw.68.1685102007583;
        Fri, 26 May 2023 04:53:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u4-20020adfdd44000000b003063176ef09sm4924229wrm.6.2023.05.26.04.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 04:53:26 -0700 (PDT)
Date:   Fri, 26 May 2023 14:53:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: gmin_platform: fix out_len in
 gmin_get_config_dsm_var()
Message-ID: <26124bcd-8132-4483-9d67-225c87d424e8@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ideally, strlen(cur->string.pointer) and strlen(out) would be the same.
But this code is using strscpy() to avoid a potential buffer overflow.
So in the same way we should take the strlen() of the smaller string to
avoid a buffer overflow in the caller, gmin_get_var_int().

Fixes: 387041cda44e ("media: atomisp: improve sensor detection code to use _DSM table")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index c718a74ea70a..88d4499233b9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1357,7 +1357,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
 	dev_info(dev, "found _DSM entry for '%s': %s\n", var,
 		 cur->string.pointer);
 	strscpy(out, cur->string.pointer, *out_len);
-	*out_len = strlen(cur->string.pointer);
+	*out_len = strlen(out);
 
 	ACPI_FREE(obj);
 	return 0;
-- 
2.39.2

