Return-Path: <linux-media+bounces-56074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ3sJs1TuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:14:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F32632AAA50
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56FBD305DA32
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716343A4F3C;
	Tue, 17 Mar 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HD+GJXaH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78C35FF61
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753240; cv=none; b=VtqQ3boPxzpn519sy+Ni+sxaMnYjpEVijxXTCmj0HMeKlNR1JH92jCCwyv1Ctcexur/P2OrelNqv/L+7rcNyks7YHkHKPK9CD7wjt5iuPQk7zczxi9Sa1+vGC6hv7at1um62fQ4kWVIWMVm3vIPkyPNTxVIb3kTepIBfOKOa/q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753240; c=relaxed/simple;
	bh=WCtst9ulDHjzLlvz4CtRqw11ZPDtoxMQU8hBqVyfBoY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=fFjANTVIpaL4Q1GZNbjQw6DL6Cb/cRCR/b3t47knEMejtOdXLPq6CcG6G0tXyreLKqFy+Lvoj630ccgi4BDU09hAchg9jkEh7eYOHo210SsR/BaZsMoxEQ1wTJhTuP6t2Ij9JbHKvxyMlnumG4rH0brpmusmXFOZjTunyNGWkCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HD+GJXaH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF47C4CEF7;
	Tue, 17 Mar 2026 13:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773753240;
	bh=WCtst9ulDHjzLlvz4CtRqw11ZPDtoxMQU8hBqVyfBoY=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=HD+GJXaH55TrJfV4Te+3Jujb0r9hFOXrbc66V6t1wnv0tLwFg2s7cKIoaVFlHV1ve
	 9MfHsPcIHZkqTcHh+z/faDI6tf3ASw5lTiPXw/U454PPupvv/Q9VxKmtuS7cYV7Tn/
	 EDYVa9BQmKEe/N7YIzua8joSpO3Q+DrIkWt7TWaUn/VrDf36Xrq1GZ5CSu3SCzHeED
	 NmyUsOjS/5s7dxNxDATkHADW0QBM4fdCS5xLGCZ7lzjfS/NdW51/7Rfd3pL2XRnHIr
	 PHip5W8fPs5OHElZfKaK8oGaq+ThfxpbZYxh1varTdBjY1m+co0ACssR7OLw6EqNoP
	 kG0IG1ZvuIGqg==
Message-ID: <08b7b5d6-4068-4349-924e-e551bbf6e672@kernel.org>
Date: Tue, 17 Mar 2026 14:13:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 00/11] Assorted DVB and TV patches
To: Bradford Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20260312213532.2907276-1-brad@nextdimension.cc>
 <7c653b8b-5d31-4667-9d86-cbaed7ee97f9@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <7c653b8b-5d31-4667-9d86-cbaed7ee97f9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56074-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F32632AAA50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 10:52, Hans Verkuil wrote:
> Hi Brad,
> 
> Thank you for this cleanup series!
> 
> I'll take them all, except for the "au0828: Fix green screen in analog" patch,
> which needs a v2. So no need to post a v2 of the whole series, just post a v2
> of that au0828 patch.

BTW, for future reference, please prefix media patches with "media: " in the Subject
line. I added it manually for these patches.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
> On 12/03/2026 22:35, Bradford Love wrote:
>> Hello,
>>
>> Attached here is a series of accumlated fixes from integrations
>> and deployments.
>>
>> The first five patches are related to fixing issues with a
>> variety of analog video formats.
>>
>> The si2168 i2c timeout patch is something that has been found
>> to be critical on a variety of ARM platforms and Nvidia SOC.
>> Something in these platforms has USB i2c not consistently responding
>> within the embedded deadline in the driver.
>>
>> There are two firmware fixes. With Hauppauge hardware fw 4.0-11 si2168
>> devices definitely lose warm state and cannot function after sleep.
>> The saa7164 REV2 firmware had an incorrect filename and has been fixed.
>>
>> Last up is adding some new Hauppauge USB id's and removing an invalid
>> analog input from the Hauppauge DVB DualHD.
>>
>> Addressing checkpatch warnings:
>> - 0001 palN is not misspelled
>> - 0003 adding dprintk like driver already does
>>
>>
>>
>> Regards,
>>
>> Bradford
>>
>>
>>
>> Bradford Love (11):
>>   si2157: Analog format fixes
>>   cx25840: Fix NTSC-J, PAL-N, and SECAM standards
>>   xc5000: Add rf strength function
>>   cx231xx: Fix AGC levels for NTSC-M
>>   au0828: Fix green screen in analog
>>   si2168: Fix i2c command timeout on embedded platforms
>>   si2168: fw 4.0-11 loses warm state during sleep
>>   saa7164: Fix REV2 firmware filename
>>   au0828: Add new Hauppauge HVR1265 and ImpactVCB-e
>>   em28xx: Add a variety of DualHD usb id
>>   em28xx: remove tuner type from Hauppauge DVB DualHD
>>
>>  drivers/media/dvb-frontends/au8522_decoder.c |  1 +
>>  drivers/media/dvb-frontends/si2168.c         |  8 ++--
>>  drivers/media/i2c/cx25840/cx25840-core.c     | 29 +++++++++++-
>>  drivers/media/pci/saa7164/saa7164-fw.c       |  4 +-
>>  drivers/media/tuners/si2157.c                | 15 ++++--
>>  drivers/media/tuners/xc5000.c                | 13 ++++-
>>  drivers/media/usb/au0828/au0828-cards.c      | 50 ++++++++++++++++++++
>>  drivers/media/usb/au0828/au0828-cards.h      |  2 +
>>  drivers/media/usb/au0828/au0828-dvb.c        |  1 +
>>  drivers/media/usb/au0828/au0828-input.c      |  1 +
>>  drivers/media/usb/au0828/au0828-video.c      | 30 +++++++++++-
>>  drivers/media/usb/cx231xx/cx231xx-avcore.c   |  7 ++-
>>  drivers/media/usb/em28xx/em28xx-cards.c      | 19 +++++---
>>  13 files changed, 156 insertions(+), 24 deletions(-)
>>
> 
> 


