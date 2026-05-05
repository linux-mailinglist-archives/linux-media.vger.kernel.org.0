Return-Path: <linux-media+bounces-60402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAVTNK/Z+WnNEgMAu9opvQ
	(envelope-from <linux-media+bounces-60402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:51:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE54CCFE2
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8402C30779EC
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 11:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5A5391E4B;
	Tue,  5 May 2026 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/ntJLGM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B212438550C;
	Tue,  5 May 2026 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981244; cv=none; b=gAYOvANinuSVPVCvN04D6SUFZoF2LdfggQwhwFMJQ0kL+FVIoEqPSbHbcjalXTRWEZJhcUqoidYXxCxYgdEoOPxIGkGFC9mDlXemGOwee8o8VKebodYgskDgKsIawOlIe0T0DhMekmlHzh3398rm6tOkitycseNCoM58a+F3Qj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981244; c=relaxed/simple;
	bh=4+Iu46KmbMltdWMjKfTVCvDNPFKWfMnkj1wvZLVT7oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/mpHYPmSTVmdNTuC9EjZi1BwuWDjqjJiIJlH1EOsDqoucbhGzNkZag66MiNeEf1bKGN7p5D4BqDcGKDaGVv3QB+ioZ8jGZm8CGEwK0YZtexrI2k7Jpj3AmsFSWHJ4sbUqG9reASiC5ERPcbiGMR7OMKkFo3smTGzplzJawxL+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/ntJLGM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067FEC2BCB4;
	Tue,  5 May 2026 11:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777981244;
	bh=4+Iu46KmbMltdWMjKfTVCvDNPFKWfMnkj1wvZLVT7oc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J/ntJLGMTyoKqqLlFe8fcMmMZxpgTO3QrCREk+dbG0lZv3g0+OzBiLSuY7SNqBL/q
	 jk+yCyLlDIUZPXBlwpyS7S4YK5gy1O9bYVXzydzQ7NvmgHF54zjztvPmuK0yJHbALl
	 Swfp/qfM7e7pFHFxsAySCv0iQuKXesyU4UiOEfAjn4FiPw/AG6LVn+zunwF/T3cfZ1
	 lrQe2ubne4LutvlaXsKcXyE2BmD7N6AgXU8J7/RjYNtvGhRPjZ+epBxBKfOPHZIR/d
	 n0nPCOCaQtBGDGbRyxSd2hHliM+GT20dPyZVO/mBuyLRp1+fCYFAGme/ba9BjWR5Xi
	 3Qt0seZU4dlOA==
Message-ID: <4ea02e8e-c0e1-4da9-b7bb-d2ecdc7f1194@kernel.org>
Date: Tue, 5 May 2026 13:40:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] staging: media: av7110: fix coding style
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Chethan C <mail.chethanc@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 Osama Albahrani <osalbahr@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260328165049.899917-1-mail.chethanc@gmail.com>
 <CAGhNHKgiMQ1Km-JZKQTfkw6aXh-KDKM3gjKyNiyhRwQRvyptPA@mail.gmail.com>
 <adY7MwE5dorn9FlT@ashevche-desk.local>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <adY7MwE5dorn9FlT@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3BAE54CCFE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60402-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,suse.com,gmail.com,ideasonboard.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]

On 4/8/26 13:25, Andy Shevchenko wrote:
> On Wed, Apr 08, 2026 at 10:33:28AM +0530, Chethan C wrote:
>> Hi,
>>
>> Just a gentle ping on this patch.
>>
>> I wanted to check if there are any comments or changes needed from my side.
>>
>> Thanks for your time.
> 
> You need to:
> - do not top-post!
> - do not quote hundreds of lines just for this message!
> - wait a bit more, we are almost at the merge window time, quite unlikely
> somebody will take this right away

Yup, but now I'm picking it up!

> - the Subject should have "staging:" part to be dropped; all media patches
> are started with "media: " even for the staging folder

Actually, either way is fine, as long as the 'media:' part is present in the
subject.

> 
> Also note the formatting patches are lowest in the priority.

Low prio, yes, but to be honest it is nice to get rid of the camelcase in this
driver :-)

Regards,

	Hans

> If you wish to provide a real contribution, try something else. For example,
> one of the listed in [1]. It's not that your patch is bad or unwelcome, no,
> this is about the change that does almost nothing to the driver that needs
> more real work.
> 
>> On Sat, Mar 28, 2026 at 10:21 PM Chethan C <mail.chethanc@gmail.com> wrote:
> 
>>> Fix indentation and alignment issues reported by checkpatch.pl.
>>>
>>> Rename enums av7110_rec_play_state, av7110_type_rec_play_format,
>>> and av7110_encoder_command to follow kernel naming style.
>>>
>>> Rename wssData and wssMode to wss_data and wss_mode to avoid
>>> camelCase identifiers.
> 
> [1]: https://gist.github.com/andy-shev/a2cb1ee4767d6d2f5d20db53ecb9aabc
> 


