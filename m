Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925FB439A8D
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 17:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbhJYPcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 11:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233928AbhJYPcb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 11:32:31 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F18CC061767
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 08:30:09 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q2-20020a17090a2e0200b001a0fd4efd49so183549pjd.1
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=/oQC3c6kHPBnBYaCXyk3XQoSwBx0MJsbDNrgRDHiTYM=;
        b=pCc4tEnlzbOlYCNDcTOgyL6If8XqWi1Q0zLmpkNfUyKh+BuBP45aijAy/kmyp2nLNf
         V1/R8D9ZjsNp3qBZL1RzcaN8S0dA2xpJ90H7pBofgOw6tjafiMQpgYw0xldsCjUREs4b
         MyFKVQ7G/z+jsNIuc5zGadm7e4gwuvTfLUolr5GbrUysEgS3k/cHI8eu2oHj1EmN9W0T
         2cvHFje7oBkU0KuaJSg5NeSDd/p4EEYYrbQMeojtYp+f5rY3xuzpNw3iboNjD63A67kj
         lBn3zuPvmiOxNMXnPLe7K2ZTnZSxoE8emqs6GhPQmVGRASAsp2y4FeenmWxXBRqGxh1X
         zozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=/oQC3c6kHPBnBYaCXyk3XQoSwBx0MJsbDNrgRDHiTYM=;
        b=AtGAN87vhuGUii0qalYKI9cDc7p6XRvu2WKF9aZy8GuKt6z/Icc85LFRAluxVfQOzt
         IAuPB1UIZpIXCof4jHe9McxmzNK4neUwjWG4yxOFKWRKF4oX1k+9LrvUcil+jsCgsmRI
         39JWgRaJ2+jNABu2b07KfCXFSwmcBUbKB1SQKKC90QKdmr3etOx1oPX974mPgSD/O9P3
         NdzxbMf6g1kgpOCq4oVElrfsG+eYhwUk1OovKMPgT0oXttZ3pRCupKItiBjJkH1gkCGu
         89ccluJsoMTYZ8329DxUIOBTeJm8N/KZ9Y+9O3JLRKNNgDWeLttc63v8m/FlZog9kRRi
         rfFQ==
X-Gm-Message-State: AOAM533BBvJrtXry5IjQbeAQGqWdvpd4UxS55BzMa0FKrhdj9GRQeUJ7
        rRncjI/XM3jlj6MAHc2rXrs5VA==
X-Google-Smtp-Source: ABdhPJyr4pfh618Fcc7JKCHq2J8ZamOvVnZCEbt++k4esy3a34dSZzGuq3W3UVid31/WtHehz2eymA==
X-Received: by 2002:a17:90b:1c02:: with SMTP id oc2mr21614855pjb.128.1635175808339;
        Mon, 25 Oct 2021 08:30:08 -0700 (PDT)
Received: from [192.168.254.17] ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id ng5sm19150359pjb.51.2021.10.25.08.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 08:30:07 -0700 (PDT)
Message-ID: <bba3acc1-cfa1-0c53-75de-f4ffa0a2bc9e@linaro.org>
Date:   Mon, 25 Oct 2021 08:30:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
Content-Language: en-US
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
 <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>
From:   Tadeusz Struk <tadeusz.struk@linaro.org>
In-Reply-To: <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mAhZPgdr3mdsZ2DcUcEr18WS"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mAhZPgdr3mdsZ2DcUcEr18WS
Content-Type: multipart/mixed; boundary="------------YsFxvfcQkaI2CagWnGszgzcf";
 protected-headers="v1"
From: Tadeusz Struk <tadeusz.struk@linaro.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Amit Pundir <amit.pundir@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <bba3acc1-cfa1-0c53-75de-f4ffa0a2bc9e@linaro.org>
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
 <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>
In-Reply-To: <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>

