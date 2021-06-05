Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A09939C4F8
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 04:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhFECLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 22:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhFECLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 22:11:05 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F49C061766;
        Fri,  4 Jun 2021 19:09:09 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id og14so11965983ejc.5;
        Fri, 04 Jun 2021 19:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lkNfGy1F0k5RDq7SvWZFsIErKoDT4IMXfAXGU4u+NcM=;
        b=C1YtPn7sDDgG+AcANfGdKZPHQMkCdfHqsy/0Pmo/EYYSiqDuT+ylyJkWym8CjuknVA
         TBhBKN/u8MhxcHEvYLWtD9iehYp3B5qaBttb67NPwUFqRydzZY/C7NjkEwuCfKT1lcCu
         mnT0HPrzjmSxFSRfNbUN3kjd5n7nhKpfIh5fUdXRFBH2Kv0NZeHBdBQ4tZ2XiLMWsaDm
         CvbXqglTQTgzUmWc645pfhBGNSuSZoULFCOnImCjbg6c8jq2xuiGzGlW/Gbnp+q88duy
         lhgBcJnWH53s3yCFxPB70AG/ZJ/5mcTApO4FUOUgXbwcvaQSMS9c/VoeuWVnXbgNuC2j
         SMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lkNfGy1F0k5RDq7SvWZFsIErKoDT4IMXfAXGU4u+NcM=;
        b=VwPiFd+iuorebBRNYJj6GdkIX1KP19k26slN56rSGBCakkaPuJ75WRH3EUwXgiU98N
         DPnCMVyAptHl3xljQtk5QovrajTbFz/t298qz8NdKr+Gr+JHggvvFuVyoMV60am2Ksyo
         VErUkORdpRAoL9dsEtQdnAyQmL497ew6IwRzCVtXP++Oj6KswCaFms/CbPKIgF2BO257
         dm65Hs2mYKDIIe3lLo4bmFQ/tI8xDkiyAOX5hNawBH5cDynI1Mmf4zn2TbWkHLUEmbK5
         qYLdzJWY7B8AsJNjIwQetqwOv7dq3WMJrvVtFQXEyASUc/8IJ4dHXi7OVrDb54KOWDB3
         M2qg==
X-Gm-Message-State: AOAM5336Zqwi2Tz1XjLy9ojfYj+3nZS1/xlpFBdR8MacSp1/M06IpUN2
        fjP3o6frnmXvwQUF1z4lfww=
X-Google-Smtp-Source: ABdhPJwvdsYRpYqsHonCA56Y8k350JpsKIxHU6vKvqoz24zXqCN1egvhUkXUXds68gyR7KSU5nfZlg==
X-Received: by 2002:a17:906:6c88:: with SMTP id s8mr7119605ejr.129.1622858947301;
        Fri, 04 Jun 2021 19:09:07 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id gz5sm3496232ejb.113.2021.06.04.19.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 19:09:07 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 2/2] staging: media: atomisp: pci: Remove unnecessary (void *) cast
Date:   Sat,  5 Jun 2021 04:08:55 +0200
Message-Id: <20210605020855.1065-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605020855.1065-1-fmdefrancesco@gmail.com>
References: <20210605020855.1065-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed an unnecessary (void *) cast for an argument passed to kfree().

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1 -> v2: Added this 2/2 patch.

 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 5301cc014c7e..e1a16a50e588 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -363,7 +363,7 @@ void sh_css_unload_firmware(void)
 		unsigned int i = 0;
 
 		for (i = 0; i < sh_css_num_binaries; i++) {
-			kfree((void *)fw_minibuffer[i].name);
+			kfree(fw_minibuffer[i].name);
 			kvfree(fw_minibuffer[i].buffer);
 		}
 		kfree(fw_minibuffer);
-- 
2.31.1

