Return-Path: <linux-media+bounces-20944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C709BD04E
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 16:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04A111C221B8
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AEE1D9A7F;
	Tue,  5 Nov 2024 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwPU/yd8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5213BB21;
	Tue,  5 Nov 2024 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730820394; cv=none; b=ZWBHFf/ZUr7PC8xM0nvT6QQSwzJPX448r4cOQ7fccWM2izHqA9ko8lUxVx4jFoUqP255rFSvyGAy+VqoeMsS0Ol6y0c0UAD8L3Pf93ThtbZ8XQNIq+P5Q55IcSBIBierdhrD2/x5QaeJr35EeclVtu/NzSkqJ+Rk6e4dDSUL1kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730820394; c=relaxed/simple;
	bh=RdqWiBixcG5d7PpyjfQjAg0G+vZ0+ZXGYgkm0W563Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4o/VOWi03HBxnm4rexm6oRy+2szUNkPm+qGnd4+A1Feasd2v9+vwG4MvV6/8tIYHXQQ1Z0si34N7uRLllG2AjsX7Oy6TIq0+GK2AtW4IokFKfptmuC/uU61EP14axIsXGzSQw1erZ062qtxPqmZKcc3JWF4aiFbuTGpEvADsKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwPU/yd8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730820392; x=1762356392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RdqWiBixcG5d7PpyjfQjAg0G+vZ0+ZXGYgkm0W563Cc=;
  b=UwPU/yd8YBshtHnRAK4D3Rqca+fk9NEeB8uJ7tlENrlSq8IzHVnhA7ep
   zunOoAtaP0fSPGIk3HmFG/i4gexOLkdkHnyM1OC+qOPXt+XuRFwhIUHMA
   xkk8IJT5oNx6THVienLwLpO/4R+ScoqPGLftQeFZJ/R92f2A8loX88w+j
   U0E4spmHdn0RfqXipE978wbsfB/dampSgI3VKTLAf/1v9++ZAqt6zYqse
   LDK+zaS8YOT0kOmLjqRrxzHLaaMO98G29ZCmbcQ43C0lL7+DF67rc37tb
   NDiy8pG6U4Qhu8xPKQrvG60UsxkM3D8mytAAqHIw6P0YEeNVqoxj0vUp2
   A==;
X-CSE-ConnectionGUID: SAp5CGy5Rcqz78spFS/tLg==
X-CSE-MsgGUID: fadzxNO+S/yQ9TwVCxNsFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30452502"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30452502"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 07:26:32 -0800
X-CSE-ConnectionGUID: iOMmOyqhQCqCUZkKEUBrww==
X-CSE-MsgGUID: 6sAoZFfFQ3menxNbEtw7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="87988913"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 07:26:30 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1F99A11F9C3;
	Tue,  5 Nov 2024 17:26:27 +0200 (EET)
Date: Tue, 5 Nov 2024 15:26:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jason Chen <jason.z.chen@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <Zyo5I_vMwisIgNJg@kekkonen.localdomain>
References: <20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org>
 <20241010-b4-master-24-11-25-ov08x40-v6-2-cf966e34e685@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-b4-master-24-11-25-ov08x40-v6-2-cf966e34e685@linaro.org>

Hi Bryan,

On Thu, Oct 10, 2024 at 01:33:18PM +0100, Bryan O'Donoghue wrote:
> Add bindings for the already upstream OV08X40 to enable usage of this
> sensor on DTS based systems.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,ov08x40.yaml           | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)

I added a trivial MAINTAINERS entry to this patch while applying it:

diff --git a/MAINTAINERS b/MAINTAINERS
index 99bab0c359c0..10249501ee62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17064,6 +17064,7 @@ L:      linux-media@vger.kernel.org
 S:     Maintained
 T:     git git://linuxtv.org/media_tree.git
 F:     drivers/media/i2c/ov08x40.c
+F:     Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
 
 OMNIVISION OV13858 SENSOR DRIVER
 M:     Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

