Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254C032092C
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 09:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhBUIPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 03:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhBUIPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 03:15:31 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378DDC061786;
        Sun, 21 Feb 2021 00:14:50 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id q14so45924888ljp.4;
        Sun, 21 Feb 2021 00:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OWTmBsyijCf6vI3V7ZFWo67ukVjrYzDX36ElWJjaiaI=;
        b=Tq2pQYj9G1iG5HHb0g4Dn0JNWPCwjD9dmE4Gf0AxREu5mttEfh+GWQlHL6VKHJaHh0
         oQ4RmyIxPhXpb3L76w0KRNOx5k0oswEJdHsH+3wR3fffcK7Ns9R3Ct1vyX9Q3NwL2V2a
         R9uvwQH+vMS9Aq9ylKJAGn4yWYlvJntKBtJICn5oUg93OMjiDRIttJX8Aeh1Shoto7Ud
         N0JdHUAENIqDiRTQZfnnqg2MO/h6Fnd45riHAC/NmUsqTiiZTiqldtbB3SCy/bwmazcO
         xh+THxNyahXAoBZFw09FaEms9tPIhaMKFXNEjEg4Ied7Nye1Jm3z0MdU7Y2ijsvSuxz1
         QaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OWTmBsyijCf6vI3V7ZFWo67ukVjrYzDX36ElWJjaiaI=;
        b=KIFA7oQ1V36ACio31rAQv4g21nAGUdZZV5jzt0ey4iChgCWKfigUYrLEYNDgZvP/u2
         WXne/JPMrOPog7cRVu6RyiDoJufMmzx83xib51I9z/dSZ2/Czp7IOKWDx5OI0S45ILcX
         jcqKzB8hlkXVKecP3r8LAAX77MPZmiHDEgMPL4UDOwEvC/3CbLrq/qkPXqLV7Rrj1ECM
         YxFnaMyKep9IWxj/0S3kIJFHZSPO2ynubRIp86Vp4thqv32JaeuuhjIzksREsJfFwbGB
         XIusKM4Wtw9F9d7f8Rv9Ynbje7b8tymN3//w69+vEEoAN2PV0O/MsedXZhPK/iq/aZmY
         tlLA==
X-Gm-Message-State: AOAM530HpvM/I4uTDip7vesNimr3e2LVK9/NEox+BNcDjvBTHb6VqYFU
        ekAY4GS0fm/C2m8mHk8l7eA=
X-Google-Smtp-Source: ABdhPJyJK/W3P7+mczkvsPG//AhzzG0g4u/Xof8QNc+iGNQoTj/av+TVhRjyHQfxhXv7q2bTl7hDyw==
X-Received: by 2002:a2e:7611:: with SMTP id r17mr10520015ljc.163.1613895288805;
        Sun, 21 Feb 2021 00:14:48 -0800 (PST)
Received: from msi.localdomain (vmpool.ut.mephi.ru. [85.143.112.90])
        by smtp.gmail.com with ESMTPSA id x75sm1479093lff.91.2021.02.21.00.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 00:14:48 -0800 (PST)
From:   Nikolay Kyx <knv418@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nikolay Kyx <knv418@gmail.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: media: ipu3: code style fix - missing a blank line after declarations
Date:   Sun, 21 Feb 2021 11:12:36 +0300
Message-Id: <20210221081236.9758-2-knv418@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210221081236.9758-1-knv418@gmail.com>
References: <20210221081236.9758-1-knv418@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the following checkpatch.pl warning:

WARNING: Missing a blank line after declarations

in file ipu3-css-fw.h

Signed-off-by: Nikolay Kyx <knv418@gmail.com>
---

Additionally some style warnings remain valid here and could be fixed by
another patch.

 drivers/staging/media/ipu3/ipu3-css-fw.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
index 79ffa7045139..3c078f15a295 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.h
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
@@ -148,6 +148,7 @@ union imgu_fw_union {
 struct imgu_fw_info {
 	size_t header_size;	/* size of fw header */
 	u32 type __aligned(8);	/* enum imgu_fw_type */
+
 	union imgu_fw_union info;	/* Binary info */
 	struct imgu_abi_blob_info blob;	/* Blob info */
 	/* Dynamic part */
-- 
2.30.1

