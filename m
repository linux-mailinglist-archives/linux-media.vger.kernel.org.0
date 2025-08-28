Return-Path: <linux-media+bounces-41275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C79FB3A5CE
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74F93188FDE5
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF9F2D24B6;
	Thu, 28 Aug 2025 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1fEnHG/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67E126A0BD;
	Thu, 28 Aug 2025 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397558; cv=none; b=hYPHcQT7lcptiJxqVfqvOp/mZunh5w2XA9RFX8uZINBOMHAMhDN4m0pUaOH7wEfl6MsoIpYBJw98j0mmxo49bPe6BtziVzqIiA6Eh4SfAlBl05qgmyqf/ujiH25xbEQI5Bs/acGH7Pb3Y8gZUV6O9UcP4+jOc2iyD01FEDq5Klc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397558; c=relaxed/simple;
	bh=eaHfaCKF0V2Z+VnLTT0mS1E71eFLmvmfc4JWkwktky4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZmQHqAqNNQGUFerQJ1Lzjyt7n8zd5Gc0NxV1m3J+waMYSU7xcihK2T2CsY5YnZIPm6CyfszKj6diTc3+1OnsjKTlfNR6sEduk8xG7q8Ts0dX65tC/2hR6fn/GOlX9vXX4RkxOjhdN1TWq32QinAl1w3LzvJ9EBfUuuARWHxsRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1fEnHG/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756397557; x=1787933557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eaHfaCKF0V2Z+VnLTT0mS1E71eFLmvmfc4JWkwktky4=;
  b=F1fEnHG/W7IhJWC4QeLigKnCMHoeFB0HtOKUW83ti44oYzFMhZpKh9ZS
   crL4pOkYj7i+i9pPlJrS7dfvgG4zFStfnGdou1k15NtbV8h2gyVAzBkX2
   nIu375DlhThh9JH6hryoDiid9nr3KZO1Iu44fJ8nynoQ0TZk7EQg7ETPV
   cIU/9yRc1B03BF/c/BTa1lMqK985oZwvzftfA8LqAuY4N75yx+1pMH9MB
   /7k5Xtc1++mPLNrZB73sHy5qarQ1iR3/hOwarZyI8WBXZ4Jt2vnZQDdSY
   zzbZ7Pi8A4p3V9u0uVdHwM7gFQcryvZt2J4eAkOkwXHVgR9EE+LJduvCJ
   w==;
X-CSE-ConnectionGUID: bPKKopkQTkaWaO5SGHYHCg==
X-CSE-MsgGUID: aMfKlPtTScWfEb6/f7Ty6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62321476"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="62321476"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:12:37 -0700
X-CSE-ConnectionGUID: HVgnEwfnSCyMQyrCjhJyPw==
X-CSE-MsgGUID: Zd52YH+BTwCfvVJ4hDHcHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="174533836"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:12:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 936C511F9D4;
	Thu, 28 Aug 2025 19:12:29 +0300 (EEST)
Date: Thu, 28 Aug 2025 19:12:29 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] media: i2c: add Sony IMX111 CMOS camera sensor
 driver
Message-ID: <aLB_7YS9HsfzfadI@kekkonen.localdomain>
References: <20250819120428.83437-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819120428.83437-1-clamor95@gmail.com>

Hi Svyatoslaw,

On Tue, Aug 19, 2025 at 03:04:25PM +0300, Svyatoslav Ryhel wrote:
> Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X and Vu
> smartphones.

Thanks for the set.

I wonder how would the sensor work with the CCS driver. The register layout
appears to be very much aligned with that (I haven't checked whether there
are MSRs that depend on the mode).

-- 
Kind regards,

Sakari Ailus

