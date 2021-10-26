Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC7C43BAF8
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238936AbhJZThV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238871AbhJZTg7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:36:59 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4785C061234
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:30 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id o14so88424wra.12
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DMKsH1cCiElIcvlchVrud05bdBtUx8WxuBusFpvIlQ=;
        b=6CjYEZ3CK1EqlDI0t9dOdnu+cEXmTY48mhlJAD2Y6dEbYN3h17xoHRuCjK5us/YsyH
         zUoh1FykakIYHSs9TTp1cDHyhFdnW83GJ9SD05thlpOlTeXqu7NU801GNQSGOOLSIo30
         B4P4N7mCDYFFDLHgLcXeHpx7mMMN4eE2taQ9+hErGyWpQI1komcrm9HnTHge0jExbOXv
         3/Oji8Y7Int6PI/He22xbDcY6Fj/Xg5844j83Q2At/w/vXq08JEhY9+F3N9b+XkR5TcU
         UlzhncqYhjEvfp7KWC6ah+Th+2pRgQN1JH365RkEW58LQrstcYYD1KdZedGTZUcCt4Ss
         h9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DMKsH1cCiElIcvlchVrud05bdBtUx8WxuBusFpvIlQ=;
        b=doa+dU9DoICztcK6118jCAypETOKVI3BuNa45TNrNGcgkA0tx2AO3g+zL2k08GhWZf
         x9A4CSx+fJa+/eVjCg/qLuOHNP0LBVXEm1vgaudXoEx4FuNOSIsR4cv/F67MQaStXjxc
         ZVzhLRLzN/jqh9ONYPnLr7jiZDxANR2q1fZQYlhIwMQESSszVZ7Bcl2WaFhW+9VFXec0
         TnmYJ7JSs3kYPJzvj33aC7ZmuNVwWlsbjz+hiWyu1lgVcBTjTU1m8drOELu0zxujV0nk
         HXsEKjfxv44YEndQdsQyhZjyrglxnHFwEKn4o7fypPjULk9xnyAx8YxLRpfUSEM1P/Yz
         FGzg==
X-Gm-Message-State: AOAM533aJNhk2DQdiI/HxAyP8O/kmSFe7TeaGk7oKO/X7Z+IcH/YsHgY
        +JMEaW64joaDHeYFHx96VlUbig==
X-Google-Smtp-Source: ABdhPJwpDrxahnldZNraYy8KvooyJn1BfvcSwn+IV16qVBBvx/SeqaLGvIMJfKdV+KIXuJDy4wCttA==
X-Received: by 2002:a05:6000:15c6:: with SMTP id y6mr34034952wry.382.1635276869433;
        Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 13/14] staging: media: zoran: fix counting buffer in reserve
Date:   Tue, 26 Oct 2021 19:34:15 +0000
Message-Id: <20211026193416.1176797-14-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
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

