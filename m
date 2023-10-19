Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9BBD7CF9BC
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 14:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345843AbjJSMyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 08:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345837AbjJSMxP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 08:53:15 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F441BE;
        Thu, 19 Oct 2023 05:52:49 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CE7096607375;
        Thu, 19 Oct 2023 13:52:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697719968;
        bh=k33G17zQJxCQXpWsnxb/MtZzvTjkhGFNRYE0Jo4tkpA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VONUCUoqT/ATgu3IKaEjzelgQyb6F/NtglliTKAUxRA5tnN8IolF9z5ApEeRtdkq6
         PTruK/vZXpFv9SYQcG4cNzScYL3+hjV4dXcidMUasl6Z93Wy5JQ5Q70Wl4H74HzFVj
         2cBjRq8u99KiTniZSVjiv1BK7Md1L7FdJyeChzRx3bXPGKTi+gpWRJYk1W0RzUTPEd
         yYfECioEMGMoUjdqiIBnvlnYVd0YwT1pUoRUaOuvUa6BJ5CtwLjVXGPlqmKN32QMqb
         n8RJNTjsgUsSh4hrzbPdvsfkcm1Xi5kHfanJ4O0ixmulPqLhGkII6+Y5kucXUarwkr
         5zKztEZyzFb7A==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: [PATCH v13 33/56] touchscreen: sur40: Stop direct calls to queue num_buffers field
Date:   Thu, 19 Oct 2023 14:51:59 +0200
Message-Id: <20231019125222.21370-34-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Henrik Rydberg <rydberg@bitmath.org>
---
 drivers/input/touchscreen/sur40.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 8ddb3f7d307a..e7d2a52169a0 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -847,9 +847,10 @@ static int sur40_queue_setup(struct vb2_queue *q,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct sur40_state *sur40 = vb2_get_drv_priv(q);
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
 
-	if (q->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - q->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < sur40->pix_fmt.sizeimage ? -EINVAL : 0;
-- 
2.39.2

