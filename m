Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4CB6A3F05
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 11:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjB0KAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 05:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjB0KAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 05:00:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF741E1EC
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 02:00:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8219CB80C9C
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 10:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0789C433D2;
        Mon, 27 Feb 2023 10:00:36 +0000 (UTC)
Message-ID: <17754260-d77f-cd6b-c753-06b57373151d@xs4all.nl>
Date:   Mon, 27 Feb 2023 11:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Andy Walls <awalls@md.metrocast.net>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.4] cx18: convert to vb2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series converts cx18 to vb2. It also fixes a number of
compliance issues.

The first two patches fix core bugs that only appear with a somewhat weird
driver like cx18: video0 only supports read() but streaming ioctls were
incorrectly enabled in the core; also vb2_fop_read had an ownership issue in
case vb2_read would return an error.

cx18 now passes the v4l2-compliance tests.

As usual, the vb2 conversion patch is pretty much unreviewable. It's
impossible to do an incremental vb2 conversion, it's all or nothing.

Regards,

	Hans

The following changes since commit 3e62aba8284de0994a669d07983299242e68fe72:

  media: imx-mipi-csis: Check csis_fmt validity before use (2023-02-26 11:21:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-cx18

for you to fetch changes up to 9dba815c0cbbd283586b9066f652da32e1a9381b:

  cx18: fix format compliance issues (2023-02-27 10:26:18 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (8):
      vb2: set owner before calling vb2_read
      v4l2-dev.c: check for V4L2_CAP_STREAMING to enable streaming ioctls
      cx18: convert to vb2
      cx18: fix incorrect input counting
      cx18: properly report pixelformats
      cx18: missing CAP_AUDIO for vbi stream
      cx18: reorder fmt_vid_cap functions in cx18-ioctl.c
      cx18: fix format compliance issues

 drivers/media/common/videobuf2/videobuf2-v4l2.c |   5 +-
 drivers/media/pci/cx18/Kconfig                  |   2 +-
 drivers/media/pci/cx18/cx18-driver.c            |   4 +-
 drivers/media/pci/cx18/cx18-driver.h            |  24 ++--
 drivers/media/pci/cx18/cx18-fileops.c           |  85 +++-----------
 drivers/media/pci/cx18/cx18-fileops.h           |   3 +-
 drivers/media/pci/cx18/cx18-ioctl.c             | 391 ++++++++++++++++++++++++++--------------------------------------
 drivers/media/pci/cx18/cx18-mailbox.c           |  27 ++---
 drivers/media/pci/cx18/cx18-streams.c           | 278 +++++++++++++++++++++++----------------------
 drivers/media/v4l2-core/v4l2-dev.c              |   5 +-
 10 files changed, 357 insertions(+), 467 deletions(-)
