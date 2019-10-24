Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39BC6E2766
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 02:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406366AbfJXAmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 20:42:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52420 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392817AbfJXAmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 20:42:07 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E27933A;
        Thu, 24 Oct 2019 02:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571877725;
        bh=/ZxB4+cvPZfBlbkuJYgIdyxrXwR3A4UEX7sRfXtd1zI=;
        h=From:To:Cc:Subject:Date:From;
        b=Dx2BYily+1yTyNjcypZz7SizWWcK+a8m7QCLOct1ZxZqAgAYugeicVJO2srvh7VSc
         XTfc/kNGbNHhVKb2ZQ+hda8EFcszLJ6cVBWxBjDYZuvIi8Suyo0CTzNTRKgf4vogyE
         8jjOVnWVYjvSeze4jdu9DZhv70UR9E9D1NOOs3qk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 0/7] media: imx: Miscellaneous fixes for i.MX7
Date:   Thu, 24 Oct 2019 03:41:48 +0300
Message-Id: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series contains miscellaneous fixes I developed while trying
to capture from a CSI-2 sensor on the i.MX7.

Patches 1/7, 2/7 and 6/7 are small fixes or enhancements, please see
individual commit messages. Patches 3/7, 4/7 and 5/7 add support for 10-
and 12-bit greyscale formats (both on the i.MX7 CSI-2 receiver side and
the CSI side). Patch 7/7 finally fixes a recent issue with video field
handling.

Laurent Pinchart (7):
  media: imx: imx7_mipi_csis: Power off the source when stopping
    streaming
  media: imx: imx7_mipi_csis: Print the RESOL_CH0 register
  media: imx: imx7_mipi_csis: Add greyscale formats support
  media: imx: imx6-media-csi: Replace Y16 with Y10 and Y12
  media: imx: imx7-media-csi: Add Y10 and Y12 formats support
  media: imx: imx7-media-csi: Remove unneeded register read
  media: imx: imx7-media-csi: Fix video field handling

 drivers/staging/media/imx/imx-media-csi.c   |  3 ++-
 drivers/staging/media/imx/imx-media-utils.c | 13 ++++++++-----
 drivers/staging/media/imx/imx7-media-csi.c  | 14 +++++++++++++-
 drivers/staging/media/imx/imx7-mipi-csis.c  | 15 ++++++++++++++-
 4 files changed, 37 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart

