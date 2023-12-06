Return-Path: <linux-media+bounces-1759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D5807313
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 15:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9486281E78
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 14:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124923EA71;
	Wed,  6 Dec 2023 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvsvElPb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85DB10E3
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 06:53:05 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5482df11e73so8956866a12.0
        for <linux-media@vger.kernel.org>; Wed, 06 Dec 2023 06:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701874384; x=1702479184; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g8u9haPXN3CP2m9U2liqqoyZ567JwMohjrOCaZmn3hE=;
        b=TvsvElPb//aAODmPsaUH+pO3EMp9WglxFf43eXbmaEYDV0lb6FpwZolGweNWUNNnxt
         6A5rrNNY8WszD0o+A+nYoS7UfWjzq56U9r7JWCQKce2ZphYdXotg1Jj/mBxyy7QnBqf2
         UfVJ+tVyldMVfYOqz9YuGFap2XEV4alGvhKt2dqt3ycLlAUehtRTAhHI3q9JatEM5GdG
         YIRe4wQPHg9zyxCQLK6GxxgSMH22/iVs87xqfQO0J3pnbjc9aOskpUWh8zWCr1tnwzO5
         ngflmwoy2xBNWVq+jGDW6Dh3p4TiOBg+iCPBqpusaVPMXwDPf6AXXgmtUm7FJCagPBP+
         tXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701874384; x=1702479184;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8u9haPXN3CP2m9U2liqqoyZ567JwMohjrOCaZmn3hE=;
        b=wgcEWLRtVPa8hApmmHyBUpeCWhyAdvofEf5DQsQMAU9MM70Kt3acikkxZ5uMTGsJQO
         6+4SHe9uI/13kjOUkkDJg6Hp3Qw7+lYffHwlO7Y5US6OqiwiiJU1TKNF5W20W+B9pakC
         0pTpH+mQd1OSZ63SYkmcNFCST1hEobDx02X0aQ9olKVt/SZSQmVB24H+gDke5f+ZjWZz
         TJ4thscBT8ZaBYWq1wT6+qufaw7UWCuIsOtzRyDEbsM6pK5LoteCsvZU6+3HUr5ZWCqf
         s6hxdYDm8Vw2OWgJbslUNFIZm52vYpv9cpetwB0vFYnDmTct4qFVgbzvruJg30mv/pYP
         cMIQ==
X-Gm-Message-State: AOJu0YwNa8ZB+hHwIIz0ONQ8YzRM0xUGqJ0Hn299CAHMtKE3HnN2H1Jw
	52yAJBY6xuQyrbZMBu0tIzs=
X-Google-Smtp-Source: AGHT+IHvWBgp1oT5a6hSaeu5vJ5Xpv9EKa4LUzPVdNorqVFWlYC5FpTjKaUGtaqS5ZXqSCAvCFmWDw==
X-Received: by 2002:a50:a691:0:b0:54c:67c0:8321 with SMTP id e17-20020a50a691000000b0054c67c08321mr558077edc.65.1701874383577;
        Wed, 06 Dec 2023 06:53:03 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id b7-20020aa7dc07000000b0054c50fb11cesm59423edu.50.2023.12.06.06.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:53:02 -0800 (PST)
