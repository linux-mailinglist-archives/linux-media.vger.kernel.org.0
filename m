Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065ED489C99
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 16:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236496AbiAJPtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 10:49:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36146 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236551AbiAJPtf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 10:49:35 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95A18A1B
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 16:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641829773;
        bh=Gi7U96viMIMIWVS30+WYfwYREK5dTLxA8gfF6NMPPTU=;
        h=Date:From:To:Subject:From;
        b=AODM9K6JDKKkOvTwIgbtv98gP8E0G6jX33sYOEtN/+yDoxBl+mGK2OqSGD0k1QVSz
         T4GX55RziIFz5T4H6s+Atshgx2xq3y19i44Jho2F6ezBEQODUjAPMukUaQ8TXbeGuW
         EJULCYrfoOg8vWigzxMiaY/WLVsTU4jX290AXc/c=
Date:   Mon, 10 Jan 2022 17:49:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.18] Miscellaneous changes to the i.MX7 CSI-2
 receiver driver
Message-ID: <YdxVhUUepPr0EEyI@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:

  media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/imx-next-20220110

for you to fetch changes up to d8ad3113de69488a7aadc94399c5c3d751c26d49:

  staging: media: imx: imx7-mipi-csis: Make subdev name unique (2022-01-10 17:45:25 +0200)

----------------------------------------------------------------
imx7-mipi-csis miscellaneous changes

----------------------------------------------------------------
Laurent Pinchart (3):
      staging: media: imx: imx7-mipi-csis: Dump MIPI_CSIS_FRAME_COUNTER_CH0 register
      staging: media: imx: imx7_mipi_csis: Add timings override through debugfs
      staging: media: imx: imx7-mipi-csis: Make subdev name unique

 drivers/staging/media/imx/imx7-mipi-csis.c | 44 +++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 10 deletions(-)

-- 
Regards,

Laurent Pinchart
