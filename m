Return-Path: <linux-media+bounces-25895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7FCA2E99F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A148318881A7
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64211CD219;
	Mon, 10 Feb 2025 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGR00zEK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D01C5D7A;
	Mon, 10 Feb 2025 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183811; cv=none; b=mocxqjThRTWeXNFyGUzxV55BVOMJ4fDMoLDh5fCVL6dQPgdZ4977jnRISfYUns1mMmxARxnQdir26QfqQJ+XWIHbknwvDQeM3KVywkhpFklpy/CHT4TveE96r2qHPyzPxgtS8P18XfQlE562Z85Bi0NhfP9EOnT5j26cD/epfuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183811; c=relaxed/simple;
	bh=3ZxFbYVwhWKY4oRGzC/bFeJgAsBMSSNDEedS0duoSi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UO/hZXPjzCo3AGDDxOkVfppzoAl1/EwTzznRr54Cg5E6Gn/2Lr+ovPuK6A/9jFDP6UOtcLi7sKv3xsufG2qLZJu7eHpi+zaiAFzOf6NCxh70YwN3ACdVXiUZki2a5yOAYgWq2DrXpDVhW4IOGiNcjdQjfuiupa8CQv41634wE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGR00zEK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739183809; x=1770719809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ZxFbYVwhWKY4oRGzC/bFeJgAsBMSSNDEedS0duoSi4=;
  b=XGR00zEKkCO3H+mKwPsgQlh5bDhJt2inCK98TnFMTy30KhOo/agKESLS
   jLgcrYVENj7T4Hec+1BmzEE4TmV0QKbQ9fkMytHkoBBcqhjBfQQ7DYFAN
   xMcMvtuSj+WNrAPW90w+PhOTUZIkpfBljRnrlMCJUQwE3n3gpCRMStwfx
   BMarux++QpRFAFTc8/1MER0vDW832S0iKGIjFuAHvv5Sz1XjhQjP/hpFU
   +xBch1gu/EGKkM7SQm87FA9vvWYJRMkCFFxwQwSo6IXA6I7g0Uq3HyYlQ
   OYphSHo9NGQIXcCf029B2N5eq9hFMLo8ZDhVmut+mj7bdZwxwKQWfpFDo
   Q==;
X-CSE-ConnectionGUID: jknd9ziJT7qERCKcEEcUjw==
X-CSE-MsgGUID: fhGJ4nxLRy+6e7nWbbqeTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="40027310"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="40027310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:36:28 -0800
X-CSE-ConnectionGUID: YOigyrWBT4CkDdWeIBkvHw==
X-CSE-MsgGUID: Tx7nrAnxR0CbrSj7XY8Qnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112090994"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:36:26 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6E481120433;
	Mon, 10 Feb 2025 12:36:23 +0200 (EET)
Date: Mon, 10 Feb 2025 10:36:23 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Val Packett <val@packett.cool>, Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] media: dt-bindings: i2c: add DW9719/DW9718S VCM
 binding
Message-ID: <Z6nWp3bpoiqpvpS-@kekkonen.localdomain>
References: <20250210082035.8670-1-val@packett.cool>
 <20250210082035.8670-2-val@packett.cool>
 <c2ff273a-bac5-4fa3-8339-ab722c9e63bf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2ff273a-bac5-4fa3-8339-ab722c9e63bf@kernel.org>

Hi Krzysztof,

On Mon, Feb 10, 2025 at 09:29:25AM +0100, Krzysztof Kozlowski wrote:
> > +  dongwoon,vcm-freq:
> > +    description:
> > +      The switching frequency for the voice coil motor.
> 
> Frequency is in Hertz, so use proper property unit suffix. BTW, you
> cannot add incorrect properties post-factum based on already accepted
> ACPI driver. This would be nice bypass of review, right?

What's actually configured here is the divisor (10 MHz clock, divisor seems
to be value + 2). It's similar to existing
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml . I prefer
this as it's much easier to use that in a driver (think of having values
like 1428571 in DT, too).

> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Drop.
> 
> minimum/maximum constraints
> 
> > +
> 
> No reset/powerdown gpios in the hardware?
> 
> Missing required block.
> 
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: dongwoon,dw9718s
> > +    then:
> > +      properties:
> > +        dongwoon,vcm-freq:
> > +          default: 0
> > +          enum:
> > +            - 0    # 5.00 MHz
> > +            - 1    # 3.33 MHz
> > +            - 2    # 2.50 MHz
> > +            - 3    # 2.00 MHz
> > +            - 4    # 1.67 MHz
> > +            - 5    # 1.43 MHz
> > +            - 6    # 1.25 MHz
> > +            - 7    # 1.11 MHz
> > +            - 8    # 1.00 MHz
> > +            - 9    # 0.91 MHz
> > +            - 10   # 0.83 MHz
> > +            - 11   # 0.77 MHz
> > +            - 12   # 0.71 MHz
> > +            - 13   # 0.67 MHz
> > +            - 14   # 0.63 MHz
> > +            - 15   # 0.59 MHz
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: dongwoon,dw9719
> > +    then:
> > +      properties:
> > +        dongwoon,vcm-freq:
> > +          default: 0x60

-- 
Regards,

Sakari Ailus

