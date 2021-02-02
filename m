Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F83D30CB2C
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 20:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239427AbhBBTPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 14:15:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239366AbhBBTNG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 14:13:06 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAD6C06174A
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 11:12:51 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id x71so23928944oia.9
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 11:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W7/wumPYaDXvrSfz/foNT7RLqvBay6ohSxkvP2fI/GE=;
        b=LD4Qw462baxXGEU3S/8E3w0DSkXbO8+ahRmmhb+Bd0nlFWdmvu5jdkZERmHdHF2Fxo
         LUV+WXGjavjrhYoLNRp/Qc9lh1+fgFl1b62GeEiCmifZcxEBq8EnYYILAMspM+MK6LTm
         cEaIG7gdIfwsFU4I4gG9k3M7o0YzsgIeJCYcpW3kidFniHkXqrTHrKB/oNb2iP9TWDky
         AcGZwWT8HPCZcmKxMdmdhRWWWkCC9WDOhc+w+azQFWkeVM8Bfw9fCJ04DmByu9whO5c9
         u4t8io7YWrAbF5CmDx5hXoV67MmXlClJFMdjRAYwtWGNB4kDppvNH2LR3s7m2wsptBWU
         DSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W7/wumPYaDXvrSfz/foNT7RLqvBay6ohSxkvP2fI/GE=;
        b=L+CQCARYxHQMtOEoudWpi0+BWX/mtIjqFOcoX2QwY7O2vs2kJTm/QF3KygOA0LPmst
         kVumKM2YoWjPiWZTmdRQe10N4X7NCNmKNG5wcKMVvOt7RC/l2ISz4o8hhpdLgztWcOac
         3MxHc2HnkSY2TkiJBBDOc9Z58WHHxt+3HmU0UJRw6KJCY0c7ClxUQfY0FOAQMA4WiwEb
         J+zGnFKsTeAjnJDU/XZLiGttL4EVI6fPYsWy9h9a9VnIDsyS+AmTtS3ni7KAAP0GaiiX
         w6wepL6uAxdNoBpdMIYH5s14iOr7jeicowMbh3Cshmymzsee3Z34lOcXfFSQ/lwd9EvF
         Xopg==
X-Gm-Message-State: AOAM532KWgOiBYnfjUJ2MEnG4hTThmaSfADKpKtySb2XgDZ60fyG/au6
        zK80hCE8+PqH/slV8Uqb6vvdcEORsC/eOIA1
X-Google-Smtp-Source: ABdhPJz2DR+CR++gNI/avmDpYULd15MQq4uP1DJPWTnymax9pcn7tNx/0heE7eFK8ZeQFFAG0FvL0A==
X-Received: by 2002:aca:c484:: with SMTP id u126mr3787287oif.107.1612293170684;
        Tue, 02 Feb 2021 11:12:50 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id e20sm4774844otr.14.2021.02.02.11.12.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 11:12:50 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, sean@mess.org, mchehab@kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 1/2] em28xx: Add pid for bulk revision of Hauppauge 461e
Date:   Mon,  1 Feb 2021 19:40:29 -0600
Message-Id: <20210202014030.27466-2-brad@nextdimension.cc>
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

0x2013:0x0258 is an ISOC 461e

0x2013:0x8258 is a bulk transport 461e


Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index d6c8ae213914..786978e7a59a 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2778,6 +2778,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM2765_BOARD_SPEEDLINK_VAD_LAPLACE },
 	{ USB_DEVICE(0x2013, 0x0258),
 			.driver_info = EM28178_BOARD_PCTV_461E },
+	{ USB_DEVICE(0x2013, 0x8258), /* Bulk transport 461e */
+			.driver_info = EM28178_BOARD_PCTV_461E },
 	{ USB_DEVICE(0x2013, 0x0461),
 			.driver_info = EM28178_BOARD_PCTV_461E_V2 },
 	{ USB_DEVICE(0x2013, 0x0259),
-- 
2.28.0

