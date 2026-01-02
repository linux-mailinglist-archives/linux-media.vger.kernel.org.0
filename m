Return-Path: <linux-media+bounces-49854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27187CEF591
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 22:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83F813001BF9
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 21:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC35E196C7C;
	Fri,  2 Jan 2026 21:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/ERfZp/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD52D6E52;
	Fri,  2 Jan 2026 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767388999; cv=none; b=QZvqY74Z9WtlaBNBqZktDbhOlg/i5y6phZyaiPxR4TWycrFiKoX1fb2YD34iGbydwCm3bMTSBwlcM0n0h6nmo5HxzhEpgOgI7aNmXIobMrD1Jh1oAR9WbZa79LTwfLHT1sX4VBqiFhjax03bcGu9M7eYukAcq9P4DOmfKwA/5s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767388999; c=relaxed/simple;
	bh=WrdhhwEThTZ3bAHzKdIZNwrlr9f65T2D49973kC+EQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnJBew+iSGBfzDBNFswNEJxaC6xWJ46uJf5TXbip0JOLasYOXRgv3YV5UieKCLBp7k/WFftzSJ1whCp4eBRGYceZkJFO9Enk14tlxCTqdHc5io70wDurvVUksxgedd9YYoN9zKXQPFdG6K7fNXy2bYvDaeG1E6Nc/Vj0jGImlaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/ERfZp/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767388998; x=1798924998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WrdhhwEThTZ3bAHzKdIZNwrlr9f65T2D49973kC+EQk=;
  b=b/ERfZp/IWsjfk4bZgR+q2PqxzfkGdyNnFccy4HIqkVpw10aaerXmqPp
   kFWXrzdd9Hrp0sp6ZRsSddq3/K1T3EJcJFAhDtYy/LXStpZvEUvjPgrte
   lAfIXYkjYGBG+f4nubtWleDZU+qq+RIaXt4smQarAvNtRzyBYzR6NfZzX
   LtT9G2ha+P6Jlcikfvyl9cK8BOUoyJYL/rEoCxAMfw0sX1E2fmSKAUsxE
   72zfPtA3x7YRlCsmDktMz9w9n6ujK88cMnFO/QVYyT5uHL0W1583sDkQD
   8d7cwWdaE5E1Na2ErnsIk4puMRs6ctH3HXUMja9FYjOY9VS+6cGK/eP6f
   g==;
X-CSE-ConnectionGUID: KVxbHVATSuqXCi7kdOuIcg==
X-CSE-MsgGUID: c4e+IQEgTverhktU80LV2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68783851"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68783851"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 13:23:17 -0800
X-CSE-ConnectionGUID: B1XtvhIDT36rIblJp6DoSQ==
X-CSE-MsgGUID: NGcD83snQ2a4a4LxfOCuZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202847362"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 13:23:12 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6A35811F83C;
	Fri, 02 Jan 2026 23:23:23 +0200 (EET)
Date: Fri, 2 Jan 2026 23:23:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] media: i2c: add os05b10 image sensor driver
Message-ID: <aVg3S5xnTpXCBUyf@kekkonen.localdomain>
References: <20251231070645.16434-1-himanshu.bhavani@siliconsignals.io>
 <20251231070645.16434-3-himanshu.bhavani@siliconsignals.io>
 <8838a2f3-4eec-42ee-88ee-55a71f789037@linaro.org>
 <PN0P287MB2019969BACCD6EF1325BE3069ABAA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
 <aVbTiM35Z_64mwFA@kekkonen.localdomain>
 <PN0P287MB2019BC24EA2955911FA4AC6F9ABBA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN0P287MB2019BC24EA2955911FA4AC6F9ABBA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>

Hi Himanshu,

On Fri, Jan 02, 2026 at 06:10:09AM +0000, Himanshu Bhavani wrote:
> Hi Sakari,
> >
> >On Thu, Jan 01, 2026 at 06:19:02AM +0000, Himanshu Bhavani wrote:
> >> >> +#define OS05B10_PIXEL_RATE           (480 * HZ_PER_MHZ)
> >> >
> >> >Here pixel rate should not be hardcoded, it'd be computed in runtime
> >> >as 600MHz * 2 * 4 lanes / 10 bpp = 480MHz.
> >> >
> >> >The sensor may be wired over 2 lanes or (presumably) it can stream 8 bpp data.
> >>
> >> We are not supporting 2 lanes right now, driver supports only for 4 lanes and
> >> 10 bpp data. So technically OS05B10_PIXEL_RATE will never change.
> >> For reference I will add OS05B10_PIXEL_RATE calculation in comments.
> >> I would prefer the hardcoded at the moment. Other than this comment
> >> I will resolve and send new version.
> >
> >The pixel rate on the pixel array may be disconnected from the link
> >frequency (and throughput) -- it may be more (with e.g. binning) or less,
> >depending on the sensor of course. Calculating it, if possible, is always
> >better than using a fixed value; experience has shown these are often
> >simply incorrect and sometimes not updated when other changes are made (and
> >same goes for the link frequency).
> 
> Okay, I just want to know if this is non-blocking comment and we can go ahead
> with current version of driver.
> 
> Meanwhile my colleague Tarang is working on some features and he is planning
> to send a series on top of this driver. If he takes up this comment in that
> series will it be okay with you?

Isn't calculating the frequency a fairly trivial thing to do? Why not to do
it now?

> 
> And also I have already sent next revision v8.
> Please let me know.
> 

-- 
Regards,

Sakari Ailus

