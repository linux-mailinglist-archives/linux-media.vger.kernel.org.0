Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FAB6A5DB2
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 17:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjB1Qxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 11:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjB1Qxv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 11:53:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5569D2D14C
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 08:53:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1C7C6B80E77
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 16:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AC0C433D2;
        Tue, 28 Feb 2023 16:52:24 +0000 (UTC)
Message-ID: <5f1ff21e-557d-0d80-293b-2ecccb9d5e2a@xs4all.nl>
Date:   Tue, 28 Feb 2023 17:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC] Remove support for the video overlay interface
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While working on the vb2 conversion of the saa7146 driver I dug a bit deeper into
the video capture overlay support of that driver.

For more info of that feature see:

https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-overlay.html

Specifically, video overlay support relies on userspace passing the address of
the framebuffer to the driver with VIDIOC_S_FBUF. The PCI driver can then DMA
the captured frame straight into the framebuffer. This was useful 20 years ago,
but today not so much.

Typically userspace would get the address from the /dev/fbX device using the
FBIOGET_FSCREENINFO ioctl.

But drm_fb_helper.c sets the smem_start field explicitly to 0 unless:

1) CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is set, and
2) CONFIG_EXPERT is set, and
3) set the drm_kms_helper module parameter drm_leak_fbdev_smem to 1.

Actually, even with all that set, I *still* get a 0 value. I probably
missed something.

In any case, I think destructive overlay support is effectively dead and it
should be removed from the v4l2 drivers.

This would affect saa7146, bttv, saa7134 and vivid.

Output overlay support is still around (ivtv, omap_vout). There is also a
single driver with a non-destructive capture overlay:
drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c

No idea what that's doing exactly in the bcm2835 driver.

Removing support for this has some nice related benefits: the overlay
window supports clipping (either a list of rectangles or a bitmap), and
that would also disappear. That makes the compat32 code quite a bit easier.
A fair amount of code is dedicated to that.

So, I propose to drop destructive overlay support from saa7146, bttv and
saa7134 and vivid for the 6.4 kernel. In addition, support for
V4L2_FBUF_CAP_LIST_CLIPPING and V4L2_FBUF_CAP_BITMAP_CLIPPING is also
dropped. This only affects the vivid driver which is the only driver that
supports this for output overlays.

Any objections?

Regards,

	Hans
