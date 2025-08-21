Return-Path: <linux-media+bounces-40551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9914AB2F498
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DFB01CE170C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663BD2D97B1;
	Thu, 21 Aug 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5BxnAeM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0462D47E6;
	Thu, 21 Aug 2025 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769915; cv=none; b=uKU2QQbWQ0pX5NilLlGj8NQdafmaoZ1aflioQ+QU2z8KeLolU8/gM0MivrITFRdKBpZsQ8EADqSWrmD9RX+cZ8gGntYu6etonvsjdO4NeXGD0KMZqJ96Wk/8wFkjJ/tu48XZpGtFpqB1XfJjNhQ+xYUMZEu45jBfUHKXkg7GQic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769915; c=relaxed/simple;
	bh=4gcGUn4TyB1USpd6ffD+3JH+/nTU0Kh8bf8lUuUuy7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ghug3STBBk/zyUwuzBJxF7EgcHoTrTpAVfPIXDvHGFmJtGxHpVSNoiP55ox6NRuIic+y1GeCmF8Hf0ZD0HnTl8ScUeJ/HVk1CjdWkBCXn26rsCC5QNbECk+c84I7hpMAZzId5nUXcmRH41o8Vb3Pobf5G/Ii3bVd3nYkT7OVgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5BxnAeM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755769914; x=1787305914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4gcGUn4TyB1USpd6ffD+3JH+/nTU0Kh8bf8lUuUuy7Q=;
  b=i5BxnAeMuxuG3n/Pv0TetDrl7Oo3VExRJlDdd+6wWPkqUQfvULRLuCO+
   BEIwXHQLZVaBenDUkA/afyypr7ilhNttJcTGSAhO+ySMDt8Y1Q00c3ev0
   dT1ZFyXbfpGxS4N2Q/RjVouhYw0UE1tQ0sYX+2S8esKdWn6FZJ3uyT0ZJ
   612uqp7J6Tg6HJPOrQVXchvpkMGkFxOdvBkQSw5KW7wAk8F2Nj6cvOILw
   +Rsl+DeEmraBr7AHe8SOi4iDBZBKxP48vZltIObq5xooVf4MChAcIOC2B
   DdeTT4aaAnZJPTVRodCEu10nr5T3KHDxrjaVjTh02HqberDgU/Vc9+CLx
   Q==;
X-CSE-ConnectionGUID: 05nlymn7RP+eNe++f3FPbw==
X-CSE-MsgGUID: w8dZrBXJQIWExu+4/P3RSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="45626159"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="45626159"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:51:52 -0700
X-CSE-ConnectionGUID: AC22QJdSRr23Jaoaf2/wmw==
X-CSE-MsgGUID: 6iFngBjxQj+3X42Nxi6DOw==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:51:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BB2C711F738;
	Thu, 21 Aug 2025 12:51:47 +0300 (EEST)
Date: Thu, 21 Aug 2025 12:51:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH v5 9/9] media: uvcvideo: eUSB2 double isochronous
 bandwidth support
Message-ID: <aKbsM5TVUGT53J8N@kekkonen.localdomain>
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
 <20250820143824.551777-10-sakari.ailus@linux.intel.com>
 <CANiDSCuBNsRq45J6RZibD=fWxWuUKBWJfW=7addXK8g7J8R8mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCuBNsRq45J6RZibD=fWxWuUKBWJfW=7addXK8g7J8R8mw@mail.gmail.com>

Hi Ricardo,

On Wed, Aug 20, 2025 at 05:21:50PM +0200, Ricardo Ribalda wrote:
> Hi Sakari
> 
> I believe you have missed my previous email.
> 
> https://lore.kernel.org/linux-media/CANiDSCsocBBQRPRFAbAovkzauThgN8Qd1u8kjJ_af-83Nd4wvw@mail.gmail.com/
> 
> re-posting here
> 
> On Wed, 20 Aug 2025 at 16:39, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > From: Tao Q Tao <tao.q.tao@intel.com>
> >
> > Use usb_endpoint_max_esit_payload() from the USB framework to find the
> > maximum bytes per interval for the endpoint. Consequently this adds eUSB2
> > isochronous mode and SuperSpeedPlus Isochronous Endpoint Companion support
> > where larger payloads within a service interval are possible.
> >
> >
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you.

> 
> Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
> > Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> > Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> nit: I believe the last tag should be: Signed-off-by:

Laurent has reviewed the patch, please see
<20250807131555.GB13647@pendragon.ideasonboard.com>.

-- 
Regards,

Sakari Ailus

