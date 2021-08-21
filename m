Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A657C3F385B
	for <lists+linux-media@lfdr.de>; Sat, 21 Aug 2021 05:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbhHUDr5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 23:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhHUDr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 23:47:56 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB56AC061575;
        Fri, 20 Aug 2021 20:47:17 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id f22so3337244qkm.5;
        Fri, 20 Aug 2021 20:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RhNvjC5FbjNYONwOawMoFPjO3QiHvU6DiO/UBhQ5dKA=;
        b=IaobpgR+fgGfoE4JtceBoeSJVKme2DRf/ab1fwPCBbyifezuYtetDYNa3HL0vwxUeT
         FPsjRYBvXPNq0OqunTCkIPxlzpcx4OVErwM9X79z7QjhOV75eNrk9N3WltQOq5FxgD4w
         H4X22k4Yj/3JZ1I+unrG6NSKaxys361+Nej7o9jaIe2/wJB4QwkePFKHJRdB2g+66miW
         HTzTHcZjDxmqE6o3n2EeCBlW2kd0c3CCBfChNe+1lrn4h8g0/X49wwJ28l+2wjok2UT3
         OQuoBHXVzwsKHZQhzVcIPJsSQ7jUaGMUVn59Z6DBJ0wOrNIjVu40TSwxjelWldarIJlu
         cQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RhNvjC5FbjNYONwOawMoFPjO3QiHvU6DiO/UBhQ5dKA=;
        b=VLQ74r+AsSksD+cfLRpAr3RXWczjeTFtCgNn3nA/v8axNdq1BfJnS54X3Z3p97SkQr
         x6/boWkTfa+haxjKYKsSgzKyNxzDoFQDcnd0TtThhrwQJsDeO51keB0AvzSWPGWbmRNr
         9bajF1KxYq+KWQ3MCWq73C+hEiwJHOavelzdbMWjp3Owxstbn90FMIXpz1JPrAOJd4rV
         OZfQiIr0o73ykBNA7WC9XWB/Qlerqk5OvtpZqsZ87tm73YoVIb7rxfZiWE2sWa8lI45L
         2P/MFqRMoWsOX/tF3eqq4iJK/3NjtwZAafyhCZAI5Oz53LRsQpQJFT4HmRRNGA0lUZ6n
         HYqw==
X-Gm-Message-State: AOAM5303UB3lgE+iRWNIFRy167NROxkgUp3K583KDMiweQBorfhiUOB8
        Ho/E/IXnT9cjq0WtsNxs8kg=
X-Google-Smtp-Source: ABdhPJwTc5lmnPDsB/8XGFL2k+dfYCuGkf+alRAXrKme1xV5LgukTboJwN2oBoworvB9t1l+EKyYqg==
X-Received: by 2002:a37:681:: with SMTP id 123mr11901233qkg.53.1629517636953;
        Fri, 20 Aug 2021 20:47:16 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h4sm4072652qkp.86.2021.08.20.20.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 20:47:16 -0700 (PDT)
From:   CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <jing.yangyang@zte.com.cn>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        jing yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] ipu3: use flexible-array member instead of zero-length array
Date:   Fri, 20 Aug 2021 20:47:09 -0700
Message-Id: <20210821034709.28061-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: jing yangyang <jing.yangyang@zte.com.cn>

Fix the following coccicheck warning:
./drivers/staging/media/ipu3/ipu3-css-fw.h:174:21-34:i
WARNING: use flexible-array member instead

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
index 3c078f1..c0bc57f 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.h
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
@@ -171,7 +171,7 @@ struct imgu_fw_bi_file_h {
 
 struct imgu_fw_header {
 	struct imgu_fw_bi_file_h file_header;
-	struct imgu_fw_info binary_header[1];	/* binary_nr items */
+	struct imgu_fw_info binary_header[];	/* binary_nr items */
 };
 
 /******************* Firmware functions *******************/
-- 
1.8.3.1


