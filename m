Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03DA2358F18
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 23:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbhDHVVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 17:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbhDHVVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 17:21:24 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E250C061760;
        Thu,  8 Apr 2021 14:21:11 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t140so2276226pgb.13;
        Thu, 08 Apr 2021 14:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7KQ9dgyFpGmrno3NBnr3xvBzKME75uzvWjBYKMlTxeM=;
        b=GDc+O5ahwo0oKQQ/6akBDra6B3nJJ/iUovHy/hU4srnxmdKW9FsIN3hOg2CleNfyvU
         PYJg4Ixki7oSoXUbVmJknOSp7P9gFwaxNXU3BFWRdZoVN90ZR9Olsm/VsWdshBFQ5Xy5
         sMf7Nyfjxwg8Q1cpjAYlkFqrXFkp3KF4SR4IvE0+QzqCaIfTT33cYElCjmEctXL06sI+
         yqQcrSzIo3/nKOdjrFmeUoIjQsvPnoFTEVbdTIqkOn080GC2+EtOefGfTGmIrVevihx5
         Snj0Arn3ka4V2OCqn0vwI+p4uz1mqNMKIj9GUZo4La+l+2JBQ7F+246Vr9hq/yS21HdZ
         zVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7KQ9dgyFpGmrno3NBnr3xvBzKME75uzvWjBYKMlTxeM=;
        b=VBLpcwRmZiKu30W5MOQjsriYv9dn4mSveX5eIewDHMA2RBCBl37jKz6AFyhWZYAxZq
         4MhZy42mjjeFwkE0jezc5GAK7uV25dOPUv6gawFW+cvqtjsxMwN3idoIqPKGQvsJK/SL
         uaDcI2BcH/eeUcwWw2WWEVFANgeH6Xgxx4U29E51z0zWmnHeRHwDSD1DsiJBbgfJwnIa
         3rAO3iO9/Sh0dGYOk2Us/3n+R5nwoi+WvhB1OGnI2qmfQpDhrqmpuc0lHX6QiOAkTKKl
         vv9wI/3ffOSP+ksfKsSCgzswRTpfFy7ibHCYEVPJL6PLqXS3vCi4UfgqiOStdFRwWLy9
         COVg==
X-Gm-Message-State: AOAM531AHja0ttKF2v38kEVvGEzTcWYFPSdlpLvb6o0uSIi7B9PV0vOg
        G0y6cGMzML7Sh81G26i3ryo=
X-Google-Smtp-Source: ABdhPJwfinViQvp3s3C1Ztqe6bd0Xb92TsO8+3f8xSRMoFUH1NZcuef62xbT7jg4LCMRBPNZv9XXCg==
X-Received: by 2002:aa7:8389:0:b029:209:da1c:17b5 with SMTP id u9-20020aa783890000b0290209da1c17b5mr9439756pfm.29.1617916870938;
        Thu, 08 Apr 2021 14:21:10 -0700 (PDT)
Received: from kali ([152.57.243.224])
        by smtp.gmail.com with ESMTPSA id q2sm322538pfk.143.2021.04.08.14.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 14:21:10 -0700 (PDT)
Date:   Fri, 9 Apr 2021 02:51:00 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: media: zoran: reduce length of a line
Message-ID: <YG9zvMnYlZVbJhQn@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduced length of a line which exceed the 100 columns limit by splitting
the line into two statements and commenting it with '*'
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/zoran/zr36060.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 4f9eb9ff2c42..035634fc1c6d 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -249,7 +249,9 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
 static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
-/* SOF (start of frame) segment depends on width, height and sampling ratio of each color component */
+/* SOF (start of frame) segment depends on width,
+ * height and sampling ratio of each color component
+ */
 static int zr36060_set_sof(struct zr36060 *ptr)
 {
 	char sof_data[34];	// max. size of register set
-- 
2.30.2

