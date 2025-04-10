Return-Path: <linux-media+bounces-29819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBC5A83514
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 02:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B52C461FB8
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 00:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F6B48CFC;
	Thu, 10 Apr 2025 00:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="JMHP1iYr"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBD03596F;
	Thu, 10 Apr 2025 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744244908; cv=none; b=D5y0J0boBk3q72kESk2HEMd4MFgDz/m04uQUxemDJmD6k3LRl8l+r28UoVd0D7hjNuM1yFhSv3Ef2kmwyCOTaPbrerY6VnXltf1fPv3q7c+q51oZ0U+IzNrHQ4DN4Uqv+uiqtmgzshXnZ/opCxFsUCL/03+hcKAVOp17U9VWRvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744244908; c=relaxed/simple;
	bh=urdk/C6cNo2xp8sTslRc5Ph6KdmwcBk1p7LFugSPaFI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=r9BaxbgD0jY3WeM/uDAuxDylYWGOrQI2dTLJ3NwuGy5b2b7jXHXJDxgTf9on/gQniQaIXhTowMAaPjwZLnrUKqEXdRGX1XeDmHIe5W75lAnIStistZPrLU9BgjwA1Oz1r073nUyd5Xzydxn/IuL+wvu2HXnqMn7JnYtZFUBh4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=JMHP1iYr reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=FU89nmJGK3MmjRRDkrqt7x0SrwcewmRIp34YsV8rY2I=; b=J
	MHP1iYrpD0s/uF5ggxfuUkGoVU9GPlmMFACuKSEnJP4OEXl3kzWhCAJ3OcjU+Rl6
	cQsdzCuDmiR2E21CY5nYOZ2v6ukQVTvwMVylRbtCSqqSblSTLoEvaayxLC7NxNgg
	NMvO+LrrCZy/Zs5frNwUgrcG42olsWYYWUJl1jRGeg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-131 (Coremail) ; Thu, 10 Apr 2025 08:27:16 +0800
 (CST)
