Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B63435E2DF
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239255AbhDMP3s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238595AbhDMP3o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:29:44 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894AAC061574;
        Tue, 13 Apr 2021 08:29:24 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id h20so8420685plr.4;
        Tue, 13 Apr 2021 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p944sU1HlsGK+JAM7pfhxbxu763gDyxFzptVVENEtWM=;
        b=MYJ+RCjmhTgTQSRLqy50VLuGxZjkC35EJmvzA+8K08hZVM+Nt90l2NgkOIYRROoPwC
         2+eMwcbDyVOAyYW0cY2KxoCEQJHb5jtqbQtIA+5lC4M84Qnvx+c+BJN2QXGX0PpERSl6
         J4WhRIZCEodU4A8gMeFzAidKEkZ/xO07aS/kVE6MJh6Plv0IDHqFsiIj+nIHdsj/Fa4C
         tctzypyDmW1tTIQkWJgwzPEFyTXI8VUnzoL1Z0yW3gLvmGat8a9DhLv9MW8VM5EYY5oW
         Qj49syhLGZBR7tbSbphWNBlKc4azgXvVNQVMBYnmV01uHQVPcls/dVUd05NGTGQUTtdr
         c8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p944sU1HlsGK+JAM7pfhxbxu763gDyxFzptVVENEtWM=;
        b=bhp2JSRL/eY5MhIbALwoWqBpftKC0fNlHQC0X7KWDtNKfNVl+ptiJsOKVN1LTo7SY/
         Qi24rn0VqEnTiQI8vbrMWZIJl0E38L17q9ZtI4NmIW/ELzNQF0luWi73DrtSZ30RwXWd
         O6Qy/Ih8rEy3V+FXiUg6Tn0mQSJ6XZaHqRSh10n/pKhn81ayFpzP1lw1cVU5/MzwdsAx
         tWzS7v/h0oLu29YipTPTmNKWZH5aw/hH+ovuOROFet1OJEDns1QCBGVyplsgbfD5sy6s
         2Buo6TD65EzuBl9O3dxKREday1l0P7N5yec9oGNjDkH0hbNS4ksJ+/zo3DKkuUM/PVRo
         0MvA==
X-Gm-Message-State: AOAM532gi8j5i+2uQnqRAHD1ROqDTaBxM3sWGRKeahgc/4/0MlGdFdJB
        /+92V1rWyHsS54dPsvHYDgQ=
X-Google-Smtp-Source: ABdhPJy3WjgZIQXfFPzsU2gloxkhTp2yAA+RHLcvoLytUtD73gmOfDgmA42lLYZnUdVg6nybjhO9zg==
X-Received: by 2002:a17:902:e8c1:b029:e9:3c98:2dd2 with SMTP id v1-20020a170902e8c1b02900e93c982dd2mr32793993plg.17.1618327763995;
        Tue, 13 Apr 2021 08:29:23 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id r10sm2852104pjf.5.2021.04.13.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:29:23 -0700 (PDT)
Date:   Tue, 13 Apr 2021 20:59:17 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v3 3/4] staging: media: intel-ipu3: line should not end with
 '['
Message-ID: <dcd55cb415194a5e0246b0103e791d9684de03f0.1618326535.git.mitaliborkar810@gmail.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618326535.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixed the issue of line should not end with '[' by moving argument
from next line to line ending with '[' and made it under 80
characters.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v2:- No changes
Changes from v1:- Made line length under 80 characters

 drivers/staging/media/ipu3/include/intel-ipu3.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index eb21cbc63af6..47e98979683c 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -247,8 +247,8 @@ struct ipu3_uapi_ae_ccm {
  */
 struct ipu3_uapi_ae_config {
 	struct ipu3_uapi_ae_grid_config grid_cfg __attribute__((aligned(32)));
-	struct ipu3_uapi_ae_weight_elem weights[
-			IPU3_UAPI_AE_WEIGHTS] __attribute__((aligned(32)));
+	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
+						__attribute__((aligned(32)));
 	struct ipu3_uapi_ae_ccm ae_ccm __attribute__((aligned(32)));
 } __packed;
 
-- 
2.30.2

