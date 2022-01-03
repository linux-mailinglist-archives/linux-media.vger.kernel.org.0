Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDBB483651
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 18:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbiACRlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 12:41:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbiACRlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 12:41:14 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D186C061761;
        Mon,  3 Jan 2022 09:41:14 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id i9so47690053oih.4;
        Mon, 03 Jan 2022 09:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZ4pKJgHsszMmcqxTz1e+5J5GZb7zq4y2dI8h4ugrSY=;
        b=YqgRNy3e/LDUOv8XRjOC5UCx/aMjg8XEFlch8mDRHtVonQ0ZV8/jgNeUhfCGanH6Yo
         PolYxAhADfVX5zn+L85oXP59jRHEH3OWIw0ra72++3eNKCE5loKqmsGcSJskgE/gEkdB
         y0xq40RazAiQZkwllA3+Z2UsswfVL7W+LDSVEkuaoPhhBvZM0dVi+3AgZCwQBD9V6Jb8
         obDSQuc9G2neTlnpkfLf40Zh0/pg59s5SDjvWMmBA8rlr+bgJvBbX8z/m72Gw91BMxIQ
         qONRiHNhAEwXx6f1qtoPyRR4/kVh5pohN4of1ICA4zT+wmu75SrDOVSmPB1kG+ANKahv
         uGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZ4pKJgHsszMmcqxTz1e+5J5GZb7zq4y2dI8h4ugrSY=;
        b=a/6k5+SI3mh9hMMVdMm8CP7lfsJySfL2oS3sxusiUbnSqPz0JmaHRnDFwUl/BpwTPV
         ZEHZWhDlOcivsnJatwq2hNokwZQ21boEp4a68W5IomI6kuiWKncYegy21h0y/DV+gNJG
         sHX93Lih5XcsaTgzd51z8N++7oXR62wjpRq/nhaLjyO639Yeaj+aiwLSClv5skeBWZcp
         6S2rwL3f+dHSTvaW2TYyb8d4vB35ecpCUTat2pxsdRZfW4bDJ5qQdDGZ6vXPGvemmeq8
         bJ4iWIj5W5iyf153szrAwhDSck8KEBjHbyCzvN/ukMO3AVyT93f+ksyGvMDnx99JeRlz
         HRTQ==
X-Gm-Message-State: AOAM53232aSfG1C2F0bxERmiWore9jwS1qKlC2WYdRyzb931mRGJMPWw
        7YbAJBVuvxU9Ni8ZaYRycGU=
X-Google-Smtp-Source: ABdhPJzeYvLlwXl15IEw/VEUtGL2Fa1RxgEybGYDznRop7dqPJrIOeGezTOjoXD8KXTfOj0biVEzOQ==
X-Received: by 2002:a54:4710:: with SMTP id k16mr34933036oik.32.1641231673843;
        Mon, 03 Jan 2022 09:41:13 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:41:13 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/5] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date:   Mon,  3 Jan 2022 11:41:03 -0600
Message-Id: <20220103174106.907-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add the MEDIA_BUS_FMT_RGB565_1X24_CPADHI format used by the Geekworm
MZP280 panel for the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/uapi/linux/media-bus-format.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11ee243a..a7b7654985ee 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,13 +34,14 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101e */
+/* RGB - next is	0x101f */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
 #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x101e
 #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
-- 
2.25.1

