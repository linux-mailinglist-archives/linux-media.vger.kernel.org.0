Return-Path: <linux-media+bounces-9988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6402A8B05B1
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 11:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182681F266FA
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 09:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5446F158D79;
	Wed, 24 Apr 2024 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7ZmewpY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2395C158DA7
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713950133; cv=none; b=h/hL7zknJMFJikr+cxF00I0CDAnjIZK1bYrOGLmR9V5G0T9uzOlsxBzXXLEEBtz2h8foqmia4LSHjEO/ygCVShce6Z+iOaIQQhxSOSyikBg/tM0YoujUMVw9WnagHseXJR+T5i/Xv2fK4pz54lNEeCBljyohcym90Mb4iHkiM4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713950133; c=relaxed/simple;
	bh=+xBTKaR9tawaCJTUQ7Uz/Wb/+2lu4QI7qgahtc9BEpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OItK108JKTEXq9AL/6PRWQ1Ny2LxwhMP0kbCMf6s/m0h7UtSERYWvwgsHTcrjNjBU5ul4oDwKVAPgdlvqQLs5O72bQHB8NnA8tXpyEAo4ZXykoCF/urKm0HPXr79OI7Gk+cLMci+k5sMvQkoERrPZY297/ZLddwwVIdblc6uOWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7ZmewpY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713950132; x=1745486132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+xBTKaR9tawaCJTUQ7Uz/Wb/+2lu4QI7qgahtc9BEpA=;
  b=g7ZmewpY+msL5cui3+sBXZdF6uhQYU7JOuPl37kJP7rLUWTfVJgZPAMa
   bs9QBSeLdJABjy4RatB+CsjSRbkbJDcCXT5nHbrEDS5AMEa4oaAJfAr6O
   Rwo4W6sK8Vjog6HZV9AH7bvM1qhLO4Dk/6/hZeDh0sZP2UQY+JnC0GF9x
   KdMq7CsBkio0nslJtGihWcjf4FJ/yEwA5UWiSWvohAKueKPxo0srlpoBp
   N6SCNN0XAcFOpNosLtYZt/9p08kJ+uIBmeaEbgVByA9m7gg6wAqlKZ2jD
   WyCskrbL+RJbBWLjiDiU/BxuskC7QXwUSF7xNYXx2CCFBDpo1hdMzJCUQ
   Q==;
X-CSE-ConnectionGUID: 3XX/GbdLRH6h1hzff6vEDg==
X-CSE-MsgGUID: b39nJo9tSnacaTVoqpN9+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20120276"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="20120276"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 02:15:32 -0700
X-CSE-ConnectionGUID: rCvlmHLKQ4KDyMdZiNfiSQ==
X-CSE-MsgGUID: Nuy9iNhzSTOKfGlBmbbCqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="24617438"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 02:15:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 52D7811F855;
	Wed, 24 Apr 2024 12:15:26 +0300 (EEST)
Date: Wed, 24 Apr 2024 09:15:26 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 37/46] media: ov2740: Fix LINK_FREQ and PIXEL_RATE
 control value reporting
Message-ID: <ZijNrom0olDiXdeT@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-38-sakari.ailus@linux.intel.com>
 <20240420094248.GA6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240420094248.GA6414@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Apr 20, 2024 at 12:42:48PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Apr 16, 2024 at 10:33:10PM +0300, Sakari Ailus wrote:
> > The driver dug the supported link frequency up from the V4L2 fwnode
> 
> s/dug/digs/
> 
> > endpoint and used it internally, but failed to report this in the
> 
> s/used/uses/
> s/failed/fails/
> 
> > LINK_FREQ and PIXEL_RATE controls. Fix this.
> > 
> > Fixes: 0677a2d9b735 ("media: ov2740: Add support for 180 MHz link frequency")
> > Cc: stable@vger.kernel.org # for v6.8 and later
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> You're missing the tags given by Hans and Bingbu. As this patch is
> unrelated to the rest of the series, it should be split off and merged
> in v6.10.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks. I think I forgot the patch to this branch as well. It's been merged
already so all is well.

-- 
Regards,

Sakari Ailus

