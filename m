Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A8535D6FC
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 07:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243676AbhDMFQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 01:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhDMFQc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 01:16:32 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6BDC061574;
        Mon, 12 Apr 2021 22:16:13 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id w10so11108917pgh.5;
        Mon, 12 Apr 2021 22:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zBM+FAFuyyZibWOVEU+NwC2c9w2fNaMRxLkV7FI0hEU=;
        b=IuAaYHqgmWuGE1aDi5pIPlZamrmCpCqykFFVVaojpyqCtwRYGnvNC1fNguqZTNV29j
         DK1BQLhTNPtKqwtnFpH7x4tesjocdWzdNUGeyETuYJRmmW2GkfrEotRS+VLtTVYy+eyu
         HXklhZEl8zMlWPV9F8OdUNHLa1ThyLfw7+ntx7c/OQs9x9CG+L+QrQfA8WTmiv4jxlvq
         /KpORx/ZSQWHV0boKkrfFFv577AqIKYqESgh5gbCz0CWyKtORtXtgXxc2LZjge2YShjK
         7KbR16Q2WP2YmBB0i98vWiu0mNwtB2pboRL5L99RcDyLtTOG0AIkuSZwX5Doa8FqqxB1
         ZrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zBM+FAFuyyZibWOVEU+NwC2c9w2fNaMRxLkV7FI0hEU=;
        b=JSfQqaqRxu2nnlLfaxiSbCpx/0SsbelmIx+kycwoMl3+/f5O/huBGVW0oKBoI+y1Ti
         ijcqRIjjOHjC/p2MVc/w+6wM1AP/kcDkGZzEYtr9v4eTBv7Bmfgv3gJ2Fmdv2tId81vx
         fU8y51xUJ4cq8tgKKWavF2gu16KxqcevUuHkD+uNjo7z3nEH1MVSNmgzxNPteksKWXFn
         kwkUNyh2c3sXn/LzR5F4WmrTikQTdeAUZ3PyRYcgjoN7UvrS2Mb2nvxO5t5gO4oHHC2q
         9O4yKnsL5c2rGiGs12BaK3ygXfUH9PJm/dTYuNJwjoGOoiMixMjaiCzZw5Sw8eWvPj8e
         dVdQ==
X-Gm-Message-State: AOAM530ZaOpOUkl/U3RAlkLLVfq2XykqLRyN0kSlfvNb+YxuBmEC06qz
        GmA7AOe4TGciH1H+jsTJfFw=
X-Google-Smtp-Source: ABdhPJxUIQRi0S0oxbsGwqu5IzrWJT3HCr2cf7YA8VPrWcZYp0caKGpYurVl+6bikCc8hgkhD452Jw==
X-Received: by 2002:a65:40c7:: with SMTP id u7mr30494173pgp.29.1618290972915;
        Mon, 12 Apr 2021 22:16:12 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id p24sm7952422pfn.11.2021.04.12.22.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:16:12 -0700 (PDT)
Date:   Tue, 13 Apr 2021 10:46:06 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v2 3/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <f18b704654797e29f3bbbe49689eaa2c0ad28d59.1618289130.git.mitaliborkar810@gmail.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618289130.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduced length of the line under 80 characters to meet linux-kernel
coding style.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- Reduced length of the line under 80 characters

 drivers/staging/media/ipu3/include/intel-ipu3.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 6a72c81d2b67..52dcc6cdcffc 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -247,7 +247,8 @@ struct ipu3_uapi_ae_ccm {
  */
 struct ipu3_uapi_ae_config {
 	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
-	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
+	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
+							__aligned(32);
 	struct ipu3_uapi_ae_ccm ae_ccm __aligned(32);
 } __packed;
 
-- 
2.30.2

