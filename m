Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B440BD8D11
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 11:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392099AbfJPJ5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 05:57:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36366 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbfJPJ5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 05:57:42 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DD1543E
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 11:57:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571219861;
        bh=9Fvv7sUetuyQEqZHmIeP7mkJdn6+hs2DrAm3bqdXosE=;
        h=Date:From:To:Subject:From;
        b=parbI5ysDJUiTQ4ojaBVDXR+F+G7rQnoowyJ66+w2WibKoPTZnw9ney4Mwu93er2+
         rnwTOE1S9YJ4LEoQQP+3r7YkNHRbKp2Xxgcnbu0+283MUqaaab5ZT9X22Df7rqUMw0
         KiZsCBFZq3aYSbgXdit2nLj11g16zh2OOP+rg8YE=
Date:   Wed, 16 Oct 2019 12:57:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.5] uvcvideo and omap4iss fixes
Message-ID: <20191016095738.GB5175@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 3ff3a712a9eabb3d7bf52c263dd1ece054345df4:

  media: ti-vpe: vpe: don't rely on colorspace member for conversion (2019-10-10 13:54:22 -0300)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20191016

for you to fetch changes up to 3852c5c20448eb08142a9eee6fc6caa12a7d55d8:

  staging: media: Make use of devm_platform_ioremap_resource (2019-10-16 12:54:08 +0300)

----------------------------------------------------------------
- uvcvideo miscellaneous fixes
- omap4iss miscellaneous fixes

----------------------------------------------------------------
Christophe JAILLET (1):
      media: uvcvideo: Fix a typo in UVC_METATADA_BUF_SIZE

Hariprasad Kelam (1):
      staging: media: Make use of devm_platform_ioremap_resource

Laurent Pinchart (1):
      media: uvcvideo: Fix error path in control parsing failure

Nachammai Karuppiah (1):
      staging: media: omap4iss: Replace NULL comparison.

 drivers/media/usb/uvc/uvc_driver.c         | 28 +++++++++++++++-------------
 drivers/media/usb/uvc/uvc_metadata.c       |  4 ++--
 drivers/media/usb/uvc/uvc_queue.c          |  2 +-
 drivers/media/usb/uvc/uvcvideo.h           |  2 +-
 drivers/staging/media/omap4iss/iss.c       |  6 +-----
 drivers/staging/media/omap4iss/iss_video.c |  4 ++--
 6 files changed, 22 insertions(+), 24 deletions(-)

-- 
Regards,

Laurent Pinchart
