Return-Path: <linux-media+bounces-17052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 856EB962D6B
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 18:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1BDCB24541
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0451A3BB8;
	Wed, 28 Aug 2024 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqKJGlga"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115301A4B9F
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724861681; cv=none; b=QwsONuPEfOoxr6RNSFw3+iupNMrrevgmtjmdHG6i/DdueUZ8PzFOJtl7VEBzu56Z2oRmpmgEeVZtbKGolB3kql/9Cj3PVZKsJ8NtigY7TedA0WyAJ5m8CIpUtT5VyNihqso55blpCJCsahiY2P5/aNQyHvSNeBkkFyn7hkrcIVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724861681; c=relaxed/simple;
	bh=MhiG3enw+ji0eAZ0R9BOt88yBzg78KB2GVTSPX+bXQY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fk+Me9Tp5g26lfluSbNNmygEJziq0pwfiIvYP0vZs2b+YLdAxjTU8zOZspj8u1//4AeK1si7YlrmcUZTH7XB8hxSHkWlMsErAscOqD5GOVOEUQ41ZMV1gz8AdtZq8PthTVoyQa+58OcpEd3K7D6kJbZLqo/Ra7dDp+YLwdUc5yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqKJGlga; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724861679; x=1756397679;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=MhiG3enw+ji0eAZ0R9BOt88yBzg78KB2GVTSPX+bXQY=;
  b=mqKJGlgaEtFI654bNanWl6z91nnM3FiVOpkoz/8dC+mfny0y9QIGmAp0
   k5FoJ0s8EffHPaK7kY7xRaQ1KVZEyo4Vt/wuz35Es0j9hkpT3qShYL3tx
   9i5Wenr+4ihgXMTMmOk4Fl2o1b3UEE1qT0ntMXjbWsp9jQsgfxZevdFIl
   DfU7GgfGOtl+PwN3pbEHx3tgjaMehKISWn3b2cVKUWzkDKUQ1I99TIJuE
   9V2vNXg3osn2D+0hlxrN1kyFPKGhmyC7lzKVGPeGvMEzdd4h2qPf4lo1p
   OvK29Ja6JQslb9c1jesrNXOXO1qlXdbFpoxTjc3Sxv2qaEQampB/OVnO2
   g==;
X-CSE-ConnectionGUID: SoBkhY+gTsW+2rTnGs23KQ==
X-CSE-MsgGUID: 4y6oXlMyRG2bdD9LSlYn9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33974263"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="33974263"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 09:14:39 -0700
X-CSE-ConnectionGUID: 7pymODndTPqT2wefrOo4cw==
X-CSE-MsgGUID: 7bLdXbTFTP+eGER7tpKENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="67626249"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.110])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 09:14:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/7] media: v4l2-core: add v4l2_debugfs_if_alloc/free()
In-Reply-To: <e50c59a6-dd2d-4692-a3b1-e67fce043683@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
 <931a281c72e9c3081eaedc2d76806ebd770a0913.1724855053.git.hverkuil-cisco@xs4all.nl>
 <87jzg0y9bg.fsf@intel.com>
 <e50c59a6-dd2d-4692-a3b1-e67fce043683@xs4all.nl>
Date: Wed, 28 Aug 2024 19:14:31 +0300
Message-ID: <87ed68y68o.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 28 Aug 2024, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 28/08/2024 17:08, Jani Nikula wrote:
>> I recently discovered a lot of drm depending on getting seq_file.h and
>> debugfs.h via media/cec.h...
>
> Patches are welcome!

I've got the patch, just need to get these [1] reviewed and merged
first...

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1724689818.git.jani.nikula@intel.com


-- 
Jani Nikula, Intel

