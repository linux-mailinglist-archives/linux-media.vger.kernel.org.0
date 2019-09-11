Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB826B0238
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 18:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbfIKQ46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 12:56:58 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38637 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729242AbfIKQ45 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 12:56:57 -0400
Received: by mail-qt1-f195.google.com with SMTP id b2so26100788qtq.5;
        Wed, 11 Sep 2019 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=XDbZC3bZF8XpaYb842hmO7yVtcVxNizf0TkhRdb4yTk=;
        b=rVV9XS/4n7H2anFF9L1lNCNAafr+hk0uEihHOz+hRzTLef7wnIA9vnzKj2/KkNQbqa
         9HnYOl9stj2kk070wkUJLbJq2j9PhpzQJ9fo04rtXMNi6F7IHTUFuoo/djNcyIR7CIBJ
         UVQbzGyVqks8MdZ/OH58a7xftUdt8/47KRCKyT44eTG6oUjys2NRz/wcOED0qmrn0S4H
         jmvt5HjzxuXiabL2lU4jXXlXcfwACrdgmTrjcklvnR/7N4kDuH+kdv2lS0z5YSAAK4nD
         GFtF6NyogU6UwBJRyeYGL80O5qmzLdHwXoydkd+3hukR1HKDdqVJStbvaaeKFjZOf0Qu
         ixUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=XDbZC3bZF8XpaYb842hmO7yVtcVxNizf0TkhRdb4yTk=;
        b=K9jpl5TY87Av9wfKPDzNzbdryc+HMFTCV76k4g873d10xmRX4VRHXfoo1JE9CUrJiv
         SZ3lrYaIDKPP5hWitPKhjuMq4dcz7BAvLUsWOJhFW91UnpidLbcBkRlrZixrWJKERkN+
         C6sM7Yyev6UDpb8gAGJrm4KiWS0bvBzaXvb0aklfi5dwEqlJfq4Kgoztff7b1szfGl1q
         0tY35ly7uQ1gtWnOwppdhCLU5qdGXTbS0zXVpZi85/KzUl7POqdGKR8rlAHUMantghw5
         wr68ZA05xItqb29jd4jwIBUkZGWsmOQxseG83/C+Ltohsb2DwkPZAFDOM4NCUnfGYkAr
         wrzw==
X-Gm-Message-State: APjAAAVCPo/zIrGZ6RR2ZQqRz7W4V5vlo72YhtYxFcGNqbRvzUcYAQhf
        i8D3NCu0VAspcbZanOZ8hCs=
X-Google-Smtp-Source: APXvYqxAf+YKCqdV0BFUy0qCOEjs4Yx9hU9Tt9M9uTLF5LH5uEZ3a8uBzOA/oLI8SwPl5DaRqi4aTg==
X-Received: by 2002:ac8:5353:: with SMTP id d19mr36361769qto.231.1568221017076;
        Wed, 11 Sep 2019 09:56:57 -0700 (PDT)
Received: from Debian.gxnx00eri1wudnlrc5f3ppaydc.bx.internal.cloudapp.net ([40.71.170.81])
        by smtp.gmail.com with ESMTPSA id m22sm9665103qkk.28.2019.09.11.09.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 09:56:56 -0700 (PDT)
Date:   Wed, 11 Sep 2019 16:56:55 +0000
From:   Amol Grover <frextrite@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: Fix alignment to match open parenthesis
Message-ID: <20190911165655.GA22041@Debian.gxnx00eri1wudnlrc5f3ppaydc.bx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CHECK: Alignment should match open parenthesis

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 367e39f5b382..773b3d6964cf 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -627,8 +627,8 @@ static int csi_idmac_start(struct csi_priv *priv)
 	}
 
 	priv->nfb4eof_irq = ipu_idmac_channel_irq(priv->ipu,
-						 priv->idmac_ch,
-						 IPU_IRQ_NFB4EOF);
+						  priv->idmac_ch,
+						  IPU_IRQ_NFB4EOF);
 	ret = devm_request_irq(priv->dev, priv->nfb4eof_irq,
 			       csi_idmac_nfb4eof_interrupt, 0,
 			       "imx-smfc-nfb4eof", priv);
@@ -1472,7 +1472,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 			imx_media_enum_mbus_format(&code, 0,
 						   CS_SEL_ANY, false);
 			*cc = imx_media_find_mbus_format(code,
-							CS_SEL_ANY, false);
+							 CS_SEL_ANY, false);
 			sdformat->format.code = (*cc)->codes[0];
 		}
 
-- 
2.20.1

