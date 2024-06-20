Return-Path: <linux-media+bounces-13870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183E9112B9
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 22:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178271F224BF
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 20:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871711B9AC4;
	Thu, 20 Jun 2024 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcDAst7G"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82749171A5;
	Thu, 20 Jun 2024 20:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718913898; cv=none; b=pRx7HSpHAekQR47AnMzHeXyTjoo9+K4mnFsXudu2si20ftIuFwJsi7M8sU5zgZBDMh4Jmip0FzU0886r2m6rD2J4lC9rLog5okDw6YSbx/2UO7MVM2NESVTjc66p6lTCDv8+nwGKK4RgJKet2afa8kE8epVoA2dbUe0Q6/uELGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718913898; c=relaxed/simple;
	bh=v5lcw3OGdeut5QknRCKv7iS1RFGEGj9gbE3v5vdo7Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3TxRGgR7NfoJJU+Em9cD63QxSo0iwBwA9YK6n84y/agvPyUJp7Zql9m1yFfgelw/8DYXKRrD+Yvg9vx8NpXKjaVlKVvzbapKr9qEZs/m7YrLjbYkvyO+Bg1Z/vUclbOyWE4EI6InGECTw9Lu8B4nPAPjBanrRp9ACl/enCzK0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcDAst7G; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718913896; x=1750449896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v5lcw3OGdeut5QknRCKv7iS1RFGEGj9gbE3v5vdo7Fw=;
  b=IcDAst7Glmrkh5XUd1gxXbxXrhXtb2CFFXIX5qGxzpNO0GwoQcTlU35N
   hERmeI1I/hpM78vtwV8w5pTpF4f0xDuemm2FUVO7a5iav07jey1zJx3tK
   wnZZ/G4r5uKVyjDHrnECOZupODXGZ6XGmFI5V3QFc0b5MSauIDOnLnGKZ
   dECnOH4bM5vIPbYkUFppX5Z5IQ2KAvWnRrQhuzbhIvxcyae6iP79sPeMg
   nqq08HvJJk58Ih8209LdpR50aXAmT1MAIM3yP/C9E8otIgjFKcdacPmjn
   I55aywjP6ZYGzD7HTYe6wvTxYn+mSHy35AWhjzfScAogSrRlThfRg07/c
   Q==;
X-CSE-ConnectionGUID: JJd3W5cWRK2BMFJzF1aEgg==
X-CSE-MsgGUID: ZhYLb12VQ+GW4OwVqBvuAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27331387"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="27331387"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 13:04:56 -0700
X-CSE-ConnectionGUID: 113MbVb3THKJPjxT7zPuzw==
X-CSE-MsgGUID: zC4tqEluQnCb/nH8xWRSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="43040366"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 13:04:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 309B411F855;
	Thu, 20 Jun 2024 23:04:51 +0300 (EEST)
Date: Thu, 20 Jun 2024 20:04:51 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: Add description of OmniVision
 OG01A1B image sensor
Message-ID: <ZnSLY4MFIwXE6Fj4@kekkonen.localdomain>
References: <20240620124745.1265011-1-vladimir.zapolskiy@linaro.org>
 <20240620124745.1265011-2-vladimir.zapolskiy@linaro.org>
 <e61b5066-c256-4ad6-93ea-cc10cdfafc31@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e61b5066-c256-4ad6-93ea-cc10cdfafc31@kernel.org>

Hi Krzysztof,

On Thu, Jun 20, 2024 at 05:33:15PM +0200, Krzysztof Kozlowski wrote:
> On 20/06/2024 14:47, Vladimir Zapolskiy wrote:
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            minItems: 1
> > +            maxItems: 2
> > +
> > +          link-frequencies: true
> 
> This should not be needed.

Why?

Please see
<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>.

-- 
Kind regards,

Sakari Ailus

