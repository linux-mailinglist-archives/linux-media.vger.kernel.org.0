Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689F744818C
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 15:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238078AbhKHO07 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 09:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236155AbhKHO06 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 09:26:58 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A286C061570;
        Mon,  8 Nov 2021 06:24:14 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9739:1eb1:502d:a618])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 61C0F1F43C23;
        Mon,  8 Nov 2021 14:24:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636381452; bh=nKqM5NPAfcLvjTXmyKFDJodW1+r1jFSRTsjTciyPM4Y=;
        h=From:To:Cc:Subject:Date:From;
        b=PWmZ5BC7I/S2gqe8H2COAxr5GgYR0L9Yl/pNHlewyfu1ISZcL/wopgxCkkZ9buCgC
         SdeYtfCkLTaOabyFlYa9kqClBLTtW4+ahufZm/EfjVm5ka1Mnd9U7624WV8AujDuJQ
         +VrRUF34QyOyKsx/X+YzySh7kCkfLw8BH0J2+Es9smiK2i+IWJzx5nGe7uos6/CecW
         pVnK5xy2YcHXuAEIjQLumzohf4RTOyNy/oio3Qq6La4JQ1gGAD5ZLrCzpZaHTxy8wt
         5nESgsWp+L9vMHM0sccd+rVnA8bF6wW50V5bEuEosX9QNfnIktj6qxW68SfW5qEb3O
         jYcauS+Q1pVSw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: coda: Keep metas sync with hardware fifo
Date:   Mon,  8 Nov 2021 15:24:04 +0100
Message-Id: <20211108142404.598968-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After updating the output fifo position be sure that metas are also
synchronised with this position.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/coda/coda-bit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index c484c008ab02..28c56286b0de 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -2315,6 +2315,12 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 	/* Update kfifo out pointer from coda bitstream read pointer */
 	coda_kfifo_sync_from_device(ctx);
 
+	/*
+	 * After updating the read pointer, we need to check if
+	 * any metas are consumed and should be released.
+	 */
+	coda_decoder_drop_used_metas(ctx);
+
 	/*
 	 * in stream-end mode, the read pointer can overshoot the write pointer
 	 * by up to 512 bytes
-- 
2.30.2

