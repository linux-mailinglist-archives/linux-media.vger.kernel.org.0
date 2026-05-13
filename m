Return-Path: <linux-media+bounces-61413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IsJMCFpBGpVIAIAu9opvQ
	(envelope-from <linux-media+bounces-61413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:05:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4EE532BE2
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F218B3111356
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A423FFAB0;
	Wed, 13 May 2026 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W1unUj1a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D1439023D;
	Wed, 13 May 2026 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673586; cv=none; b=Qeq7ITRldX6sAWsdptwGSIL4101HSa3mCbDG0YyXZ7oKRHa/e4fTvv0ZV+v24VrhWrFLf2mlxz2xrvv3Od+He/jOL2W3fdMY804SBRDOTUmy/kKzYG7K7N0LTD3/j9N9hjzrPZAW7cPQfZ6b/E/jeqC817+PFYpOLObCal5k8yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673586; c=relaxed/simple;
	bh=cEpEwbMJ0dYWdV/lcifL2bKTvaXZgn1iQfE4oO2C7KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAe55DB3zTPHfE6Uzo+zZrglPE5QQvMkuCX21JcSo161tH40J2OLQHAbwXHgblKuF6JkyfkXS9k4ztXonCcBeGmQiGknlZkA35wczTQ7vrjjdcUSsW3C3OefmWsaGJ3DaQboOQqTEIZs8uqaSvDvR/tdJwbUALFtj2f10NdjTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W1unUj1a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAFEF229;
	Wed, 13 May 2026 13:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778673575;
	bh=cEpEwbMJ0dYWdV/lcifL2bKTvaXZgn1iQfE4oO2C7KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1unUj1aB6CIj14iO9UQm8oSipGyNQS7eJWrxapyHgtbJSRZk//HcVQe/ujYrtWx5
	 7vthrgjmVyzHMaRkC/1/eruMzlUkxldGKyYK0Z4I7pUhKrqlw/QjKUnkISaVS7Nb7W
	 S3q/PJExVTQaKfUH+XyLj+2Nek+v1f6bBcxFUSv4=
Date: Wed, 13 May 2026 14:59:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: linux-media@vger.kernel.org, mario.limonciello@dell.com,
	sakari.ailus@linux.intel.com, tianshu.qiu@intel.com,
	tomas.winkler@intel.com, hverkuil-cisco@xs4all.nl,
	kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [REQUEST FOR GUIDANCE] =?utf-8?Q?Dell_?=
 =?utf-8?Q?Panther_Lake_IR_camera_=28HIMX1092_=2F_Synaptics_SVP7500_06CB?=
 =?utf-8?Q?=3A0701=29_?= =?utf-8?B?4oCU?= port-2 streaming gated by bridge
 secure-handshake
Message-ID: <20260513115941.GC244931@killaraus.ideasonboard.com>
References: <CAE_FnZKNn0TzpVi+kaDZd91WtO4FN9S9AtXd9UjQZfGDDsxgfA@mail.gmail.com>
 <20260513075036.GA244931@killaraus.ideasonboard.com>
 <CAE_FnZJ3P2uFOZhNorw-ZvTxrAPwBHrEZ5uHQvQ9Poz+pFew+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE_FnZJ3P2uFOZhNorw-ZvTxrAPwBHrEZ5uHQvQ9Poz+pFew+w@mail.gmail.com>
X-Rspamd-Queue-Id: 2A4EE532BE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,dell.com,linux.intel.com,intel.com,xs4all.nl,ideasonboard.com,lists.libcamera.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-61413-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 07:47:41AM -0400, Jake Steinman wrote:
> On Wed, May 13, 2026 at 3:50 AM Laurent Pinchart wrote:
> > On Tue, May 12, 2026 at 09:24:13PM -0400, Jake Steinman wrote:
> > > Hi all,
> > >
> > > Cold mail to a wide CC, sending once instead of many — apologies for the
> > > broadcast. Community Linux camera-enable effort on Dell PB16250 (Panther Lake,
> > > Synaptics SVP7500 bridge USB 06CB:0701). To my knowledge this is the first
> > > working Linux RGB camera on any Panther Lake laptop — OV08X40 streams at
> > > 28.57fps after our IRQF_ONESHOT stability fix in intel_cvs, independently
> > > reproduced on Dell XPS DA16260 + Fedora 44 Silverblue by another community
> > > user. IR (HIMX1092) does not stream, and I think we've narrowed it cleanly to a
> > > bridge-internal secure-auth handshake we can't trigger from outside the Vision
> > > driver stack.
> > >
> > > What works:
> > >
> > > HIMX1092 probes, chip ID 0x1091 confirmed, bound to ipu7-isys CSI-2 port 2, 1 lane
> > > Geometry aligned to Dell production (648×368 SGRBG10, from v81 graph_settings_hm1092 files)
> > > IPU7 firmware ACKs STREAM_START_AND_CAPTURE
> > > intel_ipu7_isys: "stream on CSI2-2 with 1 lanes" (RX listening)
> > > Sensor MODE_SELECT=0x01 ack'd, intel_cvs port-2 mipi config (0x830, verbatim
> > > Windows USBPcap, 5×52-byte chunked) returns 0
> > > Cape FW already at Dell v81 level (1.20.129.0, identical bytes)
> > > What doesn't:
> > >
> > > ZERO sof_event::csi2-2 in any test, including with RGB streaming concurrently at 28.57fps
> > > 10 host-side hypotheses falsified including geometry, format, MIPI replay
> > > verbatim, AE-kicks, vision_sensing flag, dual-stream
> > > Evidence the gate is bridge silicon: usbbridge.sys (Intel Vision driver,
> > > Windows) ships strings RESET_HANDSHAKE_CTX and 1_BRIDGE_STATE_TRIGGER_CTX. Dell
> > > v81 06CB0701.bin (1.97MB, magic VISSOCFW) is identical to what our cape boots.
> > > The handshake exists in cape FW; the trigger isn't a wire opcode visible in
> > > USBPcap, suggesting it crosses MEI/CSE.
> > >
> > > Pinging this group because the answer probably lives at the intersection: Mario
> > > (Dell upstream routing), Hans (camera-stack architecture, prior bridge
> > > enabling), Sakari/Bingbu/Tianshu (IPU7 maintainers), Hans Verkuil (V4L2 second
> > > opinion), Tomas (MEI/CSE if the trigger crosses HECI), Daniel (INT3472 — DSC0
> > > only exposes HANDSHAKE/IR_LED GPIOs, AVDD/DOVDD appear bridge-internal),
> > > Laurent/Kieran (libcamera once unblocked).
> >
> > This seems to be a question for Intel at this point.
> 
> Thanks Laurent — matches our read.
> 
> Sakari and Bingbu (V4L2 + IPU7 maintainers) are already on this thread, but
> my hunch is the answer lives one team over from them — the Vision-stack /
> CSE side that owns the per-sensor bridge auth, not the kernel-V4L2 side.

