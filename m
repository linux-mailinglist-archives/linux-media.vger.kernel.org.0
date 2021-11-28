Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A48460688
	for <lists+linux-media@lfdr.de>; Sun, 28 Nov 2021 14:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357577AbhK1Ngf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Nov 2021 08:36:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhK1Nee (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Nov 2021 08:34:34 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C683AC0619D4
        for <linux-media@vger.kernel.org>; Sun, 28 Nov 2021 05:24:44 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id c4so30439247wrd.9
        for <linux-media@vger.kernel.org>; Sun, 28 Nov 2021 05:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V4B0XKpXquoJyaIL0mskRvebeDdCLQLvdHdrJVi3yY0=;
        b=CKp1IcB1DLdjZKkgcv84NVN1WFf2w2trOJogNXwiBAGfdKzByPfMRWt8cqC4EAnjd6
         Kl/8gNDNSB9+zeEduM90T8fg3sB1ykrklcYxoNTwwvV6HNCBLYIWk6EFZVaYzhx9+P96
         GxXDRs+qHTjE7650zdh+9uAEN3Fad2NsbijkxrPxvVrCt5vQ8oE0Ad8HHmkRA26e+Ml2
         a/dLRmfOVbxySYcWc8yLU5NZEodMciz4bsaoTs8fCr5ibzeKj2hPm692z9oQuHbnXkJK
         e4AirsOTvWki1tv/Zb8b/rMyI3D7NDp2r7E249LFEJcBmjJlpe0jWj9K98IssRwMlhMo
         CTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V4B0XKpXquoJyaIL0mskRvebeDdCLQLvdHdrJVi3yY0=;
        b=mLYvIG/BtHGQrglMdjKniCeOs6An++Stu3zD7YyTLGHGOghjLc1HINl+TRyY9I0MIt
         fc49eU+0n0bCH+4MSEUTumdAVOmtgzV40nt+E5zRbjXUlC3dw0c6dJYp4EkaE3HXADdu
         qVJBibvGnk2muNiBQfRj3RpzIDPm2kNeGwMuvgDGM7Zwdmp7/2JAq19Bp1+JRykyL0qJ
         d98FbfJNsz7A2/UmWj2aqPLGZC9cjpeWlfddIUncqhTAaS5NlcD6nYrbP1pvA1QoPyIa
         cniR8bUwW91ScX2M4DnpBt0hMnJo9XemAxehkFkBtBp+Q+5Fy4fjN4AJkBXGKjJI8cOn
         5jUA==
X-Gm-Message-State: AOAM533GmC158dO4NbPE4FG+oLgRNTou6TCh2AVNH2zPSOAILTbRMddq
        tPPhc5y+5tVkgORnNw3jEkTKPA==
X-Google-Smtp-Source: ABdhPJxlLuBNBZ5dQ1Nb0gSVklBciUH+t1d0ON54EMJoLqH9vmnlZ7TXe7lUfn2/heQVnwwORjT2Lg==
X-Received: by 2002:a5d:6101:: with SMTP id v1mr27772473wrt.598.1638105883413;
        Sun, 28 Nov 2021 05:24:43 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id z6sm10746685wrm.93.2021.11.28.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 05:24:43 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-csi2: Suppress bind and unbind nodes in sysfs
Date:   Sun, 28 Nov 2021 14:24:26 +0100
Message-Id: <20211128132426.142454-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2-async framework's subdev notifiers do not behave correctly if a
device in the middle of the pipeline is unbound and then rebound. The
v4l2-subdevices upstream from the device being rebound gets confused as
they receive no notification of the device unbound and can't cleanup
their state and when they are rebound to the new v4l2-subdev notifier
they try to reinitialize their internal state, this may include things
as trying to create links that already exists and in some cases crash
the system, for example the adv748x.

This should be solved in the v4l2-async framework, but as a stop-gap
measure suppress the bind and unbind sysfs nodes for the rcar-csi2
driver so it can't be used to crash the system.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 11848d0c4a55cb4c..37cc46b9201e0546 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -1498,6 +1498,7 @@ static struct platform_driver rcar_csi2_pdrv = {
 	.probe	= rcsi2_probe,
 	.driver	= {
 		.name	= "rcar-csi2",
+		.suppress_bind_attrs = true,
 		.of_match_table	= rcar_csi2_of_table,
 	},
 };
-- 
2.34.1

