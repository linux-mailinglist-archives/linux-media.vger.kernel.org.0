Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A1124A596
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgHSSFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbgHSSFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:05:43 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0727C061383
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:42 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y10so9639389plr.11
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I7Vn+tJdn/z3Gni7/IFrsXgR9xBszu9wFJcFR8d7t7c=;
        b=DAYZaEy86+xUJSGKApxyGOw1UJsAyjFkzMLM5tSg7n2TcH2yRwDqVl0cjq3+FBqSA1
         /rnPQh63tAwDge5VU8SR1vv0qKuje10IoqObeSEiAz3siLzce6e+Cv7UL0XNeFhzAEaw
         dinBxzAhcZlbdv8B+vDAnpD97Oefe7d4exSRz4g9obzEdBPXx7xwCdDFm5KqSZLjNSKv
         qBAxfA+xiMm4NugXUax/c5nuyBeszPMMostAdQcq0txo9xXH//20g6guUIAUQVqyZjlJ
         +KW1RCsZyNtyrSF4NnKa9U/sslH+g8I8H9x45oXuBDQCguoObxbsPVhoEwTGpmZ9MrnV
         q/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I7Vn+tJdn/z3Gni7/IFrsXgR9xBszu9wFJcFR8d7t7c=;
        b=lLPLhyK1Z3frUak0RmUuknq40l6DLpKtprt2EeV12tFbFiJXytbbSACe/Exmm7yyv5
         xNHYGupmYKrBSHqh1Y8U7AZj2vqJTk91BaFmngvckl6GrZYBhfNsNkuy3oLgvwuiPVua
         X3lXo7mAr1z7gRQemK4vkyKZOFKJ5EZizmJXbqjVreflNmPFFbBhKerp22JAjD39xHkE
         z8S6GF9TPuTdKBE33czu6NtY/xn/X1YVmy76paahLrCvoBxZnEhkI0XzVVvwXugRA2Eh
         0HNNgntqx6I28TQqPU4JhcO1N+6c4OrbkiiiZluC/IS+Upkzf77PPMt/WAtOgXM8rsd0
         o3WQ==
X-Gm-Message-State: AOAM531xWsQXhkj8uk2obrOVMty3GlKZB9lCdu80rrgxo2LLtJ7CCyzz
        MVzguAKmE4duiylk7iX1E9hWKg==
X-Google-Smtp-Source: ABdhPJyFtSuf7vdw1h+onygga6DWqg010sj+RfgrrKxlJCVvaedkEPdzyOYvrUG3H5hWOzC4xQGrMA==
X-Received: by 2002:a17:902:8504:: with SMTP id bj4mr192134plb.231.1597860342514;
        Wed, 19 Aug 2020 11:05:42 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id q2sm28843271pff.107.2020.08.19.11.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:05:42 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 9/9] media: vimc: Run multiple captures on same thread
Date:   Wed, 19 Aug 2020 23:34:42 +0530
Message-Id: <20200819180442.11630-10-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If multiple captures try to enable stream, start their stream but do not
initialise the pipeline again. Also, don't start the thread separately.
Starting their streams will update the use count and their frames would
be processed by the already running thread.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/test-drivers/vimc/vimc-streamer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index fade37bee26d..880c31759cc0 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -275,13 +275,14 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 		return ret;
 
 	if (enable) {
-		if (stream->kthread)
-			return 0;
 
 		ret = vimc_streamer_stream_start(ved);
 		if (ret)
 			goto out;
 
+		if (stream->kthread)
+			goto out;
+
 		ret = vimc_streamer_pipeline_init(stream, ved);
 		if (ret)
 			goto out;
-- 
2.17.1

