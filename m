Return-Path: <linux-media+bounces-45111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2A2BF5487
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C9863A48BC
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 08:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABDC312839;
	Tue, 21 Oct 2025 08:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNCX0qbs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167230F53E;
	Tue, 21 Oct 2025 08:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761035639; cv=none; b=Hr/4sCTUPghxZvnHV4Uqjn24m8W3Z8WzLtZGS7yrrQ5pQ1taCzZuQIB6CXTXPIlIpO9frmn3PKf4QIYL+uDMrSDDCZvXCvh0JJH6iqkkZE4xtjtE9JAQIVEuZtPmm3/UdbGapzpTy9QcPfcZSWBlg1tb86LRUw/NAD3NaQBxS9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761035639; c=relaxed/simple;
	bh=7AAkSbpCo8jTHoVHtc7747VTNL+ybmCSlgJI6u1AuBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzphZDSrbaqa75aANuza83C8D7+lqw8if4MEneQ8mIaS/+9X1JUE0dNu8O3FRHWQRH1ZEYB0rV9VlGJeC67YWiuE9mi6xbX7+7OKJAHgFYsty4oxo/MwMwe0NPXjxPmBCwiYGqdZEkGeaBFa0uz4jrq4lL+VLSKvpTDhfHpi3VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNCX0qbs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761035638; x=1792571638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7AAkSbpCo8jTHoVHtc7747VTNL+ybmCSlgJI6u1AuBQ=;
  b=aNCX0qbs1lZFMiiDk0UutogmUkbKIqZug6/2ODluJiXGNNxzFwPZe7sf
   LmXdIMt7hZb3SzUFzdNJ3cCVgQzUNxRKmOJqY8dBNBMgK4Whi4lnSvGwc
   OonLoqMazQFDj9y4LRkwIpMMIvLa7KLjW+Hy8z7pSiDvWuHx31mmItVm8
   QiFZF9geuFny4Yx/Uh+U5zMQVr+aSaJdlNyuMDRY1Y2xIailnJo7zL8xt
   ynhpvi6V/bOZTxrCxpoyqxo+xvuzubF+vDlwSKoufMiV9LNbjPvzJJBdG
   IS12JBV2hpCLR807QQlGaDftLLvhRiC6CtzeJsJcgbLp6rHGLu3uuK6nF
   Q==;
X-CSE-ConnectionGUID: M2ISxljRTqWyE6OGhfl+Ug==
X-CSE-MsgGUID: bcZURwu9RcOTORoe1KVo6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50731106"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="50731106"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 01:33:57 -0700
X-CSE-ConnectionGUID: ut0RFvqtQrKQBfNNscBISg==
X-CSE-MsgGUID: BakoZdPnQzmbK4b1wYotHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183242308"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.134])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 01:33:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 20BC71202B5;
	Tue, 21 Oct 2025 11:33:52 +0300 (EEST)
Date: Tue, 21 Oct 2025 11:33:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Heidelberg <david@ixit.cz>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: media: Convert ti,tvp5150.txt to yaml
 format.
Message-ID: <aPdFcGvX5p3RQPt2@kekkonen.localdomain>
References: <20251014185515.2354668-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014185515.2354668-1-Frank.Li@nxp.com>

Hi Frank,

Thanks for the patch.

On Tue, Oct 14, 2025 at 02:55:09PM -0400, Frank Li wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/display/sdtv-standards.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        bridge@5c {
> +            compatible = "ti,tvp5150";
> +            reg = <0x5c>;
> +            pdn-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +
> +                endpoint@0 {
> +                    reg = <0>;
> +                     remote-endpoint = <&composite0_to_tvp5150>;
> +                };
> +
> +                endpoint@1 {
> +                   reg = <1>;
> +                   remote-endpoint = <&svideo_luma_to_tvp5150>;

I aligned these while applying the patch.

-- 
Sakari Ailus

