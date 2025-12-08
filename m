Return-Path: <linux-media+bounces-48379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC13CACB62
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 10:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC2E2301D30D
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 09:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF59314B66;
	Mon,  8 Dec 2025 09:41:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF77314A74;
	Mon,  8 Dec 2025 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186898; cv=none; b=aEPgbRQ4Aijs8qHk0uD6tQn9z3cMC39u73jKF9O/CPXJ9EDHOoPVsY7hmugW3YYT9+4ZtAam4QHCQyMDtQnWmZO6LZiqyxBe8RSerJaULMdt62Q5SHHEoBa/dlhG/ZWyUY1ZkginTP2/wBVj7Xk3XcH5HmWO9jSsxlzPzILIFkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186898; c=relaxed/simple;
	bh=849Oo5alFZyVsC8b8C5uNYB8oJ+zNuEajBlX9I2FgT8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=o/N7mkM2z3PbiTTv8A7z+piIhWZTIzlNRhlK7+m9hCsWEekUaR+PXLSA46WHe61uiSwRlPe0CIGUM9tzoTWHITAZDgZRkGGO4eYMDhqDSB8OsL/yZg9x8DoLmJa/d56O7PcRCJOCdvj2WS/FrePOg1SKDlmXE6WyYnkoVQnnYpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4dPxkp0TvQzYmbLG;
	Mon,  8 Dec 2025 17:38:58 +0800 (CST)
Received: from a009.hihonor.com (10.68.30.244) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 8 Dec
 2025 17:41:27 +0800
Received: from a008.hihonor.com (10.68.30.56) by a009.hihonor.com
 (10.68.30.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 8 Dec
 2025 17:41:27 +0800
Received: from a008.hihonor.com ([fe80::b6bf:fc6a:207:6851]) by
 a008.hihonor.com ([fe80::b6bf:fc6a:207:6851%6]) with mapi id 15.02.2562.027;
 Mon, 8 Dec 2025 17:41:27 +0800
From: gao xu <gaoxu2@honor.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
CC: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
	<Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "\"T.J. Mercier\""
	<tjmercier@google.com>, =?utf-8?B?IkNocmlzdGlhbiBLw7ZuaWci?=
	<christian.koenig@amd.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
	"surenb@google.com" <surenb@google.com>, zhouxiaolong
	<zhouxiaolong9@honor.com>
Subject: [RFC] dma-buf: system_heap: add PTE_CONT for larger contiguous
Thread-Topic: [RFC] dma-buf: system_heap: add PTE_CONT for larger contiguous
Thread-Index: AdxoJnlSUP8R1FJ1RaylLS1xKeCkOw==
Date: Mon, 8 Dec 2025 09:41:27 +0000
Message-ID: <3da6a916cd6d489690b05d2bd64a2b3a@honor.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Y29tbWl0IDA0YzdhZGI1ODcxYSAoImRtYS1idWY6IHN5c3RlbV9oZWFwOiB1c2UgbGFyZ2VyIGNv
bnRpZ3VvdXMgbWFwcGluZ3MNCmluc3RlYWQgb2YgcGVyLXBhZ2UgbW1hcCIpIGZhY2lsaXRhdGVz
IHRoZSB1c2Ugb2YgUFRFX0NPTlQuIFRoZSBzeXN0ZW1faGVhcA0KYWxsb2NhdGVzIHBhZ2VzIG9m
IG9yZGVyIDQgYW5kIDggdGhhdCBtZWV0IHRoZSBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzIGZvcg0K
UFRFX0NPTlQuIGVuYWJsaW5nIFBURV9DT05UIGZvciBsYXJnZXIgY29udGlndW91cyBtYXBwaW5n
cy4NCg0KQWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaCwgVExCIG1pc3NlcyBhcmUgcmVkdWNlZCBi
eSBhcHByb3hpbWF0ZWx5IDUlIHdoZW4NCm9wZW5pbmcgdGhlIGNhbWVyYSBvbiBBbmRyb2lkIHN5
c3RlbXMuDQoNClNpZ25lZC1vZmYtYnk6IGdhbyB4dSA8Z2FveHUyQGhvbm9yLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jIHwgNiArKysrKy0NCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9zeXN0ZW1faGVhcC5jDQppbmRleCA0Yzc4MmZlMzMuLjEwM2IwNmY4OSAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jDQorKysgYi9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvc3lzdGVtX2hlYXAuYw0KQEAgLTIwMiwxMiArMjAyLDE2IEBAIHN0YXRpYyBpbnQg
c3lzdGVtX2hlYXBfbW1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkNCiAJCXVuc2lnbmVkIGxvbmcgbiA9IChzZy0+bGVuZ3RoID4+IFBBR0VfU0hJ
RlQpIC0gcGdvZmY7DQogCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHNnX3BhZ2Uoc2cpICsgcGdvZmY7
DQogCQl1bnNpZ25lZCBsb25nIHNpemUgPSBuIDw8IFBBR0VfU0hJRlQ7DQorCQlwZ3Byb3RfdCBw
cm90ID0gdm1hLT52bV9wYWdlX3Byb3Q7DQogDQogCQlpZiAoYWRkciArIHNpemUgPiB2bWEtPnZt
X2VuZCkNCiAJCQlzaXplID0gdm1hLT52bV9lbmQgLSBhZGRyOw0KIA0KKwkJaWYgKCgoYWRkciB8
IHNpemUpICYgfkNPTlRfUFRFX01BU0spID09IDApDQorCQkJcHJvdCA9IF9fcGdwcm90KHBncHJv
dF92YWwocHJvdCkgfCBQVEVfQ09OVCk7DQorDQogCQlyZXQgPSByZW1hcF9wZm5fcmFuZ2Uodm1h
LCBhZGRyLCBwYWdlX3RvX3BmbihwYWdlKSwNCi0JCQkJc2l6ZSwgdm1hLT52bV9wYWdlX3Byb3Qp
Ow0KKwkJCQlzaXplLCBwcm90KTsNCiAJCWlmIChyZXQpDQogCQkJcmV0dXJuIHJldDsNCiANCi0t
IA0KMi40Mi4wDQo=

