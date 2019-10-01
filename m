Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D943C2EA5
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 10:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfJAIK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 04:10:28 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44624 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfJAIK1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 04:10:27 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so1113554wrl.11
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2019 01:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QODAYoQNjm0v3EljDUhEZRTkaH6gq4dep1WVdwR+vzQ=;
        b=uHTAzFT8VZJOFpjlA4XRyZspFsVX7DTLCuW0G4+Hkfr4ebmmqZk9PrA9RhhFUDnR71
         Dv9+qfkIR2zbIedZSoHayYFDysifXoXZl+klJ8daSb+TIQfwlzBqQD3/dBYKV0S7p/5b
         X8AX/Hx75LlTapo8GG8iov1cat5c0DqgvYeAqZhPdJ69F8HIFanVE9Va0a+SaabFRZSC
         YwpF1FntiKJ1T6Ii7us8qVSOiR24B+WWMAhiepnQcnxXFfFPcDLHv+gQq/WV3XLwCXGw
         k2S5C1BuFSNxRKUdLCiko/vO5WbZjGIcvOcyhbVg/bV30KOQmDdVOaidW1lfaRC2hxYA
         Ec1w==
X-Gm-Message-State: APjAAAUuVxOSSY62V1QAsACpomJa0JGiJNxiHZqzMf6fYn445O0kzn66
        q9DeVXbAVStjmCUkFq48kHHBfti1
X-Google-Smtp-Source: APXvYqy4Ss2bIGUOnvyeXZE9TDhT7Wznp/o+3p5x5li5+cnZGcP2aq+PEqjOyWnYg8OqJPaRtxAwtw==
X-Received: by 2002:a05:6000:1632:: with SMTP id v18mr17577309wrb.61.1569917425473;
        Tue, 01 Oct 2019 01:10:25 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0c1:1609:54:45db:20c6:d537? ([2620:10d:c092:200::1:486c])
        by smtp.gmail.com with ESMTPSA id c18sm17200638wrn.45.2019.10.01.01.10.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 01:10:24 -0700 (PDT)
Subject: [PATCH v2] edid-decode: Avoid division by zero
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <cc88ca6d-5608-5381-74b9-008c2a32afb3@debian.org>
 <ca1fd80c-02d1-f793-0906-239f020eac65@xs4all.nl>
Cc:     linux-media@vger.kernel.org
From:   Breno Leitao <leitao@debian.org>
Message-ID: <e9bae40c-9a2c-067b-d547-cd1f1a528e25@debian.org>
Date:   Tue, 1 Oct 2019 09:10:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ca1fd80c-02d1-f793-0906-239f020eac65@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some weird monitors that returns invalid data, as zeroed
Horizontal/Vertical Active/Blanking.

This causes edid-decode to crash with a division by zero exception. This simple
patch avoids so, checking for the divisor before proceeding.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 edid-decode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/edid-decode.c b/edid-decode.c
index 7442f8a..b932179 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -1022,6 +1022,16 @@ static int detailed_block(const unsigned char *x, int in_extension)
 		break;
 	}
 
+	if (!ha || !hbl || !va || !vbl) {
+		printf("Invalid Detailing Timings:\n"
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

