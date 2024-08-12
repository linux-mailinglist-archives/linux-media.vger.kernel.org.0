Return-Path: <linux-media+bounces-16119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 379D694E81F
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6B63B23B55
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED0016726E;
	Mon, 12 Aug 2024 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="D45LqLEx"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01D2163A9B;
	Mon, 12 Aug 2024 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723449214; cv=none; b=RjzpGNGKOXs11r56DmrqtJFSzzS3RumdpDn+zWIS/ww5Y0VOtEMRCRLCselJ8qA8s97PRhSTaAcq5SAc179BY6bp4KfIKxSg3b33ulAw02ENADf8u4osSbBocHgsAWaKml1yOA9aZfT3f2mgJe+a+Gy9gyLy2EB9ZusXrFTgb00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723449214; c=relaxed/simple;
	bh=6O9UsGTt35vTr9eE1+t9YyuzLBpYD+YgW+Oe7Y1fa64=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=MRtSRgXV3Lip7f/M4+t+/E5fYGhnYtkFtQHIKdZtNJ6oQEduEaXrdy1cJqVlzjwT3htqqJTTrJ9Z/dnqTHlvP8goS9yZ96APsszDFpimECrdp3eo9MM2r4eEM5+vyhHsJILhlclygbRS7TDxdxy6S/Pe58Tb5/5kEom6pGlkDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=D45LqLEx reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=cf/oDFPh1h7t+vr/sE7Er9gMs7gjh38TKu6Qs3h6YLk=; b=D
	45LqLExEp5IWUA5Z8fu9VvId/Zb9as0AG1zJy4DsmMaqsD3BL/58cy8bf+47I/V0
	U5sgfQAbnEIef6DR3KHIXGoPzYhgC641CYEye8WiNXWcxMv/XHZudg9demQ6Bza+
	gEA8JBp2XxSWPxPAh2QfL1YgC31sPR3OQckHWGQI5w=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-140 (Coremail) ; Mon, 12 Aug 2024 15:52:04 +0800
 (CST)
Date: Mon, 12 Aug 2024 15:52:04 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>
Cc: "Karol Herbst" <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>, 
	"Danilo Krummrich" <dakr@redhat.com>, 
	"David Airlie" <airlied@gmail.com>, 
	"Daniel Vetter" <daniel@ffwll.ch>, 
	"Thierry Reding" <thierry.reding@gmail.com>, 
	"Jonathan Hunter" <jonathanh@nvidia.com>, 
	"Sandy Huang" <hjc@rock-chips.com>, 
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
	"Maxime Ripard" <mripard@kernel.org>, 
	"Thomas Zimmermann" <tzimmermann@suse.de>, 
	"Mikko Perttunen" <mperttunen@nvidia.com>, 
	"Joerg Roedel" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, 
	"Robin Murphy" <robin.murphy@arm.com>, 
	"Jason Gunthorpe" <jgg@ziepe.ca>, 
	"Kevin Tian" <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Jason Gunthorpe" <jgg@nvidia.com>
Subject: Re:[PATCH 2/3] drm/rockchip: Use iommu_paging_domain_alloc()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240812071034.9443-2-baolu.lu@linux.intel.com>
References: <20240812071034.9443-1-baolu.lu@linux.intel.com>
 <20240812071034.9443-2-baolu.lu@linux.intel.com>
X-NTES-SC: AL_Qu2ZAfiftkkp4ieZY+kXn0kXhec2W8Czvvgg34JRP5k0hyXh4w84enhsBWX50cSJNTCNtx+ebhV8+Ol2d45bUprPl6S0Hryyge3eGEHR2scc
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7031938c.673c.1914592a773.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3H9ckv7lmqS4YAA--.648W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRg5XmVOCJXbOwABsB
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

Ckhp77yMCiAgVGhhbmtzIGZvciB5b3VyIHBhdGNoCgpBdCAyMDI0LTA4LTEyIDE1OjEwOjMzLCAi
THUgQmFvbHUiIDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Q29tbWl0IDw0MjFi
ZTNlZTM2YTQ+ICgiZHJtL3JvY2tjaGlwOiBSZWZhY3RvciBJT01NVSBpbml0aWFsaXNhdGlvbiIp
IGhhcwo+cmVmYWN0b3JlZCByb2NrY2hpcF9kcm1faW5pdF9pb21tdSgpIHRvIHBhc3MgYSBkZXZp
Y2UgdGhhdCB0aGUgZG9tYWluIGlzCj5hbGxvY2F0ZWQgZm9yLiBSZXBsYWNlIGlvbW11X2RvbWFp
bl9hbGxvYygpIHdpdGgKPmlvbW11X3BhZ2luZ19kb21haW5fYWxsb2MoKSB0byByZXRpcmUgdGhl
IGZvcm1lci4KPgo+U2lnbmVkLW9mZi1ieTogTHUgQmFvbHUgPGJhb2x1Lmx1QGxpbnV4LmludGVs
LmNvbT4KPlJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPgo+TGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDYxMDA4NTU1NS44ODE5Ny0xOS1iYW9s
dS5sdUBsaW51eC5pbnRlbC5jb20KICBBY2tlZC1ieTogQW5keSBZYW4gPGFuZHlzaHJrQDE2My5j
b20+CgoKPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMg
fCAxMCArKysrKysrLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5j
Cj5pbmRleCA0NGQ3NjlkOTIzNGQuLjExZTVkMTBkZTRkNyAxMDA2NDQKPi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMKPisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMKPkBAIC0xMDMsMTMgKzEwMywxNyBAQCBzdGF0
aWMgaW50IHJvY2tjaGlwX2RybV9pbml0X2lvbW11KHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2
KQo+IAlzdHJ1Y3Qgcm9ja2NoaXBfZHJtX3ByaXZhdGUgKnByaXZhdGUgPSBkcm1fZGV2LT5kZXZf
cHJpdmF0ZTsKPiAJc3RydWN0IGlvbW11X2RvbWFpbl9nZW9tZXRyeSAqZ2VvbWV0cnk7Cj4gCXU2
NCBzdGFydCwgZW5kOwo+KwlpbnQgcmV0Owo+IAo+IAlpZiAoSVNfRVJSX09SX05VTEwocHJpdmF0
ZS0+aW9tbXVfZGV2KSkKPiAJCXJldHVybiAwOwo+IAo+LQlwcml2YXRlLT5kb21haW4gPSBpb21t
dV9kb21haW5fYWxsb2MocHJpdmF0ZS0+aW9tbXVfZGV2LT5idXMpOwo+LQlpZiAoIXByaXZhdGUt
PmRvbWFpbikKPi0JCXJldHVybiAtRU5PTUVNOwo+Kwlwcml2YXRlLT5kb21haW4gPSBpb21tdV9w
YWdpbmdfZG9tYWluX2FsbG9jKHByaXZhdGUtPmlvbW11X2Rldik7Cj4rCWlmIChJU19FUlIocHJp
dmF0ZS0+ZG9tYWluKSkgewo+KwkJcmV0ID0gUFRSX0VSUihwcml2YXRlLT5kb21haW4pOwo+KwkJ
cHJpdmF0ZS0+ZG9tYWluID0gTlVMTDsKPisJCXJldHVybiByZXQ7Cj4rCX0KPiAKPiAJZ2VvbWV0
cnkgPSAmcHJpdmF0ZS0+ZG9tYWluLT5nZW9tZXRyeTsKPiAJc3RhcnQgPSBnZW9tZXRyeS0+YXBl
cnR1cmVfc3RhcnQ7Cj4tLSAKPjIuMzQuMQo+Cg==

