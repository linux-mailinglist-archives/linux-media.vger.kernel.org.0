Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1544430A8A
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344060AbhJQQXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344081AbhJQQXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:23:03 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1A5C061768;
        Sun, 17 Oct 2021 09:20:53 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id f5so13511501pgc.12;
        Sun, 17 Oct 2021 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RZvAniSv0/MLHUecBSIvKMrmoz6usDwoGMxlWRtqF5A=;
        b=hifpVpT0bgGGW6BmmZDDJUbjAa6LEZGGiqzjSmU+G/KA2d0SLyzT7kx/421gnTRQTm
         laSuGz8ATwzmRUoaJohyIfHwq2rTtebsydHTV+kUCUVrs+SBX+dJaSiVkf+eW5sYCJsb
         VuwmUVXDymYfLjhNw+wCaZQPxLm5K6/Net8bWY8xAHPdiuzUdYftfIfuK3Ya6jobCLII
         Kgv7vucadi9Jpt2l9IMd0XcVxhTnOPcuyV/SI7pQzQJ5JF2BHRPhJsqfQJHeLFivhb23
         BSqASHYfBUO1k58cc8eqjkjQRrqzqDdud9EtXIAHBzCAfL7cBeIYhkjHjQnIBkKDLE7H
         x/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RZvAniSv0/MLHUecBSIvKMrmoz6usDwoGMxlWRtqF5A=;
        b=VXfwbxDA2kwdHkO1kpoP71FAkomlUkqN/B72nE2s4K/+ZU9BLORxFrnhxHczuq+wo7
         TSZzM/8rsjOvc4Emlv0He5X8zuXcLOK2nhUt43nDWEWAjSxyDJVk7IjikJe/FuqlQX5X
         EorjBv6LrWTYQgZa9PsnS2Z7WgXMzmzqVGZBzl8xfGAWfH04XTZTo7D7Z2cEJgdkjAry
         ihCGHDiVWYHxM/kzhxepbWO1VRSEDfi5lsaiXkyPWL8M5C4x9BOB5eAUooCua/+OCvWJ
         XgCXJbOCFjVs/NmOPIdCqST6VEiwLhBeScumM+r07VYKta5B9npF3S6xMtTwNj3p1Vxk
         syaw==
X-Gm-Message-State: AOAM533lTQnRt7YVqvwjR/ZOcbX+oFO5msG90Cy2/EAu8k9mRHewxFvl
        XQ9/0e7dIENMeUH+g/WmNPk=
X-Google-Smtp-Source: ABdhPJzMotrPhQBXOH0NGjUXfGd5uHbE0KjOORaEY60ADI2/NYp8asnwfqP4CEsJOW0neaU22vqg2Q==
X-Received: by 2002:a63:f410:: with SMTP id g16mr18634164pgi.201.1634487652994;
        Sun, 17 Oct 2021 09:20:52 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:20:52 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/17] media: atomisp: pci: fix inverted logic in buffers_needed()
Date:   Mon, 18 Oct 2021 01:19:43 +0900
Message-Id: <20211017161958.44351-4-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When config.mode is IA_CSS_INPUT_MODE_BUFFERED_SENSOR, it rather needs
buffers. Fix it by inverting the return value.

Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 75489f7d75ee..483d40a467c7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -374,17 +374,17 @@ static bool buffers_needed(struct ia_css_pipe *pipe)
 {
 	if (!IS_ISP2401) {
 		if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-			return false;
-		else
 			return true;
+		else
+			return false;
 	}
 
 	if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR ||
 	    pipe->stream->config.mode == IA_CSS_INPUT_MODE_TPG ||
 	    pipe->stream->config.mode == IA_CSS_INPUT_MODE_PRBS)
-		return false;
+		return true;
 
-	return true;
+	return false;
 }
 
 int
-- 
2.33.1

