Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412C3373E22
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 17:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhEEPKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 11:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhEEPKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 11:10:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB9FC06174A
        for <linux-media@vger.kernel.org>; Wed,  5 May 2021 08:09:31 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1leJ9M-0008BQ-MJ; Wed, 05 May 2021 17:09:20 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1leJ9J-0004sf-1A; Wed, 05 May 2021 17:09:17 +0200
Date:   Wed, 5 May 2021 17:09:17 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, jacopo+renesas@jmondi.org,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, nicolas.dufresne@collabora.com,
        dafna.hirschfeld@collabora.com
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: Undefined MC-centric behaviour
Message-ID: <20210505150917.z4le5unajb45jbx2@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:56:51 up 154 days,  5:03, 49 users,  load average: 0.00, 0.02,
 0.03
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

first of all hopefully I got most of you within To: or Cc:.

During making the iMX6 IPU driver MC-cenric compatible without breaking
backward compatibility we noticed that the API/API-Doc don't mention the
behviour for:
 - vidioc_enum_framesizes()
 - vidioc_enum_frameintervals()

I our opinion:
 - vidioc_enum_framesizes(): should only limit to the DMA restrictions
 - vidioc_enum_frameintervals(): should return nothing since it is up to
   user space to select the correct one from the last downstream
   v4l2-subdev element (_not_ the sensor).

Now the discussion can start :)

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
