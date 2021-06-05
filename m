Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9B939C4F6
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 04:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhFECLC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 22:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhFECLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 22:11:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC4BC061767;
        Fri,  4 Jun 2021 19:09:06 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id c10so17224625eja.11;
        Fri, 04 Jun 2021 19:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QoZwyY0YMTAjuynEGdDFK/kHrkVCqwMZmCiqAO/T6oc=;
        b=QbxVEgaCh1v88CWkfJOjrIZdsyexbMt7d/1A99c9zBL40fQ9uxn6EvDbj9ZXpkyO82
         9o5TaptL2Jr6Vpiw1NHb04nzLkSCxGOj6OKKGOQwWG5dZuDZm6eTuiC32Ju93Hgwy6Sn
         eo2Ge0Qm7UQKCxjbrobnkR9l/3SUyidDRi6cdn2Way9oy0elQBheyFg9jl2hNcaF6QiU
         2UDuyEgqNl4hPHMoS4BllFKSo1wckKxPtM+ax3+u/RWWM3qUgtKcwIja4nK3ihA1bmwK
         UgckFLQ2ucIsNeeAp0BQMEbdMQgR2VOOrEa8dVuaoIQVma/u5rc/ij0aHJU4KKvUXiOX
         ktJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QoZwyY0YMTAjuynEGdDFK/kHrkVCqwMZmCiqAO/T6oc=;
        b=SgBt7moe9Kw5RSpHUsuTxFNC8O/9HhUWWXt8bK13lzO0KzE4Sa5w5tRyw1AhrZJcof
         sIirBiUk1qbB14VjdZEo7Tyyd51DxHpf9ngnHZMVm59RT1e1PvZCCemOURzeeQrut9SS
         P/Robb2ycN8uKS2dZjEZ+b46QFdXu7fpI6WqG8uRujSuy9nW2ZCVq4nnB6j3nkVlWsx+
         tZff6tKpUQgjygwrQ3wRp3rEqaHGo8v+dVfIA31TmUCv2rt1BrbsURBAiIqUrhnYXUnU
         dWqJvt10OtUsYelovxEae9r11xLEkZyF0ftqY/tF3QQGA/V1DWF+eaCfsviV0xODRQO3
         7LAQ==
X-Gm-Message-State: AOAM532VZq6fnvJJk7AYCXYVyD/Uvl6kIcU8Ek4q4wUBTSfJlNGFnfnz
        WgNwybRLxU91rqyeKY/xFEs=
X-Google-Smtp-Source: ABdhPJwFyIBQzaujPbaRHCOrVPlhW7gxkQFi6LwKnhuKjhF34suowYfruJICvam4bz/Bf9+88HvITA==
X-Received: by 2002:a17:906:2c4a:: with SMTP id f10mr6923021ejh.493.1622858944837;
        Fri, 04 Jun 2021 19:09:04 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id gz5sm3496232ejb.113.2021.06.04.19.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 19:09:04 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: pci: Remove checks before kfree/kvfree
Date:   Sat,  5 Jun 2021 04:08:54 +0200
Message-Id: <20210605020855.1065-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605020855.1065-1-fmdefrancesco@gmail.com>
References: <20210605020855.1065-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed checks for pointers != NULL before freeing memory. If kvfree()
and kfree() are given NULL pointers no operations are performed, so
there is no need for the above-mentioned checks. Coccinelle detected the
second of the two unnecessary checks.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---

v1 -> v2: Added Acked-by Sakari Alius. No changes in code.

 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index f4ce8ace9d50..5301cc014c7e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -363,10 +363,8 @@ void sh_css_unload_firmware(void)
 		unsigned int i = 0;
 
 		for (i = 0; i < sh_css_num_binaries; i++) {
-			if (fw_minibuffer[i].name)
-				kfree((void *)fw_minibuffer[i].name);
-			if (fw_minibuffer[i].buffer)
-				kvfree(fw_minibuffer[i].buffer);
+			kfree((void *)fw_minibuffer[i].name);
+			kvfree(fw_minibuffer[i].buffer);
 		}
 		kfree(fw_minibuffer);
 		fw_minibuffer = NULL;
-- 
2.31.1

