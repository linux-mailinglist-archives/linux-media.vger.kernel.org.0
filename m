Return-Path: <linux-media+bounces-1801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134F8084AE
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 10:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 120FC28310B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEDC34548;
	Thu,  7 Dec 2023 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EARMDPjs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F04D7E
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 01:28:56 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1e2f34467aso60682066b.2
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701941335; x=1702546135; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mUT9cGpC9+bJmoBZFTm5uJlwy/OkklI/c91erK2SOYk=;
        b=EARMDPjssj2y+apHYrzw3Pyt/xqthnRiyCZd0MMHAPY/3mi4ohgv+OoSa3Ah5NF0k1
         4aZYaBI0eekRFCxmOPM6gL8j5MhIa79S+kKXe7jnSY6K6FnS6FcJx6nPhu4U0mU3LgXB
         4RAEZF1NYsU/KnYeiP606xOOgI9OBxchgq0tjhB3LHwnFWkwj4WoH6YOe49Sv8d0/s/M
         z6PVD8a743qla7tZm1GUn5MYV2UVea81JwwCYz2OAuwh+e9GQ0RUH4b/02Xh+5kRV4Mx
         DMlzrtRuGKHlZCK7pezddJdgUYOzMaa6HGhjheTEuCsNhQE/a8NQYrFn2omMhRYqoiIY
         XWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701941335; x=1702546135;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUT9cGpC9+bJmoBZFTm5uJlwy/OkklI/c91erK2SOYk=;
        b=NDC3c2sTZGUuuYWJAxHN7vuI1KgZ1K4pBX6u9KamkmFtSDFYJ7F/i5HEUc1WebAx9S
         PNviQG7kcx9USZ8Lq0C1EwfO8QUWXz0YRVyPbdIBURta2orZCR6eveJ0O2hOsWYi8fsx
         q5ozefESjHBvvz9xGbxfUUTNpWGMyMykGL4OCnHx4IKza4KtEEK26dn+EPcm7Vcve9vu
         52xhViC2Q2kK3kb3019cToYOghQUE03fT9MkrqYfWZL7y3Dx04uBrNWryhN7tSXfkzeA
         2CtxtIG6xaFGC4/ivzlJCcUdUa+ps6+mefjaPbAFcweb2FvvC4pHxvtr0uKRoqNbvplw
         M9Lw==
X-Gm-Message-State: AOJu0YyCfcRByXw2D/dtHJGn0ZaCpUxdrbchyiSeu8S9bdXafGV1jlsV
	/dYizHRYauuP1Fv0sDtV05Q=
X-Google-Smtp-Source: AGHT+IGrtGMs6fTRPyYf/uoXeTkKyGUtbGF7Ol2yqmUaT5HF6TDFKi+33bCBBc3Fg02J8FInQdzFzA==
X-Received: by 2002:a17:906:14:b0:a1d:da25:1ad2 with SMTP id 20-20020a170906001400b00a1dda251ad2mr1253517eja.43.1701941334961;
        Thu, 07 Dec 2023 01:28:54 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090607cc00b00a1ddb5a2f7esm579103ejc.60.2023.12.07.01.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 01:28:54 -0800 (PST)
Message-ID: <3b725902325446e7d12bfe087e459cdb475c96e2.camel@gmail.com>
Subject: Re: [PATCH 11/15] media: intel/ipu6: input system video capture
 nodes
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
 senozhatsky@chromium.org,  andriy.shevchenko@linux.intel.com,
 hdegoede@redhat.com,  tomi.valkeinen@ideasonboard.com,
 bingbu.cao@linux.intel.com,  tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Thu, 07 Dec 2023 10:28:53 +0100
In-Reply-To: <20230727071558.1148653-12-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
	 <20230727071558.1148653-12-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGksCgpPbiBUaHUsIDIwMjMtMDctMjcgYXQgMTU6MTUgKzA4MDAsIGJpbmdidS5jYW9AaW50ZWwu
Y29tIHdyb3RlOgo+IEZyb206IEJpbmdidSBDYW8gPGJpbmdidS5jYW9AaW50ZWwuY29tPgo+IAo+
IFJlZ2lzdGVyIHY0bDIgdmlkZW8gZGV2aWNlIGFuZCBzZXR1cCB0aGUgdmIyIHF1ZXVlIHRvCj4g
c3VwcG9ydCBiYXNpYyB2aWRlbyBjYXB0dXJlLiBWaWRlbyBzdHJlYW1pbmcgY2FsbGJhY2sKPiB3
aWxsIHRyaWdnZXIgdGhlIGlucHV0IHN5c3RlbSBkcml2ZXIgdG8gY29uc3RydWN0IGEKPiBpbnB1
dCBzeXN0ZW0gc3RyZWFtIGNvbmZpZ3VyYXRpb24gZm9yIGZpcm13YXJlIGJhc2VkIG9uCj4gZGF0
YSB0eXBlIGFuZCBzdHJlYW0gSUQgYW5kIHRoZW4gcXVldWUgYnVmZmVycyB0byBmaXJtd2FyZQo+
IHRvIGRvIGNhcHR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmluZ2J1IENhbyA8YmluZ2J1LmNh
b0BpbnRlbC5jb20+Cj4gLS0tCgouLi4KCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwv
aXB1Ni9pcHU2LWlzeXMtdmlkZW8uYwouLi4KPiArdm9pZCBpcHU2X2lzeXNfcHV0X3N0cmVhbShz
dHJ1Y3QgaXB1Nl9pc3lzX3N0cmVhbSAqc3RyZWFtKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnN0cmVhbS0+aXN5cy0+YWRldi0+YXV4ZGV2LmRldjsKCnN0cmVh
bSBjYW4gYmUgTlVMTCBoZXJlIChzZWUgYmVsb3cpLgoKPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25l
ZCBpbnQgaTsKPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqBpZiAoIXN0cmVhbSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBkZXZfZXJyKGRldiwgIm5vIGF2YWlsYWJsZSBzdHJlYW1cbiIpOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gK8KgwqDCoMKgwqDCoMKgfQoKWW91IGNhbiBkbwoK
ICAgICAgICAgIGRldiA9ICZzdHJlYW0tPmlzeXMtPmFkZXYtPmF1eGRldi5kZXY7CgpoZXJlIGlu
c3RlYWQuCgo+ICsKPiArwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaXJxc2F2ZSgmc3RyZWFtLT5p
c3lzLT5zdHJlYW1zX2xvY2ssIGZsYWdzKTsKPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBp
IDwgSVBVNl9JU1lTX01BWF9TVFJFQU1TOyBpKyspIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKCZzdHJlYW0tPmlzeXMtPnN0cmVhbXNbaV0gPT0gc3RyZWFtKSB7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoc3RyZWFtLT5p
c3lzLT5zdHJlYW1zX3JlZl9jb3VudFtpXSA+IDApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RyZWFtLT5pc3lzLT5zdHJl
YW1zX3JlZl9jb3VudFtpXS0tOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZWxzZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldl93YXJuKGRldiwgImludmFsaWQgc3RyZWFtICVk
XG4iLAo+IGkpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDC
oMKgwqDCoMKgfQo+ICvCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnN0cmVh
bS0+aXN5cy0+c3RyZWFtc19sb2NrLCBmbGFncyk7Cj4gK30KCi9BbmRyZWFzCg==


