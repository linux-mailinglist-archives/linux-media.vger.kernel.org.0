Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7317CC658
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 16:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344276AbjJQOs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 10:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344220AbjJQOsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 10:48:24 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B051111;
        Tue, 17 Oct 2023 07:48:15 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 43F12660736E;
        Tue, 17 Oct 2023 15:48:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697554094;
        bh=7OP/lnsbD5MzPZ4L/gceSmxIzda3Ng9eLtu0phjni7k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SX47BSZBGXDJAl+hd+M3Pjc34xRzLFy24YoR5AdRaP6yg3ezZrcdlLcdlKlW7ZueX
         5KM0nBjHjUwKlaRInLkoKlfLZ7HIu8y4v/5SmimgLG8oB9QY5fXmvwevRQ5VSxt5Z2
         8C1qBMwSis4zQRO7d7zdP2BX77w7QnJXrpUHmV0KNX7Yy3y2zTpjtxVKWHpZyYww5Y
         9Q+8ROdCCxDYMgH44oBco8lBR+P7B4xWxfT5J52Pnbetd+M0QhgLH7anVprhPs/hN7
         5nwtiog0gPHw8FKkIqjY5TUY3XIFsJE5E5T1Ds+FqVUkOvy+AEtuLvJL9t+swy5M9N
         5PXq5ywZ/XTNA==
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
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v12 21/56] media: pci: dt3155: Remove useless check
Date:   Tue, 17 Oct 2023 16:47:21 +0200
Message-Id: <20231017144756.34719-22-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

min_buffers_needed is already set to 2 so remove this useless
check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/dt3155/dt3155.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 548156b199cc..d09cde2f6ee4 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -128,8 +128,6 @@ dt3155_queue_setup(struct vb2_queue *vq,
 	struct dt3155_priv *pd = vb2_get_drv_priv(vq);
 	unsigned size = pd->width * pd->height;
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
 	if (*num_planes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*num_planes = 1;
-- 
2.39.2

