Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6222131E13
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 04:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgAGDnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 22:43:53 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36272 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGDnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 22:43:53 -0500
Received: by mail-pj1-f65.google.com with SMTP id n59so8637360pjb.1;
        Mon, 06 Jan 2020 19:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQ9/DC53GURoy8uPVJwwkeJi6XJeKnxIDYkVR0iQwQs=;
        b=vWBJFj7l6TMl4AOJKf5X9VW3UJTLj5KRhDpkjG/XRys7liNh2J8d1FbteOvt5wznSM
         4zJxH5dUoFjg3fs1CeOhYTcg4KPdDwWSYhF4WPJkik/Ujl97facgI/O+lkxRL1xWboSC
         UAZq0PlnNYZ8d3h+imgzHDEnNREGDJAZv+3jFLZdK8O27Mh1XECf3largM3JwDxXud/z
         wnRmX9QrDVakjRYa4mhYSMcZFT/wTRu5JYgwwzJLAfCT7XEs5+M6+iHQ25Jg2LjyYM+8
         3RiZ72+CCx7+vAhZOTp0pxO9fVIjgeK/JOdzXaSB9ESg778kwqpxf4nbPbHQpQ5iCzaK
         uvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=AQ9/DC53GURoy8uPVJwwkeJi6XJeKnxIDYkVR0iQwQs=;
        b=WIw/bVb+OvxwIiduAaFKV3LDbaz6AtuZNRFp820F3TQ/QqdD4tr6ot0ArzfvoZh8oq
         XTSea/9FieuUwHqcnqyHcXY9P2xPxeswnf5TkdL8A3HsFjRC0eBTgGVPqyayRZGWFWjS
         qKe9nuZYQEaAFZz17q57BP/xMlSWN8ZjgiOTMeJGL2zywBih407nODjNHHOsJi3iLPyr
         YvOPpkkcIslwI/fX8n7xVlQnWDlirWgXWmxyoaB5AzNtt3xRmbxl3MieOlZTQglDJIdh
         9Qm8gvl+LQ1yWw1EJd4G3PVD4cxSTh/vgoi0091El+n6MjIgVM1h8zTsSPVRQaAH/td3
         z6dg==
X-Gm-Message-State: APjAAAWOrCPCJ5zWbd+cEAWEOL9ZdQgnRn5CzM9NQ7AtJHyhtPg/Xfbn
        FutTXufk2ukPdSlOEMuUBT0=
X-Google-Smtp-Source: APXvYqzyIqucHdp6zdPgZQRg5EOXhTzApjHSoYm7Ljqb+UGqUCgE+VZlsH2fwIQxYxpGipFu2Gy0qQ==
X-Received: by 2002:a17:902:988f:: with SMTP id s15mr101569674plp.98.1578368632288;
        Mon, 06 Jan 2020 19:43:52 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id g10sm73455929pgh.35.2020.01.06.19.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 19:43:51 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] video: aspeed: Update copyright information
Date:   Tue,  7 Jan 2020 14:13:24 +1030
Message-Id: <20200107034324.38073-4-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107034324.38073-1-joel@jms.id.au>
References: <20200107034324.38073-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the preferred form for GPL2+, and add IBM and Intel as the authors.
The driver was initially upstreamed by Eddie from IBM, and has had major
contributions from Jae at Intel.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/media/platform/aspeed-video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index d70b893fd4cf..71e0dbdb37dc 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1,4 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2020 IBM Corp.
+// Copyright (c) 2019 Intel Corporation
 
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
-- 
2.24.1

