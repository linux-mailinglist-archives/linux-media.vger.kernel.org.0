Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A907483032
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 12:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbiACLJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 06:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiACLJn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 06:09:43 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD90C061784
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 03:09:42 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id f5so134497751edq.6
        for <linux-media@vger.kernel.org>; Mon, 03 Jan 2022 03:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zklKn/bDTlrcVJ9rP836gkaxg/cLp9SeOEeQUV1jW1I=;
        b=SpplcWiNNfaD1JOA4nGpYghiaXLa/hLxkKFFooOFNIYq1jFpIqEzO+PjKZVqecoZ5C
         HYFkdTVDljvSEYjq112z3+puVJ5orv77QSxfb5EZn7d3hZr4Gz0XtnbAKVhItvfQb0pM
         Kh6h6BIRwudHYKYcE0tp4+8WQQPjyQN7X6bS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zklKn/bDTlrcVJ9rP836gkaxg/cLp9SeOEeQUV1jW1I=;
        b=YSpTV7Tj7nmwHpUwzCe4G9Eofcu1gTTPo0HVXYOWCXfloGUqoAxyF5B/mXFX5hNJBW
         e+fP+pCzUn4aUBWtKm8KZM9U6rQcMXphg3ysQPzyvPc5GDk6xhqKrV/uUorbh3PDBmOf
         BvAmOc0VvLBh1KJspxnfskOiw5rrusLBDFX3QS9M71dFumQT5WP+5jiC7EJYY1kqFn6l
         uf0Dr0OSlWnGBUegO1imY6277CIsKd2OkAeD3FYmAglsKVJ3DJ9cE0O7v57YlttFy+WJ
         AQBL0Bx7eOXG8BhFXXfaTnRNaYifEaP1ZAH9Rd4Wwkib5JnY4zhzy7MNsODNb5kyu2Ra
         LFVw==
X-Gm-Message-State: AOAM532b1S3caI9hxTK7/z4MYfQca4MV3cmHMCE8JZaH2RP8aqzqoLkA
        NZIaGWR0aaRzRDA1T0/TAuhfz8SPr/eBTQ==
X-Google-Smtp-Source: ABdhPJwTfmkb5dPv+Nq2WbHS/2jHGp1YWdaXp0SroOSV8YydZkFAsrQ7oVN1X259O/Ev95JHJIkgDw==
X-Received: by 2002:a17:907:3ea2:: with SMTP id hs34mr8374216ejc.403.1641208181109;
        Mon, 03 Jan 2022 03:09:41 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d17sm10536476ejd.217.2022.01.03.03.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 03:09:40 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 2/5] adds ovm6211 entry to Kconfig
Date:   Mon,  3 Jan 2022 13:09:19 +0200
Message-Id: <20220103110922.715065-3-petko.manolov@konsulko.com>
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
 drivers/staging/media/i2c/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 drivers/staging/media/i2c/Kconfig

diff --git a/drivers/staging/media/i2c/Kconfig b/drivers/staging/media/i2c/Kconfig
new file mode 100644
index 000000000000..2744f654121a
--- /dev/null
+++ b/drivers/staging/media/i2c/Kconfig
@@ -0,0 +1,9 @@
+config VIDEO_OVM6211
+	tristate "OmniVision OVM6211 sensor support"
+	depends on I2C && VIDEO_V4L2
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OVM6211 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ovm6211.
-- 
2.30.2

