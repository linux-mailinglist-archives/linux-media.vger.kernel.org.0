Return-Path: <linux-media+bounces-59212-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEFZLOte52lr7QEAu9opvQ
	(envelope-from <linux-media+bounces-59212-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 13:26:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5D343A17D
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 13:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3D303034DDD
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD163BE632;
	Tue, 21 Apr 2026 11:25:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F323BC69F
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770758; cv=none; b=aQRqtuCNpcr6xEfZLpLoeGbzpq8fOIwlL5CzrA2tt+iH0Sp1ojv6aqf/nfUhj2C/lWHxOqEyfU9UB8Wvr6yf+uiyKXUOkhta5vT1SRMAGmEvg5664Bj7aNQI9I5hPBbUcuF11EglTpKuWLVQNkLfeK2L+9zVwbK82+kMpElOyUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770758; c=relaxed/simple;
	bh=vLN1WxRA4uJ1BzxBWRIqEXPtAHMvUcZAjAv8R019G5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gKmnmGLKgl5bklGxs3ivbu0VCncEcvl4QXdlVJ9c5KiyJTM9glbpWgH9siJgjsO7uNTD5Dw7diYwNOF0MAZFaKUufoS60KDrMdJXlnh6NISGk2FXt5cAxkZ7HWYMs5ttjzez4xTz6/3BWpEq56a3Q0nzVrSo8JjG+APOjfFZJUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 63LBPt2u078058
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 20:25:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 63LBPt5G078054
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 20:25:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <e7d4d4c7-7cb8-4068-8b85-39a2415d211d@I-love.SAKURA.ne.jp>
Date: Tue, 21 Apr 2026 20:25:56 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: usb: siano: don't set URB_FREE_BUFFER flag
To: linux-media@vger.kernel.org
References: <09072a14-77bf-47cc-9b79-1edc3c1426ea@I-love.SAKURA.ne.jp>
 <69e2629e.050a0220.27fa84.85a5@mx.google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <69e2629e.050a0220.27fa84.85a5@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav303.rs.sakura.ne.jp
X-Virus-Status: clean
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_FROM(0.00)[bounces-59212-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[i-love.sakura.ne.jp];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,linux-media@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E5D343A17D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/04/18 1:41, Patchwork Integration wrote:
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/97739148/artifacts/report.htm .

All issues seems to be ssh connection reset (and therefore I don't
think I can help with something). Anything other than waiting?


