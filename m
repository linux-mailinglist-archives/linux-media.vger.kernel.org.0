Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645693F9950
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 15:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241169AbhH0NCy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 09:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhH0NCy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 09:02:54 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC20C061757
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 06:02:05 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id b64so7172448qkg.0
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Icy42hBjHJKD15VqasMXIGICEEBU5ZU+E5t7W6Lur0=;
        b=CU20T8S/kEW4dfMXs5/YUVoJVGKqQbnup7+BbeLWOl13y8wQtnOzigIeiA8K7NP8NR
         HEKXP/vawID6TRCgIF7yslJMIrtotrpdNIFy0Dcy/ItW4MCxWViCR13JcvsZOwRU23SE
         Wh3bUwM+SN9RejpOft9UgML6Nnsz3pSpppmVZ2GvlV+908Myus38v1bC3sQvEI3x4JLI
         RRSWQCP4waUUF3ISebnfTWpz9u5CQv8IB6uLQq6ITBL3kzuo48yC6CYjcD7tdl8ouAyf
         cuGDD1m6DKYjlYYlimcRadvcqHTznrywmyq/TE/U2Nb23uPHV7NS+hrLzN0BsANtFBO7
         RkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Icy42hBjHJKD15VqasMXIGICEEBU5ZU+E5t7W6Lur0=;
        b=XQ1zkXAs2JCaSEG1sx/mpzwKS8bKR1WDsJqBUbe1huVUFYNPLnoapMtE5DdTddlm4q
         e2wMwg6zQzfx5+JY7c+bj3HYFC1GNvH+YamKNB/Oyu9VF7Lf+RQjLoZkuKlKvIRdhhyc
         v4YhOcdEkiGO/wjiDMvBSsh4t04u5kpngo6MCxv9IlAJS09pGj8N22C8jiAwhU6Klxei
         xxrV1809c8+s1X9lbvloOzq0AX5UhgZ0OWJyqspaW5KxVCJOOPM9FyC+cQQFQ8QWKaGR
         hCRW+byykxIZL+Shg5f0UaHM7/MSGBi+rJuUmRat0Qx1kZurlfgU4kJ2lVJHPKvVBJke
         wXag==
X-Gm-Message-State: AOAM533Q6Isz++rVGm8dXj67S1fjaqLY8cT0pX5bDZ/SIMsOQhbXnIHP
        RKJivvTN1sW8aScspIHe1/8=
X-Google-Smtp-Source: ABdhPJyZJAdb0xumrit5sNdDATaIX0pFhahzg+VNUHnWn5BFyTlthX5jde720WyXP26gXNbTMLknng==
X-Received: by 2002:a37:391:: with SMTP id 139mr8896855qkd.356.1630069324386;
        Fri, 27 Aug 2021 06:02:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:a04e:f46c:17c2:7e75])
        by smtp.gmail.com with ESMTPSA id v14sm4676346qkb.88.2021.08.27.06.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:02:03 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        jacopo+renesas@jmondi.org, morimoto.kuninori@renesas.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [RFC 2/3] media: tw9910: Allow the TW9990 to probe
Date:   Fri, 27 Aug 2021 10:01:49 -0300
Message-Id: <20210827130150.909695-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827130150.909695-1-festevam@gmail.com>
References: <20210827130150.909695-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the driver rejects to probe when the ID is
different from the TW9910 one.

Allow TW9990 to probe by allowing its ID too.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/tw9910.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index 04f3c2dbc1cc..0411b8ea9bda 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -859,7 +859,7 @@ static int tw9910_video_probe(struct i2c_client *client)
 	priv->revision = GET_REV(id);
 	id = GET_ID(id);
 
-	if (id != 0x0b || priv->revision > 0x01) {
+	if ((id != 0x0b && id != 0x00) || priv->revision > 0x01) {
 		dev_err(&client->dev, "Product ID error %x:%x\n",
 			id, priv->revision);
 		ret = -ENODEV;
-- 
2.25.1

