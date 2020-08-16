Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B8524563C
	for <lists+linux-media@lfdr.de>; Sun, 16 Aug 2020 08:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgHPGtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Aug 2020 02:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgHPGtK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Aug 2020 02:49:10 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110B1C061786;
        Sat, 15 Aug 2020 23:49:09 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id e5so10108563qth.5;
        Sat, 15 Aug 2020 23:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FI81jCU0TgZc/AoxOHLfhbqdNMkjywgbjhR9bXoZhCY=;
        b=Es6YcsHwn+WMHY+8PGayIZdEWYQU1aIu1+UlsMMgid4eFjwjkpLPcin2THOy2Yfy5w
         1jyLH1yCXXfs8bvwv20o0ymLsnCjXf6hPJznS4/DxK7lMbyIYaV8+UGhaL6y8YQyH3DY
         Is0ZY6ij0BHLAxX3rvNaA3uJO+WGv0zMBTuys49TexLfnjcOsdoCP+hzdn6gFgdacE1d
         uocfBEX5Xl87iP5Q2TBZHjA8g7Fb0nOCLAb4cDcHLL5Bk7wb7cIzfCasH2gbMa+znKNA
         xSGyk1Hp4zfi0TiNPOjSath7PA/Wyr1uZwVb6hyvoLf+ssET5IJnF0GSIjzQQ9Adllfx
         fdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FI81jCU0TgZc/AoxOHLfhbqdNMkjywgbjhR9bXoZhCY=;
        b=YqaBWhmcralCtvaCiMdy867OXafzPbxwfQbPoDAxGhErGuIeq1bTDH1os9ql6JR4Sk
         C8A6TKRVk5uR33kzeHx1tezFpAHkBf2mgVPmiYHWraI16JCBur6331apVjbAQzI8jg3j
         PfDJOsGZK6uQuWJTR1eF/IRFDY7E2vadPl3YmU5XTQr2PGzQ6oD1JoaphID9VWIuAymi
         /Ns/FM3BMR6DbBl2tHDDTgfbBRacmwsyoGLxi7pfTnoGucQgKmcT6cMzcr6XBGeXi7+K
         SfAbopBFbWwnJ4LPmo5THzqudwB3DfURX0wjICY2s2bR/MAwxeVRHfa98xtoMAb+uc5m
         b0pg==
X-Gm-Message-State: AOAM533e9YVawU1g7vDKAOkfThIoWCU0iPGivZRmp47S+4U/w06qFXUt
        DeURbpg9ZvOaq+ifOQjMhmI7dsiRz4nrrB6s
X-Google-Smtp-Source: ABdhPJwRB09U4cCYKhfUKhS17SdUjpJSRv9ACivV4IGqNpkpMu5+ZQ6Wh2c5H7rMCfkqWyrsqPr1Bw==
X-Received: by 2002:aed:36c7:: with SMTP id f65mr8822900qtb.39.1597560547392;
        Sat, 15 Aug 2020 23:49:07 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c100:b9d:4032:a79a:238d:9f7a])
        by smtp.googlemail.com with ESMTPSA id w27sm14593709qtv.68.2020.08.15.23.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 23:49:06 -0700 (PDT)
From:   Tong Zhang <ztong0001@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, isely@pobox.com
Cc:     ztong0001@gmail.com
Subject: [PATCH] media: pvrusb2: fix parsing error
Date:   Sun, 16 Aug 2020 02:49:00 -0400
Message-Id: <20200816064901.977682-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pvr2_std_str_to_id() returns 0 on failure and 1 on success,
however the caller is checking failure case using <0

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 1cfb7cf64131..db5aa66c1936 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -867,7 +867,8 @@ static int ctrl_std_sym_to_val(struct pvr2_ctrl *cptr,
 	int ret;
 	v4l2_std_id id;
 	ret = pvr2_std_str_to_id(&id,bufPtr,bufSize);
-	if (ret < 0) return ret;
+	if (ret == 0)
+		return ret;
 	if (mskp) *mskp = id;
 	if (valp) *valp = id;
 	return 0;
-- 
2.25.1

