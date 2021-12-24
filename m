Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F340A47ED5B
	for <lists+linux-media@lfdr.de>; Fri, 24 Dec 2021 09:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352089AbhLXIna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Dec 2021 03:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352080AbhLXIn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Dec 2021 03:43:29 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23045C061759
        for <linux-media@vger.kernel.org>; Fri, 24 Dec 2021 00:43:29 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id v25so7139532pge.2
        for <linux-media@vger.kernel.org>; Fri, 24 Dec 2021 00:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eVYg6vqK0bkjeQRhVKIbYAOnwHGxgaBimTUyzl5wfWU=;
        b=DSi9fT87X/aQ8j99LRzb46Wq1GH2EqAtDCrJVsAMspshyX9URQfBz6K+q5fJwVCHCb
         e46+U5RO2/BSYx742BVsAROr8Xn3nEPAx0d+GnFEf7cu5S+E+qbRxAEIaGb9HMSi/CPU
         3W2UEziHeqoFpnqAvvSCfeYnqfr1K91xIZC/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVYg6vqK0bkjeQRhVKIbYAOnwHGxgaBimTUyzl5wfWU=;
        b=gWcA/pZMdY2Z36Prapy2t1TztZvh1oXNKxrNkMnoOp6QAlPqOohnWsbh0F53uV7VQH
         C6aS8Ciz4y5LPF/2uP49YkSiSH/BPAtt1tlVX30SGJ/nWBoS6Fym3PGd53OSwQcSZLD3
         x4h38PmfDnSdyv2AthobbHnrv4oN+RT2liDxNc6LqUGIkjdugTZSnemZeQ3pg3Gm8kLJ
         kC8BVvkkfoVLrViy8l9CF+8ZUJqfBd2zsjphNys1eRjQGqy1Uy2EgyO8X5f0Te28e0Xt
         fFIsmfcjs2xfBe3Uw1mos8fgbdc0973EmH8ootS134i4SVzC+AhlojetHS6HaiXQMDCn
         PA6g==
X-Gm-Message-State: AOAM532Uv4jMzea9r7jsunHOKqPIpXo0VyPWeugiSKxkThjRsknq5usV
        zYGeiQiyeFbN/V0ZxTaADidnqQ==
X-Google-Smtp-Source: ABdhPJxZbbX4Ne8SBwTui1zct2EjoGavD3KorLUC07IOY5SGzG1gbt9det+g1w/jEAaZ0gxMh+oSgQ==
X-Received: by 2002:a05:6a00:15cb:b0:4ba:edb1:c03c with SMTP id o11-20020a056a0015cb00b004baedb1c03cmr5970245pfu.54.1640335408697;
        Fri, 24 Dec 2021 00:43:28 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fd40:cbd0:c42a:3c26])
        by smtp.gmail.com with ESMTPSA id p13sm436369pgl.23.2021.12.24.00.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 00:43:28 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFT 5/7] media: hantro: jpeg: Add COM segment to JPEG header to align image scan
Date:   Fri, 24 Dec 2021 16:42:46 +0800
Message-Id: <20211224084248.3070568-6-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20211224084248.3070568-1-wenst@chromium.org>
References: <20211224084248.3070568-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The JPEG header size is not 64-bit aligned. This makes the driver
require a bounce buffer for the encoded JPEG image scan output.

Add a COM (comment) segment to the JPEG header so that the header size
is a multiple of 64 bits. This will then allow dropping the use of the
bounce buffer, and instead have the hardware write out to the capture
buffer directly.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/hantro/hantro_jpeg.c | 3 +++
 drivers/staging/media/hantro/hantro_jpeg.h | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_jpeg.c b/drivers/staging/media/hantro/hantro_jpeg.c
index 7d4018bd6876..51e67e5cf86f 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.c
+++ b/drivers/staging/media/hantro/hantro_jpeg.c
@@ -247,6 +247,9 @@ static const unsigned char hantro_jpeg_header[JPEG_HEADER_SIZE] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 
+	/* COM */
+	0xff, 0xfe, 0x00, 0x03, 0x00,
+
 	/* SOS */
 	0xff, 0xda, 0x00, 0x0c, 0x03, 0x01, 0x00, 0x02,
 	0x11, 0x03, 0x11, 0x00, 0x3f, 0x00,
diff --git a/drivers/staging/media/hantro/hantro_jpeg.h b/drivers/staging/media/hantro/hantro_jpeg.h
index f33c492134e4..0b49d0b82caa 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.h
+++ b/drivers/staging/media/hantro/hantro_jpeg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 
-#define JPEG_HEADER_SIZE	619
+#define JPEG_HEADER_SIZE	624
 #define JPEG_QUANT_SIZE		64
 
 struct hantro_jpeg_ctx {
-- 
2.34.1.448.ga2b2bfdf31-goog

