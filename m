Return-Path: <linux-media+bounces-8006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568288F1E8
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 673781C31309
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 22:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE752EB04;
	Wed, 27 Mar 2024 22:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lg0ejYyb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F46F134A5;
	Wed, 27 Mar 2024 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711578631; cv=none; b=qOoyRVoB4X8AmgQDKLqNXJcwOGwaFQZub6soB7XcbdoRtg7EFh3RlOmEFA2wbwbZR3GarZNu9EIfibJQgexny5JIF5YiP+1NChySY4zVMmRIIqLsAV3tqdXnyzUXvoZ0B+Z0RX1J6ZCM/ia7469i3hmDw6PsIHSkiSMadVMo0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711578631; c=relaxed/simple;
	bh=hajNluZlOot75fk520IorSrTIkhfgAFKsSacK/8jd64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njfeXEaR5FltKrVYqx/Gh5Mssu5ekIfCe6Yok62d51f5dbGkbdUiAfTE8fPChEAHtBlp7uIG0dagraNvvIlYmEbLq8R71R9rFK3WEyYKqXhI6O6h0YGcpVjsji7jwVdor4dvO077W1j/abquGgExZrAZ8swHNNOpLs2kOSZJM0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lg0ejYyb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711578630; x=1743114630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hajNluZlOot75fk520IorSrTIkhfgAFKsSacK/8jd64=;
  b=lg0ejYyb9xIwb7Tj/QwMttj2ZeDmpIiDzL2W3sCLvlntmXn2FxAhF4DU
   ajLNCOqfaufEoF1yGvqWTQ9EuZhYcKWsBlSw7pTNOuZU+4XPc5VTMqpzJ
   Sks3LTOJ7tn13Zffng/1AjBJmgn3sPPHjFlbXWCN/NH3RvVgQutM+e4yj
   4A3lVJFCNivw9nWubaTBmY6lxZ+SwVW8oxZZcbdgVKJ2FceJhV342hByu
   x3m/vDYxncNTHcMtCXnyyJVT1JUBHhNg0FoqpTfdwosmJinu8Miy6JJbV
   icyco+9YaD16mzzrLfyZnBN5sdYUr1Wh7D9rs3hiygXpNyx2nlDYAZwzW
   A==;
X-CSE-ConnectionGUID: +t3Kf56UQhi3e6s8EN7ouw==
X-CSE-MsgGUID: zrABRU5JQOG7K449sdM5MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6927295"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6927295"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 15:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="21157488"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 15:30:27 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8C8B211F8B1;
	Thu, 28 Mar 2024 00:30:24 +0200 (EET)
Date: Wed, 27 Mar 2024 22:30:24 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: rmfrfs@gmail.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] media: dt-bindings: ovti,ov2680: Document
 clock/data-lanes
Message-ID: <ZgSeACFfBAmOPXdt@kekkonen.localdomain>
References: <20240326231033.2048193-1-festevam@gmail.com>
 <ZgPtolH796HER4cP@kekkonen.localdomain>
 <CAOMZO5AYjNPWZfy_dN12K9JNwWaWThpMs0W-FzETF5k8fobgeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5AYjNPWZfy_dN12K9JNwWaWThpMs0W-FzETF5k8fobgeg@mail.gmail.com>

On Wed, Mar 27, 2024 at 11:50:26AM -0300, Fabio Estevam wrote:
> Hi Sakari,
> 
> On Wed, Mar 27, 2024 at 6:58 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > If there's a single possible configuration only, is this needed? There's no
> > information here which the driver would need.
> 
> Good point.
> 
> In this case, the correct fix would be to remove 'clock-lanes' and
> 'data-lanes' from imx7s-warp.dts.

Agreed.

-- 
Sakari Ailus

