Return-Path: <linux-media+bounces-27138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ADDA4784E
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 09:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAC0B16D6B0
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 08:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BCD227B9C;
	Thu, 27 Feb 2025 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUxImtq1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73C622259F;
	Thu, 27 Feb 2025 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646413; cv=none; b=fCqEiM3DN52BZicr82bP7tTqfQhr1y7Q/umExLifj0MXoEXP0PwU0RantCkP2njNXSbRgKU2t3g0ipaTgY2crfXF0NUsgkaYMEhs+zKzgWT+v+Bz8NSdogQ+Xt4/XVCKU4psThS35QXhP9/0jz+Zm8GJbbTu60iXYPyURapDmBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646413; c=relaxed/simple;
	bh=7XhBsvx4K34GlScjfHZ2ZYt51wiZ+QIomrA0dhqnjKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE2uU71jrU0Nc/F/AXJqgpCADFF8w8hNpHlM+znmiiYHfvMLzmlrX0ALQVWAqH2pGHrTM6ilc+NFs43XY8n7I2fH6/kDqiwXdVdKbu3gEE7Q7+XoqUE69IIFDkHpzi+5wTpmxUAQv8JjeJm+zvh1WrjwLqCKc0N9qoXFLLpZHZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUxImtq1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740646410; x=1772182410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7XhBsvx4K34GlScjfHZ2ZYt51wiZ+QIomrA0dhqnjKE=;
  b=UUxImtq1hkXhNCf1Zuxnq7IAhgSD6NIwxNjRytG6Hz6u1QRvJbd0Hj2N
   qHWimnXdYWojHbSxvwXdCVE77y0Aok0hmc4M6WfMvToYSgKPCIKuvU4ns
   65Xln8JGcQUgyLHbV92QfeIH2dbbHb1VGdPZgA0PjdDfMjZbNYcCN3Gir
   N7+tWQl8CbOe4lh4Gy37/Y9joEXQODh8QhRQSkt6k7DbbxHSHfIYFrZtu
   JLok3DwAAUqIBuLPF6viAKjT6ILswE1lOM27+tbfqoVJudraK+MoL67vQ
   DsqwOgxN4Z9uMMF5SnRN7dQZv3Yc7Lvbc1mIBzmsBEAn08FKGIz31/r+O
   Q==;
X-CSE-ConnectionGUID: Yfw8frP3Q6Gp6GiOXrzIIQ==
X-CSE-MsgGUID: uVxHxmUfTuK9NE3YjTbb2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52163028"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="52163028"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 00:53:29 -0800
X-CSE-ConnectionGUID: bZFqNbkXQLWuSigpCGLw1Q==
X-CSE-MsgGUID: gfzvNCgqR223GEMoy2EK0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117138187"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 00:53:26 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A3CF411F944;
	Thu, 27 Feb 2025 10:53:23 +0200 (EET)
Date: Thu, 27 Feb 2025 08:53:23 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, manuel.traut@mt.com
Subject: Re: [PATCH v1 3/8] MT9M114: Add get_mbus_config
Message-ID: <Z8AoA6WjbXQufqR6@kekkonen.localdomain>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-4-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226153929.274562-4-mathis.foerst@mt.com>

Hi Mathis,

On Wed, Feb 26, 2025 at 04:39:24PM +0100, Mathis Foerst wrote:
> The i.MX6 camera frameworks requires get_mbus_config to be implemented.
> See [0].
> 
> [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216

The imx driver should really be fixed instead of working around a staging
driver issue in sensor drivers.

-- 
Regards,

Sakari Ailus

