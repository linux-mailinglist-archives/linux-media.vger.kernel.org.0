Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E6337ADE6
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhEKSJ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbhEKSJT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:19 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585CEC06175F
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:12 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id x8so19685985qkl.2
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gtQrgUl4tCQEqsiKDMMoF7DBtOLlclZjKI0ULmAjCz4=;
        b=1WFSioGyN6TjcAoY/Uodm0esYGQDy8QrqaXNa7fXQdhSjUauy5XW32oK83xHt/iTNp
         K5KWmSVRXLjjUvV+7nKtQuJnMCWyE8CJOP+jGBD8MbhDWVw43y76oIGEMKnYO5F/9qKv
         XKxSd+Xxo0nNH/TD0PTR5CkAiP1yAxMaJl8rGZbT9xOEC4NAKuFElBvKWURtDxDVflEg
         nC0IbbnX68g0xlpIudsLZAgxNZxJQS/i2Nm4VoZyiDjgg16Ze54O/qaZnJaV5aT9o6BL
         H+k1aIOKrmyeHEHg70nlT4aiBvnAe0d0Mz73RpfCR7zdG/NmUNJtpsnH5RsrhoHeeE/+
         /UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gtQrgUl4tCQEqsiKDMMoF7DBtOLlclZjKI0ULmAjCz4=;
        b=Z6ETkInH9dpn45SUaEOfZMZ22tw75WX9mQzyFOV7JvhPbVsJbMGTpMyDnwiYiNjh4W
         atWS55gG+A7RcbNMfHisI3028wE/KVt3dnrWWt8CN8UUUYIR64tIXLyiDJiko2fXfWYx
         4DwSUROx9OlTUH33r7p42YxW9nE4cErpPaeVK63yd/5pb9gFvyPRWeM0EeOpqHSRsmcr
         XCBBFRJTaDX9okfyOXHyYWz3QHAisQp4OnXABx5DD4ChJfi/XSV7l21yHIsxzrwoYR55
         KONyDTasklL8Pxi9lzp4LOP/6ay2axFxDqES0FwYXzZQGB53axplRC6HL2ytBrCQ+s5j
         /+XQ==
X-Gm-Message-State: AOAM532S2mYOXYGX8YiVgKhohMaQzENydviIU2PwV93Wim7+vSaF3I19
        p9HoKzFN3tJgpSZirmb3MHV9qQ==
X-Google-Smtp-Source: ABdhPJwBlIKZ/Bz9hmaaiFRVWvrkMNbA5OTr/vWW+2BhNKblEZfINyo1r0T+v36UsC2Pq6ekCpnXqg==
X-Received: by 2002:a05:620a:21c5:: with SMTP id h5mr23029980qka.395.1620756491577;
        Tue, 11 May 2021 11:08:11 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:11 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 04/17] media: camss: csid-170: fix non-10bit formats
Date:   Tue, 11 May 2021 14:07:11 -0400
Message-Id: <20210511180728.23781-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the decode_format/data_type from the "format" struct instead of a
hardcoded 10-bit format.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index ac22ff29d2a9..a81cc94c075f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
 
-			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
+			val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
 
 			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
@@ -382,8 +382,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
 		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
 		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
-		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
+		val |= format->decode_format << RDI_CFG0_DECODE_FORMAT;
+		val |= format->data_type << RDI_CFG0_DATA_TYPE;
 		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 		val |= dt_id << RDI_CFG0_DT_ID;
 		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
-- 
2.26.1

