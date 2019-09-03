Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1347EA7466
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfICUN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:28 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37291 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbfICUNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:08 -0400
Received: by mail-lf1-f66.google.com with SMTP id w67so13940978lff.4;
        Tue, 03 Sep 2019 13:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nit08PqZRdOCZG6pI6hGmpbHfDHgVaB9FLstBMxcWsE=;
        b=UBpua2dsaeCTkowGWUzhbotSf4EFHYmqAUMUyTw5jk0QMXUyy+hS1GsYaJVkjKLNS8
         5tU4BsHpo+NRc1waBD6mOA8ytcOjF0gYv5tFIbJrS62A5MaovDd4mod/uMBPFeyyWbwQ
         Sqd/UyqO68RWv/XbBvAtjJ5vHk/EI2YWJKM2HSnpgab1ocjLKRPBacVyYeK5D/Rata8w
         VnJXJRyl80bJBYpSWpsFO0TcDAFIqAo5jxhPf+D4Jd4tGCWEkQFOOTzqrZ94Titbg0sG
         0Kb40lZrmmUkkmpSOGAHNtolERwor8jKPsLjRFah05dhe+x9W7xyYpBa/mi3r1n+VuEq
         SO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nit08PqZRdOCZG6pI6hGmpbHfDHgVaB9FLstBMxcWsE=;
        b=Jgm+omVEp2Lo+23dC0m3soHym2mhe4DP7tev7mOvK1GdRzTqPlt1nRB+wdjQrESlS+
         rSn2AjNVFAouOwDo1keuXihq9+GlfS+XvKDchDpCAADUouWvpP5yGEaAaeb9HMLnCYH0
         H048eyBbPLlFryuMsU8Xnr5xkm9YW6Sc4grS4BpF52KUBpQpiYiqFkjrd0sz9Q4S1USJ
         lcMnOWbWR4zwVb15EVXQhnY0zCU9miNtoMaDRPpQ8Mj5JDE7uWcKAgW7y5RAbzzwbwxF
         10INqNbDbsIPLlIxPtbIVZXljbwKHBzrxp9wybB08feJPn4S8mmPcTBk8D+aY7b2F8Z6
         cvBQ==
X-Gm-Message-State: APjAAAVtc0EtqsZXee9JbYBZEOP7m642i9iRgUu715ZTrxoT4BmD+Mrf
        ZHEsf1QtoKlaZxdWaNS9NXE=
X-Google-Smtp-Source: APXvYqyo0mbyM1XvJjVusOgSygXXjQdnWYW4jE8D0PEY5WIIf1kS+iNzjeK+ZhUVyCCTBvnk97MRVw==
X-Received: by 2002:ac2:43c5:: with SMTP id u5mr3839738lfl.47.1567541586184;
        Tue, 03 Sep 2019 13:13:06 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.13.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:13:05 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 6/9] media: ov6650: Fix .get_fmt() V4L2_SUBDEV_FORMAT_TRY support
Date:   Tue,  3 Sep 2019 22:11:41 +0200
Message-Id: <20190903201144.13219-7-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903201144.13219-1-jmkrzyszt@gmail.com>
References: <20190903201144.13219-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit da298c6d98d5 ("[media] v4l2: replace video op g_mbus_fmt by pad
op get_fmt") converted a former ov6650_g_fmt() video operation callback
to an ov6650_get_fmt() pad operation callback.  However, the converted
function disregards a format->which flag that pad operations should
obey and always returns active frame format settings.

That can be fixed by always responding to V4L2_SUBDEV_FORMAT_TRY with
-EINVAL, or providing the response from a pad config argument, likely
updated by a former user call to V4L2_SUBDEV_FORMAT_TRY .set_fmt().
Since implementation of the latter is trivial, go for it.

Fixes: da298c6d98d5 ("[media] v4l2: replace video op g_mbus_fmt by pad op get_fmt")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index fd608aebb68d..b62a238a83d0 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -525,10 +525,16 @@ static int ov6650_get_fmt(struct v4l2_subdev *sd,
 	*mf = ov6650_def_fmt;
 
 	/* update media bus format code and frame size */
-	mf->width	= priv->rect.width >> priv->half_scale;
-	mf->height	= priv->rect.height >> priv->half_scale;
-	mf->code	= priv->code;
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		mf->width = cfg->try_fmt.width;
+		mf->height = cfg->try_fmt.height;
+		mf->code = cfg->try_fmt.code;
 
+	} else {
+		mf->width = priv->rect.width >> priv->half_scale;
+		mf->height = priv->rect.height >> priv->half_scale;
+		mf->code = priv->code;
+	}
 	return 0;
 }
 
-- 
2.21.0

