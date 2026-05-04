Return-Path: <linux-media+bounces-60231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJtJDmA8+GkArwIAu9opvQ
	(envelope-from <linux-media+bounces-60231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:27:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E444B8E1C
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47D143010C30
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0546229DB6C;
	Mon,  4 May 2026 06:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVkLOAOD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E518787A;
	Mon,  4 May 2026 06:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777875942; cv=none; b=MyLL10E56yfop8ucYFnoHIXZm5D55UyyBHpxFatORFuSiAmO853903qDLzzuRJLzeUF99KiuYdCjBFHpAmsFdLLLs5gKhNr7r0hJPFLKxGKpWEBSQ2CAcNGBnSoC0al2hJyxrhhubeJSPDXQU2O8HTaOyRk77GSeoKXJNAx/1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777875942; c=relaxed/simple;
	bh=2nDCB3D88PqF+O9PM4yjlpENbUjiTFX5ipMxUaCbwjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyaSxJxV48iAfcgxIAygt7SY3uAozYa6liQ2RUdixj2zipH0/GeBXvHXQpJkzONjgvjRHgYlUQ6c4/+2pmIspXtxRPqtSO637CEOOGICpI9TQnSGIAoTg/IvIV4Y0VI7Pjh9VbyUtRyEVKDtskbzImO54hUA3aJ/YzW0xxE8rbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVkLOAOD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777875940; x=1809411940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2nDCB3D88PqF+O9PM4yjlpENbUjiTFX5ipMxUaCbwjE=;
  b=DVkLOAODVCKEhbKXuTe1E+B9q8ulGUThACxZGxRZAVxKUtXxZy8PETos
   R9LOBa+8pmIrsav9i8zya84LbkeQFWHnkz5j9nHcDS+rn+0nwjt3fG0t7
   Qn41lMHMOa0Yt4f463EZr5OJXhSnj+wdkMK6VfjNtssttwnlVowqtAETT
   e7qw42eNnHVxzYi+JCwN9YAuNlx2qzAnw/f1hsFp7UdMNAENqXfuutILy
   aQDcASfG+paMjBTPjQjy3rib8oxDIDR/C+Xh+uXuiVol4U88AWP89ub13
   W7QxvF+vft5LWrieZyepDtwUjrhM/Rm7gPb2ofqODTPuKtkSowXbX5ysV
   A==;
X-CSE-ConnectionGUID: zPRG5H0BSuKe8A8uMQSQHA==
X-CSE-MsgGUID: 8HednQmATayi7ckHsfn+hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77750791"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="77750791"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:25:39 -0700
X-CSE-ConnectionGUID: lDTL1ywCT5iOPKh/VJ6Crw==
X-CSE-MsgGUID: J+Kg0iPDTWuQ3x/K8oTdfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="235311658"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.114])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:25:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3007A121CC4;
	Mon, 04 May 2026 09:25:37 +0300 (EEST)
Date: Mon, 4 May 2026 09:25:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 0/6] media: lm3560: convert to use OF bindings
Message-ID: <afg74VQClpQ58imf@kekkonen.localdomain>
References: <20260503164445.215540-1-clamor95@gmail.com>
 <CAPVz0n1n1qrA=VdCGCwYcGFBfN6aaTULq9OKVa5=mmHMFNkDvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1n1qrA=VdCGCwYcGFBfN6aaTULq9OKVa5=mmHMFNkDvQ@mail.gmail.com>
X-Rspamd-Queue-Id: 86E444B8E1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60231-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]

Hi Svyatoslav,

On Mon, May 04, 2026 at 08:35:44AM +0300, Svyatoslav Ryhel wrote:
> нд, 3 трав. 2026 р. о 19:44 Svyatoslav Ryhel <clamor95@gmail.com> пише:
> >
> > Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
> > Remove platform data and switch to OF device tree bindings.
> >
> > ---
> > Changes in v5:
> > - schema adjusted to take into account lm3559
> > - device_for_each_child_node > for_each_available_child_of_node
> > - lm3559 and lm3560 configuration was diverged with data match
> > - removed redundant header
> >
> > Changes in v4:
> > - fixed current being off by 10 in schema
> > - label property from schema replaced with modern equivalents
> > - lm3560_init_device moved before subdev registration
> > - v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
> > - added subdevice cleanup if second led registration fails
> > - added check if "reg" property exists for LED nodes
> > - added missing fwnode_handle_put if device loop fails
> > - added bitmap to monitor configured LED id
> > - added pm_ptr() macro for PM operations pointer
> >
> > Changes in v3:
> > - added note regarding lm3559 in the schema commit
> > - lm3560 power on/off functions converted to be part of PM,
> >   dropped redundant wrappers
> >
> > Changes in v2:
> > - vendor properties swapped with generic LED properties
> > - added mutex lock usage optimization
> > - power supply and enable gpio commits squashed into PM
> >   configuration since they are both required in making
> >   proper on/off sequence.
> > ---
> >
> > Svyatoslav Ryhel (6):
> >   dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
> >   media: i2c: lm3560: Fix v4l2 subdev registration
> >   media: i2c: lm3560: Optimize mutex lock usage
> >   media: i2c: lm3560: Convert to use OF bindings
> >   media: i2c: lm3560: Add support for PM features
> >   media: i2c: lm3560: Add proper support for LM3559
> >
> >  .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++
> >  drivers/media/i2c/lm3560.c                    | 385 +++++++++++++++---
> >  include/media/i2c/lm3560.h                    |  84 ----
> >  3 files changed, 481 insertions(+), 151 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> >  delete mode 100644 include/media/i2c/lm3560.h
> >
> > --
> > 2.51.0
> >
> 
> Hello Sakari!
> 
> During preparation of this patchset 2 important issues were not
> tracked and discovered only after sending.
> 
> 1. In "dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver"
> 
> flash-max-microamp and led-max-microamp ranges of lm3559 and lm3560
> pattern properties were swapped.
> 
> 2. In "media: i2c: lm3560: Convert to use OF bindings"
> 
> In the lm3560_probe struct device_node *node should be removed and
> for_each_available_child_of_node should be replaced with
> for_each_available_child_of_node_scoped
> 
> I am sorry for this inconvenience. If you find it suitable to adjust
> these commits on apply feel free to do so, alternatively I can fix
> them in the next iteration.

Ack, I have a few comments on the set as well; please address the issues in
v6.

-- 
Kind regards,

Sakari Ailus

