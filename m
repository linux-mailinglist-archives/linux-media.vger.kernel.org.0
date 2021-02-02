Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC1530CB30
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 20:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239573AbhBBTPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 14:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239364AbhBBTNH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 14:13:07 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68968C0613D6
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 11:12:52 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id s107so307408otb.8
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 11:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l8faAN7oTgmPtV8H52j7f3C55BE2mtxHSAraHHaV/ro=;
        b=MhCZLnQgaKd1wPCzLlUTsRkvxJqdZdw0X161uosokxc1mxfAzPrOy2hkF8Rd6jl4Lb
         XhkMelGi2LE+Sx6MGFxHHoPCgF8+e+17cYxlDxN7WUBBeUGMiN0YAIiNuOnhhFHxNBbp
         aLy4AiQsKhDXp25DkImAoT8Gfgoun64mo+BC4ezVE2AAluePAN2VSnrGqUBr7G6L6sUh
         JJKnWE/uMD0+VHH+CDNMf/HyWALcBCed6xzsO8AxHTzfYUlp+OpPL5CJgCm3GRtfhxn3
         CR5ZfvT+qu6bObjCkm4gwebbinPdTWjWiw2F8TmlJnZAPJsRNlsJuZB4YEVWGWE3Axgt
         hCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l8faAN7oTgmPtV8H52j7f3C55BE2mtxHSAraHHaV/ro=;
        b=bKIL1vEFMf2VFICYH4Bs8FrRjRi/YwDllqpoRp2K1bSy6nDRTUgqMWDGpuSvtaiMAR
         T5Ra/2jB3MMC2rcuc25PC3BvAiBze3tjjJkOw1vmFEs+ufBMPblXpHBsmUeJ8lMkXnAS
         yJFCw40McUbJzAz1VMf/DQuHWmbG2Qk98YbYxZ/7wKdltaBU1SvkuQL4dE85uB4fqSD7
         oEj/vSUk6JMM57kpw83q2/EwWZckROqn2fJFc9LKZ0VP4+JApNkEq0XKRO0DWoiRoBcO
         fih9yVzsRnwSrVXgpfuhqZQ+HNY7jGk1umV/ocZQZWoIR01NGcJLfgWm9qpUp5XMLiHW
         02WA==
X-Gm-Message-State: AOAM5313ph6oUNdrS14hKJA2pM/L6T2LJqzp7A5Gopf0yCGgnAJHE46Z
        QpHhqapLFqjI/B0mzIc+Qp1A0WeYLIvc7ANt
X-Google-Smtp-Source: ABdhPJxR17rmNc4ZnGUrwkYnEBLno45luverq5v9FqLUP4oqrQGig7u2urHhFLmoi7tIwGS4+tvBHg==
X-Received: by 2002:a9d:7452:: with SMTP id p18mr16722010otk.49.1612293171751;
        Tue, 02 Feb 2021 11:12:51 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id g195sm5249548oib.10.2021.02.02.11.12.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 11:12:51 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, sean@mess.org, mchehab@kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 2/2] em28xx: Add pid for bulk revision of Hauppauge 461eV2
Date:   Mon,  1 Feb 2021 19:40:30 -0600
Message-Id: <20210202014030.27466-3-brad@nextdimension.cc>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210202014030.27466-1-brad@nextdimension.cc>
References: <20210202014030.27466-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Manufacturing has switched from ISOC to bulk transport,
the pid has accordingly changed to signify this.

0x2013:0x0461 is an ISOC 461e v2

0x2013:0x8461 is a bulk transport 461e v2


Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 786978e7a59a..ba9292e2a587 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2782,6 +2782,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM28178_BOARD_PCTV_461E },
 	{ USB_DEVICE(0x2013, 0x0461),
 			.driver_info = EM28178_BOARD_PCTV_461E_V2 },
+	{ USB_DEVICE(0x2013, 0x8461), /* Bulk transport 461e v2 */
+			.driver_info = EM28178_BOARD_PCTV_461E_V2 },
 	{ USB_DEVICE(0x2013, 0x0259),
 			.driver_info = EM28178_BOARD_PCTV_461E_V2 },
 	{ USB_DEVICE(0x2013, 0x025f),
-- 
2.28.0

