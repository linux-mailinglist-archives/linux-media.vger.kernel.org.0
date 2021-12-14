Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D213C47477F
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 17:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbhLNQS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 11:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbhLNQQ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 11:16:58 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07924C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:16:58 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id z8-20020a05600c220800b0034565e837b6so101168wml.1
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DMKsH1cCiElIcvlchVrud05bdBtUx8WxuBusFpvIlQ=;
        b=xty511YeuRTDMbnIO3IEz89SkP9HsC/N6v112nakzzwPZAEgplHV6cYWMBlRmVbNFD
         Hw9o23EQFloHp/o8WLnLIG8novQzwcegulCnIW9HO4iHXTwrNIjAFi1+WdrRLAUmw0o/
         iBVzL0UQN0KE8GZGl/kI2r0ltq4a5589tDlLl2gX+EIdiAcPEiDbZdsCp36tc0m5r6xA
         MRKh9sJx4fgRGTZBf7hh0N4CwZDx12GqMFoneAPR6StIRIwSLt30/JX+KZ+rabxlTmMi
         x31sQJJhVG+myeWdcppENgbBhOU9OmewYynqhvHtgw1d2kY1a0aTcyyw6UjiFvs+K6w3
         EEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DMKsH1cCiElIcvlchVrud05bdBtUx8WxuBusFpvIlQ=;
        b=IV3aC29msuInY2Jl3o+cClytR5haCtwa9CNrIOwJPScZnT45OshGGZiGTwlFE/RFqJ
         z0r7zmsvO929o9MIIlLU1emk0WlTIhnHnMW6VAleE+PUatCq6FpWpExHtBu0QfRm1D7G
         35WGYOhiARoC1ojrQc2XICR6NqFDB0tsGb/In5bmPYxuNyBzxkCmf3kTMlAm3b9ccqGF
         +sI16QC9Qo/im5Mql0qbPuJZk1dqrBN/IGwp5/ToI3shj7WLFf4RB6XB+LPV0UqK0HnA
         ARaDAOeh2gUIP7rI3D9XqjiDYQ2PtpZFgulw+2P/rlvaTJf09cDfW4jdf/W7+j9ZRaYu
         4C+w==
X-Gm-Message-State: AOAM533NM8Ub32e0vUiPSLz4MfIyjjGYxCYJWcbaZPx6BeL55bYI03xB
        vrC5Pk+fj4y5h6jgic70OHvYWA==
X-Google-Smtp-Source: ABdhPJxbC5ThkNwS+fn4bggjwWj1iTz5yWy2QITxtbnVLkM3XfCqpR8BEbecGTpn1TJ0uEhDwtG4dQ==
X-Received: by 2002:a7b:c257:: with SMTP id b23mr8287134wmj.67.1639498616631;
        Tue, 14 Dec 2021 08:16:56 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:51 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 13/18] staging: media: zoran: fix counting buffer in reserve
Date:   Tue, 14 Dec 2021 16:16:31 +0000
Message-Id: <20211214161636.1886900-14-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214161636.1886900-1-clabbe@baylibre.com>
References: <20211214161636.1886900-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After each capture, zoran driver complains that it remains some unused
buffer. This is due to a missing count handling.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 31993c266976..32d76876c683 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -887,6 +887,7 @@ int zr_set_buf(struct zoran *zr)
 		return -EINVAL;
 	}
 	list_del(&buf->queue);
+	zr->buf_in_reserve--;
 	spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
 
 	vbuf = &buf->vbuf;
-- 
2.32.0

