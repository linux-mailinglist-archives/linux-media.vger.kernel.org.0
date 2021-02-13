Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2485F31AC83
	for <lists+linux-media@lfdr.de>; Sat, 13 Feb 2021 16:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBMPJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Feb 2021 10:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhBMPJE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Feb 2021 10:09:04 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA58C061574;
        Sat, 13 Feb 2021 07:08:24 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id a1so1196932qvd.13;
        Sat, 13 Feb 2021 07:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WnexFjbCGofmGRvGp9wQNl590G0fiudgAKmeSNZvljs=;
        b=iVCvEgC39ZHc9OiOeRPmHuP+QitCacFw2vrBSStZ8FnNej5OM3RpZcEJZ/GsKs9vQs
         St1kfPBOGX0gIBZoJuckzGmg38Dfik4rIPyf1e6U1sa2hWg8h4o6gWbrK06Hru9+dXvJ
         CjBNb21FFsHmgdN5+MivHYafir0zu8ndWhgbiVxJITKXQBeNhNjYPl5rOdRTIgbvzP2o
         RQj3DzJeuQTE3WarZDO/dGo+QyHK5He5NmeeMa8h8/w0B9Ip7jrvdV5fK7G3oC60C7LE
         IrLkQ3wtPbZnl/EFn0oRXN04TrXdkWWD95b+U7aL75zNuYz53lsulltJTtnY7wVN/wfh
         FaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WnexFjbCGofmGRvGp9wQNl590G0fiudgAKmeSNZvljs=;
        b=CCL3biuLONVrkoxRGJasTbUyD/5BTzcoKNfk8ch4dTUCjd9xAnkuUBtko14qMT0Z4/
         ms4HaazYUEUhDd10+c/kmYizqxIB/Ppv6CtPC4P7R6J0dftsMqIf9n6tmj3EGmDaUDXi
         mx/3sWQBE8TgJF4wcXMGft58rxtT6VSW9xr/9cBzhT9hS9o4qxcI9ecyRBETmot0pxE2
         7UTaSik+EoaMjFAzNaGYR9piHKXcdd7yWeUt0NB28htxCLqYfNfjd9bM+/gHF0jj9fj5
         ghzSrhIAO45MI5HVXL0lEyxukq/REuaQ6djZJ6mmR1qrPoDJDH7ZDl2MFa4OkLJE/0PC
         GVXw==
X-Gm-Message-State: AOAM533Vw8IQfIjnnsM7Syj8Qx4zJN3PKr1vR6saDlLasdxgi0uX3d7W
        x31isU46XtGbKzDsW7VIGVg=
X-Google-Smtp-Source: ABdhPJwOMbxz62eULY+3PtvdUgTyuptIi5wFOXcIh7wN7TnsMCWJBPHyGxCJNHvBy/QPbqvwRFd6lQ==
X-Received: by 2002:a0c:c1cb:: with SMTP id v11mr7195803qvh.59.1613228903509;
        Sat, 13 Feb 2021 07:08:23 -0800 (PST)
Received: from localhost.localdomain ([156.146.55.129])
        by smtp.gmail.com with ESMTPSA id t4sm7580705qto.62.2021.02.13.07.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 07:08:22 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     awalls@md.metrocast.net, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] drivers: media: pci: cx18: Couple of spell fixes in the file cx18-av-core.c
Date:   Sat, 13 Feb 2021 20:38:05 +0530
Message-Id: <20210213150805.1606638-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



s/minimze/minimize/
s/initallize/initialize/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/media/pci/cx18/cx18-av-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index b33eb08631b1..11cfe35fd730 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -89,7 +89,7 @@ static void cx18_av_init(struct cx18 *cx)
 	/*
 	 * The crystal freq used in calculations in this driver will be
 	 * 28.636360 MHz.
-	 * Aim to run the PLLs' VCOs near 400 MHz to minimze errors.
+	 * Aim to run the PLLs' VCOs near 400 MHz to minimize errors.
 	 */

 	/*
@@ -122,7 +122,7 @@ static void cx18_av_initialize(struct v4l2_subdev *sd)
 	cx18_av_write4_expect(cx, CXADEC_DL_CTL, 0x03000000,
 						 0x03000000, 0x13000000);

-	/* initallize the PLL by toggling sleep bit */
+	/* initialize the PLL by toggling sleep bit */
 	v = cx18_av_read4(cx, CXADEC_HOST_REG1);
 	/* enable sleep mode - register appears to be read only... */
 	cx18_av_write4_expect(cx, CXADEC_HOST_REG1, v | 1, v, 0xfffe);
--
2.30.1

