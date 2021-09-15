Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B17D40CDAF
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 22:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhIOUGz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 16:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbhIOUGt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 16:06:49 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13535C061575
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 13:05:30 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id v22so3745959edd.11
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 13:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hW/OeF+2xThCoBB4pO2KSop//D4gyfmqL/cgUEWN854=;
        b=ZeZC9y8WTuQ5xOUUN140j8hngeIb/TNzOMqzz0d7m3aBDsc50IGyYclfdfQx4gY8bE
         wsAMqtQSlQg8T6q52pvOflBelYePPKb852XpyB2EPiKnWwU1C38V9bESgIZqnrWJkE7L
         5iEEFpX7edlN+JQ/YWHU19QaTX3dQPB7SQ4iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hW/OeF+2xThCoBB4pO2KSop//D4gyfmqL/cgUEWN854=;
        b=ARDNvclxHu5dLNX3kaCxDysm6nTde+IeL8eWUgnQwzRq5TrhBgxTu2HaNlhi7LuCQq
         zW8R/vDuEBeJ05eh3LwaO4ulxgZtR/DMdk1ITxOpij2khi+SlllEjxenLB0xdwt0Ahy9
         cli/gQ2a3sop+P9KXJfQZISBvM9Bg1RMzvOe8oeL/cZiZ6rZ4hdDTAk7Hky1gL2QQagj
         sigb/n1ZLQ/+7FboxkLawkElc0sIvtn/2Awc7HxDgWLAAbC/oBZUlRA9BoW9/vr1ULq0
         lvZammHAUjYbhASk7dSB5wO7iLB6WPA6PSk1/uzzURaONY+kGU01jH8avM76sFWz5aF2
         ZDBg==
X-Gm-Message-State: AOAM533oSn8tE1pJbR2KYT81PRtMs2nCp6XigV6wcNc/Kz5HBq/3kkJ6
        Rn0B3B+WjGV+onTTEuKbNfycVQ==
X-Google-Smtp-Source: ABdhPJxg5GiL5c5raQanus97SGqZg90ifRcLnTaTejtUIOiCzHzeeh56TA2aKN6i3hVAyNBXEX2F7A==
X-Received: by 2002:a17:906:1f81:: with SMTP id t1mr1948581ejr.510.1631736328496;
        Wed, 15 Sep 2021 13:05:28 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id m17sm393336ejn.108.2021.09.15.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:05:28 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hn.chen@sunplusit.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 1/3] media: uvc: Extend documentation of uvc_video_clock_decode()
Date:   Wed, 15 Sep 2021 22:05:23 +0200
Message-Id: <20210915200525.448941-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210915200525.448941-1-ribalda@chromium.org>
References: <20210915200525.448941-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make a explicit reference to uvc 1.5, explaining how the algorithm
supports the different behaviour of uvc 1.1 and 1.5.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e16464606b14..77f4090f27d2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -505,6 +505,9 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 
 	/* To limit the amount of data, drop SCRs with an SOF identical to the
 	 * previous one.
+	 * This filtering is also needed for supporting UVC 1.5. Where all the
+	 * data packages of the same frame contains the same sof. In that case
+	 * only the first one will match the host_sof.
 	 */
 	dev_sof = get_unaligned_le16(&data[header_size - 2]);
 	if (dev_sof == stream->clock.last_sof)
-- 
2.33.0.309.g3052b89438-goog

