Return-Path: <linux-media+bounces-1645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F598804D0D
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 10:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B8161F20CC8
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE473D3BE;
	Tue,  5 Dec 2023 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="TOScCsFf"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FF0182
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 01:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701766887; x=1702371687; i=ps.report@gmx.net;
	bh=gpJ/GPz7IpyXJDda1TpD55/LUNip08qxMeVqBnYlJt0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=TOScCsFfw0TBbMbUXtwMA4MmC+L5BNv0KqDaCIZDK+oreVr47E8tdUXy4K3jha0V
	 i/TXACbw/oOxOLGYfSKvDxm35q8/xCYzXvbgB72fQUdPceefPpiI03Lih4JLhLRxA
	 mF5D5wrkC/dnctpsTiaIFlVSf0D5NE1r3M+C8CK3a8bDjVcdIol+GuMt2hvTqIV6Y
	 NyVE7rcE6Gu6zRw6S79hY+VlOgmNKciBNVaE5UdfAnQH4RpVpggeD/e7LYZK4Y5mp
	 DBJ0uybet8MILsmCNCHSqtJNxJxd/81iE5qZQhRF2OX7i4+Sg/2CxAzpQU5tN0Hfi
	 Ce0llo/gid7QrPmq2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.163]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MY6Cl-1qlKqA1ezV-00YNXr; Tue, 05 Dec 2023 10:01:27 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Cc: Peter Seiderer <ps.report@gmx.net>
Subject: [PATCH v4l-utils v1 2/2] meson: libv4lconvert helpers need fork support
Date: Tue,  5 Dec 2023 10:01:23 +0100
Message-ID: <20231205090123.12983-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205090123.12983-1-ps.report@gmx.net>
References: <20231205090123.12983-1-ps.report@gmx.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:fu00QAtHka3kxQ2Gelxe/6p/GfbX48kbrGXSRbo/e065A4vYhWm
 tPim6m14+yI61GGbQbmaXmgMQYWEO3bF4KEbP4N04KXQhVLv3O9p4SbjHNvfVLTEsDkSHWR
 sxRM4vHMjFFrF0cFmaWO4V0bCC02VOYY4+0TFaI1+vmP4YPkusaFToIFZmutO+zLUsOEgJ1
 MMHIc0y3A9+YeQp0Ymckw==
UI-OutboundReport: notjunk:1;M01:P0:1SzLbgnSguw=;PlVshZSLy34AHioZ6wkGg7b8odG
 z57rckGc0Uwztf3AXtHu7IqiNoPiHmMXvi3jcKneY14+kNxj3ZpEvruQ0XJO8IO0dwNRCJINm
 3B6DEyw1D+i9Mtp9eoy2gbyC/HQ2PySqZDlgVcdNGRBvzwZY1kRRdBiEj5OG0NIO269eC/Pkm
 Kgom4TcRwGDWXUegMNUqN4Vx1Jt+lkQGweFGAndWYJWyOt554YhuP3Y2HF3+yGaGIlHmv4c2q
 l+mFhqurUrSrmKtw9R1INnzfO6XpXQaklrsKoxx/C7hncvqIpkpqV/n3LphWFTeICXMPUCVsw
 pQ0cOdAaoXqpk4ryTwlyAz1KyuHoYm/Ku0jC96r2CLR4uRMGMF5D1d2O6NrqXFFVgmbHCBin0
 tnhjsqzNgDJ3COzrdJXhF9mW1ieQI5Yo/bUGik2MT38tMVNUoKZRmHd2FlcHIqeC5nf4gAb4Y
 kDzjodGVEm51wSKOdgPfQpcMQSQt+YhizPQmGnhv4A/HR8zOqEhLPTjdk+wJc0yQJF/OVHZK0
 Eeam8t1lKwpkE87de+1nKmtrsuIUA2POkljPyrhm0TU9DaMj2yEWZ8Wh51ftD2zZ7Jvk99aie
 EpV1kGcb8dbqJcktLfBOkFkcR2ugRchEFgEIPIkflHJxedbhDDPn1R1qjzRd35cKDvVWbHaxu
 m3h9Tyt0Z+iFCKf89ZJlYcng3YTEr0zjgHH2P25Br3nvWYeiHbsOWhNxak3TZZ4cvJPebalSJ
 OsG94Cj9EKc2DA93M0/BNL8P+5wCPnQBc3QUXpj/EYl23eojl4wFyow6SyQxnYSGQo9Hfdx5N
 3YLpJ9kubT9F38f6dNAhIlgJDqbQ1eMX+F9oMIeDdsUD/1j5dzxEVVgJg/dJ44atOwEjrqmhE
 EfNn+RdNNvNsKeCfBhJzxgEAlTtQ/VB91OKTAfw6d4XXcpNh1Q4GbMfhYHrQU1u2vuYel1oGE
 FWwHzg==

