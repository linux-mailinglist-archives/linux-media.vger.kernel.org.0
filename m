Return-Path: <linux-media+bounces-31719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E9AA977F
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 17:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE1051884D3C
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 15:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7986136;
	Mon,  5 May 2025 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8sGgxqH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4576025D1E1
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458794; cv=none; b=VOfyaKYidCa2od8CbZFLSH5V/6kb9d6oj3XDDJd9ifBx3zhfUY8saiiboBVX0INdGpYr+8BjHoSogq0q75otObewpvXeczoa6Atnzb3px8DzdYMS6cKzC2LSVkyry26BcyHhdFhp0r9OuHD7Zy1rGNUzvEmwbygvaW2MrguOmvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458794; c=relaxed/simple;
	bh=+7ZvaAH1ov6WTjRc/sK58Q8YthEL9Hdka6roHB/Bnq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1Qb9A6jHKncYcvhBVsIECpJgrSFsh8fJMNKDV2OPIeFy2xnJQap8GCPp+NtlzMh/R3vg6IrQfUBvhQhqcbv9JZum1DlbT6/dlQ1ASIs6OJVhrZv2+8OklmHwrGsgjD06XddnyJXK2ELGD7Rhumcp05Hx70qxmEQDtT5NDYOWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8sGgxqH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746458793; x=1777994793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7ZvaAH1ov6WTjRc/sK58Q8YthEL9Hdka6roHB/Bnq4=;
  b=U8sGgxqHwFalMfwt53mMRbNKhS7Rxa64KQsoSrHBGKFH2jcXaVYQ5Lr4
   rYXIBLUmCWyoJ391Y9DHg+FNfbdAY8I/pVWmHJhM5BeitlVhRJ6QF/I5t
   YuQ5BDQWZsBrYZiA+8P07ipnCbD5DnGMJYHbkeKgmBi0U8PfDJaN4WXej
   w/XZWMAYGQCZSSGKQcjU/V7FYjN47eBBiTmfmzUN4Z7uzTgph86avw3jp
   lLQu0qHqRF7/ISv4Ja74hVCCSX4FM/Frtw4IPXTUetqfAa33GIdEgQVQX
   a9TxvHQFy15rY4hc3RxYfgzi5wm90bJp7UO0rqpyDUNXf+lXJYacrZO9j
   Q==;
X-CSE-ConnectionGUID: PDS9t15wTcWoimFCbYbUBQ==
X-CSE-MsgGUID: W3sPChVNQpa5MUgsvODuhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59062302"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="59062302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 08:26:32 -0700
X-CSE-ConnectionGUID: km55bGybQjGEQjP55SIlKQ==
X-CSE-MsgGUID: EBgjQYebTbmLv2qorur9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140060289"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.252])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 08:26:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2E63711F828;
	Mon,  5 May 2025 18:26:22 +0300 (EEST)
Date: Mon, 5 May 2025 15:26:22 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v4)
Message-ID: <aBjYnrvg-_T-7xRi@kekkonen.localdomain>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>

Hans, Laurent, others,

On Fri, May 02, 2025 at 10:15:27AM +0200, Hans Verkuil wrote:
> 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
> 
> Please reply with corrections, questions, etc. to the agenda.

As it seems we might have a little bit of time left, I'd like to propose a
keysigning party we haven't done for a few years now. We have some new
people here and the folks who have been around for longer have new keys,
too.

This is what we did the previous time
<URL:https://lore.kernel.org/linux-media/YxhplLKtRAQzlSK/@pendragon.ideasonboard.com/>.

I wonder if Laurent would like to do the same this time around. I can also
help with the arrangements.

Instead of key servers, there is
<URL:https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/>. For initial
fingerprint distribution, e-mail or an editable document (over HTTPS)
probably works the best. I can provide an e-mail address / URL in case
there's a need to.

-- 
Kind regards,

Sakari Ailus

