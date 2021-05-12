Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92ACD37EAD9
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 00:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238471AbhELTNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 15:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348659AbhELRiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 13:38:13 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D201C06134F;
        Wed, 12 May 2021 10:35:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c3so34885575lfs.7;
        Wed, 12 May 2021 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SL8Vz3P5FcAwM0uKF7teunvsKj7fDkcA6NLzQS7Lox0=;
        b=mphJ03+KSklxNDPlvb+6V2HqwFj2Oizj8BQxZavsyL992pzRXN8UtOraQozdCGlU94
         Hw3DvdinB1h59kvxWLxJnyLkG6p13evafd6/SuvAM++DTWGoLICdcojZfiJMWu25IELO
         P1BLSDD+Zgfo41l36s6OfuWeZAlECNR40UpQxMX6yzfzO/69wxnAarp51r7+adZkxG9N
         lw6pwvwmFE/F14VfFSabbzh6tCu82FLUQit4g6T94thqowVpMUuPVSvM0RbRQccii19K
         3lZyVpPA1QiP5xe5N0GGljqrxAKdFySj6vQglyrbQ6bJbqbIkGr1HoDhnR0uO97adj6M
         2nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SL8Vz3P5FcAwM0uKF7teunvsKj7fDkcA6NLzQS7Lox0=;
        b=GKann4e5yxAFbOX/NlOJUsubNhWRaaolL/g6Acr9tWMOeN5gwErqQyUcmO7iTyFMBm
         sgebvgavyS/DvqIoU9e0kcWR1J0NNqf3av/+ugsiUY1BD3ZfnNlKMVv38sg2oHvzsQ1o
         x5o8Tunh7YNZ7NkkdlflbHJMdzgY1+stL4CVwbhwrbUx2BIJuzfSzP0ALjtf+3jdt79x
         qiLcInYd0871Jwcwsqv4sMIdtf4XKJL0uAOM21liXtHLCmlOSZbo0lRMmR/PjmHai4QK
         CoO2qCa9TBds3IQ03YU84tF3Q6oIXDbnhtCJeTmbw7hYVwbvTeg+AihY5SGQx1GRZP4l
         MtqA==
X-Gm-Message-State: AOAM533yLksdBL1v7Vd2IwbUUJXcQn80gLqgdDR9ZOR9F0IvLcIVBlNK
        iJgShFw0zkgqDfoVa+EJ4X+vXXwaQ8tHOw==
X-Google-Smtp-Source: ABdhPJztD+uOthbE6U92lOgMG6ERMq4tIxiYgYGisfq6iKKCxyLvXiyplKjYmgXdIQXFpiQxrR+W8g==
X-Received: by 2002:a05:6512:3b9e:: with SMTP id g30mr13913003lfv.247.1620840922869;
        Wed, 12 May 2021 10:35:22 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id 6sm30292lfz.189.2021.05.12.10.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 10:35:22 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: radio: si4713: constify static struct v4l2_ioctl_ops
Date:   Wed, 12 May 2021 19:35:14 +0200
Message-Id: <20210512173514.16813-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only usage of radio_si4713_ioctl_ops is to assign its address to the
ioctl_ops field in the video_device struct, which is a pointer to const.
Make it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/media/radio/si4713/radio-platform-si4713.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/si4713/radio-platform-si4713.c b/drivers/media/radio/si4713/radio-platform-si4713.c
index a7dfe5f55c18..433f9642786d 100644
--- a/drivers/media/radio/si4713/radio-platform-si4713.c
+++ b/drivers/media/radio/si4713/radio-platform-si4713.c
@@ -110,7 +110,7 @@ static long radio_si4713_default(struct file *file, void *p,
 					  ioctl, cmd, arg);
 }
 
-static struct v4l2_ioctl_ops radio_si4713_ioctl_ops = {
+static const struct v4l2_ioctl_ops radio_si4713_ioctl_ops = {
 	.vidioc_querycap	= radio_si4713_querycap,
 	.vidioc_g_modulator	= radio_si4713_g_modulator,
 	.vidioc_s_modulator	= radio_si4713_s_modulator,
-- 
2.31.1

