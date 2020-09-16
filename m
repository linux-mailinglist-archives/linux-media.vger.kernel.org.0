Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE6926C93C
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 21:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbgIPTFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 15:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbgIPTFQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 15:05:16 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB4FC061756;
        Wed, 16 Sep 2020 12:05:16 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d4so3771352wmd.5;
        Wed, 16 Sep 2020 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yp6mYJPOiI1MfwSlXN8ceAxsgA+JQ4K10iRIk0yhBL8=;
        b=q6gW5WFuw4VPH7GzIeIjMUhZC7YcISqFdNjdRRM+8LX/iVGfeI4CZTRwRK7+Wxbu26
         U9jxq1opWnd5KMHtIwPW5g4kvu8iyAaaIcFHIObUObtliQyCCcAK7Kj8/stSpzWtcaWN
         L7LLPxuEu/IPIE5dA4wZU+BiDDM8dBDMwgQCmHWQsIo1buZ2yHjmRSJkjriQsQwTCCwM
         hOK7Gu8DBq00TeEJgGGkFUzw4dfSKxA5ghYyYCPyyyZ1l6/1fIV6eTBhXBZHCV1DESOe
         rek9WYj6CbnnVysq4iCJdx+dEqHyvirCH5mXJuH40uIlnIY6ylXsClsmyJwE1LhVsmdF
         hLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yp6mYJPOiI1MfwSlXN8ceAxsgA+JQ4K10iRIk0yhBL8=;
        b=Kg6agyZj7PO/ggaUi1Jh7OHoXCmMPHgXajO9rMXZ/Kf++kMyNY8BLMCevV/ZvkGMd4
         9qLSAIO9JUi3aFhEeNCXWGcxAdiVfPzNuc39N9hMd+SZgOyBEbxX6cp2u33jCZ0xuyRM
         9DiOcs2J35IJyCP22omp/lbXuGjlp2rc3nlRFbVnnIAAxI5nhVHOfK3lf532DQnIInhF
         KXhBhc4GbOa7gfzNDSl0WiGbp0PyXe8yBqsnKhho+9NTsvD1qzSahBvN6dwzBdBC1I4+
         S/LJKCvrycr4WEus1mPdqeaxIvU2dKcYP1Oy99z4pKdOm+ZG9RPiPtEaV5uykC9K2R8e
         z22w==
X-Gm-Message-State: AOAM532181e3rhXTflYGIKC6EuwPR2cQerfkJIYzuewbC26XgvnIGkJ5
        adnWZkaM3ljanCaTfKM4EFHLq7qB++1gLujy
X-Google-Smtp-Source: ABdhPJwHduI7ywbHfA5idkAVBWpWWcJ4mKflNSQRa0cEjgt0JmZ05mTRiKySb5CYgHncBCIuu7K02w==
X-Received: by 2002:a1c:dd87:: with SMTP id u129mr6203375wmg.172.1600283114736;
        Wed, 16 Sep 2020 12:05:14 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id s2sm35284679wrw.96.2020.09.16.12.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 12:05:14 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: vidtv: fix time conversion error
Date:   Wed, 16 Sep 2020 20:05:06 +0100
Message-Id: <20200916190507.30476-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In vidtv_mux_check_mux_rate(), the function jiffies_to_usecs() is called
but its output is treated as if it were a value in milliseconds (indeed,
it is assigned to a variable called elapsed_time_msecs). Accordingly,
the calculation will be off by a factor of 1000. Fix this.

Addresses-Coverity: 1496996 ("Integer handling issues")
Fixes: f90cf6079bf6 ("media: vidtv: add a bridge driver")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 5d1a275d504b..77b00a854a9c 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -349,12 +349,12 @@ static u32 vidtv_mux_check_mux_rate(struct vidtv_mux *m)
 	u64 nbytes_streamed; /* the number of bytes we actually wrote */
 	u32 num_null_pkts; /* number of null packets to bridge the gap */
 
-	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
+	u64 elapsed_time_usecs = jiffies_to_usecs(m->timing.current_jiffies -
 						  m->timing.past_jiffies);
 
-	elapsed_time_msecs = min(elapsed_time_msecs, (u64)VIDTV_MAX_SLEEP_USECS / 1000);
-	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
-	nbytes_expected *= elapsed_time_msecs;
+	elapsed_time_usecs = min_t(u64, elapsed_time_usecs, VIDTV_MAX_SLEEP_USECS);
+	nbytes_expected = m->mux_rate_kbytes_sec; /* kb/sec is the same as bytes/msec */
+	nbytes_expected *= div64_u64(elapsed_time_usecs, 1000ULL);
 
 	nbytes_streamed = m->mux_buf_offset;
 
-- 
2.28.0

