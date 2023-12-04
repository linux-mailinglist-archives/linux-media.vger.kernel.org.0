Return-Path: <linux-media+bounces-1529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD88802DF2
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 10:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068791F210F2
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 09:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFDB14A9A;
	Mon,  4 Dec 2023 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="F2ASURiG"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6001BD2
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 01:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701681102; x=1702285902; i=ps.report@gmx.net;
	bh=eHIDEU5qXtGT4kE1U3W5nlemyQOFp6glu1xD5RxoNhg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=F2ASURiGQHhrx5SUfd4nYM/HGarcAR3U8DK6raBWKN8I0d3n7T1/Pv0Fbf9udDju
	 kwZoe9YeRjGzVzeJxQw7VlouClu6BLcmcsvmvhVZNBZUyir2CVb3n3gUepEb8hH70
	 kDAzaJtBpgYO54X5i0yMi/x0UcDNFucURV9M40oLsJyJHwOYT+SOE3YedaJjC3Xo4
	 kSugzW3nNTBHidd8aHW3ZRHXUzWr+RTY31MnkogGt+4DAHBHYizA99U1OkGDIlkNk
	 JL4h48icDT4qLKTkL8TFYYRp5B+P1rjvlRp3rie2S04i70z9z+2flS42KaA+YN5pt
	 xEauK27CITDjVmzbsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.4]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzyya-1rVR1s1vjK-00x0gn; Mon, 04
 Dec 2023 10:11:42 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Cc: Peter Seiderer <ps.report@gmx.net>
Subject: [PATCH v4l-utils v1 2/2] meson: v4l2grab needs libv4lconvert with fork support enabled
Date: Mon,  4 Dec 2023 10:11:34 +0100
Message-ID: <20231204091134.28481-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204091134.28481-1-ps.report@gmx.net>
References: <20231204091134.28481-1-ps.report@gmx.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:jrgZ3+gcCI5AB450X8tsXOkuWsaEQTQsYHEjUddY0hrKS/6wSf1
 IG+gn2sxQLDHgeLyHgyWFQ/N21qOxVkg8Ut1jpz2FdnfjRl+Mmlbu+CZrj3ae33buQEWCks
 qpSc50NJ9t+5ptR2xvDndOlt/OVyi76+p3mvA8mL3UW+fHwDBrZoaj/J0EafHDgX0zu/0IR
 OnPPzQNHID0elunBjCSDg==
UI-OutboundReport: notjunk:1;M01:P0:SMSPPX14cT4=;FywpkTYZM4mGSVHqJp+qMGpPzS0
 MeOhX7FLnNrSCSbYMMAFCqj0gyLaLeKxg6UICACnuM5Tp1WrzXo0QImIdK1FdCSANuGYzvwzD
 3ms4sn5ZEGnE4rM0qa+0Kj86AXjhATkbc1XiYtUB+QHAHhQjlh8iGl7NaMk3d795eBQD37HOd
 jCzA4Y7nfoXSC6aPMQy/OQKfC9VTrPED2Ug1m4Q8tWiEJCQlht9l7DCLswEDEh5kj9wL1Zzvt
 PYUqP/u2vv+98WMpmNIdRZfHoClmbmZlzWPbOZJ7WZAnLhoyXxYCrfp3YE0y+eSiLh4kbbU4+
 Sbq2JwqIa7j7udu/nxlpjp2q548L2l/XErfqwXlf7u1ZQTtE629pBhDv2cuV/swBTTCp7Puah
 QYEs5TORLFzoVNJqii78UicOr/X2EFc+C4rzJCBvnMd48rrwJu6BuS1zfv+aY/T9Ikp8lbtSC
 aXDHZloOQnEsgFF6flnrT/OXpI177IzlsmUpe1CVdMsOZ+cc9MQRu519UoBUFE817NGgb9BVS
 rVMrAT3oD2AGlhily5qXVMO/JgmmM7eVqhqeL8iKHVMx66bvxOHG/eL+gZF23umSM5YR8peNt
 HXQn0c4fPI5OpvYvynOxKQRtnAqJ2Bj7vRA+bwrVyZelhHZ+HRIayKTCf74ThrNrajQEU02/E
 KhPbtq+BQu38XCBTEKCTflDHlu+1I3DwqRYp9NhHrxSB3GVBU5rBDLKXNCk3cAFwRBppft0qC
 Xk1mHR11uGRs+tr3WLP++UbuDqGZBQ83zz10OTmVxyQ0VQx1ISbmxmx1cJUM9of4vC5f38/Jz
 M5TrLtCNi6wNBLqukBJgangEVwWNq1BCwlVQokhBFBhI89HO5Z1G/jpT6LpU5iq1OvgYX9a5V
 3DPhlE7oUVuYsIftLb87itjrqdM6MV9t7TjCxQ3UZyC2fILZvw3Vcwbf7aTRltaqRkCPcwfh8
 xNAWZg==

