Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC49252C3E
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 13:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728790AbgHZLLJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 07:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728721AbgHZLLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 07:11:01 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B26C061574;
        Wed, 26 Aug 2020 04:11:00 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id i10so881692pgk.1;
        Wed, 26 Aug 2020 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OYwGuEb91/Fq7kHgAcheZzGBW4eXw4/zcLyHp4V/iG0=;
        b=kHrFHnGJJqHIOGuHlNt47+PIV7xjyxVsQGCXDBKvWlCVnlDrIzQm6EMJ2ilqj4vxtR
         Ea5p9UqDeeEy8aUGQmy7Jg2iXrzk3+f7GARCG/yd94rppYK1u0lp3FDcF1INMV7dBzZu
         88Sx8IdxaethQB6tSl/yYI2xja24LrVc04r10ejLRKRrdS8mKCWTZPyTmaw3HrNQHi6L
         /9L2n9XdDytKjSYeVNeUJSPwJHMkrwKqnUmP8LFzlh2gerEGyU19Z15fqwcs8wbTOAvQ
         mkSg6jHwv/x12y61M23ocu1o6DnSUIhByZVC5fAASWXHamKddzyqNC+GJmw55ugorjCO
         PYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OYwGuEb91/Fq7kHgAcheZzGBW4eXw4/zcLyHp4V/iG0=;
        b=VbwE8EtmMSO6AeNQgcM80oHbYAJcAYp7gv/cUsSjUz1a/FKltMAIRLMliQzAyt6HqE
         Pi2QRzU3wuG7WaKw88DkcVK8Yp8giko4LlYND04pf+JoAj6khJOq2D+Am2aJ1bhPO4Sp
         5RSElsYh6R+/SYRLNO3izmmKJEAkCLwBBnzkF9nDaKw69eO/tw2kuJNm0ZI8xxeOEHAZ
         eWtcDhN01iHvBf6+aj9xDGwwJtOi3UvGgzzKHUfu23XjpIHnMlAMC01c8wITAAokyt6N
         3/ozOi9Lk7dKEZFnyfxCkGooXh8Lq7eL/84fYBxNXAPFqbKaS82h0xod6pnrzCWTQH81
         bkWQ==
X-Gm-Message-State: AOAM531k1G77ZGjIEnJ3X+C9ZXdNjMa5KBE9ztzlQ5NEWAzfHPXOipXK
        nodYoPIx5EzM+WmWkOapUdc=
X-Google-Smtp-Source: ABdhPJwLxmpEUrt0bg/EsSlOKtqGn2tKaPB89b7YhYCQnhKwKyVGv7GIbk3RsGJH1mgpotz1PR/t8A==
X-Received: by 2002:a63:df01:: with SMTP id u1mr9354157pgg.401.1598440259924;
        Wed, 26 Aug 2020 04:10:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.215.131])
        by smtp.gmail.com with ESMTPSA id e62sm2793172pfh.144.2020.08.26.04.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 04:10:59 -0700 (PDT)
From:   Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc:     anant.thazhemadam@gmail.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media/atomisp : fix "dubious: !x | !y" sparse warning
Date:   Wed, 26 Aug 2020 16:39:15 +0530
Message-Id: <20200826110919.9523-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826095000.GW1793@kadam>
References: <20200826095000.GW1793@kadam>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Upon running Sparse, "warning: dubious: !x | !y" is brought to notice
for this file.  Logical and bitwise OR are basically the same in this
context, so it doesn't cause a runtime bug.  But let's change it to
logical OR to make it a little bit cleaner and silence the Sparse
warning.

Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 358cb7d2cd4c..3b850bb2d39d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -58,7 +58,7 @@ sh_css_vf_downscale_log2(
 	unsigned int ds_log2 = 0;
 	unsigned int out_width;
 
-	if ((!out_info) | (!vf_info))
+	if ((!out_info) || (!vf_info))
 		return -EINVAL;
 
 	out_width = out_info->res.width;
-- 
2.25.1
