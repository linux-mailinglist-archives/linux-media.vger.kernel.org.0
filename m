Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D6A483034
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 12:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbiACLJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 06:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbiACLJn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 06:09:43 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D97FC061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 03:09:43 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id m21so135707077edc.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jan 2022 03:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BkllAYoHT1d4g58oaIBTjo78DyD65U3ROTueHEEQZhQ=;
        b=pmJHOrE6Wk4TQg0Hguk42xNnCXbZdzL+SLTUAw8f6Zy+ytihLZDItCBhYyAqFsvhZy
         a3TAHRsxTthm2FtwySEKMM4tNUsj3wFwBtwbOP3Om3hplZbGyS/dEjgD7/W1PuWAHe8x
         9WD6cI+j2RSTUMTHVMRwANp40WrQV2jBsifGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BkllAYoHT1d4g58oaIBTjo78DyD65U3ROTueHEEQZhQ=;
        b=fE9Ule+Qc2AM4ir9zJBUGCdJUtxprBiOUKjZZ3QlA9bpJohSQsX2tVfVJHPxOiglAs
         ODIOG5PcUDcJPpL/d+U+radu1sgf3f3w1tUiEHAGrQp3Ihplh/ds4hVELpwenJ0NtM4Z
         y1GXpQs/4ENP4eqR4f2hYmwowXmPZKejsD3cy+/ySaGkGGLeXqQbkWCsR26xEnZarLbZ
         7i/O9pkmvMjRTuA6AUSRufK4LrmIiUBnWW/3OzxyDs7GCksY0Hj0Uvn+hz6OMzKXty4w
         mwW7ACCNr7F/E1xyd1w/nhE47YI6xH8ygMS8QVYIwnxrn6lnrJtyQe57atTc3Vqxfzpz
         ryfw==
X-Gm-Message-State: AOAM531YcBeuvtQw21aKNTNwQneABWAXfU/sHVSmuLHJkSI4pSjgpJcR
        rODq/bWFo9/NfGwW+EJFhJkLrvvIwj2vgg==
X-Google-Smtp-Source: ABdhPJxDO10RFip0qaWctNfP8GGegMPB79xvZgztoLkH80zzVCR+1n6HHRIVceYZ/zt8jabjmC7saw==
X-Received: by 2002:a17:906:d109:: with SMTP id b9mr26119982ejz.113.1641208181843;
        Mon, 03 Jan 2022 03:09:41 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d17sm10536476ejd.217.2022.01.03.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 03:09:41 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 3/5] adds ovm6211 entry to Makefile
Date:   Mon,  3 Jan 2022 13:09:20 +0200
Message-Id: <20220103110922.715065-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220103110922.715065-1-petko.manolov@konsulko.com>
References: <20220103110922.715065-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/staging/media/i2c/Makefile | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 drivers/staging/media/i2c/Makefile

diff --git a/drivers/staging/media/i2c/Makefile b/drivers/staging/media/i2c/Makefile
new file mode 100644
index 000000000000..4d6f2956b3f1
--- /dev/null
+++ b/drivers/staging/media/i2c/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_VIDEO_OVM6211) += ovm6211.o
-- 
2.30.2