Note that Bingbu has left Intel. His e-mail address bounces, I've
dropped him from CC. Hans de Goede has also left Red Hat for Qualcomm,
I've updated his e-mail.

Please also note that I only review code written by humans. If you would
like me to be involved in this matter, please make sure to write your
code manually. This also applies to e-mails.

> Anyone from prior IPU3 / IPU6 enabling you've worked with who'd be the
> right contact for that conversation? Even just a "forward this to X" closes
> the loop — happy to take it from there.
> 
> > > Not asking anyone to debug — just a pointer on whether the secure-auth path can
> > > be exposed to a non-Vision-stack driver, or who at Intel/Synaptics owns that
> > > mechanism. Even "talk to <person>" is enormously helpful.
> > >
> > > Background + reproducer:
> > >
> > > - DKMS fix pack (v0.4, MOK-signed, single-command install):
> > https://github.com/
> > > jibsta210/svp7500-camera-fix-pack/releases/tag/v0.4
> > >
> > > - Forensic write-up + IR debug history:
> > https://gist.github.com/jibsta210/
> > > 8316b6a0bc58910891512945c4e91a08
> > >
> > > RELATED:
> > >
> > > https://github.com/intel/ipu7-drivers/issues/26
> > > https://github.com/intel/ipu7-drivers/issues/51
> > > https://github.com/intel/ipu7-drivers/issues/72
> > > https://github.com/intel/vision-drivers/issues/37

-- 
Regards,

Laurent Pinchart

