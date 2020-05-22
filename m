Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEF51DE0AB
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgEVHL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728437AbgEVHL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:11:56 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DF3C061A0E
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 00:11:53 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so4610269pgg.2
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 00:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=KrAu9c7HI3tm64GJUzPuUL84G8UAjLUaFrddGBaQxRE=;
        b=W9RzfBvxrXEHJYxnSECp46QOeLQ1Sawo2Kzb6wXbPc+H+t/7wteHtOmeJqEPgQ2gmy
         87LydWqAmQiEYU4Otz5l5MUnDrKqSeBCuPiq1dBBesg3UWjNNRcuD1tIDJZbUPrCya4v
         3JRUNHkXg/CZZJzydj3UyCrA0V9o9CvTKlaRSEwdPcanrlN4cz8PugMCyKoilvzSgRCj
         Wozbf9m54kJKeVnkgPibH2KoZqjhryWRUjYp/f/41Ox58jxQ4+1lYN8/ofuVo7Gwh1+U
         r+qLDb1IYP3WLBqNkZ24J2KXeNL54NLmhgZpJjNqqwvuHARt7usTQnqEXCcITMlcSvNW
         y3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=KrAu9c7HI3tm64GJUzPuUL84G8UAjLUaFrddGBaQxRE=;
        b=UB+FYarkjDfsW8bi58Zq4X/M1rvJDsdYqE9kbaHIKpOtqPCsA8lDQ+auR5EePP76rq
         8F1mN71kC2/pvfbXXMKaj0QfqteM7pVsM+xCfqf72cfhrAJmY66py1QBkXxtWrtYi2zL
         LRvAo3VN1AxTPNCZMaT1/Q9pqvfdUxP0U/OkO/KYQXgthz/V9N7CIwEl/YEKF5Ka3Nge
         18XMxPT5BXVeEoZz4O0LGXfDuvOk4t7IiNYv6iauQTapNEHhsZygntzTdF9XkZ6s/mcf
         WpocviI0tQ/1Qwu7DcPQ0/pLXZcFeao5GaDy/Tj1thXfPLRVbRcnDPR4oqDKmJEx+BVs
         rDkA==
X-Gm-Message-State: AOAM530Wr4FpLrAhX9btPoN/SN4Yady1b9N7w4Jh0Ub5M2S6g/VMiNmX
        UGtmlfTsTEWW9M8eMOVVJ6zFqc/lYYiTUA==
X-Google-Smtp-Source: ABdhPJzHXzAAH9qKcJl5pJjL9aKuGvTyeZf2pspV63w9zgjSD9rZqz7DQs0aZM5fPqp+Hug8Rr54aQ==
X-Received: by 2002:a63:5f41:: with SMTP id t62mr12728010pgb.252.1590131512519;
        Fri, 22 May 2020 00:11:52 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.155])
        by smtp.gmail.com with ESMTPSA id v27sm6208530pfi.61.2020.05.22.00.11.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 00:11:52 -0700 (PDT)
Date:   Fri, 22 May 2020 12:41:46 +0530
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: vimc: Apply right blue and red channels to BGR
Message-ID: <20200522071145.GA17375@kaaira-HP-Pavilion-Notebook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

rgb[] is already calculated in the right order, there is no need to swap
the blue and red channels in it for BGR images. Hence give right rgb
channels to the src_frame.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/test-drivers/vimc/vimc-debayer.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index c3f6fef34f68..d41d9f6180df 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -318,21 +318,11 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
 				       unsigned int col,
 				       unsigned int rgb[3])
 {
-	const struct vimc_pix_map *vpix;
 	unsigned int i, index;
 
-	vpix = vimc_pix_map_by_code(vdeb->src_code);
 	index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
-	for (i = 0; i < 3; i++) {
-		switch (vpix->pixelformat) {
-		case V4L2_PIX_FMT_RGB24:
-			vdeb->src_frame[index + i] = rgb[i];
-			break;
-		case V4L2_PIX_FMT_BGR24:
-			vdeb->src_frame[index + i] = rgb[2 - i];
-			break;
-		}
-	}
+	for (i = 0; i < 3; i++)
+		vdeb->src_frame[index + i] = rgb[i];
 }
 
 static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
-- 
2.17.1

