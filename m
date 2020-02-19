Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF796164F63
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 21:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgBSUAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 15:00:43 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36562 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgBSUAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 15:00:43 -0500
Received: by mail-pl1-f193.google.com with SMTP id a6so515257plm.3
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 12:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=fmDci05JHgVKjcgLPSVfqdV3CiFfxgAZngf1Re3DIhY=;
        b=IzvE2I3IpnWm6NE2Ng5/GGEuVLFwyvJlma/2j4jiSayqmL7fZvL7kfydyrijoVplQ+
         ASCRNMkgO7D68tZ50d9B/8VrV/u68HMSx2UPoXoiG9ChvNQXMeQDTfwSp0NWGMLbHq1l
         FAYYZTNOq2x/zjyfRkrlAMNF3Jjrmq2VDjY6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fmDci05JHgVKjcgLPSVfqdV3CiFfxgAZngf1Re3DIhY=;
        b=a18bdMTRam6fYB3w4OpJxVBtsE10n/1WBldj0+HeSmbg4x9fSC0+k8kqEIgfxBDYRc
         ep6J5MX7EwWcQPvITNhIvxydHNB+Pc1MzO5ns6Eavm8oenAhSz2VdITCKf3jjflawdTj
         nWGxYR/Gs2Jm1m7/k82+/BbosH5CfGfo5f74F2ONwBZa9SwyKCJiWpqQzfewaMiC1vh+
         QcixCQKTzTrw7xlhosuWG5CQilIyw0fT9TY2D+er0Ovw6k6bJaouYQpT2KoLVbmfvKeN
         u6OLxiqH88ILDu5IphMlme0/6r/ctyMdy5WWgh0g+gMPlpv/qkJIBxGSZ+PgnyIHMnwv
         hHUQ==
X-Gm-Message-State: APjAAAXQOVgU5f+nuBSttw3CDUlqxVZ9WJcv9rFI+w1iUzF5OaJ8riAx
        scIIu4zsENYnSwF+hZP5hNlo0A==
X-Google-Smtp-Source: APXvYqzpcl13F5RQ5GygW2x7suYzcJF08duSYixNAJ2FvzcdSkb52Y+MCajGLFfYVA8rX3sUwWjzwQ==
X-Received: by 2002:a17:90a:f012:: with SMTP id bt18mr10864393pjb.8.1582142442905;
        Wed, 19 Feb 2020 12:00:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d1sm498600pgj.79.2020.02.19.12.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 12:00:42 -0800 (PST)
Date:   Wed, 19 Feb 2020 12:00:41 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Benoit Parrot <bparrot@ti.com>, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Fix typo in "TI VPE/CAL DRIVERS"
Message-ID: <202002191158.2BB5431@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The recent MAINTAINERS entry change for "TI VPE/CAL DRIVERS" broke the
file format as it skipped having a line prefix character. Add missing
"F:".

Fixes: 2099ef02c6c0 ("media: dt-bindings: media: cal: convert binding to yaml")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0d86490c2c6..8f95de7f5eee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16752,7 +16752,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 S:	Maintained
 F:	drivers/media/platform/ti-vpe/
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
-	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,cal.yaml
 
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
-- 
2.20.1


-- 
Kees Cook