LSB2NGwyZ3JhYiBuZWVkcyBsaWJ2NGxjb252ZXJ0IHdpdGggZm9yayBzdXBwb3J0IGVuYWJsZWQK
CkZpeGVzOgoKICBGQUlMRUQ6IGNvbnRyaWIvdGVzdC92NGwyZ3JhYgogIC4uLi9ib290bGluLWFy
bXY3bS11Y2xpYmMvaG9zdC9iaW4vYXJtLWxpbnV4LWdjYyAgLW8gY29udHJpYi90ZXN0L3Y0bDJn
cmFiIGNvbnRyaWIvdGVzdC92NGwyZ3JhYi5wL3Y0bDJncmFiLmMubyAtV2wsLS1hcy1uZWVkZWQg
LVdsLC0tbm8tdW5kZWZpbmVkIC1XbCwtTzEgLVdsLC1lbGYyZmx0PS1yIC1zdGF0aWMgLVdsLC0t
c3RhcnQtZ3JvdXAgbGliL2xpYnY0bDIvbGlidjRsMi5hIGxpYi9saWJ2NGxjb252ZXJ0L2xpYnY0
bGNvbnZlcnQuYSAtbGFyZ3AgLXB0aHJlYWQgLWxkbCAtbG0gLWxydCAtV2wsLS1lbmQtZ3JvdXAK
ICAuLi4vYm9vdGxpbi1hcm12N20tdWNsaWJjL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYXJtLWJ1
aWxkcm9vdC11Y2xpbnV4LXVjbGliY2dudWVhYmkvYmluL2xkLnJlYWw6IGxpYi9saWJ2NGxjb252
ZXJ0L2xpYnY0bGNvbnZlcnQuYShsaWJ2NGxjb252ZXJ0LmMubyk6IGluIGZ1bmN0aW9uIGB2NGxj
b252ZXJ0X2Rlc3Ryb3knOgogIGxpYnY0bGNvbnZlcnQuYzooLnRleHQrMHg1YzApOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGB2NGxjb252ZXJ0X2hlbHBlcl9jbGVhbnVwJwogIC4uLi9ib290bGlu
LWFybXY3bS11Y2xpYmMvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9hcm0tYnVpbGRyb290LXVjbGlu
dXgtdWNsaWJjZ251ZWFiaS9iaW4vbGQucmVhbDogbGliL2xpYnY0bGNvbnZlcnQvbGlidjRsY29u
dmVydC5hKGxpYnY0bGNvbnZlcnQuYy5vKTogaW4gZnVuY3Rpb24gYHY0bGNvbnZlcnRfY29udmVy
dF9waXhmbXQnOgogIGxpYnY0bGNvbnZlcnQuYzooLnRleHQrMHgxNDUwKTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgdjRsY29udmVydF9oZWxwZXJfZGVjb21wcmVzcycKICBjb2xsZWN0MjogZXJy
b3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKClNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRl
cmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tCk5vdGVzOgogIC0gcGF0Y2ggaXMgbW9yZSBvciBs
ZXNzIGEgcXVpY2sgd29yayBhcm91bmQsIG1heWJlIGFuIGJldHRlciBoYW5kbGluZwogICAgb2Yg
dGhlIG5vLWZvcmstY2FzZSBpbiBsaWJ2NGxjb252ZXJ0ICh3aXRob3V0IHY0bGNvbnZlcnRfaGVs
cGVyX2NsZWFudXAsCiAgICB2NGxjb252ZXJ0X2hlbHBlcl9kZWNvbXByZXNzLCBldGMuIGFzIHRo
ZXkgZGVwZW5kIG9uIGhhdmVfZm9yaywgc2VlCiAgICBsaWIvbGlidjRsY29udmVydC9tZXNvbi5i
dWlsZCBhbmQgY29uZGl0aW9uYWwgaGVscGVyLmMgY29tcGlsZSkKICAgIGlzIHBvc3NpYmxlPz8/
Ci0tLQogY29udHJpYi90ZXN0L21lc29uLmJ1aWxkIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NvbnRyaWIvdGVzdC9tZXNvbi5idWlsZCBiL2Nv
bnRyaWIvdGVzdC9tZXNvbi5idWlsZAppbmRleCAyOWI1MWRmNi4uYzFmNDAzNTQgMTAwNjQ0Ci0t
LSBhL2NvbnRyaWIvdGVzdC9tZXNvbi5idWlsZAorKysgYi9jb250cmliL3Rlc3QvbWVzb24uYnVp
bGQKQEAgLTI1LDYgKzI1LDcgQEAgc2xpY2VkX3ZiaV9kZXRlY3QgPSBleGVjdXRhYmxlKCdzbGlj
ZWQtdmJpLWRldGVjdCcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2xpY2VkX3Zi
aV9kZXRlY3Rfc291cmNlcywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmNsdWRl
X2RpcmVjdG9yaWVzIDogdjRsMl91dGlsc19pbmNkaXIpCiAKK2lmIGhhdmVfZm9yawogdjRsMmdy
YWJfc291cmNlcyA9IGZpbGVzKAogICAgICd2NGwyZ3JhYi5jJywKIApAQCAtNDEsNiArNDIsNyBA
QCB2NGwyZ3JhYiA9IGV4ZWN1dGFibGUoJ3Y0bDJncmFiJywKICAgICAgICAgICAgICAgICAgICAg
ICB2NGwyZ3JhYl9zb3VyY2VzLAogICAgICAgICAgICAgICAgICAgICAgIGRlcGVuZGVuY2llcyA6
IHY0bDJncmFiX2RlcHMsCiAgICAgICAgICAgICAgICAgICAgICAgaW5jbHVkZV9kaXJlY3Rvcmll
cyA6IHY0bDJfdXRpbHNfaW5jZGlyKQorZW5kaWYKIAogZHJpdmVyX3Rlc3Rfc291cmNlcyA9IGZp
bGVzKAogICAgICdkcml2ZXItdGVzdC5jJywKLS0gCjIuNDMuMAoK

