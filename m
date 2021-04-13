Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CC135E2E4
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242681AbhDMPaC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243219AbhDMPaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:30:01 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8984C061574;
        Tue, 13 Apr 2021 08:29:41 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id g35so12157034pgg.9;
        Tue, 13 Apr 2021 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1fCrfrmJZI3X6ymxjhobx0T/1lZLGKuT5ZcshF1fEYk=;
        b=mH0tMSNTz8SyU5qkYvK2u80gaZ8Gn4PLz0ULcefgOuEGJGR/lC596O1HMIV6cBuRV1
         OohY8hKnIWlihH3zWuGeDQK6QP8zgy01Ay640QVAPvCkS5/S9nBgr9AS5k8gm/sOcHeo
         HQA5ZKC07UCEJqwmChMrgoYCbZezZWx72sk69xjcCpTUcndCujYXZeIzdRmXhp86WHGR
         HnYaO/dYPOTs+1FVMNhqq34HqQVX2fIhX4iDHI9MLx04F91xxWzwiU+dRn6X16qr3U7T
         4At2K3yP2/5cYkKE+89I/MjbXiKKw75kFWr2n8KXeqdjjyhFCL8ozg9REVAFIUR1g3RD
         YdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1fCrfrmJZI3X6ymxjhobx0T/1lZLGKuT5ZcshF1fEYk=;
        b=A90IrjxsZpeA/L6FnITVPDw7HXWvl1doLxk8eAjebIMQb6hK/ziEi2RNpR7q+P6++j
         3OzI5JNg7TUJnF2aPd81b921JGK6lXPQx9z/epudUVEVOwvfBProRCfB66yS0GytFNDZ
         JsHx7sBgzSSpzCF9kMak77uyi1L91Tg+yz8RsSuR5i/3L21FtL4gIugg3O1t23HmOe9R
         cJxEi4mKSMDb1P5b3K25xXFFCNxXfJgVbUgayJOad0kNhtE4owPJ5vlGVpNx3rsN8OOc
         XBUgifeakgTr93IQabbNoF/VlAVBK+vmGJ0nWHqC6sJuczEMsAAmiVbClZETWKvlgK8e
         5XCQ==
X-Gm-Message-State: AOAM533Mhe0X939hEKBbyytibtCpCyVPd8Kw1gBhSwjSSt1uhz2IMLVo
        ZB5ZJ+jE1xbqWI+GFH7k9t8=
X-Google-Smtp-Source: ABdhPJxv2qIxd3BmFH494be85112Fgi5uFlFYGcsGUPFg9ZqQQFlxDKZmmHuVdIocsgMLRqXfNZdVA==
X-Received: by 2002:a62:e70e:0:b029:245:3a00:5720 with SMTP id s14-20020a62e70e0000b02902453a005720mr25036334pfh.0.1618327781360;
        Tue, 13 Apr 2021 08:29:41 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id c15sm12892707pfi.207.2021.04.13.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:29:41 -0700 (PDT)
Date:   Tue, 13 Apr 2021 20:59:34 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v3 4/4] staging: media: intel-ipu3: remove space before tabs
Message-ID: <01ad7ff353f805dfc48e7bcc26ed974e7bb5ef9f.1618326535.git.mitaliborkar810@gmail.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618326535.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed unnecessary space before tabs to adhere to linux kernel coding
style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v2:- No changes.
Changes from v1:- No changes.

 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 47e98979683c..42edac5ee4e4 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -633,7 +633,7 @@ struct ipu3_uapi_bnr_static_config_wb_gains_thr_config {
  * @cg:	Gain coefficient for threshold calculation, [0, 31], default 8.
  * @ci:	Intensity coefficient for threshold calculation. range [0, 0x1f]
  *	default 6.
- * 	format: u3.2 (3 most significant bits represent whole number,
+ *format: u3.2 (3 most significant bits represent whole number,
  *	2 least significant bits represent the fractional part
  *	with each count representing 0.25)
  *	e.g. 6 in binary format is 00110, that translates to 1.5
-- 
2.30.2

