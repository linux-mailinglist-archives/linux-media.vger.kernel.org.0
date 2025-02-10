Return-Path: <linux-media+bounces-25889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3263FA2E84B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74CA93A9354
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50111CB9F0;
	Mon, 10 Feb 2025 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAd2Xe4g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731B61C5799;
	Mon, 10 Feb 2025 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181222; cv=none; b=Q7i8QjZTv2azxowmqIwxunbEAtW8dcIUuDecbUsYnOcp1NtMewbVcea7w4NO6UR5jGeJTUWoIaShFCiPiTNtrNS0uxcip7ZdBDJJLXN9ktr1b593n84azvLWw4d230NV/iwt0JBSc7ym4FCtZWveQb5VnnISKKfhN0g+FaywN98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181222; c=relaxed/simple;
	bh=WZ8gMumvatbxQoJVCd/ooEA0OvxyHGeaCxHBr2ZS50Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS614fSINrczV0kvsrSfDp37tjHNljiTtDL5FpssPqJyM96liD1POSPj77oz+l4lpN4ZK+548ExHYoIHceWd87Nt5FyXNKE1/7Y+Vr93rgn08N2EOphgR3uSFXxAdXz4HaAckCPJJ4q8TEBSsUJvjDtw9SyJsHQitSDDZU5sSDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAd2Xe4g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739181221; x=1770717221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WZ8gMumvatbxQoJVCd/ooEA0OvxyHGeaCxHBr2ZS50Q=;
  b=CAd2Xe4gG51vLARyF7Vu2+x2ULBPYDw9KREtIUxPgTlGFEEvGxJyYXnj
   Lac1abg6RWnsxXeK5lwTo0F8fSuAoGXyi32At6+RLVr9bWRvcB7tX7U79
   eUhh7gTH5LHBSnZM5ZnQLTn+s8zBGR7T1sfvWEneSw5P3b3zAEmKFJYs9
   K+0tBOP+LrshkOdieeJM9kZnWY1xiT/hv0iqSpu3q1So0SM8fp2LAH+mf
   dE4JHzYWaOfW16gTBfTmn39cnovhobSb1WDrY+m5r/7qf2KBt6dHROy21
   rOZdIlfawioEIpRf4/lmyVlo4duoq9VbMG/yWCu/5zmL7OG4w5GpTBtg1
   w==;
X-CSE-ConnectionGUID: G0EaPDnERVmDYtvEGdVT3A==
X-CSE-MsgGUID: DEo0TLV+RZKHs5Xiw7Ag4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39882175"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39882175"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:53:33 -0800
X-CSE-ConnectionGUID: UiTXYApJSAuWHRDkrOw3uw==
X-CSE-MsgGUID: WgVEtldIQeKNrzhHKBt+5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113026011"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:53:30 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3E4F311F94F;
	Mon, 10 Feb 2025 11:53:27 +0200 (EET)
Date: Mon, 10 Feb 2025 09:53:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add DW9719 and DW9761 VCM
Message-ID: <Z6nMl7vXPkICysSJ@kekkonen.localdomain>
References: <20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu>
 <20250209-dw9761dts-v3-1-14d3f00f0585@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250209-dw9761dts-v3-1-14d3f00f0585@apitzsch.eu>

Hi André,

Thanks for the update.

On Sun, Feb 09, 2025 at 10:51:57PM +0100, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Document Dongwoon DW9719 and DW9761 VCM devicetree bindings.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  .../bindings/media/i2c/dongwoon,dw9719.yaml        | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b38d22bf09713a7999e1f9ce6553de7587dbe5d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9719.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9719 Voice Coil Motor (VCM) Controller
> +
> +maintainers:
> +  - devicetree@vger.kernel.org
> +
> +description:
> +  The Dongwoon DW9719 is a 10-bit digital-to-analog (DAC) converter. The DAC
> +  is controlled via a 2-wire (I2C-compatible) serial interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dongwoon,dw9719
> +      - dongwoon,dw9761
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Regulator providing power to the "VDD" pin.

The driver uses dongwoon,sac-mode and dongwoon,vcm-freq properties. Could
you document them as well, please, including the defaults? Are the values
the same for both chips?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera-lens@c {
> +            compatible = "dongwoon,dw9761";
> +            reg = <0x0c>;
> +            vdd-supply = <&pm8916_l10>;
> +        };
> +    };
> 

-- 
Regards,

Sakari Ailus

