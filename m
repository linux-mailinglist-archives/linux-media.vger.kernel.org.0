Return-Path: <linux-media+bounces-4785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CAE84C55D
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 08:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D93B28D86B
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 07:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABE51CFAB;
	Wed,  7 Feb 2024 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9ZaqmQU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19651CF87
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 07:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707289237; cv=none; b=UrrY54LB0uzPFsLC4yJLApE+pL+Qo3LPiQWv3dPNPiORg5IIkM+rlUwtix0aVIS9JV6xP59AS19Ox8Rg7tJ3g/jEa798Ubh+3WHxXl9k/xTwU4BS3GNMbURR61WjQOCSX1ET2eIOE22jxKE/KAEKmhk4BssnOZqnUMFV2ln/XOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707289237; c=relaxed/simple;
	bh=re7d2+pj4Cwr4Seb19fg5BE4a1EsKbVQT/ysi0XgE2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rh3D5mcaee0SOi0AheqvM3veCEworhSn9bCi6+TvbsAEaRB0wG89857Lf1t7acQK0bMK5xak3qDaS+8wDpEzuK5qhBdyFl/0PiOIAM8tbYTdbTv1+TjzjUj40FJFbEEzrk7hy9M3liS+7/Cx2Q0V1ZZzgwqXXoKIysnBGMmrlJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9ZaqmQU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707289236; x=1738825236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=re7d2+pj4Cwr4Seb19fg5BE4a1EsKbVQT/ysi0XgE2s=;
  b=Q9ZaqmQUYd0iSqfbOKtICazieTYViv92DeUG5NI7UEc4kaPAyJGypE7Z
   dG+y2kQpy50rjHXsWQZrM4oOS8ZpFKPLKiNocCMAM07SwH7AEhuxweMDx
   bIQ1XF75pZG/dioJtVU4dTU7FS1hhWRTJwGvQwvLYJA2bhVQWQRUdFAlg
   pd6XzPsxQWCTVfyJvqgLyodwopcX7v9q8SEy6RFcWmOdnAmVHce21/Ige
   ISzbMoBS/CRIxcu9bPK6EYslK593eTgqgmCEta9HSP5ZuEoQm5+4uQAZt
   yhb1jp+9W21fnQt1xXLLBrJM2R0trXlVT6ivNUe5TulmZVXprrZ8e6bv8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4737936"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="4737936"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 23:00:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="824416358"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="824416358"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 23:00:30 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 47FAA11F89A;
	Wed,  7 Feb 2024 09:00:27 +0200 (EET)
Date: Wed, 7 Feb 2024 07:00:27 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
	claus.stovgaard@gmail.com, tfiga@chromium.org,
	senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <ZcMqizLGUVLfydem@kekkonen.localdomain>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024112924.3934228-1-bingbu.cao@intel.com>

Hi folks,

On Tue, Oct 24, 2023 at 07:29:09PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch series adds a driver for Intel IPU6 input system.
> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
> device which can be found in some Intel Client Platforms. User can use
> IPU6 to capture images from MIPI camera sensors.
> 
> IPU6 has its own firmware which exposes ABIs to driver, and communicates
> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
> the driver sets up a page table to allow IPU6 DMA to access the system
> memory.
> 
> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.

I've made some changes on top of this (besides some done by Bingbu). I've
pushed the current patches here
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=ipu6>. What's
changed:

- CSI-2 port address calculation simplification.

- Tested (and fixed) driver probing on a Dell XPS 9315 that has IVSC and
  Linux camera description that ignores the IVSC. This works if the
  intel-ipu6 driver is first removed and then re-probed. I'm not quite sure
  why it doesn't re-probe on its own yet. I haven't tried streaming yet.

- The patches are on top of the metadata set. If you want to try without,
  just drop the metadata patches (and the last functional driver patch). It
  might compile. I'll test this soon, too.

So overall there's some progress but work remains to do. I'll post the IVSC
and ACPI patches after a little bit more testing.

-- 
Regards,

Sakari Ailus

