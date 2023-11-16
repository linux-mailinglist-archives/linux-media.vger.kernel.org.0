Return-Path: <linux-media+bounces-439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21D7EE098
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 13:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 450B21C20A06
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 12:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520382FE18;
	Thu, 16 Nov 2023 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="lkrCV4Nm"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE8E1A3
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 04:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700137187; x=1700741987; i=ps.report@gmx.net;
	bh=nYQwD9PTnIV16rk+6rCYGfdwng+QWXHUl9sOdkX4DZw=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=lkrCV4Nmn0fbqYFmdI7uRD0Ao5vaS5q2blcU9yFKGbTMmx0tC29y7C3tKbK2Z9k/
	 n/4p+hceiE6dlGsYLNToAAibzoNioIyqxaBklEIpBBJWk9rsm9kt/eqnfRxa6WyF+
	 Zb7RKX6mP1L/snIBNFX5faTuT2Znq3gnavMY4LhZ8HVZD3i7Ro1H02NuBQrPZ2JF3
	 SOfpR7ewOBuwDaewtbljxnXY/CnEderDkorN1cy7O/4aFxBkhHdhf13nzMHJetbrp
	 0AxJVc6SJVh+z3D2dUnl9T98crPRzgr+0mbknbZMDcd0FylBkXYH5FYBzoMZr/peK
	 e/PDMMODJfQp86Apsg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.247]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N5G9n-1rTQ5W2IJJ-011Av0 for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023
 13:19:47 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 1/2] v4l2-tracer: wrap open64/mmap64 functions only if linux && __GLIBC__
Date: Thu, 16 Nov 2023 13:19:46 +0100
Message-ID: <20231116121947.28147-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:9R09iXREjD07VbWje1VuP0d1pO9za26pRIz9dbiSg/IalQtK86c
 caYJF8UiqpFhpeCIIzd8+g1PSpDPl1IZvpTb1asl3oO6yVpvCWTrsnio0nRgFodwxIrxuAA
 FOK+1OkC1ceQHkThlQPQ8aYq7fXZtX/pFA3aGNH3vIX6g3uQ2cV6AC0nbHXGohOshpmcKrc
 5EXmJ4YiKBsWx+a7EnlCw==
UI-OutboundReport: notjunk:1;M01:P0:RRotx3EM32E=;d8Gt5iwd+iNRAAeYPywNSMLCE5H
 CR3u+46lpzQkm1uWymbxlOZSF+wuke8egrd5kVNRMwH4smZdZ6j3ToHUnkceFrfoPm20xeIK4
 nLD79bhQLEMt3h4RZYyU1ueHaAMt42HPvbfKLY9AsjBp9He8LFmkNDjsqPt3ujznBFvlysh1I
 Q0o2irUHm33MmB+T6GwZEL+ayoBT0xum1mExkUonKoRiueyD5YbVSl8w98at967xxQbZsy1ys
 RvcOxEbILMUaVZZfS8L+p8fyAh6G7u51gHjEzXZg7mVDYzVDIg80VsLeSKIowf7lxI00shLxZ
 AtQiti6BG7JxMjGLingFK7npU/lHwcYGVuxHKRcr3WVVGEzwYbu6lc9oiBipw5OZ3REu8M+DU
 VG+xKDVAiA74u5+QwK/GvMHkbKD3C1c5MvocfkFBKS0Jy3yzurSQGm6EWF/jAWAmlqrLT13HW
 nYThruxYOb5caBuxN5+ldcdk/vk0W275XmO1O/S9LMu0Oms+un3feKdqet6kJz+ypb0v9mA1e
 p+Vb3yLFPnfEz8dN+KsYILaIlb/SlpwlgqP50Ki60MGdl/B1KZbUmKYomYZOephbguuhua10p
 GXlzXQJQYusjm6zpwOjcHlxusqBxYyIG2xC5GokbdpQycuoguN8H2bJ2W+Ds+AHrfplRFMncL
 ZURCtMSpe1xX5pIeSTYXr41dP8oAeo0Ivizwhq+YdxdKM6KOwr0YONlNu/U+hqA1pp1eF4Pq3
 Pii2HmoreGhsdSrlzi2cVgWwQtneMMSLZuOPXwY1eZ6gDMlXfmJ4KD7tAluT6DMPAWwZZWfbs
 n5VZj8SyUkNGAhlFRYGGoIPeGyAuuiY/8xl6ss8fMwDZwzpAJxnG2noGw/HTZtFFV5KDe2OGz
 E4VdT3JE7mKssdf5ui1hF5oE5E14Ywee6aQn7YyI87AQXQvkJrmmNwMzuCQG/aoDL1Xm6u7US
 vtVeNjD5gVqj/AmmDm9K/B1rHAU=

