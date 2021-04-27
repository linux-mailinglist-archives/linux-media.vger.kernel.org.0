Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50BC36C5D0
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbhD0MKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235410AbhD0MKd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:10:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A607C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:09:50 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMX9-0006sa-MF; Tue, 27 Apr 2021 14:09:43 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMX9-0001ZV-1P; Tue, 27 Apr 2021 14:09:43 +0200
Date:   Tue, 27 Apr 2021 14:09:43 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/6] Add new bayer ir formats
Message-ID: <20210427120943.owuah4pbzfjtk3za@pengutronix.de>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427120701.21809-1-m.felsch@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:08:24 up 146 days,  2:14, 47 users,  load average: 0.06, 0.04,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21-04-27 14:06, Marco Felsch wrote:
> Hi all,
> 
> this adds the inital support for a new sensor format called RGB-IR
> found on sensors from OnSemi [1]. This is a new custom bayer format with
> interleaved ir pixels. For more information see the documentation
> commit.
> 
> [1] https://www.onsemi.com/products/sensors/image-sensors-processors/image-sensors/ar0237sr

Sorry, I forget to say that I know that checkpatch.pl complains but I
kept my changes to be more readable.

Regards,
  Marco
