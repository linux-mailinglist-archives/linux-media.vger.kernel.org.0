Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81422EB855
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 04:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbhAFDF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 22:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbhAFDF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 22:05:27 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0702C061357;
        Tue,  5 Jan 2021 19:05:02 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id z11so1438597qkj.7;
        Tue, 05 Jan 2021 19:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bAQRTpcE0bBbk84O+D0aHdAZGl9TgRNlPD0z6hqS3fA=;
        b=rRQCiBkacLhYaAcIUequ8V5qg0BGgkN3XK2heHfDYK/Iyp0HrfQX6KMtzU+hlIVn9l
         l7Cvtj+yxUQBcpEh7vzJgyUAT4IEmFBbKvzoq00LLUx9hUmRjDqnQN3IAHuh2Bsz8BY7
         0XWJTCoeOFdQDjd3UhTf+yadTrcWNodGDgtXMcldJiQJtlN4YmsYSqRJLzIOEg7sLkPO
         HdALWME8ol6IQuF6i5ZPYWAfFscPSpCafJfaYwQhB0ExGG9O5QXsGF8HbWiFsfdGRCaS
         E1rek/BxvZoJTAYcXjb34kdoiZOwv0QGqlShemGRS6AW9H2KYTFgaU9e5vEJ7i2rSrAo
         6PPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bAQRTpcE0bBbk84O+D0aHdAZGl9TgRNlPD0z6hqS3fA=;
        b=UnIdtlQPVfDZ8hJUQJKVLYyyI1QZ/fjd5HJ0fCBo/16Y9CUcfrsbIiVpoEDx01fLVC
         zmWAnDSdamSLgehup5zI8naJ3k4TgRItI4tjn5lnPneJPUKnzUegtDEUo3KoOwPDwJWp
         kccHV2PJqzKhvTpnR1tJJ1BwuvRofQ2b4x0nPW/SI7K+ylvY0qut5hbcsu2rkFgausV0
         bUEg5F7v5RWkLHbcD/JY+nnAGQ53jqn7SbvptLEiY8MJQr9m5iziYvw1iMY+VnPhaU5p
         lPQO+vL6lC9woKaN6iBluyt8hQgrn+hxpc1iY66oQQtprpkfA3HSCzNpDFggKrXSOwkd
         hiwQ==
X-Gm-Message-State: AOAM533tCepGcUWECEzSUpMaRqPeyOeUtOOv0YmiIh1oCmw89RjYe1Xb
        GO0aVGyicJOfm7CX1GNpnTM=
X-Google-Smtp-Source: ABdhPJwaE8CpXtIGHeZXNN4dGm3LTqFO8v45yl7BNIGgIyzmOWKbWaneY5QGFXBU8sTG6Jmc+GevDQ==
X-Received: by 2002:a37:8e06:: with SMTP id q6mr2642195qkd.402.1609902301928;
        Tue, 05 Jan 2021 19:05:01 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id n195sm730019qke.20.2021.01.05.19.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 19:05:01 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] media: vidtv: reinstate sysfs bind attrs
Date:   Wed,  6 Jan 2021 00:04:47 -0300
Message-Id: <20210106030449.3223172-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
References: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Reinstate sysfs bind attrs so that vidtv can be bound and unbound
via sysfs. This is useful for automated regression testing in
userspace.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index a2fa9b58174d..405e89f62b5a 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -571,7 +571,6 @@ static struct platform_device vidtv_bridge_dev = {
 static struct platform_driver vidtv_bridge_driver = {
 	.driver = {
 		.name                = "vidtv_bridge",
-		.suppress_bind_attrs = true,
 	},
 	.probe    = vidtv_bridge_probe,
 	.remove   = vidtv_bridge_remove,
-- 
2.30.0

