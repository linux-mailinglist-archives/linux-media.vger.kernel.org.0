Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9336B3E42DC
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 11:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbhHIJfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 05:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234661AbhHIJfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 05:35:31 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F31C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 02:35:10 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h14so20484148wrx.10
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BYMozgKo3XB0XopO99fc4sCbPzi6OMYTxOKdbksl6Go=;
        b=K8iyHwNhf/rEEmpAPlZQ/oudhl9LTzIzrcgvHqzH/wtOlg6NFXPxwJUNYWkLewopIZ
         RjS7ST4tEDf8I6vyojbfHtj4fE5wBnQCVVmOw+DLfJ5GC2prixbsvu1b0Zk2hQmGuV3x
         dkuKg0LYyrRnim8RT63UYseQHjjOMeHCarLouUzgDpv38pcGzF9ALSQgNTG8rW62MXSB
         hp9uGK8QLGTVPApPPbVTKzPFA+lhhGI6HcH45HNpfKVFD43UZng2kswPVLkN5fUwgXRB
         0/Mm7bT5JlAtXqccygyGcoNmBVd/hx0z/q/ctLc9RTG/DxkuvJPNE9DZMgtzIaH2QFWa
         fBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BYMozgKo3XB0XopO99fc4sCbPzi6OMYTxOKdbksl6Go=;
        b=iiNwzanxzSxl9e5mactdJZQhlAKUys2gozxX9HOryEJY6I9RRhw6ftHkVe6pAUYfqX
         qEJWixRAbBKMDBD1AGibMaobbfm6PgJbrvzpzVlVFZf/92udQfGhyBBs1szRC5g/ARNF
         X1w/3ELBNNnqcQwm38Zl/KeYtsdd1ENggAP5rctshqkaBfPHvOpuTWxTk1ENNUhsSE2Q
         RMChxbfjYH+q7vmiTvHI517OzqoM3lNWfPc9ioRFd1G4R7PtXGGNUUi8z4hwCwgzTryJ
         DvL6tIrRKfF1xOdmAXsJuKPy41dd4RS7OcbFnvxKIIK37h44eSnYiTepdATcn+cjZxq7
         xOJw==
X-Gm-Message-State: AOAM530o4n/DYoa1FS6PKjCV+malkiEVg00v1qcE3Qw8EY7PzE9yRZnX
        Rph6QJUSYEM0dFYKOH97XDpBzK457fIjSA==
X-Google-Smtp-Source: ABdhPJyrS4Y2ETnZzMpB5O+uiDBix5P9T2nj1/kTiV3B2Zp0FGVhrDoOB0BURdsAs6LO+mQRqBf1yQ==
X-Received: by 2002:adf:f710:: with SMTP id r16mr24301253wrp.124.1628501709378;
        Mon, 09 Aug 2021 02:35:09 -0700 (PDT)
Received: from davidp-xps-13.pitowers.org ([2a00:1098:3142:14:b9d5:8bb6:b974:d6b6])
        by smtp.gmail.com with ESMTPSA id j1sm19941720wmo.4.2021.08.09.02.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:35:09 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v4 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control
Date:   Mon,  9 Aug 2021 10:34:48 +0100
Message-Id: <20210809093448.4461-3-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210809093448.4461-1-david.plowman@raspberrypi.com>
References: <20210809093448.4461-1-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the V4L2_CID_NOTIFY_GAINS control.

This control is required by sensors that need to know what colour
gains will be applied to pixels by downstream processing (such as by
an ISP), though the sensor does not apply these gains itself.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
---
 .../media/v4l/ext-ctrls-image-source.rst          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index de43f5c8486d..c1793fda1429 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -72,3 +72,18 @@ Image Source Control IDs
     * - __u32
       - ``height``
       - Height of the area.
+
+``V4L2_CID_NOTIFY_GAINS (integer)``
+    The sensor is notified what gains will be applied to the different
+    colour channels by subsequent processing (such as by an ISP). The
+    sensor is merely informed of these values in case it performs
+    processing that requires them, but it does not apply them itself to
+    the output pixels.
+
+    For Bayer sensors this is an array control taking 4 gain values,
+    being the gains for each of the Bayer channels. The gains are always
+    in the order B, Gb, Gr and R, irrespective of the exact Bayer order
+    of the sensor itself.
+
+    The units for the gain values are linear, with the default value
+    representing a gain of exactly 1.
-- 
2.30.2

