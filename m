Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B63A359E8D
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 14:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbhDIMYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 08:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbhDIMYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 08:24:41 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6E2C061760;
        Fri,  9 Apr 2021 05:24:28 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id c123so720188qke.1;
        Fri, 09 Apr 2021 05:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FFyKVQiiCs5puSz3WES2iYZgay4qT5NEj+d2mqioyWY=;
        b=Z3neBw2YL7iaEMhoqCq7Li4M/YjKFuEfckanqHotLbExe4Q2djjXb2dGWlQqaW+c8r
         CWvZOzcCZy/G/+pXQwODwqD88jKLpOvotARANlWv4dzd4AI4RaW2K5cTrui/rm3MoQ7z
         KO1kHhuWblajOaR/KW1xCeGbAA6mk9OIdWNIfXBzm0q1R4t/16OJSUmA/fGdO+Bn9OqS
         kXkRLc1nxXJOgBllIlegiWn3VYcwu71Bam+eRczRJEB9Epojo0a4z+I+GAvAW7zzz9Nq
         jj1K/ZDHyp5OxRXgolrvGk+QuOI2m451xzAiaQ65vYZHzZo7D5yBbhbxqTgIj3EbyB04
         o1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FFyKVQiiCs5puSz3WES2iYZgay4qT5NEj+d2mqioyWY=;
        b=C9nTrIjIMk3MzcK628MrwkQUib+jgABeL2TOMjHHqGAXrN+yRYaP6rHykjAjDiXoLf
         pw3hEn4Z6NktO3VIGkNIVRBk0A+HZOjOOY4spq6jf1N7a4HGLFXRAAeyLmiu+ctHczJ5
         vEx/BSodWS1ZQrZ8PZrTtO8HtsuLBYTXybSQXqca1f/BBgNGPTfuJ+RVA08s3lujwoN1
         aeQABfdmJbuTuCV9jr7Aa0JQyndB4JV5xMwSR3mlY3FfrYNVHtcLaH71fOshQbkSMf2A
         aP8RzkQ+RvFezqA4JnA44eGWebazh+ruHir1qE7IMtlomD+Tpez8lViTiMFp34AC6jvp
         Ijag==
X-Gm-Message-State: AOAM531Lqh7G3eRA4aSkDasEbkodvYc5HS5IUdib6am9mGWsx6Boid3s
        4jjczRKoYInoGFqAhSWHQcEz4TDhZMfOpZnC
X-Google-Smtp-Source: ABdhPJwZO170GmUfRXKwffIyZXccIeGIdNKr6SdeRDoJHGlHzqzG68TuosmYyukDuZKxo2ckJXrT1A==
X-Received: by 2002:a37:93c2:: with SMTP id v185mr5189190qkd.179.1617971067966;
        Fri, 09 Apr 2021 05:24:27 -0700 (PDT)
Received: from focaruja ([2001:1284:f013:b099:8056:1dc0:5a27:acd7])
        by smtp.gmail.com with ESMTPSA id k4sm1610193qke.13.2021.04.09.05.24.27
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 09 Apr 2021 05:24:27 -0700 (PDT)
Date:   Fri, 9 Apr 2021 09:24:25 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        alinesantanacordeiro@gmail.com
Subject: [Outreachy kernel][PATCH 2/2 v3] staging: media: hantro: Align line
 break to the open parenthesis in file hantro_mpeg2.c
Message-ID: <790e0b3def9e7bc747122c9b6f336b857cd05d11.1617970550.git.alinesantanacordeiro@gmail.com>
References: <cover.1617970550.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617970550.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
Changes since v2:
 - Rename the commit messages properly
 
 Changes since v1:
  - Send patchset without the cover-letter
   - Rename the commit messages wrongly in the email subject only
   
 drivers/staging/media/hantro/hantro_mpeg2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_mpeg2.c b/drivers/staging/media/hantro/hantro_mpeg2.c
index 1d334e6..53a99a9 100644
--- a/drivers/staging/media/hantro/hantro_mpeg2.c
+++ b/drivers/staging/media/hantro/hantro_mpeg2.c
@@ -19,7 +19,7 @@ static const u8 zigzag[64] = {
 };
 
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-	const struct v4l2_ctrl_mpeg2_quantization *ctrl)
+				  const struct v4l2_ctrl_mpeg2_quantization *ctrl)
 {
 	int i, n;
 
-- 
2.7.4

