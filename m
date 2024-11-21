Return-Path: <linux-media+bounces-21721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EFC9D48F5
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 09:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86549282CD2
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 08:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58B61CBEA3;
	Thu, 21 Nov 2024 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="Ea1b9gRT"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F881CB9F6
	for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732178273; cv=none; b=I5D4ynpaCdE9Cjw1GnYDOl+wlpkztt7TzyKgaJIXLBpdRqAOrHpz3WdHOhIUeDC37qPKtgIwMoTPwNpqMfhe/SYBPJDBd45EkJp7Eb29fWyNnott/uYu9ToWNDmmfawyS4Jl25xxbZVSZx9k+WSSLBh0EP2hRx2vazFAC5+it7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732178273; c=relaxed/simple;
	bh=sfiRXQ37CBgftuvI9xjYjJEtqT6cfVKJEDx/2tMCGSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hCJv3Z7DsS1nAOM8vCHrJTU4yGXrCZbCu7wh6QNC3K+bM61kdMPEBSHtatSnPTKNok1SfS7JJMTsbLt9sHNNbOnh/QPwGj6+DIxJiclrn4kIYov99o8OXRClFucbq5cZCM3MGP/tYIc3k1BlEe8D5X4M5VnASeCCgI9kg05dNrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b=Ea1b9gRT; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1732178268; x=1732783068; i=ps.report@gmx.net;
	bh=sfiRXQ37CBgftuvI9xjYjJEtqT6cfVKJEDx/2tMCGSE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ea1b9gRTBEAem742RCUBZWWy6va1mwf1Ow3WnkRVTWHH3zSfVHbo3LEnKtccE5yh
	 FKvwvLSPfzofR+a95lqF5BV8yIHD/cm1iGLZHIa92xwQIgMXKCvX1kt4Bs7WKCtHi
	 3OHlKvVCG9M6SmHnNuNrR2rNSC6xGU/aFJqF+E27u38jKY5cF5PbEsJbex+bnQT33
	 vKQg4ZEXHVM2mBKoBjYzh2O3GsrE2mHi9hMvV4JWiBUqub4sSJ5ERki/jXHPX0bQr
	 kZIQaB7B3xZOeQlwQabRcy+lLUpTTt674HoKpuY4wT4JhDCz7iqpCrOjTN0+77SL7
	 oGlsvgomIHPy2MFn5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.206]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mFY-1tsVpw297c-012Fux; Thu, 21
 Nov 2024 09:37:48 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Cc: Peter Seiderer <ps.report@gmx.net>
Subject: [PATCH v4l-utils v1] meson: remove two pre-0.60 workarounds
Date: Thu, 21 Nov 2024 09:37:36 +0100
Message-ID: <20241121083736.16439-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:hOi4bmA6jRLlYJhpM3fB/dmeZxy+kITnmkMBtz70DmkeRt3/utG
 WThGmEVMPTdNIARi7ChrTvGxod3V2hENTysDunBUaLm6Gcjohal/FdR9NaoS6+Wauu/zwgq
 KwgLs4F6xF9ht47zeXj0z03qQardU+3Wdd226NupdBxyI1pFo+qkCDdoIRCe/9zVLcNZ6+d
 0eFWWxAlvxSO/anjrgukg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:87PsFsexjyc=;EuLVGjCmYB8XUnRKAIDr9Wm7gg4
 rf0v7gCPWf6hQGvaRCgsKplt8YaVOLrnJXuer1S6dwXEaL19ecb8SET1L5/bWzoMBQecdeQin
 u3Yya1LkMF+fnMn7JObmtLa/7zfcIxqYgzoS76dGIrWv/YNkm3kCvz6NvIgbNvStzVTVw1xXK
 Bh9TFJvOud7lMliQeLVY6HVkuDZRlZs5GHK7wHDDONqvokXvjbogQ234R827LPq54u1g3fOaq
 /I0APfhbx821ysv2LmHjShvfuZYqT+UYTxaBnsSwclGQ3OUVZoBqvJtkMB46W9qpPoE/a9ZHq
 y0DgjpTURAqcDBaSyk5sehJtmV7HPKmfjlCRYS0Rt3VOTCcpWCodozB5DGJMPL1Ku35wa8Ebo
 cRgEknW3IeacmSM+ny2ZpxTAMVH7+vaEEgBHA4IrYtUgr1+tT9+N7Y5oawfVJvm0fQSyNFP3A
 dL/jQ+PTibC8UsRLsYNKgRoJ9H2jEqGq1B6FRNbbMSUO9b2hVi7b2WAFriPpR3yWx2u0OYi5x
 i3MRaJKAAQVY5BG302HQFxbKBzIDdz6erX9BWvlKh8SClBlJwpkYSqFgUh+OiJ8uqWEJztyFA
 fmf4/7Gy4wvq+vIwKUTmSDnosv/BYeueeQk0+kFWIl8c+LW0gfG+lhg8liz1IrqBdbLQtvpSM
 +f3cJhunbdcMCB1FN2h4EbC+gNugcG35IrEqXSimLAsxDZnUfGkrWQWSl1HCdEJyVGBkmjrmW
 EuhFAL1a5Xu2dS72OT0N1tNyiEBkqN3pT/lr4NGayRzeXOKkZVKvHl4am8aPLS5hfodXfdVjG
 D2iX5rLEp9s5rsA0fQGBI7z/Ql+cGhySN2k0iLmY0SxOEH52lh/97qEp7d7CWMA97zVh2ORml
 JvPhmOR0bcqK7Wc/4dNHMof+miQ7ulKZIpcd2MqoVZGLc1kMTomgoLuio

