Return-Path: <linux-media+bounces-62173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDR1GzOUDGp1jAUAu9opvQ
	(envelope-from <linux-media+bounces-62173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:47:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 702D9582993
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B8613006D7D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857DD4BC014;
	Tue, 19 May 2026 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcHfjwmg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5D73176E4;
	Tue, 19 May 2026 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779208497; cv=none; b=aEfRvLwiMC7BG22Js9CFSG3v6v5uIzCyHrTplG2+6ZfHjJIWiW+l4GPl20pv62Lfz7trIg5W1Q3Aflio26LP/dQ135lFzNH3HS7AYtp0wjXaehx47qrEyhe5bA+0KQyRnzj7GAgn6k9SCVBs1p/Qt+UX3DTOfO16Bx+NMQbElL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779208497; c=relaxed/simple;
	bh=IJrR8ek2DJ5ocuSXC/edY4ouAMq+cEwGE3AGeG+Kkko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjqqCI000D2xbfPfGUjryqnaosOUFsk76+fZ4KSnfktNSZPzCmIvuMai/c/6a3vBXXCPbU9oVNBXmHYQSwxB0fxpNh0cUHEJ1c9KlnN/GGfrBtnyHAVtNPbu3f0rXCssnAVzJMpMIjaAJPsDWEYFXRgQhLF11TOhl1wXyhVv1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcHfjwmg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612BCC2BCB3;
	Tue, 19 May 2026 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779208496;
	bh=IJrR8ek2DJ5ocuSXC/edY4ouAMq+cEwGE3AGeG+Kkko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NcHfjwmgtEpocA9Ggfxb7KO7+LJd6xWLRbUHiHuflxwJtxQZ9RXU9MuGdL7tDbNa8
	 cJZuCRXLLV4cdgEZPk6m2MVU0/qyoELOXDOHs9p4GX6CiNnRgWTobCpMemjaHs2tO7
	 UrlCxurN/ShAQModA8APDT4nOt4w+qlLBTt6McmFtqR7XZ8F7CUt2botDHxU4zn7BU
	 TJ6KhV3kU7zJCCNU6dFIzK/II6BIM0lbPjyweG0t8Rxl/EDDrR/O+R376HJK/nEeHW
	 tGwoU4JbS3yO5RWpKfe4FQEMH/DaC+4LJtaWM6bcbjJLLumJzY9mgVyVMNRvTNR8S3
	 oEJNOVf37aJzw==
Message-ID: <cfb76181-4d59-43b3-a45b-a344a71fdfbf@kernel.org>
Date: Tue, 19 May 2026 17:34:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register
 failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com>
 <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
 <ihn1XgQJPFsYvuTtWPxpZWwaQBVXHDmJ6Kp6i4DmDowTcRQITZXJlaVsbtkW-bpWydiYGAyyh6c9QLs4Nsn6lA==@protonmail.internalid>
 <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com>
 <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org>
 <ZdheLnLujnIRGAGLFiz1lwSwxaUCArec6sbk_VkixDGjsuPYnMT4_YCSMTbwBWI5-b62G90Qia9lQ90pyFvjBA==@protonmail.internalid>
 <CANUHTR99NHPRP3ooEXEBHf4Fksy0B96vdoV3=mzoMBawVgek+w@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <CANUHTR99NHPRP3ooEXEBHf4Fksy0B96vdoV3=mzoMBawVgek+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62173-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 702D9582993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 15:58, Guangshuo Li wrote:
> Hi Bryan,
> 
> On Tue, 19 May 2026 at 21:20, Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> Yes I take your point.
>>
>> So what you are describing is an error in the software contract from
>> video_register_device() - if we look throughout the usage of that
>> function we see either the pattern we already have - not checking for
>> NULL or checking for NULL - not the double free case you are addressing.
>>
>> So really the fix - the place to litigate this is not in Venus or Iris
>> but in video_register_device's cleanup path.
>>
>> ---
>> bod
> 
> Thanks, I agree.
> 
> This should probably be handled in the video_register_device() failure
> path rather than in each individual driver.
> 
> I do not have a good idea yet for how to fix that cleanly in the v4l2
> core. Do you have any suggestion?

So if we look at how video_register_device() is used by drivers we have 
two different behaviours.

1. Trap the error and release the device
2. Trip the error - check for NULL and release the device

Either way the _users_ of video_register_device() right now expect to 
have to call video_device_release().

So... it seems to me video_register_device() also calling 
video_release() on some but not all of its error path is not the 
expected software contract.

So I suggest two things.

1. Audit all users of video_register_device() and confirm the hypothesis
    That is callers expect to own vdev and currently everybody tries
    to clean it up.

2. If 1 is true then fix video_register_device() to not call
    video_device_release()

It either needs to be that or fully delegate ownership of vdev to 
video_device_register() _and_ update all of the callers.

It may be that < 100% of callers if that is low single digits then 
worthwhile updating those drivers to match the new semantic.

€0.02

---
bod

