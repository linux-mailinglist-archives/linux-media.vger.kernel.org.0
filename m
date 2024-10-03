Return-Path: <linux-media+bounces-19045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CF98EFA0
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCE1CB254E2
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3E319409C;
	Thu,  3 Oct 2024 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0VIwBz6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719CE1E49B;
	Thu,  3 Oct 2024 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727959604; cv=none; b=XiYUqhyOqGB82qTDyokOCwbgOVmGMLgJKWt0Hg/ZF5Kr8hkF7LSvr99ucB1hZDOtevBmAHlLGJSfL1viTS3bx4v3gwGEJxpJLP3C8ZwQ+eDIfLCJgc7P/KqpaJcqYHvoa1foX/8cSgQTnHgB3cnIjNL4a8xayVysK4VFpvo0Sjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727959604; c=relaxed/simple;
	bh=NCxWNiKkn8DSZyYBLbbrQ2VGNVFQvcujhzzciITiDDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xd0JuraGFV3O3HaDyQ08+1YstfVKbz6VFlNp643eBk9KdIFCkii1Y5/ivgrA8S7vW8LdVg1glI190QkMj3ec0RwVb8cQgDywQyez+CwGplY0OOpH/QwjhS8uSYmnCkKuwOwS0/cqWNFtN2/NbpS4892SMpkleY7V2hiAMyh9e+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0VIwBz6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727959603; x=1759495603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NCxWNiKkn8DSZyYBLbbrQ2VGNVFQvcujhzzciITiDDE=;
  b=B0VIwBz6sEh6FfoQ2WdpMKvqAJ9Nf0vk+aIpowOnNf0/TSdBEf6EAms8
   n0pT/8NdImmtyw9Fk+rOQXfO1jhg1aQG/qIpRBVg3AlTp0RKM1SS2m8L9
   ANj0FF7Y0ShwMUoIsCss43MK8Zx/MqJ3Ll5t0PAVo631Wwf2e9SCVBGfI
   6aiu5evU2z4rGKkPsXgRj7Wm/4iytkzUXpsvbo4mMRi9rRKA2kK+p1CG8
   c++tUC8oI5xcm4ySnOZkg0izGnSicA77jT2zN/sDjn0hrwLap6HIbnR+r
   vYa57tVQMUAMrQo8MEoriAOM+N4qjFtMo18i2zVUCSykZPZg+Csdmx6+0
   A==;
X-CSE-ConnectionGUID: dgB3pKKFQk+S/6MEtBXsHA==
X-CSE-MsgGUID: GeJwseEyRC2ypzK/R1lQJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37708454"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="37708454"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:46:42 -0700
X-CSE-ConnectionGUID: 0nRLWUbDR0+E3eiE/KcZTA==
X-CSE-MsgGUID: 4o4FoOFFR+eMduyORXO1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="97668160"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:46:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7CF5B11F83B;
	Thu,  3 Oct 2024 15:46:37 +0300 (EEST)
Date: Thu, 3 Oct 2024 12:46:37 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jason Chen <jason.z.chen@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <Zv6SLRUKQiZU9qp-@kekkonen.localdomain>
References: <20241002-b4-master-24-11-25-ov08x40-v3-0-483bcdcf8886@linaro.org>
 <20241002-b4-master-24-11-25-ov08x40-v3-2-483bcdcf8886@linaro.org>
 <t4fajppdqagkl7wr2krcucsga4zocz6liar64odk2mnasdyfms@5fp7bfwalson>
 <a86d05c3-5151-4161-8612-58894b1d0203@linaro.org>
 <8554d372-18cb-4351-a5ab-894be09c613b@linaro.org>
 <e8142566-aef5-498e-9d2d-8ac187ce8524@kernel.org>
 <c86f695f-28e2-406d-9f46-c291fca282e4@linaro.org>
 <Zv6LQ0q2XVHgUohh@kekkonen.localdomain>
 <1a4e5aa6-2308-41de-94e7-0077cb265b6d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a4e5aa6-2308-41de-94e7-0077cb265b6d@kernel.org>

Hi Krzyzstof,

On Thu, Oct 03, 2024 at 02:31:17PM +0200, Krzysztof Kozlowski wrote:
> On 03/10/2024 14:17, Sakari Ailus wrote:
> > Hi Bryan, Krzysztof,
> > 
> > On Thu, Oct 03, 2024 at 12:54:41PM +0100, Bryan O'Donoghue wrote:
> >> On 03/10/2024 11:17, Krzysztof Kozlowski wrote:
> >>> On 03/10/2024 10:38, Bryan O'Donoghue wrote:
> >>>> On 03/10/2024 09:33, Bryan O'Donoghue wrote:
> >>>>> On 03/10/2024 09:29, Krzysztof Kozlowski wrote:
> >>>>>> On Wed, Oct 02, 2024 at 02:58:44PM +0100, Bryan O'Donoghue wrote:
> >>>>>>> +        properties:
> >>>>>>> +          data-lanes:
> >>>>>>> +            oneOf:
> >>>>>>> +              - items:
> >>>>>>> +                  - const: 1
> >>>>>>> +                  - const: 2
> >>>>>>> +              - items:
> >>>>>>> +                  - const: 1
> >>>>>>> +                  - const: 2
> >>>>>>> +                  - const: 3
> >>>>>>> +                  - const: 4
> >>>>>>> +
> >>>>>>> +          link-frequencies: true
> >>>>>>
> >>>>>> Not much changed here and you did not continued discussion about it.
> >>>>>>
> >>>>>> Best regards,
> >>>>>> Krzysztof
> >>>>>>
> >>>>>
> >>>>> Ah my mistake, I didn't read the bit at the bottom of your email
> >>>>
> >>>> I'll do this
> >>>>
> >>>> Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> >>>>
> >>>>             data-lanes:
> >>>>               description:
> >>>>                 This property is for lane reordering between the THP7312
> >>>>                 and the SoC. The sensor supports either two-lane, or
> >>>>                 four-lane operation.
> >>>>                 If this property is omitted four-lane operation is
> >>>>                 assumed. For two-lane operation the property must be
> >>>>                 set to <1 2>.
> >>>>               minItems: 2
> >>>>               maxItems: 4
> >>>>               items:
> >>>>                 maximum: 4
> >>>>
> >>>> This captures what I'm after.
> >>>
> >>> I commented on link-frequencies.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>
> >> Ah I understand you.
> >>
> >> You're saying the link-frequencies we have in
> >> Documentation/devicetree/bindings/media/i2c/* are redundant absent hardware
> >> specific link frequencies being enumerated.
> >>
> >> I'll either enumerate the acceptable set or drop this.
> > 
> > link-frequencies should remain mandatory in bindings, whether there are
> > hardware specific limits in bindings or not.
> > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>
> 
> Yep and my comment was not under required field. Why all this discussion
> is taken out of context? No wonder everyone interprets it differently.

I wanted to just add that so we wouldn't have a need for v5. :-)

-- 
Kind regards,

Sakari Ailus

