Return-Path: <linux-media+bounces-45379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A14C00D2F
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 195A23B39E0
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267832FF668;
	Thu, 23 Oct 2025 11:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKG+lK/c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5298304BBC;
	Thu, 23 Oct 2025 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219408; cv=none; b=rrWRArYJ2BnQbxvRZGmfXdxXbDAE4MDsbk2HNTG+f8RsBwcz2jhHKftK2u6Oq3B5yx5JUyKnm1/yPdg+tIjsirWugIL0JL25rcV/mahF1+xcYoeJidDCCy6WiGPQP/NKBx7RaC1Y6deLUWVLL+8ahvLv0kLUdQufEMNUhxN2V8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219408; c=relaxed/simple;
	bh=APuVVTKUgSdf8N76cjQz8KE4z+xjKZgYpTJmhOolDfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvJg+m00tdbQ2l3PgGsBGl5beQsdKvOCCSg0UfgSV82y5Gtaki+YGA74HiyG0qTPKYmqGY2YlX8MFsngzyD7XdXGYtay2Owm6FmljFOW4IfMnyZQdQE6mo/SdAn/SiLCFECdT1fXSaj6SAQwd6ui6wJrv8ouam9sxA8Tqt/a2/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKG+lK/c; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761219406; x=1792755406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=APuVVTKUgSdf8N76cjQz8KE4z+xjKZgYpTJmhOolDfg=;
  b=JKG+lK/cQE7RxO3MCkpbgssQiRlx71V8a8NuFjBohSRr4YkRmUsadVjO
   sIDL0K3XDfcUqsL6TR+qv21bcu05U5xOksSya/ff6bATj/pDYnEGDAZIM
   0JH5ajqARzzECRJOR6RlKPWtY4CqxVK8jrzt4yOoNYZwFiFvs05gICniS
   zXS9KkAmMuZefqaOcPEz9dvRULpMdIToeGwsY64IWAkvA4gtQBdPRHaXX
   SmoErQoZiE08G96E309FWE8QrmSFp+UpptKAKYVLSlfIUIi/V4l59uRio
   6Az92N7IEBkuQn0hETMJ2wNkKTJdDADB5zhVBBwO0wWJVYL9peBG4KhFd
   w==;
X-CSE-ConnectionGUID: t8xe+PG5ToiTAzNui+f57g==
X-CSE-MsgGUID: MklU9/uqSMmrBbbLRDTvqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66000964"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="66000964"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 04:36:46 -0700
X-CSE-ConnectionGUID: oNPmcWm+T9qr3ClJyjH0zw==
X-CSE-MsgGUID: BHhGeKTiQ9eott8yQW/MTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="189267977"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.193])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 04:36:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 691AD1209C8;
	Thu, 23 Oct 2025 14:36:40 +0300 (EEST)
Date: Thu, 23 Oct 2025 14:36:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add cam
 actuator
Message-ID: <aPoTSKCTfFmA9QFJ@kekkonen.localdomain>
References: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
 <20251009-ak7377-driver-v1-3-29e4f6e16ed3@fairphone.com>
 <c1d09672-e8a4-473a-88dd-fc91e81aea52@oss.qualcomm.com>
 <cd083217-27b1-4959-b80d-0189f178208d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd083217-27b1-4959-b80d-0189f178208d@fairphone.com>

Hi Griffin,

On Thu, Oct 23, 2025 at 10:37:50AM +0200, Griffin Kroah-Hartman wrote:
> Hi Konrad
> On 10/22/25 19:29, Konrad Dybcio wrote:
> > On 10/9/25 2:23 PM, Griffin Kroah-Hartman wrote:
> > > Add a node for Asahi Kasei AK7377 actuator, used for focus of the main
> > > back camera sensor.
> > > 
> > > Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > > index e115b6a52b299ef663ccfb614785f8f89091f39d..49654f0f914fbe18080d2f55bb6877c8ab7baf0e 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > > @@ -616,6 +616,13 @@ &cci0 {
> > >   };
> > >   &cci0_i2c0 {
> > > +	camera_imx800_ak7377: actuator@c {
> > > +		compatible = "asahi-kasei,ak7377";
> > > +		reg = <0x0c>;
> > > +		vdd-supply = <&vreg_l7p>;
> > > +		vio-supply = <&vreg_l7p>;
> > 
> > The dt-bindings suggest vdd is 2.8 V and vio is 1.8 V (at least
> > on AK7375, although this isn't stated explicitly..)
> 
> This AK7377 is integrated into a JHS-M15342-A2, which only takes in VDD as a
> power supply. VIO was only added to satisfy the dt-bindings, as we are not
> sure what the exact pin layout the AK7377 has.
> 
> > L7P on FP5 is 2.7 V (default) - 3.0 V (which you should probably
> > tighten to the actual operating value), please double-check this
> 
> I can confirm that L7P is supposed to be 2.8V on the FP5, I will update the
> dts in my next patchset.

This seems to be unrelated to the DTB/driver patches, which I presume I
could take from this version while you'd post an updated DTS only?

-- 
Regards,

Sakari Ailus

