Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1D17E3A27
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 11:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234208AbjKGKns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 05:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233974AbjKGKnr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 05:43:47 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2347D57
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 02:43:43 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0FEF566074BB;
        Tue,  7 Nov 2023 10:43:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699353822;
        bh=xEthCCNNDuD7lw3yd7pdUpJJvz5ya8h6iSn95Msj3I0=;
        h=From:To:Cc:Subject:Date:From;
        b=UXKUW02kRU2vg453gs5FCwMQOC1NizuJxZXTpmoX+WLb/JsNflHKZjSkKPs+hAoAP
         jR1v7ajqwnKWFkDLGo6IBWuaD1xIO712aFqsqHzxPxcRBLfbAcHgxUZeW6qAEpr85l
         iMU3lA52t7vlUc92HI9ytR7yIOim3DPljySdtqhAQA7C4FfVO521g43aeyS2vExw5o
         O5dt4bI8nxem84aluNFTINxKZJzrG7+te/BgkzWrIvPINmWmHZ0tVfAm5DcjHlEn27
         K7jjg983XRIIP6B3yQ1koUEaPUKlyv6x5qesUomBTFiM9f5vIimmKiSaDNObNrTz5P
         5g7acr1wmPXoA==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 0/4] v4l2-compliance: Add tests for DELETE_BUFS
Date:   Tue,  7 Nov 2023 11:41:28 +0100
Message-Id: <20231107104132.445705-1-benjamin.gaignard@collabora.com>
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

version 6:
- fix compilation issue in "v4l2-compliance: Test queue maximum buffers allocation"

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

