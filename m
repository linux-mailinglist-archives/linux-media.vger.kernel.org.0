Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC0027E130
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgI3GgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgI3GgH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:07 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2588E2076E;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=6FbpSr2Z77TWm5cLFUNzD9WaCkeZQAoribfaCC5rs7k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bp9trC2EldsrjLmG8826svFiTOuqV1aI2s4j0YBISifgOfwP37FIItroj3Yx4TUkJ
         bxb4oMg32dG9jC7ARMa7tifr7xdw5VToYmoQg0ogBBSRQ+KTOQn1GRezfR4KP44eOT
         /eQyq1V4MeeeKD9bwUfj+3SFJCnDjL0tSyTOBqLg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVie-001Qme-1c; Wed, 30 Sep 2020 08:36:04 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] media: hist-v4l2.rst: remove struct duplication
Date:   Wed, 30 Sep 2020 08:36:01 +0200
Message-Id: <6ca487190fafa23f4ab53935a9c6d0fcde9f95d2.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601447236.git.mchehab+huawei@kernel.org>
References: <cover.1601447236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several places there where struct was used twice,
on multiple lines, like:

	struct
	struct ``v4l2_zoomcap``

That's probably done during the DocBook to ReSt conversion.

Probably the cases where "struct struct" were at the same line
was addressed back then, but the multi-line cases are still
there.

Get rid of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/hist-v4l2.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/hist-v4l2.rst b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
index 8be82bdb1729..fe60cb9e2e07 100644
--- a/Documentation/userspace-api/media/v4l/hist-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
@@ -582,11 +582,10 @@ This unnamed version was finally merged into Linux 2.5.46.
     above. A ``field`` field of type :c:type:`v4l2_field` was added to
     distinguish between field and frame (interlaced) overlay.
 
-17. The digital zoom interface, including struct
-    struct ``v4l2_zoomcap``, struct
+17. The digital zoom interface, including struct ``v4l2_zoomcap``,
     struct ``v4l2_zoom``, ``V4L2_ZOOM_NONCAP`` and
     ``V4L2_ZOOM_WHILESTREAMING`` was replaced by a new cropping and
-    scaling interface. The previously unused struct
+    scaling interface. The previously unused
     struct :c:type:`v4l2_cropcap` and struct :c:type:`v4l2_crop`
     where redefined for this purpose. See :ref:`crop` for details.
 
@@ -811,7 +810,7 @@ V4L2 spec erratum 2006-02-04
 
 1. The ``clips`` field in struct :c:type:`v4l2_window`
    must point to an array of struct :c:type:`v4l2_clip`, not
-   a linked list, because drivers ignore the struct
+   a linked list, because drivers ignore the
    struct :c:type:`v4l2_clip`. ``next`` pointer.
 
 
@@ -926,7 +925,7 @@ V4L2 in Linux 2.6.22
 
    A new ``global_alpha`` field was added to
    :c:type:`v4l2_window`, extending the structure. This
-   may *break compatibility* with applications using a struct
+   may *break compatibility* with applications using a
    struct :c:type:`v4l2_window` directly. However the
    :ref:`VIDIOC_G/S/TRY_FMT <VIDIOC_G_FMT>` ioctls, which take a
    pointer to a :c:type:`v4l2_format` parent structure
@@ -1013,8 +1012,7 @@ V4L2 in Linux 2.6.29
 
 1. The ``VIDIOC_G_CHIP_IDENT`` ioctl was renamed to
    ``VIDIOC_G_CHIP_IDENT_OLD`` and ``VIDIOC_DBG_G_CHIP_IDENT`` was
-   introduced in its place. The old struct
-   struct ``v4l2_chip_ident`` was renamed to
+   introduced in its place. The old struct ``v4l2_chip_ident`` was renamed to
    struct ``v4l2_chip_ident_old``.
 
 2. The pixel formats ``V4L2_PIX_FMT_VYUY``, ``V4L2_PIX_FMT_NV16`` and
-- 
2.26.2

