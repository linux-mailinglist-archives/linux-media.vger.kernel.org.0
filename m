Return-Path: <linux-media+bounces-58607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBpUJpWk22ldEgkAu9opvQ
	(envelope-from <linux-media+bounces-58607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 15:56:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 291B93E416E
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 15:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4DC43003D12
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 13:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AB22FD681;
	Sun, 12 Apr 2026 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEUqgcAH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929852F532C
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776002185; cv=none; b=Y/71ZRd8XXAMVTEjK3QNOZ6lcV2eQ1jtjKFrrGQsMTdhSXFX4SOZ7uLJMTgNxwWxJWx/YVjwbbqBO3QG91PQ0smiTBH7Vc88Yu0IQ++LrQYowx37u94BWNfPZdUnTrHvtDiN/RpucCkS7acvnhWjG0PmfeSfqc8C0qSPU1fDbI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776002185; c=relaxed/simple;
	bh=cnE44AiMumkr8qUlxDm7dUJtEc2GsQxAe1ZUGivOx+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKgT7+nawcIq3iagjiK2O+y1jW+hgxb2qmm8onsv5eFfv8GAIuWwh94GQoM6DkwWgXoTlobTLtubBxwucHanBLPrpedxHa3ZwxDjiTDQV6zSEGU0q2JZmk1BFB66w6w3mXCHb2EocddEwNNNNT5+cuheBXwsPGBWn7VEtIqDrZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEUqgcAH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776002183; x=1807538183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cnE44AiMumkr8qUlxDm7dUJtEc2GsQxAe1ZUGivOx+M=;
  b=oEUqgcAHrghHpwpxKm3O0fP83R2MIUt+l9XyCD/1C/iek79R0u/Oac00
   VwOB2Ruj9cK6OY1seuj8sKuGTrGroe7MiZz4NyZ+yjvUE7m4eIDhV7s7b
   4P4rNwTsz8DPNi6Ilet4cvEfY8rjTihCSpvM1c5IamQM/1AKNFsc0ykNk
   9uT9pzPlp87Lo7Zjb6SHnIDsJXn4F1eHAJJNIJWb3DSZ9T2JQc8A06oks
   ntFpLVSyKYHRQpcwgVPqSNUoBuDybV6tigqWzJzWlc6LZIiB+f7yYXX9f
   1Wj57e638ec8m2fk5KlCttVzI8vZEkz6I6IPMFmoU803YfwxcUDu9JjUM
   A==;
X-CSE-ConnectionGUID: nLpfr6N2RQ+7KPxaBydvqg==
X-CSE-MsgGUID: w1qkY5oiQVSND6/rN8+yVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="87247016"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="87247016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 06:56:23 -0700
X-CSE-ConnectionGUID: 9qCFEknWROa4u7SV7Osxiw==
X-CSE-MsgGUID: 2dwJzvHgSG+NSsP1NgggmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="226837647"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.227])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 06:56:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1365E11FA2D;
	Sun, 12 Apr 2026 16:56:33 +0300 (EEST)
Date: Sun, 12 Apr 2026 16:56:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
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
	Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans de Goede <hansg@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Brandon Brnich <b-brnich@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Padhi, Beleswar" <b-padhi@ti.com>,
	"Donadkar, Rishikesh" <r-donadkar@ti.com>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
Message-ID: <adukkATODDw7CNHY@kekkonen.localdomain>
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-58607-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 291B93E416E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Sun, Apr 12, 2026 at 12:25:39PM +0200, Hans Verkuil wrote:
> As you can see, there is still some available time for other topics.

I'd like to add:

Title: Common raw sensor model, streams, metadata and metadata series status
Presenter: Sakari Ailus
Time estimate: 45 minutes (depends heavily on how much there will be
discussion)
Descriptition: The Common Raw Sensor Model defines a new UAPI for camera
sensors in Linux. It provides a more useful UAPI for configuring camera
sensors than the existing practice is. The metadata series includes the
Common Raw Sensor Model and a number of other improvements, such as generic
raw formats, metadata support and finally enabling the streams UAPI.

-- 
Kind regards,

Sakari Ailus

