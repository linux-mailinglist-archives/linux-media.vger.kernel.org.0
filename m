Return-Path: <linux-media+bounces-51081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8EFD3B73D
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 20:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95EC0300874A
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 19:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E0229B777;
	Mon, 19 Jan 2026 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=loescher@gmx.de header.b="VLL+b6lk"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D7C287502
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 19:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850701; cv=none; b=WzdYa2dqEDy2HC6eGnJJhkHObp8CTOwDhiBZI1TZ9AqSP8dKveOKahDpauDz+LR9TZ77X5UqFtsoOKlrsip9I13utsDDvhEpqGRAbexUIKsPxH2HTmHPX3+y5GpTMh4iZpzooiVPPefZ/2JY6miY4Vu5naf1wXbCCiD0Yrod0cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850701; c=relaxed/simple;
	bh=PE2wfgi4rebnbvmGHpFs2idEvhbdD55cc4cm0v0ZxX8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=mnrAXSOYdTRH+5g7C9potW5XHKTiMCucUouDqj3Cy5SxSlUJe5dxeZN4IkbUb1pCXku9kzhI7pU9PKSehIHewMmn7qNCSckZqhhtXIHswZVVwjKO3a0tAWuJg421Jho2D7mcMioqyZmJSqPZ0jF89gxyA3NGkYjvWqmTOFhLg0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=loescher@gmx.de header.b=VLL+b6lk; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768850697; x=1769455497; i=loescher@gmx.de;
	bh=PE2wfgi4rebnbvmGHpFs2idEvhbdD55cc4cm0v0ZxX8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 References:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VLL+b6lkLpxUSQ1CAbh19feu/uFnqJn8TeAz+fuf/An4MpsDsipcnmTMC6CK69az
	 NHxKpcU0msUSEezNYAzQ/UaoWinK+eRnVXyRLbSGWVQvbBTCK2CX4l+dSNRpEOU8q
	 mJpKWmFvlz/ePzo1fu6njfWSVa/1y1aLDR8apL9FSNAR+W72EQ+2j1lCxgPXGgIBY
	 4MSiYLnYRDCt7v+37Pc5v97ZX+tjk//ygmGfFQywzJvDSO/vGjLp8aMWwuO3V0ReP
	 LfHSX7HLS5evS9vTXzXsI6eDExL06s6Q16TUQ4QANHG97/K1Ymr71NrUuckMpRbRi
	 5deJihienUHw2gvTUQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.212] ([87.122.210.179]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlXK-1w6Ymt19V8-00ocMc; Mon, 19
 Jan 2026 20:24:57 +0100
Message-ID: <74e3b0c9-02da-4f1f-8d6a-d2a63550b710@gmx.de>
Date: Mon, 19 Jan 2026 20:24:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: cinergyT2-core.c
From: Stephan Loescher <loescher@gmx.de>
To: linux-media@vger.kernel.org
References: <1feb7bb2-75a7-4ca3-976b-af9edb123c3c@gmx.de>
Content-Language: en-US, de-DE
Cc: mchehab@kernel.org
In-Reply-To: <1feb7bb2-75a7-4ca3-976b-af9edb123c3c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:/4Oz5P66x8xgYRN6IKJpa6M6vDjA1qFXK/ow+jJKp27Do+7VBmZ
 wPPnOIanEbDQl6i1v8HCDdzddKMKMTKwY4psZzNXSdHcBE38n2DCOVnTOErCDdXknaNiMXe
 K7pCGf4InZ/MNqc3Wd77ZA6xncESD+4RoDrUcEdj2oUpuUVEwqV8yFU3IX8IxVK6alw6Rbt
 SbddQIOtBO4mlUWw+MbhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rd81wXWRVdQ=;OI3Mvi8ToG4Dw+cZ+GH3yQ/yNvx
 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
 R8uvaKv50mRezEpFyrW3Hnq+yHzXT/hbtYfXazELDquOb7woBLWg717ILgy0LqUOHwN0o599R
 SFg4LYb0234wMKvwftPME9xW3SdITRUYFO/QwOzK2tLGqTZwOyJRVEPV0XrVzrb2F+D0RcVLg
 pxYdyiWw0Zfsb7knnkPiZk/6DT5B2buv/KBClDd/4LytrHv

RGVhciBMaW51eCBkZXZlbG9wZXJzLA0KDQpJIGhvcGUgSSBmb3VuZCB0aGUgcmlnaHQgd2F5
IHRvIHJlcG9ydCBhIExpbnV4IEtlcm5lbCBidWcgZm9yIHRoZSBmaWxlDQpkcml2ZXJzL21l
ZGlhL3VzYi9kdmItdXNiL2NpbmVyZ3lUMi1jb3JlLmMNCklmIG5vdCwgcGxlYXNlIHRlbGwg
bWUhDQoNCklzc3VlIGlzOiBJIGhhdmUgYSBUZXJyYXRlYyBDaW5lcmd5IFQyIGFuZCB3aGVu
IEkgcHJlc3MgdGhlIFVQL0RPV04vDQpMRUZUL1JJR0hUIGJ1dHRvbnMgb24gdGhlIHJlbW90
ZSBjb250cm9sLCB0aGlzIGtleXByZXNzIGlzIHJlcGVhdGVkDQplbmRsZXNzbHksIHdoaWNo
IEkgY2FuIHNlZSBpbiBldnRlc3QuDQpJIG1hZGUgYSB3b3JrYXJvdW5kIGZvciB0aGlzIHdp
dGggdGhpcyBsaXR0bGUgcGF0Y2g6DQoNCi0tLSBjaW5lcmd5VDItY29yZS5jLm9yaWfCoMKg
wqAgMjAyNi0wMS0xMiAxMzoxNTozOC4zMDcxODY5NTUgKzAxMDANCisrKyBjaW5lcmd5VDIt
Y29yZS5jwqDCoMKgIDIwMjYtMDEtMTIgMTM6MTU6NTUuMjU2MzA1NjM5ICswMTAwDQpAQCAt
MTI5LDEwICsxMjksNiBAQA0KICDCoCNkZWZpbmUgUkNfUkVQRUFUX0RFTEFZIDMNCg0KICDC
oHN0YXRpYyBpbnQgcmVwZWF0YWJsZV9rZXlzW10gPSB7DQotwqDCoMKgIEtFWV9VUCwNCi3C
oMKgwqAgS0VZX0RPV04sDQotwqDCoMKgIEtFWV9MRUZULA0KLcKgwqDCoCBLRVlfUklHSFQs
DQogIMKgwqDCoMKgIEtFWV9WT0xVTUVVUCwNCiAgwqDCoMKgwqAgS0VZX1ZPTFVNRURPV04s
DQogIMKgwqDCoMKgIEtFWV9DSEFOTkVMVVAsDQoNCkkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0
IHRoZSBjb2RlIGRvZXMgd2l0aCB0aGF0ICJyZXBlYXRhYmxlX2tleXMiLCBidXQNCmFmdGVy
IEkgcmVtb3ZlZCB0aGVtIGZyb20gdGhhdCBhcnJheSBhbmQgaW5zZXJ0ZWQgdGhlIGNoYW5n
ZWQgS2VybmVsDQptb2R1bGUsIHRoZSByZW1vdGUgY29udHJvbCBzZW5kcyBvbmx5IHNpbmds
ZSBrZXkgcHJlc3NlcyBhcyBleHBlY3RlZC4NCkNhbiB5b3UgcGxlYXNlIHJldmlldyBhbmQg
aG9wZWZ1bGx5IGNoYW5nZSB0aGUgY29kZT8NCkkgdGhpbmsgYWxsIG90aGVyIENpbmVyZ3kg
b3duZXJzIG1pZ2h0IGJlIGhhcHB5LCB0b28uIDotKQ0KDQpUaGUgb3RoZXIga2V5cyBpbiB0
aGUgcmVwZWF0YWJsZV9rZXlzIGFycmF5IHNob3cgdGhlIHNhbWUgaXNzdWUsIGJ1dCBJDQpk
b24ndCBuZWVkIHRoZW0uDQoNCkkgdXNlZCBLZXJuZWwgdmVyc2lvbiA2LjE4LjQuDQoNCkJl
c3QgcmVnYXJkcywNClN0ZXBoYW4uDQoNCg==

