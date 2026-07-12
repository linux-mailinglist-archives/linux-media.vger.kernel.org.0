Return-Path: <linux-media+bounces-67386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EQwnAe1jU2rwaQMAu9opvQ
	(envelope-from <linux-media+bounces-67386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 11:52:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4889574451A
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 11:52:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=dorfdsl.de header.s=default header.b=H5m4LE0h;
	dmarc=pass (policy=none) header.from=dorfdsl.de;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67386-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67386-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF837301227A
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 09:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CD0375F82;
	Sun, 12 Jul 2026 09:52:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from srv1.dorfdsl.de (srv1.dorfdsl.de [82.139.252.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA59C2F39B5
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 09:52:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849958; cv=none; b=WpSlqFi/YAKtVnj0cdSWpfg3tjlnWM5SgYqZ3r6oxzQsQDIcP0uwRmlzkYDy/wHThZE18PJ5rjYR+Z6oV2+edMuUFl1X448lelmbFfCSQZHLDel9ay73sBUNQ7Zstu5wbIhxTvvQdTdtfswd8h422mjd/CmWKKHnnJd+0x1UYVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849958; c=relaxed/simple;
	bh=GSnfxiBBRpSKwt5zRlRI8Zhzrrotk5Vr1K05fsv33EA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=LR2nAUqE/cvBlV1b1p/+xh61nW0j3pZSoXMbo59j9jVQ2gn3pDSZd/mt/8FB1IcgzKK/4Cv7ZLwoqCnGZPPsZQMjc9llJ8DaE73n2wiOCL59G0qBy15aBg0IrfN+R9d52nAMhNcRwEJjUtkMFPU99IYVd8Ydt0u6+5lvJFAQXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dorfdsl.de; spf=pass smtp.mailfrom=dorfdsl.de; dkim=pass (2048-bit key) header.d=dorfdsl.de header.i=@dorfdsl.de header.b=H5m4LE0h; arc=none smtp.client-ip=82.139.252.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorfdsl.de;
	s=default; t=1783849954;
	bh=GSnfxiBBRpSKwt5zRlRI8Zhzrrotk5Vr1K05fsv33EA=;
	h=Date:To:From:Subject:From;
	b=H5m4LE0hjXxFg1Y9sTRWN24CLNLrB0w6JYMR3FSzkZb0PXTenVoc4zYmwBEQVz9BA
	 2yOmtAH+wPuRrYs0QpGdQ/WdhXZ1bnaZ36VTo5t7mbQ+UtKFj/TYVEvGENF4CR9G7m
	 nJufanaQWDt7xAi0L9EPkDazt4QaUvsj3UB+eqn31AshML3KYJ5wn+sJvCmQuEvAl9
	 IkJH/dOet3M1EcaIwqhMQ69p0A0YvVHCw8Wn0hpLpk3EyfB6YZcJFodz+Icz+LYD2m
	 Ak3DuIS/LYXdcNmB4+ptpj/niS3VA3e8B0kGbBtiTrmnNNBZHsN823VC6pBG9Nusju
	 0dYkbHru6gu2w==
Received: from [IPV6:2a01:170:118f:1:f5f4:a4f0:5b6b:d795] ([IPv6:2a01:170:118f:1:f5f4:a4f0:5b6b:d795])
	(authenticated bits=0)
	by srv1.dorfdsl.de (8.18.1/8.18.1/Debian-6) with ESMTPSA id 66C9qYT5018308
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 11:52:34 +0200
Message-ID: <bb61a80f-70d4-4c75-b3a0-cec733662bd9@dorfdsl.de>
Date: Sun, 12 Jul 2026 11:52:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:152.0) Gecko/20100101
 Thunderbird/152.0
To: linux-media@vger.kernel.org
Content-Language: en-US, de-DE
From: Marco Moock <mm@dorfdsl.de>
Subject: gspca_zc3xx Logitech QuickCam Communicate STX LED not working
Autocrypt: addr=mm@dorfdsl.de; keydata=
 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
 MCwzZXR/AA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[dorfdsl.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[dorfdsl.de:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67386-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mm@dorfdsl.de,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[dorfdsl.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mm@dorfdsl.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,dorfdsl.de:from_mime,dorfdsl.de:email,dorfdsl.de:mid,dorfdsl.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4889574451A

Hello!

The LED is not working with the Linux driver, in Windows, it works.

In dmesg I see messages like this:
gspca_zc3xx 1-8.2:1.0: URB error -71, resubmitting

Any ideas?

-- 
kind regards
Marco

Junk-Mail bitte an trashcan@stinkedores.dorfdsl.de


