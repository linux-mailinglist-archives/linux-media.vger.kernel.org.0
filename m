Return-Path: <linux-media+bounces-63954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0vTzIXoWI2rthwEAu9opvQ
	(envelope-from <linux-media+bounces-63954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 20:33:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 890B364AA54
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 20:33:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63954-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63954-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=fritscher.net (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3D3A300BC97
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 18:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6617739A06B;
	Fri,  5 Jun 2026 18:23:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mifritscher.de (mifritscher.de [188.40.170.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C32F7F1A
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 18:23:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683801; cv=none; b=LGngSZgFQDcem0632A8ddnNegpcOuukvKm/ffg55E7mIGWN4hXXTvrT/ET1ozDRBPfRWPoNHDWG74Z1EpO6dt6kqrqCG45wOE40iIDmDY2vYKZXpqWj3r67Td4GS2u+abUocuyN1sEx0oMbU223e2l/iaw4z+3/m9UdXz9olI+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683801; c=relaxed/simple;
	bh=xNjEYO63OKkW+gu6R4JVy8eg0ZCSCE+eOZnMKaJiZno=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=VMbqqzPlG9h7hYoNjE72JZHISlTYIS8Eh6gSGakTcw/o8aR/+ogg1U4TLo8gSorWRZYzZvrkH5nWUNIi7t4i0sVpqVb9R7t4v8i1s9TuYtpLpy0fmisE445DqkkPVfXnjh4TYoVc27GBqCwIfbc/5Tm6v1rvax84pKv/gc6XLxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fritscher.net; spf=pass smtp.mailfrom=fritscher.net; arc=none smtp.client-ip=188.40.170.105
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mifritscher.de (Postfix) with ESMTP id 1C66F3B2899
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 20:23:17 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mifritscher.vserverkompetenz.de
Received: from mail.mifritscher.de ([127.0.0.1])
 by localhost (mail.mifritscher.vserverkompetenz.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id qotId11ABR3I for <linux-media@vger.kernel.org>;
 Fri,  5 Jun 2026 20:23:16 +0200 (CEST)
Received: from [IPV6:2001:4091:a245:8498:3dfe:d70:e3e3:8c25] (unknown [IPv6:2001:4091:a245:8498:3dfe:d70:e3e3:8c25])
	by mail.mifritscher.de (Postfix) with ESMTPSA id 27E183B254C
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 20:23:16 +0200 (CEST)
Message-ID: <3dbef45d-9fed-46ab-806e-6ccd95ae0ee1@fritscher.net>
Date: Fri, 5 Jun 2026 20:23:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB 2013:0462 PCTV Systems PCTV 461
From: Michael Fritscher <michael@fritscher.net>
To: linux-media@vger.kernel.org
References: <865cf4b5-940f-4fef-8ddc-e872b4ae6f02@fritscher.net>
Content-Language: de-DE
Autocrypt: addr=michael@fritscher.net; keydata=
 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
 J8ECEUyP
In-Reply-To: <865cf4b5-940f-4fef-8ddc-e872b4ae6f02@fritscher.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[fritscher.net : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63954-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[michael@fritscher.net,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael@fritscher.net,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fritscher.net:from_mime,fritscher.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 890B364AA54

Good day,

I tested the patch in the mentioned thread and described the journey at 
https://github.com/b-rad-NDi/Ubuntu-media-tree-kernel-builder/issues/176#issuecomment-4634272566. 
Short: It works flawlessly.

It would be very nice to get this upstreamed. The mentioned patch ( 
https://github.com/user-attachments/files/24972712/462.zip ) seems to be 
rather clean for me, not being a kernel developer, only some debug 
stanzas could/should be cleaned up. , The bulk is for the m88ds3103c 
variant, the rest for bringing up the device itself

Best regards
Michael

Am 04.06.26 um 21:34 schrieb Michael Fritscher:
> Good day,
> 
> the linux log say that I should write an E-Mail, so there is ;-)
> 
> I'm using Debian trixie - kernel version : 6.12.90
> 
> lsusb:
> 2013:0462 PCTV Systems PCTV 461
> 
>                   Board eeprom hash is 0x00000000
>                   Board i2c devicelist hash is 0x7d2e7f80
> 
> 
> dmesg:
> 
> [1289673.030208] em28xx 3-6.1:1.0: New device PCTV PCTV 461 @ 480 Mbps 
> (2013:0462, interface 0, class 0)
> [1289673.030220] em28xx 3-6.1:1.0: DVB interface 0 found: bulk
> [1289673.091698] em28xx 3-6.1:1.0: chip ID is em28178
> [1289673.219593] em28xx 3-6.1:1.0: failed to read eeprom (err=-110)
> [1289673.219604] em28xx 3-6.1:1.0: em28xx_i2c_register: em28xx_i2_eeprom 
> failed! retval [-110]
> [1289673.255687] em28xx 3-6.1:1.0: found i2c device @ 0x0 on bus 0 [???]
> [1289673.291676] em28xx 3-6.1:1.0: found i2c device @ 0x2 on bus 0 [???]
> [1289673.327686] em28xx 3-6.1:1.0: found i2c device @ 0x4 on bus 0 [???]
> [1289673.368832] em28xx 3-6.1:1.0: found i2c device @ 0x6 on bus 0 [???]
> [1289673.407684] em28xx 3-6.1:1.0: found i2c device @ 0x8 on bus 0 [???]
> [1289673.443675] em28xx 3-6.1:1.0: found i2c device @ 0xa on bus 0 [???]
> [1289673.479679] em28xx 3-6.1:1.0: found i2c device @ 0xc on bus 0 [???]
> [1289673.515670] em28xx 3-6.1:1.0: found i2c device @ 0xe on bus 0 [???]
> [1289673.551677] em28xx 3-6.1:1.0: found i2c device @ 0x10 on bus 0 [???]
> [1289673.587676] em28xx 3-6.1:1.0: found i2c device @ 0x12 on bus 0
> ...
> [1289673.731619] em28xx 3-6.1:1.0: found i2c device @ 0x1a on bus 0 [???]
> [1289673.767693] em28xx 3-6.1:1.0: found i2c device @ 0x1c on bus 0 
> [lgdt330x]
> [1289673.803653] em28xx 3-6.1:1.0: found i2c device @ 0x1e on bus 0 [???]
> ...
> [1289674.343675] em28xx 3-6.1:1.0: found i2c device @ 0x3c on bus 0 [???]
> [1289674.379684] em28xx 3-6.1:1.0: found i2c device @ 0x3e on bus 0 
> [remote IR sensor]
> [1289674.415694] em28xx 3-6.1:1.0: found i2c device @ 0x40 on bus 0 [???]
> ...
> [1289674.559677] em28xx 3-6.1:1.0: found i2c device @ 0x48 on bus 0 [???]
> [1289674.595700] em28xx 3-6.1:1.0: found i2c device @ 0x4a on bus 0 
> [saa7113h]
> [1289674.631664] em28xx 3-6.1:1.0: found i2c device @ 0x4c on bus 0 [???]
> [1289674.667686] em28xx 3-6.1:1.0: found i2c device @ 0x4e on bus 0 [???]
> [1289674.703679] em28xx 3-6.1:1.0: found i2c device @ 0x50 on bus 0 [???]
> [1289674.739682] em28xx 3-6.1:1.0: found i2c device @ 0x52 on bus 0 [drxk]
> [1289674.775677] em28xx 3-6.1:1.0: found i2c device @ 0x54 on bus 0 [???]
> ...
> [1289674.959691] em28xx 3-6.1:1.0: found i2c device @ 0x5e on bus 0 [???]
> [1289674.996673] em28xx 3-6.1:1.0: found i2c device @ 0x60 on bus 0 
> [remote IR sensor]
> [1289675.033557] em28xx 3-6.1:1.0: found i2c device @ 0x62 on bus 0 [???]
> ...
> [1289675.657060] em28xx 3-6.1:1.0: found i2c device @ 0x84 on bus 0 [???]
> [1289675.693792] em28xx 3-6.1:1.0: found i2c device @ 0x86 on bus 0 
> [tda9887]
> [1289675.729604] em28xx 3-6.1:1.0: found i2c device @ 0x88 on bus 0 
> [msp34xx]
> [1289675.765806] em28xx 3-6.1:1.0: found i2c device @ 0x8a on bus 0 [???]
> [1289675.801840] em28xx 3-6.1:1.0: found i2c device @ 0x8c on bus 0 [???]
> [1289675.837403] em28xx 3-6.1:1.0: found i2c device @ 0x8e on bus 0 
> [remote IR sensor]
> [1289675.876565] em28xx 3-6.1:1.0: found i2c device @ 0x90 on bus 0 [???]
> ...
> [1289676.132445] em28xx 3-6.1:1.0: found i2c device @ 0x9e on bus 0 [???]
> [1289676.172344] em28xx 3-6.1:1.0: found i2c device @ 0xa0 on bus 0 
> [eeprom]
> [1289676.213537] em28xx 3-6.1:1.0: found i2c device @ 0xa2 on bus 0 [???]
> ...
> [1289676.583679] em28xx 3-6.1:1.0: found i2c device @ 0xb6 on bus 0 [???]
> [1289676.619965] em28xx 3-6.1:1.0: found i2c device @ 0xb8 on bus 0 
> [tvp5150a]
> [1289676.660327] em28xx 3-6.1:1.0: found i2c device @ 0xba on bus 0 
> [webcam sensor or tvp5150a]
> [1289676.695689] em28xx 3-6.1:1.0: found i2c device @ 0xbc on bus 0 [???]
> [1289676.731703] em28xx 3-6.1:1.0: found i2c device @ 0xbe on bus 0 [???]
> [1289676.771679] em28xx 3-6.1:1.0: found i2c device @ 0xc0 on bus 0 
> [tuner (analog)]
> [1289676.811775] em28xx 3-6.1:1.0: found i2c device @ 0xc2 on bus 0 
> [tuner (analog)]
> [1289676.847689] em28xx 3-6.1:1.0: found i2c device @ 0xc4 on bus 0 
> [tuner (analog)]
> [1289676.883683] em28xx 3-6.1:1.0: found i2c device @ 0xc6 on bus 0 
> [tuner (analog)]
> [1289676.919678] em28xx 3-6.1:1.0: found i2c device @ 0xc8 on bus 0 [???]
> ...
> [1289677.923688] em28xx 3-6.1:1.0: found i2c device @ 0xfe on bus 0 [???]
> 
> This stick seems to be a newer version of a
> 2013:0258 PCTV Systems DVB-S2 Stick 461e,
> which is working fine.
> 
> There seems to be some info on
> https://github.com/b-rad-NDi/Ubuntu-media-tree-kernel-builder/ 
> issues/176 , with a patch
>   0003-em28xx-Add-Hauppauge-461e-v3.patch mentioned on https:// 
> launchpad.net/~b-rad/+archive/ubuntu/test-test-hw-staging/ 
> +sourcepub/16955432/+listing-archive-extra.
> 
> Let me know if you need any more info.
> 
> Best regards
> Michael Fritscher
> 


