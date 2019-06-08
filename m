Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE18139F64
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 14:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfFHMCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jun 2019 08:02:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37910 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbfFHMCi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jun 2019 08:02:38 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BC5B5D
        for <linux-media@vger.kernel.org>; Sat,  8 Jun 2019 14:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559995357;
        bh=eHZDAp66llVY1RyqTi4ZNMb1Fk63iBdbShhNMbDoZu0=;
        h=Date:From:To:Subject:From;
        b=vUZov63U4Q2MmmX9Q+5mbXEHVvkEemGvn0AmA/NLRfy9jmrDNoG9Uahpljo96Je8O
         qOxeOynHf0gb9VX54qcSYRYdy8z0Vmv6B45qL4q9DftjxI50p2pbvyFE7dqNmkl7K3
         KX535n2LrNadD+FjUweRZGeWT3CcdwlT/cp9httc=
Date:   Sat, 8 Jun 2019 15:02:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.3] UVC and sensor changes
Message-ID: <20190608120222.GC4786@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit edadd68031e5b7c1ba0c413a9549dce62a02844c:

  media: MAINTAINERS: update email address (2019-06-05 15:58:40 -0400)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20190608

for you to fetch changes up to b9cc8bb11c6bd9036d3ff36cfeb4e12f9ff80463:

  media: i2c: mt9p031: simplify getting the adapter of a client (2019-06-08 14:54:15 +0300)

----------------------------------------------------------------
uvcvideo and sensor changes for v5.3

----------------------------------------------------------------
Laurent Pinchart (1):
      media: uvcvideo: Replace copyright text with SPDX header

Oliver Neukum (1):
      media: uvcvideo: Fix access to uninitialized fields on probe error

Torleiv Sundre (1):
      media: uvcvideo: Include streaming interface number in debugfs dir name

Wolfram Sang (1):
      media: i2c: mt9p031: simplify getting the adapter of a client

 drivers/media/i2c/mt9p031.c          |  2 +-
 drivers/media/usb/uvc/uvc_ctrl.c     | 11 ++++-------
 drivers/media/usb/uvc/uvc_debugfs.c  | 12 ++++--------
 drivers/media/usb/uvc/uvc_driver.c   |  7 +------
 drivers/media/usb/uvc/uvc_entity.c   |  7 +------
 drivers/media/usb/uvc/uvc_isight.c   |  7 +------
 drivers/media/usb/uvc/uvc_metadata.c |  6 +-----
 drivers/media/usb/uvc/uvc_queue.c    |  7 +------
 drivers/media/usb/uvc/uvc_status.c   |  7 +------
 drivers/media/usb/uvc/uvc_v4l2.c     |  7 +------
 drivers/media/usb/uvc/uvc_video.c    |  7 +------
 11 files changed, 17 insertions(+), 63 deletions(-)

-- 
Regards,

Laurent Pinchart
