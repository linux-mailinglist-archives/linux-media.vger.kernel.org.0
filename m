Return-Path: <linux-media+bounces-20613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C77719B6F8C
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 22:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72EC31F22804
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 21:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43E521894E;
	Wed, 30 Oct 2024 21:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="qqNqGjQn"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E244B1CBEA1;
	Wed, 30 Oct 2024 21:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730324758; cv=none; b=aNgFkAfPb8aMrvUe1jOQ/YvYjqfTxOWnaap0DuP6Tg71cOj42/XAakMlDl4lNTDq5qzgo3qIvRwxEw9mbLyp/VGpqpn0gnv/ePvDcY+hMYnLqSxcpSTjYiQlTf5TGznT2mECkFDb+zM93kfxScr25nOVkD8PXhubSs1wIUJSFDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730324758; c=relaxed/simple;
	bh=NSz88WZa5x3ilnuYzu6e+i06vyANCjIXUslvd6feros=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ot3UQ7BzcVBJSmzt6hf5OzXPB9UAYxgCHSURATrzvdMKOW9WqmvTGkSGUekjwErklv8r/8rL6nOexGUwWL62ahYLS8ZPx2+vEFugPYIun4kiogHPd+xrSpg/cy8bdhYGMAK+e405sT1eCHoRq+Q4qkorc3p9X1Fp+d94+jK037M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=qqNqGjQn; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NSz88WZa5x3ilnuYzu6e+i06vyANCjIXUslvd6feros=; b=qqNqGjQnzoM+peFuJ2SVk1ZzS5
	mOrcT34MnObm0rA29Uzaih66jU+/nvCq2wZHZo5oEm7YAxuUonWefEWtDUBenyizJMJEbr5a4no4g
	fApgtx70SN9+khVf/tLp9UDMbDdf/tskn6BuC5z17wELdyMA5ZG4unL/3juxlaSNLkwfAmyB4exSG
	3sYlgwYTSBdMlFTj8J2bawEYhFWbIL/qidj0WvvmxWi3PJVNxG9CY7bwJt1+p1iqa0/HJRg6XGXjd
	UmC1wrSdlwSYMXfg1+QUcEzT6AXmQZPX7+m+et9Xxqu/ssyhtS2DpwTlo5VFwTVSt8Fp0MD65GKoF
	fVJtD8Dg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1t6G4I-000GT3-1F;
	Wed, 30 Oct 2024 22:17:30 +0100
Received: from [77.64.252.106] (helo=framework.lan)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1t6G4I-0009Yw-1a;
	Wed, 30 Oct 2024 22:17:30 +0100
Message-ID: <76960282bb92e1827890712ed01e543803ceb992.camel@apitzsch.eu>
Subject: Re: [PATCH v2 07/13] media: i2c: imx214: Check number of lanes from
 device tree
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Date: Wed, 30 Oct 2024 22:17:27 +0100
In-Reply-To: <CAPybu_28VXjfJksVccfvytB9PU2-saNpAos8sBtQnhgt8KKz2w@mail.gmail.com>
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
	 <20241021-imx214-v2-7-fbd23e99541e@apitzsch.eu>
	 <CAPybu_28VXjfJksVccfvytB9PU2-saNpAos8sBtQnhgt8KKz2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.5/27443/Wed Oct 30 09:56:29 2024)

