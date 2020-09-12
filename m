Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44310267BD9
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 21:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgILTDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 15:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgILTDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 15:03:36 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C34C061573;
        Sat, 12 Sep 2020 12:03:36 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y17so9233992lfa.8;
        Sat, 12 Sep 2020 12:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S67JUcIs2dhX6EITOvFKtEd8C5lNSO8UBvbFFL/hUTI=;
        b=ps8kBjmqgjILz9EHOPbWQGRRuu+zRCqWI1ezXz2kEfng4sxLqvVRI9RVQdRyfRfl6D
         rKzQpXwWLhzwonA6ZLIpYe7B1dVDYzYQenNIWtLo1ijhtzfkVfKmayqmI4qt74pTWH/h
         asfqeFkLWbFb5EBzDEISQtuV5eXZZGuumjzYj+/+lIXs2yy88Sj4EhNo932JoX/cRuB+
         1TunuY9P0cjxh8yXoxSY+k2Th1VL7pJJiAyzGFTw4Fy5ci1RrizV5kyiawUjILcGmv/T
         Q23nhkwr4aN0yo2MTIHW8sZwnK9Jwxa/KTS57wMRyujDKvLZpChjhVxSrapB9nThBe7D
         VcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S67JUcIs2dhX6EITOvFKtEd8C5lNSO8UBvbFFL/hUTI=;
        b=svZdw72JXcVY+aiWhnsVo6OGKkD+kCIB1IINsyOx+Pf/z1Oemii9539ClazhcyNSVm
         c07igo6uka/edzwhf3l5VVqJ13ZujBuhqClZp51I+oypfeFzilkh7V2HxmCvLi+pGYsF
         RD/Z8kC8TV9+waLHW31A5BtY2h1MaTMg9iQ2wIeoapyR3XFeW6m5Eye9jbIWQRy8LFIg
         1N2yThUcdXS9dKr7ssq6kvHq3PlaPJjq5btokiopA5OxsNL259rCunmPs8XASUmeEiJo
         7Z3tM+LKqg9aZNFJ9dZlBU7enbiztLgJLHI+qXtG3M8F43pmureGsj+yUcWhWBdbv0Do
         PHLg==
X-Gm-Message-State: AOAM530okbWNSuKl0+FuYEn7H8S7U5TtiJDHb3/a2xx/WfduoavOA3+O
        fyknAjnHMU6Padb77cEJZ5iWyTilOnyfBw==
X-Google-Smtp-Source: ABdhPJwQ86NoEJa6w7FhwrSBUjkhaEwtpdIPXrOrTeURJ16n5WBFzhe6/F97F7SiDukSEbkhA1Bz0w==
X-Received: by 2002:a19:145:: with SMTP id 66mr2397646lfb.61.1599937414525;
        Sat, 12 Sep 2020 12:03:34 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id q22sm1267541lfr.258.2020.09.12.12.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 12:03:33 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Aniket Masule <amasule@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: venus: helpers: Fix ALIGN() of non power of two
Date:   Sat, 12 Sep 2020 21:03:01 +0200
Message-Id: <20200912190301.490297-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ALIGN() expects its second argument to be a power of 2, otherwise
incorrect results are produced for some inputs. The output can be
both larger or smaller than what is expected.

For example, ALIGN(304, 192) equals 320 instead of 384, and
ALIGN(65, 192) equals 256 instead of 192.

However, nestling two ALIGN() as is done in this case seem to only
produce results equal to or bigger than the expected result if ALIGN()
had handled non powers of two, and that in turn results in framesizes
that are either the correct size or too large.

Fortunately, since 192 * 4 / 3 equals 256, it turns out that one ALIGN()
is sufficient.

Fixes: ab1eda449c6e ("media: venus: vdec: handle 10bit bitstreams")
Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
I'm fairly certain this patch does the right thing, but I have only
compile-tested it (I don't have the hardware to test on). The only
reason I spotted it is that I tried implementing compile-time checking
of arguments to ALIGN (and some other functions) to check that arguments
that are supposed to be powers of two really are powers of two, and it
found this.

 drivers/media/platform/qcom/venus/helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 7147871d9dc1..194c5dd08803 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -678,8 +678,8 @@ static u32 get_framesize_raw_yuv420_tp10_ubwc(u32 width, u32 height)
 	u32 extradata = SZ_16K;
 	u32 size;
 
-	y_stride = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
-	uv_stride = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
+	y_stride = ALIGN(width * 4 / 3, 256);
+	uv_stride = ALIGN(width * 4 / 3, 256);
 	y_sclines = ALIGN(height, 16);
 	uv_sclines = ALIGN((height + 1) >> 1, 16);
 
-- 
2.28.0

