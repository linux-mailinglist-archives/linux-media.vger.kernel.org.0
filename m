Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BB6359E8B
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 14:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbhDIMYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 08:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhDIMYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 08:24:39 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874C3C061760;
        Fri,  9 Apr 2021 05:24:25 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id i9so5565824qka.2;
        Fri, 09 Apr 2021 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jyczLaaY0sNtj0e3TtnM4UT/9174zU+EdBPCktijCsc=;
        b=j5jCXHvdsR1dteY87/+g0UH9fhghNuLew4SUu5z4F6sFpuzDFvptdCQpIU5c+KJX2Z
         qz5j9KB1mWjOUdmD94iF0YNnvm27HsS96Xw1zm4ZhEyqBQXBqo1Ia0K2XImX6uwK/tf6
         THbpTjVdybP32fy6WU7ZhCIR1crEFcsW9oH8iXwSempQK127T6M17XwaUbwbMn/zdHAg
         Nsdoyus5WHesDPHiZ+ikmIqvJdmnpAih8wluIGB+R9iuR2UlWZ4CTS9rW9XbevQ03DYd
         GSbWWaLxehaFXPFnr+LMiDB3ziIvaes6doson4vO38jZ13TPCTvGcM57JRonbh4Q9x/V
         Bikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jyczLaaY0sNtj0e3TtnM4UT/9174zU+EdBPCktijCsc=;
        b=scSlbJJufl2wqzbGWJ6NX6DaBvMKB7K0KL7xREL1O1E+CnHFJD615aVa9he1P3NFNk
         IB++jRdmhGhBxvUMVxTKrK7bl30ifDqD+OAdMuRPwUhs+5XULYP+VRw9/HZvoHKD5Q05
         SKCmVyzaz9I1LdioyskRjEWvKp58Wpi7U2FIPTG7NLzQHLeERdgYGzhe9dU/lt90NQEE
         nLFvc2JRwG0/4umxMYDYQ/AxqkSkAMce3csMOzPhyn+he7hmExvd7XOWPib/7rOU6o6/
         ZWdUr+yVTsZMDISS0jH5RZjAfXEPlJ3s/YaIXgT8Bj3vD6aBOaIUmMtpDhDgqcZbXXrL
         KOSw==
X-Gm-Message-State: AOAM533N0GbPLrElBypf33uSrJ/w6uxawltQUexxTatAsP0tjy0G414q
        wf0PWTa1Xj/whlzi+2lu7aQ=
X-Google-Smtp-Source: ABdhPJwJ36OigBAETDHN9/NWW7ajp0B5U0PqbIPQ3QUSqAAr9bYSTDaU/cLvvVHs7IakYpm2E5/E3w==
X-Received: by 2002:a37:a58f:: with SMTP id o137mr13175093qke.482.1617971064712;
        Fri, 09 Apr 2021 05:24:24 -0700 (PDT)
Received: from focaruja ([2001:1284:f013:b099:8056:1dc0:5a27:acd7])
        by smtp.gmail.com with ESMTPSA id x24sm1657962qtm.95.2021.04.09.05.24.23
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 09 Apr 2021 05:24:24 -0700 (PDT)
Date:   Fri, 9 Apr 2021 09:24:21 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        alinesantanacordeiro@gmail.com
Subject: [Outreachy kernel][PATCH 1/2 v3] staging: media: hantro: Align line
 break to the open parenthesis in file hantro_hw.h
Message-ID: <03fb1d7b8066fd6fb6086fff18cf29b9afd9ac17.1617970550.git.alinesantanacordeiro@gmail.com>
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
 
 drivers/staging/media/hantro/hantro_hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 34c9e46..a650b9c 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -207,7 +207,7 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
 void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-	const struct v4l2_ctrl_mpeg2_quantization *ctrl);
+				  const struct v4l2_ctrl_mpeg2_quantization *ctrl);
 int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
 
-- 
2.7.4

