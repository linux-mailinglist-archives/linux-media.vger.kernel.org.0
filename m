Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B9014A70C
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 16:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729442AbgA0PUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 10:20:04 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53758 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbgA0PUE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 10:20:04 -0500
Received: by mail-wm1-f67.google.com with SMTP id s10so3626740wmh.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2020 07:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=En0JbNAeh+yumfKq8CWnMC3jR47TxQKPk/LGIgV7R10=;
        b=aDOAbtc9h0S7iEJDuTx0Gg6OSiL6dZ/j+20HDGy+6zpvRgnGp/orQDlLvZlYPl4EM3
         gro5xii7lOJxQMc/GaxZModUzELMyTn6onXaqfpE0ybt+kNgXOqoqYvTEnzSAeFE2Fd4
         uH/ZgBbHvIQE2WuV/JjgBnzgC5ZpGevJJAVTwE17xB9Vb5q1kUOE4X5M3VUgcWHB+fwG
         SxW+jCXrshXWjFdGRN3yV5voBnP84okChqSdovF4uRUBOmUMzJdyhqfzhHs9WJb/E3P5
         2sFONZddu5RvLIzfU+h6P+W/ONk3x/fkMue5BGtH/ZLL4U+FOi243DvNFfmNSUdaTyEU
         KHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=En0JbNAeh+yumfKq8CWnMC3jR47TxQKPk/LGIgV7R10=;
        b=GJtixAdaaiO1EYrWs9xFIHoaBfJCUBXx0p6PIXw408B4EBpOqA+5ECPmnX5qJ7Focd
         J9EfZDEyqgVAU69OwWg+Y86UXYhOHPAAfSewWAyStyN6leqkwd1NdDvhVx/HaRtbZc4T
         SbWpLPzshO++bto5NFkyL7tzabuniMOlfQpPujB12PYyjI8X0fbF+5clpj/agU6/dz6f
         9mHN9Hb50TKj0WPrBSuCurVczlpPtTSHEzC7Q79NjB5DlITOaX49Zw+wwOcyO3gBwf1+
         QmvGmlX9tnxGalD+WaLVPBtX1/viAfqHWQWIRiDsJih8nnOK5WtxHeGYFNlJ5L4+pfI0
         NH7g==
X-Gm-Message-State: APjAAAVRIUofsI68SCAZSvgVJDmG4WgJa2ODiBevncaApTAoeK5/d3OL
        WO93V0ob1dsI9A8P/i2ll1zOow==
X-Google-Smtp-Source: APXvYqzpKOfTyFLY6VOq5KtGC62kLroh1Nc6zA17Lq0ZUvWCNZIVoSKCi6v+KZMY/0AYGVDAa4tGCQ==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr14547744wmi.107.1580138402052;
        Mon, 27 Jan 2020 07:20:02 -0800 (PST)
Received: from localhost.localdomain (195-132-149-87.rev.numericable.fr. [195.132.149.87])
        by smtp.gmail.com with ESMTPSA id d12sm21013531wrp.62.2020.01.27.07.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 07:20:01 -0800 (PST)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: fix OUTPUT buffer size configuration
Date:   Mon, 27 Jan 2020 16:19:53 +0100
Message-Id: <20200127151953.10592-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a bug currently where we always override the OUTPUT buffer size
in try_fmt to the default value (1M), preventing userspace from setting
a higher or lower size.

Now, only update the size in try_fmt if userspace passed 0.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---

Note: this patch depends on Neil's series:
media: meson: vdec: Add compliant H264 support
https://patchwork.kernel.org/cover/11336953/

 drivers/staging/media/meson/vdec/vdec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 1be67b122546..2f30945ce916 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -519,7 +519,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 	output_size = get_output_size(pixmp->width, pixmp->height);
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		pfmt[0].sizeimage = sess->src_buffer_size;
+		if (!pfmt[0].sizeimage)
+			pfmt[0].sizeimage = sess->src_buffer_size;
 		pfmt[0].bytesperline = 0;
 		pixmp->num_planes = 1;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
-- 
2.25.0