Date: Thu, 10 Apr 2025 08:27:16 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>
Cc: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>,
	"Philipp Zabel" <p.zabel@pengutronix.de>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Heiko Stuebner" <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re:[PATCH] media: verisilicono: Enable NV15 support for Rockchip
 VDPU981
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250409-b4-hantro-nv15-support-v1-1-7e11e47fd0c9@collabora.com>
References: <20250409-b4-hantro-nv15-support-v1-1-7e11e47fd0c9@collabora.com>
X-NTES-SC: AL_Qu2fBv6fu0Ao4CWfYelSzDJG5Lh7O6vv+JRShMQdW/AxqTHp1CMpUFZ4O3zE3sliJbM7Es2CSj5lxTzXEBWW
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7b70a71a.448.1961d1808e5.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gygvCgDnT3lkEPdne_CRAA--.25738W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAkqXmf3AWfu2wABsX
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIE5pY29sYXPvvIwKICAgICAgVHlwbyBpbiBzdWJqZWN077yfIHMvdmVyaXNpbGljb25vL3Zl
cmlzaWxpY29uLyAgICAgIAoKQXQgMjAyNS0wNC0xMCAwMzozMDowOSwgIk5pY29sYXMgRHVmcmVz
bmUiIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+VGhpcyBpcyBhICJj
dXN0b21lciIgZm9ybWF0LCB0aG91Z2ggb24gUm9ja2NoaXAgUkszNTg4IGl0IGhhcyBiZWVuCj52
ZXJpZmllZCB0byBiZSBOVjE1IGZvcm1hdCwgd2hpY2ggbWF0Y2hlcyB3aGF0IHRoZSBHUFUgYW5k
IGRpc3BsYXkKPmhhbmRsZXMgaGFzIDEwYml0IHBpeGVsIGZvcm1hdHMuCj4KPlNpZ25lZC1vZmYt
Ynk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4KPi0t
LQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX3Y0bDIuYyAgICAg
ICAgICAgfCAgMSArCj4gLi4uL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3JvY2tjaGlwX3ZwdTk4MV9o
d19hdjFfZGVjLmMgICAgICB8ICA0ICsrKysKPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Zlcmlz
aWxpY29uL3JvY2tjaGlwX3ZwdV9ody5jICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPiAzIGZp
bGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX3Y0bDIuYyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vdmVyaXNpbGljb24vaGFudHJvX3Y0bDIuYwo+aW5kZXggMmJjZTk0MGE1ODIyN2MyYmZl
ZjJiYzMzNDM5OTJlNDU4OGFiMzZhNC4uN2MzNTE1Y2Y3ZDY0YTA5MGFkZmI4ZDhhZmYzNjhmOWE2
MTdmOGM4YSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24v
aGFudHJvX3Y0bDIuYwo+KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9o
YW50cm9fdjRsMi5jCj5AQCAtNzcsNiArNzcsNyBAQCBpbnQgaGFudHJvX2dldF9mb3JtYXRfZGVw
dGgodTMyIGZvdXJjYykKPiAJc3dpdGNoIChmb3VyY2MpIHsKPiAJY2FzZSBWNEwyX1BJWF9GTVRf
UDAxMDoKPiAJY2FzZSBWNEwyX1BJWF9GTVRfUDAxMF80TDQ6Cj4rCWNhc2UgVjRMMl9QSVhfRk1U
X05WMTU6Cj4gCWNhc2UgVjRMMl9QSVhfRk1UX05WMTVfNEw0Ogo+IAkJcmV0dXJuIDEwOwo+IAlk
ZWZhdWx0Ogo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24v
cm9ja2NoaXBfdnB1OTgxX2h3X2F2MV9kZWMuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVy
aXNpbGljb24vcm9ja2NoaXBfdnB1OTgxX2h3X2F2MV9kZWMuYwo+aW5kZXggNjliNWQ5ZTEyOTI2
ZmI0MDhjMDhmOGJhMjEzOWQwNWJhNDQzODliNy4uZTQ3MDNiYjZiZTdjMTc1YTg5YzBiODg2OGNm
MmVhZmI4NGE4NzJlZCAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNp
bGljb24vcm9ja2NoaXBfdnB1OTgxX2h3X2F2MV9kZWMuYwo+KysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS92ZXJpc2lsaWNvbi9yb2NrY2hpcF92cHU5ODFfaHdfYXYxX2RlYy5jCj5AQCAtMjIw
Miw2ICsyMjAyLDEwIEBAIHN0YXRpYyB2b2lkIHJvY2tjaGlwX3ZwdTk4MV9wb3N0cHJvY19lbmFi
bGUoc3RydWN0IGhhbnRyb19jdHggKmN0eCkKPiAJY2FzZSBWNEwyX1BJWF9GTVRfTlYxMjoKPiAJ
CWhhbnRyb19yZWdfd3JpdGUodnB1LCAmYXYxX3BwX291dF9mb3JtYXQsIDMpOwo+IAkJYnJlYWs7
Cj4rCWNhc2UgVjRMMl9QSVhfRk1UX05WMTU6Cj4rCQkvKiB0aGlzIG1hcHBpbmcgaXMgUksgc3Bl
Y2lmaWMgKi8KPisJCWhhbnRyb19yZWdfd3JpdGUodnB1LCAmYXYxX3BwX291dF9mb3JtYXQsIDEw
KTsKPisJCWJyZWFrOwo+IAlkZWZhdWx0Ogo+IAkJaGFudHJvX3JlZ193cml0ZSh2cHUsICZhdjFf
cHBfb3V0X2Zvcm1hdCwgMCk7Cj4gCX0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3ZlcmlzaWxpY29uL3JvY2tjaGlwX3ZwdV9ody5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS92ZXJpc2lsaWNvbi9yb2NrY2hpcF92cHVfaHcuYwo+aW5kZXggOTY0MTIyZTdjMzU1OTM0Y2Q4
MGViNDQyMjE5ZjZiYTUxYmJhOGI3MS4uZjdjNGExNzYxNjdiNDBmZTc5ZWM1YTY3NTlkZmY4YTc3
ZTg0OWFlMyAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24v
cm9ja2NoaXBfdnB1X2h3LmMKPisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGlj
b24vcm9ja2NoaXBfdnB1X2h3LmMKPkBAIC05Miw2ICs5MiwyMCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGhhbnRyb19mbXQgcm9ja2NoaXBfdnB1OTgxX3Bvc3Rwcm9jX2ZtdHNbXSA9IHsKPiAJCQku
c3RlcF9oZWlnaHQgPSBNQl9ESU0sCj4gCQl9LAo+IAl9LAo+Kwl7Cj4rCQkuZm91cmNjID0gVjRM
Ml9QSVhfRk1UX05WMTUsCj4rCQkuY29kZWNfbW9kZSA9IEhBTlRST19NT0RFX05PTkUsCj4rCQku
bWF0Y2hfZGVwdGggPSB0cnVlLAo+KwkJLnBvc3Rwcm9jZXNzZWQgPSB0cnVlLAo+KwkJLmZybXNp
emUgPSB7Cj4rCQkJLm1pbl93aWR0aCA9IFJPQ0tDSElQX1ZQVTk4MV9NSU5fU0laRSwKPisJCQku
bWF4X3dpZHRoID0gRk1UXzRLX1dJRFRILAo+KwkJCS5zdGVwX3dpZHRoID0gTUJfRElNLAo+KwkJ
CS5taW5faGVpZ2h0ID0gUk9DS0NISVBfVlBVOTgxX01JTl9TSVpFLAo+KwkJCS5tYXhfaGVpZ2h0
ID0gRk1UXzRLX0hFSUdIVCwKPisJCQkuc3RlcF9oZWlnaHQgPSBNQl9ESU0sCj4rCQl9LAo+Kwl9
LAo+IAl7Cj4gCQkuZm91cmNjID0gVjRMMl9QSVhfRk1UX1AwMTAsCj4gCQkuY29kZWNfbW9kZSA9
IEhBTlRST19NT0RFX05PTkUsCj4KPi0tLQo+YmFzZS1jb21taXQ6IDlkZGMzZDZjMTZlYTI1ODc4
OThhMzE1ZjIwZjdiOGZiZDc5MWRjMWIKPmNoYW5nZS1pZDogMjAyNTA0MDMtYjQtaGFudHJvLW52
MTUtc3VwcG9ydC0wN2RlZjRlN2E1MzcKPgo+QmVzdCByZWdhcmRzLAo+LS0gCj5OaWNvbGFzIER1
ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+Cj4K

