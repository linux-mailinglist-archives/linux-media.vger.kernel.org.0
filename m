Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738A730407A
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 15:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404634AbhAZOfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 09:35:40 -0500
Received: from mout02.posteo.de ([185.67.36.66]:40775 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403818AbhAZOZy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 09:25:54 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 17D072400FC
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 15:24:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1611671091; bh=XQaBgB9ImzrfT64vB/4eda285o7PeoMGRekj1zu4BsQ=;
        h=To:From:Subject:Date:From;
        b=Ah01tyuyXY3+rLr5sy6nOHp/6GCJnCRqBKJh3IlSDTFcjs31UkKX30rlkPSSPpYlh
         B33nifwrwEM5lQOQOJHKztbXqtlbOGuDA40m+2y4VBRsJZOuILc/RdDsu5q2m5CSYJ
         IrWfxAJmrEx0HAPAoHN0i96t+vsAicFmSAxuxKlIEJ6RfjTBh7xH2Ya9VY2xRg974G
         JFNMEmX8+feaKBzBP0psX/g205Sjs533gDRgm2xNGkRTst/2A91VWXNP7TywcqlrYl
         EUz6BLRrKUXlkuefYHc5XV1NU+TQpMLAh781Z/jdjBd5x66sH4AdkflIFdpudgsjuE
         7SalP7yN2iSiQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DQ8Bp5CFzz6tmF
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 15:24:50 +0100 (CET)
To:     linux-media@vger.kernel.org
From:   Max Schulze <max.schulze@posteo.de>
Subject: [PATCH] v4l2-ctl: print delta to current clock in verbose mode
Message-ID: <71a724ea-ffd4-25f5-b1ca-40802a625b62@posteo.de>
Date:   Tue, 26 Jan 2021 15:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the Buffer Timestamp Clock is _MONOTONIC, print the delta
to the current clock time. Useful for debugging / insights.


Signed-off-by: Max Schuze <max.schulze@posteo.de>
---
  utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp 
b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index a3580595..d024f925 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -556,9 +556,15 @@ static void print_concise_buffer(FILE *f, 
cv4l_buffer &buf, cv4l_fmt &fmt,
          double ts = buf.g_timestamp().tv_sec + 
buf.g_timestamp().tv_usec / 1000000.0;
          fprintf(f, " ts: %.06f", ts);
          if (last_ts <= 0.0)
-            fprintf(f, " delta: %.03f ms", (ts - last_ts) * 1000.0);
+            fprintf(f, " delta last: %.03f ms", (ts - last_ts) * 1000.0);
          last_ts = ts;

+        if ((buf.g_flags() & V4L2_BUF_FLAG_TIMESTAMP_MASK) == 
V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC) {
+            timespec ts_clock;
+            clock_gettime(CLOCK_MONOTONIC, &ts_clock);
+            fprintf(f, " delta now: %+.03f ms", ((ts_clock.tv_sec + 
ts_clock.tv_nsec / 1000000000.0) - ts) * 1000.0);
+        }
+
          if (fps_ts.has_fps(true))
              fprintf(stderr, " fps: %.02f", fps_ts.fps());

-- 
2.29.0


