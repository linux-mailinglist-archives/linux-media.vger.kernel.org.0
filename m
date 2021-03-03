Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3287A32C77E
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355610AbhCDAcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386120AbhCCRql (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 12:46:41 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C6CC061763
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 09:43:23 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id e7so38508674lft.2
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 09:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=843Cqu10do3AOcdjRFPledKrGoMFl6vHJzmaFjeMBSM=;
        b=zix6/HFrJghHi2HtjcVyWLj0N+uc6HhJDfNpB38u08KjESRVwSyspbvWr93KTIwSfl
         4cbcUGdgY8NwVv5x/WJWPg/BDaMShLrKU+xdao/Sqsrk2WMrmhH1B2xMXh5h+UGckrms
         JLmOflDgf8EGD3FsfoxRr/JupQHIkt2hkS3RFbkFWze5IyS8KmVpzFsHGxsO35F/JWni
         i7Q/FSwCvrva4MASIHcRp4+t5ncbfkg0gB3ZYXNOWFoBgTKVlb5lVkOMAS6A0tLWM4iD
         zfrgGoMRkbuF0wddNl5ovU0IlkSzfTFIZYZdRQjnPxl07z3KSSLeOlCpLwUSM9D4QQ9D
         hXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=843Cqu10do3AOcdjRFPledKrGoMFl6vHJzmaFjeMBSM=;
        b=atp71rWWuRkOJEVmFksVTBmebflZizDbcldKJnwghkhIXpfyJyyl51qdeThlS6a0qy
         lYTgdUGNca1OEid7CqPgb1LuTQ2rokRafvl+wMUZ2nBZKCXjiLuf4InEK7zjbaCF/Lyp
         cjTQm/vun1Eq7l7l7CqjUqNXknXXZLRBn5umzVmKHdDtnQokldQDks1sbpO6CokNCPei
         kQTzb2vWct0zPvVmAwailBjs1NFmrQO2K5cIn6J/u3IKG+SjLriaCWoRxbJuNTmWFSjn
         tamUwpbmjIqBwiAT48e6ApCtKSfZvi1IQ7ExTiylZcTYr5i7xSlLZ4wvowK2eofI3anX
         JEvw==
X-Gm-Message-State: AOAM531+3x+boQ7d6sjus+dxaRJwm22Sm7i579RntLf/4Ahy0L0W/AtK
        MMIDgqLDsdbU2vLar+70UGiSXg==
X-Google-Smtp-Source: ABdhPJzaAvVl7zIW7ODmVHAFeI6Rkd3rf7v10ndmHfmNMb50G2CfnOjWagvTE+aUo0mJvzdSYzvKVA==
X-Received: by 2002:a05:6512:3081:: with SMTP id z1mr15929096lfd.257.1614793401892;
        Wed, 03 Mar 2021 09:43:21 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id s7sm2101441lfi.140.2021.03.03.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 09:43:21 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 1/3] v4l: common: v4l2_get_link_freq: add printing a warning
Date:   Wed,  3 Mar 2021 20:42:48 +0300
Message-Id: <20210303174250.11405-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303174250.11405-1-andrey.konovalov@linaro.org>
References: <20210303174250.11405-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print a warning if V4L2_CID_LINK_FREQ control is not implemented.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 133d20e40f82..04af03285a20 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -469,6 +469,11 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 			return -ENOENT;
 
 		freq = div_u64(v4l2_ctrl_g_ctrl_int64(ctrl) * mul, div);
+
+		pr_warn("%s: Link frequency estimated using pixel rate: result might be inaccurate\n",
+			__func__);
+		pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
+			__func__);
 	}
 
 	return freq > 0 ? freq : -EINVAL;
-- 
2.17.1

