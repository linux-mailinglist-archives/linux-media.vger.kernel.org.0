Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604D72B9D90
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 23:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgKSWWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 17:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgKSWWy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 17:22:54 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF0DC0613CF;
        Thu, 19 Nov 2020 14:22:54 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id p12so7956562ljc.9;
        Thu, 19 Nov 2020 14:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MP/r+C7PGrfVmsMZ9hrKP2kd7hHkZM5sXFh9LGxAxrY=;
        b=IpGHcMKtTlQ/UR3YrFxxUzHlqRh8fyXlEH+ig/5oRJrgXrqRYzh/9ADmAJ9vp72aJs
         6yww4inEBUaLdrqRuBgtgtQjzSIjBEGfGo/Noxa/zBSZ4fZrtz2u/IiAcpaeUUkh5uoT
         839RPvbC4fzvnuaSHuf1bXgJD10dFn3wjLuesrhuxihzrbVqOXRhkOoHsNMTsF4NAWjk
         EjUWnhxOUkMJYQub9MHw9cUMQhYJXMGxDFMy+SDWPHLpTsr8P4VUNgSiDAImqcLsI+6Z
         PnsLcZnAUjFjd2KF+N1GtW3gxtET3zsaOIfBqhd3zUIQvNlRU4DdUpBfgMisw7YZ351C
         UnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MP/r+C7PGrfVmsMZ9hrKP2kd7hHkZM5sXFh9LGxAxrY=;
        b=n6Cb7dVSZ7Cvp+I1NCvYpVVFo6h+1SrGqVM5OGGUmlgosCXmxkSANPjRwwF7n4NsFS
         pFAozu56+qmk4fzMNVyhsEcldSmX0Enr6FtWwzlwoPpNQ2NkS2p0+OHgwAKXDuD2dByT
         dM5fvqs+4sTfNVfAOlrLdWFVRfpVe6s8R0OKb0rzaCF9bQMtmt/9H2vsKXHFE1najFu5
         BzgdGR2s5nJs7hQu+5POpG0flJ9ii8BlYL9DTF8ax3j/5d1ve6jHwtMjwaXxE5mZdfMK
         KZNI5Fq3W2/lJpFOCk+A4FNdS+gE9B0VefhXqMoWHID61jNwE1i3iNBSvD1Iv/C+OjDx
         4ZQw==
X-Gm-Message-State: AOAM531bHkFqMYi9KY+i4Wn9TB2ZEwZqUUG0s1t4+7xB4gtrwlxPjWiQ
        PmSwmW7fzNGGFkJlxPc/tYf8Rgydngu3ew==
X-Google-Smtp-Source: ABdhPJxV2wD8Tep8P7wLZ3eT1snNcNNwcGiEEkfrlR0EyvBcsj0EfSTi2l4slyS5NxMz161k78n2lg==
X-Received: by 2002:a2e:b0ec:: with SMTP id h12mr6937467ljl.379.1605824572723;
        Thu, 19 Nov 2020 14:22:52 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
        by smtp.gmail.com with ESMTPSA id h12sm116141lfm.112.2020.11.19.14.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 14:22:52 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: i2c: rdacm20: Constify static structs
Date:   Thu, 19 Nov 2020 23:22:48 +0100
Message-Id: <20201119222248.148845-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only usage of rdacm20_video_ops is to assign it to the video field
in the v4l2_subdev_ops struct which is a pointer to const,  and the only
usage of rdacm20_subdev_ops is to pass its address to
v4l2_i2c_subdev_init() which accepts a pointer to const. Make them const
to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/media/i2c/rdacm20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 1ed928c4ca70..ac00a6743623 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -435,7 +435,7 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static struct v4l2_subdev_video_ops rdacm20_video_ops = {
+static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
 	.s_stream	= rdacm20_s_stream,
 };
 
@@ -445,7 +445,7 @@ static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
 	.set_fmt	= rdacm20_get_fmt,
 };
 
-static struct v4l2_subdev_ops rdacm20_subdev_ops = {
+static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
 	.video		= &rdacm20_video_ops,
 	.pad		= &rdacm20_subdev_pad_ops,
 };
-- 
2.29.2

