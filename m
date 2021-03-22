Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5C73447A0
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 15:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhCVOoa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 10:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhCVOn7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 10:43:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FC1C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 07:43:58 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lOLmd-00068i-Pg; Mon, 22 Mar 2021 15:43:55 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lOLmc-0000Lj-Ie; Mon, 22 Mar 2021 15:43:54 +0100
Date:   Mon, 22 Mar 2021 15:43:54 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [REGRESSION] video-mux: Probe error on imx6
Message-ID: <20210322144354.GA31895@pengutronix.de>
References: <CAOMZO5DQq0vSkQuikYXxkKofkukGkwE=CBW10+eDPib2vRSHvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5DQq0vSkQuikYXxkKofkukGkwE=CBW10+eDPib2vRSHvg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:37:34 up 32 days, 18:01, 87 users,  load average: 0.36, 0.53,
 0.49
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Mon, Mar 22, 2021 at 10:09:24AM -0300, Fabio Estevam wrote:
> Hi,
> 
> When running kernel 5.12-rc4 on imx6, video-mux fails to probe like this:
> 
> [    5.675490] video-mux: probe of 20e0000.iomuxc-gpr:ipu1_csi0_mux
> failed with error -107
> [    5.685226] video-mux: probe of 20e0000.iomuxc-gpr:ipu2_csi1_mux
> failed with error -107
> 
> I haven't started investigating this problem yet, but just wanted to
> let you know in case you have any suggestions.

It seems the fwnode parsing got more strict and doesn't ignore the
dangling endpoints that exist in the i.MX6 dtsis on the video-mux input
ports anymore.
I'll send a patch to skip dangling endpoints in the video-mux driver.

regards
Philipp
