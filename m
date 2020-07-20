Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C7A2260D8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 15:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbgGTNYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 09:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgGTNYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 09:24:24 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5ADEC0619D4
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:23 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h19so20174854ljg.13
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b2rYd9nm3SPkJnxD1ULMt+9UUxBnRy5tHP+SV4VkRQo=;
        b=eNLxZATCSdcSJ52R9lxPtdWl3+8VydtB0TO4J8z7BDb8HN92Pe6AaHHdp0c1Y5KFnD
         e1OayGHlgNk3Wtps9EiuilM0+OQTpGTkNosnVoeW15aTGu5D6+oNsWWtNtxBceo7A/E9
         1ey+E6yhxnN/dRVA7YuPQhHIpv3haqeN7RDwHU4dEjLMWS6tJGBAPK1NNOXhikY4aRrW
         TTiIVqOppHt6CI3SRJGbMgEWegQAW2COI3Z3I1p8uraJLc8U/+HDLUS1sRmQxHnFL2rs
         x3fo3RwaOZorYwx0685XNtaZbGPsc7sGjOAUnzIaNb6uWW4I7Hq+D/FOgnZAkjgPfk4+
         hSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b2rYd9nm3SPkJnxD1ULMt+9UUxBnRy5tHP+SV4VkRQo=;
        b=SxZ2QKUhujMWDfX08YgmO4m61BNl7MWFq2kDVTqfPPwOL6nbAwBywOBud18B3ulXXL
         pmLFFT6ehlUQZhPlfhYxXuU7KSxRtHZ7sPHV5WBu0bRkYefpz5QnCHx4F5hKNSjKs8Bg
         aV02g9dWtGCIvsDbYLgvuW3NNssv1b0aOHU96q9Sa/kHHCk1HFyoKxtIUca4trUyQlic
         Sc6MG+GowEOJrDaOZO1ViKcZRAlNupXlYogoN6fI1Jshymj5zNU+cF+ZFMannwJlQ9pH
         GSJ6t8xFHaavNfAqxxgG6iEexfpQjRVpCSk1gpZ51GluoPVE1WUPrjVj+jhLSR0JP+vS
         t7dA==
X-Gm-Message-State: AOAM530dIHXZI19SC+z65zo0owvaKTH1ZCrac+PDfYqhE3RlQwIWEP0w
        LfCALU7IGskwS3Z+RsR9AktMEWiSxng=
X-Google-Smtp-Source: ABdhPJxMqrHax1WTDgzjv84txngVdp7CoHtlWOOyUEWGxNRqf1zfy74uyA46AN2CgXS0aND0busIfg==
X-Received: by 2002:a2e:7601:: with SMTP id r1mr11283577ljc.111.1595251462129;
        Mon, 20 Jul 2020 06:24:22 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h6sm867829lfc.84.2020.07.20.06.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:24:21 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 6/6] media: docs: Deprecate mfc frame skip control
Date:   Mon, 20 Jul 2020 16:23:13 +0300
Message-Id: <20200720132313.4810-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
References: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Deprecate mfc private frame skip mode control for new
clients and use the standard one instead.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 3e6b5d61500b..30899d84f178 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2816,6 +2816,11 @@ MFC 5.1 Control IDs
 ``V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE``
     (enum)
 
+    .. note::
+
+       This control is deprecated. Use the standard
+       ``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE`` control instead.
+
 enum v4l2_mpeg_mfc51_video_frame_skip_mode -
     Indicates in what conditions the encoder should skip frames. If
     encoding a frame would cause the encoded stream to be larger then a
-- 
2.17.1

