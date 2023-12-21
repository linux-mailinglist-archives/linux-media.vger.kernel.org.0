Return-Path: <linux-media+bounces-2889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E589E81BE3D
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 19:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 246781C24A9A
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 18:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B5A8C1A;
	Thu, 21 Dec 2023 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPYRqe7T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67B4848C
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703183453; x=1734719453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sLvG2Xs9CRIEzi8sZwOtj0o+4Ica086NCzGvL8uXqHY=;
  b=bPYRqe7ThAblNcmdVvM6nYm6dbpqqF6kOxH3x9d803tnBmMqSD8IspvL
   jD+3pOUDYtIPfFay12NWrjK/A2InMl/pLmO3KLElw9Kiw0JnK+WZy8V7l
   wOeRjaGP7TF50Fg0f0ykhqDVh34j0vk/7Gwm9ipEPPCVd0POtxrEcwX3D
   mVmb4DkPMckAHSf4DjhKkwjftSwGuu/8ckpPaljanougo0UR4id9/73Lt
   LPs9bDvoAqq7GgQnEGcG5cYw3lwCAPDpsbsrDTsCJJ7pQJoAvs+KDQuIe
   70nGKdHCRCyGiGmg7SH+qBWnZ4Pxk2jCIuSa13gj0M4/aSMHfkKxKymro
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="482200536"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="482200536"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 10:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="780285972"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="780285972"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 10:30:51 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4EEAE11FAAC;
	Thu, 21 Dec 2023 20:30:49 +0200 (EET)
Date: Thu, 21 Dec 2023 18:30:49 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/3] media: ipu3-cio2: Further clean up async subdev link
 creation
Message-ID: <ZYSEWcr2fGyCdl4Z@kekkonen.localdomain>
References: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
 <20231221135822.152448-2-sakari.ailus@linux.intel.com>
 <20231221165723.GB10901@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221165723.GB10901@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Dec 21, 2023 at 06:57:23PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Dec 21, 2023 at 03:58:20PM +0200, Sakari Ailus wrote:
> > Use v4l2_create_fwnode_links_to_pad() to create links from async
> > sub-devices to the CSI-2 receiver subdevs.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
> 
> This doesn't look right, I don't think this patch could have been
> meaningfully tested on a Renesas platform :-) With the line dropped,

Oops. I intended to remove this but forgot... The patch used to be in a
branch that hosted a patchset tested by Prabhakar and adding the Tested-by:
mistakenly was applied to this patch by a script.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Regards,

Sakari Ailus

