Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EC62790B6
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730137AbgIYSfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729786AbgIYSfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:35:02 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32170C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:02 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 7so3290747pgm.11
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8DXOPb+jTf2cbBsna6JXYcV55+pAg5o8NJIMoaN+E0U=;
        b=iZMatHbTlnWwQFUCuHa2FnrmdgaH1hw1G64umh+eTwQ3LxWGm4FIWkdEDQhrHe0vRr
         ld335C/3baqnKmy9YEtq6FvnYGE+J0jgiXYugyouEM+SeJpY0IMp9rNOKkRR+aX5wguP
         j8Fu8GzkXN8qGF3GZ/8TJv5ILyMiMuMmXgnFM8NusvtVJEbaAbtr2YjEkRwGB/l58mMt
         fLWEJfFMeYs8xDzzHrRq1vr2gMBM74yQenbMF77ILelwbKA2oZlFw5S2onbz/YBu5uh5
         9ZHtEQmSCxHVBpQf70OeC3rmiSTdi0zjc8hIxYHsQy4Z96VGzCFSg/wX3K0bt3gwY75O
         c0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8DXOPb+jTf2cbBsna6JXYcV55+pAg5o8NJIMoaN+E0U=;
        b=dh7sHjv6MZ5/O9iuLE3YoH6Jrx9P5KaLtGnMycp8NL8J5IiC0/tEDYSCq7E61jVQDt
         SUgcbMdGFRclDYW0lNwETqhBcZw6AoBUMnyK/7iqq1BWfVpIIvyiHFDgfJjtlh8MJNu+
         Z5kLRmHueRfH4MWVsa/WeL5G+X3Ojbk0mI0ONhYBgrs/x9HIabkIrktKCBTkGIKJ6ebH
         nNgPGHph5ekA0bZRSaiYQqD2xzuByIWy2486tJz26jFbhlNfaPRuB7wZS/OxbOZuXgjQ
         j3NdcYWTekl0Kd13et4x4fs6P1s/mU6yBLEEaVlh+RSMWJru4DyP1rsY6luRM+C7nutv
         jndQ==
X-Gm-Message-State: AOAM531P9GoBD6AH8sPbbM3ygqRYoMAk+EZbU3xH+Uq7rSjhE/eBTWFE
        AL0y8cbtFLDU6vRx13GM343vAA==
X-Google-Smtp-Source: ABdhPJzI64IKVpL7ohgfGdyE+8dxaqUZw0OqzvbyRMs6pZcfZOFhDoqXfHbhNr2wU0FhdlrgrAWxlQ==
X-Received: by 2002:a63:c74e:: with SMTP id v14mr248177pgg.186.1601058901799;
        Fri, 25 Sep 2020 11:35:01 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.34.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:35:00 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 38/47] staging: media: zoran: device support only 32bit DMA address
Date:   Fri, 25 Sep 2020 18:30:48 +0000
Message-Id: <1601058657-14042-39-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The zoran device only supports 32bit DMA address.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index dbdb1c4b0515..0a193283eefc 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1111,6 +1111,12 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	int card_num;
 	const char *codec_name, *vfe_name;
 	unsigned int nr;
+	int err;
+
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (err)
+		return -ENODEV;
+	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	nr = zoran_num++;
 	if (nr >= BUZ_MAX) {
-- 
2.26.2

