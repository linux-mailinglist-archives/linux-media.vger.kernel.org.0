Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA1E686B3A
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbjBAQMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:12:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjBAQMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:12:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DB174A78
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:11:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EE624B8217E
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C82C433EF;
        Wed,  1 Feb 2023 16:11:54 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH 0/8] cx18: convert to vb2
Date:   Wed,  1 Feb 2023 17:11:45 +0100
Message-Id: <20230201161153.883376-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series converts cx18 to use the vb2 instead of the videobuf
framework. It also fixes a number of issues reported by v4l2-compliance.

This driver is unusual because it creates two video nodes: one is for
MPEG only, the other is for raw video. The first only supports read(),
the second supports both streaming and read.

Converting cx18 to vb2 uncovered two corner cases in the v4l2 core that
were not handled quite right: one in vb2_read where the owner of the
queue was set too late (that caused problems in cx18 that expects it
to be set when start_streaming is called), and the other was in v4l2-dev.c
where the streaming ioctls were enable when they shouldn't. Rather than
trying a heuristic based on the device node type, just check CAP_STREAMING.

As vb2 conversions go, this one wasn't too bad.

Regards,

	Hans

Hans Verkuil (8):
  vb2: set owner before calling vb2_read
  v4l2-dev.c: check for V4L2_CAP_STREAMING to enable streaming ioctls
  cx18: convert to vb2
  cx18: fix incorrect input counting
  cx18: properly report pixelformats
  cx18: missing CAP_AUDIO for vbi stream
  cx18: reorder fmt_vid_cap functions in cx18-ioctl.c
  cx18: fix format compliance issues

 .../media/common/videobuf2/videobuf2-v4l2.c   |   5 +-
 drivers/media/pci/cx18/Kconfig                |   2 +-
 drivers/media/pci/cx18/cx18-driver.c          |   4 +-
 drivers/media/pci/cx18/cx18-driver.h          |  25 +-
 drivers/media/pci/cx18/cx18-fileops.c         |  85 +---
 drivers/media/pci/cx18/cx18-fileops.h         |   3 +-
 drivers/media/pci/cx18/cx18-ioctl.c           | 387 +++++++-----------
 drivers/media/pci/cx18/cx18-mailbox.c         |  27 +-
 drivers/media/pci/cx18/cx18-streams.c         | 275 +++++++------
 drivers/media/v4l2-core/v4l2-dev.c            |   5 +-
 10 files changed, 351 insertions(+), 467 deletions(-)

-- 
2.39.0

