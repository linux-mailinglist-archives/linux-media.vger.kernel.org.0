Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25923DBAF8
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 16:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239030AbhG3Oq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 10:46:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:43060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231272AbhG3Oq0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 10:46:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E7AA60C40;
        Fri, 30 Jul 2021 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627656382;
        bh=azHnQCqNwW1SEe7zHt6FF4bGf7K2cQRhBm466xA3O8g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tVHRSyR6vQG89uMQ1SXGd8Dep0Yxq1X88wy1Tkl66GTWDeBc/J1b/qOzXU9r4eEsO
         oXtkdekEmj34kGsWCNfayL9D7q96KdwwWGhV7T+jyoZsOeGksbd2WAm95dLfLV/lZU
         lrkTU/aDO6HnQkg7tizEnWoGXLk6s3+lpVZdZeoVutCph/PydsmYHmUkpCGTeBXuYz
         PA9csQpb9J2SfWWUJZgY5c4FNNGVoqylOWGLmpkyTfvBkk/JgEDQPzuVnjUjUVs+Fy
         fuesfgg/uzv66ICYKsmeyusYcR0DH5QK942Iibz/+/BWyWDdU8E9dz9K3tOf5hRty9
         ggsApPBUxqNaA==
Date:   Fri, 30 Jul 2021 16:46:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL v2 for 5.15] Camera sensor, async and documentation
 patches
Message-ID: <20210730164611.4346612e@coco.lan>
In-Reply-To: <20210727091551.GF3@valkosipuli.retiisi.eu>
References: <20210727091551.GF3@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 27 Jul 2021 12:15:51 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> Here's a large set of patches for 5.15.
> 
> Notable changes include:
> 
> - Drivers for imx335, imx412 and ov9282 sensors
> - Fixes for digital gain configuration in ov2740 and ov9734 drivers
> - Fix ov8856 driver for ACPI
> - Shorten V4L2 async notifier functions for better fitting under 80 chars
> - Documentation improvements (camera sensors, CSI-2)
> - V4L2 LED flash fixes
> - Manual CSI-2 LP-11/LP-111 mode support with runtime PM, CCS driver
>   support
> - Correct mbus code for YUV output in ov5640 driver with CSI-2
> - Switch to DEVICE_ATTR_RO and DEVICE_ATTR_RW in MC and a few drivers
> - Omap3isp error path bugfix
> 
> since v1:
> 
> - Rebased on media-stage tree
> - Include Niklas's rcar-vin patches
> - Added imx258 fixes by Umang Jain and Laurent Pinchart
> 
> Please pull.

Partially applied.

The RCar patches were adding new warnings. So, I ended not applying
them:

0008-0043-media-dt-bindings-media-renesas-csi2-Add-r8a779a0-su.patch
0009-0043-rcar-csi2-Add-r8a779a0-support.patch
0010-0043-rcar-vin-Refactor-controls-creation-for-video-device.patch
0011-0043-rcar-vin-Fix-error-paths-for-rvin_mc_init.patch
0012-0043-rcar-vin-Improve-async-notifier-cleanup-paths.patch
0013-0043-rcar-vin-Improve-reuse-of-parallel-notifier.patch
0014-0043-rcar-vin-Rename-array-storing-subdevice-information.patch
0015-0043-rcar-vin-Move-group-async-notifier.patch
0016-0043-rcar-vin-Extend-group-notifier-DT-parser-to-work-wit.patch
0017-0043-rcar-vin-Create-a-callback-to-setup-media-links.patch
0018-0043-rcar-vin-Specify-media-device-ops-at-group-creation-.patch
0019-0043-rcar-vin-Move-and-rename-CSI-2-link-notifications.patch
0020-0043-rcar-vin-Add-r8a779a0-support.patch

Maybe due to that, those patches also didn't apply:
0029-0043-v4l-async-Rename-async-nf-functions-clean-up-long-li.patch
0030-0043-media-rcar-vin-Remove-explicit-device-availability-c.patch
0031-0043-media-v4l2-fwnode-Simplify-v4l2_async_nf_parse_fwnod.patch

Thanks,
Mauro
