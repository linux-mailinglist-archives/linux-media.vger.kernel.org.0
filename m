Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D771C35A684
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 21:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhDITBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 15:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234869AbhDITBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 15:01:31 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695A9C061762;
        Fri,  9 Apr 2021 12:01:17 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id 7so6879705qka.7;
        Fri, 09 Apr 2021 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dggCkVFWKXm7BbwuV1M/eeJV+LFnVGWYUCSH1BrxITE=;
        b=eoD/75Lry9hYJW+NtaMx1kuHbs6Y9pTzAWqGmRHkW2kF6YA2vILYwTZkysqyIKsT8+
         TnZeYAmb0U9yvdQvjX09FuGZA0Lz2YEO34j8q5Ikks1lrkPX89+lo8w6ifWmcJo7x7Fj
         AJDqq5W98PpPeuXUds4KKh7guTwZPgA28JaFWCsCIH9XSeuI3bMLgZB0fRAjqgmXWGR8
         TdalXAUNp71Ck+dq6p9xpCorY1yXqMs1OfRx88gRqTPUGvopovi0czH2Y3tiRSSlhGhd
         zjEhQfdyOvasgd6MmcNrPR84DxyYufy25Z1I8aN3qNisWuZdK1oke4VNVNMzAdcpDXKC
         Vyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dggCkVFWKXm7BbwuV1M/eeJV+LFnVGWYUCSH1BrxITE=;
        b=KmNCMyG72FbkJmRXb1XjBZeEc9SrBKFvGCyuVFdqueb24A2qkkwJcR8wJndrg/Aup5
         f+h2D87YR+plbSTpmiJAsnCj6CRweG1rrGjVHdt8g01m2DL3woMYjikcuHlrHyFxYdb+
         v6l0pNADfiOn9wfJjq8AFC89Ar1BAOWn6rhJWw6oQqhqLw4nB7ZnmWj76X5qpNGBF9tE
         HdVL+l/vz8R01FWTPhSWip3ZYuNsLrRehKzfx6HfyyK14+LqdcxxPtVHCw7EXuBIHYN+
         4kjXckxlAy74WHygEZpt+k+Ml5mlxdLw2La29Uv1U9HylD6OQJRqXECoAT3Zpu3HNFqm
         z1Qw==
X-Gm-Message-State: AOAM530ABBmq96pKPpyhge7LX6b6GNvYhDrllAORU8UiRtGnrAEvKJSo
        olI7iPqgu6sgqUX4vI6O5zk=
X-Google-Smtp-Source: ABdhPJwLkehJzpMkS/f9rgVtrK0GiM31Fa1sZOds5K6XDrb5dYFdR2BbEIqsNXvMvGih9zIwJQuupg==
X-Received: by 2002:a05:620a:244f:: with SMTP id h15mr8950992qkn.235.1617994871845;
        Fri, 09 Apr 2021 12:01:11 -0700 (PDT)
Received: from focaruja ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id w78sm2409960qkb.11.2021.04.09.12.01.10
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 09 Apr 2021 12:01:11 -0700 (PDT)
Date:   Fri, 9 Apr 2021 16:01:08 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        alinesantanacordeiro@gmail.com
Subject: [Outreachy kernel][PATCH 2/2] staging: media: omap4iss: Align line
 break to the open parenthesis in file iss_video.c
Message-ID: <30cadc4bf072dc592cc82fba96a40685e25787dd.1617994571.git.alinesantanacordeiro@gmail.com>
References: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss_video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 66975a3..a2cef7c 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -399,7 +399,7 @@ static void iss_video_buf_queue(struct vb2_buffer *vb)
 
 		if (start)
 			omap4iss_pipeline_set_stream(pipe,
-						ISS_PIPELINE_STREAM_SINGLESHOT);
+						     ISS_PIPELINE_STREAM_SINGLESHOT);
 	}
 }
 
@@ -957,7 +957,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 		unsigned long flags;
 
 		ret = omap4iss_pipeline_set_stream(pipe,
-					      ISS_PIPELINE_STREAM_CONTINUOUS);
+						   ISS_PIPELINE_STREAM_CONTINUOUS);
 		if (ret < 0)
 			goto err_omap4iss_set_stream;
 		spin_lock_irqsave(&video->qlock, flags);
-- 
2.7.4

