Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6444985E3
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 18:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244129AbiAXRHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 12:07:40 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:36776 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbiAXRHj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 12:07:39 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4JjGd66LCgz9w2xx
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 17:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xLqYEkXkpoEW for <linux-media@vger.kernel.org>;
        Mon, 24 Jan 2022 11:07:38 -0600 (CST)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4JjGd64F2Yz9w2xr
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 11:07:38 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4JjGd64F2Yz9w2xr
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4JjGd64F2Yz9w2xr
Received: by mail-pf1-f197.google.com with SMTP id d9-20020a62f809000000b004bb5ffee9b3so9552042pfh.15
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 09:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bwacIyhw4ndT7Q8gzdzBTG/k+JrJsO2KqpjmIUL+vWA=;
        b=kJI91Vo7bN27z4B9JgEUCwzA8BYCtXAdsrJ4FHRzwnK64pe3UPnwWC1F0cAGOtZ7WG
         Q+88wHxzRN6/WrCSylWwmTG4jmJJ6i2+e5duI47qvf0R66Rz6hoYxplW21WD9Hy7PLZy
         py9092c5AXMrwBn+lzMOcQYIsP3dkSAMJto4d32KMFkO3G3u8GVXF+wBgDYbFwtlD4Ga
         ubmyLflng7RPkmH10M+jwZoJ2demX0+SmJLokvvSZy1SUuK9Ascu7NDXRo5OL9jVx7Jh
         jj2UH9Wn57Ne7QcoP4GoP2ITElgufFyQ5TRan3ToN4maFclNLlM/WUfp4hiasmMMwH+p
         nJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bwacIyhw4ndT7Q8gzdzBTG/k+JrJsO2KqpjmIUL+vWA=;
        b=u7WLKfmWXlpSYDKUAQJGA3SHZu4thCyNY6O/GmT/rB89k+wbsfMFCH2Gl8AvRvP7ml
         sakRy3Wgh4VX/0Tl3nWKHVGf/xaUb4RTbwSKWu6tuvt6QtfrdjKLx9JATAy3xMvM63Wu
         gaHh0/cex7s1DNTRXeruAMBXtya/PtGSYoncfhvzYgbXLf++1bavOuAHKl/0MCS0fkPu
         H0xSJ+3nSTwVXrAEGfU1rHtenR0uIMjhyStxbOSjnWBrEt//b+hV+LqB7fDE2THz5buo
         UuI7WoBPhXZFJfLUXdTQAqhToV5zxhgwB9Sat/mBL61807L3Ex6TZ2xVJaIEnM0y44F8
         b1fQ==
X-Gm-Message-State: AOAM533L3o66vCXGWKTaBU5YyYveG8Ch392C+AqcpX60jtyu8BGgHM7Y
        aPv+pkETc307gpVTuUmD/rcZYZsACRRpt6B3xR4YsObXWP+7lNQwVkDOEY5gQXsLIF1EGpfccnS
        Spvt/+qLcyB+9wBy0At2nIOcWakY=
X-Received: by 2002:a17:902:8ec9:b0:149:8864:cfd4 with SMTP id x9-20020a1709028ec900b001498864cfd4mr15147410plo.16.1643044057821;
        Mon, 24 Jan 2022 09:07:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxphJVDZw2235x19mcgfApB+cYhwOKywYswD+mgI1+aI4SfPA9f1zN9tdRsco1iPLSlgQhNqg==
X-Received: by 2002:a17:902:8ec9:b0:149:8864:cfd4 with SMTP id x9-20020a1709028ec900b001498864cfd4mr15147388plo.16.1643044057532;
        Mon, 24 Jan 2022 09:07:37 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
        by smtp.gmail.com with ESMTPSA id ha21sm13030092pjb.48.2022.01.24.09.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:07:37 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-vcodec: Fix a NULL pointer dereference in mtk_vcodec_fw_scp_init()
Date:   Tue, 25 Jan 2022 01:07:31 +0800
Message-Id: <20220124170731.59240-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In mtk_vcodec_fw_scp_init(), devm_kzalloc() is assigned to fw and there is
a dereference of it right after that, which could lead to NULL pointer
dereference on failure of devm_kzalloc().

Fix this bug by adding a NULL check of fw.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 46233e91fa24 ("media: mtk-vcodec: move firmware implementations into their own files")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
index d8e66b645bd8..aa36bee51d01 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
@@ -65,6 +65,9 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
 	}
 
 	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
+
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.25.1

