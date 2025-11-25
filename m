Return-Path: <linux-media+bounces-47713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 197ECC86265
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 18:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EF183B9D8E
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 17:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073F333121D;
	Tue, 25 Nov 2025 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoRyGeiL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4C32ABCF
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 17:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764090216; cv=none; b=j6WsM5rATqm/hOmsIzCr6Jhgvkf6PFw5yIhdikPKLPUzcb5Zbha/ID551uoikOzc+5/swaRB0RX4epIH1pN744ogZtygcmDJupbEx8pK8F0Q//1+pu6J00wq6SzzJJ0LIVB1oIUt4UON8nkNYF8M/1VP8pQZHr2NfWVZLW4Jorc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764090216; c=relaxed/simple;
	bh=Fhf2ZYznp9H3fMUTBKs/+6rcz9vbeI4dOUYWmUa4h+E=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To; b=ETBg4rM+TfQ7CuYWXh+U3/8UM642qrcMyeQiu9EJtJUGlY4pA4udiXIjJZwx+emqweWIygS9THpRmHg/w89plQIW7uk71C/8xbqb5n4GqdXW0ndDUBvFKuPko1hHnBQF8ENe/gDjKxG/R23HKVVm4q4r6KwzKNXFDaDgFc1rgp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoRyGeiL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343806688c5so4889785a91.0
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 09:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764090214; x=1764695014; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:subject:references:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fhf2ZYznp9H3fMUTBKs/+6rcz9vbeI4dOUYWmUa4h+E=;
        b=KoRyGeiLmIYZAtkb2rSS1ZHmTamr2qKC2/G0ZgDwZo7fcpzzirGxH2UqfHvo5g8Eb3
         FI3uJeHhhfJoef9iiAv0rZm4GUDaLjulJbGTN6fnn7EyG4vVtXIgawvsAKd/BJRHBb80
         P5ToX7siBtsrILCCJ3LtJiMHNuh6K2SbCdEVJQi5qgWt6BqTgeQitHgkYYDZIIilnzDd
         jB3XdAwnTV/KPaDzUy/EkvMBt9IeZWjPyKzSZ76R7/yaOSgTiRD1nhmkJ0Nk6qeo3Cus
         ph5JWEtga7ykC3fJfXXXkZvUwSsykD7e6AsDKEK8AS5fDZDGY1SxshfIC+a2LVQBuz4h
         3Clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764090214; x=1764695014;
        h=in-reply-to:from:content-language:subject:references:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fhf2ZYznp9H3fMUTBKs/+6rcz9vbeI4dOUYWmUa4h+E=;
        b=hhruyJ8otk1baCpE2p3Sw0ztQqUejnflD8kEvQcvY1FAWb+cifJ1DxByZBDuPn6uOv
         dFNWelB8P8lBgrZVkepXZ5RrWMbQ8w9tJ5CikJDi4O2g0n8b1mawBD7Uo2gHpwl8ulU4
         RfzgQZhVXKORg14Xt0YfCh2rRPZogDUmzjPYJNC3UlsO2lOqBclDiLx4AGskKDPFvIus
         0R7Ie5pSO8DHyvPkhOs9pPUhkuqhg642nUsWCVWOIZBwRH2gBUmGo9aPPUgL6Yd13wlx
         +fqrWGQaNuz2M0jZK9J62rm2OsY6DQ1Cho9b8rA1/AHsd83DCYWesOIpSYWzkG5E4elj
         1nYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCpAdy/Ejw9vg/jCKeU5BhJxVRNuPR6/PTMVlBmy99ZsiheAGBcgSmw60ny32RimT8Yf4hVRQ8RM2JUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDb7mLdBrjL5GVUJMHpcqGaihOOFkEdma9/MY4/OA3FtkrCluw
	3EOwxydBqUXfRBj/7nchn/7BjAl6G/Qdi8Dzg9Pu7aOZKgjJRLZN34TF
X-Gm-Gg: ASbGncsEOzWF29CLOq9aZis+7nNLr1MiG+yxegINgJ6dWdkdO0yVPpJ/a1GFZCzoopZ
	tEZWlGYyYt89LNjRew8f7RQZw2hSGNoEeoa9sh4UcaPwZBdNo0zliVUHoQ/3dXi/4a/ZYcsJR/r
	c/UqZxb6z3rytTjHJJzD6e7qpmqNNeGCKCVm0YqoX4Ia0UbbeccssFEufr/M8PcXmjQPEgIBVp/
	tRIrTPOlGT+Fv23qc0oWucY6+mrEVKmmhD7up1V3/v0mu15Wj9WtoPdeRAY53S4gOD7e2GAOilU
	GOK0VZ2SAdmAVrIECBD+CmmBArhcFfzRdzoSzJYzVkje4sqvdf53FnTiVALA8nsZFP86DzlXz5s
	lmgvUwnlLE8HoWh0wLRFFwc6HLhlnrkGZs0LmEw/42PGigpJyHXtZ6XJqhDgcQzVsxL7rmaPLqh
	HLt8JtROotlcxUH71XobcTBzxYxZvZ0aqb+/o16DF57ScKwz09+lGXh/w=
X-Google-Smtp-Source: AGHT+IF1tf/td6rrizI0MUWEf8zEm4InSrjdNW0xyU/miELauh4p8/pOKyLcL8ETYeSD2ICQFFUBNw==
X-Received: by 2002:a17:90b:2547:b0:341:88c9:ca62 with SMTP id 98e67ed59e1d1-3475ed6a904mr3762436a91.31.1764090213570;
        Tue, 25 Nov 2025 09:03:33 -0800 (PST)
