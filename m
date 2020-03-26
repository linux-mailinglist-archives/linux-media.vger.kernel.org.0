Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7CA4194B3C
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 23:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCZWIx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 18:08:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42034 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZWIw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 18:08:52 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E1512DC;
        Thu, 26 Mar 2020 23:08:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585260531;
        bh=vYAuRcgBzXEkRHZRmuVEqirbDDuEhrLt7jQNeOvXygk=;
        h=From:To:Cc:Subject:Date:From;
        b=M3tSoyIYxMiHseJAHqgFNvVPCM6SN+bIZZLDIFRCk0/tDHPahyTQ3iCZ4uvxFmKU7
         qMMGNj+DFKt7/kEER2s5PXjRwH94aMUNGa/GY68cjuJsTogPnGN2aE2/GB1hcIueJS
         WlCz+B8zKFy5oFytp4hxP+gAz663SGh4H9roWxGE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 00/11] media: imx: Miscalleanous format-related cleanups
Date:   Fri, 27 Mar 2020 00:08:29 +0200
Message-Id: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series started as an attempt to fix the format get and set
subdev operations on the i.MX7 CSI-2 receiver subdev, which have been
merged already. This is the second version of the drive-by cleanups that
I have implemented on top.

Compared to v1, I have included Philipp's pixel and media bus format
enumeration fixes and cleanups in patches 01/11 and 02/11. Patches 03/11
to 08/11 push the cleanups further as I was attempting to fix the format
enumeration on the video node at the end of the pipeline.

Patches 09/11 to 11/11 are new in this series, and patch 11/11 in
particular introduces a new feature that isn't used yet, and thus
doesn't need to be merged yet. I have nonetheless included it to give
context to patches 09/11 and 10/11.

Steve, I'm aware this conflicts with your "[PATCH 00/10] media: imx:
Miscellaneous format-related cleanups" series. I have no issue with
merging your patches instead, but I wanted to post this to ensure that
no change would fall between the cracks, and that the feature
implemented in patch 11/11 is doable on top of your series.

To give some context to that new feature, it will be used to implement
the extension to VIDIOC_ENUM_FMT proposed in "media: v4l2: Extend
VIDIOC_ENUM_FMT to support MC-centric devices". I have a large patch
series that refactors imx-media-capture.c to make that possible, I will
rebase it on top of the cleanups that will be merged (from Steve series
and/or from mine) and submit it.

Laurent Pinchart (9):
  media: imx: utils: Inline init_mbus_colorimetry() in its caller
  media: imx: utils: Handle Bayer format lookup through a selection flag
  media: imx: utils: Simplify IPU format lookup and enumeration
  media: imx: utils: Make imx_media_pixfmt handle variable number of
    codes
  media: imx: utils: Remove unneeded argument to (find|enum)_format()
  media: imx: utils: Rename format lookup and enumeration functions
  media: imx: utils: Constify mbus argument to
    imx_media_mbus_fmt_to_pix_fmt
  media: imx: utils: Decouple mbus- and pixel-based format lookup and
    enum
  media: imx: utils: Add ability to filter pixel formats by mbus code

Philipp Zabel (2):
  media: imx: fix and simplify pixel format enumeration
  media: imx: fix media bus format enumeration

 drivers/staging/media/imx/imx-ic-prp.c        |   8 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   6 +-
 drivers/staging/media/imx/imx-media-capture.c |  23 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |   2 +-
 drivers/staging/media/imx/imx-media-csi.c     |  26 +-
 drivers/staging/media/imx/imx-media-utils.c   | 530 ++++++++----------
 drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
 drivers/staging/media/imx/imx-media.h         |  26 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
 9 files changed, 299 insertions(+), 343 deletions(-)

-- 
Regards,

Laurent Pinchart

