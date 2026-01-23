Return-Path: <linux-media+bounces-51426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJLANhaHc2krxAAAu9opvQ
	(envelope-from <linux-media+bounces-51426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:35:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC777228
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CC52303B979
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 14:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC732F0C7D;
	Fri, 23 Jan 2026 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lb+ktLAh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05DA2C08AB
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178783; cv=none; b=GwBdI0mL2YysP9JQ+0f3v0nOvgGDnpvSRUPnEXqd9/Hfhw2R7C34sjoBkObetJQ9/Zdx0l2D7zYfo1WG7CXpcJder/blu+bz9nRcMD9A+nyRnsl7KkNVNztQMIMDbHKf46bjfHOCRd6r2uLgsowssI8+PdHzme3nrDY/Yk9RuA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178783; c=relaxed/simple;
	bh=hXqoNKuVCC+R0yhQ+GELmMH6Vk2OTSgKtT68KRFY/TY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=FlUAVFkhtX//2ukVyPi3XZDloQ7NZTOx6xiy3v6lnPbtjGoTZXMnCRhau8W6UG5VpuMVRDSKOgG1VxkzeQjdfjjS9vFHgHyzc2ve4kXIEyelmspAnu2vrPlxHx00lIsvxyBcgzX+N3rwYwHMnv1JyPgOysYye8MbWNBj6Y3ujzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lb+ktLAh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD72C4CEF1
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 14:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769178783;
	bh=hXqoNKuVCC+R0yhQ+GELmMH6Vk2OTSgKtT68KRFY/TY=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=lb+ktLAhSqAZGsD9J8fsklJbvtQQD6xF2QaTTBxNntADS2VGFe5LLXF9TEsdZBaHO
	 fXetDqX4U699LZotN7cylfjpyLF+hKnxAJQzB5AsDnKLQiCGULTVtuyzihy78Lz3P3
	 zKyhCPrw6x7507YE7VHUpwiMo8PLEYiSJydE4r9/61RqOtDetqKDc2kCyFNrnsoYxv
	 qhjtESn5UvFwaZSB3JXi1z2cYFgOf6s2LMbMJyqaqIXt5Lhr+gXithZ2GjRG0IhJcQ
	 YV6Cn3Ffl0DiQipwVSQ9yHMDiJt2lnEber9Ayp88dAjHRFUyoVD1ItNlUnW25uurT1
	 NbKl9sqA0rdVw==
Message-ID: <82367a94-edf9-4296-b680-e2aa01878eef@kernel.org>
Date: Fri, 23 Jan 2026 15:33:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH edid-decode] edid-decode: implement ARVR_HMD and
 ARVR_Layer Data Block parsers
To: linux-media@vger.kernel.org
References: <CANAm-ceMub3beq21hkU+kEKxwXCWLM+AyO678gtGgL1BZ3mNpA@mail.gmail.com>
 <6e5e14f2-ce2f-481e-a065-a8bab3d17ec6@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <6e5e14f2-ce2f-481e-a065-a8bab3d17ec6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51426-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19CC777228
X-Rspamd-Action: no action

Just ignore, was wrong 'To' field.

On 23/01/2026 15:30, Hans Verkuil wrote:
> Hi Yassine,
> 
> Please post these two patches to linux-media@vger.kernel.org, not linuxtv-commits@linuxtv.org.
> linux-media is where these patches are discussed and they will also end up in patchwork
> (https://patchwork.linuxtv.org/project/linux-media/list/)
> 
> And please post the patch inline, not as an attachment.
> 
> If your mailer mangles patches, then this page has some help:
> 
> https://docs.kernel.org/process/email-clients.html
> 
> Regards,
> 
> 	Hans
> 
> On 23/01/2026 14:11, HAYOU YASSINE wrote:
>> Hi,
>>
>> This patch implements full parsing for DisplayID 2.1 AR/VR data blocks:
>> - Tag 0x2c (ARVR_HMD): 79-byte block with optics, lens adjustment,
>>   field of view, center of projection, and streams per layer fields
>> - Tag 0x2d (ARVR_Layer): 20-byte block with HMD identification,
>>   layer configuration, lens distortion, and scaling support
>>
>> The patch also includes sanity checks for both blocks.
>>
>> Please review.
>>
>> Thanks,
>> Yassine
>>
>> _______________________________________________
>> linuxtv-commits mailing list -- linuxtv-commits@linuxtv.org
>> To unsubscribe send an email to linuxtv-commits-leave@linuxtv.org
> 
> 


