Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453877DD07B
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 16:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344807AbjJaP1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 11:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344781AbjJaP1e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 11:27:34 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4129F
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 08:27:31 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 521D666073A1;
        Tue, 31 Oct 2023 15:27:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698766050;
        bh=dSeDGsiR/zR2fbDacBtaYnyM7KbUYzl2Uf6RNFXumkk=;
        h=From:To:Cc:Subject:Date:From;
        b=XZZowW2+idVkPVHyubR23vSlO9owBpb4PmQAgxCCNFvf1WphF/NG4f97w1CCH1y+a
         FV/NiOTajTWGSINe+l9KlTzDT8Sb1yp5wzcn70f6tx0yig/VYrWSjdSFgTZ1HxkZ7R
         kpPHQelUaVWaz5EZ3yUawJ1OFNIc5+WGjLVndgtvmTE8RYgvgAM9OfdYdmw/WDJpZH
         xiS+kF4uDCbmc7+fRcRPqUXjLzEarUHDx2Xb0J4eVZzc7Odg7gmfPB8fiOJGVt03rY
         j+elmaqj7l9rwGpb4nG4zoxJKsm65ss52WunBCML4RyYhchsXE5fCNFOtqbNW6uRbx
         wAQ2P45Bvh01A==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 0/4] v4l2-compliance: Add tests for DELETE_BUFS
Date:   Tue, 31 Oct 2023 16:27:18 +0100
Message-Id: <20231031152722.84444-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

version 5:
- change g_max_buffers() to g_max_num_buffers().
- change v4l_queue_g_max_buffers() to v4l_queue_g_max_num_buffers().
- rename struct v4l_queue max_buffers field to max_num_buffers.
- fix V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS name in bufcap_def array.
- add V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS in bufcap_def array.
- only test MMAP streaming mode.
- rework test code.

Benjamin Gaignard (4):
  v4l-utils: Add max_num_buffers field to v4l2_create_buffers struct
  v4l2-compliance: Test queue maximum buffers allocation
  v4l2-utils: Add VIDIOC_DELETE_BUFS ioctl
  v4l2-compliance: Add a test for DELETE_BUFS ioctl

 include/linux/videodev2.h                   |  23 +++-
 utils/common/cv4l-helpers.h                 |   5 +
 utils/common/v4l-helpers.h                  |  22 ++++
 utils/common/v4l2-info.cpp                  |   2 +
 utils/v4l2-compliance/v4l2-compliance.cpp   |   2 +
 utils/v4l2-compliance/v4l2-compliance.h     |   2 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 122 ++++++++++++++++++++
 7 files changed, 177 insertions(+), 1 deletion(-)

-- 
2.39.2

