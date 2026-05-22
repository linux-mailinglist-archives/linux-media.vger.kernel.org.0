Return-Path: <linux-media+bounces-62620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBciBEVZEGpcWgYAu9opvQ
	(envelope-from <linux-media+bounces-62620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 15:25:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA41F5B51D5
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 15:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA3BA30F4276
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BEC39EF0A;
	Fri, 22 May 2026 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="I6BoQBCt"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE739B497;
	Fri, 22 May 2026 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455207; cv=pass; b=RIfG7nYiiy1q6GPjE43HuHmIvYn9BTUIW0gnugHP6g388YUsPAfIx07lbU3D6/tyOFW0v8JTXLm+bxsWiprXKGexSjjDatq6XcLZ0BpRPLpAlWC3Eu50UyA3QbN8/ADau55R19WiZGREx2laWOnGyDiDxAe6QCJL/bGMSldjnOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455207; c=relaxed/simple;
	bh=JO77Pdqm4FDBbBuGGxNTRNH2VFpI6EALXumSXRWAHEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNhXIRoWmSmpJPHpr83193E0N6FGHdCF2pJIyZ66/41lyEhEwTdpaVuj+iRvdB3BbAiQl3iFvF2JKOYivcmEG8V21ZwKV8MS47w7eXOFfsAz5eqHHUM/oiVcemBbe/UIswl5+tG8QAzWTuNchEesnkgVt2b34/6+rfxQKcrAXbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=I6BoQBCt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779455196; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eN4ATdUMpvDsfgn+TXOvfmw+QMiRR7TDY4hdHrR6FU/eI+PszKRAxswHsUPrncTHdlWruDHA/lze3yzGeFkzaV2MOWs7pI9L9O1Tgw1gcwGe6eGrRMC6LO3NBdTfqi8S4fGCIb5xEYMxfpQvMJ6QtymtT4HlbYnUEc1DumdSfDk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779455196; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4a2i19bMlznTfQSV7hH7AQSoCRRWAsRP+nmZLWmDdE4=; 
	b=N04NFLs7DKfVjbAMtp6CpE/llnaDJqqD75gVLBt/AsnQOthdSGvbr2jmvYb44iOknnBNQb5oY4ldsr86cIxWIiOwbdCFVncpmBuZKUWgh3vrnVmc3GF/e0Iox00xqLvSyLuUhCd/Si6k6ExK9bWAdml2idjenExM+BiAy6dpX2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779455195;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4a2i19bMlznTfQSV7hH7AQSoCRRWAsRP+nmZLWmDdE4=;
	b=I6BoQBCtAles2jV2tx0BMUcMWHxLvYsSupLILMME8xHG36WLY1o8qFn9KzDodm0k
	DDXqToP4cSRhpM+lN4/g7c+Ndf/NV0uT9hZifuBfqdM+VIKxYO+UQN+byCbirJx+lOp
	ggow4WcOWZunGWeNly59du/Nw12KIzt4tYdafPVs=
Received: by mx.zohomail.com with SMTPS id 177945519388619.946341277208376;
	Fri, 22 May 2026 06:06:33 -0700 (PDT)
Message-ID: <98c2ba7b-5901-4462-8ea3-0de243ed285f@collabora.com>
Date: Fri, 22 May 2026 09:06:32 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkvdec: hevc: cap EXT SPS RPS control counts
 before descriptor assembly
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
 <67bd72ba-6dab-4bdb-a391-27545e287e94@collabora.com>
 <CAJJ9bXxR5U=33RSzB5uFEZv3ZL2JE=UjK7ZToxm0ewSqyu5GBw@mail.gmail.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <CAJJ9bXxR5U=33RSzB5uFEZv3ZL2JE=UjK7ZToxm0ewSqyu5GBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62620-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BA41F5B51D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mike,

On 5/20/26 20:57, Michael Bommarito wrote:
> On Tue, May 19, 2026 at 9:04 AM Detlev Casanova
> <detlev.casanova@collabora.com> wrote:
>> Still, did you try just changing the cap to 64 (.cfg.dims = { 64 },) ?
>> You'd need a test that sets the control from userspace though.
>>
>> It should refuse setting the control if there are more than 64 elements,
>> therefore the hevc decoder will not run any function using the count
>> values from the SPS (See  rkvdec-vdpu381-hevc.c:601)
> Sure, I can test that and send a v2 for ST.  My understanding is that
> we have four spots we need to check across the flow though:
>
> 1. ST count > 64
> 2. LT count > 32
ST and LT can be handled through cfg.dims and when num_negative_pics / 
num_positive_pics are non-zero, the code check that ST and LT have 
actually been set. If not, they can be skipped.
> 3. num_negative_pics / num_positive_pics > 16
This could be checked in the validation step of the control in v4l2-core.
> 4. delta_idx_minus1 + 1 > i
This one would need to be checked in the construction code indeed.
>
> So would you also want the same .cfg approach for the LT cap?
So yes for LT dimensions.

Detlev.

