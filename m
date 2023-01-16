Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47F0666BFC2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 14:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjAPN2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 08:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjAPN2D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 08:28:03 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15226166DE
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673875679; x=1705411679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CFbMZPT/w7sB5FOYD3xpRK5Z1CfgHSWWV4x0XBHNvxM=;
  b=mAA7OOAwAG2cPrGXA40VxOlkAKoe8H43KXFdJuq+Swnv5H8+hpeoGZhU
   iE07qejC2VWGguZ5c95u3uFcLIMzyMdwa0n2u7MwthlxxnCn1CZgKmO64
   tw92xmuz3ENfoUFSXzsmJvvNMbREqDIxl2tTtYNIfBmaXrBZG/1YphcSV
   EQtmHhP8rbiy0HsC7vYBH02xEEeUfYWTDk7zp/U1/Qr5DG0nHzfZKRBoz
   +kC+nRQz4pP8X/v1acCd6wYf3Oe0jFr8AtBI1MnM8dhDA+fU+diIa8Y/Q
   C3TFArKzgULe5/WTPu1dfMjMH78yF/XzkzJQw+AT+Z/glFZ78OJ0Q0wDI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="325727389"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="325727389"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 05:27:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="766887429"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="766887429"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 05:27:56 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 445D820165;
        Mon, 16 Jan 2023 15:27:54 +0200 (EET)
Date:   Mon, 16 Jan 2023 13:27:54 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Message-ID: <Y8VQ2nGjy39z+RET@paasikivi.fi.intel.com>
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <20230113112456.GA9093@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113112456.GA9093@pengutronix.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Fri, Jan 13, 2023 at 12:24:56PM +0100, Philipp Zabel wrote:
> Hi,
> 
> On Wed, Aug 10, 2022 at 12:48:48PM +0200, Philipp Zabel wrote:
> > Asynchronous subdevice probing on imx-media with imx6-mipi-csi2 is
> > broken since commit 1f391df44607 ("media: v4l2-async: Use endpoints in
> > __v4l2_async_nf_add_fwnode_remote()").
> > 
> > This is a side effect of imx6-mipi-csi2 having a single subdevice with
> > four separate source ports connected to different subdevices. Before,
> > the imx-media-csi and video-mux devices registered async sub-devices
> > via device fwnode that matched the imx6-mipi-csi2 device on their
> > respective notifiers. This caused the first asd to be put on the
> > notifier waiting list, and the other three to return -EEXIST and be
> > ignored.
> > 
> > With async subdev registration via endpoint fwnode, all four asds are
> > distinct and three of them keep dangling on their notifiers after the
> > first one is bound.
> > 
> > This patch modifies __v4l2_async_nf_has_async_subdev() to consider
> > asds matching different fwnode endpoints of the same sub-device equal
> > if the latter is already bound and matches via device fwnode. Further,
> > v4l2_async_register_subdev() is modified to remove dangling duplicate
> > asds that were registered before the sub-device was available to check
> > its fwnode.
> > 
> > Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Any comments on this? The issue persists on v6.2-rc3.

My apologies --- this had gotten buried in my inbox. It happens
occasionally. I'll try to review this tomorrow.

-- 
Sakari Ailus
