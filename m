Return-Path: <linux-media+bounces-61417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA1zDqFvBGprIQIAu9opvQ
	(envelope-from <linux-media+bounces-61417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:33:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F13B53311F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F26F1302AE2E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4873B41B352;
	Wed, 13 May 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crKXcb1Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752C413226;
	Wed, 13 May 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675579; cv=none; b=EmOHXqnMO3d7utHGML85nlwzDqNCMs3r9W2nTb2UC91jJyZrFB4upJtN6xl1DJWQjBuIrzSheOO5N32/fDkIMhav9ehdhZL2hUlQi9nlhvnZsFaG4WoEJ5ogdVKUBeoMPBEBzw13639Yk+IpRetHnkd5vXKN076iigo9HYxiB7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675579; c=relaxed/simple;
	bh=KfJbmQ49yPB9dVDEbOUDeyY4y46fBYTbvuKLgHsNQnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2Gnv00+PW5SPsZ5FQ2Z5XQ8pWbS68GpbIOnF3TP8rqk2surfNV9Y/2UBipKK/yQ/8eWZtkZGZ2C4vyS6zp97/UIo/qsJofq5JM5yE/b5Dha2le0GQG44In1nH8R2NmAUH7HgM3q5hwJIgGLa+UXUDGxs+S/IgrRmqgByUl8RLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crKXcb1Y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778675579; x=1810211579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KfJbmQ49yPB9dVDEbOUDeyY4y46fBYTbvuKLgHsNQnE=;
  b=crKXcb1YIFDNVKs14aTSc9saX3Gz7u+aMAeCLWvYkS019nr2iUfJd8i5
   PsB98cl+ESh3GZ7xRlj8D796h62sRq4f9CCFBJd8M/IuPPOVDyWMuYuYy
   dXqPDsB+a/1QCW5/z3OSjP5qbg5VtMdhEnWaXWPpiZcmyzyXjVo2OeFhL
   H9/H6DiwxbpBIhYmXJq8UFVsCFIgLp+alOg/3WF++SCPfVUR2/y4Ynm4N
   VhRMJ/B1zNvQsKUkbsZTtAKZpwpTpCxaynts0Mi6v7DhkqF3QrsRdX8X1
   nYQRj9Cuzg3orhHcBZVkuNvqUNCI27b+1RNi0MzxNcnmbFXa+XXEFZI+i
   A==;
X-CSE-ConnectionGUID: Jn0ZvKAYRcqLwIiNUUfv7g==
X-CSE-MsgGUID: wlpowjgKS+yCOBPAOAkyyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="105060237"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="105060237"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:32:58 -0700
X-CSE-ConnectionGUID: IPoT+vDpRNqlbXAxCN9ujQ==
X-CSE-MsgGUID: 7fva0Ly+R02vfC8U5r37wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237972472"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:32:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BD376121CA3;
	Wed, 13 May 2026 15:32:52 +0300 (EEST)
Date: Wed, 13 May 2026 15:32:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: linux-media@vger.kernel.org, mario.limonciello@dell.com,
	hdegoede@redhat.com, bingbu.cao@intel.com, tianshu.qiu@intel.com,
	tomas.winkler@intel.com, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
	dan.scally@ideasonboard.com, platform-driver-x86@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Miguel Vadillo <miguel.vadillo@intel.com>
Subject: Re: [REQUEST FOR GUIDANCE] =?utf-8?Q?Dell_?=
 =?utf-8?Q?Panther_Lake_IR_camera_=28HIMX1092_=2F_Synaptics_SVP7500_06CB?=
 =?utf-8?Q?=3A0701=29_?= =?utf-8?B?4oCU?= port-2 streaming gated by bridge
 secure-handshake
Message-ID: <agRvdKI9nj4qwDt8@kekkonen.localdomain>
References: <CAE_FnZKNn0TzpVi+kaDZd91WtO4FN9S9AtXd9UjQZfGDDsxgfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE_FnZKNn0TzpVi+kaDZd91WtO4FN9S9AtXd9UjQZfGDDsxgfA@mail.gmail.com>
X-Rspamd-Queue-Id: 8F13B53311F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,dell.com,redhat.com,intel.com,xs4all.nl,ideasonboard.com,lists.libcamera.org];
	TAGGED_FROM(0.00)[bounces-61417-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Jake,

Cc'd Miguel and fixed libcamera domain.

On Tue, May 12, 2026 at 09:24:13PM -0400, Jake Steinman wrote:
> Hi all,
> 
> Cold mail to a wide CC, sending once instead of many — apologies for the
> broadcast. Community Linux camera-enable effort on Dell PB16250 (Panther
> Lake, Synaptics SVP7500 bridge USB 06CB:0701). To my knowledge this is the
> first working Linux RGB camera on any Panther Lake laptop — OV08X40 streams
> at 28.57fps after our IRQF_ONESHOT stability fix in intel_cvs,
> independently reproduced on Dell XPS DA16260 + Fedora 44 Silverblue by
> another community user. IR (HIMX1092) does not stream, and I think we've
> narrowed it cleanly to a bridge-internal secure-auth handshake we can't
> trigger from outside the Vision driver stack.

Miguel is upstreaming the CVS drivers
<URL:https://lore.kernel.org/linux-media/20260505223005.84162-1-miguel.vadillo@intel.com/>
so now downstream drivers should soon be needed anymore (for capture).

> 
> What works:
> 
> HIMX1092 probes, chip ID 0x1091 confirmed, bound to ipu7-isys CSI-2 port 2,
> 1 lane
> Geometry aligned to Dell production (648×368 SGRBG10, from v81
> graph_settings_hm1092 files)
> IPU7 firmware ACKs STREAM_START_AND_CAPTURE
> intel_ipu7_isys: "stream on CSI2-2 with 1 lanes" (RX listening)
> Sensor MODE_SELECT=0x01 ack'd, intel_cvs port-2 mipi config (0x830,
> verbatim Windows USBPcap, 5×52-byte chunked) returns 0
> Cape FW already at Dell v81 level (1.20.129.0, identical bytes)
> What doesn't:
> 
> ZERO sof_event::csi2-2 in any test, including with RGB streaming
> concurrently at 28.57fps
> 10 host-side hypotheses falsified including geometry, format, MIPI replay
> verbatim, AE-kicks, vision_sensing flag, dual-stream
> Evidence the gate is bridge silicon: usbbridge.sys (Intel Vision driver,
> Windows) ships strings RESET_HANDSHAKE_CTX and 1_BRIDGE_STATE_TRIGGER_CTX.
> Dell v81 06CB0701.bin (1.97MB, magic VISSOCFW) is identical to what our
> cape boots. The handshake exists in cape FW; the trigger isn't a wire
> opcode visible in USBPcap, suggesting it crosses MEI/CSE.
> 
> Pinging this group because the answer probably lives at the intersection:
> Mario (Dell upstream routing), Hans (camera-stack architecture, prior
> bridge enabling), Sakari/Bingbu/Tianshu (IPU7 maintainers), Hans Verkuil
> (V4L2 second opinion), Tomas (MEI/CSE if the trigger crosses HECI), Daniel
> (INT3472 — DSC0 only exposes HANDSHAKE/IR_LED GPIOs, AVDD/DOVDD appear
> bridge-internal), Laurent/Kieran (libcamera once unblocked).
> 
> Not asking anyone to debug — just a pointer on whether the secure-auth path
> can be exposed to a non-Vision-stack driver, or who at Intel/Synaptics owns
> that mechanism. Even "talk to <person>" is enormously helpful.
> 
> Background + reproducer:
> 
> - DKMS fix pack (v0.4, MOK-signed, single-command install):
> https://github.com/jibsta210/svp7500-camera-fix-pack/releases/tag/v0.4
> 
> - Forensic write-up + IR debug history:
> https://gist.github.com/jibsta210/8316b6a0bc58910891512945c4e91a08
> 
> RELATED:
> 
> - https://github.com/intel/ipu7-drivers/issues/26
> https://github.com/intel/ipu7-drivers/issues/51
> https://github.com/intel/ipu7-drivers/issues/72
> https://github.com/intel/vision-drivers/issues/37
> 
> -
> 
> Thanks,
> 
> 
> --
> 
> *Jake Steinman*

-- 
Kind regards,

Sakari Ailus

