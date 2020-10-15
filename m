Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D67F28EE51
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 10:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387910AbgJOIPJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 04:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387764AbgJOIPI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 04:15:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF939C061755
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2020 01:15:07 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kSyPi-0003Nx-Ap; Thu, 15 Oct 2020 10:15:06 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kSyPh-0002ZK-I6; Thu, 15 Oct 2020 10:15:05 +0200
Date:   Thu, 15 Oct 2020 10:15:05 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: allegro-dvt: ready to move to mainline?
Message-ID: <20201015081505.GD5487@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <608e0878-aaa2-425f-f453-8bf78d3e8fbe@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <608e0878-aaa2-425f-f453-8bf78d3e8fbe@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:55:10 up 238 days, 15:25, 150 users,  load average: 0.18, 0.18,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, 01 Oct 2020 14:14:29 +0200, Hans Verkuil wrote:
> What is the status of this staging driver? The stateful encoder spec is now finalized,
> so is there anything else that blocks this driver from being moved out of staging?

I don't think that there is anything left. I am going to test the driver
against the latest version of v4l2-compliance and prepare a series to move the
driver out of staging.

The next step is to add HEVC support and I have some WIP patches for that, but
didn't have the time for a proper cleanup, yet.

Michael
