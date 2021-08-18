Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9CC23F061F
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240214AbhHROPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239927AbhHROOr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:14:47 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D13DC06114B
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:13:21 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so8955573pjb.3
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BUH6kxlgFYFRrgWU+b5Gz04KNGiQQgwqFoq5T2N/ZkE=;
        b=Ry0GJP5/oBRtxmEVexPrGS1f08gSARHBoeVgzWq8lgFx+6zd+K71D6XVX8I9msM2O4
         g3nYD1T/n0jv7SnzQ6NqC+bU3ZHf29kQ1LRASMEwWwZk6m7j3JGOS5dhdEDnYTnAm0mK
         rqIviaoYBj38JhMnDwmGum4XoLIs5BABQCfGzVxsA2gCiOIN0jecQZJkF3ncdlRSiaUe
         7YNlAf+BD5u0TqTRNkVitHGGQ8HO9yviF1LbUHCWLhrh5QI8NSJE1g/tFdDi4EfRwIjQ
         +Pbe54A4Vr/E6xsPXKzLrCQoD27/Pr+NnID+b1eiYBKHlhQoe6JlaNMG9RCE9UI9914u
         ctkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=BUH6kxlgFYFRrgWU+b5Gz04KNGiQQgwqFoq5T2N/ZkE=;
        b=mBLImSIMQkNCWKtZHja+Glz1HWra1290aQDOB50a/gbo9AHF5NVx+L0wS5FtoB5evz
         i8p+AlynBxP0xwp1FAUJ6qLXWOBZQLZgWpOkmNj3BoiRD/Yln/5bjrkj5rF36q/Uvheu
         BWete/HgHSX1CltA8ClXs41Yv9N3lJnNZ+zPxgehKlndxBGa10RpTNGN3gMyCFTWcExd
         avlLoxuuyrODyfEV+QqW5Y15DpNmzFudZozTydFVOAk8kZgE6QfuDlw9pjKnXeTwQIC9
         m50QT6EVOrfwrOljPsiru1MdUsWaNpZo1HzLOd/so7y0+NcAyuo3jABba9k+awtULh3S
         hdXw==
MIME-Version: 1.0
X-Gm-Message-State: AOAM530WkMyuLUmozibEBqQUdQLpqgOiHtNRMj7mhsIXqzx7hopSupFA
        s4F0hLdpbn90uv5KvlfPq6wQnt5nb2QPULLLe6+tA4GJVf1Q8KKX8BE7BjVj/+oRSrWaj/CqAiA
        flaHxjpeUIL7GSwGi
X-Google-Smtp-Source: ABdhPJwHqIbAlf4pw1G1izQ+VgFqjOEMIeH4J15+RIPpTgoYKovgQDxT7BE0wXRc8tb/5rs5FXmvZQ==
X-Received: by 2002:a17:90a:b795:: with SMTP id m21mr9677712pjr.143.1629296000956;
        Wed, 18 Aug 2021 07:13:20 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:13:20 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 26/30] media: Kconfig: Add Video decoder kconfig and Makefile entries
Date:   Wed, 18 Aug 2021 19:40:33 +0530
Message-Id: <20210818141037.19990-27-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

Add video decoder to Makefile
Add video decoder to Kconfig

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 drivers/staging/media/Kconfig  | 2 ++
 drivers/staging/media/Makefile | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index e3aaae920847..044763f8fe2e 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -44,4 +44,6 @@ source "drivers/staging/media/ipu3/Kconfig"
 
 source "drivers/staging/media/av7110/Kconfig"
 
+source "drivers/staging/media/vxd/decoder/Kconfig"
+
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 5b5afc5b03a0..567aed1d2d43 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
+obj-$(CONFIG_VIDEO_IMG_VXD_DEC)	+= vxd/decoder/
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
