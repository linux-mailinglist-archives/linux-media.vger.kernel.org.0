Return-Path: <linux-media+bounces-51938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN/UE3m6f2kjwwIAu9opvQ
	(envelope-from <linux-media+bounces-51938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:41:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB65C7358
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01B9330010C5
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 20:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921B82D1936;
	Sun,  1 Feb 2026 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hSS6NVve"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD642192EE;
	Sun,  1 Feb 2026 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769978486; cv=none; b=dkRuLpm5UAjkb6Jc4BMwksoy6CG7AnoHdZdicH2gGPNXrE2UxZxtBIwhBqf4Y0hO0L5Zzjnokyl4Iwud6TfqpsepxdEGr9eprRP5QqsaiIGFfuKMNFsJmljH0v2Hk6sJpa+l4A1mVfjsc7FxJxoPZ7dGHeuKyqm+AQYidqIbUvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769978486; c=relaxed/simple;
	bh=O5MqS4DeuIAmbItW7mmllta3y0tvBMxaWaJG7iM66EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDQpg/tuMpt1LQNvUwzGdkQH5M4DaYrd0nW5IsmcKuBfFPHHdjNYnZSMkjlmzWuO3Li/ulS+2a+5lwQMO55+cOQZIawfnbI8plaVnFUK2hJy5ohDv1KA9FiG1TYQ0VS0r5r5lleq/wSUSn7wAn8hG8+53EULSaKnc5xB2+Aot8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hSS6NVve; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8D752492;
	Sun,  1 Feb 2026 21:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769978441;
	bh=O5MqS4DeuIAmbItW7mmllta3y0tvBMxaWaJG7iM66EE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSS6NVve64ayVMS+JNO8f44F2ZuQh/BdtVlwOm0nTdYJ/8voY37KuxtYtjBj+9M+B
	 eOGTPsBk3TIBYCabzT2cpSbIrvTV/qMGo7xbz8ptNs41a66kkLDjNu6lzYFU5PYeU/
	 YAfQ/8KP1c/zzM1cqEi8QszuavY2oXo3BnF4+Ogs=
Date: Sun, 1 Feb 2026 22:41:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
	jani.nikula@linux.intel.com, anisse@astier.eu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Message-ID: <20260201204120.GY3374091@killaraus>
References: <20260201133342.335680-1-jarkko@kernel.org>
 <12828248.O9o76ZdvQC@natalenko.name>
 <20260201202200.GX3374091@killaraus>
 <5045000.GXAFRqVoOG@natalenko.name>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5045000.GXAFRqVoOG@natalenko.name>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51938-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim]
X-Rspamd-Queue-Id: CDB65C7358
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 09:27:30PM +0100, Oleksandr Natalenko wrote:
> On neděle 1. února 2026 21:22:00, středoevropský standardní čas Laurent Pinchart wrote:
> > > My use-case for v4l2loopback is to stream a webcam from one machine to
> > > another (with the help of ffmpeg). Is this covered by something other
> > > than v4l2loopback now?
> > 
> > On the transmitting side I assume you don't use v4l2loopback. On the
> > receiving side, the recommened option is PipeWire.
> 
> Yes, v4l2loopback is on the receiving side. Would you please be able
> to share a manual for solving this with PipeWire only?

The basic idea is that you need an application that receives data over
the network and feeds it into PipeWire, the same way you would do with
v4l2loopback. GStreamer should be an easy option, using the
gstpipewiresink element. I haven't tested that personally though, so I
don't have detailed instructions.

-- 
Regards,

Laurent Pinchart