Message-ID: <accabcd74cfd4017758965fd6ed6453018e5fbd8.camel@gmail.com>
Subject: Re: [PATCH v2 05/15] media: intel/ipu6: add IPU6 DMA mapping API
 and MMU table
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Wed, 06 Dec 2023 15:53:01 +0100
In-Reply-To: <20231024112924.3934228-6-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-6-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGksCgpPbiBUdWUsIDIwMjMtMTAtMjQgYXQgMTk6MjkgKzA4MDAsIGJpbmdidS5jYW9AaW50ZWwu
Y29tIHdyb3RlOgo+IEZyb206IEJpbmdidSBDYW8gPGJpbmdidS5jYW9AaW50ZWwuY29tPgo+IAo+
IGhlIEludGVsIElQVTYgaGFzIGFuIGludGVybmFsIG1pY3JvY29udHJvbGxlciAoc2NhbGFyIHBy
b2Nlc3NvciwgU1ApCj4gd2hpY2gKPiBpcyB1c2VkIHRvIGV4ZWN1dGUgdGhlIGZpcm13YXJlLiBU
aGUgU1AgY2FuIGFjY2VzcyBJUFUgaW50ZXJuYWwKPiBtZW1vcnkgYW5kCj4gbWFwIHN5c3RlbSBE
UkFNIHRvIGl0cyBhbiBpbnRlcm5hbCAzMi1iaXQgdmlydHVhbCBhZGRyZXNzIHNwYWNlLgo+IAo+
IFRoaXMgcGF0Y2ggYWRkcyBhIGRyaXZlciBmb3IgdGhlIElQVSBNTVUgYW5kIGEgRE1BIG1hcHBp
bmcKPiBpbXBsZW1lbnRhdGlvbgo+IHVzaW5nIHRoZSBpbnRlcm5hbCBNTVUuIFRoZSBzeXN0ZW0g
SU9NTVUgbWF5IGJlIHVzZWQgYmVzaWRlcyB0aGUgSVBVCj4gTU1VLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEJpbmdidSBDYW8gPGJpbmdidS5jYW9AaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9t
ZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWRtYS5jIHwgNDkxICsrKysrKysrKysrKysrCj4gwqBk
cml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtZG1hLmggfMKgIDIwICsKPiDCoGRyaXZl
cnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1tbXUuYyB8IDgyOAo+ICsrKysrKysrKysrKysr
KysrKysrKysrKwo+IMKgZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LW1tdS5oIHzC
oCA2NyArKwo+IMKgNCBmaWxlcyBjaGFuZ2VkLCAxNDA2IGluc2VydGlvbnMoKykKPiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtZG1hLmMKPiDC
oGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtZG1h
LmgKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lw
dTYtbW11LmMKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9p
cHU2L2lwdTYtbW11LmgKLi4uCgo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYv
aXB1Ni1tbXUuYwouLi4KPiArc3RhdGljIHN0cnVjdCBpcHU2X21tdV9pbmZvICppcHU2X21tdV9h
bGxvYyhzdHJ1Y3QgaXB1Nl9kZXZpY2UgKmlzcCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBpcHU2X21tdV9pbmZvICptbXVfaW5mbzsKPiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+ICsK
PiArwqDCoMKgwqDCoMKgwqBtbXVfaW5mbyA9IGt6YWxsb2Moc2l6ZW9mKCptbXVfaW5mbyksIEdG
UF9LRVJORUwpOwo+ICvCoMKgwqDCoMKgwqDCoGlmICghbW11X2luZm8pCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBOVUxMOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBtbXVf
aW5mby0+YXBlcnR1cmVfc3RhcnQgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoG1tdV9pbmZvLT5hcGVy
dHVyZV9lbmQgPSBETUFfQklUX01BU0soaXNwLT5zZWN1cmVfbW9kZSA/Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgSVBVNl9NTVVfQUREUl9CSVRTIDoKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoAo+IElQVTZfTU1VX0FERFJfQklUU19OT05fU0VDVVJFKTsKPiAr
wqDCoMKgwqDCoMKgwqBtbXVfaW5mby0+cGdzaXplX2JpdG1hcCA9IFNaXzRLOwo+ICvCoMKgwqDC
oMKgwqDCoG1tdV9pbmZvLT5kZXYgPSAmaXNwLT5wZGV2LT5kZXY7Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoHJldCA9IGdldF9kdW1teV9wYWdlKG1tdV9pbmZvKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAo
cmV0KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9mcmVlX2luZm87
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IGFsbG9jX2R1bW15X2wyX3B0KG1tdV9pbmZvKTsK
PiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBnb3RvIGVycl9mcmVlX2R1bW15X3BhZ2U7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG1tdV9pbmZv
LT5sMl9wdHMgPSB2emFsbG9jKElTUF9MMlBUX1BURVMgKiBzaXplb2YoKm1tdV9pbmZvLQo+ID5s
Ml9wdHMpKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIW1tdV9pbmZvLT5sMl9wdHMpCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX2ZyZWVfZHVtbXlfbDJfcHQ7Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDCoMKgwqDCoMKgICogV2UgYWx3YXlzIG1hcCB0aGUg
TDEgcGFnZSB0YWJsZSAoYSBzaW5nbGUgcGFnZSBhcyB3ZWxsIGFzCj4gK8KgwqDCoMKgwqDCoMKg
ICogdGhlIEwyIHBhZ2UgdGFibGVzKS4KPiArwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDC
oMKgwqBtbXVfaW5mby0+bDFfcHQgPSBhbGxvY19sMV9wdChtbXVfaW5mbyk7Cj4gK8KgwqDCoMKg
wqDCoMKgaWYgKCFtbXVfaW5mby0+bDFfcHQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGdvdG8gZXJyX2ZyZWVfbDJfcHRzOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tf
aW5pdCgmbW11X2luZm8tPmxvY2spOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBkZXZfZGJnKG1tdV9p
bmZvLT5kZXYsICJkb21haW4gaW5pdGlhbGlzZWRcbiIpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gbW11X2luZm87Cj4gKwo+ICtlcnJfZnJlZV9sMl9wdHM6Cj4gK8KgwqDCoMKgwqDCoMKg
dmZyZWUobW11X2luZm8tPmwyX3B0cyk7Cj4gK2Vycl9mcmVlX2R1bW15X2wyX3B0Ogo+ICvCoMKg
wqDCoMKgwqDCoGZyZWVfZHVtbXlfbDJfcHQobW11X2luZm8pOwo+ICtlcnJfZnJlZV9kdW1teV9w
YWdlOgo+ICvCoMKgwqDCoMKgwqDCoGZyZWVfZHVtbXlfcGFnZShtbXVfaW5mbyk7Cj4gK2Vycl9m
cmVlX2luZm86Cj4gK8KgwqDCoMKgwqDCoMKga2ZyZWUobW11X2luZm8pOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqByZXR1cm4gTlVMTDsKPiArfQoKLi4uCgoKPiArc3RhdGljIHZvaWQgaXB1Nl9tbXVf
ZGVzdHJveShzdHJ1Y3QgaXB1Nl9tbXUgKm1tdSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBpcHU2X2RtYV9tYXBwaW5nICpkbWFwID0gbW11LT5kbWFwOwo+ICvCoMKgwqDCoMKgwqDCoHN0
cnVjdCBpcHU2X21tdV9pbmZvICptbXVfaW5mbyA9IGRtYXAtPm1tdV9pbmZvOwo+ICvCoMKgwqDC
oMKgwqDCoHN0cnVjdCBpb3ZhICppb3ZhOwo+ICvCoMKgwqDCoMKgwqDCoHUzMiBsMV9pZHg7Cj4g
Kwo+ICvCoMKgwqDCoMKgwqDCoGlmIChtbXUtPmlvdmFfdHJhc2hfcGFnZSkgewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpb3ZhID0gZmluZF9pb3ZhKCZkbWFwLT5pb3ZhZCwgUEhZ
U19QRk4obW11LQo+ID5pb3ZhX3RyYXNoX3BhZ2UpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKGlvdmEpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoC8qIHVubWFwIGFuZCBmcmVlIHRoZSB0cmFzaCBidWZmZXIgaW92YSAqLwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaXB1Nl9tbXVf
dW5tYXAobW11X2luZm8sIFBGTl9QSFlTKGlvdmEtCj4gPnBmbl9sbyksCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFBGTl9QSFlTKGlvdmFfc2l6ZShpb3ZhKSkpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19mcmVlX2lvdmEoJmRtYXAtPmlvdmFkLCBpb3Zh
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldl9lcnIobW11LT5kZXYsICJ0
cmFzaCBidWZmZXIgaW92YSBub3QKPiBmb3VuZC5cbiIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtbXUtPmlv
dmFfdHJhc2hfcGFnZSA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV91
bm1hcF9wYWdlKG1tdV9pbmZvLT5kZXYsIG1tdS0+cGNpX3RyYXNoX3BhZ2UsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUEFHRV9T
SVpFLCBETUFfQklESVJFQ1RJT05BTCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oG1tdS0+cGNpX3RyYXNoX3BhZ2UgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBfX2ZyZWVfcGFnZShtbXUtPnRyYXNoX3BhZ2UpOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4g
K8KgwqDCoMKgwqDCoMKgZm9yIChsMV9pZHggPSAwOyBsMV9pZHggPCBJU1BfTDFQVF9QVEVTOyBs
MV9pZHgrKykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAobW11X2luZm8t
PmwxX3B0W2wxX2lkeF0gIT0gbW11X2luZm8tCj4gPmR1bW15X2wyX3B0ZXZhbCkgewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX3VubWFwX3Npbmds
ZShtbXVfaW5mby0+ZGV2LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVEJMX1BIWVNfQUREUiht
bXVfaW5mby0KPiA+bDFfcHRbbDFfaWR4XSksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQQUdF
X1NJWkUsCj4gRE1BX0JJRElSRUNUSU9OQUwpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZnJlZV9wYWdlKCh1bnNpZ25lZCBsb25nKW1tdV9pbmZvLQo+
ID5sMl9wdHNbbDFfaWR4XSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiAr
wqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGZyZWVfZHVtbXlfcGFnZShtbXVf
aW5mbyk7Cj4gK8KgwqDCoMKgwqDCoMKgZG1hX3VubWFwX3NpbmdsZShtbXVfaW5mby0+ZGV2LCBU
QkxfUEhZU19BRERSKG1tdV9pbmZvLQo+ID5sMV9wdF9kbWEpLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBBR0VfU0laRSwgRE1BX0JJRElSRUNUSU9O
QUwpOwo+ICvCoMKgwqDCoMKgwqDCoGZyZWVfcGFnZSgodW5zaWduZWQgbG9uZyltbXVfaW5mby0+
ZHVtbXlfbDJfcHQpOwo+ICvCoMKgwqDCoMKgwqDCoGZyZWVfcGFnZSgodW5zaWduZWQgbG9uZylt
bXVfaW5mby0+bDFfcHQpOwo+ICvCoMKgwqDCoMKgwqDCoGtmcmVlKG1tdV9pbmZvKTsKPiArfQoK
bW11X2luZm8tPmwyX3B0cyBpcyBsZWFrZWQgaGVyZS4gSXQgaXMgYWxsb2NhdGVkIGluIGlwdTZf
bW11X2FsbG9jIGFuZApmcmVlZCBpbiB0aGUgZXJyb3IgcGF0aCBvZiB0aGF0IGZ1bmN0aW9uIGFs
b25nIHdpdGggdGhlIG90aGVyIHN0dWZmIHlvdQpmcmVlIGhlcmUsIGJ1dCBub3QgYW55d2hlcmUg
ZWxzZS4KCi9BbmRyZWFzCg==


