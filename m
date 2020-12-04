Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19BD2CF79C
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 00:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgLDXiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 18:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgLDXiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 18:38:11 -0500
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C0EC0613D1;
        Fri,  4 Dec 2020 15:37:46 -0800 (PST)
Received: by mail-oo1-xc44.google.com with SMTP id l10so1806705ooh.1;
        Fri, 04 Dec 2020 15:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Hu+wkWbpBPezTyvSb2of+Vm89E29WSOkpzM3YXzuj38=;
        b=s53gSZHTQH7cvBh/vdbdcsZagopkO0fpu0/tXRVjv8ut6GBOgL1RMR7uIa4erod7Cb
         ZTetW+yb4/iMe3tZD/5+xe+GBAZmZcCK+XWwUf1/5j1o+cyuwkvFJ8ccg+c9DkvAlyCD
         DXgCwg5ApY8QF/d6IbAYylT5lEFbjTA57ODJhMZCNBQW2N4rVYYoNoTfFC6PJY3h799o
         HP1MzkRsZjPhyYeaTQ5nUcucJQ+SJDtBCFL8qkne6XIAgqeI9w5fCEBHv+E5cSOrqhjK
         jAYlyCZf8AwEvRhlswdLZ2tyvYmpPcKdtaxW+4OToSUFbAySWyvZaUpg5bURW0gGR0/Y
         G2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Hu+wkWbpBPezTyvSb2of+Vm89E29WSOkpzM3YXzuj38=;
        b=I/Q572pQcifArllBIY7U+I5DLQh315tufgAYie06m3gIwAbxlV+McbmP0tfAMIHjfC
         JAsuxMdWS+BJD7+axOev/Af4wPHXg/V7tHoCeDInJv44z2nnE7XvUZXA5S6GrP1fFXGy
         ap/oHC7g5x6SReBpBqsYyqIXvOQnd50FAeWr7GEZVpNvnFO3+0fcjJ70O4U9OQ75CYOo
         S1tK5eEXsJHGiDaeLSww1dzURFXrHa5WHwRVeI0bH9iuZ3UYxUYIVKE80sYaA2t4bmAM
         wx1rcaB/s+6I1l44l0UgKMmyHcI8ejEJ93hgDBZyZrsVwtk8c76W1/suDHScv6hCYG2m
         vKMA==
X-Gm-Message-State: AOAM530mvIxjUOCjCKv5LRp8SUXFP6W0xhasTSUHS08AhYxQ6lc7H4i2
        ygEeog/p4Zaj92wViAy0uWflut+SyKn7FA==
X-Google-Smtp-Source: ABdhPJzUH98nCflQCCHuadj2dET80eZLyv6NF8U5XbXxt95V+Oap0UpJh05+04/E7GpWUZU0MpSJwA==
X-Received: by 2002:a05:6820:131:: with SMTP id i17mr5320675ood.18.1607125065377;
        Fri, 04 Dec 2020 15:37:45 -0800 (PST)
Received: from linuxmint-midtower-pc ([135.26.31.16])
        by smtp.gmail.com with ESMTPSA id l5sm990439oig.46.2020.12.04.15.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 15:37:44 -0800 (PST)
Date:   Fri, 4 Dec 2020 17:37:43 -0600
From:   Travis Carter <traviscarter2@gmail.com>
To:     ezequiel@collabora.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH] staging:rkvdec: Fixed "replace comma with semicolon" Warning:
Message-ID: <20201204233743.GA8530@linuxmint-midtower-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Corrected the following Warning:
drivers/staging/media/rkvdec/rkvdec.c:133: WARNING: Possible comma where semicolon could be used

Signed-off-by: Travis Carter <traviscarter2@gmail.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d25c4a37e2af..66572066e7a0 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -130,7 +130,7 @@ static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
 	memset(f, 0, sizeof(*f));
 	f->fmt.pix_mp.pixelformat = fourcc;
 	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
-	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709,
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
 	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
 	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
-- 
2.17.1

