Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A868531AC89
	for <lists+linux-media@lfdr.de>; Sat, 13 Feb 2021 16:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhBMPOR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Feb 2021 10:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhBMPOQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Feb 2021 10:14:16 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DCFC061756;
        Sat, 13 Feb 2021 07:13:36 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id c5so1907812qth.2;
        Sat, 13 Feb 2021 07:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ocIx/G7/Jnzz+gEWsAtuPQ/Ye7m/wMJ05Oo10vMA7dI=;
        b=OeJYIHav0iGFcMtwvC5ofaqn8AIfHYl7tk3QlYwSSuZruY8K8okTBB8RPPnuT8XjP6
         pgjxKVg/kfYfpyAnAk520SAWNOrAGIy3PIdwF6ZyRBOx0KtDqThA3PEKm/qEESMwgOaa
         InoZQhkyKMF7m7ofDAfhFae3yuYA6s0dRrIWDicu5UNnEZ1w44+sbVKAXBg68g2ByLhH
         diT9ZJVYsmk9Wp70wCjMjxpn7SrNUddopSuSbQVCu+uLLhpGMsuEVxXQqetXtV3j0k0R
         oLhYJDhHV7344NMl9VZOg6Lw7EcSnITIG0p95oLxVLIupOiyaQ9MEEfDQQvtkktwgtPQ
         wkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ocIx/G7/Jnzz+gEWsAtuPQ/Ye7m/wMJ05Oo10vMA7dI=;
        b=HMv3qARqWLcoI5sEkWR2XoSiKWU+JPRc71AVxQdkK/AukTO3zN0g3NZDBuAMMmL3IS
         oqP7cbbngg4VqshgKrZbQNYIR3kyqWBJTiMo2nEtkhHR5+JryAweiITIrtT4MscJPkoZ
         SvQ1YIiKSGHnhNwOeAQNtGeoU306SfRZL4rJe+9x7CgVQNWoo/1XsykBSvRDycmL25R5
         8cZWj6lVZCalmXvOeEBW7vc2NvtuQx3WrI37bxilMSXb05yeMsML/b9kPAoMh/9TXwim
         /4YVbqJclvtL9nz0c/oaOtInyKNkHfG/tL4MmADfXcJaGJSz+kzWuxtTjLRp778Rj3Nw
         NRuA==
X-Gm-Message-State: AOAM5327kN7Lg+FIwQ2YTGk+9SFqR4DyJZ5+HY+Dihae1P4UfsoGdaz5
        EWwH6dt7vGBOES1IeQ5Yh6o=
X-Google-Smtp-Source: ABdhPJw7bh3XnZtC08JHxcx/It6Bn2rvm3HHF1zHZPDBI5fXDNm8uuQ8yjHZS63YJinLER3cxtrYBw==
X-Received: by 2002:ac8:661a:: with SMTP id c26mr6993424qtp.126.1613229215635;
        Sat, 13 Feb 2021 07:13:35 -0800 (PST)
Received: from localhost.localdomain ([156.146.55.129])
        by smtp.gmail.com with ESMTPSA id 80sm8266783qkj.128.2021.02.13.07.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 07:13:35 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     awalls@md.metrocast.net, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] drivers: media: pci: cx18: Spelling fix of minimze to minimize in the file cx18-av-audio.c
Date:   Sat, 13 Feb 2021 20:43:20 +0530
Message-Id: <20210213151320.1607665-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


s/minimze/minimize/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/media/pci/cx18/cx18-av-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-av-audio.c b/drivers/media/pci/cx18/cx18-av-audio.c
index ee2b802d2895..833baa934448 100644
--- a/drivers/media/pci/cx18/cx18-av-audio.c
+++ b/drivers/media/pci/cx18/cx18-av-audio.c
@@ -46,7 +46,7 @@ static int set_audclk_freq(struct cx18 *cx, u32 freq)
 	 * an error of less than 0.13 ppm which is way, way better than any off
 	 * the shelf crystal will have for accuracy anyway.
 	 *
-	 * Below I aim to run the PLLs' VCOs near 400 MHz to minimze error.
+	 * Below I aim to run the PLLs' VCOs near 400 MHz to minimize error.
 	 *
 	 * Many thanks to Jeff Campbell and Mike Bradley for their extensive
 	 * investigation, experimentation, testing, and suggested solutions of
--
2.30.1

