Return-Path: <linux-media+bounces-9245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0238A41ED
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 12:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9EEB1F2125C
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 10:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B4C2D7B8;
	Sun, 14 Apr 2024 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIWVCASo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCEB37143
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713091737; cv=none; b=Ma5vkL4yCsR98uLVcGc4zQXmRMbahcKuh2n/Z8Kwal4D7L4HUfDzppTczvqSgPfWGwv85fYbzYFxbgPnjv1JFYqjACD+tfyVHA3elorKCOQfzPvu5Rs1P9in7t6lZ7yTXj6GHaX0XljmGc4whobKZ7G3Y8tE3LAa8l2bEWBaRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713091737; c=relaxed/simple;
	bh=4H1COYkI1aKAP2L6EGd9gtGvjqKFKVsROhb/Asj0deg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jhkt47T956TOKtLIr4PAO1ZVRGnsIb1tl0ydDIybFCoyMQE3DK66qVU5plYa9TWk6h+mFsIHMlCzyrpo3SChUsoaORm6edh1qJJvrRexMThPQoDyxDOE7mdjYsfYoNnMeiQiv5iclB3fjukNRywmBzZLajtjovUfVGzSYxFeCak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIWVCASo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713091735; x=1744627735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4H1COYkI1aKAP2L6EGd9gtGvjqKFKVsROhb/Asj0deg=;
  b=ZIWVCASo8oqA2aNcSyh2SJxswpHjR2RRZHzRiC/VWjUBTG4MQ850A2RK
   HGaiJiLQA48cn3hWwa7xERD1Ywa/Ju8Rs/JEmZjsCPA3/eddIgA+5avZk
   LGG85cmHQ6xyuJ48xo158nCFni0WsE/ub0jBSn6TQp6YXHMrtHBJa6tMc
   4+LxT81J0nwRj7GY0G6xJTlC6MuL6B7OC7ux2lQ/tKzlt6rTvDoyPly+K
   UwOD0Y6YKErSPMTw4jxgI9j7/isiyg/Pg9KAx6xGHY6PhPL1gyetzGjm7
   pr33BCMBR4V7zl0C8KRGBLmmJL23jjUkSzkesNWvAPkyxUFC9jPrpzaO5
   A==;
X-CSE-ConnectionGUID: iWGephp9RBqCKUZTC5CAMQ==
X-CSE-MsgGUID: +kcDyGyvQ0mMGQHDk4DnKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8348087"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="8348087"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 03:48:54 -0700
X-CSE-ConnectionGUID: 4269XUxnR9+ctHhsiHVtDg==
X-CSE-MsgGUID: +WiGWeK5Sg6Ib+Fc58OToQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="52836152"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 03:48:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9CF77120359;
	Sun, 14 Apr 2024 13:48:49 +0300 (EEST)
Date: Sun, 14 Apr 2024 10:48:49 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 23/38] media: uapi: ccs: Add media bus code for MIPI
 CCS embedded data
Message-ID: <Zhu0ke6RA9PYfYZi@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-24-sakari.ailus@linux.intel.com>
 <20240321164914.GD9582@pendragon.ideasonboard.com>
 <Zhenr8ykPs9vlkh6@kekkonen.localdomain>
 <20240412190746.GO31122@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412190746.GO31122@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Apr 12, 2024 at 10:07:46PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Apr 11, 2024 at 09:04:47AM +0000, Sakari Ailus wrote:
> > On Thu, Mar 21, 2024 at 06:49:14PM +0200, Laurent Pinchart wrote:
> > > On Wed, Mar 13, 2024 at 09:25:01AM +0200, Sakari Ailus wrote:
> > > > Add new MIPI CCS embedded data media bus code
> > > > (MEDIA_BUS_FMT_CCS_EMBEDDED).
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../media/v4l/subdev-formats.rst              | 28 +++++++++++++++++++
> > > >  include/uapi/linux/media-bus-format.h         |  3 ++
> > > >  2 files changed, 31 insertions(+)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > index cbd475f7cae9..c8f982411e70 100644
> > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > @@ -8564,3 +8564,31 @@ and finally the bit number in subscript. "X" indicates a padding bit.
> > > >        - X
> > > >        - X
> > > >        - X
> > > > +
> > > > +.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
> > > > +
> > > > +MIPI CCS Embedded Data Formats
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
> > > > +metadata format for sensor embedded data, which is used to store the register
> > > > +configuration used for capturing a given frame. The format is defined in the CCS
> > > > +specification. The media bus code for this format is
> > > > +``MEDIA_BUS_FMT_CCS_EMBEDDED``.
> > > > +
> > > > +The CCS embedded data format definition includes three levels:
> > > > +
> > > > +1. Padding within CSI-2 bus :ref:`Data unit <media-glossary-data-unit>` as
> > > 
> > > s/Data unit/Data Unit/
> > 
> > Yes.
> > 
> > > > +   documented in the MIPI CCS specification.
> > > > +
> > > > +2. The tagged data format as documented in the MIPI CCS specification.
> > > > +
> > > > +3. Register addresses and register documentation as documented in the MIPI CCS
> > > > +   specification.
> > > > +
> > > > +The format definition shall be used only by devices that fulfill all three
> > > > +levels above.
> > > 
> > > Hmmmm... Do we need to mandate level 3 ? There are lots of sensors that
> > > comply with the first two levels but have their own register set. Would
> > > you like a sensor-specific embedded data format for each of them ? If
> > > so, how would we document it without essentially copying the datasheet ?
> > 
> > You could refer to the datasheet if it's publicly available.
> 
> What if it's not ? How would you expect documentation to be organized ?
> Will we then end up adding one media bus code per sensor ?

Probably. The user space needs a way to find out what to expect. If a
sensor produces its own custom metadata format, it needs to be documented.

There's also documentation for OV2740 embedded data in the set.

-- 
Sakari Ailus

