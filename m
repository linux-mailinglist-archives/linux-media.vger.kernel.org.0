Return-Path: <linux-media+bounces-46200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3FDC2B389
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 12:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4CC64E8B2D
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 11:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296A530101D;
	Mon,  3 Nov 2025 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0BJESTa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7D9221DB5;
	Mon,  3 Nov 2025 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167797; cv=none; b=EcPhA27DV1k25UAdcLciyMmXB5rlFNmdKZ2mCUXQSNvQbYMJx1ynWX++2q/l9DIDDYesrVhlf+NbouDBRyijf7+Q0fLocquKBJ6Ozgr2VDowt7+zEwn2BG/rFU5IBrjnbhZVackBAPjrZ1VtLGYgKZR1COz+wIXNwg1Jcn27YNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167797; c=relaxed/simple;
	bh=OcFWZgFQi1jbSgi3vJIscFKU3cesWdTxmnLHUWmBSwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKrZCCtNeGxyLYHzM5EfALTz7REI9ZtPPR/M7ADOXceUMikDOPyNaGoqC/xZMcFvQ4h+3ercQueCUmcQV3X3TdVNOu1G+5Gpyd5Mw94u7N2vHk1504ZA3Jog7XEdNz3TUVa2Og5JxP9Y97zNsqeiiCZSvbDmXqFKFlUjgQWUw9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0BJESTa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762167796; x=1793703796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OcFWZgFQi1jbSgi3vJIscFKU3cesWdTxmnLHUWmBSwE=;
  b=O0BJESTarp/8AXirfORuiYC7G1J0pq4fOfCCl8kz7+ykyN6sAZoVP2hB
   otytKWl1L8rV5vDG9/1ErTBncL3E+qjhZmIEg1bH+o1Ka61cFd+cFn+An
   Skmc+PgrNa6WWFrP89AU8vphtosJLL4AztiaWOQk4Nnsu6dbwbhHyxzIG
   rKqS2hoOPU+Jd4kPKahwJuHQpzQIREQej3OeZsZURWH0eXswItgmw4CHb
   Zfro7J0889iJDyqIqZAjQ4ag7KjHVvEaIaSTHtManUfXhvL0MF2tQN/ED
   1YdMcdrR3ToaZn6daBAOBrq6jidTYsWANQmwx30ZlbLWjJZRVUfIWhIvK
   A==;
X-CSE-ConnectionGUID: V4B7qe6JQpSDOdmJRRz25A==
X-CSE-MsgGUID: 4KsXFtqvRFuy272T7WmSbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63255253"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="63255253"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 03:03:15 -0800
X-CSE-ConnectionGUID: 4WwVDGt7T+SRBR7pKsReRA==
X-CSE-MsgGUID: MbU9IwdmSs+S4cFW+H/EtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186518074"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.27])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 03:03:09 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 91D43120D07;
	Mon, 03 Nov 2025 13:02:47 +0200 (EET)
Date: Mon, 3 Nov 2025 13:02:47 +0200
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
Message-ID: <aQiL111bKgKE6M22@kekkonen.localdomain>
References: <20251017-hm1246-v4-0-e3388ea2f08c@emfend.at>
 <20251017-hm1246-v4-2-e3388ea2f08c@emfend.at>
 <aPec0SRvDlqtVKIJ@kekkonen.localdomain>
 <6e7a63b1-6aee-4b4f-9fb9-2f2df92782b4@emfend.at>
 <85df7f30-e9ac-422e-8ab5-7c6b82774aaf@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85df7f30-e9ac-422e-8ab5-7c6b82774aaf@emfend.at>

Hi Matthias,

Thanks for the ping.

On Mon, Nov 03, 2025 at 07:54:52AM +0100, Matthias Fend wrote:
> Hi Sakari,
> 
> Am 23.10.2025 um 11:00 schrieb Matthias Fend:
> > Hi Sakari,
> > 
> > thanks a lot for your feedback.
> 
> I had two follow-up questions regarding your feedback, but I suspect they
> got lost in all the code. I've cleaned up this mail a bit to make the
> questions more visible.
> 
> > > > +
> > > > +static int hm1246_update_controls(struct hm1246 *hm1246,
> > > > +                  const struct hm1246_mode *mode)
> > > > +{
> > > > +    s64 pixel_rate, exposure_max, vblank, hblank;
> > > > +    int ret;
> > > > +
> > > > +    ret = __v4l2_ctrl_s_ctrl(hm1246->link_freq_ctrl, mode-
> > > > >link_freq_index);
> > > 
> > > Does this do something? There's only a single link frequency value (and
> > > index) supported.
> > 
> > You're right. Even though hm1246_update_controls() isn't exactly wrong,
> > I could currently remove this function completely. The sensor supports
> > various modes (which result in different clock rates), and I've already
> > started implementing more of them. With multiple modes the controls need
> > to be updated. However, since there were still some internal sensor
> > issues to be addressed and I haven't been able to fully test them, I've
> > decided to use only the presumably most common RAW mode for now.
> > 
> > Should I remove the function now and add it back once more modes are
> > implemented?

I think it'd be better to postpone adding this. I think you'll need further
logic to support this and it'd be better to review this in conjunction with
the additional features.

> > 
> ...
> > > > +static int hm1246_parse_fwnode(struct hm1246 *hm1246)
> > > > +{
> > > > +    struct fwnode_handle *endpoint;
> > > > +    struct v4l2_fwnode_endpoint bus_cfg = {
> > > > +        .bus_type = V4L2_MBUS_PARALLEL,
> > > > +    };
> > > > +    int ret;
> > > > +
> > > > +    endpoint =
> > > > fwnode_graph_get_endpoint_by_id(dev_fwnode(hm1246- >dev), 0,
> > > > +                           0,
> > > > +                           FWNODE_GRAPH_ENDPOINT_NEXT);
> > > > +    if (!endpoint)
> > > > +        return dev_err_probe(hm1246->dev, -EINVAL,
> > > > +                     "missing endpoint node\n");
> > > > +
> > > > +    ret = v4l2_fwnode_endpoint_parse(endpoint, &bus_cfg);
> > > 
> > > What about validating the link frequencies? You can use
> > > v4l2_link_freq_to_bitmap(), too.
> > 
> > I was under the impression that for sensors with a parallel interface,
> > no frequency information is provided in the device tree (because there's
> > no need for it). Since there are no frequency entries, they can't be
> > verified.
> > 
> > Am I wrong, or did you perhaps mean something else?

The current documentation
<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html>
doesn't distinguish CSI-2 and parallel interfaces in this respect. It's a
good idea to ensure a safe frequency is used as the driver works the same
way in all cases, whether or not using one is mandatory.

-- 
Kind regards,

Sakari Ailus

