Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9926431307
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 11:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbhJRJRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 05:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbhJRJQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 05:16:54 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3175BC061768
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 02:14:41 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id y7so14227278pfg.8
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 02:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=swVZpYip1M7ZqbqUB16EZPmqODBt6dsbtK7MQvHH9Ms=;
        b=O9J7sn1LzSQ6p4gr7FpNZj9M9cN4f6kYuc+ctbUb4oIidsVmku9F63n+IY2YdbssWT
         iJki+nzhYmyFS3YKEElMiPMYKrNzRN8GGt7YXRpX664AhS06LzH6VVNRzvYy7kX/o+VJ
         ra9lFhsCAGTiODiJ/oNbBXRG1lVpBIt36Y2h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=swVZpYip1M7ZqbqUB16EZPmqODBt6dsbtK7MQvHH9Ms=;
        b=BGcJ069MB404Aej+NZSy78gOKcrpAtUi/sHyxOmmOU5QiThwDf2XzEc7UrK8fEe3vL
         92EwqKbsr9pUGBxE9xdGEVAPsE7CJ83SE1W9WhB1ghlDW8onnmyoZEBDsgVHqXhzKDvb
         Y/JPa2yvdLSqkBa+pN45/W31P1BoYAthUSf+7xzs6+taLrUZQS1CLHWwjVkYa0524By8
         wxOWeHD6bN40FozZfKATqt/NMHMlZFsBfOMaN3fwLmuAV+/g8tBzb49dwSPisVc0N1dg
         AD1lL5ZDn9bySjWB9aQsAFteLBB2GiaFTfhM/EXvMIpoxTwyqnonkG4xkOqcDEbpmrwE
         ooOg==
X-Gm-Message-State: AOAM532y5a7C2eR48mBXFlaUQQbBsP3ZHTSsc3mXSJ/NCuGJRBxYzvKL
        Ikrp0SNNGj3tMLJG1aapVNPT2A==
X-Google-Smtp-Source: ABdhPJyrmN0hZbBGholHeCsXXLIU7TjeZyEavzVeHKjRQaxvIxsDnHK9rq9E1Y6KBEAioE6K09YMEQ==
X-Received: by 2002:a05:6a00:21c2:b0:44c:fa0b:f72 with SMTP id t2-20020a056a0021c200b0044cfa0b0f72mr26988851pfj.13.1634548480611;
        Mon, 18 Oct 2021 02:14:40 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:155d:10d8:25e2:6e41])
        by smtp.gmail.com with ESMTPSA id z19sm12416689pfj.156.2021.10.18.02.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 02:14:40 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] media: docs: dev-decoder: add restrictions about CAPTURE buffers
Date:   Mon, 18 Oct 2021 18:14:27 +0900
Message-Id: <20211018091427.88468-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAPTURE buffers might be read by the hardware after they are dequeued,
which goes against the general idea that userspace has full control over
dequeued buffers. Explain why and document the restrictions that this
implies for userspace.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../userspace-api/media/v4l/dev-decoder.rst     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index 5b9b83feeceb..3cf2b496f2d0 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -752,6 +752,23 @@ available to dequeue. Specifically:
      buffers are out-of-order compared to the ``OUTPUT`` buffers): ``CAPTURE``
      timestamps will not retain the order of ``OUTPUT`` timestamps.
 
+.. note::
+
+   The backing memory of ``CAPTURE`` buffers that are used as reference frames
+   by the stream may be read by the hardware even after they are dequeued.
+   Consequently, the client should avoid writing into this memory while the
+   ``CAPTURE`` queue is streaming. Failure to observe this may result in
+   corruption of decoded frames.
+
+   Similarly, when using a memory type other than ``V4L2_MEMORY_MMAP``, the
+   client should make sure that each ``CAPTURE`` buffer is always queued with
+   the same backing memory for as long as the ``CAPTURE`` queue is streaming.
+   The reason for this is that V4L2 buffer indices can be used by drivers to
+   identify frames. Thus, if the backing memory of a reference frame is
+   submitted under a different buffer ID, the driver may misidentify it and
+   decode a new frame into it while it is still in use, resulting in corruption
+   of the following frames.
+
 During the decoding, the decoder may initiate one of the special sequences, as
 listed below. The sequences will result in the decoder returning all the
 ``CAPTURE`` buffers that originated from all the ``OUTPUT`` buffers processed
-- 
2.33.0.1079.g6e70778dc9-goog

