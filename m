Return-Path: <linux-media+bounces-62862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MENNOqu4FmqLqAcAu9opvQ
	(envelope-from <linux-media+bounces-62862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:26:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 415CD5E1C41
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F2713023529
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 09:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F343E8323;
	Wed, 27 May 2026 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="NNpel607"
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.soverin.net (outbound.soverin.net [185.233.34.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255EF3E6DDC
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 09:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873615; cv=none; b=a5tqW1eSDwZhsNKRpPPSYHRDPb2miStOp1RYF5l1ml0zQ9vY1Sv8Vesdl6tZoU8pmzdnXq+H2ZnysGkQuhUSf/Cw3gHpJT8/U2nda6wmDv2cWao4SheakLuzDHJerBS6MkOgPusgHTzGI+LyMegQbxgw7RmSMy8aP1ncU9cFcDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873615; c=relaxed/simple;
	bh=7GZG9TldFlfP6shQftG/+NOf3ALX/Q9xXCrePj1oG7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDAFj6m8BH4TtLGxMIm8hMoe2GabwAmo2FeEcHncy+Qjv6bu47/LmTk9sFmpdNzgGJMo15acooNBLHFjDDhds10aPdVXXAUOBVP8pn5vDXIi6ntg0+GtqHdbuIsJf0dcnmxOygd0FS5hXWGPOpN0eAPsT0QDkl8Hxu6hSQ/qRaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=NNpel607; arc=none smtp.client-ip=185.233.34.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4gQP7t16PZz1xpv;
	Wed, 27 May 2026 09:14:18 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4gQP7s0Qy9z2xLS;
	Wed, 27 May 2026 09:14:16 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=NNpel607;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1779873258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/v60P3uAT0/Xbja1O2Qd2WEn4BErZih9q23CgshkOgM=;
	b=NNpel607qgfvfU23kcHXwWIOKS87lSf7nhJgUpp2MGJ+D5ykBZf29dR35PYhOkArF+gRNt
	W3jSMPJQOWP8idmCvHvFmmdb9FvVawPTPKM2OPcEyXGBFOvzJJx9WrcIvBU0L91A5UNFND
	4+fF28q4oFro1Sm1b1FRWuBL6LMiMdmPWSEy/c6U/TmEpB8cW58Dmq2j7zhwenb0HhC+Xh
	i4VJolC/lzraM/rTa3J2/2/Uxv29T2m5Q6xCljoCRGtcALRdJm6HA8AUObd50fopWPHsBN
	AEoay3kEa7pKp9qfI2jGg3Pgl38Bej+qeUb5ShOd2kWAi1jepQ7N4poDXSbQdg==
X-CM-Envelope: MS4xfEmdsTB2tmzLxNpBJqgeqir7lnXdL81J6lOrG6K1sK2aC+SWgn7mvYyt6ZD6cRBBrALLnNbrJ51hC3kjW6d8IoE0f5QW3heuQnjpr4H4p0CZ8ZMCHvpf ENoDrBvyh7gQmFCuDYwHOaUIfpjYPQ0TjDJB/VISAQXuQStP/GU1Jn1+F60oAwNXfn0H6qfRCY6wBPz73cF88Dmq0hHv9hGGBGYpE0zBLgfx6nxCbVFenlYc NO/yDFTuV0vaJ6EUuj6iFbUtB4fiazAvjQMupDmt6+KU/mo97CEy7k7UquRG/q6ycaeEQfrDhETxnT3A45ecnom3Jep8psuGW92DfJsrUbGJ5etceaimeW23 Vqz4XUSf7dAnnbFF8SwHp779JM2K/xEA7xut1o9n2rDz3RhoWRyEoQJKJZhtN570cOnvyORs
X-Soverin-Id: 019e68b6-9a10-7ec2-b2c4-98845cb425f8
Message-ID: <91a509aa-f180-4bec-be10-2278b0e93426@jjverkuil.nl>
Date: Wed, 27 May 2026 11:13:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL FOR v7.2] i.MX NXP stage driver for changes
To: Frank.Li@oss.nxp.com, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
 Mark Adamenko <marusik.adamenko@gmail.com>,
 Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
 Michael Tretter <m.tretter@pengutronix.de>
References: <20260522194020.693731-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Hans Verkuil <hans@jjverkuil.nl>
In-Reply-To: <20260522194020.693731-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jjverkuil.nl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jjverkuil.nl:s=soverin1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[jjverkuil.nl:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62862-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hans@jjverkuil.nl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,jjverkuil.nl:mid,jjverkuil.nl:dkim,nxp.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 415CD5E1C41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

On 5/22/26 9:40 PM, Frank.Li@oss.nxp.com wrote:
> The following changes since commit 940f161f734b25f175a95d2684c2021f6323693a:
> 
>    media: meson: vdec: Fix memory leak in error path of vdec_open (2026-05-21 12:32:22 +0200)
> 
> are available in the Git repository at:
> 
>    https://gitlab.freedesktop.org/linux-media/users/frankl.git tags/media-stage-nxp-20260519
> 
> for you to fetch changes up to 87ac7ccb322a2cb70957878905fd46d821a919bd:
> 
>    media: staging: imx: fix parenthesis ending checks (2026-05-21 12:58:30 -0400)
> 
> CI pipeline: https://gitlab.freedesktop.org/linux-media/users/frankl/-/pipelines/1672639
> 
> ----------------------------------------------------------------
> - Use media_pad_is_streaming helper function for cleaner code
> 
> - Fix media pipeline handling in imx-csi driver by explicitly starting
>    pipeline on pad 0 and moving media_pipeline to video device
> 
> - Fix imx stage driver code style problem
> 
> ----------------------------------------------------------------
> Mark Adamenko (1):
>        media: staging: imx: fix parenthesis ending checks

I'm dropping this patch, see my review of it.

I'll take the other patches.

Regards,

	Hans

> 
> Michael Tretter (3):
>        media: staging: imx-csi: move media_pipeline to video device
>        media: staging: imx-csi: explicitly start media pipeline on pad 0
>        media: staging: imx-csi: use media_pad_is_streaming helper
> 
> Shyam Sunder Reddy Padira (1):
>        media: staging: imx: remove unnecessary out-of-memory error message
> 
>   drivers/staging/media/imx/imx-ic-prpencvf.c   | 16 ++++++----------
>   drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
>   drivers/staging/media/imx/imx-media-utils.c   | 16 +++++++++-------
>   drivers/staging/media/imx/imx-media.h         |  7 ++++---
>   4 files changed, 23 insertions(+), 24 deletions(-)
> 


