Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFF65EBFD4
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2019 09:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfKAIn3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Nov 2019 04:43:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59366 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKAIn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Nov 2019 04:43:29 -0400
Received: from pendragon.ideasonboard.com (unknown [109.190.253.13])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86ADB4FF;
        Fri,  1 Nov 2019 09:43:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572597807;
        bh=4HZer+bgw3Io66HHWMPfysuGO3XmlHQwp25qLz8++vY=;
        h=Date:From:To:Cc:Subject:From;
        b=J9g7NOZn/63xjhe3C5IaqwEZqRMU4nEPZVsEY9cT3J9nAIQfu32dFUg9FS3wfUu7l
         3/BVzkEHTz/5UMJHTadVpOz/43jahpHs7lum2N/JklMy+GS6rxUi13eLm/v851x0K8
         WEtydjcM+/Lhbfwwbz2OYL4rty6ark40r6+X9Ngk=
Date:   Fri, 1 Nov 2019 10:43:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Overlay support in the i.MX7 display
Message-ID: <20191101084318.GA8428@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I'm looking at the available options to support overlays in the display
pipeline of the i.MX7. The LCDIF itself unfortunaltey doesn't support
overlays, the feature being implemented in the PXP. A driver for the PXP
is available but only supports older SoCs whose PXP doesn't support
overlays. This driver is implemented as a V4L2 mem2mem driver, which
makes support of additional input channels impossible.

Here are the options I can envision:

- Extend the existing PXP driver to support multiple channels. This is
  technically feasible, but will require moving away from the V4L2
  mem2mem framework, which would break userspace. I don't think this
  path could lead anywhere.

- Write a new PXP driver for the i.MX7, still using V4L2, but with
  multiple video nodes. This would allow blending multiple layers, but
  would require writing the output to memory, while the PXP has support
  for direct connections to the LCDIF (through small SRAM buffers).
  Performances would thus be suboptimal. The API would also be awkward,
  as using the PXP for display would require usage of V4L2 in
  applications.

- Extend the mxsfb driver with PXP support, and expose the PXP inputs as
  KMS planes. The PXP would only be used when available, and would be
  transparent to applications. This would however prevent using it
  separately from the display (to perform multi-pass alpha blending for
  instance).

What would be the best option going forward ? Would any of you, by any
chance, have already started work in this area ?

-- 
Regards,

Laurent Pinchart
