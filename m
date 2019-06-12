Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEF442104
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 11:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437511AbfFLJg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 05:36:56 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34333 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731691AbfFLJg4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 05:36:56 -0400
Received: by mail-pl1-f196.google.com with SMTP id i2so6405656plt.1
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 02:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0HM5SoliJDA3x8dLqRFVSpErY9ZjZiu/7dZDibCRUD8=;
        b=b5NRZZzXPxl6w5LwxAXkKuxZxHCocavnaojtqAEHIs6N4i7nDPLyLD58i1cyvDL8Oc
         RWOwGw4rr9cfAgZHPk0O5X8/wXR0Okm742qRAazPUelI3Hz9knF4mslU2kgihImuw6gr
         MRfXTfkKhmzsekl2p8UGUrZTXTf9aKDL4boY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0HM5SoliJDA3x8dLqRFVSpErY9ZjZiu/7dZDibCRUD8=;
        b=WD/I9Jkgl6ZxLNoMIHJ/7Wk2fed6wjFL4zwLFumMuLtaZ1HLFoUfEPb8Szxb3wNVqY
         /OwWePwt3tLC2Tyjgb5pZ7d0KUdDabxJH2LAftw384rvQkJUKxn5YjwpPndEzYs90vmW
         r2aHmxisedCqZR2e8MGNDELTnQaxe3UfTMYuoUTyPpIFaW/d6GDoYJOMSCz0BFpKv3J9
         JN+18QH0YTvqo+C1NNGk7WJ/6JEBubMnz0pc2t9yT/pmoGNDzKl2md5uIaNdHSRi9aat
         ac+s2nxqNRwrKqGPlIy2+EGOIu5c7QpIrdbm2oXynmcWJWlaWd1VX/7rjQy0pO7SQO9M
         Fkog==
X-Gm-Message-State: APjAAAWLeJFC0iCC+mR5IY/2peWHrAUo5oZukEENhNI9kr7DnrCviyFn
        Pn22N4CBbqSuNW24pMrDEtcTdDp8R2vQ+w==
X-Google-Smtp-Source: APXvYqzfN1W92Yom13ePXXUnOfpx/PPaFrT4AeV13Y9+7ejaBWM9SLtJUijheYJzWC+qlCzeOJZCQQ==
X-Received: by 2002:a17:902:da4:: with SMTP id 33mr21908077plv.209.1560332215116;
        Wed, 12 Jun 2019 02:36:55 -0700 (PDT)
Received: from tfiga.tok.corp.google.com ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id t4sm4521209pjq.19.2019.06.12.02.36.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 02:36:54 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] media: Clarify the meaning of file descriptors in VIDIOC_DQBUF
Date:   Wed, 12 Jun 2019 18:36:48 +0900
Message-Id: <20190612093648.47412-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the application calls VIDIOC_DQBUF with the DMABUF memory type, the
v4l2_buffer structure (or v4l2_plane structures) are filled with DMA-buf
file descriptors. However, the current documentation does not explain
whether those are new file descriptors referring to the same DMA-bufs or
just the same integers as passed to VIDIOC_QBUF back in time. Clarify
the documentation that it's the latter.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 Documentation/media/uapi/v4l/vidioc-qbuf.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-qbuf.rst b/Documentation/media/uapi/v4l/vidioc-qbuf.rst
index dbf7b445a27b..407302d80684 100644
--- a/Documentation/media/uapi/v4l/vidioc-qbuf.rst
+++ b/Documentation/media/uapi/v4l/vidioc-qbuf.rst
@@ -139,6 +139,14 @@ may continue as normal, but should be aware that data in the dequeued
 buffer might be corrupted. When using the multi-planar API, the planes
 array must be passed in as well.
 
+If the application sets the ``memory`` field to ``V4L2_MEMORY_DMABUF`` to
+dequeue a :ref:`DMABUF <dmabuf>` buffer, the driver fills the ``m.fd`` field
+with a file descriptor numerically the same as the one given to ``VIDIOC_QBUF``
+when the buffer was enqueued. No new file descriptor is created at dequeue time
+and the value is only for the application convenience. When the multi-planar
+API is used the ``m.fd`` fields of the passed array of struct
+:c:type:`v4l2_plane` are filled instead.
+
 By default ``VIDIOC_DQBUF`` blocks when no buffer is in the outgoing
 queue. When the ``O_NONBLOCK`` flag was given to the
 :ref:`open() <func-open>` function, ``VIDIOC_DQBUF`` returns
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

