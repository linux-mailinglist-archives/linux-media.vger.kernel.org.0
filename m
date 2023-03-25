Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA206C9062
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 20:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjCYTQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 15:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCYTQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 15:16:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE97270D
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 12:16:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B796989F
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 20:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679771809;
        bh=ghiPicLYF7A0OU83iyqkSVThGkrHKU5IhN7XPKG8ZWU=;
        h=Date:From:To:Subject:From;
        b=EEm0cYBhDV+ePv1KsQf7oNra0n6uGwZh6D583ECG930ymqA/HTaz9wxRth0CfJILd
         8m6/LFW9JTl9lgZC3aTnyrZTEtI6QgMMG9ck6Y73Fv94et69mdi+k60djv/qnNEuEp
         PfHktsZj4TYFw7/k23SjtDdbnSY3LiTnSiczLeaA=
Date:   Sat, 25 Mar 2023 21:16:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4] uvcvideo fix
Message-ID: <20230325191656.GD9876@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-uvc-next-20230325

for you to fetch changes up to 1681706c6b8a15fbc0d037b97c0f5e9cf9af67cc:

  media: uvcvideo: Cancel async worker earlier (2023-03-25 20:59:49 +0200)

----------------------------------------------------------------
media: uvcvideo: Fix crash at disconnect time

----------------------------------------------------------------
Guenter Roeck (1):
      media: uvcvideo: Cancel async worker earlier

 drivers/media/usb/uvc/uvc_ctrl.c   | 11 +++++++----
 drivers/media/usb/uvc/uvc_driver.c |  1 +
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

-- 
Regards,

Laurent Pinchart
