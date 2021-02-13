Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBEC31AC77
	for <lists+linux-media@lfdr.de>; Sat, 13 Feb 2021 16:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBMPBX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Feb 2021 10:01:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhBMPBV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Feb 2021 10:01:21 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E0FC061756;
        Sat, 13 Feb 2021 07:00:41 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id v206so2524002qkb.3;
        Sat, 13 Feb 2021 07:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIUUYFhwbMMAja4Rk4pkOgG4BaFIznFFpqkpodYQj34=;
        b=pNRRH/NrXSvMgUprRqYIKgYnl9Pns0+TFG4sZBiyKW2dzlQacyilRE3pBQUUeu3r9p
         HIGnZlDdySotjPLv8oZskVKnCJ1u4U9erWQRnP/3LxWxZSUDlVLRA3wcnoAIqgVQArGg
         jZkKeePcB50f7RH7GlW3tDdwjBJ1Zaw68ljkeRpvDUyFfDvvvQ+Jm/vQHIae5o+a/6E1
         icuiUF+MYeNrynymocY/WZefbtrMo1qCCNo5ZtLvt0oHRBsA5U38ITieIcLViXqTIt0g
         moj6JTrBIKUvIFrfWYzZ5WB269deCtrYV04krnw7uT+GyY5SgMi5dyb8unfvhsCXpLAg
         s35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIUUYFhwbMMAja4Rk4pkOgG4BaFIznFFpqkpodYQj34=;
        b=hOnv7tcdVgcr/TH4P7DvFJnBsEXh07Tx5qtB8OoenMaSrvoofux31G2abwHmoERsoU
         1ClGip+6i+PNfZ2dXgNuGtvjZ8+6dTgIAb56CC7+JTsLjU42wHPRMEWt/Bnkj6po3eY7
         h8QeOgd/VJ1Djxq3yUkGLOpfK83+2sgl+s4fURdI/yCdeAa6rSrj5aAivfOX1vEi1REc
         ZeuON1ZUxFhF7XyfBbce4+lcvoMHn/0rWbHEh+1Gc5jOCxrlG7n4FNlFMhVw2VwIoKjD
         t3vt+SFud6SQg1lvxcgNX5Hg753RcLx1CRLrxSlN+gNq+hfKBtZCqxMBqVItCq6sybeA
         iAHQ==
X-Gm-Message-State: AOAM531ntsqU1d5kCvthB6FYUL/SGvvfsehl0y9UenYIZI89OxlDXuYW
        zgxZx/kMtMrtZj7EjEdBGAxKfpPa8EPe2tXs
X-Google-Smtp-Source: ABdhPJzDuo+RR41V9x6roCR5E8Id5v2UGcPFbhhTTa8NMqmexmLZkIrnqeXZd6klPDu4Fed0BpZiOg==
X-Received: by 2002:a05:620a:745:: with SMTP id i5mr7468110qki.321.1613228440708;
        Sat, 13 Feb 2021 07:00:40 -0800 (PST)
Received: from localhost.localdomain ([156.146.55.129])
        by smtp.gmail.com with ESMTPSA id p25sm1955273qkh.79.2021.02.13.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 07:00:40 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     awalls@md.metrocast.net, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] drivers/media/pci/cx18: Fix a spelling minimze to minimize in the file cx18-firmware.c
Date:   Sat, 13 Feb 2021 20:30:14 +0530
Message-Id: <20210213150014.1605602-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


s/minimze/minimize/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/media/pci/cx18/cx18-firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-firmware.c b/drivers/media/pci/cx18/cx18-firmware.c
index 876b96c11290..fdac310d7477 100644
--- a/drivers/media/pci/cx18/cx18-firmware.c
+++ b/drivers/media/pci/cx18/cx18-firmware.c
@@ -244,7 +244,7 @@ void cx18_init_power(struct cx18 *cx, int lowpwr)
 	 * an error of less than 0.13 ppm which is way, way better than any off
 	 * the shelf crystal will have for accuracy anyway.
 	 *
-	 * Below I aim to run the PLLs' VCOs near 400 MHz to minimze errors.
+	 * Below I aim to run the PLLs' VCOs near 400 MHz to minimize errors.
 	 *
 	 * Many thanks to Jeff Campbell and Mike Bradley for their extensive
 	 * investigation, experimentation, testing, and suggested solutions of
--
2.30.1

