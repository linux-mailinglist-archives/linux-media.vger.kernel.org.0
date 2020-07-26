Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5CE22DD92
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 11:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgGZJNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 05:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZJNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 05:13:48 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77C4C0619D2;
        Sun, 26 Jul 2020 02:13:47 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id b9so6610963plx.6;
        Sun, 26 Jul 2020 02:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrDgYZhjs1dj+8x3jneSfgyJjO2u96etnTlFhv2uD5Q=;
        b=O8omzwuVaU5WpP5ANvYJmgdSo2734rVpHeVjVUNFCUEYHRy7brOubHlafXonDyCBDL
         K5tHSyY7aR8rZUuZlCCo1vPFpzVVRP9zNftg1RoKEN7PBDz6TyAyR6U1mWy5+CbEIvvi
         72nPZuecnR8KdRcywUa6/8uisBab0Mj74VHXP9VJPa8yrE5SjYEmKg0X7BkpUPHkSQJM
         UNhzpVvQV+8NQFbHbsQbHOYX7w3oMrqimIMDbJ2/dkmzGBYplpx98V/ABkdUKJlHzM3K
         tlLx7Ub0doH2ksikXDzGMB1mRljaMfM3phexXZELbUbIYIrD1L7C3R/bgpDmSLod+g0M
         mNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrDgYZhjs1dj+8x3jneSfgyJjO2u96etnTlFhv2uD5Q=;
        b=JMd/bIZMjw+YGb/4ViZrdnEOM1GNWQi9hFnm3PuEf+6/rHXLnQyDofLmuxx/DqfMKP
         TvCwK54FMI7gQEBKmI0E+/uzsyR2xR2JbmTaKVoKcnPs5GbuwsHOt7h4V8TrXtuvT4dX
         JvIUPL9W2HhHc2ToUQ/BCX9hu5PQyq3eB/XGmPa5n0lhQ6+EBLfDdezl69XA1It1EOkR
         PVtUqqRue6SzfpHj/5tagwckzfhJaR9Omd8OZCBvxWDd/FIyYHXw0ynd9Ggm2AzV0wsG
         dV9sN5OfrTxhfRFEik0XRUxocOi+IhUelJj2gjS72B1iqKs2dhZ5he15RenGjpVGp67H
         747w==
X-Gm-Message-State: AOAM530zU1y7Y57yEaoDxYmCsM7L+RS6vCJkwfD0ei2Ji7sAJOqG852X
        t8F4T+52gW8D9hij16sOkMs=
X-Google-Smtp-Source: ABdhPJxdkf2ND/mYSXvcgMk1H1J9dTstyoPN/OMg8rtJHrd4W0n49n/FZHLqpK4peSZGSxa3ir6Bng==
X-Received: by 2002:a17:902:c3ca:: with SMTP id j10mr15399183plj.171.1595754827175;
        Sun, 26 Jul 2020 02:13:47 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id a129sm1608215pfd.165.2020.07.26.02.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 02:13:46 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Subject: [PATCH v3 3/4] staging: media: atomisp: fix trailing statement of if
Date:   Sun, 26 Jul 2020 14:35:14 +0530
Message-Id: <20200726090512.20574-3-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
References: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

this patch fixes the error from checkpatch.pl which says that trailing statements after if keyword to be on next line

Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
---
v3: change patch subject prefix
v2: split patch into sequence of patches 
v1: fix all coding style issues in single patch

 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 988785ab6c95..2208453cbef0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -115,7 +115,8 @@ sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
 		return -EINVAL;
 
 	/* Special case: only one binary in fw */
-	if (!bi) bi = (const struct ia_css_fw_info *)fw;
+	if (!bi)
+		bi = (const struct ia_css_fw_info *)fw;
 
 	name = fw + bi->blob.prog_name_offset;
 	blob = (const unsigned char *)fw + bi->blob.offset;
-- 
2.25.1

