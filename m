Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CE14986A6
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 18:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244529AbiAXR0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 12:26:34 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:54662 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241604AbiAXR0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 12:26:33 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4JjH2w3DHmz9vCBk
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 17:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XIiPNDiQuU29 for <linux-media@vger.kernel.org>;
        Mon, 24 Jan 2022 11:26:32 -0600 (CST)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4JjH2w16z5z9vCBB
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 11:26:32 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4JjH2w16z5z9vCBB
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4JjH2w16z5z9vCBB
Received: by mail-pf1-f197.google.com with SMTP id m200-20020a628cd1000000b004c7473d8cb5so4932297pfd.5
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 09:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=czqapdsjldzHDHmZDh77wEKUMnkRN/WzBeGiMFeLjy4=;
        b=jIcOOx28BTqEC2howlRgn7j2iZaxT80LHLhIl/uZJgOAZ6l8DDOTB0U/ZVASRVtGwK
         2xQBXx8BXKaOzKZb2HeWkPx89o4Wk+IHULaPk2E6cjNZb1xvK0fmxntsFkces8PWsXb8
         AEQVI0AnnA6f0/ZEqE1qWkuesh4kaQ5ILBXWAEFHC8GTFuM97mHeZThgGEiK62QJrSOv
         oSCt+HzgRwlfipa20IyQgVEcbLkyVrrgdyl0P5YFaXFi0m2xpPTaKUu5PVRuBFjszsG5
         pTF33XwqE9uwC8Vj4yKd1m5HWoAMdSyAefETDtOSsBR0/iPHvbXYf0M90YmFkluhV23o
         TCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=czqapdsjldzHDHmZDh77wEKUMnkRN/WzBeGiMFeLjy4=;
        b=4IrrziDp1n6waMPHaAcBTH8hYqa+Am1PCNosxawi48FWpnUNXp22Mu+nf8XunDzdds
         fAwC4a/JyT3VYE7fXHp3hGgYMHtjTNeNYP/Ta40Jws89wyDVR47Op6wBazLWraYWdyCn
         11f+yISKRR/zOSwwQHuPQS+Al+1rQJ9E1HG0VotNPJmn23mOh5qoS5ill2nEplVpPRpe
         BTjdwst07BJGtkuEXuFoaOdQ4Ywyg7taceOedNqGOS213PbOw5kxJ40SQyMgcbJUMCVc
         wwSF4H64FjTiUPMbVxBO+G2LpkA5cZfkHxoBvxIvXuY5wM5qGSLFfNukcIN8cukx/iOS
         +qrA==
X-Gm-Message-State: AOAM53150UN1FAPT9Arky38BMyOKUDCoABp3S2iPA7WvslxQGhWwTLi2
        k7+aoObWp7UBV3KiaA+Dfys0Rk1rSO+O5z8X3uxiwszkRQUteh78tt4siT2HHr4fArAf+W1lgHt
        9ORgPgM5Clta9XXsBlDpj2ofgF6c=
X-Received: by 2002:a65:56cd:: with SMTP id w13mr3795006pgs.605.1643045191403;
        Mon, 24 Jan 2022 09:26:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwypVNOTlfSfn3SeS469NjBrw2g3mHUY2qLM9l4nD+JzlTRAJNJyYPlPCGnPkUH9FyanFoCQ==
X-Received: by 2002:a65:56cd:: with SMTP id w13mr3794981pgs.605.1643045191152;
        Mon, 24 Jan 2022 09:26:31 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
        by smtp.gmail.com with ESMTPSA id q17sm184958pfk.108.2022.01.24.09.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:26:30 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Fitzsimons <robfitz@273k.net>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: bttv: Fix a NULL pointer dereference in bttv_overlay()
Date:   Tue, 25 Jan 2022 01:26:24 +0800
Message-Id: <20220124172626.64077-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In bttv_overlay(), the return value of videobuf_sg_alloc() is assigned
to variable new and there is a dereference of it after that. the return
value of videobuf_sg_alloc() could be NULL on failure of allocation,
which could lead to a NULL pointer dereference.

Fix this bug by adding a NULL check of new.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 7c018804c090 ("V4L/DVB (7197): bttv: Fix overlay divide error")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/media/pci/bt8xx/bttv-driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 6338f98d845d..5aa46593ddc6 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2552,6 +2552,8 @@ static int bttv_overlay(struct file *file, void *f, unsigned int on)
 	if (on) {
 		fh->ov.tvnorm = btv->tvnorm;
 		new = videobuf_sg_alloc(sizeof(*new));
+		if (!new)
+			return -ENOMEM;
 		new->crop = btv->crop[!!fh->do_crop].rect;
 		bttv_overlay_risc(btv, &fh->ov, fh->ovfmt, new);
 	} else {
-- 
2.25.1

