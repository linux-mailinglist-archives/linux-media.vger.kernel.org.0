Return-Path: <linux-media+bounces-877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC37F5B22
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 10:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 951AB281863
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 09:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861F92110F;
	Thu, 23 Nov 2023 09:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjmENV62"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661F9BA
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 01:37:12 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a02c48a0420so82456066b.2
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 01:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732231; x=1701337031; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d3OEXqd+yzQvKvfiB5kLk1mHve3SfHCT9h4p7ZvjMuo=;
        b=MjmENV62QzKunldRhvjm0W0x6s/AWzurI/yGgmQsrxPa01FN4BMDAHpDNsvdwIfK6U
         WTkFjcDCTZ4aLGXVfM71hreiog5iW2EeEJ8uOnbWT7EIoG5RT01nDM5nTX6iA4m2NnxQ
         E7WccL6LAHy++gIWxc5mDG9Upzl52V4hTuhx/NMZ6jEpiLeNk5z5oOtiLmnBitGDw457
         ajw894cn/m2sPEWn0CTX6d1V0RgO/IP9UBwiDdAzwA7E7GaHuEYqjbsgCnj0MuFRMFGh
         iDTnMLIyHIt8+HFnCgjrhicZoV7uu48RJ2aXNirWHZQ3vfkdNaZusgD/uA67T7srPQPp
         229Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732231; x=1701337031;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d3OEXqd+yzQvKvfiB5kLk1mHve3SfHCT9h4p7ZvjMuo=;
        b=UO4BKPK9oUSY+3k2feT9Mg2LZM8B3vNf2dtW0gqQfE5jeZQNwf8FdRyyKvVsiIccYf
         94RG7eA7+FIpnfviTXlQwgHTTHBZBGufY/NI6a9yPanIa4X3FSh5Ock8oU8sIgO1uydG
         Qx686iQHKMRwmRstuqK2nctfpVZ9KzJoyvxKBwu2dOlc9uFnTBiNVS/YZ3FhXjUBeRQ5
         cSGYcY2nVUVp8nZJ8gHkxC7s19viGpb5AozHz9mrF0hDEAonPBZP2YkxaKN2OG9Yvm57
         k8HrvNyrKa72sxg4WQKUq7gD8yh3cCNZXHAa8/XKWA9oI4n8xGiM9enLaoTZ7r5C9bLE
         q24g==
X-Gm-Message-State: AOJu0Yz4OGWze8X0tpAQnY77pTxan+/F3USx3IZmSFIWG4nMdHbIhDAa
	nT+mC/6/4Uwr8obzjvNnyz8=
X-Google-Smtp-Source: AGHT+IEkQI5px0iu6ruJkeOBFxb/xSiL2tQg52IlSMw0lrfm0+UNfc0pJxYgMe60V7rd4gPBrzkFDA==
X-Received: by 2002:a17:906:b11a:b0:a02:54fa:4f31 with SMTP id u26-20020a170906b11a00b00a0254fa4f31mr3024766ejy.59.1700732230721;
        Thu, 23 Nov 2023 01:37:10 -0800 (PST)
Received: from [192.168.50.250] (c-x599688ac.customers.hiper-net.dk. [89.150.136.172])
        by smtp.gmail.com with ESMTPSA id ch5-20020a170906c2c500b009e656ce2930sm550739ejb.60.2023.11.23.01.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:37:10 -0800 (PST)
