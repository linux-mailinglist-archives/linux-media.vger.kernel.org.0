Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1265724A59C
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgHSSGQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgHSSF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:05:29 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EB4C061383
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:29 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id h2so783842plr.0
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PTx1KB4WomfJKMJISUl/NMNKsl0lboyI/6kyDO0ot0Q=;
        b=pPiEj6mZwpCKBOJjNus5Xgep/xDdXOmefZBNFxUJ0UkuxtFwSb7XiteXDD/RpgGXAr
         BtDEJWc5AdhX/vXUpOw+12FcNkAKUvzhMlI48wXzWp+WW1UEwmc9o7pM9AWh8dqIBS0w
         ZrK9bc1pxSOM9KL9OIjHF3orwkNxAaEqG+FnrPfu69Hma4U5VTk1wguOemxqhTIiqm2L
         upiwLu3nHLFx9jLs31fQ+jKAQiueaxsZBtGMBq/Hjheed++gxnRnuKJWk3AKIZMJ0xQj
         HNSwbGV4VXv9Yj5CY34Hh2c+Q62B8EZ/RaVBZDw4guBlx/HrhlmobCF3ZfZ7eOVK8UKy
         t1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PTx1KB4WomfJKMJISUl/NMNKsl0lboyI/6kyDO0ot0Q=;
        b=ogn+agSy3DAd7xc4hr2kejT8+J/CKqdktDM0J0l1y81nU4B/35lBBc0sJgIbb/2VXo
         nrYXixum9gNkiQZP5rlmIoUeuyDrIyywwFcLgoTqItVxNG8f2k/+Oj6RP1xSuLUXCN8B
         fda5my9Dh/tgZBuVwGyW81vfkns1Wxrhfqx6Ao6/3kNP8jyc87xDdynr7fhb8pzDsUmI
         mNdKjVArWbxa1pz+j9oyeCN3P2Y1NT25+ZCycZFCWxtcymg3fQFVJWl8RUOuOnUg8fsq
         sxIpOs9qtxwg6yBBiIrXiaYgsASRjq9f6EIz2MsneqKtDu7hxfrt4vzfApLXo8/iXOSp
         Gqog==
X-Gm-Message-State: AOAM530TedgvbD0BCL1k+v18q5EhDipB1F+4WN+XZJyxJ7e9NoVGUGJj
        3+tRxMatgu6aeCMmVw7PttTftw==
X-Google-Smtp-Source: ABdhPJyRHC2LN2rK2JG0ifUjrDVg3XtN1jTRkT7emzbh3uHC7nJPSWrn2om7LswmteBjqkTFI3drSA==
X-Received: by 2002:a17:90b:23c9:: with SMTP id md9mr5114923pjb.173.1597860328786;
        Wed, 19 Aug 2020 11:05:28 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id u191sm24353638pgu.56.2020.08.19.11.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:05:28 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 6/9] media: vimc: Serialize vimc_streamer_s_stream()
Date:   Wed, 19 Aug 2020 23:34:39 +0530
Message-Id: <20200819180442.11630-7-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Niklas Söderlund <niklas.soderlund@ragnatech.se>

Prepare for multiple video streams from the same sensor by serializing
vimc_streamer_s_stream(). Multiple streams will allow for multiple
concurrent calls to this function that could involve the same
subdevices.

If that happens the internal state of the involved subdevices could go
out of sync as they are being started and stopped at the same time,
prevent this by serializing starting and stopping of the vimc streamer.

[Kaaira: only rebased the patch on current HEAD of media-tree]

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 .../media/test-drivers/vimc/vimc-streamer.c    | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index 6b5ea1537952..f5c9e2f3bbcb 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -269,22 +269,27 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 			   struct vimc_ent_device *ved,
 			   int enable)
 {
+	static DEFINE_MUTEX(vimc_streamer_lock);
 	int ret;
 
 	if (!stream || !ved)
 		return -EINVAL;
 
+	ret = mutex_lock_interruptible(&vimc_streamer_lock);
+	if (ret)
+		return ret;
+
 	if (enable) {
 		if (stream->kthread)
 			return 0;
 
 		ret = vimc_streamer_stream_start(ved);
 		if (ret)
-			return ret;
+			goto out;
 
 		ret = vimc_streamer_pipeline_init(stream, ved);
 		if (ret)
-			return ret;
+			goto out;
 
 		stream->kthread = kthread_run(vimc_streamer_thread, stream,
 					      "vimc-streamer thread");
@@ -294,17 +299,16 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 			dev_err(ved->dev, "kthread_run failed with %d\n", ret);
 			vimc_streamer_stream_terminate(ved);
 			vimc_streamer_pipeline_terminate(stream);
-			stream->kthread = NULL;
-			return ret;
 		}
 
 	} else {
 		if (!stream->kthread)
-			return 0;
+			goto out;
 
 		vimc_streamer_stream_terminate(ved);
 		vimc_streamer_pipeline_terminate(stream);
 	}
-
-	return 0;
+out:
+	mutex_unlock(&vimc_streamer_lock);
+	return ret;
 }
-- 
2.17.1

