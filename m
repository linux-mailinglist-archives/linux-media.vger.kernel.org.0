Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4CA7D928B
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 10:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345534AbjJ0Irp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 04:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345406AbjJ0Irn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 04:47:43 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6883DBD
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 01:47:41 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:dbc0:3460:d466:3213])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 14DB06607322;
        Fri, 27 Oct 2023 09:47:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698396460;
        bh=jqM7jjdeaN6Oi+UIjvB9SyAp6/K/NkcrGOdTHBfyqHw=;
        h=From:To:Cc:Subject:Date:From;
        b=liTzZHONXT1nbvr5XalhcpmHwsSwYk+YiU5GjjQCr4O/BflAIfxl8du3eKqr8EEz+
         laRl0vGsORQk55Ud0i4ts07mNJ6U29zURg1jb1ugRbz8whRta8IWjjkVHw7u5XFDqA
         SouW2WLeoHQD64zS/1meWh8wrJA0Eg9z5uC4VyhFi4u0gXjTEbVZSiaT/B2uUsKiPo
         850m3lkARsQeYRk96ios8OewgWA7Tq/KYYrTh8SoFugloN3eppC52Lom4++NWzNiMz
         OeJpnLf37bOjW9pmBP31UqGvAYgVJ2IvidaA0Vs/MuKOYDVRTK5XtmqL/AK/zlHWb6
         KBqoQY7sguFZw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 0/4] v4l2-compliance: Add tests for DELETE_BUFS
Date:   Fri, 27 Oct 2023 10:47:28 +0200
Message-Id: <20231027084732.17528-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before being able to add VIDIOC_DELETE_BUFS ioctl, it was needed
to change how v4l2 queues store buffers and how many of them they
can store. That led to add max_num_buffers field into 
v4l2_create_buffers struct.
This series add tests for this new field and VIDIOC_DELETE_BUFS ioctl.

Benjamin Gaignard (4):
  v4l-utils: Add max_num_buffers field to v4l2_create_buffers struct
  v4l2-compliance: Test queue maximum buffers allocation
  v4l2-utils: Add VIDIOC_DELETE_BUFS ioctl
  v4l2-compliance: Add a test for DELETE_BUFS ioctl

 include/linux/videodev2.h                   |  23 +++-
 utils/common/cv4l-helpers.h                 |   5 +
 utils/common/v4l-helpers.h                  |  22 ++++
 utils/common/v4l2-info.cpp                  |   1 +
 utils/v4l2-compliance/v4l2-compliance.cpp   |   2 +
 utils/v4l2-compliance/v4l2-compliance.h     |   2 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 133 +++++++++++++++++++-
 7 files changed, 186 insertions(+), 2 deletions(-)

-- 
2.39.2

