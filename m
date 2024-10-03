Return-Path: <linux-media+bounces-19039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F202298EEF1
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20C271C21827
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E8B186615;
	Thu,  3 Oct 2024 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4pb+mbP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09991176242;
	Thu,  3 Oct 2024 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727957835; cv=none; b=RobcRA2vM4vZGx5K21pBtVQkmkLC2GEPvHczop0lZwXFlbUX4EWkQDChxNslDFmGpAQPnxibLoYZclycJy63d3DFV0yLO4eJoETAp3RJJP91GYIYs3DqpV7XFlPmUfkmnmTPdGVSt1ZUlChg4G0GObPOzk+SQEsMGlvLJSB6sp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727957835; c=relaxed/simple;
	bh=R7pBcT90Zgbb+g9bFEE6La+M3EIlNlWLWdOOepGk+S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBZurily1174c2fMpbiHzN2Ju6V9KNan/ErzLiukwyOp6YbUkaHi3cBQHovDYUD98NNROJr9GlBhKhF4OZTMKJV+HuRIQH2BeRxyXN4pOqScNLwXO7ZwCZlm9/1eZHfiNYGHd9ptsh8LFiPYAdZ7xIL5ZxSR//VQgbdLKNWtb3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4pb+mbP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727957834; x=1759493834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=R7pBcT90Zgbb+g9bFEE6La+M3EIlNlWLWdOOepGk+S8=;
  b=S4pb+mbPG+gt9WfChrqbLLk92R1Clzarr43TvQmPf3u+s0FmvoQ5apv3
   /qeHB2emPr1nv6cjyUM4DzCxINfF1mUglJhl0+pMmZ9BGUW7EKQuOEJ5o
   zl+mA1SRjGFZQjL9OuoZrYROgm8gLtGXM8eidMz+H+1PAnRWpZ1rgoqRf
   la7zBwdH8XcXXL1ZNVc9nJVd7ynhtCP8cmB1XkcMFWwx+R5ATWaisVr1E
   k6XhKNk7dCD9SjxY3cZ+tkutoQbqT4QuaRReTOEG5+yYGglGY5FEtzy8f
   O+VgFQYDcD8BwKr83F5XMLClfPut/mWmXFKHBaMsKdMv8CbqmrtZPTCTH
   A==;
X-CSE-ConnectionGUID: cHdJ/TJfQXixyHHra3O0MA==
X-CSE-MsgGUID: r/JLvBXjRRanv2dQngy64g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38506455"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="38506455"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:17:13 -0700
X-CSE-ConnectionGUID: /5fk+eQkTCi+8fw0TOQDCA==
X-CSE-MsgGUID: aKlkrb7VSzer62snBipiGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="79296375"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:17:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9B27811F83B;
	Thu,  3 Oct 2024 15:17:07 +0300 (EEST)
Date: Thu, 3 Oct 2024 12:17:07 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Jason Chen <jason.z.chen@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <Zv6LQ0q2XVHgUohh@kekkonen.localdomain>
References: <20241002-b4-master-24-11-25-ov08x40-v3-0-483bcdcf8886@linaro.org>
 <20241002-b4-master-24-11-25-ov08x40-v3-2-483bcdcf8886@linaro.org>
 <t4fajppdqagkl7wr2krcucsga4zocz6liar64odk2mnasdyfms@5fp7bfwalson>
 <a86d05c3-5151-4161-8612-58894b1d0203@linaro.org>
 <8554d372-18cb-4351-a5ab-894be09c613b@linaro.org>
 <e8142566-aef5-498e-9d2d-8ac187ce8524@kernel.org>
 <c86f695f-28e2-406d-9f46-c291fca282e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c86f695f-28e2-406d-9f46-c291fca282e4@linaro.org>

Hi Bryan, Krzysztof,

On Thu, Oct 03, 2024 at 12:54:41PM +0100, Bryan O'Donoghue wrote:
> On 03/10/2024 11:17, Krzysztof Kozlowski wrote:
> > On 03/10/2024 10:38, Bryan O'Donoghue wrote:
> > > On 03/10/2024 09:33, Bryan O'Donoghue wrote:
> > > > On 03/10/2024 09:29, Krzysztof Kozlowski wrote:
> > > > > On Wed, Oct 02, 2024 at 02:58:44PM +0100, Bryan O'Donoghue wrote:
> > > > > > +        properties:
> > > > > > +          data-lanes:
> > > > > > +            oneOf:
> > > > > > +              - items:
> > > > > > +                  - const: 1
> > > > > > +                  - const: 2
> > > > > > +              - items:
> > > > > > +                  - const: 1
> > > > > > +                  - const: 2
> > > > > > +                  - const: 3
> > > > > > +                  - const: 4
> > > > > > +
> > > > > > +          link-frequencies: true
> > > > > 
> > > > > Not much changed here and you did not continued discussion about it.
> > > > > 
> > > > > Best regards,
> > > > > Krzysztof
> > > > > 
> > > > 
> > > > Ah my mistake, I didn't read the bit at the bottom of your email
> > > 
> > > I'll do this
> > > 
> > > Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> > > 
> > >             data-lanes:
> > >               description:
> > >                 This property is for lane reordering between the THP7312
> > >                 and the SoC. The sensor supports either two-lane, or
> > >                 four-lane operation.
> > >                 If this property is omitted four-lane operation is
> > >                 assumed. For two-lane operation the property must be
> > >                 set to <1 2>.
> > >               minItems: 2
> > >               maxItems: 4
> > >               items:
> > >                 maximum: 4
> > > 
> > > This captures what I'm after.
> > 
> > I commented on link-frequencies.
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> Ah I understand you.
> 
> You're saying the link-frequencies we have in
> Documentation/devicetree/bindings/media/i2c/* are redundant absent hardware
> specific link frequencies being enumerated.
> 
> I'll either enumerate the acceptable set or drop this.

link-frequencies should remain mandatory in bindings, whether there are
hardware specific limits in bindings or not.
<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>

-- 
Kind regards,

Sakari Ailus

