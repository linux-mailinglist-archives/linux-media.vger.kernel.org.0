Return-Path: <linux-media+bounces-23055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DAF9EB0BC
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 13:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 084BF284694
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEC11A3AA8;
	Tue, 10 Dec 2024 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jhx7NFto"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC6D1A2567;
	Tue, 10 Dec 2024 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733833508; cv=none; b=bvOB/oO3v9pQ2OqYYsbibAKs8rO1yT6KWcuVIzzzoHGFXvMQlu6g26sbzM0mEiYO9jVPdMhFHXQC6yKIxbfm11hUboLPKpR1vI/GgG5e07haUp5J8ZbHeOqJ9E1AzM17/WP/HwEyoiswS1MXsgJlbkyE8W62ZSTcPFVaTnwKf/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733833508; c=relaxed/simple;
	bh=PtpvYsMJyPeHOPuFEZLTbXjEUkdt+zwt+rEBAt8uJ3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LlRmcYgDqIwZ1A0dq8oCmg+FIFxrshEzTkM0ZMkn6AU6+O4YRTtlIdh/ItBPi9calogKGulmRN/fxw41dSfSwEveN0E4qoZKbTsVJYKM2IP4pP5yzCQ2OIIgjTH2IkOwpsP+W559556jMzkgq/8UGHhT2ry/bEJyXCpPokt/hQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jhx7NFto; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733833506; x=1765369506;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=PtpvYsMJyPeHOPuFEZLTbXjEUkdt+zwt+rEBAt8uJ3Y=;
  b=Jhx7NFtoD8oOjenpzGkRGx0lrQh2+11AMRf7Rz9LgfrQ08N3r6cOF+mt
   ZUbxd9jbcP4n9t+Z76nwMlK+ZyYajDbcE195wAgQKYXxuurmp+sBoQsVF
   h4icikCfzd+MUDFYozL4I14lNRC6Hug0LgAADvm4bhwCH8pXF8YVgWdCJ
   Gesh7Oa5nC+tfzn4JJ39BkHB8rs3xce1/3wx52VjQszN3b9l1WPJcimR2
   r0V8BEFjwlaOQSDVyfnKdWGkGvYY2IS65hyyqW/b88c8dLSna/GTk3AJ0
   /+bDRQEF1CgAm6q/FAwkKPb+rOjKygTbaxk6KNZi8ibFcUybw/YXBxZCT
   Q==;
X-CSE-ConnectionGUID: +efoj7+5TmGBPqbUZDrADQ==
X-CSE-MsgGUID: U3h76SIyS8WbH566MOiW+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44642684"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="44642684"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:25:05 -0800
X-CSE-ConnectionGUID: kWML3+0tSpilYVrYcaMz1A==
X-CSE-MsgGUID: 8MwiVfTRSpmx3tv+RKDm8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="126296168"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:24:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Genes Lists <lists@sapience.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, stable@vger.kernel.org,
 linux-media@vger.kernel.org, bingbu.cao@intel.com, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
In-Reply-To: <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
 <Z1fqitbWlmELb5pj@kekkonen.localdomain> <87seqvzzg6.fsf@intel.com>
 <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
Date: Tue, 10 Dec 2024 14:24:56 +0200
Message-ID: <87bjxjzpwn.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Dec 2024, Genes Lists <lists@sapience.com> wrote:
> On Tue, 2024-12-10 at 10:58 +0200, Jani Nikula wrote:
>> On Tue, 10 Dec 2024, Sakari Ailus <sakari.ailus@linux.intel.com>
>> wrote:
>> > Hi,
>> >=20
>> > > ...
>> > > FYI 6.12.4 got a crash shortly after booting in dma_alloc_attrs -
>> > > maybe
>> > > triggered in ipu6_probe. Crash only happened on laptop with ipu6.
>> > > All
>> > > other machines are running fine.
>> >=20
>> > Have you read the dmesg further than the IPU6 related warning? The
>> > IPU6
>> > driver won't work (maybe not even probe?) but if the system
>> > crashes, it
>> > appears unlikely the IPU6 drivers would have something to do with
>> > that.
>> > Look for warnings on linked list corruption later, they seem to be
>> > coming
>> > from the i915 driver.
>>=20
>> And the list corruption is actually happening in
>> cpu_latency_qos_update_request(). I don't see any i915 changes in
>> 6.12.4
>> that could cause it.
>>=20
>> I guess the question is, when did it work? Did 6.12.3 work?
>>=20
>>=20
>> BR,
>> Jani.
>
>
>  - 6.12.1 worked
>
>  - mainline - works (but only with i915 patch set [1] otherwise there
> are no graphics at all)
>
>     [1] https://patchwork.freedesktop.org/series/141911/
>
> - 6.12.3 - crashed (i see i915 not ipu6) and again it has      =C2=A0
>     cpu_latency_qos_update_request+0x61/0xc0

Thanks for testing.

There are no changes to either i915 or kernel/power between 6.12.1 and
6.12.4.

There are some changes to drm core, but none that could explain this.

Maybe try the same kernels a few more times to see if it's really
deterministic? Not that I have obvious ideas where to go from there, but
it's a clue nonetheless.

BR,
Jani.


--=20
Jani Nikula, Intel

