Return-Path: <linux-media+bounces-59739-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPFkDNMU8GnXOAEAu9opvQ
	(envelope-from <linux-media+bounces-59739-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 04:00:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BB47C952
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 04:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D61330247DF
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 01:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F882DECA8;
	Tue, 28 Apr 2026 01:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="gmkBHsXQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C32C0F69;
	Tue, 28 Apr 2026 01:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777341532; cv=none; b=E6LAhfQpPQti826ri5EvRvZ2mDL5Da7r3tVxsJTV1OYK2o7CoDi/dQN2Sk/PZf+kUF1MwK9DJx1EaFYAr28KSETl/AOJ53P4NiEpWloqabD+YAZAt87A/hKN/hw87lKrxJjTdDcYGHy5NyrJO67gAQGfethkHZ1muHIOadPPpJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777341532; c=relaxed/simple;
	bh=NJd5GgoD+NpDQOZVGEsWKI5NWwOmiridCsA38gkHMZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCB27PvxM2p87/dscGZTGUyGdyVZdKakcA4fKK/G6Q69jfY1lv5APR1+s2/5nkR9QPCWz8nJyDVGQlRzZeg+LrrwC/vQdYpA2JQjkai/8/nP1mcRrnfrzLc4XELlzzoXC4tpowc49gsZ/w6LxhNCmjpJnUEcwdQog/445BpfhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=gmkBHsXQ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V8UwvXyUMjLBtws4s7k7jbSM5GLv2sSezjqGQwVVv7c=; b=gmkBHsXQEbTXhEx6g2fcSwDDZB
	vzbp26tODcpSFYCukuu3cZtW2oO/9J0mfmdLeHNAkTxqfjss0ft7rADvoqO2fyr2JJzMgfE2c/ZOy
	o201LZD+v4bcnbRTVUlPKJu7RpX1VA32hMRZvr7IgCYvoSO9wovavfiRlf9RAZvewNnMpL0T9GXRV
	FYdINzfmb4PZ9kSgkOvCkRS+7VB7TnvpIisv+GG/WbBDE0BsxbRhInwbUq+AZlq0zaUr3jyfEqhIQ
	LVmYqGPVARH6UNr2W2YLC4ILdFd2WhsiXnpYd4TM85IURKqCMNUEh72YrkwXiF8qOd92TnlvQm8rx
	Qnepm75w==;
Received: from [179.221.49.249] (helo=[192.168.0.108])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wHXij-003BUR-Gk; Tue, 28 Apr 2026 03:58:40 +0200
Message-ID: <c624a91f-6ae2-441d-a6c4-c76cb2c816b3@igalia.com>
Date: Mon, 27 Apr 2026 22:58:33 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: Use negation to check for NULL
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Gabriel Sanches <gabriel@gsr.dev>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, hansg@kernel.org,
 andy@kernel.org, ~lkcamp/patches@lists.sr.ht
References: <20260423181443.46566-1-gabriel@gsr.dev>
 <aesvvPPq35g2yHR0@ashevche-desk.local>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <aesvvPPq35g2yHR0@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 999BB47C952
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59739-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.810];
	FROM_NEQ_ENVFROM(0.00)[koike@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,igalia.com:mid]

Hi Gabriel,

Thanks for your patch, please see my comments below.

On 4/23/26 3:14 PM, Gabriel Sanches wrote:
 > Fix checkpath error 'CHECK: Comparison to NULL could be written

typo: checkpatch.

On 4/24/26 5:54 AM, Andy Shevchenko wrote:
> On Thu, Apr 23, 2026 at 03:14:36PM -0300, Gabriel Sanches wrote:
> 
> ...
> 
>> Hey, this is my first patch ever. I would appreciate any
>> feedback. Thanks!
> 
> Please, start reviewing others' patches for the same driver and read other
> reviews and learn from them first.

Gabriel, fyi, you can check previous reviews on this driver on 
lore.kernel.org, for instance: https://lore.kernel.org/all/?q=atomisp

> 
> I'm not going to repeat what I said already several times on a patches like
> this over the very same driver (atomisp).
> 

You can see in the previous reviews a few comments to not fix just a 
single occurrence of the issue on the driver, but to fix in a set of 
files or in the entire driver.

By running checkpatch recursively on the entire driver, I found 5 
occurrences of this same problem.

You can check with:

   find drivers/staging/media/atomisp -name "*.c" -o -name "*.h" \
     | xargs scripts/checkpatch.pl -f 2>&1 \
     | grep -A3 "Comparison to NULL"

I hope this helps.

Regards,
Helen

