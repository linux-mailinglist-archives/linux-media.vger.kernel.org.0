Return-Path: <linux-media+bounces-47716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D77C87015
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 21:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 473B24E8D53
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 20:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D8133BBA0;
	Tue, 25 Nov 2025 20:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZENXJvBD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216D329C58
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 20:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102074; cv=none; b=Ar6fjcPjl0OY5yEU42R7fCiGIwyPupp7yRJPl+dyovj6ygLSL/basAsVYQVB3/Ho5CRFgGjw9p8tviGHtD4P2nUtc58MrCcMdKE8he4pww6IquImb7uSJSbV+eoh47fYPJ2UF9XN5xtbTTsOSbZC6rAwVWKPrij9HG7C96aYCJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102074; c=relaxed/simple;
	bh=4wjxY4sYzggxS4/vzJWqTLnmS32brncjktgX4hPqSQo=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To; b=Sh/W3HCSA0T7+cX+xyjnptg4ddnaFt8ZWdCW8WZL+xfouduATb9uXILtBxtKX1DYyz1upwYaZ9ZGRSfUT0Siy7nnp6f9t5p2ZMzzMjkib+uUYmZhoyy2vf4+tNFQHkuC6rjPbYzIBq/e6P1RlunTRjeiBgZ7XgVArAnYAlyuqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZENXJvBD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-298145fe27eso92903975ad.1
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764102071; x=1764706871; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:subject:references:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wjxY4sYzggxS4/vzJWqTLnmS32brncjktgX4hPqSQo=;
        b=ZENXJvBDRFHz52Eoy2c/3C7f5BSIviisvng/IUBLU53amjQzF5rX+5fpekY4tBF1Tb
         go9kRayw9XIDQmmYgtcj4hEqJNFJJx94owKf0kl5AuEmrycSfqcS2Vg7uE4tr35RI92u
         8NqLSOsw2tk50vC5GFWBGr7Ya9RkViVy6FhFGZzNyWKC9EtGuPkovlWlgZrbZqOXzN3e
         dTahXyQOkrihB7cv/3HMI2jkAYfjF3TikRnV7WkBMw/HpcFeEKOxEfAvHTU/CWrN4E0p
         tZUw4X2W1B9vQXoyqa/Xv0PMD1eja2vCtTu+11FDGD6UeQsPkFk0NqEXylrulWCz6Vot
         1TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764102071; x=1764706871;
        h=in-reply-to:from:content-language:subject:references:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wjxY4sYzggxS4/vzJWqTLnmS32brncjktgX4hPqSQo=;
        b=NOoFH4UOJpqotYykmw/zhjOHOsuwc4OQfFSBE7iRFNfB/SxW6ZhM70zfSi7QBGmCNZ
         /69D3XkZ8upO4rKuFFziA2h2K5l4T/3Fkbsfz/mMPOPhuKMMQYdkkXmHpMiN5MtMzhcD
         Q5vxApuhIt9q+zlhLUAaf+6RV0ccfrDt9WtjHNWrmuJS1oMX28s61fhNCXI1rpqTrjfT
         IpIV8+lH9Z6JrcktlDLTpCvYusBmLC1ge+X5hP6r4+lSawLHUCbcLuQ78e3g71+jZMjj
         ZV+fqWtMsObSzheNBydeFKDvf6oS7oSqHEPd6rQHjWmQWNP2pqyc2FqG+pGEaVo0d6yM
         pbPw==
X-Forwarded-Encrypted: i=1; AJvYcCUU9mI+OqH8L/jtDiyAbOZhZ69PfZc89G4VBH8d5wgFpTuVFizuGGCI05VbaDceIx7PFrUFxqb8sVqFnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXeCQ6kAwYBMqbLf8tDS2sfO5Dq89/bfBH5zU4c+eh9ctajzeE
	kziMG6KIqSxMDqlhI2H1DbT0DX34SCIeRYpisr6aDz7JOZdSkgBJPhmr
