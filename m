Return-Path: <linux-media+bounces-7685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD97887C6F
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 12:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027C4281532
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 11:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C05D175BC;
	Sun, 24 Mar 2024 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b="mKOYkhU2"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15717BBB
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711278473; cv=none; b=dhdHr4OY8Zb98sVE20zGK3yz2sgkKOFgFDwcrgXLmG0FDcQwrW9BVIyIUlC2rP0i08aJHISfbaNbrTbb+bwTDbfj25IsYBod4oa1BbSP4PiL0lP+ef5iNE0+bGCWKT88GndP8dbvF1ta6xjn9TwN5RxlAD3mnwh6HFwCvsN5EbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711278473; c=relaxed/simple;
	bh=rQSGqh8ZgQlbovmB8agL76tg0pX748kFaVdBRhbBibE=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:To:Subject; b=Vgz5rTi8DUl1LcY9tmSlGykInarq9q6QbYcdyguXGoZwkvl4pGXJHZvogGD643sRYJ73tRNxNf5W/TeCfvGWf5g0ednufntKljOrr2jDRR/3D8zy1XJcp8TUF8v9YJPcVGurb/xmgdj3+tZ0LVn1UtN+RCCANRIjdmaWso2F8ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b=mKOYkhU2; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1711278468; x=1711883268; i=yarny@public-files.de;
	bh=rQSGqh8ZgQlbovmB8agL76tg0pX748kFaVdBRhbBibE=;
	h=X-UI-Sender-Class:Date:From:To:Subject;
	b=mKOYkhU2LnchuEkuHaoZShi2Ty/pmT1POk3UT7neuctRkjJOf1o24o24B86094sr
	 ZjvSkhucRWkZ5WFcHJiZO2aF9gkxV53YfMCye+hq1gmXIyJgC4m2pikvpIbyPxAg4
	 FO0jjscFQXjQB3HItaQcaGj53xdbp6zk3m+Ieel5Nf8XgwDBoPiRcm1SldAYSIc+7
	 pPjpMIFRPBpnU7micvUJp/vmQx6r3JIVZGYqGAsqKW5vAEmKEAIRyfxn32GfsI/HF
	 /uXA3r8bnNhhXPNtUCDhp76W+K51rMXDpvtLMFNNS29Zn1Ve/XxBUYuhwlYIZVVPQ
	 yzGkzSNgHAZ2lpu9+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([178.27.100.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1sXtbN2wNx-00jXZZ; Sun, 24
 Mar 2024 12:07:48 +0100
Content-Type: multipart/mixed; boundary="------------y21WNfg5LTrkdRp8rT8J5Qs4"
Message-ID: <75149976-693b-444e-b4cc-dd2dd86ea1d7@public-files.de>
Date: Sun, 24 Mar 2024 11:07:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: de-DE, en-US
From: Yarny <Yarny@public-files.de>
To: linux-media@vger.kernel.org
Subject: dtv-scan-tables: Gaisberg update and tarballs
X-Provags-ID: V03:K1:0dlBk4ZpSgNNTS9/QF+uBdUd5ReE69khfgFXq3i6mzxNT2t8iDs
 nP8a4zCODCFZeoyhIddssAkF8jgUzmUWPn+Q9OtEP39HN976Kt87NwUh3S9Y4Qes1XQyJIU
 dVVKIiOv+9V7dASnWDaQGZ7E30PPVOOfkX3+85ypzoRxfWVf68ZyCWZmkeXUZF8cI1L+hkn
 tDgrRNuOgOVDHk5nDSq8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fchUz+ytXrw=;2BKCHTUaKVDe0QUN5bgrl6RQyIj
 3AH+SF3JLTwzZJu83vRgkCrAELnxe0iFxXfl34Crw6kwvguc1HKcs05cNvidt9YUE9IdpvBqG
 NBCMOnLBm6kihU5yJJz9D4gfgMMcRu00UTf1a/oBoTYc4y7x4ivR5q9vDhbYHCwrHwgTe0Eso
 8te/aQCifeRat3oPweA1jrzZK43AagBsjVUFj9lJRnTdyCwX4R4R42C0Xtivkm0HqS3l6PQDv
 wd4kXq2UH8X6hh5VfbMcg3Gv1KYg/zVjvtMn+B9KK0XuUVRbsACd5IvoIL1Gth2YrF8Y8FNh2
 nzwUbVzU2n9fz8/vSp94/6yEt9wXUyy+UVwYn55oNEM0cXIix2ghZmsW6Rtbi/s2STdVj2eSu
 YS8HMp/3AaiicNpjeOC4di5rdTyJ9XC73css31OGfM5kEtDFJtz9Gsn0s1AQFITyJt47OvFAv
 XzlKfYQ2RsFwSZUI5dH1NZy+RSpM0yC7yiqRikBBOsC645SWMR06fny4BN3hidTqkAq1Hbz6s
 +PDNB9RZSayEfRvsLxJdz//cQdqE9dJjPzTRIxXJYsJkQVf1Zz1lOB6EJtW7BRlTcLPYyqcmw
 boJsq+m3VxPM0YbqSGKUXyX21BFLrY6p8fhwM/9ZVUssdRdz6v+ldKFqp1F5iUVdCZV8IhSxR
 crz/ir0sDm7+/K6LWv3C91Wf5FPTlw1YXdKXGDGQ8Zuds6UI7J/+h9HI4+VsM4IpWvEpHcHlJ
 UYb0NT3M+iZh3qZcSxB0w4AY65jkQ9JTG01Rjipn18vHqZW/reDKnXr6XcGK1G10a4rgQ62BZ
 RqSRAfkPklAgA5974AJpADGLnxMgbOUVPb6kbmeJfpiS8=

This is a multi-part message in MIME format.
--------------y21WNfg5LTrkdRp8rT8J5Qs4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi linux-media,

please find attached a patch for dtv-scan-tables that
adds a missing dvb-t2 transmitting station from Austria.

Also:
I'm maintaining the dtv-scan-tables package of NixOS.
Are the tarballs in
https://linuxtv.org/downloads/dtv-scan-tables/
still updated?
Or should we abandon that source and
fetch directly from the git repo instead?

Thanks and best regards -- Yarny
--------------y21WNfg5LTrkdRp8rT8J5Qs4
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-dvb-t-at-All-add-Salzburg-Gaisberg-dvb-t2-transponde.patch"
Content-Disposition: attachment;
 filename*0="0001-dvb-t-at-All-add-Salzburg-Gaisberg-dvb-t2-transponde.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiNGYyYTY4OTZkYzA1OTNhMmQ4NDY1NzU3MmM3ZDYyMDQ3Mjg4MzljIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBZYXJueSA8WWFybnlAcHVibGljLWZpbGVzLmRlPgpE
YXRlOiBTdW4sIDI0IE1hciAyMDI0IDExOjM5OjU2ICswMTAwClN1YmplY3Q6IFtQQVRDSF0g
ZHZiLXQvYXQtQWxsOiBhZGQgU2FsemJ1cmcvR2Fpc2JlcmcgZHZiLXQyIHRyYW5zcG9uZGVy
cwoKVGFrZW4gZnJvbQpodHRwczovL2RlLndpa2lwZWRpYS5vcmcvdy9pbmRleC5waHA/dGl0
bGU9U2VuZGVyX0dhaXNiZXJnJm9sZGlkPTI0MzI2NDE3OAoKTWF5YmUgdGhlc2Ugc2hvdWxk
IGJlIHNwbGl0IGludG8gc2VwYXJhdGUgYXQtKgpmaWxlcywgZWFjaCBmb3Igb25lIEF1c3Ry
aWFuIHRyYW5zbWl0dGVyIHN0YXRpb24uCkhvd2V2ZXIsIEkgZG9uJ3Qga25vdyBtdWNoIGFi
b3V0IG90aGVycyAtLQpJIGNhbiBoYXJkbHkgcmVjZWl2ZSBzaWduYWxzIGZyb20gR2Fpc2Jl
cmcuClRoZXNlIGFyZSBub3cgbWFya2VkIHdpdGggZGlzdGluY3QgbmFtZXMgIkdhaXNiZXJn
LSIKdG8gZmFjaWxpdGF0ZSBmdXJ0aGVyIHN0cnVjdHVyaW5nIGxhdGVyb24uCi0tLQogZHZi
LXQvYXQtQWxsIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kdmItdC9hdC1BbGwgYi9kdmItdC9hdC1BbGwKaW5kZXggYjgzMzYzZDEuLmFj
ZTllMzYxIDEwMDY0NAotLS0gYS9kdmItdC9hdC1BbGwKKysrIGIvZHZiLXQvYXQtQWxsCkBA
IC03NiwzICs3Niw2NyBAQAogCUlOVkVSU0lPTiA9IEFVVE8KIAlTVFJFQU1fSUQgPSAxCiAK
K1tHYWlzYmVyZy1NVVhBLUszMl0KKwlERUxJVkVSWV9TWVNURU0gPSBEVkJUMgorCUZSRVFV
RU5DWSA9IDU2MjAwMDAwMAorCUJBTkRXSURUSF9IWiA9IDgwMDAwMDAKKwlDT0RFX1JBVEVf
SFAgPSBBVVRPCisJQ09ERV9SQVRFX0xQID0gQVVUTworCU1PRFVMQVRJT04gPSBRQU0vQVVU
TworCVRSQU5TTUlTU0lPTl9NT0RFID0gQVVUTworCUdVQVJEX0lOVEVSVkFMID0gQVVUTwor
CUhJRVJBUkNIWSA9IEFVVE8KKwlJTlZFUlNJT04gPSBBVVRPCisJU1RSRUFNX0lEID0gMQor
CitbR2Fpc2JlcmctTVVYQi1LMjldCisJREVMSVZFUllfU1lTVEVNID0gRFZCVDIKKwlGUkVR
VUVOQ1kgPSA1MzgwMDAwMDAKKwlCQU5EV0lEVEhfSFogPSA4MDAwMDAwCisJQ09ERV9SQVRF
X0hQID0gQVVUTworCUNPREVfUkFURV9MUCA9IEFVVE8KKwlNT0RVTEFUSU9OID0gUUFNL0FV
VE8KKwlUUkFOU01JU1NJT05fTU9ERSA9IEFVVE8KKwlHVUFSRF9JTlRFUlZBTCA9IEFVVE8K
KwlISUVSQVJDSFkgPSBBVVRPCisJSU5WRVJTSU9OID0gQVVUTworCVNUUkVBTV9JRCA9IDEK
KworW0dhaXNiZXJnLU1VWEQtSzQ3XQorCURFTElWRVJZX1NZU1RFTSA9IERWQlQyCisJRlJF
UVVFTkNZID0gNjgyMDAwMDAwCisJQkFORFdJRFRIX0haID0gODAwMDAwMAorCUNPREVfUkFU
RV9IUCA9IEFVVE8KKwlDT0RFX1JBVEVfTFAgPSBBVVRPCisJTU9EVUxBVElPTiA9IFFBTS9B
VVRPCisJVFJBTlNNSVNTSU9OX01PREUgPSBBVVRPCisJR1VBUkRfSU5URVJWQUwgPSBBVVRP
CisJSElFUkFSQ0hZID0gQVVUTworCUlOVkVSU0lPTiA9IEFVVE8KKwlTVFJFQU1fSUQgPSAx
CisKK1tHYWlzYmVyZy1NVVhFLUszOF0KKwlERUxJVkVSWV9TWVNURU0gPSBEVkJUMgorCUZS
RVFVRU5DWSA9IDYxMDAwMDAwMAorCUJBTkRXSURUSF9IWiA9IDgwMDAwMDAKKwlDT0RFX1JB
VEVfSFAgPSBBVVRPCisJQ09ERV9SQVRFX0xQID0gQVVUTworCU1PRFVMQVRJT04gPSBRQU0v
QVVUTworCVRSQU5TTUlTU0lPTl9NT0RFID0gQVVUTworCUdVQVJEX0lOVEVSVkFMID0gQVVU
TworCUhJRVJBUkNIWSA9IEFVVE8KKwlJTlZFUlNJT04gPSBBVVRPCisJU1RSRUFNX0lEID0g
MQorCitbR2Fpc2JlcmctTVVYRi1LNDJdCisJREVMSVZFUllfU1lTVEVNID0gRFZCVDIKKwlG
UkVRVUVOQ1kgPSA2NDIwMDAwMDAKKwlCQU5EV0lEVEhfSFogPSA4MDAwMDAwCisJQ09ERV9S
QVRFX0hQID0gQVVUTworCUNPREVfUkFURV9MUCA9IEFVVE8KKwlNT0RVTEFUSU9OID0gUUFN
L0FVVE8KKwlUUkFOU01JU1NJT05fTU9ERSA9IEFVVE8KKwlHVUFSRF9JTlRFUlZBTCA9IEFV
VE8KKwlISUVSQVJDSFkgPSBBVVRPCisJSU5WRVJTSU9OID0gQVVUTworCVNUUkVBTV9JRCA9
IDEKLS0gCjIuNDIuMAoK

--------------y21WNfg5LTrkdRp8rT8J5Qs4--

