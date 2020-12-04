Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDA92CF7B9
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 00:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgLDXwd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 18:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgLDXwd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 18:52:33 -0500
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C81C061A4F;
        Fri,  4 Dec 2020 15:51:52 -0800 (PST)
Received: by mail-oo1-xc44.google.com with SMTP id y3so1815045ooq.2;
        Fri, 04 Dec 2020 15:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=xEkMnTiVHY+tC4E6hkhP6genGPHTd0rY7OtoiGotd8g=;
        b=rd0aiJ3ctb+1EhFlogqQIof+oUylf8/J7pGvmiqigxpJDioooFy/xANBc1OnaBeSVn
         vGfoaF0At8VJukQuiv7UX5YLX4AMwQ7B+ZlkTzzAvrBKADUjhAn/gjezQADZg+HNqYg6
         SyJYpebRTj+vQoWUWKel1L0jqNSoRHaPfflS6YryvVP269mn1ubj9QAG/LmzOf/5vheU
         FvZBOxmRLjs0BLo8VzmrYZ7zM0mvwQxfL2lZPWz/eNrjWO8ZJYZZCeJBzjPelR2kHqfq
         5HhiFF9mh75NBYgIe+UQdJc55+zhINqzuTByWRyVMK3iDfhewsAb7faQgsIDfGnUNh7P
         Nwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=xEkMnTiVHY+tC4E6hkhP6genGPHTd0rY7OtoiGotd8g=;
        b=WWGZAEwIQ+oOfJ4aITY8++WUGANKDYYkfz9hFS8O0oiNfLUXzmzBmVRQNNdlAbs4/B
         orOB37JF77aPefFS2BJRyn/ISqiv1DO0mmDdhOe5wxpKfKI3kxpbz1H9WwsBbzDX0jtD
         w4juYU1kmagY0nGoRDoC3SlGIqujsFpBtjLt1goMvT7mZwiXA3zMVIHLCZXn8WrcgIjR
         NpfnU3PFWXTnrwAycoE4OagWx1EPbbeyZbnR4gm5ppZKfMVhKFwIJ5eh6PJ7S30DaDG6
         9yP7xyRysq7EB66ytwkYg+X0khNgSAnTP2X5OuU4oUyuUixdnor5MBofkvD7y53ewnZp
         naHQ==
X-Gm-Message-State: AOAM533d7zU7gavW35Gsq/zYcu1Ujpb6yEr7CUx3ncs705A5ySSGzrRP
        KsRoFE06YV+LSNP+x8Bx0KKTrM98Vmj/Kg==
X-Google-Smtp-Source: ABdhPJypWDrjey6sPHgLyA6MYay2DhOehGE8F6wPc7fjNGF9WQu/jt2OVGaDwMyEY3yUKKD2D+Zebg==
X-Received: by 2002:a4a:4988:: with SMTP id z130mr2777945ooa.34.1607125911964;
        Fri, 04 Dec 2020 15:51:51 -0800 (PST)
Received: from linuxmint-midtower-pc ([135.26.31.16])
        by smtp.gmail.com with ESMTPSA id l12sm1026266ooe.27.2020.12.04.15.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 15:51:51 -0800 (PST)
Date:   Fri, 4 Dec 2020 17:51:50 -0600
From:   Travis Carter <traviscarter2@gmail.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging:hantro: Fixed "replace comma with semicolon" Warning:
Message-ID: <20201204235150.GA8626@linuxmint-midtower-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Corrected the following Warning:
drivers/staging/media/hantro/hantro_v4l2.c:319: WARNING: Possible comma where semicolon could be used

Signed-off-by: Travis Carter <traviscarter2@gmail.com>
---
 drivers/staging/media/hantro/hantro_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index b668a82d40ad..e1081c16f56a 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -316,7 +316,7 @@ hantro_reset_fmt(struct v4l2_pix_format_mplane *fmt,
 
 	fmt->pixelformat = vpu_fmt->fourcc;
 	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_JPEG,
+	fmt->colorspace = V4L2_COLORSPACE_JPEG;
 	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
 	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
-- 
2.17.1