Message-ID: <91ad817652ccdb703e8c1ccc4db3756f0512ad0b.camel@gmail.com>
Subject: Re: [PATCH v2 10/15] media: intel/ipu6: add input system driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Thu, 23 Nov 2023 10:37:08 +0100
In-Reply-To: <20231024112924.3934228-11-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-11-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgQmluZ2J1LAoKRm9yIHNvbWUgcmVhc29uIG15IG1haWwgY2xpZW50IGRlY2lkZWQgdG8gYWRk
IGRvdWJsZSA+ID4gYmVsb3cuIEhvcGUgaXQKaXMgbm90IHRvbyBjb25mdXNpbmcuCgpPbiBUdWUs
IDIwMjMtMTAtMjQgYXQgMTk6MjkgKzA4MDAsIGJpbmdidS5jYW9AaW50ZWwuY29tIHdyb3RlOgo+
ID4gRnJvbTogQmluZ2J1IENhbyA8YmluZ2J1LmNhb0BpbnRlbC5jb20+Cj4gPiAKPiA+IElucHV0
IHN5c3RlbSBkcml2ZXIgZG8gYmFzaWMgaXN5cyBoYXJkd2FyZSBzZXR1cCBhbmQgaXJxIGhhbmRs
aW5nCj4gPiBhbmQgd29yayB3aXRoIGZ3bm9kZSBhbmQgdjRsMiB0byByZWdpc3RlciB0aGUgSVNZ
UyB2NGwyIGRldmljZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJpbmdidSBDYW8gPGJpbmdi
dS5jYW9AaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29l
ZGVAcmVkaGF0LmNvbT4KPiA+IFJlcG9ydGVkLWJ5OiBDbGF1cyBTdG92Z2FhcmQgPGNsYXVzLnN0
b3ZnYWFyZEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwv
aXB1Ni9pcHU2LWlzeXMuYyB8IDEzNDUgPgo+ID4gKysrKysrKysrKysrKysrKysrKysrKwo+ID4g
wqBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy5oIHzCoCAyMDEgKysrKwo+
ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDE1NDYgaW5zZXJ0aW9ucygrKQo+ID4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMuYwo+ID4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMu
aAo+ID4gCi4uLgo+ID4gK3N0YXRpYyBpbnQgaXN5c19yZWdpc3Rlcl92aWRlb19kZXZpY2VzKHN0
cnVjdCBpcHU2X2lzeXMgKmlzeXMpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgdW5zaWduZWQg
aW50IGk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDC
oMKgZm9yIChpID0gMDsgaSA8IE5SX09GX1ZJREVPX0RFVklDRTsgaSsrKSB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc25wcmludGYoaXN5cy0+YXZbaV0udmRldi5uYW1lLCA+
IHNpemVvZihpc3lzLQo+ID4gPmF2W2ldLnZkZXYubmFtZSksCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJUFU2X0lTWVNfRU5USVRZX1BSRUZJWCAi
IElTWVMgQ2FwdHVyZQo+ID4gJXUiLCA+IGkpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlzeXMtPmF2W2ldLmlzeXMgPSBpc3lzOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlzeXMtPmF2W2ldLmFxLmJ1Zl9wcmVwYXJlID0gaXB1Nl9pc3lzX2J1Zl9wcmVw
YXJlOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlzeXMtPmF2W2ldLmFxLmZp
bGxfZnJhbWVfYnVmX3NldCA9Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlwdTZfaXN5c19idWZfdG9fZndfZnJhbWVfYnVmX3BpbjsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpc3lzLT5hdltpXS5hcS5saW5rX2ZtdF92YWxpZGF0
ZSA9ID4KPiA+IGlwdTZfaXN5c19saW5rX2ZtdF92YWxpZGF0ZTsKClRoZXNlIDMgZnVuY3Rpb24g
cG9pbnRlcnMgYXJlIGFsd2F5cyBzZXQgdG8gdGhlIHNhbWUgdmFsdWUsIGlzIHRoZXJlCmFueSBw
b2ludCBpbiB0aGF0LCBvciBjb3VsZCB0aGV5IGJlIGNhbGxlZCBkaXJlY3RseT8KCQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlzeXMtPmF2W2ldLmFxLnZicS5idWZfc3RydWN0
X3NpemUgPQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzaXplb2Yoc3RydWN0IGlwdTZfaXN5c192aWRlb19idWZmZXIpOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlzeXMtPmF2W2ldLnBmbXQgPSAmaXB1Nl9pc3lzX3BmbXRzWzBd
Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IGlwdTZfaXN5
c192aWRlb19pbml0KCZpc3lzLT5hdltpXSk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKHJldCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZ290byBmYWlsOwo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gKwo+ID4gK8KgwqDC
oMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiArCj4gPiArZmFpbDoKPiA+ICvCoMKgwqDCoMKgwqDCoHdo
aWxlIChpLS0pCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaXB1Nl9pc3lzX3Zp
ZGVvX2NsZWFudXAoJmlzeXMtPmF2W2ldKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVy
biByZXQ7Cj4gPiArfQoKLi4uCgo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJlc3AtPmVycm9yX2lu
Zm8uZXJyb3IgPT0gPgo+ID4gSVBVNl9GV19JU1lTX0VSUk9SX1NUUkVBTV9JTl9TVVNQRU5TSU9O
KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFN1c3BlbnNpb24gaXMga2lu
ZCBvZiBzcGVjaWFsIGNhc2U6IG5vdCBlbm91Z2ggPgo+ID4gYnVmZmVycyAqLwo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldl9kYmcoJmFkZXYtPmF1eGRldi5kZXYsCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJGVyBlcnJvciBy
ZXNwICUwMmQgJXMsIHN0cmVhbSAldSwgZXJyb3IgPgo+ID4gU1VTUEVOU0lPTiwgZGV0YWlscyAl
ZCwgdGltZXN0YW1wIDB4JTE2LjE2bGx4LCBwaW4gJWRcbiIsCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlc3AtPnR5cGUsCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZ3X21zZ1tyZXNwX3R5cGVfdG9f
aW5kZXgocmVzcC0+dHlwZSldLm1zZywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmVzcC0+c3RyZWFtX2hhbmRsZSwKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVzcC0+ZXJyb3JfaW5mby5lcnJvcl9k
ZXRhaWxzLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBmd19tc2dbcmVzcF90eXBlX3RvX2luZGV4KHJlc3AtCj4gPiA+dHlwZSldLnZhbGlkXz4gdHMg
Pwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0cyA6
IDAsIHJlc3AtPnBpbl9pZCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmIChyZXNwLT5lcnJv
cl9pbmZvLmVycm9yKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldl9kYmco
JmFkZXYtPmF1eGRldi5kZXYsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCJGVyBlcnJvciByZXNwICUwMmQgJXMsIHN0cmVhbSAldSwgZXJyb3IKPiA+
ICVkLCA+IGRldGFpbHMgJWQsIHRpbWVzdGFtcCAweCUxNi4xNmxseCwgcGluICVkXG4iLAo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXNwLT50eXBl
LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmd19t
c2dbcmVzcF90eXBlX3RvX2luZGV4KHJlc3AtPnR5cGUpXS5tc2csCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlc3AtPnN0cmVhbV9oYW5kbGUsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlc3AtPmVy
cm9yX2luZm8uZXJyb3IsID4gcmVzcC0KPiA+ID5lcnJvcl9pbmZvLmVycm9yX2RldGFpbHMsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZ3X21zZ1ty
ZXNwX3R5cGVfdG9faW5kZXgocmVzcC0KPiA+ID50eXBlKV0udmFsaWRfPiB0cyA/Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRzIDogMCwgcmVzcC0+
cGluX2lkKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGVsc2UKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBkZXZfZGJnKCZhZGV2LT5hdXhkZXYuZGV2LAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiRlcgcmVzcCAlMDJkICVzLCBzdHJlYW0g
JXUsIHRpbWVzdGFtcCA+Cj4gPiAweCUxNi4xNmxseCwgcGluICVkXG4iLAo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXNwLT50eXBlLAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmd19tc2dbcmVzcF90
eXBlX3RvX2luZGV4KHJlc3AtPnR5cGUpXS5tc2csCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlc3AtPnN0cmVhbV9oYW5kbGUsCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZ3X21zZ1tyZXNwX3R5cGVf
dG9faW5kZXgocmVzcC0KPiA+ID50eXBlKV0udmFsaWRfPiB0cyA/Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRzIDogMCwgcmVzcC0+cGluX2lkKTsK
CmZ3X21zZ1tyZXNwX3R5cGVfdG9faW5kZXgocmVzcC0+dHlwZSldIGlzIGR1cGxpY2F0ZWQgNiB0
aW1lcyBhYm92ZS4gSXQKd291bGQgYmUgYSBsb3QgY2xlYW5lciBpZiB5b3UgZGlkIHRoZSBsb29r
dXAgb25jZSBiZWZvcmUgdGhlIGlmL2Vsc2UKaWYvZWxzZSBibG9jay4KCj4gCi9BbmRyZWFzCg==


