Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13513A2F14
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 17:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhFJPOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 11:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbhFJPOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 11:14:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F76C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 08:12:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B39D98D4
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 17:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623337953;
        bh=qEJrD42DHtsDEncuco3APQZEszfwYXDGrZGZw1QAZXg=;
        h=Date:From:To:Subject:From;
        b=Mu2ex1bDk3TR6F7MfMrOlzzsr9+90ESggERGRAovap3JEVYXh9GVGErNQRb8VzlJr
         6h1iFZLM/QeytfSk+o4anV3FiuO4cthf4I9ab8yffpUK4lP4PDLTn4NUzEleJQ8OKK
         97K2iGTpnmVfXh2E3IVQVBFlRY+HftAqCDGRIWAE=
Date:   Thu, 10 Jun 2021 18:12:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: i.MX7 & i.MX8 camera improvements
Message-ID: <YMIrzxH04KRdc3F5@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 5b448065febe1c6bb6693735844f2fb2b7b654dc:

  media: pci: tw5864: avoid usage of some characters (2021-06-04 08:11:12 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/imx-20210610

for you to fetch changes up to b5541e1c071f462f0b60fdb55b7b13f5dc96ee6e:

  media: imx: imx7_mipi_csis: convert some switch cases to the default (2021-06-10 17:59:53 +0300)

----------------------------------------------------------------
- i.MX8MM support in the imx7-media-csi driver
- Miscellaneous imx7-mipi-csis fix

----------------------------------------------------------------
Laurent Pinchart (4):
      dt-bindings: media: nxp,imx7-csi: Add i.MX8MM support
      media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR for >= 10-bit formats
      media: imx: imx7-media-csi: Don't set PIXEL_BIT in CSICR1
      media: imx: imx7-media-csi: Fix buffer return upon stream start failure

Tom Rix (1):
      media: imx: imx7_mipi_csis: convert some switch cases to the default

 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 12 ++++++++----
 drivers/staging/media/imx/imx7-media-csi.c                | 36 ++++++++++++++----------------------
 drivers/staging/media/imx/imx7-mipi-csis.c                |  6 ++----
 3 files changed, 24 insertions(+), 30 deletions(-)

-- 
Regards,

Laurent Pinchart
