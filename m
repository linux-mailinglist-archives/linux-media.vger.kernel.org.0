Return-Path: <linux-media+bounces-65885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ri7NGBo8Qmqv2QkAu9opvQ
	(envelope-from <linux-media+bounces-65885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:34:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7E6D8452
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:34:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VCrvQBt1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65885-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65885-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 201C83037888
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460093F8883;
	Mon, 29 Jun 2026 09:29:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7423A7F47;
	Mon, 29 Jun 2026 09:29:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725381; cv=none; b=L8yrITNs8jcevC48WuagqJ5+0w8xUsLqbAPL6+N9/NpX1tULID31HCN2pKFGBbiinEzOCiBFn8ua6zy+9BWAUv85mEe0Nw89jx1BoYBCpOshOdWsfeAVayrj+J9uTrPrDD2brf0539h/fMM9V35AuwVioYpMUTcyQjSVYh5tX0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725381; c=relaxed/simple;
	bh=AWn1KV+6/qL3XbTEB7L9h/QUK3sltgM1+YhtYdcpiqg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kBw97csyBDsAx14Ur2fU1WivSR/qk3yq2xkHmTFQBKL9ngK9S4wQGbG44c02LSVD4JOiXwf4Yl6qUucF7nXOSUhn3ojJtHL8u0d0MdXjFVk2236s07E3g6kjpQvCKEHJHEq5Ocvr3uCHaOrhcQhgiFyuu87mTkQBuZen/RN1ds4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCrvQBt1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465301F000E9;
	Mon, 29 Jun 2026 09:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782725380;
	bh=o52YFyGvS5NPCCmoGubj6zdckoGrO3U79qH18BJYnj0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=VCrvQBt1KSdhbFstMyG+RSB6u+kO3ziz86RfGQxCJTWo8ALRdJSIXu6hY8cYTaDEu
	 wqfPby6N9OdapLTkEdEPL5HOC/OoDHWwIkEncCp2N3+yYjFAzydiqX+9VVZ5kKwL6C
	 EO+GyKscZkN3+EMeaOtGm/hkkyJQgpErgi75AuQ/2e5vwFEN/K41A/6TK5G2P3Ymv0
	 CsC976bI0DhP2wfJ2jY/GsQxgEkKnYYmb8K6xUxQE2NXtFjWXPB9paOz3A+hYzyv/u
	 LtlpNJGclPHocFncLDLiBfPeAhKzj0gzzjhsuikgXJEwfu1Ey04csxOmwrSBgegHNW
	 fdh2b7NNEVhrw==
Message-ID: <9d44c5e7-0abd-4f8c-a67a-8d967af968a1@kernel.org>
Date: Mon, 29 Jun 2026 11:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH 0/5] media: hws: add HDMI audio capture support
To: hoff.benjamin.k@gmail.com, mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260627014042.79127-1-hoff.benjamin.k@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260627014042.79127-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65885-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hoff.benjamin.k@gmail.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:hoffbenjamink@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7E7E6D8452

Hi Ben,

Something went wrong here when posting: instead of having a proper patch series,
all the patches are appended to the cover letter.

Please repost!

Regards,

	Hans

On 27/06/2026 03:40, hoff.benjamin.k@gmail.com wrote:
> From: Ben Hoff <hoff.benjamin.k@gmail.com>
> 
> This series prepares the AVMatrix HWS PCIe capture driver for HDMI audio
> capture by making the video DMA programming use the hardware BAR remap
> windows consistently, adding the shared scratch DMA arena required by the
> remap model, adding a video bounce path for the shared remap window,
> hardening queue ownership, and wiring up ALSA PCM capture support.
> 
> This driver is derived from a GPL out-of-tree driver. The baseline used
> for comparison is available at:
> 
>   https://github.com/benhoff/hws/tree/baseline
> 
> This series supersedes the earlier standalone submission at:
> 
>   https://patchwork.linuxtv.org/project/linux-media/patch/20260620173448.36279-1-hoff.benjamin.k@gmail.com/
> 
> Supersedes: <20260620173448.36279-1-hoff.benjamin.k@gmail.com>
> Assisted-by: codex:5.5
> 
> Validation:
> 
>   - Build checks passed with W=1 for the HWS driver as a module
>     (VIDEO_HWS=m) and through the built-in directory target
>     (VIDEO_HWS=y, producing drivers/media/pci/hws/built-in.a). C=1
>     builds completed for both configurations
> 
>   - v4l2-compliance 1.32.0, 64 bits, 64-bit time_t, passed
>       Total: 51, Succeeded: 51, Failed: 0, Warnings: 1
> 
>   - HDMI audio progressive validation passed. Coverage included ALSA
>     capture-device enumeration, advertised hardware-parameter checks,
>     48 kHz S16_LE stereo capture from an HDMI playback, WAV
>     header/size/nonzero-sample checks, captured rate/channel/format
>     verification, no reported XRUNs, no kernel warnings/errors during
>     capture, repeated start/stop capture cycles, 100 consecutive short
>     captures, and 1000 consecutive device open/close cycles.
> 
>   - ALSA period/buffer matrix validation passed at 48 kHz S16_LE stereo
>     with HDMI playback tone. Tested period/buffer frame pairs were
>     256/1024, 256/4096, 1024/4096, and 4096/16384; each case checked
>     that arecord accepted the requested hw params, capture completed,
>     the WAV artifact had valid header/size/non-silent content and the
>     expected rate/channel/format, no XRUN was reported, and no kernel
>     warning/error appeared during the case.
> 
>   - Mixed audio/video validation passed. V4L2 MMAP streaming was kept
>     active on an HWS video node while ALSA captured 48 kHz S16_LE stereo
>     audio from the matching HWS PCM device. The test checked that audio
>     capture completed, video streaming stayed active for the full run,
>     the WAV artifact was present, non-truncated, and non-silent, and the
>     kernel log delta did not contain warnings, errors, DMA faults, XRUNs,
>     overrun/underrun reports, or HWS timeout/stall diagnostics.
> 
>   - video tested with enabled_audio=0
> 
>   - pm_test=devices passes with and without D3hot.
> 
> Full platform S3/deep suspend is not considered validated, my system is
> unstable that I can't resume for deep suspend even without the driver
> 
> Ben Hoff (5):
>   media: hws: program video DMA through remap windows
>   media: hws: add shared scratch DMA arena
>   media: hws: add video bounce path for shared remap windows
>   media: hws: harden video DMA queue ownership
>   media: hws: add HDMI audio capture support
> 