X-Gm-Gg: ASbGnctue3Tsu0+KKfg9LRoZmu8BgMSFWVxmg1bmWGU/D/ntMsYL+4+xNPDDAv5KUUP
	3h/GrqeflFoYM4aPdzA2CkJksigFp/eEzl8Rcd+kkb2vDT3hGAhdsU6bw5usYFTGISyXDJR5RXk
	4vJZT2FpwJL4a1LAs+0UYR2h362OKvRRlc+cdqJT+Hw644nFOvMhQzIB1LWmvtUSQ4flBLk6nUH
	rnKXRljklWyn+A7xcaCh90ZPk7juEphfdMEkevguGIsnOQ6t8h+15t6R1mr3YPyO5O6FV85FJEJ
	KUm9/yulfF4vHwJFBCYTq5dA/84a1sjzqP3wKkoKE85R8ieY2D21D+ApitQbcAFOWFFRyUto5sT
	lETRW3qQ6ADwKSocoWU7blANvyeMwgEB4drPzkpQX/4FKE+Ivt7q+WRvpFhaV+NuH6EZdQlKqZr
	ZZDrViuy7J5hnSs370q0ZiA804ZeI3scYtM55IXYzQaDki8nxu+55H4sM=
X-Google-Smtp-Source: AGHT+IG26j2v4ze8bwOyp1fDtfCRo9gPEbsPVdvgYjvubX9YM3fdTEpXSYr1oj4ijBGMhrHDZlqPXw==
X-Received: by 2002:a17:902:ebc8:b0:297:d6c0:90b3 with SMTP id d9443c01a7336-29baafb376cmr41510835ad.23.1764102071342;
        Tue, 25 Nov 2025 12:21:11 -0800 (PST)
