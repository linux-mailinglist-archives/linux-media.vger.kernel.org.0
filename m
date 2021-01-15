Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D5B2F89A8
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 00:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbhAOX4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 18:56:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43060 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727782AbhAOX4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 18:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610754878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Xawz1GzWGC1J4p8x9iOjgOkyB6zixvv0cO2ZY7wH17o=;
        b=XobSpueTA2o5B1Hvit5+a3stlLZBiukWW94OwN5oIkEjLjCrSb5ls+rFR1kvcUxY7RX96U
        XZyRY9d0zdBmRpWn/S5/m+6bhz8lkGKIzAWXZZ3YvT9UUvCat37NeGSOkctDygE48vV2ga
        9twBwL3H+1TWPuX+evbXbapjRysMgr4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ZWLQkSEHNmevSNOSQjvmkA-1; Fri, 15 Jan 2021 18:54:36 -0500
X-MC-Unique: ZWLQkSEHNmevSNOSQjvmkA-1
Received: by mail-qv1-f72.google.com with SMTP id x17so9224431qvo.23
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 15:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xawz1GzWGC1J4p8x9iOjgOkyB6zixvv0cO2ZY7wH17o=;
        b=OL706gbrcNlYasBHDpncHeiyoCBgsGH9WgyThM/d0Ey3nHEL1akinAZBeqQD0k0Fnh
         vWXTiyXGM8ikpS649nW6P0YEaYd5r/G/lYbc0YXPDJCGmalwnCIFy7hK0y1en+ETt6aU
         7mhIiOPRCN7gyBfbzsG/9cAll2O3UNJB8wrb8EbAMJpgtxDwYMB6qyEKlHFXhCgaPHiT
         4UM7GQPbyUHGngK+huDes1qWR7gG/l/UIZu9n4plXa8qOInRKyy7dF0tI0p+G7O80Kl0
         KgspiEvNJiu4qJ1sc4kts/T3YBJAjpX1RfjlE2UyvtXEUCSi9SKkSrJ1s5GGPkUC/hyG
         9N3A==
X-Gm-Message-State: AOAM532wYEDFZHvt8X9Te1o7qS7pxT4sIVW1L2Whc3Qs1jH3a7VfyUfX
        LpAdE4uvVIxc9pi0srzJQWVovR/BVoSrrVL8382lkvDDJnHzKSG3+jlFwvahiTfL1QkHhfHCaKt
        1wl6pmoWMB/7f8pMkYT4YDGw=
X-Received: by 2002:a05:620a:909:: with SMTP id v9mr14767209qkv.435.1610754875423;
        Fri, 15 Jan 2021 15:54:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL7HYfnpoQgMUFZrafizcBstrGYOj0LBXF3RrdaUC8jM693qzhueNKRgKGV+rcmkOvoMB3YQ==
X-Received: by 2002:a05:620a:909:: with SMTP id v9mr14767193qkv.435.1610754875276;
        Fri, 15 Jan 2021 15:54:35 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id p15sm6111790qke.11.2021.01.15.15.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 15:54:34 -0800 (PST)
From:   trix@redhat.com
To:     a.hajda@samsung.com, mchehab@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] [media] s5p-mfc: remove definition of DEBUG
Date:   Fri, 15 Jan 2021 15:54:26 -0800
Message-Id: <20210115235426.290001-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Defining DEBUG should only be done in development.
So remove DEBUG.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_debug.h b/drivers/media/platform/s5p-mfc/s5p_mfc_debug.h
index 752bbe4fe48e..e7e696c08081 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_debug.h
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_debug.h
@@ -12,8 +12,6 @@
 #ifndef S5P_MFC_DEBUG_H_
 #define S5P_MFC_DEBUG_H_
 
-#define DEBUG
-
 #ifdef DEBUG
 extern int mfc_debug_level;
 
-- 
2.27.0