V3JhcCBvcGVuNjQvbW1hcDY0IGZ1bmN0aW9ucyBvbmx5IGlmIGxpbnV4ICYmIF9fR0xJQkNfXywg
YXMgZG9uZQppbiBsaWIvbGlidjRsMS92NGwxY29tYXB0LmMgYW5kIGxpYi9saWJ2NGwyL3Y0bDJj
b252ZXJ0LmMgc2luY2UKY29tbWl0ICdsaWJ2NGw6IFdyYXAgTEZTNjQgZnVuY3Rpb25zIG9ubHkg
aWYgbGludXggJiYgX19HTElCQ19fJwooNDAzYTRlMjY5N2ExZmY5NmZlMmZhMTY1ODkwMzk1OTVm
MjFjYWRmMCksIHNob3VsZCBmaXggbXVzbCBsaWJjCmNvbXBpbGUuCgpTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQogdXRpbHMvdjRsMi10cmFjZXIv
bGlidjRsMnRyYWNlci5jcHAgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS91dGlscy92NGwyLXRyYWNlci9saWJ2NGwydHJhY2VyLmNwcCBiL3V0
aWxzL3Y0bDItdHJhY2VyL2xpYnY0bDJ0cmFjZXIuY3BwCmluZGV4IGE5ZjAzOWM3Li42OGY2MzA0
YSAxMDA2NDQKLS0tIGEvdXRpbHMvdjRsMi10cmFjZXIvbGlidjRsMnRyYWNlci5jcHAKKysrIGIv
dXRpbHMvdjRsMi10cmFjZXIvbGlidjRsMnRyYWNlci5jcHAKQEAgLTg5LDYgKzg5LDcgQEAgaW50
IG9wZW4oY29uc3QgY2hhciAqcGF0aCwgaW50IG9mbGFnLCAuLi4pCiAJcmV0dXJuIGZkOwogfQog
CisjaWYgZGVmaW5lZChsaW51eCkgJiYgZGVmaW5lZChfX0dMSUJDX18pCiBpbnQgb3BlbjY0KGNv
bnN0IGNoYXIgKnBhdGgsIGludCBvZmxhZywgLi4uKQogewogCWVycm5vID0gMDsKQEAgLTEyNCw2
ICsxMjUsNyBAQCBpbnQgb3BlbjY0KGNvbnN0IGNoYXIgKnBhdGgsIGludCBvZmxhZywgLi4uKQog
CiAJcmV0dXJuIGZkOwogfQorI2VuZGlmCiAKIGludCBjbG9zZShpbnQgZmQpCiB7CkBAIC0xNzcs
NiArMTc5LDcgQEAgdm9pZCAqbW1hcCh2b2lkICphZGRyLCBzaXplX3QgbGVuLCBpbnQgcHJvdCwg
aW50IGZsYWdzLCBpbnQgZmlsZGVzLCBvZmZfdCBvZmYpCiAJcmV0dXJuIGJ1Zl9hZGRyZXNzX3Bv
aW50ZXI7CiB9CiAKKyNpZiBkZWZpbmVkKGxpbnV4KSAmJiBkZWZpbmVkKF9fR0xJQkNfXykKIHZv
aWQgKm1tYXA2NCh2b2lkICphZGRyLCBzaXplX3QgbGVuLCBpbnQgcHJvdCwgaW50IGZsYWdzLCBp
bnQgZmlsZGVzLCBvZmZfdCBvZmYpCiB7CiAJZXJybm8gPSAwOwpAQCAtMTkxLDYgKzE5NCw3IEBA
IHZvaWQgKm1tYXA2NCh2b2lkICphZGRyLCBzaXplX3QgbGVuLCBpbnQgcHJvdCwgaW50IGZsYWdz
LCBpbnQgZmlsZGVzLCBvZmZfdCBvZmYpCiAKIAlyZXR1cm4gYnVmX2FkZHJlc3NfcG9pbnRlcjsK
IH0KKyNlbmRpZgogCiBpbnQgbXVubWFwKHZvaWQgKnN0YXJ0LCBzaXplX3QgbGVuZ3RoKQogewot
LSAKMi40MC4wCgo=

