Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCB5483036
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 12:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbiACLJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 06:09:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232839AbiACLJp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 06:09:45 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E333C061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 03:09:45 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id f5so134498021edq.6
        for <linux-media@vger.kernel.org>; Mon, 03 Jan 2022 03:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tvc+uZInx3k8MrEByxSHttKZs3Fai2Uq5Zu34fIedjU=;
        b=C+LO2TTINblZtaJRMUeGDlxgIQInpkaP9iNDgWKAlP/JO71fzQvmcJzD08KzhuxBcM
         eixzdOZbNBxCEpwULKomhPa2hh7gZv1EgokRQyNeFvWz1HUNRNUjgzVSCmmXGTfXXCGC
         xqoRRZlTNjeJwg+4TjRk/+lMJvU0j7z/CelYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tvc+uZInx3k8MrEByxSHttKZs3Fai2Uq5Zu34fIedjU=;
        b=k9cqoMzPWV82+pRIoNukqlUTF7xwQmsOGM0d7IyT8s8AmHSzn2BzybT87DlyIY/6Xo
         BE7al9OL/6+v+dLfN4aMFz9UpZQTJUjZaXnwQ/k/dUVFw+1dgQWJj8JBEfcXqWH2vmM5
         d0YfJJsylje/eyBZcalzsdHxkM2RgHkjoe/hv0HQKwJEOhfNmpptp2+463KYxpRMRBKa
         t5bJHymzwLoEo8GJRIjDImONmLG50QjQ5FiWvsTXFPzfRBFzwh6hFYqYfMAjdG3VOrXK
         rLvWYejDQR/cV6FqXc58ipBxOWhNderUCOwd6y1uZtsvn+SZQS+81ft2b04ctnNZEa7k
         1ZvQ==
X-Gm-Message-State: AOAM530frpXZm0/jKWIe9q4udouQ70ryaBj+2yZx1X18Sqdd+9s9HMxI
        l+9gTy3KtKPKHSLrrm/ctJ8BJUcJa6iqFQ==
X-Google-Smtp-Source: ABdhPJwWv01oKtkPkMEXHtOI8XzpId1h7kmD3RvudsD+GmNLaHXDLnHC5LAMW3kCBsVIWNVcUHjoRA==
X-Received: by 2002:a17:907:3e22:: with SMTP id hp34mr37530673ejc.58.1641208183483;
        Mon, 03 Jan 2022 03:09:43 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d17sm10536476ejd.217.2022.01.03.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 03:09:43 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 5/5] adds i2c/ explicitly to Makefile
Date:   Mon,  3 Jan 2022 13:09:22 +0200
Message-Id: <20220103110922.715065-6-petko.manolov@konsulko.com>
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
 drivers/staging/media/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 7e2c86e3695d..338c08d2429a 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
+obj-y				+= i2c/
-- 
2.30.2

