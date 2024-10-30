Return-Path: <linux-media+bounces-20611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D75489B6EB3
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 22:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F1A1C21A80
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 21:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE69721500E;
	Wed, 30 Oct 2024 21:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=doss@gmx.de header.b="BCrJqF7C"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AB81E1C09
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 21:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730323215; cv=none; b=OqjDK7QIIlUBOGPt1dltFVDaKXeHLmvw+O8G2PVBEt/BQSdxnGTKmDyELNvtLgpdn1HtyHxyCVlROpmkd4QkKR9ce10+j9qLrn+6B//iXw4iEpo/hxn+7KyizvLqIDe5KpAKeHqKpOHQ5G5eN1QhnkyrF0qcyhFGesJ0t8FgRmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730323215; c=relaxed/simple;
	bh=u3UPEIN8k7R/vxFIlhBvJ3+vgARofiAmRx6YdcxZ/ds=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=r4boILOYnXiNzeetxv7ILfPmu3hzKgpTg1gLQjvTVOW8Kvj9b9PkfN5iZR48RrsEvvXeJC6GgcDtxjpnwScCUBPG0PE3agJt5inOGG+eZniq4c32FtflPh32SE3eeXBTZ72iRgP0c2XCXsiCwDZYrPw+7u4AYSHWSLXESikXdz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=doss@gmx.de header.b=BCrJqF7C; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1730323210; x=1730928010; i=doss@gmx.de;
	bh=u3UPEIN8k7R/vxFIlhBvJ3+vgARofiAmRx6YdcxZ/ds=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BCrJqF7CCpJppU5FDaPyAU7xG0Zvaxa3ele8rP6BVYHPOufkNixDP4NTMouqprxn
	 F+ulClnwFakvIOP/beDgykaTlpzDdWHf23x7HGnkq8AP/gmAkxaa/WikmpiaMr6A/
	 aFJ+a3ebHXSNWfDzlh9vjtFlvmg3Pt0hctAVdLbbxkm9zFaoPmP+7+T5HRagO9jx0
	 XOtAN9TBZi0Y/qFoCqi2+pVvQgGKS1wlCH5WgBUIa9h/S9TU6BkD8M4MSwTxfwVFH
	 ZT3GjgIihHxS+/1AMOUFnRCqM6VY3+x2qwuF0RAvgCVSFVvQGWcpBP3oq76e5MX8i
	 wbboo3ZoFFRRaOlbXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.36] ([95.90.24.117]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0JW-1tYh7424NM-00qDBQ for
 <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 22:20:10 +0100
Message-ID: <7259fb77-0fa0-4f57-a0cb-cf99da6218ec@gmx.de>
Date: Wed, 30 Oct 2024 22:20:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Doss?= <doss@gmx.de>
Subject: video rotate or flip
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:74WEZ4p591yX2CIEWfSvaS33JHRrYpnqIdUZVZcbDickLrRCQPD
 ju6ZVnOoegIzp3Nq8g1unmYxowxZUEOpWUS3LGyvWDkESvKBW0NmVcI+c6tC+kxBINr6P27
 sFcZI2+yTe6ucMJicbYwUygP8uXBGXW9xCEVETBsL6sVEBDLMfoPneYI/nppTzi5wDIXIGd
 supusvtk7MJ1N5VXRxSFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OLLrSPK33sM=;CoOyyp7H71/0dqaC0hbvw0nKcfZ
 RyYb+0eHuju44Y17Ka3dYAC0zlX4sOjJeFUINEk20feCwfrcXBUcf88PKR/p4jxIY+my2JHKS
 MKmglILjOXTySakeYCs7kGVhWjz8P8J/A55sWM5P48/LzRgtsyMxOxL55BXoCO39F/XoslRmx
 rYM17wwPw6YUrHqoEK7uHarLf8P5/zJqdsAIAtHl8dMckuUGYL+3QPX+cC8hnpLVTwGwaRhrw
 g3hCK7Q+UKa0TolpZraMp45n2glZir3THOCPu0z5tk+yD8CPjsXT2Or/yNtmSzmbRl/huVUK1
 buApJW/XlURv7/bRXTWbnYsK4DFiumcMpcFHroir1FFLAKoM0jlfGh6KxxV9oBUmSHrZNLZuY
 VoJ9Ykjk+gqE9Bg34uKO20CMbFXN2sqp7N8xNVzuIErGRV6HefhU6hthhiyNkQwjTxOJEsUm3
 lMPjaJkc89VA7O4m6B/ROGMWVA/2zki9+hShQAwlaWr/7uiuanJe1tnHAR04TIgohYLUJms7Q
 2EISYRWT7UV8+qGcI97j9Cxm2cwKao9d3ohcQi5O+ShY9geYNSogs+D89z7wUi3a5n1ydTzSF
 H9+3mTgxCJ2QFzFMhCOaI+lfw1qRPT2+RCQOopzQlGPOdczgDCK+fLas4PEziP0J97aoRIQ0H
 wtHUrOo3g+TlE2/hIhdbk1YcaeIg6YMYzbbB22YUm+Buz5+ZJK15k7RnXKkc6Hu2SVb8bkuho
 g8S+rsTPQAWDIKdtT/jT1Cuv4hsGA+mzemEW+TEOY9iz9cvGrh0X5La49D6+Z+9OVvMtzoTWZ
 5l0dwffHjfAm0X+hb4EFGKDQ==

SGFsbG8sDQoNCkkgaGF2ZSB0byByb3RhdGUgdGhlIGNhbWVyYS4gSSBoYXZlIGEgb3B0aWNhbCBz
cGVjdHJvbWV0ZXIgYW5kIHRoZSANCnNwZWN0cnVtIGlzIG1pcnJvcmVkLg0KDQpJIGNhbiBub3Qg
dHVybiB0aGUgc2Vuc29yLiBJdCBpcyBhbGwgZml4ZWQgd2l0aCBnbHVlLg0KDQpIb3cgY2FuIEkg
c2V0IHRoZSBvcHRpb24gZmxpcCBvciByb3RhdGUgdGhlIHBpY3R1cmUgaW4gdGhlIGRyaXZlcj8N
Cg0KDQoNCkkgY29sbGVjdCBhbGwgbXkgZGF0YXMgb2YgbXkgdmlkZW9kZXZpY2UuDQoNCg0KbHN1
c2INCg0KDQpCdXMgMDAzIERldmljZSAwMDc6IElEIDBjNjg6NjQ2NCBTb25peCBUZWNobm9sb2d5
IENvLiwgTHRkLiBVU0IgMi4wIENhbWVyYQ0KDQoNCmxzbW9kIHxncmVwwqAgdmlkZW8NCnV2Y3Zp
ZGVvwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMDY0OTbCoCAwDQp2
aWRlb2J1ZjJfdm1hbGxvY8KgwqDCoMKgwqAgMjA0ODDCoCAxIHV2Y3ZpZGVvDQp2aWRlb2J1ZjJf
bWVtb3BzwqDCoMKgwqDCoMKgIDIwNDgwwqAgMSB2aWRlb2J1ZjJfdm1hbGxvYw0KdmlkZW9idWYy
X3Y0bDLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMzI3NjjCoCAxIHV2Y3ZpZGVvDQp2aWRlb2J1
ZjJfY29tbW9uwqDCoMKgwqDCoMKgIDc3ODI0wqAgNCANCnZpZGVvYnVmMl92bWFsbG9jLHZpZGVv
YnVmMl92NGwyLHV2Y3ZpZGVvLHZpZGVvYnVmMl9tZW1vcHMNCnZpZGVvZGV2wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjUzOTUywqAgMyANCnZpZGVvYnVmMl92
NGwyLHV2Y3ZpZGVvLHZpZGVvYnVmMl9jb21tb24NCm1jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCA2MTQ0MMKgIDQgDQp2aWRlb2Rldix2
aWRlb2J1ZjJfdjRsMix1dmN2aWRlbyx2aWRlb2J1ZjJfY29tbW9uDQp2aWRlb8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgNjE0NDDCoCAwDQoNCnY0
bDItY3RsIC0tbGlzdC1kZXZpY2VzDQpVU0IgMi4wIENhbWVyYTogVVNCLVpIICh1c2ItMDAwMDow
MDoxNC4wLTUpOg0KIMKgwqAgwqAvZGV2L3ZpZGVvMA0KIMKgwqAgwqAvZGV2L3ZpZGVvMQ0KDQpJ
IGhvcGUgeW91IGhhdmUgc29tZSBoaW50cy4NCg0KQmVzdCByZWdhcmRzDQoNCg0KUmVuw6kgRG9z
cw0KDQo=

