Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A865546CB
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235087AbiFVJbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbiFVJbu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:31:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7222C3969B
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:31:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D74C61A0D
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 09:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D83C34114;
        Wed, 22 Jun 2022 09:31:47 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 0/2] vb2: add (un)prepare_streaming vb2_queue ops
Date:   Wed, 22 Jun 2022 11:31:43 +0200
Message-Id: <20220622093145.927377-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for two new (un)prepare_streaming queue ops that are called
when the user calls VIDIOC_STREAMON and STREAMOFF (or closes the fh).

This gives drivers a callback to validate the video pipeline and claim
or release streaming resources at the time that userspace indicates
that it wants to start streaming (VIDIOC_STREAMON) rather than when
the actual DMA engine kicks in (the start_streaming callback). This
is relevant for drivers that needs a minimum of X buffers before the
DMA can start. The actual pipeline validation needs to happen sooner
to avoid unnecessary errors at VIDIOC_QBUF time.

As a bonus this allows us to move the horrible call to
v4l_vb2q_enable_media_source() in vb2_core_streamon() to the au0828
driver (currently the only driver that uses this feature).

That call never belonged in vb2, but it had the same purpose as the
new prepare_streaming op: validate the pipeline.

This is a follow-up from my previous RFCv2:

https://patchwork.linuxtv.org/project/linux-media/patch/ba4bca14-488f-94ea-48d9-e7343103c5aa@xs4all.nl/

I would like to get consensus for this series.

Regards,

	Hans

Hans Verkuil (2):
  vb2: add (un)prepare_streaming queue ops
  vb2/au0828: move the v4l_vb2q_enable_media_source to the au0828 driver

 .../media/common/videobuf2/videobuf2-core.c   | 26 ++++++++++++++-----
 drivers/media/usb/au0828/au0828-vbi.c         |  2 ++
 drivers/media/usb/au0828/au0828-video.c       |  1 +
 include/media/videobuf2-core.h                | 14 ++++++++++
 4 files changed, 37 insertions(+), 6 deletions(-)

-- 
2.35.1

