Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1365731411
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 19:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfEaRpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 13:45:23 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34283 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfEaRpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 13:45:23 -0400
Received: by mail-qk1-f193.google.com with SMTP id t64so6847985qkh.1
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 10:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VB3zl1B/8/7HsGS2Ke7GXMR2Fdc2kY6m17qfQPTjjfc=;
        b=gj4f1V6q/TOzWP3gLLzhPxaYgkZXEb/dEQsU7QeVvAQYdjceLpPa+wc+KGEdep7sya
         Irw4fa2/SVXojwsbYrN1mF1WA1aXriNVpc3v0FYe/S2Fe8g3AyiDOGAqALtxyvIsH3h1
         NZdxO3YQm1MdlsWLtfYN4iIKe43tX1cfWZcADAyWwtOiEKAPH3yegDLa4XjH2iU0a+jl
         s4Uz56pRYe5BHfxjFmufpxhyDMJVSBZFfIpQFydZtD1jQz6pzBBFTb70W8f6U1lfn2y/
         lAiVjDExiPTzwu5riDIxaH3qi04u+oXGJcjoNf2TYQ6C9Hdp7uyzn0awn+EjiWNAEHfy
         az7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VB3zl1B/8/7HsGS2Ke7GXMR2Fdc2kY6m17qfQPTjjfc=;
        b=IB01CppTdIf2JdJfqyH1MxQOdkK4ogOLHVAoov4UxbhqvaEo2XVuMEx992a9qbby4a
         neBBQF6q9ir2wKM0tEm6qeGY7LRPQV3O3bTB9sW/Dsw8HLYB3ZH6xUPlq6ybCGvxIpJS
         /8U9ckAMzZ64BpJ3lpKBaFhRDJDxg5yKuZDowdOC0d6MwTz5GYeEkF3OvktNuNt1/lAP
         K0AUFGJrp3n8iaFL//sxOmtR6ysjaB1zPhv6QwGAQTCBsU3PU8ATI6MoJhp3+G1Toao4
         OVC45qCpQMV1v1o0jRQmHTD/Inrn+lcMzhHA+03p+hwNyn1q2GqPeJMPBuYKL5rCYVTE
         zuiA==
X-Gm-Message-State: APjAAAU5OTk/PNlYpXGUGDNr+c5EGlY++JIQ631RwZP38pYlmRgE5R/U
        Bilv0ZUTazC7bs5Fj/uv8Um50aOi
X-Google-Smtp-Source: APXvYqwlyPg1H+CGQceKbCE72kqety4amRHI47CA5Bzav+qcXap+fiXKRSKmmDX4WktBVr6NBttlLQ==
X-Received: by 2002:a37:a643:: with SMTP id p64mr9748333qke.36.1559324722585;
        Fri, 31 May 2019 10:45:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id f129sm3184879qkj.47.2019.05.31.10.45.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 10:45:21 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rmfrfs@gmail.com, p.zabel@pengutronix.de, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] media: imx7-mipi-csis: Remove extra blank line
Date:   Fri, 31 May 2019 14:45:06 -0300
Message-Id: <20190531174506.13251-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531174506.13251-1-festevam@gmail.com>
References: <20190531174506.13251-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Checkpatch reports an extra blank line, so remove such unneeded
line.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index acc9936dd075..d1cdf011c8f1 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -902,7 +902,6 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 	return ret;
 }
 
-
 static int mipi_csis_dump_regs_show(struct seq_file *m, void *private)
 {
 	struct csi_state *state = m->private;
-- 
2.17.1

