Return-Path: <linux-media+bounces-2296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6A7810C08
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 09:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48E02B20AF9
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 08:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8761CFA9;
	Wed, 13 Dec 2023 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gn6y5NlY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38540B2
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 00:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702455002; x=1733991002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/U/eO2GVAtipfVLiduoqQNTHARrDtkrcPByrLEbvsac=;
  b=gn6y5NlYhCV47owFpElpX42eSGfFZX5S1ujTm8MsDjoXhnqcbYIPBaYZ
   3Y8feZtC5C7OwxYkczz5lsGW4OlU+eu8MC0Jz0RXpW02vIVv/eP40ctWR
   eAcp1ulT0Em9IxDCs/CDFDurY9MULGWDf+KzhHOIx7Q4oY/a7l2P+Fmzm
   jBPYEdqS2raDMF3STHwXpoAJ947cIJVYFLjXqsWtycdoKluxihzc0vn9l
   LC1mWj1ZQK9ZxWuO/sJY0m6qNRIC4xHppsTNQzcT8wC8P9WpEx7ZrLipI
   mri2PbTumVst4LwYzUDwZYXYcyu2RDT+eofuiYIrEZAUIjpElZ9Ae1tyM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1787433"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1787433"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 00:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="777405558"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="777405558"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 00:10:00 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1C86511F7E4;
	Wed, 13 Dec 2023 10:03:09 +0200 (EET)
Date: Wed, 13 Dec 2023 08:03:09 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <ZXllPYzx7rMzeFL6@kekkonen.localdomain>
References: <20231212191117.133868-1-jacopo.mondi@ideasonboard.com>
 <20231212191117.133868-3-jacopo.mondi@ideasonboard.com>
 <ZXjDTyitj5APSv6s@kekkonen.localdomain>
 <xijjtvgwzpuxt7sd5wb4i6u3y774vrpoyaq7vkkz6a2smjbdfa@lp4qpalzlk6l>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xijjtvgwzpuxt7sd5wb4i6u3y774vrpoyaq7vkkz6a2smjbdfa@lp4qpalzlk6l>

Hi Jacopo,

On Wed, Dec 13, 2023 at 09:01:34AM +0100, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Tue, Dec 12, 2023 at 08:32:15PM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Tue, Dec 12, 2023 at 08:11:17PM +0100, Jacopo Mondi wrote:
> > > +static const struct v4l2_subdev_pad_ops ov64a40_pad_ops = {
> > > +	.init_cfg = ov64a40_init_cfg,
> >
> > The init_cfg pad op is gone --- it has been replaced by init_state internal
> > op.
> >
> 
> This patch is based on linux media master branch. I'll rebase on the
> staging branch then.

Please use the media stage tree as a basis for patches. The media tree
master is typically seldom updated.

-- 
Sakari Ailus