LSBsaWJ2NGxjb252ZXJ0IGhlbHBlcnMgKHY0bGNvbnZlcnRfaGVscGVyX2RlY29tcHJlc3MsCiAg
djRsY29udmVydF9oZWxwZXJfY2xlYW51cCwgLi4uKSBuZWVkIGZvcmsoKSBzdXBwb3J0LCBzbyBh
ZGQgYWRkaXRpb25hbAogIGRlcGVuZGVuY3kgZm9yIEhBVkVfTElCVjRMQ09OVkVSVF9IRUxQRVJT
CgpGaXhlczoKCiAgRkFJTEVEOiBjb250cmliL3Rlc3QvdjRsMmdyYWIKICAuLi4vYm9vdGxpbi1h
cm12N20tdWNsaWJjL2hvc3QvYmluL2FybS1saW51eC1nY2MgIC1vIGNvbnRyaWIvdGVzdC92NGwy
Z3JhYiBjb250cmliL3Rlc3QvdjRsMmdyYWIucC92NGwyZ3JhYi5jLm8gLVdsLC0tYXMtbmVlZGVk
IC1XbCwtLW5vLXVuZGVmaW5lZCAtV2wsLU8xIC1XbCwtZWxmMmZsdD0tciAtc3RhdGljIC1XbCwt
LXN0YXJ0LWdyb3VwIGxpYi9saWJ2NGwyL2xpYnY0bDIuYSBsaWIvbGlidjRsY29udmVydC9saWJ2
NGxjb252ZXJ0LmEgLWxhcmdwIC1wdGhyZWFkIC1sZGwgLWxtIC1scnQgLVdsLC0tZW5kLWdyb3Vw
CiAgLi4uL2Jvb3RsaW4tYXJtdjdtLXVjbGliYy9ob3N0L29wdC9leHQtdG9vbGNoYWluL2FybS1i
dWlsZHJvb3QtdWNsaW51eC11Y2xpYmNnbnVlYWJpL2Jpbi9sZC5yZWFsOiBsaWIvbGlidjRsY29u
dmVydC9saWJ2NGxjb252ZXJ0LmEobGlidjRsY29udmVydC5jLm8pOiBpbiBmdW5jdGlvbiBgdjRs
Y29udmVydF9kZXN0cm95JzoKICBsaWJ2NGxjb252ZXJ0LmM6KC50ZXh0KzB4NWMwKTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgdjRsY29udmVydF9oZWxwZXJfY2xlYW51cCcKICAuLi4vYm9vdGxp
bi1hcm12N20tdWNsaWJjL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYXJtLWJ1aWxkcm9vdC11Y2xp
bnV4LXVjbGliY2dudWVhYmkvYmluL2xkLnJlYWw6IGxpYi9saWJ2NGxjb252ZXJ0L2xpYnY0bGNv
bnZlcnQuYShsaWJ2NGxjb252ZXJ0LmMubyk6IGluIGZ1bmN0aW9uIGB2NGxjb252ZXJ0X2NvbnZl
cnRfcGl4Zm10JzoKICBsaWJ2NGxjb252ZXJ0LmM6KC50ZXh0KzB4MTQ1MCk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYHY0bGNvbnZlcnRfaGVscGVyX2RlY29tcHJlc3MnCiAgY29sbGVjdDI6IGVy
cm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlk
ZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQogbGliL2xpYnY0bGNvbnZlcnQvbWVzb24uYnVp
bGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9saWIvbGlidjRsY29udmVydC9tZXNvbi5idWlsZCBiL2xpYi9saWJ2NGxj
b252ZXJ0L21lc29uLmJ1aWxkCmluZGV4IDM4NzQwNzU1Li40YmRhNTY3MSAxMDA2NDQKLS0tIGEv
bGliL2xpYnY0bGNvbnZlcnQvbWVzb24uYnVpbGQKKysrIGIvbGliL2xpYnY0bGNvbnZlcnQvbWVz
b24uYnVpbGQKQEAgLTkxLDcgKzkxLDcgQEAgaWYgaGF2ZV9mb3JrCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpbmNsdWRlX2RpcmVjdG9yaWVzIDogdjRsMl91dGlsc19pbmNkaXIpCiBl
bmRpZgogCi1pZiBoYXZlX3Zpc2liaWxpdHkKK2lmIGhhdmVfdmlzaWJpbGl0eSBhbmQgaGF2ZV9m
b3JrCiAgICAgbGlidjRsY29udmVydF9jX2FyZ3MgKz0gWwogICAgICAgJy1mdmlzaWJpbGl0eT1o
aWRkZW4nLAogICAgICAgJy1ESEFWRV9MSUJWNExDT05WRVJUX0hFTFBFUlMnLAotLSAKMi40My4w
Cgo=

