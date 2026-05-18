Return-Path: <linux-media+bounces-61915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKMzO+LXCmrb8gQAu9opvQ
	(envelope-from <linux-media+bounces-61915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:12:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A95696AF
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CABF8303B179
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA273E4C8D;
	Mon, 18 May 2026 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwFP+fSq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43053101D4;
	Mon, 18 May 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095203; cv=none; b=HF89K6x9rFcQLC2doBiJ4bZlCbWLlM7I4OtnKCMXSDRFqJs0V8a3CZwiFjqvdqCjH7t6yYv0IMyoD9Gsk+ap7AklZNem3qL16kDP8vglEjHaDjbmq5ieU3QDP+GWtnr3z9+otlo/3NxYoZFLzj3yFMrEa/+AoOg4jdkvnJv7zyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095203; c=relaxed/simple;
	bh=hTcDEuqMx87Q1mYpzRVxLDaiUlNPNsM6ASdxL/yQTMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWpPHkDWPJD8zayLv8FsvE2hdwhm37LFmO9g6ILBLI9RfeGQ6ecM6m4WUk58qzLtdF5o15kylgIpikvuweA0pNM8jBIJy7CsPzRbe5kegjNFKFB4d3GPq5jh2AqSWh+3DBivmMvKTyYecR91J5lTYjM/Lcpof8vLjLXbcHKdt9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwFP+fSq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC60C2BCB7;
	Mon, 18 May 2026 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779095203;
	bh=hTcDEuqMx87Q1mYpzRVxLDaiUlNPNsM6ASdxL/yQTMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cwFP+fSq2nZDnN+gLt7Ie1/M0WTh5iZQ4LLzfI/BRhujzXBK2T1T5QOADAFR5FvOk
	 ABbAFc7D52+hZILOOdrNiOgjtzQWFWF5ldzT92wLZJCDQbmLxeGYDbGlVzpq9mS0QQ
	 MwmE9DN7T65yXxC/VEOoc1n+jVVhz2ZATCf28402xqyZkqmQQ00l1JIdIuercFvNa+
	 TWGHhiMnaR7JGSlKLEBcGXJdoEHPEXRErJVhKcSGIPCKKq4R4+Rr3aYUEkRSKd2o0i
	 CfhhnGjFidyxLk6SYktFWBgidD0LZzy3oZ34D9xU3dDuxiYtCZhgZ3+TQ+oubXsLmX
	 4vrfBMjUSDKKw==
Message-ID: <8ee59812-3229-47a9-b849-d1b9e98d569f@kernel.org>
Date: Mon, 18 May 2026 11:06:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: uvcvideo: Fixes for hw timestamping
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9C4A95696AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61915-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

On 13-May-26 1:49 PM, Ricardo Ribalda wrote:
> This series introduces fixes for the hardware timestamp calculations.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v3:
> - Improve the sof_diff function logic.
> - Split "Do not run expensive code if not needed" patchset in two
> - Link to v2: https://lore.kernel.org/r/20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org

Thank you.

I've merged this series and pushed it out to the uvc/for-next branch.

Note I've also rebased uvc/for-next on top of the latest media-committers/next .

Regards,

Hans



> 
> Changes in v2:
> - Fix comments
> - Add UCV_ prefix
> - Improve commit messages
> - Add "Do not run expensive code if not needed" patchset
> - Link to v1: https://lore.kernel.org/r/20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org
> 
> ---
> Ricardo Ribalda (6):
>       media: uvcvideo: Fix dev_sof filtering in hw timestamp
>       media: uvcvideo: Use hw timestaming if the clock buffer is full
>       media: uvcvideo: Relax the constrains for interpolating the hw clock
>       media: uvcvideo: Do not add clock samples with small sof delta
>       media: uvcvideo: Do not add samples if dev_sof has not changed
>       media: uvcvideo: Only do uvc_video_get_time() if needed
> 
>  drivers/media/usb/uvc/uvc_video.c | 72 ++++++++++++++++++++++++++++-----------
>  drivers/media/usb/uvc/uvcvideo.h  |  3 +-
>  2 files changed, 54 insertions(+), 21 deletions(-)
> ---
> base-commit: 10f943b12e7cb338da00f10e129043ae27b33af4
> change-id: 20260309-uvc-hwtimestamp-f25dc27f5711
> 
> Best regards,


