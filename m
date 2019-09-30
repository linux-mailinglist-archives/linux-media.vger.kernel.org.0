Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8271C2773
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 22:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbfI3U5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 16:57:00 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39213 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbfI3U5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 16:57:00 -0400
Received: by mail-wm1-f65.google.com with SMTP id v17so886457wml.4
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2019 13:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:from:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Zi3umXY8bU1XCNrXcBAW2t4v9e1DRxyR/5+aASqsAbM=;
        b=dyInIZ+eSdUXgRe0hNR1hgdKU26nXsWbyeNj0OdNj5qgXrxeDlpkuhDgb4rf1XDS6L
         H1yaITQ8lapi6TgoA2eboHJaBSkLs6HkVImoD/YpdyL80csAM6mpIy5+qCZ6QBT8lhH7
         mqLB48Utmpi3ml/yr+LqSdOoG1rxCb8pvRsNEdo6TjadIc+2I3zcIYabmT9baGvTcayH
         rXdDwwWxUTrc25bvS63MkkRICsFC65cQZTzz2dzPd6G5LT8uJXLLuBcVbsRmdYYxXc/W
         BL9gUQwoIN59fqI6PWx8vOw60vsKlJBVhSWvp1kXnXn8+IIh2M0XQMCRPSFXGJkpubcC
         7Hnw==
X-Gm-Message-State: APjAAAXZeawry5x8vPTpO3QTu635XFYfzB23P1VyCjC0KjzBONFk1Af8
        AuUww6AezjTLnnGyklYQ6cpU7sxV
X-Google-Smtp-Source: APXvYqzrpaZZT5CTrGG4kfuHfbK4rrlnQ67f6PjTZH9iV9HZxd2zO6KH6me5t46POmZlMNTiqBNiPg==
X-Received: by 2002:a1c:7519:: with SMTP id o25mr231080wmc.16.1569863632885;
        Mon, 30 Sep 2019 10:13:52 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0c1:1609:54:45db:20c6:d537? ([2620:10d:c092:200::1:c43d])
        by smtp.gmail.com with ESMTPSA id y186sm230154wmd.26.2019.09.30.10.13.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 10:13:52 -0700 (PDT)
Subject: [PATCH] edid-decode: Avoid division by zero
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
From:   Breno Leitao <leitao@debian.org>
Message-ID: <cc88ca6d-5608-5381-74b9-008c2a32afb3@debian.org>
Date:   Mon, 30 Sep 2019 18:13:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some weird monitors that returns invalid data, as zeroed
Horizontal/Vertical Active/Blanking.

This causes edid-decode to crash with a divsion by error exception. This
simple patch avoids so, checking for the divisor before proceeding.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 edid-decode.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/edid-decode.c b/edid-decode.c
index 7442f8a..4b2cef8 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -1022,6 +1022,17 @@ static int detailed_block(const unsigned char *x,
int in_extension)
 		break;
 	}

+	if ((ha + hbl) == 0 ||
+	    (va + vbl) == 0) {
+		printf("Invalid data. Refusing to continue.\n"
+		       "Horizontal Active %4d\n"
+		       "Horizontal Blanking %4d\n"
+		       "Vertical Active %4d\n"
+		       "Vertical Blanking %4d\n",
+		       ha, hbl, va, vbl);
+		return 0;
+	}
+
 	pixclk_khz = (x[0] + (x[1] << 8)) * 10;
 	refresh = (pixclk_khz * 1000) / ((ha + hbl) * (va + vbl));
 	printf("Detailed mode: Clock %.3f MHz, %d mm x %d mm\n"
-- 
2.17.1