SGkgUmljYXJkbywKCkFtIE1pdHR3b2NoLCBkZW0gMzAuMTAuMjAyNCB1bSAxMjozOCArMDEwMCBz
Y2hyaWViIFJpY2FyZG8gUmliYWxkYQpEZWxnYWRvOgo+IE9uIE1vbiwgT2N0IDIxLCAyMDI0IGF0
IDEyOjE04oCvQU0gQW5kcsOpIEFwaXR6c2NoIHZpYSBCNCBSZWxheQo+IDxkZXZudWxsK2dpdC5h
cGl0enNjaC5ldUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IAo+ID4gRnJvbTogQW5kcsOpIEFwaXR6
c2NoIDxnaXRAYXBpdHpzY2guZXU+Cj4gPiAKPiA+IFRoZSBpbXgyMTQgY2FtZXJhIGlzIGNhcGFi
bGUgb2YgZWl0aGVyIHR3by1sYW5lIG9yIGZvdXItbGFuZQo+ID4gb3BlcmF0aW9uLgo+ID4gCj4g
PiBDdXJyZW50bHkgb25seSB0aGUgZm91ci1sYW5lIG1vZGUgaXMgc3VwcG9ydGVkLCBhcyBwcm9w
ZXIgcGl4ZWwKPiA+IHJhdGVzCj4gPiBhbmQgbGluayBmcmVxdWVuY2VzIGZvciB0aGUgdHdvLWxh
bmUgbW9kZSBhcmUgdW5rbm93bi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcsOpIEFwaXR6
c2NoIDxnaXRAYXBpdHpzY2guZXU+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9tZWRpYS9pMmMvaW14
MjE0LmMgfCAyNiArKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvaTJjL2lteDIxNC5jCj4gPiBiL2RyaXZlcnMvbWVkaWEvaTJjL2lteDIx
NC5jCj4gPiBpbmRleAo+ID4gMGM4MzE0OWJjYzNlM2I4MzNhMDg3ZDI2MTA0ZWI3ZGZhYWZkZjkw
NC4uNDk3YmFhZDYxNmFkNzM3NGE5MmEzZGEyYgo+ID4gN2MxMDk2YjFkNzJhMGM3IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvaW14MjE0LmMKPiA+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvaTJjL2lteDIxNC5jCj4gPiBAQCAtMTk5LDcgKzE5OSw2IEBAIHN0cnVjdCBpbXgyMTQgewo+
ID4gCj4gPiDCoC8qRnJvbSBpbXgyMTRfbW9kZV90YmxzLmgqLwo+ID4gwqBzdGF0aWMgY29uc3Qg
c3RydWN0IGNjaV9yZWdfc2VxdWVuY2UgbW9kZV80MDk2eDIzMDRbXSA9IHsKPiA+IC3CoMKgwqDC
oMKgwqAgeyBJTVgyMTRfUkVHX0NTSV9MQU5FX01PREUsIElNWDIxNF9DU0lfNF9MQU5FX01PREUg
fSwKPiA+IMKgwqDCoMKgwqDCoMKgIHsgSU1YMjE0X1JFR19IRFJfTU9ERSwgSU1YMjE0X0hEUl9N
T0RFX09GRiB9LAo+ID4gwqDCoMKgwqDCoMKgwqAgeyBJTVgyMTRfUkVHX0hEUl9SRVNfUkVEVUNU
SU9OLCBJTVgyMTRfSERSX1JFU19SRURVX1RIUk9VR0gKPiA+IH0sCj4gPiDCoMKgwqDCoMKgwqDC
oCB7IElNWDIxNF9SRUdfRVhQT1NVUkVfUkFUSU8sIDEgfSwKPiA+IEBAIC0yNzIsNyArMjcxLDYg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjY2lfcmVnX3NlcXVlbmNlCj4gPiBtb2RlXzQwOTZ4MjMw
NFtdID0gewo+ID4gwqB9Owo+ID4gCj4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2NpX3JlZ19z
ZXF1ZW5jZSBtb2RlXzE5MjB4MTA4MFtdID0gewo+ID4gLcKgwqDCoMKgwqDCoCB7IElNWDIxNF9S
RUdfQ1NJX0xBTkVfTU9ERSwgSU1YMjE0X0NTSV80X0xBTkVfTU9ERSB9LAo+ID4gwqDCoMKgwqDC
oMKgwqAgeyBJTVgyMTRfUkVHX0hEUl9NT0RFLCBJTVgyMTRfSERSX01PREVfT0ZGIH0sCj4gPiDC
oMKgwqDCoMKgwqDCoCB7IElNWDIxNF9SRUdfSERSX1JFU19SRURVQ1RJT04sIElNWDIxNF9IRFJf
UkVTX1JFRFVfVEhST1VHSAo+ID4gfSwKPiA+IMKgwqDCoMKgwqDCoMKgIHsgSU1YMjE0X1JFR19F
WFBPU1VSRV9SQVRJTywgMSB9LAo+ID4gQEAgLTc5MSw2ICs3ODksMTMgQEAgc3RhdGljIGludCBp
bXgyMTRfc3RhcnRfc3RyZWFtaW5nKHN0cnVjdAo+ID4gaW14MjE0ICppbXgyMTQpCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiA+IMKgwqDCoMKgwqDCoMKg
IH0KPiA+IAo+ID4gK8KgwqDCoMKgwqDCoCByZXQgPSBjY2lfd3JpdGUoaW14MjE0LT5yZWdtYXAs
IElNWDIxNF9SRUdfQ1NJX0xBTkVfTU9ERSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBJTVgyMTRfQ1NJXzRfTEFORV9NT0RFLCBOVUxMKTsKPiA+ICvC
oMKgwqDCoMKgwqAgaWYgKHJldCkgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGV2X2VycihpbXgyMTQtPmRldiwgIiVzIGZhaWxlZCB0byBjb25maWd1cmUKPiA+IGxhbmVzXG4i
LCBfX2Z1bmNfXyk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Owo+ID4gK8KgwqDCoMKgwqDCoCB9Cj4gPiArCj4gPiDCoMKgwqDCoMKgwqDCoCByZXQgPSBjY2lf
bXVsdGlfcmVnX3dyaXRlKGlteDIxNC0+cmVnbWFwLCBpbXgyMTQtPmN1cl9tb2RlLQo+ID4gPnJl
Z190YWJsZSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbXgyMTQtPmN1cl9tb2RlLT5udW1fb2ZfcmVncywKPiA+
IE5VTEwpOwo+ID4gwqDCoMKgwqDCoMKgwqAgaWYgKHJldCA8IDApIHsKPiA+IEBAIC05MzIsNyAr
OTM3LDcgQEAgc3RhdGljIGludCBpbXgyMTRfZ2V0X3JlZ3VsYXRvcnMoc3RydWN0IGRldmljZQo+
ID4gKmRldiwgc3RydWN0IGlteDIxNCAqaW14MjE0KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
bXgyMTQtPnN1cHBsaWVzKTsKPiA+IMKgfQo+ID4gCj4gPiAtc3RhdGljIGludCBpbXgyMTRfcGFy
c2VfZndub2RlKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICtzdGF0aWMgaW50IGlteDIxNF9wYXJz
ZV9md25vZGUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgaW14MjE0Cj4gPiAqaW14MjE0KQo+
IFdlIGRvbid0IHNlZW0gdG8gdXNlIGlteDIxNCBpbiB0aGUgZnVuY3Rpb24uIFlvdSBwcm9iYWJs
eSBkbyBub3Qgd2FudAo+IHRvIGFkZCB0aGlzIGNoYW5nZS4KPiA+IMKgewo+ID4gwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmVuZHBvaW50Owo+ID4gwqDCoMKgwqDCoMKgwqAg
c3RydWN0IHY0bDJfZndub2RlX2VuZHBvaW50IGJ1c19jZmcgPSB7Cj4gPiBAQCAtOTUxLDYgKzk1
NiwxMyBAQCBzdGF0aWMgaW50IGlteDIxNF9wYXJzZV9md25vZGUoc3RydWN0IGRldmljZQo+ID4g
KmRldikKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGRvbmU7Cj4gPiDC
oMKgwqDCoMKgwqDCoCB9Cj4gPiAKPiA+ICvCoMKgwqDCoMKgwqAgLyogQ2hlY2sgdGhlIG51bWJl
ciBvZiBNSVBJIENTSTIgZGF0YSBsYW5lcyAqLwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoYnVzX2Nm
Zy5idXMubWlwaV9jc2kyLm51bV9kYXRhX2xhbmVzICE9IDQpIHsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLAo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJvbmx5IDQg
ZGF0YSBsYW5lcyBhcmUgY3VycmVudGx5Cj4gPiBzdXBwb3J0ZWRcbiIpOwo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBkb25lOwo+ID4gK8KgwqDCoMKgwqDCoCB9Cj4gPiAr
Cj4gPiDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgYnVzX2NmZy5ucl9vZl9saW5rX2Zy
ZXF1ZW5jaWVzOyBpKyspCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGJ1
c19jZmcubGlua19mcmVxdWVuY2llc1tpXSA9PQo+ID4gSU1YMjE0X0RFRkFVTFRfTElOS19GUkVR
KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVh
azsKPiA+IEBAIC05NzUsMTQgKzk4NywxNCBAQCBzdGF0aWMgaW50IGlteDIxNF9wcm9iZShzdHJ1
Y3QgaTJjX2NsaWVudAo+ID4gKmNsaWVudCkKPiA+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpbXgy
MTQgKmlteDIxNDsKPiA+IMKgwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4gPiAKPiA+IC3CoMKgwqDC
oMKgwqAgcmV0ID0gaW14MjE0X3BhcnNlX2Z3bm9kZShkZXYpOwo+ID4gLcKgwqDCoMKgwqDCoCBp
ZiAocmV0KQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiA+
IC0KPiA+IMKgwqDCoMKgwqDCoMKgIGlteDIxNCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigq
aW14MjE0KSwgR0ZQX0tFUk5FTCk7Cj4gPiDCoMKgwqDCoMKgwqDCoCBpZiAoIWlteDIxNCkKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPiA+IAo+ID4g
K8KgwqDCoMKgwqDCoCByZXQgPSBpbXgyMTRfcGFyc2VfZndub2RlKGRldiwgaW14MjE0KTsKPiA+
ICvCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiByZXQ7Cj4gScKgIGFtIG5vdCBhZ2FpbnN0IGNoYW5naW5nIHRoZSBvcmRlci4uLiBi
dXQgdGhlIGNvbW1pdCBtZXNzYWdlIGRvZXMKPiBub3QgbWVudGlvbiBpdC4KPiAKCkknbSBub3Qg
c3VyZSBob3cgdG8gYXJndWUgd2h5IHRoZSBvcmRlciBzaG91bGQgYmUgY2hhbmdlZCwgbm93IHRo
YXQgdGhlCmlteDIxNCBhcmd1bWVudCBpcyBnb25lLiBJJ2xsIHJlc3RvcmUgdGhlIG9yaWdpbmFs
IG9yZGVyLiBJdCBjYW4gYmUKdW5kb25lLCB3aGVuIGFjdHVhbGx5IG5lZWRlZC4KCkJlc3QgcmVn
YXJkcywKQW5kcsOpCgo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqAgaW14MjE0LT5kZXYgPSBkZXY7
Cj4gPiAKPiA+IMKgwqDCoMKgwqDCoMKgIGlteDIxNC0+eGNsayA9IGRldm1fY2xrX2dldChkZXYs
IE5VTEwpOwo+ID4gCj4gPiAtLQo+ID4gMi40Ny4wCj4gPiAKPiA+IAoK


