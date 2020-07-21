Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55F4228633
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 18:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730846AbgGUQnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 12:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730776AbgGUQmq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 12:42:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C15FC0619DB
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 09:42:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id 88so11573291wrh.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 09:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TVya3i2RYFmjDn+ApSCZmjqKSuYsjstrD5lmzrYcCv8=;
        b=cSQhe3GpFZLwDcOqe8hrwIBcCqhy1WXeYMuIdLJfCfWZeBQCDXPzn3pMxB1nazlOE/
         CVswu4QRfwLMmGkgIjLDb+7ABgpgobEgfnOJF108eU188HMAFiDMqHSw1O86PMZxaytv
         jnMG7es22SSHN5QWOamQFJi/CJb8wp5fyvtc10G4sgM5J06aQkF9/ZJ1vTR08HVDKixA
         GiMfdcdsnFiPPXBLQNg0Bfb3KkCk/6H5gBokXyKRP1b8xxrLEnj42rm923hcEK1MFw/g
         oapqloEgzSomASzZ08MYGCEk5YLYbGvntXakIiGl4DkBG/g/BeBfRMCfZmCJbZ2H8bdq
         CikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TVya3i2RYFmjDn+ApSCZmjqKSuYsjstrD5lmzrYcCv8=;
        b=m9QGegvZnt3zgMVS1BHfmBGMQhKC5WVyp9cNtGakHqz/YDJr+yjqf0z5L38tk1wxTp
         Zved6RA32UkvokAjJGGhAW3Ttn5DWWMZJ+4nYsWnFhq9Vr/xajHqoCcgxsa6h3jtLlcw
         doohGVSqNZEfWZcKoJlykMbHFTZj/6HFTOhzAecbfQxj/i6CQtUa6g7MBQ7SApJuDZ9R
         XnLqMGxq/B6dZYHQ1G/wTAVeHbLKK4dx4LM40tIMXyaKWRjgNOQCBI6Uw5RGgzr57vbL
         1t7niVjNqXIXO7MfbJcHi/c83OCa6qg9DHRNAWiSstGXBCIyDKetpynEGwgIzZ/99bPP
         1h0A==
X-Gm-Message-State: AOAM531MWoa17oIb1dy/sNzUVd4CaYvlWohvyoSXhskhx4Ec0374pIHr
        c2gVIZYdpNIFHMQOUBDSZrB5yQ==
X-Google-Smtp-Source: ABdhPJyYJSQbCGjzZ/HHRSdXd5WAJbAKCE0eLK46l5v37puMWdWQo3SYyslUvw9wc5pEwhmtZ1gg9w==
X-Received: by 2002:adf:9e8b:: with SMTP id a11mr4952074wrf.309.1595349765151;
        Tue, 21 Jul 2020 09:42:45 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id m4sm3933524wmi.48.2020.07.21.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 09:42:44 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     jejb@linux.ibm.com, martin.petersen@oracle.com
Cc:     linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 34/40] scsi: csiostor: csio_lnode: Demote kerneldoc that fails to meet the criteria
Date:   Tue, 21 Jul 2020 17:41:42 +0100
Message-Id: <20200721164148.2617584-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200721164148.2617584-1-lee.jones@linaro.org>
References: <20200721164148.2617584-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This matches some of the other headers in the file.

Fixes the following W=1 kernel build warning(s):

 drivers/scsi/csiostor/csio_lnode.c:2079: warning: Function parameter or member 'hw' not described in 'csio_lnode_init'
 drivers/scsi/csiostor/csio_lnode.c:2079: warning: Function parameter or member 'pln' not described in 'csio_lnode_init'

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/scsi/csiostor/csio_lnode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/csiostor/csio_lnode.c b/drivers/scsi/csiostor/csio_lnode.c
index 74ff8adc41f77..61cf54208451a 100644
--- a/drivers/scsi/csiostor/csio_lnode.c
+++ b/drivers/scsi/csiostor/csio_lnode.c
@@ -2068,10 +2068,9 @@ csio_ln_exit(struct csio_lnode *ln)
 	ln->fcfinfo = NULL;
 }
 
-/**
+/*
  * csio_lnode_init - Initialize the members of an lnode.
  * @ln:		lnode
- *
  */
 int
 csio_lnode_init(struct csio_lnode *ln, struct csio_hw *hw,
-- 
2.25.1

