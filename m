Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F5324C3B5
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 18:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730352AbgHTQxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 12:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbgHTQxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 12:53:08 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563EBC061385;
        Thu, 20 Aug 2020 09:53:05 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id w9so1667632qts.6;
        Thu, 20 Aug 2020 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fhzx8KwwpeQJ5G+vL21g25GrjAt+ixzDYHjelVEfNvE=;
        b=juPlfhg3k0rzoOmVhQGgWNhjP93HI6I6CQQI/nBnJBm8DLwBlxZ8b3M4vdsNv1CxSu
         86TSooDC11o8h2jjA64w5RkPugRKCxQd7BUMc/TmbXHh5P3sxOjNaOpjmvzSwCClyVI9
         0xZymLvBQOgyL2ppfj6hvhZEgewM8UWc/bThXY86pAyb45CpDWr7p1bQic5XKq1O4GRS
         UhxQcOvI8SWoVoGIOh4iZjag1NZmh/5zmCViQv6t5kLa+bMsxBjH6FggazqDm0ldRV+Q
         uHy3RsBXcow2lApQE5g0LM0+MxUwp90jJvo+q8yjinqJwDViVQFexoq9mRyzV8+2oDBy
         ChYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fhzx8KwwpeQJ5G+vL21g25GrjAt+ixzDYHjelVEfNvE=;
        b=VonLjdHLDpFGhPsgajGETtKTwf2xmYwwtEtQ+GI5OrWDvF/F01ozLFcrySf1nFBI6U
         xE0zF+o9lItzWD5uVD9u8QuQYByyNOAwi0J0zH8FdAc8SlJnrgXcb9KM9pMb6KV19lhW
         u9ObucQYpkuVKiUKz3otewL7CZgTuY+wRdIVWzRj5TNFj6Bj66qCtOxrqlvEN7MHtw2/
         G15yAgEQBrtIunQgtIOfvkLGTBkq0idJ5nqyT+pYUih1/aAkVoioBTwP/GQCFIGJSAze
         3qOONESf8pJ1+0W/cg/V3P5wbl+Yn6LgJ8br0FJkZ6OzVmWZrt2/SGbLrzNQ/DjRNJRC
         uuFQ==
X-Gm-Message-State: AOAM5335gaGIgNGTjzTaREuIsYG9tsf9UBiJfB+vAjDSoQjb2YnEZAoM
        InWoYtPwTHtSs4DIeadGNJJVAFNMSK+ypg==
X-Google-Smtp-Source: ABdhPJyvtsnkq3ihC1UTFHnyZkG+qbwgy0v5X/i2yoY+dnV59Q+6G/oMe77e4SapitYg942XJGpWKg==
X-Received: by 2002:ac8:3a26:: with SMTP id w35mr3617092qte.124.1597942384460;
        Thu, 20 Aug 2020 09:53:04 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c100:b9d:a169:4fca:c1d6:b7b4])
        by smtp.googlemail.com with ESMTPSA id 128sm2706753qkk.101.2020.08.20.09.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 09:53:04 -0700 (PDT)
From:   Tong Zhang <ztong0001@gmail.com>
To:     isely@pobox.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, hverkuil@xs4all.nl
Cc:     ztong0001@gmail.com
Subject: [PATCH v3] media: pvrusb2: fix parsing error
Date:   Thu, 20 Aug 2020 12:52:40 -0400
Message-Id: <20200820165239.8510-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aed971ed-bd8e-eaed-b2ee-80e9654f24cd@xs4all.nl>
References: <aed971ed-bd8e-eaed-b2ee-80e9654f24cd@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pvr2_std_str_to_id() returns 0 on failure and 1 on success,
however the caller is checking failure case using <0

Co-developed-by: Hans Verkuil<hverkuil@xs4all.nl>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---

v2: return -EINVAL as suggested by Hans Verkuil<hverkuil@xs4all.nl>.
I also rebased the code on v5.9-rc1.
v3: remove unused variable

 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 1cfb7cf64131..f4a727918e35 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -864,10 +864,9 @@ static int ctrl_std_sym_to_val(struct pvr2_ctrl *cptr,
 			       const char *bufPtr,unsigned int bufSize,
 			       int *mskp,int *valp)
 {
-	int ret;
 	v4l2_std_id id;
-	ret = pvr2_std_str_to_id(&id,bufPtr,bufSize);
-	if (ret < 0) return ret;
+	if (!pvr2_std_str_to_id(&id, bufPtr, bufSize))
+		return -EINVAL;
 	if (mskp) *mskp = id;
 	if (valp) *valp = id;
 	return 0;
-- 
2.25.1

