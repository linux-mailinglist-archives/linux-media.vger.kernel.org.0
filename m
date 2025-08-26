Return-Path: <linux-media+bounces-41079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB9AB35F0B
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 14:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E42A746192B
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B218B338F2A;
	Tue, 26 Aug 2025 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="QYYfR4GT"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E441A8F6D;
	Tue, 26 Aug 2025 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756210824; cv=none; b=L5XYCn6fCnVi520z64mPts3TJDuvJOON/MP7yBUyZuKlBcZbo4xmz3QzPD19TGgY14jsFo/MyRFCkHDFEd8/K4g9yUVkvTjT0Jl++ZeKbZ3gMLIrrKNt3FsKg+Tp0Sy3dixy3fksfyBKcJOzBoU2vP3FDLO0nk+YkOv07pZMxMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756210824; c=relaxed/simple;
	bh=6fyBU+pXxw9lwOEPBA65B9tuntab1Wb6YZbVBwBqrec=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OKHUeDvnI9MDEJX3Nkoab3hMuUZibjFXd+S2JSfxhIc7df49R+dS/UPgq5Eg+DW/ysFhPpah/Bf8AANKuCKS0B4NINML0YY2EtGnUzyc4ga9yhcdj5qKtKDbq+dgbmCqw+TmHBBGXl/AaPY4XFVQrDKvOtc+fWYusVjl5d/JnPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=QYYfR4GT; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6fyBU+pXxw9lwOEPBA65B9tuntab1Wb6YZbVBwBqrec=; b=QYYfR4GTmGNai9lsP0X8Yvpahy
	wouUz5Br5MVpWq86u2zJMQPEc4t0strQfezxA7RZUSHivz4ZMVhSx+edqfS8IeIwA5NQ7ncwUavty
	fRghIJ9OakvH9Fo6RZjfdiyWACbmde4GYIkYTY5Tb1JXRULSmIOO40QSczTmaCQF1breT/MxCF5NZ
	ZmUzxToLhNFUPQMZUZIxSXuLQTASCxfNaASQ4PoUKojGWd6PATq/H/KK1cL35o17SHsGN5RcJoOJ7
	sQf7YHYwQOeHyoACvFTBOfszoMB8/0SZKU0RrvSfIAyvHA2b4MV1AlFwMuwuwf9Q4PLm0TzUz9HHQ
	fY1RyZXg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uqsJ3-0007hW-2D;
	Tue, 26 Aug 2025 13:57:41 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uqsJ3-0009Bz-2R;
	Tue, 26 Aug 2025 13:57:41 +0200
Message-ID: <605dd818dadce1fafb8a7bad0d3d5d9be8b45bba.camel@apitzsch.eu>
Subject: Re: [PATCH 1/7] dt-bindings: media: i2c: Add DW9718S, DW9719 and
 DW9761 VCM
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Daniel Scally <djrscally@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, 	devicetree@vger.kernel.org, Sakari Ailus
 <sakari.ailus@linux.intel.com>, 	~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Val Packett	 <val@packett.cool>
Date: Tue, 26 Aug 2025 13:57:39 +0200
In-Reply-To: <20250820215619.GA1381920-robh@kernel.org>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
	 <20250817-dw9719-v1-1-426f46c69a5a@apitzsch.eu>
	 <20250820215619.GA1381920-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.7/27744/Tue Aug 26 10:26:45 2025)

