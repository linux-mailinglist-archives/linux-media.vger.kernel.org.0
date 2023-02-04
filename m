Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403E968ABEA
	for <lists+linux-media@lfdr.de>; Sat,  4 Feb 2023 19:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbjBDSiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Feb 2023 13:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233341AbjBDSiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Feb 2023 13:38:16 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46280FF2B
        for <linux-media@vger.kernel.org>; Sat,  4 Feb 2023 10:38:07 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id r18so5705855pgr.12
        for <linux-media@vger.kernel.org>; Sat, 04 Feb 2023 10:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6fDEoGqTn4M8tHZIFak/NxShJ5D2bYMS4qSM2hAzrRQ=;
        b=gPsX29u+6kriPnFNHXQ1e+Z+/I63bv2w6/ABgZH6PBBl6Ug178ObJsqjlZR+GHOxoV
         kTylN00AhEPXcyIFFgtgfzTpNA4En+ozGHv9LMI1YOGpdhC5UM7pJ9zfvTpAL19p3byZ
         ezE6KFvnOBLoSI7ey7Nup0YODsYocZpPomsLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fDEoGqTn4M8tHZIFak/NxShJ5D2bYMS4qSM2hAzrRQ=;
        b=B0XzLE/BtMxReuo9nMBw43wdGMs8LzSXe3pYkx1nPQbeGfjrz0BN9KVcp3sQRwt6mH
         GWQ/RjOlas/+UGmf5pTnkrp3GPqoCRDnKanXtI1Z3SKcBEj+mpf3w1u+r7EsF3wEYYAE
         2z8EhLhVrDVcgKE2j0kCSp8h4LtNx4SrAbrNvSp7BupOYwRVE0AGDiG/OOCCWv+atXk6
         Ub1L1qkzT+fH3+mYmJmTaCv7Myjw7FbhDjZLMoIwlQGJ6ksWkD3w1aEdp/oE1N1QWsAS
         RU/pb7Lx+GGYiiRVYBarLp3r5YGqlc4ZKEyoiO3IPcopsGWrldnHpK7GA2KZho2LYUPZ
         oAFA==
X-Gm-Message-State: AO0yUKX275+K+9fiKS9O4G6XFGOuxH2Z0Aj8NS0X0odJxZRfU+K6iAgy
        WltEwNAD9X7fmt/Byme18M9/cJAJdhXjYs1c
X-Google-Smtp-Source: AK7set/YwlYdPW9UR6iirzqFGCC+oasO3yFZNKKqhLyFcV6lta+B7jP4xC0KNsA8c1d9As00zaQPKA==
X-Received: by 2002:aa7:8701:0:b0:58b:9b4e:5292 with SMTP id b1-20020aa78701000000b0058b9b4e5292mr13025644pfo.1.1675535886797;
        Sat, 04 Feb 2023 10:38:06 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z15-20020aa791cf000000b00590163e1762sm3979816pfa.200.2023.02.04.10.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 10:38:06 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>
Cc:     Kees Cook <keescook@chromium.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] media: imx-jpeg: Bounds check sizeimage access
Date:   Sat,  4 Feb 2023 10:38:05 -0800
Message-Id: <20230204183804.never.323-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943; h=from:subject:message-id; bh=cx0RiADq3LjGuiWTOC0bT+NjFFTCm0y7hhXMpuGSqv8=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBj3qYNwcQ/e0FqMS6Rrx8FnRGnlvv6r+1Bz4HWM3lI nwqMzPmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY96mDQAKCRCJcvTf3G3AJv3AD/ 4k1pyNCwKZi7tUqcOkxzyqcYyWpX34w9TA4RgopSZJ5MlLymvNsUczPaSyadAoIvjQs2fCrV2x3UBV OyNOyFqXUPt581nnkWgYWDUDD6CefqdHe9PVz/Kw0h9lMKC4jCbekeZujCZl9jXTFXl+1MpogBMxX3 f/VuYZwmb/lF05db6XrfbCi/YruJ6XiobUx2inB/WRJrcyP+VbmY4aFw3r6sWSLZ9y713h+UyRh9CV R8uiUMaHMPtxNZwD4hJPXScLJu7iupyNYXJzUcHrGfq2gBy2mK0Nqd3jE6AvoeDy1LZDViE44tTlAb 2nM5LxJ2mLj9V21I8aN4b+t5LRo8dSBuq5DYQ/+ANwDzS7DP6ZZN9N+kxpU4rXdE9J6Ly4UcG8Jv1j pqjvuidV8hiRP4aQu+IxWNBZRLmSkMi/lq8LDOyFAvY8x0+Q+dmoizJ27uauafkNA3f2FvhUdS6BTf TvZRjHYhxUc8kGlDDsSiKiU6W8dM+lGGlNNHajUpvMTlCphTc9fLjv/95ALIr+nQQzN42OP6vnAR/L VtkKR+CrbAx9Eg94pEb2koT+KumkLQs5lpPxaF36DR6pkZFKbyx1MA+L2AByvzIxpSNzCx1nqh0haT CnyjBc0NiEV+ZZz//IxW12G4rjmiQetmJ2YLdThPzjozsa4PY6iAAZVEy9uQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The call of mxc_jpeg_get_plane_size() from mxc_jpeg_dec_irq() sets
plane_no argument to 1. The compiler sees that it's possible to end up
with an access beyond the bounds of sizeimage, if mem_planes was too
large:

        if (plane_no >= fmt->mem_planes)        // mem_planes = 2+
                return 0;

        if (fmt->mem_planes == fmt->comp_planes) // comp_planes != mem_planes
                return q_data->sizeimage[plane_no];

        if (plane_no < fmt->mem_planes - 1)     // mem_planes = 2
                return q_data->sizeimage[plane_no];

comp_planes == 0 or 1 is safe. comp_planes > 2 would be out of bounds.

(This isn't currently possible given the contents of mxc_formats, though.)

Silence the warning by bounds checking comp_planes for future
robustness. Seen with GCC 13:

In function 'mxc_jpeg_get_plane_size',
    inlined from 'mxc_jpeg_dec_irq' at ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:729:14:
../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:641:42: warning: array subscript 2 is above array bounds of 'u32[2]' {aka 'unsigned int[2]'} [-Warray-bounds=]
  641 |                 size += q_data->sizeimage[i];
      |                         ~~~~~~~~~~~~~~~~~^~~
In file included from ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h:112,
                 from ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:63:
../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h: In function 'mxc_jpeg_dec_irq':
../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h:84:41: note: while referencing 'sizeimage'
   84 |         u32                             sizeimage[MXC_JPEG_MAX_PLANES];
      |                                         ^~~~~~~~~

Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 6cd015a35f7c..ac44bf23953a 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -637,6 +637,11 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
 		return q_data->sizeimage[plane_no];
 
 	size = q_data->sizeimage[fmt->mem_planes - 1];
+
+	/* Should be impossible given mxc_formats. */
+	if (WARN_ON_ONCE(fmt->comp_planes > ARRAY_SIZE(q_data->sizeimage)))
+		return size;
+
 	for (i = fmt->mem_planes; i < fmt->comp_planes; i++)
 		size += q_data->sizeimage[i];
 
-- 
2.34.1

