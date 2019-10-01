Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D15AC30A4
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 11:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfJAJwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 05:52:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36967 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJAJwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 05:52:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id i1so14682078wro.4
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2019 02:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vLe2enHxujH2Lk94E+0koeBtfQOYvO88yxZLCGWMg84=;
        b=K3uxH9XzTQ4mU8oOFS3WIhCR7A6heg/sc0Z13RM/Vm5xnAoR8rEP77zrEkPFvZVfxX
         87SjJexBco9Tw0uqXCgPjxfGzYR5Xn60ktajpD2K4ttyr77IM46oa9W+D5nFQMgCpQaP
         S4oLGeWMPA2B0KXL+geP1aK4W4H2PhvtCPym4VSI7layQ2rxhuyWrMwXDsKEewkwY6do
         uPpwLIuZIYyrlJjvICvHKHvlCFkpfsVrZ6lnAbM/MhSLmQdhkk/OioGF1BRLJuiK+Hjq
         vmuwAxBDJyZtnfTWxcaZFz63qrOJHOJAwuFz2rVcO8BYJACVkOrAZrE9Yk+GTEARnzuv
         5WdA==
X-Gm-Message-State: APjAAAU6uBC9gyGGynDpiZMXFWKn8N6r6d5zcAY9I3Ldt9FkGuvN9cTO
        iq9BHoAiQyFIV3pY/PVvguk0xWDz
X-Google-Smtp-Source: APXvYqxdJg3sbUtwepgcwZmmXTvPNO602mnCf1m3T7QTZs5uJrKKhcYcpa7qMi9TQrcKOx66bT7N1A==
X-Received: by 2002:a5d:52c2:: with SMTP id r2mr17618709wrv.367.1569923532009;
        Tue, 01 Oct 2019 02:52:12 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0c1:1609:54:45db:20c6:d537? ([2620:10d:c092:200::1:af22])
        by smtp.gmail.com with ESMTPSA id r6sm2336296wmh.38.2019.10.01.02.52.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 02:52:11 -0700 (PDT)
Subject: [PATCH v3] edid-decode: Avoid division by zero
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
References: <cc88ca6d-5608-5381-74b9-008c2a32afb3@debian.org>
 <ca1fd80c-02d1-f793-0906-239f020eac65@xs4all.nl>
 <e9bae40c-9a2c-067b-d547-cd1f1a528e25@debian.org>
 <3f362e23-7cf9-e93b-8c88-b7b6c5197230@xs4all.nl>
From:   Breno Leitao <leitao@debian.org>
Message-ID: <7d5075dd-8836-fee1-0706-8b406356dc22@debian.org>
Date:   Tue, 1 Oct 2019 10:52:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f362e23-7cf9-e93b-8c88-b7b6c5197230@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some weird monitors that returns invalid data, as zeroed
Horizontal/Vertical Active/Blanking.

This causes edid-decode to crash with a divsion by error exception. This simple
patch avoids so, checking for the divisor before proceeding. On invalid data,
it prints something as:

  ...
  Invalid Detailed Timings:
  Horizontal Active/Blanking 32/0
  Vertical Active/Blanking 0/0
  ...

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 edid-decode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/edid-decode.c b/edid-decode.c
index 7442f8a..2612e70 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -1022,6 +1022,14 @@ static int detailed_block(const unsigned char *x, int in_extension)
 		break;
 	}
 
+	if (!ha || !hbl || !va || !vbl) {
+		printf("Invalid Detailed Timings:\n"
+		       "Horizontal Active/Blanking %d/%d\n"
+		       "Vertical Active/Blanking %d/%d\n",
+		       ha, hbl, va, vbl);
+		return 0;
+	}
+
 	pixclk_khz = (x[0] + (x[1] << 8)) * 10;
 	refresh = (pixclk_khz * 1000) / ((ha + hbl) * (va + vbl));
 	printf("Detailed mode: Clock %.3f MHz, %d mm x %d mm\n"
-- 
2.17.1