--------------YsFxvfcQkaI2CagWnGszgzcf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQnJ5YW4sDQpPbiAxMC8yNS8yMSAwODoyNCwgQnJ5YW4gTydEb25vZ2h1ZSB3cm90ZToN
Cj4gDQo+PiArwqDCoMKgIHN0cnVjdCBtdXRleCBzeW5jX2xvY2s7DQo+IA0KPiBXaHkgaGF2
ZSBhbiBhZGRpdGlvbmFsIG11dGV4LCB3aWxsIHRoZSBleGlzdGluZyBjb3JlOjpsb2NrIG5v
dCBkbyA/DQoNCkkgd2FudGVkIHRvIHJldXNlIGl0LCBidXQgdGhlIGNvcmU6OmxvY2sgaW4g
dXNlZCBpbnRlcm5hbGx5IGluIGhmaSBhbmQNCml0IHdpbGwgZGVhZGxvY2sgdGhlcmUgaWYg
d2UgdXNlIHRoYXQgb25lIGhlcmUuDQoNCj4gc2hvdWxkbid0IHRoaXMgYmUgYW4gLUVQUk9C
RV9ERUZFUiBpLmUuIENPUkVfSU5JVCBoYXNuJ3QgY29tcGxldGVkL3J1biB5ZXQgc28gZGVm
ZXIgdW50aWwgDQo+IGl0IGRvZXMuDQo+IA0KPiBUaGlzIGZyYWdtZW50IGhlcmUgbG9va3Mg
cmFjeSB0byBtZSB3aXRob3V0IGEgREVGRVIgYWJvdmUgPw0KPiANCj4gZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9xY29tL3ZlbnVzL2NvcmUuYzo6dmVudXNfcHJvYmUoKQ0KDQpObywgd2Ug
d2FudCBhIGhhcmQgc3RvcCBoZXJlLiBBdCB0aGlzIHBvaW50IHRoZSB2ZW51c19jb3JlIHBy
b2JlKCkNCmhhcyBmaW5pc2hlZCBhbmQgaXQgZmFpbGVkLiBSZXR1cm5pbmcgLUVQUk9CRV9E
RUZFUiBoZXJlIHdpbGwganVzdA0KY2F1c2UgaXQgdG8gbG9vcCBpbmZpbml0ZWx5Lg0KDQot
LSANClRoYW5rcywNClRhZGV1c3oNCg==

--------------YsFxvfcQkaI2CagWnGszgzcf--

--------------mAhZPgdr3mdsZ2DcUcEr18WS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEb3ghm5bfkfSeegvwo0472xuDAo4FAmF2zX4FAwAAAAAACgkQo0472xuDAo6l
dw/+LhN7/VzFJraQeSIJGUhEKX9NetR2fYto6nKpoGEvuDNqoQJXhR8mTSjP1DtQtMVJB56Ssk+8
GFkvTw4ewas2WIMCgJ6JNmkCLUvgFeY+tEAQl/wKCt1Bh/2cDz1f5LhCwRsP+QAfTRT0fBjSKr3F
F2dXCUA45fEqntT7qJoTGe11ovdQgA+6MLFPDNPPJHFxAFGEeEsYLwwUiQ5tdTxeEeyLtyYYf1ic
0Iog6xG079IOYYFljIkZTlWJGJyHpZqLOtbNIy/qPjFLXNVc7OuQq/U9yFJcb9jj/tMkEcLFstJX
2tEK0MIvZi8eKAc5tg+RSxBUFNs5Qspq/XjvR6PWQ1RM0JryUThL1jIiVjWhJzrzxadFXnwofQ7z
ozuDiHNgJbvKik6R6NzRQ6NkI1NhslSr4OticLiJpJgqP00n8M+mEryhxG6vY19lQ0+7Ze0DAVlQ
AurSvVISPiHr20zkQrJAv5epizTcxhUxP9dfsPUgV6hO/a9Do1bW5r22Wt22YzuxQzlEpXqDVrSf
V0MQyj5BBzgyymzmkZGu5XtXZGZd1EdDHHk52JwAei/ZxmkOPcij/lv/plN2GHS7bKG3tjaYzcNB
jZLzheDx1Kl935zOo3Rdbziy0QT952iIB53CpsL2lIrJvpk2hdU9H20AnRqacjfPule8LRH9F+3v
5zc=
=5XHO
-----END PGP SIGNATURE-----

--------------mAhZPgdr3mdsZ2DcUcEr18WS--
