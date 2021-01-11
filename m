Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563672F0E54
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 09:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbhAKIkf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 Jan 2021 03:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbhAKIkf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 03:40:35 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3D6C061786
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 00:40:20 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kyskM-000605-UZ; Mon, 11 Jan 2021 09:40:18 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kyskL-0005xa-QF; Mon, 11 Jan 2021 09:40:17 +0100
Message-ID: <3f44d29c3779b6347a43f181806e4c220c3d7110.camel@pengutronix.de>
Subject: Re: [PATCH 20/75] media: imx: capture: Rename ioctl operations with
 legacy prefix
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Mon, 11 Jan 2021 09:40:17 +0100
In-Reply-To: <X/kCWdynMK8w4sV+@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-21-laurent.pinchart@ideasonboard.com>
         <e47bf3ba-6d9a-52cf-f232-ce4b02a46e2e@gmail.com>
         <fbf3aaa4454f2ada8f7b8f5e8b990a4e66577427.camel@pengutronix.de>
         <X/kCWdynMK8w4sV+@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, 2021-01-09 at 03:09 +0200, Laurent Pinchart wrote:
> Could you elaborate a little bit here ? We don't have an API to
> explicitly enumerate supported interlacing types. This can be done by
> calling VIDIOC_TRY_FMT with all field types and see which ones are
> supported. You can still do so with the MC-based API, the video node
> will return from VIDIOC_TRY_FMT the interlacing types intrinsicly
> supported by the video node, and you can query from the source subdev
> the interlacing types supported by the source. Userspace can then
> combine the information to find what is supported.

The i.MX6 CSI always captures whole frames, so SEQ_TB or SEQ_BT at its
source pad.
The IDMAC supports "interlaced scan" of SEQ_TB into INTERLACED_TB and
SEQ_BT into INTERLACED_BT when writing to memory. It can't change the
field timing order (BT <-> TB) as that was already decided at the CSI.

So for capture of interlaced material, the video device currently allows
either SEQ_TB and INTERLACED_TB or SEQ_BT and INTERLACED_BT, depending
on which field order is configured at the CSI source pad.

See d969291d8479 ("media: imx: Fix field negotiation") for details.

regards
Philipp