Received: from ?IPV6:2405:201:31:d869:c163:7f74:bed9:a2d1? ([2405:201:31:d869:c163:7f74:bed9:a2d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed789f19sm18616052b3a.28.2025.11.25.09.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 09:03:33 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------3cVH0SUPDWbfa9aZvMGoREZI"
Message-ID: <ca9d89ca-4da9-4f2b-bd92-3791cae54911@gmail.com>
Date: Tue, 25 Nov 2025 22:33:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <692560ec.a70a0220.2ea503.0087.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] memory leak in
 v4l2_ctrl_handler_init_class (2)
Content-Language: en-US
From: shaurya <ssranevjti@gmail.com>
In-Reply-To: <692560ec.a70a0220.2ea503.0087.GAE@google.com>

This is a multi-part message in MIME format.
--------------3cVH0SUPDWbfa9aZvMGoREZI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#syz test:
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

--------------3cVH0SUPDWbfa9aZvMGoREZI
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-radio-keene-fix-memory-leak-in-probe.patch"
Content-Disposition: attachment;
 filename="0001-media-radio-keene-fix-memory-leak-in-probe.patch"
Content-Transfer-Encoding: base64

RnJvbSA5M2U2YTJmMGIzOWUyNzZkYjIxODExNjdmNzk3ZTIzNGZhODAxNGEyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTaGF1cnlhIFJhbmUgPHNzcmFuZV9iMjNAZWUudmp0
aS5hYy5pbj4KRGF0ZTogVHVlLCAyNSBOb3YgMjAyNSAyMjoyNDoyOSArMDUzMApTdWJqZWN0
OiBbUEFUQ0hdIG1lZGlhOiByYWRpby1rZWVuZTogZml4IG1lbW9yeSBsZWFrIGluIHByb2Jl
CgpUaGUgdXNiX2tlZW5lX3Byb2JlKCkgZnVuY3Rpb24gYWxsb2NhdGVzIG1lbW9yeSBmb3Ig
dGhlIHY0bDIgY29udHJvbApoYW5kbGVyIHVzaW5nIHY0bDJfY3RybF9oYW5kbGVyX2luaXQo
KS4gSG93ZXZlciwgaWYgdGhlIHByb2JlIGZhaWxzCmxhdGVyIChlLmcuIGluIHY0bDJfZGV2
aWNlX3JlZ2lzdGVyKCkgb3IgdmlkZW9fcmVnaXN0ZXJfZGV2aWNlKCkpLAp0aGlzIG1lbW9y
eSBpcyBuZXZlciBmcmVlZCwgbGVhZGluZyB0byBhIGxlYWsuCgpGaXggdGhpcyBieSBhZGRp
bmcgdjRsMl9jdHJsX2hhbmRsZXJfZnJlZSgpIHRvIHRoZSBlcnJvciBwYXRoLgoKUmVwb3J0
ZWQtYnk6IHN5emJvdCthNDFiNzNkY2UyMzk2MmE3NGM3MkBzeXprYWxsZXIuYXBwc3BvdG1h
aWwuY29tCkNsb3NlczogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlk
PWE0MWI3M2RjZTIzOTYyYTc0YzcyCkZpeGVzOiAxYmYyMGMzYTBjNjEgKCJbbWVkaWFdIHJh
ZGlvLWtlZW5lOiBhZGQgYSBkcml2ZXIgZm9yIHRoZSBLZWVuZSBGTSBUcmFuc21pdHRlciIp
ClNpZ25lZC1vZmYtYnk6IFNoYXVyeWEgUmFuZSA8c3NyYW5lX2IyM0BlZS52anRpLmFjLmlu
PgotLS0KIGRyaXZlcnMvbWVkaWEvcmFkaW8vcmFkaW8ta2VlbmUuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcmFkaW8vcmFkaW8ta2VlbmUuYyBiL2RyaXZlcnMvbWVkaWEvcmFk
aW8vcmFkaW8ta2VlbmUuYwppbmRleCBmM2I1N2YwY2IxZWMuLmMxMzMzMDVmZDAxOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9yYWRpby9yYWRpby1rZWVuZS5jCisrKyBiL2RyaXZl
cnMvbWVkaWEvcmFkaW8vcmFkaW8ta2VlbmUuYwpAQCAtMzM4LDcgKzMzOCw2IEBAIHN0YXRp
YyBpbnQgdXNiX2tlZW5lX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAogCWlm
IChoZGwtPmVycm9yKSB7CiAJCXJldHZhbCA9IGhkbC0+ZXJyb3I7CiAKLQkJdjRsMl9jdHJs
X2hhbmRsZXJfZnJlZShoZGwpOwogCQlnb3RvIGVycl92NGwyOwogCX0KIAlyZXR2YWwgPSB2
NGwyX2RldmljZV9yZWdpc3RlcigmaW50Zi0+ZGV2LCAmcmFkaW8tPnY0bDJfZGV2KTsKQEAg
LTM4NCw2ICszODMsNyBAQCBzdGF0aWMgaW50IHVzYl9rZWVuZV9wcm9iZShzdHJ1Y3QgdXNi
X2ludGVyZmFjZSAqaW50ZiwKIGVycl92ZGV2OgogCXY0bDJfZGV2aWNlX3VucmVnaXN0ZXIo
JnJhZGlvLT52NGwyX2Rldik7CiBlcnJfdjRsMjoKKwl2NGwyX2N0cmxfaGFuZGxlcl9mcmVl
KCZyYWRpby0+aGRsKTsKIAlrZnJlZShyYWRpby0+YnVmZmVyKTsKIAlrZnJlZShyYWRpbyk7
CiBlcnI6Ci0tIAoyLjM0LjEKCg==

--------------3cVH0SUPDWbfa9aZvMGoREZI--

