Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A072279E4
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 09:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgGUHwL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 03:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728550AbgGUHwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 03:52:10 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EB1C0619D8
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 00:52:10 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q7so23077207ljm.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+Wsh5lsQJS5Oj2N0tWY17u1sLYFEy9iokkNEGsNaFVc=;
        b=OaaqOgLWbDq6dMMW9Qd714qnIPqwNeJycdVqOHjHvtSPWLsGIigkGw3oYMdwp9gy4J
         88BotViSV5y55ZHLLXr8sWbl+PPKCk9tXV+bTSFWoP3wNxz7xA30hFbaLABgg0NpGMod
         uDE0TkuRkq58eaFQFqS+oH2AtsKYdu8HhKnLuZbl20b4DKXdf7SXkHyZiw4H5Rj19ktz
         u9JPRKOqXwdSgzsBEgXe474H+oLNjrbIfD0CTbStqhC18SSsUtnX1Kih5O9eSmUm9G3q
         LeZQzR6KTwjZYtd+Mz5s6/lnFAn7MHBqU8dsogvhX9kxc+XXAVSRxGaCMyP7kH6prdMJ
         7uhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+Wsh5lsQJS5Oj2N0tWY17u1sLYFEy9iokkNEGsNaFVc=;
        b=kF1+NLrHz4axpjgMqK7CtFrvWxPho7e6WhLqLguZzjtpnJGGHPf8XdKXS/jliFFiPP
         pmNDpEDbZx9t+5zhoE2Y3nIUNMD8EbXc/oa6jzpk18wgIGfl8nymk44xIkcXhxHswcqN
         SA9LxMwC4jG6LiKtoTaLmBotzWgc2TOBKIAxvxDDDAWjLgwq61GL8C3mOBuF2g5GcZbf
         rtYjqyFzIIa3faNcgg69m4qzZbq1tRaeQbQb0E5tgpOcpB3LIEkUi60bR/lLtKZqb20G
         GTukGym7kgH23tisYrN3xqCAwVFS8sBpOEXRZ7eCWYWOkoVqWKchnesayiQE5/xBcAP7
         22CQ==
X-Gm-Message-State: AOAM533jyFcZ0EXQgIK5nbzUreTX0rHgQ6H2t9b+E9595EAy4lylVfFn
        lM7Z3wZHhovNW8C/p0CAk6iFfyYre/A=
X-Google-Smtp-Source: ABdhPJyZFPSvzK9fQpzmF3fsaGlhPY4lxN74NDqrPwju5khjBtSE4wGLSPuWeHdry7K/2o8YPgJUUg==
X-Received: by 2002:a05:651c:1105:: with SMTP id d5mr12887062ljo.62.1595317927776;
        Tue, 21 Jul 2020 00:52:07 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id d2sm4045334ljg.6.2020.07.21.00.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 00:52:07 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 6/6] media: docs: Deprecate mfc frame skip control
Date:   Tue, 21 Jul 2020 10:45:38 +0300
Message-Id: <20200721074538.505-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721074538.505-1-stanimir.varbanov@linaro.org>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
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
index 985e4c2d29bf..31d77d1cdcc9 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2821,6 +2821,11 @@ MFC 5.1 Control IDs
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

