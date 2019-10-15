Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E18D7AB5
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 18:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387412AbfJOQBG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 12:01:06 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33851 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731936AbfJOQBG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 12:01:06 -0400
Received: by mail-qk1-f193.google.com with SMTP id q203so19667108qke.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bqomNJEQP+6JG6lhDyw8WOx0GH2movrYVMkAVxI04lI=;
        b=jxlBOMQMNcaSoOUpLgJn+4vbbHmd4UMotZOGwvB04O9+BrMByjBcIhmOinDpt8gH23
         KJBgPoAKhkGoROQHnk9pg3eW3IZm1PRCavpdK0ou3N2FWRT2TffWA+JuqvOZsFWyeB6O
         enyox4HpoQ54MPVNKj+J4Jw18GtlQF3cYibLx/JV4x2P0lPJC6BRiraVn9JbcdGDzzKE
         6hG6ZQ/adrMOrLAs163Jnc+l6FtcsEm28CUuZKLHsAtaElAwlL5eH0pqkfTT42jDJL5M
         nAlTdaiZ3KKoLPqoErQ1DBmNTIPaMRjFPjE/dRtq3rFXW5D0/NouZcNMx0MGqgpNwePf
         RjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bqomNJEQP+6JG6lhDyw8WOx0GH2movrYVMkAVxI04lI=;
        b=VeacLCVy62tI2BJF1XNKY9St26deGnOmh0B3ryxsuh4h/HyeDgU2uLTznzT/Wn1wtS
         T9uK9qZQXpHx+FIrdIhiuYv9aEe4nZasH6vNU1a0wxP5optMcT0nispC19Sw3nPf/2E3
         yJrgzypByTAn3/XUMuDjiiQGCbqL41LOYcgR1rBDzg95pOLd6+CZwqXfTV7UXhOjJ2a9
         CxI6s/yESFih+12Weh2wX3Reg0V6ysw3uymBQD96m6ZSnQNXlwTdv4puuHWKS0i91YvA
         1cRGtJdHJXKIebrDjtsX5K+8vK1SkAR7UQnRfAuuwFtDIqM9EiWRGdzAz0wmcUWdVv8A
         fL9w==
X-Gm-Message-State: APjAAAW+iUYIt9BWUE1UMhs5xG4RtWYdpdjMUe6okdx85UUDYDbedztJ
        oOruKtcirNmNTB0TKZEs/js=
X-Google-Smtp-Source: APXvYqxGqol6nxM8K7a027ynAQ4AK67y1zjzqufH99ggOhHJ43M3Ptv40IU6W4UWHejC3f8+D4TQrw==
X-Received: by 2002:a37:aaca:: with SMTP id t193mr230426qke.66.1571155265282;
        Tue, 15 Oct 2019 09:01:05 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id n21sm10304930qka.83.2019.10.15.09.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:01:04 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, slongerbeam@gmail.com, tharvey@gateworks.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 4/4] media: imx.rst: Pass the v4l2-ctl configuration
Date:   Tue, 15 Oct 2019 13:00:42 -0300
Message-Id: <20191015160042.28113-4-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015160042.28113-1-festevam@gmail.com>
References: <20191015160042.28113-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pass the v4l2-ctl configuration for the imx6q-sabreauto PAL
example for completeness and consistency. 

Suggested-by: Steve Longerbeam <slongerbeam@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Newly introduced patch

 Documentation/media/v4l-drivers/imx.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index aab68d8ef2c9..1246573c1019 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -564,10 +564,11 @@ alternating fields (field type 'seq-tb' for PAL, or 'alternate').
    media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
    media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
    media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
+   # Configure "ipu1_ic_prpvf capture" interface (assumed at /dev/video2)
+   v4l2-ctl -d2 --set-fmt-video=field=none
 
-Streaming can then begin on the capture device node at
-"ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any
-supported YUV or RGB pixelformat on the capture device node.
+Streaming can then begin on /dev/video2. The v4l2-ctl tool can also be
+used to select any supported YUV pixelformat on /dev/video2.
 
 This platform accepts Composite Video analog inputs to the ADV7180 on
 Ain1 (connector J42).
-- 
2.17.1

