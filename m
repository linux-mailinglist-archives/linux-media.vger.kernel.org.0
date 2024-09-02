Return-Path: <linux-media+bounces-17358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A3296894A
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D18F8281862
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADB719E992;
	Mon,  2 Sep 2024 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="VWiHNOFm"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6DF19E98B
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285627; cv=none; b=QTdWwSuj/VRyaZcHuunpi2JHXsbSXgHHB7zYoF/LYAFSFEc1ftVWHMd/OdLB6ARAbrYC9R3rouSEusZ2+qjgQijICQp5UG0GkOLFZy64gOKygaaJXV/pxcnUQ6ZxvCK+GWm+SH1rK/2P21PrIrc0YiSbq4XP9oARFIOR+Un5HDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285627; c=relaxed/simple;
	bh=UetKe0nW+Txu4MN/1f6+u0xL82nlJDtRxYbQh6Cxml8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AxQdriSVwzlofQXWSJyvU9YQgTYcNqq0HWiMntdehBy9Oeo2vOEk8cLedjJhE7eukcCU0wBzfjBE35gNFXonQ0r1jwyANvcrzWW+t0fZC8ll1oKZn9g4v6+e7zsy26dZo33j4ZVCcgiBR4rbCbXJ6AAaRsk1CWwf3HjbUjMc66o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b=VWiHNOFm; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1725285623; x=1725890423; i=ps.report@gmx.net;
	bh=UetKe0nW+Txu4MN/1f6+u0xL82nlJDtRxYbQh6Cxml8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VWiHNOFm5agQht+4q2CoqA0X33GJfnz7YMJadXpYV2FbfYc25rcLHOMqbNsKlyrL
	 rIjkUjIKi8eSuOMnGzp/Z2pmlgmdmzgqtzxiOkj0FgJnDvQJfLG9h3xD/w682AHSL
	 ABFNv/NMfDwCCd9vjeEakEjlPd7jSJjEPmzzZMxwSudrLYSRbxtEXlWImpJqp8ybr
	 WvKjToPSqRCF3+E0gwTs9mm9s6yrqIbYB+mWfCizNRxZ5dr/ZB0X5b0f2hotEiDtk
	 RruSfsd87yVJPzU3PrUCudkg4pgCdffKqf7torJ8vXywSMbQKMpmy6zUO60tGfs3h
	 6nbvod6sptcbbRgUQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.185]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1rrwa63UEK-014Q2Z; Mon, 02
 Sep 2024 16:00:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Cc: Peter Seiderer <ps.report@gmx.net>
Subject: [PATCH v4l-utils v1] libv4lconvert: fix jpeg-v9x/gcc-14.x compile (jpeg_mem_dest argument mismatch)
Date: Mon,  2 Sep 2024 15:59:53 +0200
Message-ID: <20240902135953.1856308-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:YnMWju/A92+4mQDNfXziPJbmDM3GGcBK6ds0PiZgKTyYGHenIMd
 G9eSbesRQulmCCin00JltILSbVIeSh2n+Y/L/eBl0fUHLVbdRxdpJL3b0aOrKDP4rkQStvf
 h4+UMzXmQDbeBElKl4vfNAfyEqb5odRndcS5iUk+dSXo/ThOCCYKAX7t7DM7scgZ5iNttFD
 ZILpSImVm+TkhqWIABhyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T/dDKSUB54A=;jMsCuZ1oBRwZbcjZkPkLcigmRZc
 lIHdyjTnwJdj0d81U562fhs1PkNxcHgin4pYjHB3yGnegaOjhIJnuQeWQ7nxgpFzJB9W1uBht
 XhL0ptT/dtn/oItYUwgpSrp8tc2JgfSsLPXLuOzCM6kwXy3QMOwmCnX3truWtxe3OBLDLXeQT
 7ydLQICpCkTRZL9G5w9kzf6D8rHXhPFeO03eiDQ5c0v7Hl8ZV4GgZ9uc/Q92VcrZrspymGOXb
 Ty66BOBhYs3GcZ3WyGYKkoMz8tKN9cA/+K9LFzo0TaAlKaaID6xKq6D9+86BPcqWFsUQkHwHI
 1GXcnVFOlIYoJz6F2QbZUHfTtuQB2CasKSOjm9f0eWzedgaPtBUHpD2l7/D252qm5yd76gWNZ
 lPyvTrseDF/wIqxMtCwV8lbggFX4bpll+sx0WJ9cbdZ7OW2CIawtHkKQtEnc9UU5ASc9dEwtg
 5tAhAXMxA/h3gcGAFH8MMG4cR8JPAa9PL32I+K0GJA145jTg+WU+dWcpzdzX3WaUQmKJvlUEB
 +rBRt8Df0Twl0i3T+VuU893JfW8hJJewIJJSefBgWXy2mRPtlHWU5anFbcEHkEdGsCpvmyqr7
 Cu/W1xkJuwYIqm0ydp3IQlUvMwoZ4ycvMSAxqlC5STCt7H4ff8Mh56WLZiUCQHT5Jqr9w+RHL
 FcDb88ZBBdJY+JmGLJ8lZ/EAxBUFru20JhCf3r0xKDzblfwVEh3ivnUcOvj9zXM7ixt+w7K7Y
 jH5uKqSEiDcDiDfc6MEL7CPGViBC93Ubtoe2loslONdaAnpEzzqklnM0rAzTI3TKH3DoU9ZmO
 rgqw9pRZ0u4HRG2XRHQmzJgQ==

