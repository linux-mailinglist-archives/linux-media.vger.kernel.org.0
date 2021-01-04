Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A852E9030
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 06:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbhADFkp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 00:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbhADFkp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 00:40:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6282C061794
        for <linux-media@vger.kernel.org>; Sun,  3 Jan 2021 21:40:04 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1B702E0;
        Mon,  4 Jan 2021 06:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609738800;
        bh=fgh+3gcnqoGC2E73lTAwnUO0NizWIW5iNF7GaWWP5Ww=;
        h=From:To:Cc:Subject:Date:From;
        b=MXjQWGiP8xW3UYOm2IPDC8/qcG0/2n0zWEqaY/sLnqWeGbZxUlkurFBogvsGZ9eKR
         EW6pEuif4T098zPregyGpnoJR7n8cMSS7yq0IOoHe8UuV5UwnGylh6MECtc+20xYTp
         gr3iwyxN+JQ4jjPqWduPV7S64jq7OEmZfByfp1pA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH 0/2] media: Driver for OV1063x camera sensor
Date:   Mon,  4 Jan 2021 07:39:43 +0200
Message-Id: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a driver for the OV10633 and OV10635 camera
sensors, along with corresponding DT bindings.

As detailed in the commit message of patch 2/2, the driver originates
from a submission from Phil Edworthy 7 and a half years ago. It went
through the TI kernel tree, and is now a candidate for mainline again.

Large parts of the driver have been rewritten compared to the version
present in the TI kernel, to bring the code to the latest kernel APIs,
fix issues and apply various cleanups. There are known issues, listed in
TODO comments in the driver, and some of them will require access to
more documentation in order to develop fixes (I only have a leaked
OV10633 datasheet).

I'd appreciate if reviewers could have a look at the TODO comment and
let me know which issues are blocking and which could be addressed
later. The code is functional, and has been tested successfully with
multiple resolutions, with a TI AM572x EVM and the TI VIP capture driver
(which I will submit in the near future in a separate series).

One potential blocker is the split of the driver in multiple subdevs as
that would affect the userspace API. I will work on this, but I maye be
limited by lack of information in the documentation I have access to, as
it's not always clear what the exact hardware features are.

Still, a best effort split is likely possible. On this topic, the sensor
seems to support vertical skipping in the pixel array by a factor of 2
or 4 (this isn't entirely clear), and horizontal and vertical
sub-sampling (using either summing, averaging or skipping) in the ISP,
the latter seemingly in the YUV domain (I kid you not...). There's also
an analog crop rectangle that can crop any portion of the image
vertically but is limited to a centered region of 1312, 768 or 656
pixels horizontally, and a digital crop rectangle that seems more
standard, applied (if I'm not mistaken) after pixel array vertical
skipping and before ISP sub-sampling. Advices on how to meaningfully
expose these features through the subdev API would be welcome (cursing
hardware designers is not mandatory).

Benoit Parrot (1):
  dt-bindings: media: Add bindings for OmniVision OV1063x sensors

Laurent Pinchart (1):
  media: i2c: Add OV1063x sensor driver

 .../bindings/media/i2c/ov1063x.yaml           |   97 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov1063x.c                   | 1692 +++++++++++++++++
 drivers/media/i2c/ov1063x_regs.h              |  626 ++++++
 6 files changed, 2437 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
 create mode 100644 drivers/media/i2c/ov1063x.c
 create mode 100644 drivers/media/i2c/ov1063x_regs.h

-- 
Regards,

Laurent Pinchart

