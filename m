Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87EC9498656
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 18:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244330AbiAXRUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 12:20:09 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:38886 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244234AbiAXRUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 12:20:08 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4JjGvW29tNz9vBrr
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 17:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id S_Zww3_P4wyo for <linux-media@vger.kernel.org>;
        Mon, 24 Jan 2022 11:20:07 -0600 (CST)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4JjGvW09Khz9vBsL
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 11:20:07 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4JjGvW09Khz9vBsL
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4JjGvW09Khz9vBsL
Received: by mail-pl1-f198.google.com with SMTP id cp2-20020a170902e78200b0014a9f3e3c1fso3686920plb.5
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h2JRhxJChDjEc19BlDKaMcq9FWna7cgcELD3wcsjdNU=;
        b=cLr2eZY/tB17jFSJpyIuavnaaKRSot65n47sX4pg2kXWeHCNNiNv0NxQP5piROKKIX
         PHvIByc4s0VikEHclosLcdrBdQMbKRcWLR0InVEWc1sOLIVpmvjxlQW3Cu7QT5/jPWsN
         kBgbUJd9UOADE4XYM/zR28Q4DDeDvgrPj76RIXiIRr2WhqVRRcy9uPTEI4cj65roLvIe
         dkv+NGn5xwg3osmJ4DJ2NLOYfH5938mUPLDa0mgkTmVp1FbtVEezVawTbdcyktJW+frE
         p4z288MAJRvsm8kUDMcO3BVXJclG9OKEal6fRwRxh8aqLBp4CtxYoyPwF6Lh+qaOnEHX
         rmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h2JRhxJChDjEc19BlDKaMcq9FWna7cgcELD3wcsjdNU=;
        b=6+nK5gY9PnV83oOWQt7S6HBj7aFhBM5EqEpNt6zPDFVf2H6IFGlUZnp4dmbbAcWUau
         mxkuy79+kQapVCGf76khcALqo0kmtpRlOPzrdb52yHQhKEjejSK3nHILp15fmQYNC6CA
         +UWBlciOC9HHH64qGCEFtPBqjJ80/r9q+2Ze1J8GUvUQ372QpdiliHK/WLxt3U5FdXJL
         vA/7+OpUY6J+oO5FecBgNp+kVrqXbbLHYTa2NmQCMKETum/Ix6UBTuu9SeAwdPDXSYpz
         ubagFmTi+UAJhn9uPHXfuaOb2V/KKjtCTSiZoCGHBgV1Ch/7gAkv6m6FVwMEbVOQlAWg
         I8CQ==
X-Gm-Message-State: AOAM531sVxXPKWYrVoBbN0GwnqQFUtbnXz/Pdoq7dBonoftsyEEEcnZ4
        NI82G6b3E1l4HvR5fP+aosY2Jm6yA4gUBtRLpWyrfiCCEIaK3X2d9kyo7CEOzoBovgIgtGoRZ0F
        z5QpxhP0U+w1jR/Rox1Dsf6ilNAs=
X-Received: by 2002:a63:fe10:: with SMTP id p16mr12354433pgh.546.1643044805995;
        Mon, 24 Jan 2022 09:20:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXGYkHlV1znfzG4/WeKqTtvwoYa0BJ9/DXjKeFSmVu0fri6iZ3upKqAPfaCzXONy8SZSnWFA==
X-Received: by 2002:a63:fe10:: with SMTP id p16mr12354417pgh.546.1643044805734;
        Mon, 24 Jan 2022 09:20:05 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
        by smtp.gmail.com with ESMTPSA id u9sm17604761pfi.14.2022.01.24.09.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:20:05 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ti-vpe: cal: Fix a NULL pointer dereference in cal_ctx_v4l2_init_formats()
Date:   Tue, 25 Jan 2022 01:20:01 +0800
Message-Id: <20220124172001.62457-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cal_ctx_v4l2_init_formats(), devm_kzalloc() is assigned to fw and there
is a dereference of it after that, which could lead to NULL pointer
dereference on failure of devm_kzalloc().

Fix this bug by adding a NULL check of ctx->active_fmt.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 7168155002cf ("media: ti-vpe: cal: Move format handling to cal.c and expose helpers")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
--
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/media/platform/ti-vpe/cal-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 7799da1cc261..3e936a2ca36c 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -823,6 +823,9 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	/* Enumerate sub device formats and enable all matching local formats */
 	ctx->active_fmt = devm_kcalloc(ctx->cal->dev, cal_num_formats,
 				       sizeof(*ctx->active_fmt), GFP_KERNEL);
+	if (!ctx->active_fmt)
+		return -ENOMEM;
+
 	ctx->num_active_fmt = 0;
 
 	for (j = 0, i = 0; ; ++j) {
-- 
2.25.1