SGkgRGFuaWVsLAoKQW0gTWl0dHdvY2gsIGRlbSAyMC4wOC4yMDI1IHVtIDE2OjU2IC0wNTAwIHNj
aHJpZWIgUm9iIEhlcnJpbmc6Cj4gT24gU3VuLCBBdWcgMTcsIDIwMjUgYXQgMDc6MDk6MjBQTSAr
MDIwMCwgQW5kcsOpIEFwaXR6c2NoIHdyb3RlOgo+ID4gRG9jdW1lbnQgRG9uZ3dvb24gRFc5NzE4
UywgRFc5NzE5IGFuZCBEVzk3NjEgVkNNIGRldmljZXRyZWUKPiA+IGJpbmRpbmdzLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgQXBpdHpzY2ggPGdpdEBhcGl0enNjaC5ldT4KPiA+IAo+
ID4gLS0KPiA+IAo+ID4gVGhlIHBvc3NpYmxlIHZhbHVlcyBmb3Igc2FjLW1vZGUgYW5kIHZjbS1w
cmVzY2FsZSBvZiBEVzk3MTkgYW5kCj4gPiBEVzk3NjEKPiA+IGFyZSBtaXNzaW5nIGJlY2F1c2Ug
dGhlcmUgaXMgbm8gZG9jdW1lbnRhdGlvbiBhdmFpbGFibGUuCj4gPiAtLS0KPiA+IMKgLi4uL2Jp
bmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3MTkueWFtbMKgwqDCoMKgwqDCoMKgIHwgMTE1
Cj4gPiArKysrKysrKysrKysrKysrKysrKysKPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDExNSBpbnNl
cnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQKPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3MTkueWFtbAo+ID4gYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTcxOS55YW1s
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXgKPiA+IDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjgwZmQzZmQ0MjMyN2ZjYWZlM2ZmMjA5ZDEKPiA+IGNk
NmJiZTE3YjhhMjExYgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrCj4gPiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzE5LnlhbWwKPiA+
IEBAIC0wLDAgKzEsMTE1IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzE5
LnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IERvbmd3b29uIEFuYXRlY2ggRFc5NzE5IFZvaWNl
IENvaWwgTW90b3IgKFZDTSkgQ29udHJvbGxlcgo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4g
K8KgIC0gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPiAKPiBOby4gTXVzdCBiZSBzb21lb25l
IHRoYXQgaGFzIHRoZSBoL3cgb3IgY2FyZXMgYWJvdXQgaXQuIElmIHRoZXJlIGlzCj4gbm8gb25l
LCB0aGVuIHdlIGRvbid0IG5lZWQgdGhlIGJpbmRpbmcuCgphcyB5b3UgYXJlIGxpc3RlZCBhcyBt
YWludGFpbmVyIGZvciBEVzk3MTkgaW4gTUFJTlRBSU5FUlMsIGlzIGl0IG9rYXkKaWYgSSBhZGQg
eW91ciBuYW1lIGFuZCBlLW1haWwgaGVyZT8KCkJlc3QgcmVnYXJkcywKQW5kcsOpCgo+IAo+ID4g
Kwo+ID4gK2Rlc2NyaXB0aW9uOgo+ID4gK8KgIFRoZSBEb25nd29vbiBEVzk3MThTLzk3MTkvOTc2
MSBpcyBhIHNpbmdsZSAxMC1iaXQgZGlnaXRhbC10by0KPiA+IGFuYWxvZyBjb252ZXJ0ZXIKPiA+
ICvCoCB3aXRoIDEwMCBtQSBvdXRwdXQgY3VycmVudCBzaW5rIGNhcGFiaWxpdHksIGRlc2lnbmVk
IGZvciBsaW5lYXIKPiA+IGNvbnRyb2wgb2YKPiA+ICvCoCB2b2ljZSBjb2lsIG1vdG9ycyAoVkNN
KSBpbiBjYW1lcmEgbGVuc2VzLiBUaGlzIGNoaXAgcHJvdmlkZXMgYQo+ID4gU21hcnQgQWN0dWF0
b3IKPiA+ICvCoCBDb250cm9sIChTQUMpIG1vZGUgaW50ZW5kZWQgZm9yIGRyaXZpbmcgdm9pY2Ug
Y29pbCBsZW5zZXMgaW4KPiA+IGNhbWVyYSBtb2R1bGVzLgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6
Cj4gPiArwqAgY29tcGF0aWJsZToKPiA+ICvCoMKgwqAgZW51bToKPiA+ICvCoMKgwqDCoMKgIC0g
ZG9uZ3dvb24sZHc5NzE4cwo+ID4gK8KgwqDCoMKgwqAgLSBkb25nd29vbixkdzk3MTkKPiA+ICvC
oMKgwqDCoMKgIC0gZG9uZ3dvb24sZHc5NzYxCj4gPiArCj4gPiArwqAgcmVnOgo+ID4gK8KgwqDC
oCBtYXhJdGVtczogMQo+ID4gKwo+ID4gK8KgIHZkZC1zdXBwbHk6Cj4gPiArwqDCoMKgIGRlc2Ny
aXB0aW9uOiBWREQgcG93ZXIgc3VwcGx5Cj4gPiArCj4gPiArwqAgZG9uZ3dvb24sc2FjLW1vZGU6
Cj4gPiArwqDCoMKgIGRlc2NyaXB0aW9uOiB8Cj4gPiArwqDCoMKgwqDCoCBTbGV3IFJhdGUgQ29u
dHJvbCBtb2RlIHRvIHVzZTogZGlyZWN0LCBMU0MgKExpbmVhciBTbG9wZQo+ID4gQ29udHJvbCkg
b3IKPiA+ICvCoMKgwqDCoMKgIFNBQzEtU0FDNiAoU21hcnQgQWN0dWF0b3IgQ29udHJvbCkuCj4g
PiArwqDCoMKgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+
ID4gK8KgwqDCoCBlbnVtOgo+ID4gK8KgwqDCoMKgwqAgLSAwwqDCoCAjIERpcmVjdCBtb2RlCj4g
PiArwqDCoMKgwqDCoCAtIDHCoMKgICMgTFNDIG1vZGUKPiA+ICvCoMKgwqDCoMKgIC0gMsKgwqAg
IyBTQUMxIG1vZGUgKG9wZXJhdGlvbiB0aW1lIyAwLjMyIHggVHZpYikKPiA+ICvCoMKgwqDCoMKg
IC0gM8KgwqAgIyBTQUMyIG1vZGUgKG9wZXJhdGlvbiB0aW1lIyAwLjQ4IHggVHZpYikKPiA+ICvC
oMKgwqDCoMKgIC0gNMKgwqAgIyBTQUMzIG1vZGUgKG9wZXJhdGlvbiB0aW1lIyAwLjcyIHggVHZp
YikKPiA+ICvCoMKgwqDCoMKgIC0gNcKgwqAgIyBTQUM0IG1vZGUgKG9wZXJhdGlvbiB0aW1lIyAx
LjIwIHggVHZpYikKPiA+ICvCoMKgwqDCoMKgIC0gNsKgwqAgIyBTQUM1IG1vZGUgKG9wZXJhdGlv
biB0aW1lIyAxLjY0IHggVHZpYikKPiA+ICvCoMKgwqDCoMKgIC0gN8KgwqAgIyBTQUM2IG1vZGUg
KG9wZXJhdGlvbiB0aW1lIyAxLjg4IHggVHZpYikKPiA+ICvCoMKgwqAgZGVmYXVsdDogNAo+ID4g
Kwo+ID4gK8KgIGRvbmd3b29uLHZjbS1wcmVzY2FsZToKPiA+ICvCoMKgwqAgZGVzY3JpcHRpb246
Cj4gPiArwqDCoMKgwqDCoCBJbmRpY2F0aW9uIG9mIFZDTSBzd2l0Y2hpbmcgZnJlcXVlbmN5IGRp
dmlkaW5nIHJhdGUgc2VsZWN0Lgo+ID4gK8KgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50MzIKPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICvCoCAtIGNvbXBh
dGlibGUKPiA+ICvCoCAtIHJlZwo+ID4gK8KgIC0gdmRkLXN1cHBseQo+ID4gKwo+ID4gK2FsbE9m
Ogo+ID4gK8KgIC0gaWY6Cj4gPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ID4gK8KgwqDCoMKg
wqDCoMKgIGNvbXBhdGlibGU6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRhaW5zOgo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IGRvbmd3b29uLGR3OTcxOHMKPiA+ICvCoMKg
wqAgdGhlbjoKPiA+ICvCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4gPiArwqDCoMKgwqDCoMKgwqAg
ZG9uZ3dvb24sc2FjLW1vZGU6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6IDQKPiA+
ICvCoMKgwqDCoMKgwqDCoCBkb25nd29vbix2Y20tcHJlc2NhbGU6Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgIGRlc2NyaXB0aW9uOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVGhlIGZpbmFs
IGZyZXF1ZW5jeSBpcyAxMCBNSHogZGl2aWRlZCBieSAodmFsdWUgKyAyKS4KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqAgbWluaW11bTogMAo+IAo+IFRoYXQncyBhbHJlYWR5IHRoZSBtaW5pbXVtIGJl
aW5nIHVuc2lnbmVkLgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCBtYXhpbXVtOiAxNQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0OiAwCj4gPiArCj4gPiArwqAgLSBpZjoKPiA+ICvC
oMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4gPiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZToKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb25zdDogZG9uZ3dvb24sZHc5NzE5Cj4gPiArwqDCoMKgIHRoZW46Cj4gPiArwqDCoMKgwqDC
oCBwcm9wZXJ0aWVzOgo+ID4gK8KgwqDCoMKgwqDCoMKgIGRvbmd3b29uLHNhYy1tb2RlOgo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0OiA0Cj4gPiArwqDCoMKgwqDCoMKgwqAgZG9uZ3dv
b24sdmNtLXByZXNjYWxlOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0OiA5Ngo+ID4g
Kwo+ID4gK8KgIC0gaWY6Cj4gPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ID4gK8KgwqDCoMKg
wqDCoMKgIGNvbXBhdGlibGU6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRhaW5zOgo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IGRvbmd3b29uLGR3OTc2MQo+ID4gK8KgwqDC
oCB0aGVuOgo+ID4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoKPiA+ICvCoMKgwqDCoMKgwqDCoCBk
b25nd29vbixzYWMtbW9kZToKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDogNgo+IAo+
IEF0IHRoZSB0b3AtbGV2ZWwgeW91IGFscmVhZHkgc2FpZCB0aGUgZGVmYXVsdCBpcyA0LiBUaGUg
aWYvdGhlbiBpcyBhbgo+IEFORCBvcGVyYXRpb24uICdkZWZhdWx0JyBpcyBqdXN0IGFuIGFubm90
YXRpb24gYW5kIGhhcyBubyBlZmZlY3Qgb24gCj4gdmFsaWRhdGlvbi4gSSB3b3VsZCBqdXN0IGRy
b3AgaXQgZnJvbSB0aGUgaWYvdGhlbiBhbHRvZ2V0aGVyLiBJdCdzCj4gbm90IHdvcnRoIHRoZSBj
b21wbGV4aXR5Lgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgIGRvbmd3b29uLHZjbS1wcmVzY2FsZToK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDogNjIKPiA+ICsKPiA+ICthZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICvCoCAtIHwKPiA+ICvC
oMKgwqAgaTJjIHsKPiA+ICvCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+
ICvCoMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKg
wqDCoCBhY3R1YXRvckBjIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUg
PSAiZG9uZ3dvb24sZHc5NzE4cyI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8
MHgwYz47Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2ZGQtc3VwcGx5ID0gPCZw
bTg5MzdfbDE3PjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRvbmd3b29uLHNh
Yy1tb2RlID0gPDQ+Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9uZ3dvb24sdmNtLXBy
ZXNjYWxlID0gPDA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgIH07Cj4gPiArwqDCoMKgIH07Cj4gPiAK
PiA+IC0tIAo+ID4gMi41MC4xCj4gPiAK