LSBmaXgganBlZ19tZW1fZGVzdCBwb2ludGVyIGFydW1lbnQgbWlzbWF0Y2ggKGxvbmcgdW5zaWdu
ZWQgaW50IHZzLiBzaXplX3QpCiAgd2l0aCBqcGVnLXY5eC9nY2MtMTQueCAzMi1iaXQgYXJtIGNv
bXBpbGUKCkZpeGVzOgoKICAuLi9saWIvbGlidjRsY29udmVydC9qbDIwMDViY2QuYzogSW4gZnVu
Y3Rpb24g4oCYdjRsY29udmVydF9kZWNvZGVfamwyMDA1YmNk4oCZOgogIC4uL2xpYi9saWJ2NGxj
b252ZXJ0L2psMjAwNWJjZC5jOjk0OjQ2OiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAzIG9mIOKA
mGpwZWdfbWVtX2Rlc3TigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2luY29t
cGF0aWJsZS1wb2ludGVyLXR5cGVzXQogICAgIDk0IHwgICAgICAgICBqcGVnX21lbV9kZXN0ICgm
Y2luZm8sICZqcGVnX2hlYWRlciwgJmpwZWdfaGVhZGVyX3NpemUpOwogICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4K
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwK
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxv
bmcgdW5zaWduZWQgaW50ICoKICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vbGliL2xpYnY0bGNv
bnZlcnQvbGlidjRsY29udmVydC1wcml2Lmg6MjYsCiAgICAgICAgICAgICAgICAgICBmcm9tIC4u
L2xpYi9saWJ2NGxjb252ZXJ0L2psMjAwNWJjZC5jOjMwOgogIC4uLi9ob3N0L2FybS1idWlsZHJv
b3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUvanBlZ2xpYi5oOjk3OToyODog
bm90ZTogZXhwZWN0ZWQg4oCYc2l6ZV90ICrigJkge2FrYSDigJh1bnNpZ25lZCBpbnQgKuKAmX0g
YnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUg4oCYbG9uZyB1bnNpZ25lZCBpbnQgKuKAmQogICAgOTc5
IHwgRVhURVJOKHZvaWQpIGpwZWdfbWVtX2Rlc3QgSlBQKChqX2NvbXByZXNzX3B0ciBjaW5mbywK
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fgoKICAuLi9saWIvbGlidjRs
Y29udmVydC9qcGVnLmM6IEluIGZ1bmN0aW9uIOKAmGluaXRfbGlianBlZ19jaW5mb+KAmToKICAu
Li9saWIvbGlidjRsY29udmVydC9qcGVnLmM6MTU3OjQ1OiBlcnJvcjogcGFzc2luZyBhcmd1bWVu
dCAzIG9mIOKAmGpwZWdfbWVtX2Rlc3TigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBl
IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQogICAgMTU3IHwgICAgICAgICBqcGVnX21l
bV9kZXN0KCZjaW5mbywgJmpwZWdfaGVhZGVyLCAmanBlZ19oZWFkZXJfc2l6ZSk7CiAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+CiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwKICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbG9uZyB1bnNpZ25lZCBpbnQgKgogIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9saWIvbGli
djRsY29udmVydC9saWJ2NGxjb252ZXJ0LXByaXYuaDoyNiwKICAgICAgICAgICAgICAgICAgIGZy
b20gLi4vbGliL2xpYnY0bGNvbnZlcnQvanBlZy5jOjIxOgogIC4uLi9ob3N0L2FybS1idWlsZHJv
b3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUvanBlZ2xpYi5oOjk3OToyODog
bm90ZTogZXhwZWN0ZWQg4oCYc2l6ZV90ICrigJkge2FrYSDigJh1bnNpZ25lZCBpbnQgKuKAmX0g
YnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUg4oCYbG9uZyB1bnNpZ25lZCBpbnQgKuKAmQogICAgOTc5
IHwgRVhURVJOKHZvaWQpIGpwZWdfbWVtX2Rlc3QgSlBQKChqX2NvbXByZXNzX3B0ciBjaW5mbywK
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fgoKU2lnbmVkLW9mZi1ieTog
UGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIGxpYi9saWJ2NGxjb252ZXJ0
L2psMjAwNWJjZC5jIHwgNCArKysrCiBsaWIvbGlidjRsY29udmVydC9qcGVnLmMgICAgICB8IDQg
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIv
bGlidjRsY29udmVydC9qbDIwMDViY2QuYyBiL2xpYi9saWJ2NGxjb252ZXJ0L2psMjAwNWJjZC5j
CmluZGV4IDcwN2MzMjA1Li4xNGIwNDBmMyAxMDA2NDQKLS0tIGEvbGliL2xpYnY0bGNvbnZlcnQv
amwyMDA1YmNkLmMKKysrIGIvbGliL2xpYnY0bGNvbnZlcnQvamwyMDA1YmNkLmMKQEAgLTYzLDcg
KzYzLDExIEBAIGludCB2NGxjb252ZXJ0X2RlY29kZV9qbDIwMDViY2Qoc3RydWN0IHY0bGNvbnZl
cnRfZGF0YSAqZGF0YSwKIAlzdHJ1Y3QganBlZ19kZWNvbXByZXNzX3N0cnVjdCBkaW5mbzsKIAlz
dHJ1Y3QganBlZ19lcnJvcl9tZ3IgamNlcnIsIGpkZXJyOwogCUpPQ1RFVCAqanBlZ19oZWFkZXIg
PSBOVUxMOworI2lmIEpQRUdfTElCX1ZFUlNJT04gPj0gOTAKKwlzaXplX3QganBlZ19oZWFkZXJf
c2l6ZSA9IDA7CisjZWxzZQogCXVuc2lnbmVkIGxvbmcganBlZ19oZWFkZXJfc2l6ZSA9IDA7Cisj
ZW5kaWYKIAlpbnQgaSwgeCwgeSwgeDEsIHkxLCBqcGVnX2RhdGFfc2l6ZSwganBlZ19kYXRhX2lk
eCwgZW9pLCBzaXplOwogCiAJLyogc3JjX3NpemUgaGFkIGJldHRlciBiZSBiaWdnZXIgdGhhbiAx
NiAqLwpkaWZmIC0tZ2l0IGEvbGliL2xpYnY0bGNvbnZlcnQvanBlZy5jIGIvbGliL2xpYnY0bGNv
bnZlcnQvanBlZy5jCmluZGV4IGViZmM4MTQ5Li40NTBkMDk2NyAxMDA2NDQKLS0tIGEvbGliL2xp
YnY0bGNvbnZlcnQvanBlZy5jCisrKyBiL2xpYi9saWJ2NGxjb252ZXJ0L2pwZWcuYwpAQCAtMTM2
LDcgKzEzNiwxMSBAQCBzdGF0aWMgdm9pZCBpbml0X2xpYmpwZWdfY2luZm8oc3RydWN0IHY0bGNv
bnZlcnRfZGF0YSAqZGF0YSkKIHsKIAlzdHJ1Y3QganBlZ19jb21wcmVzc19zdHJ1Y3QgY2luZm87
CiAJdW5zaWduZWQgY2hhciAqanBlZ19oZWFkZXIgPSBOVUxMOworI2lmIEpQRUdfTElCX1ZFUlNJ
T04gPj0gOTAKKwlzaXplX3QganBlZ19oZWFkZXJfc2l6ZSA9IDA7CisjZWxzZQogCXVuc2lnbmVk
IGxvbmcganBlZ19oZWFkZXJfc2l6ZSA9IDA7CisjZW5kaWYKIAogCWlmIChkYXRhLT5jaW5mb19p
bml0aWFsaXplZCkKIAkJcmV0dXJuOwotLSAKMi40Ni4wCgo=

