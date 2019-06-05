Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78F3B36715
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 23:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfFEVyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 17:54:01 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:35332 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbfFEVx7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 17:53:59 -0400
Received: by mail-it1-f193.google.com with SMTP id n189so10947itd.0
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+MFyANsOfT2/dVaaB+yS4Zlbz3DsUe/iLn0n5jQfuhY=;
        b=c/+iPmc5OhjPBTC8fIGFRCsAv5tx4rbBrYosMDKZ8NdpwyG6jN+XuJWOsYqj/42nGI
         Fh9xT4wddK2o/2Z7qvXDX7pK1gLyHS5w7cmoEQGTCpDn40F4WkrLdMrKGI/EYYU4UmiN
         UJxeW6HmsjKDp99T3/4JaO4r86yGjtdQAsEK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+MFyANsOfT2/dVaaB+yS4Zlbz3DsUe/iLn0n5jQfuhY=;
        b=uTLxaACKfcvFd+x1r1KxfSszHwt3VpcWp5EodkAu3kjgbVsNCE9TwwaR958LYxlM7E
         0zCcqzMzmY9lbtCXH8N8zIDn1lufe8ZGG9tDespTm2NL2itHHTTtEr+0OWfaERT4Vl2m
         smps0ve+ItGzKKeEEBoaqxD7Pp3krF1zgPEVe4HFyMtd6Y2L0B/J+egJO03CJPalY1LU
         MYZTWOJ5dzYKNld61bHBKosdh468/Od0h15sb9yT+kCrWlzhaGDRFMrSXOPDRFlgmMYT
         i1NVMDu7tXIZOrPPkR0IBRIkqc/ZhTrnADr2bAsQvaNaEizTD9ar8Az+hFYVX4jhaGpp
         Mp6w==
X-Gm-Message-State: APjAAAWrRjYIPd1EkSHGPdunxZNNqmiOIqV50Pw2agBztejupZ1qxq9z
        xukipE2XLLTlqLnfPP44O31R0A==
X-Google-Smtp-Source: APXvYqxvQbbOCGSd5hhFsnMM4rfLypzKXLxd+LF3XfEkwiqqQQIsrXgSBq3EtDBtpnneODuE0ChWPg==
X-Received: by 2002:a24:4a13:: with SMTP id k19mr28902699itb.5.1559771633929;
        Wed, 05 Jun 2019 14:53:53 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e127sm37484ite.33.2019.06.05.14.53.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 14:53:53 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, ezequiel@collabora.com,
        paul.kocialkowski@bootlin.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: v4l2-core: Shifting signed 32-bit value by 31 bits error
Date:   Wed,  5 Jun 2019 15:53:47 -0600
Message-Id: <bac3ee3b10de409b6cdf7286e0e84737e63662ee.1559764506.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1559764506.git.skhan@linuxfoundation.org>
References: <cover.1559764506.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following cppcheck error:

Checking drivers/media/v4l2-core/v4l2-ioctl.c ...
[drivers/media/v4l2-core/v4l2-ioctl.c:1370]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6859bdac86fe..333e387bafeb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1364,7 +1364,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 					(char)((fmt->pixelformat >> 8) & 0x7f),
 					(char)((fmt->pixelformat >> 16) & 0x7f),
 					(char)((fmt->pixelformat >> 24) & 0x7f),
-					(fmt->pixelformat & (1 << 31)) ? "-BE" : "");
+					(fmt->pixelformat & BIT(31)) ? "-BE" : "");
 			break;
 		}
 	}
-- 
2.17.1