Tm93IGFzIHRoZSBtZXNvbiByZXF1aXJlZCB2ZXJzaW9uIGlzIGJ1bXBlZCB0byAwLjYwIGl0IGlz
IHRpbWUgdG8gcmVtb3ZlCnR3byBwcmUtMC42MCB3b3JrYXJvdW5kczoKCi0gdXNlIG1lc29uLnBy
b2plY3Rfc291cmNlX3Jvb3QoKSBpbnN0ZWFkIG9mIG1lc29uLmN1cnJlbnRfc291cmNlX2Rpcigp
IGFzCiAgc3VnZ2VzdGVkIGluIGNvbW1lbnQgZm9yIG1lc29uID49IDAuNTYKCi0gdXNlIGluc3Rh
bGxfZW1wdHlkaXIgaW5zdGVhZCBvZiBpbnN0YWxsX3N1YmRpciBhcyBzdWdnZXN0ZWQgaW4gY29t
bWVudCBmb3IKICBtZXNvbiA+PSAwLjYwLCBmaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmdzOgoK
ICB1dGlscy9rZXl0YWJsZS9tZXNvbi5idWlsZDo4OTogV0FSTklORzogUHJvamVjdCB0YXJnZXRz
ICc+PSAwLjYwJyBidXQgdXNlcyBmZWF0dXJlIGRlcHJlY2F0ZWQgc2luY2UgJzAuNjAuMCc6IGlu
c3RhbGxfc3ViZGlyIHdpdGggZW1wdHkgZGlyZWN0b3J5LiBJdCB3b3JrZWQgYnkgYWNjaWRlbnQg
YW5kIGlzIGJ1Z2d5LiBVc2UgaW5zdGFsbF9lbXB0eWRpciBpbnN0ZWFkLgogIFdBUk5JTkc6IERl
cHJlY2F0ZWQgZmVhdHVyZXMgdXNlZDoKICAgKiAwLjYwLjA6IHsnaW5zdGFsbF9zdWJkaXIgd2l0
aCBlbXB0eSBkaXJlY3RvcnknfQoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJl
cG9ydEBnbXgubmV0PgotLS0KIG1lc29uLmJ1aWxkICAgICAgICAgICAgICAgIHwgMyArLS0KIHV0
aWxzL2tleXRhYmxlL21lc29uLmJ1aWxkIHwgNyArLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBi
L21lc29uLmJ1aWxkCmluZGV4IGE4ODQzYzhmLi5hYWQ4YTc5NCAxMDA2NDQKLS0tIGEvbWVzb24u
YnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAgLTksOCArOSw3IEBAIHByb2plY3QoJ3Y0bC11dGls
cycsICdjJywgJ2NwcCcsCiAgICAgXSwKICAgICBsaWNlbnNlIDogJ0xHUEwgMi4xKycpCiAKLSMg
bWVzb24gPj0gMC41NiBjYW4gdXNlIGluc3RlYWQgbWVzb24ucHJvamVjdF9zb3VyY2Vfcm9vdCgp
Ci1zb3VyY2Vfcm9vdCA9IG1lc29uLmN1cnJlbnRfc291cmNlX2RpcigpCitzb3VyY2Vfcm9vdCA9
IG1lc29uLnByb2plY3Rfc291cmNlX3Jvb3QoKQogCiBjYyA9IG1lc29uLmdldF9jb21waWxlcign
YycpCiBjcHAgPSBtZXNvbi5nZXRfY29tcGlsZXIoJ2NwcCcpCmRpZmYgLS1naXQgYS91dGlscy9r
ZXl0YWJsZS9tZXNvbi5idWlsZCBiL3V0aWxzL2tleXRhYmxlL21lc29uLmJ1aWxkCmluZGV4IGMw
MmQ0ZWE5Li5lMjE0ZTBiNSAxMDA2NDQKLS0tIGEvdXRpbHMva2V5dGFibGUvbWVzb24uYnVpbGQK
KysrIGIvdXRpbHMva2V5dGFibGUvbWVzb24uYnVpbGQKQEAgLTgyLDkgKzgyLDQgQEAgZW5kaWYK
IGVuZGlmCiBlbmRpZgogCi0jIEluc3RhbGwgbm9uLWV4aXN0aW5nIGRpcmVjdG9yeSB0byBjcmVh
dGUgZW1wdHkgZGlyZWN0b3J5IHN0cnVjdHVyZQotIyBTZWU6IGh0dHBzOi8vZ2l0aHViLmNvbS9t
ZXNvbmJ1aWxkL21lc29uL2lzc3Vlcy8yOTA0Ci0jIFRoaXMgc2hvdWxkIGJlIHJlcGxhY2VkIHdp
dGggaW5zdGFsbF9lbXB0eWRpcigpIHdoZW4gYnVtcGluZyB0aGUgbWluaW11bSBtZXNvbgotIyB2
ZXJzaW9uIHRvIDAuNjAuMC4KLWluc3RhbGxfc3ViZGlyKCdwcm90b2NvbHMnLAotICAgICAgICAg
ICAgICAgaW5zdGFsbF9kaXIgOiBpcl9rZXl0YWJsZV91c2VyX2RpcikKK2luc3RhbGxfZW1wdHlk
aXIoaXJfa2V5dGFibGVfdXNlcl9kaXIgLyAncHJvdG9jb2xzJykKLS0gCjIuNDcuMAoK

