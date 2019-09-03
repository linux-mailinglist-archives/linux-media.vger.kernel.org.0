Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9E3CA745F
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbfICUNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:13 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33009 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbfICUNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:12 -0400
Received: by mail-lj1-f196.google.com with SMTP id a22so205297ljd.0;
        Tue, 03 Sep 2019 13:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qhHCXko5D/FCS0uQslLsv5tvuSiKAItzGjWfdeWXw6I=;
        b=EvNJLpofgvO4m6y+PySnbZ+7SQyxmQymiVN8fJ6z3LTeKYG16oA/P7fiYNwDAu0Y3Q
         Jqs4YfI3FqRyBD/nkNoPtWguZnon9RKzIFh1g1qQBS4FlFllb41SmSf8sKObVFqpQJ4D
         qQh+GAQM7IpVzEsxPl8ze3rAilGUKOaLQlCYYrNlRo7KCsUR6PWwHdK+diGr5qjaY6IY
         xF3wenpSHNzEwXRfZ7NxZ7KuTtoyQMcmt37fycyP9LpqS2jezn2TaN1naPjY8gTQO5KU
         76oeYndpIsV0dLBOMbn84M4WcU7PWhcD6Rdc7b5CfiWBB8KjCWa1tDNEpIZd08YW0djW
         WEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qhHCXko5D/FCS0uQslLsv5tvuSiKAItzGjWfdeWXw6I=;
        b=jqqChJbT1POgMLmzhoKDsQQRf3SDC9nDE6fkB63elPpuCZKpQqOREI83omTPjndwHk
         nF308gRZhjTyZRFdRX1zHhDHL8x07d7iV+3kpnVNQJctLUC7OGx/juTvTExLU2ClEj6Y
         6vfo8rrA3byCkcu1HSDFu5hslUbj+l1hKWmUJZepinOnrE+lf63VY1obkEP/U/hss8ht
         9BbUaRVtk7ChQz5Q08M/+Ka0xWcCFNuEZTft/2hmTeTLlR0BhzrxCCCtQ74SCKRlnsMf
         0xtEQdd2h8JpKgyRYvwWbGSNVkq3TjeDGUKUM3Z+6aei7fa6QB0ooy/08hXgOHnfX1o7
         qrpg==
X-Gm-Message-State: APjAAAVKtd0dWBm2pX2oo4kicpzYWJ8XCcNEF0Uy8Ma2AIUTiut8Cu86
        H7gK5vV7B6vCpKG8rYUK2Og=
X-Google-Smtp-Source: APXvYqwNCxdP71s5xubuBZhxVj9mM3/PA4BJO/4BFEUT6yEeRNQdLeV+FvXw8YL2i2wuoR9r8qll9A==
X-Received: by 2002:a2e:9c03:: with SMTP id s3mr12966228lji.109.1567541590101;
        Tue, 03 Sep 2019 13:13:10 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.13.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:13:09 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 9/9] media: ov6650: Fix stored crop rectangle not in sync with hardware
Date:   Tue,  3 Sep 2019 22:11:44 +0200
Message-Id: <20190903201144.13219-10-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903201144.13219-1-jmkrzyszt@gmail.com>
References: <20190903201144.13219-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver stores crop rectangle settings supposed to be in line with
hardware state in a device private structure.  Since the driver initial
submission, crop rectangle width and height settings are not updated
correctly when rectangle offset settings are applied on hardware.  If
an error occurs while the device is updated, the stored settings my no
longer reflect hardware state and consecutive calls to .get_selection()
as well as .get/set_fmt() may return incorrect information.  That in
turn may affect ability of a bridge device to use correct DMA transfer
settings if such incorrect informamtion on active frame format returned
by .get/set_fmt() is used.

Assuming a failed update of the device means its actual settings haven't
changed, update crop rectangle width and height settings stored in the
device private structure correctly while the rectangle offset is
successfully applied on hardware so the stored values always reflect
actual hardware state to the extent possible.

Fixes: 2f6e2404799a ("[media] SoC Camera: add driver for OV6650 sensor")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 126a662be301..16887049f0cd 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -491,6 +491,7 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 
 	ret = ov6650_reg_write(client, REG_HSTRT, sel->r.left >> 1);
 	if (!ret) {
+		priv->rect.width += priv->rect.left - sel->r.left;
 		priv->rect.left = sel->r.left;
 		ret = ov6650_reg_write(client, REG_HSTOP,
 				       (sel->r.left + sel->r.width) >> 1);
@@ -500,6 +501,7 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 		ret = ov6650_reg_write(client, REG_VSTRT, sel->r.top >> 1);
 	}
 	if (!ret) {
+		priv->rect.height += priv->rect.top - sel->r.top;
 		priv->rect.top = sel->r.top;
 		ret = ov6650_reg_write(client, REG_VSTOP,
 				       (sel->r.top + sel->r.height) >> 1);
-- 
2.21.0

