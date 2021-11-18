Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D32D456564
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 23:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhKRWMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 17:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbhKRWMT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 17:12:19 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25FDC061574
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:18 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d5so14404861wrc.1
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w9Krwl0/DiMs+4pwmk/DLglfUaFbEV3WyJhxUJ5Rpa0=;
        b=WZBe8vQnUvuvWMC04TI2/haqS6N9oy1WkD1oIxz9ZwpH4LHkDCmsrhbxUvpi0g6YA1
         VNyMOEW6JK1JCV2ygy46z7D9ZyQCnTOrLq00WJwig8kMDVpb0mj+gnh3ArJxXyLO4eNK
         okdUmTF836RL0USOaPayHoKe30trvZb8D3gRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w9Krwl0/DiMs+4pwmk/DLglfUaFbEV3WyJhxUJ5Rpa0=;
        b=YL8xfcrtpjpVvYbJ0hZGtrCl+q3nf29DU/zv0FmNUEf30a6EgQMSdAZ23JO4lMBTQ4
         RU2KEHgm8jobWk68sg4R5YPLEvNxJ39O0cLPYxAceGWuPqIN4C3YtygdqcAVDbiZ5evA
         2p8QApF+ppFNBcwY8nSN0bYcy2yVbu9VazSDiISpQTSp1EDsZw4QJ2LIwZXowy9WWScz
         +vA/b61tAISCUnv10t1z0CBY35WWl2SqbNlwh5c46kpgiSdYTFj4IMRhMZIUeu/SRaK7
         6c5jyXHE52XCncSe30eWayK4HNJK0n6e6WkePl0y/mUc6TOTh+oCsLkEqJ/cNuDGgZaf
         fBVg==
X-Gm-Message-State: AOAM531RI1XerGvaIbL+aepa+kIUHeCzdkuOn9m6Mwj2EBAYyB/o8aYW
        7LVU4JRqhIDKEsZn7OzBIVC2bg==
X-Google-Smtp-Source: ABdhPJyuOG37oZyCtu2L8zt4pEgP8ox2o7KB2XlmC6n5WYO529QvJnwOYw5878LmCXTMC8/p0ElHKQ==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr993989wri.321.1637273357314;
        Thu, 18 Nov 2021 14:09:17 -0800 (PST)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id f7sm13305180wmg.6.2021.11.18.14.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 14:09:16 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn . chen" <hn.chen@sunplusit.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 1/8] media: uvc: Extend documentation of uvc_video_clock_decode()
Date:   Thu, 18 Nov 2021 22:09:06 +0000
Message-Id: <20211118220913.299978-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211118220913.299978-1-ribalda@chromium.org>
References: <20211118220913.299978-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make a explicit reference to uvc 1.5, explaining how the algorithm
supports the different behaviour of uvc 1.1 and 1.5.

Tested-by: hn.chen <hn.chen@sunplusit.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 9f37eaf28ce7e..4b5f7e156b0de 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -510,6 +510,9 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 
 	/* To limit the amount of data, drop SCRs with an SOF identical to the
 	 * previous one.
+	 * This filtering is also needed for supporting UVC 1.5. Where all the
+	 * data packages of the same frame contains the same sof. In that case
+	 * only the first one will match the host_sof.
 	 */
 	dev_sof = get_unaligned_le16(&data[header_size - 2]);
 	if (dev_sof == stream->clock.last_sof)
-- 
2.34.0.rc2.393.gf8c9666880-goog

