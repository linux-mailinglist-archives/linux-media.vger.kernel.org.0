Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833C941E971
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 11:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbhJAJPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 05:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhJAJPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 05:15:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC436C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 02:14:08 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mWEcJ-0006XX-6d; Fri, 01 Oct 2021 11:14:07 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mWEcI-000661-Bq; Fri, 01 Oct 2021 11:14:06 +0200
Date:   Fri, 1 Oct 2021 11:14:06 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de
Subject: Re: [PATCH 0/6] media: allegro: Add support for the Encoder Buffer
Message-ID: <20211001091406.GF28226@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, kernel@pengutronix.de
References: <20210908130315.3295253-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210908130315.3295253-1-m.tretter@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:13:02 up 225 days, 12:36, 133 users,  load average: 0.19, 0.19,
 0.21
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 08 Sep 2021 15:03:09 +0200, Michael Tretter wrote:
> This series adds support for the Encoder Buffer to the Allegro DVT driver.

Gentle Ping.

Michael

> 
> The Encoder Buffer (the reference manual sometime also uses the terms L2 cache
> or Prefetch Buffer) acts as a cache for the reference frames. The Encoder
> Buffer reduces the read accesses of the encoder on its AXI ports. The size of
> the buffer is configurable with Vivado before the FPGA bitstream is
> synthesized, but not during runtime. The driver is responsible for configuring
> the firmware to the configured size of the Encoder Buffer.
> 
> Patch 1 adds a check to make sure that the response mailbox is initialized
> before the interrupt handler tries to handle mails from this mailbox. This
> should never happen, but having the check does not hurt and should make the
> checkers happy.
> 
> Patch 2 fixes the removal of the module when the firmware initialization has
> failed.
> 
> Patch 3 and 4 integrate the Allegro DVT driver with the Xilinx VCU driver,
> which handles the glue code between the encoder and the FPGA.
> 
> Patch 5 and 6 add support for the actual Encoder Buffer and add a control to
> explicitly disable it per encoding context, because the Encoder Buffer might
> have a negativ impact on the encoding quality.
> 
> This series is independent of my other series regarding the NAL unit fixes.
> 
> Michael
> 
> Michael Tretter (6):
>   media: allegro: ignore interrupt if mailbox is not initialized
>   media: allegro: fix module removal if initialization failed
>   media: allegro: lookup VCU settings
>   media: allegro: add pm_runtime support
>   media: allegro: add encoder buffer support
>   media: allegro: add control to disable encoder buffer
> 
>  .../media/platform/allegro-dvt/allegro-core.c | 229 +++++++++++++++++-
>  .../media/platform/allegro-dvt/allegro-mail.c |  19 +-
>  .../media/platform/allegro-dvt/allegro-mail.h |  10 +-
>  include/uapi/linux/v4l2-controls.h            |   5 +
>  4 files changed, 235 insertions(+), 28 deletions(-)
> 
> -- 
> 2.30.2
> 
> 
