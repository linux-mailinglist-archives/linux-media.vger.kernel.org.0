Return-Path: <linux-media+bounces-35546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C57AE308D
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 17:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A6CA1891A29
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 15:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7B71E5B65;
	Sun, 22 Jun 2025 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b="YQJZL1u1"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3390F28EA
	for <linux-media@vger.kernel.org>; Sun, 22 Jun 2025 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750606528; cv=none; b=egMDxpfGToX6z1R4wucpz3WXugoPCBPPZpTaZaCg4JteYXtxlY04ePLaVqNzYhW2WYiSBWFolbcLFKiz6D9tRyYwDto38Szv639Aop2R6k6Sf2co1vkoZ7DFRRKl2CjGhgkLlxEUYTwswH35IvVJhhFs4hriTw2Ij3vFQX+O6bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750606528; c=relaxed/simple;
	bh=ZInQgYQVwNRnfRBtc3h5TzLjW+Yo6q9yegsxqak9yqU=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To; b=LLs6QOhlvHOfft77tB5yAt0TuM8M40GZT3OxRbtBkBYnOzBpAzgMb6r8qgNxRnrZWXIZPwTp3B5oIjMHKBC290hswGuxodYn0p01ux4rOQjaYVx0D9giiL+DdrN5DFUWEIHQOlIy3XVZ4QitDOeQQ4C+dDPcc0vDmG92MXFgAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b=YQJZL1u1; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1750606524; x=1751211324; i=yarny@public-files.de;
	bh=ZInQgYQVwNRnfRBtc3h5TzLjW+Yo6q9yegsxqak9yqU=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:From:
	 Subject:To:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=YQJZL1u1gUKI/Tal5yTlCTdoHrDC0Sce+x6R+lyt7biFxWXEsBcErW41WfJhxn4Q
	 rvZGtkOwPF97xUtV6gbmjKxhR8KMbAE7aMdO2wMO5PWu8sczV41U4YNz3/CAClGC3
	 sgqz7S1mhUqnvAfA/hze4f3GlCJVMe9wzzlALXpctGKqfqeduoekI8jtycXIWbfNQ
	 jWefaIN7pwtx0sNQH18yY0pE7Sb1d63iI7pI95Fj61HL+modRR/raG88db86F6ZsJ
	 rkNW8ir9HgZyzx0qbAWLZZjbF63pJBMzY//sc2TxmdbIl1aOBn3B+8dYEgbQ2f6Tf
	 xuGSKvGWY91coQ3TEw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([146.52.47.213]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYc0-1vAvT804RK-00jKfS; Sun, 22
 Jun 2025 17:35:24 +0200
Content-Type: multipart/mixed; boundary="------------yTneuir10qaTKPS04IM3EBqr"
Message-ID: <867c4d2e-7871-4280-8c89-d4b654597f32@public-files.de>
Date: Sun, 22 Jun 2025 15:35:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yarny <Yarny@public-files.de>
Subject: [PATCH v4l-utils] fix meson target directories
To: linux-media@vger.kernel.org
Content-Language: de-DE, en-US
X-Provags-ID: V03:K1:T7l5vJgeFRQJwCjlzmCqS6nCK0BAMedT67AloYG9DVE0j6I5ksJ
 2FQ4dcr+EkpLGEwr7yAsEJ1TbCk2x0pc6Lr79DvJmb/dxi8ufqH8rYA0mdgItePTKoJoVxr
 1xs88oLyUy6cEhaMNWZ2PGKXyQLOme5Jp1Xdc/TPcsUqR/PT7zjrszrN77oh2whBFNQpJVg
 1UFnhXg493hNG/wiEFOcw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mcH0KDkvBEQ=;u/7Sb3702EO30BgrVd8f0uTplib
 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

This is a multi-part message in MIME format.
--------------yTneuir10qaTKPS04IM3EBqr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi linux-media,

please find attached two patches for current v4l-utils
master branch that fix packaging errors with meson.
I stumbled over those bugs while I tried to package
v4l-utils within the NixOS linux distribution.

Thanks and best regards -- Yarny
--------------yTneuir10qaTKPS04IM3EBqr
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-meson.build-use-localedir-for-LOCALEDIR.patch"
Content-Disposition: attachment;
 filename="0001-meson.build-use-localedir-for-LOCALEDIR.patch"
Content-Transfer-Encoding: base64

RnJvbSBhZDQyY2VjNWFiZTg2MzUwYjM5Mjc2NzZkY2I3YjBhOGYxNTMyOGE3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBZYXJueTAgPFlhcm55QHB1YmxpYy1maWxlcy5kZT4K
RGF0ZTogRnJpLCAyMCBKdW4gMjAyNSAyMDoyMTo0NiArMDIwMApTdWJqZWN0OiBbUEFUQ0gg
djRsLXV0aWxzIDEvMl0gbWVzb24uYnVpbGQ6IHVzZSBgbG9jYWxlZGlyYCBmb3IgYExPQ0FM
RURJUmAKCk1lc29uIGtub3dzIGFib3V0IHRoZSBvcHRpb24gYGxvY2FsZWRpcmAuCgpodHRw
czovL21lc29uYnVpbGQuY29tL0J1aWx0aW4tb3B0aW9ucy5odG1sCgpXZSBzaG91bGQgdXNl
IGl0IGZvciBsb2NhbGUgZmlsZXMgc28gdGhleSBlbmQgdXAgaW4gdGhlIHByb3BlcgpwYWNr
YWdlIHdoZW4gdGhlIGJ1aWxkIG91dHB1dHMgYXJlIHNwbGl0IGludG8gc2VwYXJhdGUgcGFj
a2FnZXMuCi0tLQogbWVzb24uYnVpbGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21l
c29uLmJ1aWxkCmluZGV4IDg4NzgxZTU5Li45MTlkNGI5OSAxMDA2NDQKLS0tIGEvbWVzb24u
YnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAgLTE3Nyw3ICsxNzcsNyBAQCBpZiBjYy5oYXNf
ZnVuY3Rpb24oJ3N0cmVycm9ybmFtZV9ucCcpCiAgICAgY29uZi5zZXQoJ0hBVkVfU1RSRVJS
T1JOQU1FX05QJywgMSkKIGVuZGlmCiAKLWNvbmYuc2V0X3F1b3RlZCgnTE9DQUxFRElSJywg
Z2V0X29wdGlvbigncHJlZml4JykgLyBnZXRfb3B0aW9uKCdkYXRhZGlyJykgLyAnbG9jYWxl
JykKK2NvbmYuc2V0X3F1b3RlZCgnTE9DQUxFRElSJywgZ2V0X29wdGlvbigncHJlZml4Jykg
LyBnZXRfb3B0aW9uKCdsb2NhbGVkaXInKSkKIAogIyBNZXNvbiAwLjYwIGhhbmRsZXMgdGhl
IGljb252IGRlcGVuZGVuY3kgbmF0aXZlbHkuIEZvciBvbGRlciB2ZXJzaW9ucywgZmFsbAog
IyBiYWNrIHRvIG1hbnVhbCBjaGVja3MgZm9yIHRoZSBpY29udl9vcGVuIGZ1bmN0aW9uIGlu
IGxpYmMsIG9yIGZpbmRpbmcgYW4KLS0gCjIuNDkuMAoK
--------------yTneuir10qaTKPS04IM3EBqr
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-lib-libdvbv5-meson.build-use-includedir-also-for-lib.patch"
Content-Disposition: attachment;
 filename*0="0002-lib-libdvbv5-meson.build-use-includedir-also-for-lib.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzZjlhY2EwYjMzMDhkZDcyZDg3NjgzY2JkODg5NDZiOTg5MTUxYzMzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBZYXJueTAgPFlhcm55QHB1YmxpYy1maWxlcy5kZT4K
RGF0ZTogRnJpLCAyMCBKdW4gMjAyNSAyMDoyNDoyNCArMDIwMApTdWJqZWN0OiBbUEFUQ0gg
djRsLXV0aWxzIDIvMl0gbGliL2xpYmR2YnY1L21lc29uLmJ1aWxkOiB1c2UgYGluY2x1ZGVk
aXJgIGFsc28KIGZvciBgbGliZHZiLXZlcnNpb24uaGAKCkhlYWRlciBmaWxlcyBhcmUgY29w
aWVkIGludG8gdGhlIGBpbmNsdWRlZGlyYCBieSBNZXNvbi4KSG93ZXZlciwgYGxpYmR2Yi12
ZXJzaW9uLmhgIGlzIG5vdCB0cmVhdGVkIGFzIG5vcm1hbAppbmNsdWRlIGZpbGUsIGJ1dCBj
b3BpZWQgd2l0aCBgY29uZmlndXJlX2ZpbGVgLgpUaGlzIG1lYW5zIHdlIGhhdmUgdG8gZXhw
bGljaXRseSBkZWNsYXJlIHRoZSB0YXJnZXQgZGlyZWN0b3J5LgoKVGhlIGNvbW1pdCBhdCBo
YW5kIGZpeGVzIHRoZSB0YXJnZXQKZGlyZWN0b3J5IHRvIHBvaW50IHRvIE1lc29uJ3MgYGlu
Y2x1ZGVkaXJgLgpUaGF0IGlzIG5lY2Vzc2FyeSBzbyB0aGUgZmlsZSBlbmRzIHVwIHdoZXJl
IGFsbCBoZWFkZXIgZmlsZXMgZ28sCmV2ZW4gd2hlbiB0aGUgYnVpbGQgb3V0cHV0cyBhcmUg
c3BsaXQgaW50byBzZXBhcmF0ZSBwYWNrYWdlcy4KLS0tCiBsaWIvbGliZHZidjUvbWVzb24u
YnVpbGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9saWIvbGliZHZidjUvbWVzb24uYnVpbGQgYi9saWIvbGli
ZHZidjUvbWVzb24uYnVpbGQKaW5kZXggOGY1OTI5ZmMuLjQ1MzBjYzY0IDEwMDY0NAotLS0g
YS9saWIvbGliZHZidjUvbWVzb24uYnVpbGQKKysrIGIvbGliL2xpYmR2YnY1L21lc29uLmJ1
aWxkCkBAIC02OCw3ICs2OCw3IEBAIGNvbmZpZ3VyZV9maWxlKAogICAgIGlucHV0IDogJy4u
L2luY2x1ZGUvbGliZHZidjUvbGliZHZiLXZlcnNpb24uaC5pbicsCiAgICAgY29uZmlndXJh
dGlvbiA6IGNvbmYsCiAgICAgaW5zdGFsbDogdHJ1ZSwKLSAgICBpbnN0YWxsX2RpcjogJ2lu
Y2x1ZGUvbGliZHZidjUnLAorICAgIGluc3RhbGxfZGlyOiBnZXRfb3B0aW9uKCdpbmNsdWRl
ZGlyJykgLyAnbGliZHZidjUnLAogKQogCiBsaWJkdmJ2NV9hcGkgPSBmaWxlcygKLS0gCjIu
NDkuMAoK

--------------yTneuir10qaTKPS04IM3EBqr--