Received: from ?IPV6:2405:201:31:d869:2a74:b29f:f7bf:865c? ([2405:201:31:d869:2a74:b29f:f7bf:865c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5dc48esm267003a91.16.2025.11.25.12.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 12:21:10 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------tqFVRas0Am0gERKk0yPf60YQ"
Message-ID: <50389e6f-a379-44cd-a18b-ded86d0b9f7e@gmail.com>
Date: Wed, 26 Nov 2025 01:51:04 +0530
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
--------------tqFVRas0Am0gERKk0yPf60YQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#syz test:
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
--------------tqFVRas0Am0gERKk0yPf60YQ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-radio-keene-fix-memory-leak-in-error-path.patch"
Content-Disposition: attachment;
 filename*0="0001-media-radio-keene-fix-memory-leak-in-error-path.patch"
Content-Transfer-Encoding: base64

RnJvbSAwYjRlYjQ2YzZmOWY0ZGJmOWRjOWQ5YjA3YTViYzhiNWVjZTA0YjhkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTaGF1cnlhIFJhbmUgPHNzcmFuZV9iMjNAZWUudmp0
aS5hYy5pbj4KRGF0ZTogV2VkLCAyNiBOb3YgMjAyNSAwMTo0Nzo0MSArMDUzMApTdWJqZWN0
OiBbUEFUQ0hdIG1lZGlhOiByYWRpby1rZWVuZTogZml4IG1lbW9yeSBsZWFrIGluIGVycm9y
IHBhdGgKCkZpeCBhIG1lbW9yeSBsZWFrIGluIHVzYl9rZWVuZV9wcm9iZSgpIHdoZW4gdjRs
Ml9kZXZpY2VfcmVnaXN0ZXIoKQpmYWlscy4gVGhlIHY0bDIgY29udHJvbCBoYW5kbGVyIHdh
cyBpbml0aWFsaXplZCBhbmQgY29udHJvbHMgd2VyZQphZGRlZCwgYnV0IGlmIHY0bDJfZGV2
aWNlX3JlZ2lzdGVyKCkgZmFpbGVkLCB0aGUgaGFuZGxlciB3YXMgbmV2ZXIKZnJlZWQsIGxl
YWtpbmcgdGhlIGFsbG9jYXRlZCBtZW1vcnkgZm9yIHRoZSBoYW5kbGVyIGJ1Y2tldHMgYW5k
CmNvbnRyb2wgc3RydWN0dXJlcy4KCkNvbnNvbGlkYXRlIHRoZSBlcnJvciBoYW5kbGluZyBi
eSBhZGRpbmcgYW4gZXJyX2hkbCBsYWJlbCB0aGF0CmVuc3VyZXMgdjRsMl9jdHJsX2hhbmRs
ZXJfZnJlZSgpIGlzIGNhbGxlZCBmb3IgYWxsIGVycm9yIHBhdGhzCmFmdGVyIHRoZSBoYW5k
bGVyIGlzIGluaXRpYWxpemVkLgoKUmVwb3J0ZWQtYnk6IHN5emJvdCthNDFiNzNkY2UyMzk2
MmE3NGM3MkBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCkNsb3NlczogaHR0cHM6Ly9zeXpr
YWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWE0MWI3M2RjZTIzOTYyYTc0YzcyCkZpeGVz
OiBmYzM5ZjQ2YjhlODIgKCJbbWVkaWFdIHJhZGlvLWtlZW5lOiBhZGQgYSBkcml2ZXIgZm9y
IHRoZSBLZWVuZSBGTSBUcmFuc21pdHRlciIpClNpZ25lZC1vZmYtYnk6IFNoYXVyeWEgUmFu
ZSA8c3NyYW5lX2IyM0BlZS52anRpLmFjLmluPgotLS0KIGRyaXZlcnMvbWVkaWEvcmFkaW8v
cmFkaW8ta2VlbmUuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9yYWRp
by9yYWRpby1rZWVuZS5jIGIvZHJpdmVycy9tZWRpYS9yYWRpby9yYWRpby1rZWVuZS5jCmlu
ZGV4IGYzYjU3ZjBjYjFlYy4uODQ5MTZiNWViY2IyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21l
ZGlhL3JhZGlvL3JhZGlvLWtlZW5lLmMKKysrIGIvZHJpdmVycy9tZWRpYS9yYWRpby9yYWRp
by1rZWVuZS5jCkBAIC0zMzcsMTQgKzMzNywxMiBAQCBzdGF0aWMgaW50IHVzYl9rZWVuZV9w
cm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwKIAlyYWRpby0+c3RlcmVvID0gdHJ1
ZTsKIAlpZiAoaGRsLT5lcnJvcikgewogCQlyZXR2YWwgPSBoZGwtPmVycm9yOwotCi0JCXY0
bDJfY3RybF9oYW5kbGVyX2ZyZWUoaGRsKTsKLQkJZ290byBlcnJfdjRsMjsKKwkJZ290byBl
cnJfaGRsOwogCX0KIAlyZXR2YWwgPSB2NGwyX2RldmljZV9yZWdpc3RlcigmaW50Zi0+ZGV2
LCAmcmFkaW8tPnY0bDJfZGV2KTsKIAlpZiAocmV0dmFsIDwgMCkgewogCQlkZXZfZXJyKCZp
bnRmLT5kZXYsICJjb3VsZG4ndCByZWdpc3RlciB2NGwyX2RldmljZVxuIik7Ci0JCWdvdG8g
ZXJyX3Y0bDI7CisJCWdvdG8gZXJyX2hkbDsKIAl9CiAKIAltdXRleF9pbml0KCZyYWRpby0+
bG9jayk7CkBAIC0zODMsNiArMzgxLDggQEAgc3RhdGljIGludCB1c2Jfa2VlbmVfcHJvYmUo
c3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAKIGVycl92ZGV2OgogCXY0bDJfZGV2aWNl
X3VucmVnaXN0ZXIoJnJhZGlvLT52NGwyX2Rldik7CitlcnJfaGRsOgorCXY0bDJfY3RybF9o
YW5kbGVyX2ZyZWUoJnJhZGlvLT5oZGwpOwogZXJyX3Y0bDI6CiAJa2ZyZWUocmFkaW8tPmJ1
ZmZlcik7CiAJa2ZyZWUocmFkaW8pOwotLSAKMi4zNC4xCgo=

--------------tqFVRas0Am0gERKk0yPf60YQ--

