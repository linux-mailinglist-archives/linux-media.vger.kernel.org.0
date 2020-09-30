Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CDD27EDE6
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728729AbgI3Pw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgI3Pw6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:52:58 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB197C0613D0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 08:52:58 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bb1so1281707plb.2
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 08:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sslab.ics.keio.ac.jp; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/xkIWni8SgM73BFi4hmvbWE+41W2IJ3UZaLFsKLGrO0=;
        b=M7Rpj6HkNrkx/NYoCjDpdd8guTiZAXIj1AzQyO7qCGRK1o1otWJB44tKHxsiBiTlxk
         Xt1q0quZP6YK9skgCohk66ZUEO50v+aOJV828C7ZjkbTD9Y1gxqmsUjpH7mNINOsXtA1
         53v+cY61EOY6HKy9dydKEOy/FaWxa5SNmrWAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/xkIWni8SgM73BFi4hmvbWE+41W2IJ3UZaLFsKLGrO0=;
        b=p07PvI5ht/z6y9VfHhiwsXaJjpHUIlJXyWmfSzX4WzeZTi83crMoDYyi0yRtg2T5Mm
         m5900khTZ/nsD6NJQ/X7FYiTlBr9D8jSREo5M3h8u247IcjhHAfLVPi+n/6mySy5QkSW
         n2Uz1bo2H4g2kcEWx6SRb5w68yxm4BxiTkgxFO1HkTE9zBxPncwX45/oRV/DVdR+qg2b
         Nn20Co0LC2qUuz7M7r1EPS847UVFik62+szmEYwrEladoW4BTLYlf+WfbdJBffoNm4qR
         PJOICWKJbC/1eukn0HaDMUoigFWWwoCnsrGn6MFW/V1i69A/lqmRsiCrVkVWBC2n6D4e
         dIzA==
X-Gm-Message-State: AOAM5337xr+KkF4OZ/hzknZ22UmugTCeycw00f28HleIzFih+jjQyns9
        0CahPpM9q/FDnii2tNGqeocERQ==
X-Google-Smtp-Source: ABdhPJxan0UpaLux6JIjM9Vs6ukVwn7rRVFayoREveaALuHTa6YagFd00MEr3S9yFKisVPQ0l1dC5w==
X-Received: by 2002:a17:902:9047:b029:d2:8d1f:1629 with SMTP id w7-20020a1709029047b02900d28d1f1629mr3229942plz.44.1601481178259;
        Wed, 30 Sep 2020 08:52:58 -0700 (PDT)
Received: from brooklyn.i.sslab.ics.keio.ac.jp (sslab-relay.ics.keio.ac.jp. [131.113.126.173])
        by smtp.googlemail.com with ESMTPSA id z28sm3142765pfq.81.2020.09.30.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:52:57 -0700 (PDT)
From:   Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Cc:     keitasuzuki.park@sslab.ics.keio.ac.jp,
        takafumi@sslab.ics.keio.ac.jp,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] media: siano: fix memory leak of debugfs members in smsdvb_hotplug
Date:   Wed, 30 Sep 2020 15:52:38 +0000
Message-Id: <20200930155244.12114-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When dvb_create_media_graph fails, the debugfs kept inside client should
be released. However, the current implementation does not release them.

Fix this by adding a new goto label to call smsdvb_debugfs_release.

Fixes: 0d3ab8410dcb ("[media] dvb core: must check dvb_create_media_graph()")
Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
---
 drivers/media/common/siano/smsdvb-main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index 88f90dfd368b..ae17407e477a 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -1169,12 +1169,15 @@ static int smsdvb_hotplug(struct smscore_device_t *coredev,
 	rc = dvb_create_media_graph(&client->adapter, true);
 	if (rc < 0) {
 		pr_err("dvb_create_media_graph failed %d\n", rc);
-		goto client_error;
+		goto media_graph_error;
 	}
 
 	pr_info("DVB interface registered.\n");
 	return 0;
 
+media_graph_error:
+	smsdvb_debugfs_release(client);
+
 client_error:
 	dvb_unregister_frontend(&client->frontend);
 
-- 
2.17.1

