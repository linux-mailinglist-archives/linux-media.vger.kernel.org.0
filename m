Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA752ECE36
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbhAGKxQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 7 Jan 2021 05:53:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAGKxQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 05:53:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F198C0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 02:52:35 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kxSuA-0002YG-AH; Thu, 07 Jan 2021 11:52:34 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kxSu9-0004Kn-Df; Thu, 07 Jan 2021 11:52:33 +0100
Message-ID: <fbf3aaa4454f2ada8f7b8f5e8b990a4e66577427.camel@pengutronix.de>
Subject: Re: [PATCH 20/75] media: imx: capture: Rename ioctl operations with
 legacy prefix
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Thu, 07 Jan 2021 11:52:33 +0100
In-Reply-To: <e47bf3ba-6d9a-52cf-f232-ce4b02a46e2e@gmail.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-21-laurent.pinchart@ideasonboard.com>
         <e47bf3ba-6d9a-52cf-f232-ce4b02a46e2e@gmail.com>
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

Hi Steve, Laurent,

On Wed, 2021-01-06 at 09:51 -0800, Steve Longerbeam wrote:
> Hi Laurent,
> 
> I guess I have fallen behind the times with v4l2, but I wasn't aware 
> that the /dev/video nodes and VIDIOC_* APIs are now considered legacy!

I don't think Laurent considers the video node legacy, just the fact
that the current implementation looks at the subdev source pad's active
format in ENUM_FRAMESIZES and ENUM_/G/S/TRY_FMT.

I see the behavior of VIDIOC_ENUM_FMT was extended/defined for MC-
centric devices last year, to allow enumerating all pixel formats or
filter pixel formats for a given mbus format:

e5b6b07a1b45 ("media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices")
cfe9e707c564 ("media: open.rst: document mc-centric and video-node-centric")

> Steve
> 
> On 1/5/21 7:27 AM, Laurent Pinchart wrote:
> > The i.MX media drivers implement a legacy video node API, where the
> > format of the video node is influenced by the active format of the
> > connected subdev (both for enumeration and for the get, set and try
> > format ioctls), and where controls exposed by the subdevs in the
> > pipeline are inherited by the video node.

But I don't quite understand why G/S/TRY_FMT should not respect the
connected subdev source pad's active format. Should MC-centric devices
allow to set non-working configurations and only error out on stream
start? Is this documented?

The current "legacy" vb2_ops check the subdev in ENUM_FRAMESIZES and
ENUM_FRAMEINTERVALS, and in TRY_FMT/S_FMT to determine format and
possible interlacing options. If the MC-centric ops just drop that,
there is no way to determine which interlacing combinations are actually
supported.

regards
Philipp
