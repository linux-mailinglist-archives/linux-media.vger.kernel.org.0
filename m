Return-Path: <linux-media+bounces-46259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D4C2FE1D
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 09:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E50DC344BC1
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 08:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC052C181;
	Tue,  4 Nov 2025 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBYcAXhM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169D61A2392;
	Tue,  4 Nov 2025 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245000; cv=none; b=dLfM4bm7MLLY6gOlzdEuBKj6JQpGc0Bu3mMC30Hbk7ZKCFroChLI47IBIMOzBjLuS+aBJh8C70XrbQauQozWjjud5MTIkouAQ25r/yfWf4UjQqbtP4RxhphiR7p8eC/y5RvGgmXkEJBOVTXh9CIKwp3j5eTa4+/xf/kR0kTTgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245000; c=relaxed/simple;
	bh=ZY4MLG3Pozng8Yzu+/rwnU2R7ji3n4sypI/tK3knfZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dq1O2c4oBHFnBYkirkTfGodkEj+pjhglUPZ3wer2/Pqe9/avkCIFkwiuw4WOdHYas9k7SpZJqWjtTuO4R9dQNDoMGIZxDpLeU3LA5gDOWrDVUch0jaisZR3GSWtyUhDhGUcdUjvFrOEOFmuW570dCOwuAVDI0Cdz3OufMc0V+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBYcAXhM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762244998; x=1793780998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZY4MLG3Pozng8Yzu+/rwnU2R7ji3n4sypI/tK3knfZU=;
  b=mBYcAXhM97LYoFQ/SEgkof9xh/ELn8SmZW2Sni+8la0CUgqcDAOEUKZC
   SiVJZvjsQcnSUu2MtibrspPdKBvExzwg/j0cJwlPJ7LFKxyn9lShaBs87
   SpvZEJ5YZBUc25XiHbJ+kWDwrBnGQzNRRowc61TaHcT9DkIQKHqzM+M5b
   lmV04g9QMPNiDVDzzhEqUGBuhcEMpWsx9heFt9NwGWdSqnsmp7jWQzRG3
   LNuo5FAfom/xBlfQDaV3o4BZnffh9UWEDg8RAVAxu3oUKGqZ/Nus2NTns
   oQxONQuJ4hTOqYljvnpuB2afUTMa0hqNudJSeFNv7dnH82HXudLna2xX5
   Q==;
X-CSE-ConnectionGUID: J680W1UNRlyA+EMebqq+JA==
X-CSE-MsgGUID: B8yaGn4JQu2X665cgr6SzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81962057"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="81962057"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:29:57 -0800
X-CSE-ConnectionGUID: AHMEmrQCTUezwu5XTwmg0A==
X-CSE-MsgGUID: rcWOw5QfS8yXslGPdIZ0EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="187827199"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.133])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:29:50 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1090411FB83;
	Tue, 04 Nov 2025 10:29:48 +0200 (EET)
Date: Tue, 4 Nov 2025 10:29:48 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v4 2/2] media: i2c: add Himax HM1246 image sensor driver
Message-ID: <aQm5fEB5YTyt2qgY@kekkonen.localdomain>
References: <20251017-hm1246-v4-0-e3388ea2f08c@emfend.at>
 <20251017-hm1246-v4-2-e3388ea2f08c@emfend.at>
 <aPec0SRvDlqtVKIJ@kekkonen.localdomain>
 <6e7a63b1-6aee-4b4f-9fb9-2f2df92782b4@emfend.at>
 <85df7f30-e9ac-422e-8ab5-7c6b82774aaf@emfend.at>
 <aQiL111bKgKE6M22@kekkonen.localdomain>
 <a7c2b507-90e8-4b0b-92d6-5b232e7ba22f@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7c2b507-90e8-4b0b-92d6-5b232e7ba22f@emfend.at>

Hi Matthias,

On Mon, Nov 03, 2025 at 05:19:47PM +0100, Matthias Fend wrote:
> > > > > > +static int hm1246_parse_fwnode(struct hm1246 *hm1246)
> > > > > > +{
> > > > > > +    struct fwnode_handle *endpoint;
> > > > > > +    struct v4l2_fwnode_endpoint bus_cfg = {
> > > > > > +        .bus_type = V4L2_MBUS_PARALLEL,
> > > > > > +    };
> > > > > > +    int ret;
> > > > > > +
> > > > > > +    endpoint =
> > > > > > fwnode_graph_get_endpoint_by_id(dev_fwnode(hm1246- >dev), 0,
> > > > > > +                           0,
> > > > > > +                           FWNODE_GRAPH_ENDPOINT_NEXT);
> > > > > > +    if (!endpoint)
> > > > > > +        return dev_err_probe(hm1246->dev, -EINVAL,
> > > > > > +                     "missing endpoint node\n");
> > > > > > +
> > > > > > +    ret = v4l2_fwnode_endpoint_parse(endpoint, &bus_cfg);
> > > > > 
> > > > > What about validating the link frequencies? You can use
> > > > > v4l2_link_freq_to_bitmap(), too.
> > > > 
> > > > I was under the impression that for sensors with a parallel interface,
> > > > no frequency information is provided in the device tree (because there's
> > > > no need for it). Since there are no frequency entries, they can't be
> > > > verified.
> > > > 
> > > > Am I wrong, or did you perhaps mean something else?
> > 
> > The current documentation
> > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html>
> > doesn't distinguish CSI-2 and parallel interfaces in this respect. It's a
> > good idea to ensure a safe frequency is used as the driver works the same
> > way in all cases, whether or not using one is mandatory.
> 
> If I understand correctly, this means that in the bindings, the port
> property 'link-frequencies' should be marked as 'required', and the port in
> the example node should be extended with the line 'link-frequencies = /bits/
> 64 <42174000>;'.
> Then, during probe, it can be checked with v4l2_link_freq_to_bitmap()
> whether the link frequency entered in the device tree is supported (this
> also requires switching to v4l2_fwnode_endpoint_alloc_parse).
> 
> Does this describe the desired change?

Yes, it does.

-- 
Regards,

Sakari Ailus

