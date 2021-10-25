Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADE0439C2A
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 18:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbhJYRAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 13:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234107AbhJYRAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 13:00:07 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F22FC061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 09:57:45 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id om14so8752058pjb.5
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 09:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to;
        bh=kBFK5avOSffzIDZ8gdxEawrxHlV/coTmIHi8PWPtDhw=;
        b=dqZgE9qjWUkL/Uwcy5XzZlhQZTGs6SZsieM8X5/BpXicHCSTYGcNl1a80o/F5FfEUl
         AMbec5pC3/5CqwGzwFOwBkdrsSPeoa6FiwCdtiBZejJUG62/PylzVTykLLsN6qUz9JC5
         Obna//B2OszPRu1N4rKg9GYEa8acJnWVCvh18th9l8dUTNz0ZvKgtmf7D31pFdKLfn9c
         Br6YjWgBo8I+5oZcLbyODQCuRuoiuueovWocpuuOIt5ScSCrnGwDgx6qZmImWMRYYGKO
         XIQ4DKyguIDnPiJwCZkyjA6VTFX0eN2DDz5bLivptg7m/btaaAXNC44AqdsP7CiYj9tu
         hcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to;
        bh=kBFK5avOSffzIDZ8gdxEawrxHlV/coTmIHi8PWPtDhw=;
        b=5KIU5UxsA2C13RnIjG+wXpfbXN1eDw47ktztqpfscTm0jRAODoWWyhyXCP02whPa7k
         +aDAtycVYUKTnLlpPtf89bcTlU8JunnhdTvC52THaBM5mcjOPBRvmwQi3k14DwRxVLWo
         uZiDM90DHHIioGNUV3imfDRIKB5q3L6F+7uESuSmANslVdEwX6S5yFGSffaRQ8HGgn8r
         IDR/TiFluZpnAJjQB3at2boYXRqy3Nd1/DVC6Tn7Cx9AiMXd+LNje9qZ72Ibxp7+Gf5T
         xbSdGcWDUsVy5Na1C4winCXrM4ZEBl7GdzuqfsYH7YfMm7QLNw3EdOo7kYF/YnvVk6fU
         +Y2A==
X-Gm-Message-State: AOAM532zA6qVOxr8o3tgag/26qabI4bOA1hmIPKhE12XTYYcbubTSnPl
        XFEpOjw/1Se5PZPEx0cLmRmRRA==
X-Google-Smtp-Source: ABdhPJy1d2GtQabPdg2cP0rHnWwz2wETCyB6opMAxnjIjtaDfLX5lyZ4HO0ARVGVG0yTNk4ErmZQFA==
X-Received: by 2002:a17:90b:2514:: with SMTP id ns20mr30278137pjb.210.1635181064601;
        Mon, 25 Oct 2021 09:57:44 -0700 (PDT)
Received: from [192.168.254.17] ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id a11sm21494559pfv.11.2021.10.25.09.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 09:57:44 -0700 (PDT)
Message-ID: <25da5210-8e1f-7183-a8e7-8584f8dd2cef@linaro.org>
Date:   Mon, 25 Oct 2021 09:57:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <bba3acc1-cfa1-0c53-75de-f4ffa0a2bc9e@linaro.org>
 <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>
From:   Tadeusz Struk <tadeusz.struk@linaro.org>
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
In-Reply-To: <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tUiHshhowjtBrvcDh5JRdKKH"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tUiHshhowjtBrvcDh5JRdKKH
Content-Type: multipart/mixed; boundary="------------hI7wLglQLw51d5RqtTeDgAKU";
 protected-headers="v1"
From: Tadeusz Struk <tadeusz.struk@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Amit Pundir <amit.pundir@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <25da5210-8e1f-7183-a8e7-8584f8dd2cef@linaro.org>
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
 <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>
 <bba3acc1-cfa1-0c53-75de-f4ffa0a2bc9e@linaro.org>
 <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>
In-Reply-To: <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>

--------------hI7wLglQLw51d5RqtTeDgAKU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMjUvMjEgMDk6MDMsIEJyeWFuIE8nRG9ub2dodWUgd3JvdGU6DQo+IEkgZG9uJ3Qg
dGhpbmsgdGhlcmUncyBhbnkgZ3VhcmFudGVlIGF0IGFsbCwgdGhhdCBjb3JlIHByb2JlKCkg
aGFzIGNvbXBsZXRlZCBhdCANCj4gdGhhdCBwb2ludC4NCg0KSSB0aGluayB0aGVyZSBpcywg
dGhhbmtzIHRvIHRoZSBuZXcgc3luY19tdXRleC4gVGhlIGVuYy9kZWMgcHJvYmUgd2lsbCBr
ZWVwDQpyZXR1cm5pbmcgLUVQUk9CRV9ERUZFUjsgdW50aWwgdGhlIGNvcmUgZHJpdmVyIGNh
bGxzDQpwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBjb3JlKTsgaW4gbGluZSAzMzgsIGJ1
dCBiZWZvcmUgaXQgZG9lcyB0aGF0IGl0DQp0YWtlcyB0aGUgc3luX2xvY2suIFRoZW4gYm90
aCBlbmMvZGVjIGRyaXZlcnMgd2lsbCBibG9jayBvbiB0aGUgc2FtZSBzeW5jX2xvY2sNCnVu
dGlsIGVpdGhlciB0aGUgY29yZSBoYXMgZmluaXNoZWQgaW5pdGlhbGl6YXRpb24gZnVsbHkg
YW5kIHVubG9ja3MgaXQgaW4gbGluZQ0KMzc4IGp1c3QgYmVmb3JlIHJldHVybmluZyAwLCBv
ciBpdCBmYWlscyBpbiBiZXR3ZWVuIGFuZCB1bmxvY2tzIGl0IG9uIHRoZSBlcnINCnBhdGgu
IE9ubHkgdGhlbiB0aGUgb3RoZXIgdHdvIGNhbiBwcm9jZWVkIGFuZCBjaGVjayBpZiB0aGUg
Y29yZSBwcm9iZSBmYWlsZWQsDQppbiB3aGljaCBjYXNlIHRoZSBjb25kaXRpb24gY29yZS0+
c3RhdGUgIT0gQ09SRV9JTklUIHdpbGwgYmUgdHJ1ZS4NCg0KPiANCj4gb2ZfcGxhdGZvcm1f
cG9wdWxhdGUoKSBkb2Vzbid0IGd1YXJhbnRlZSBvcmRlcmluZyBvZiB0aGUgcHJvYmUoKSBj
b21wbGV0aW5nIA0KPiBiZWZvcmUgb3IgYWZ0ZXIgdGhlIHByb2JlKCkgb2YgdGhlIHBsYXRm
b3JtIGRyaXZlcnMgdGhhdCBhcmUgYXNzb2NpYXRlZCB3aXRoIHRoZSANCj4gZGV2aWNlcyBp
biBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpLg0KDQphZ3JlZSwgYnV0IEkgZG9uJ3QgZGVwZW5k
IG9uIG9mX3BsYXRmb3JtX3BvcHVsYXRlKCkuIFRoZSBvcmRlcmluZyBiZXR3ZWVuIHRoZQ0K
dGhyZWUgcHJvYmUgZnVuY3Rpb25zIGlzIGVuZm9yY2VkIGJ5IHRoZSBuZXcgc3luYyBtdXRl
eC4NCg0KPiANCj4gV2hlbiB5b3UgdGhpbmsgaXQgYWJvdXQgaXQgY2FuJ3QgZG8gdGhhdCBh
bmQgeW91IHdvdWxkbid0IHdhbnQgaXQgdG8gZG8gdGhhdCANCj4gc2luY2UgYSBkZXZpY2Ug
bWlnaHQgaGF2ZSBhIGxlZ2l0aW1hdGUgcmVhc29uIHRvIEVQUk9CRV9ERUZFUg0KPiANCj4g
QXMgYW4gZXhhbXBsZSBjb3JlIGNvdWxkIGNhbGwgb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKSBh
bmQgdGhlbiBhcyBhIHJpZGljdWxvdXMgDQo+IGV4YW1wbGUgZ28gdG8gc2xlZXAgZm9yIGZp
dmUgc2Vjb25kcyAtIGluIHdoaWNoIGNhc2UgaXQgaXMgcGVyZmVjdGx5IHBvc3NpYmxlIA0K
DQphbmQgdGhpcyBpcyBleGFjdGx5IHdoYXQgaGFwcGVucyB3aGVuIHRoZSBjb3JlIHByb2Jl
KCkgbG9hZHMgdGhlIGZpcm13YXJlIGZyb20NCmRpc2suDQoNCj4gdGhlIGVuY29kZXIgYW5k
IGRlY29kZXIgcHJvYmUoKSBmdW5jdGlvbnMgd2lsbCBidWcgb3V0IGlsbGVnaXRpbWF0ZWx5
IHdhaXRpbmcgDQo+IGJlY2F1c2Ugb2YgY29yZS0+c3RhdGUgIT0gQ09SRV9JTklUDQoNCm5v
dCByZWFsbHksIGJlY2F1c2UgaXQgd2lsbCBibG9jayBvbiB0aGUgbXV0ZXggYW5kIG9ubHkg
Y2hlY2sgdGhlIGNvbmRpdGlvbg0KYWZ0ZXIgdGhlIHN5bmNfbG9jayBpcyB1bmxvY2tlZC4N
Cg0KLS0gDQpUaGFua3MsDQpUYWRldXN6DQo=

--------------hI7wLglQLw51d5RqtTeDgAKU--

--------------tUiHshhowjtBrvcDh5JRdKKH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEb3ghm5bfkfSeegvwo0472xuDAo4FAmF24gcFAwAAAAAACgkQo0472xuDAo7+
7g/+Mh51FmoVF2DtUXc2/93JP0AR2siWYIAJJ214LKTdiIQfngdgyEuJb+Ff8IXMsZufZL8lpW+9
kM0gwmWerBTaR75+tdysHsJAX2yGC2iEfebJrC5K3I/aFWO18IaBU4u6osatgCtFn5hHEIf0LAE1
sAquY0JkTmdltTkbWtZsIphiQ5ptcQ7c9F1BcpG+4T2z9laqiNSXfR3qEfHL+EEbDKXmsFTY5T45
6RPvLVBWXW2aztzPPOInkYMRvxRhgLv2qBwFQKYt2nUyRlFm80jrk7DYAqb6EieyEV3OLXLYJ+MP
3ulF2Yd/0E2JVWu95XwOIc8huUgogQrfIFwQJ8x/YiX6Q7w6D5CG9meXrBj3KY9lBr9OwcCRHjDz
xtqsfq5fbS1GUFn/D5g32a2KY9XZFpZ+ZYWdLToEOqiNkdlaxu6IiamMKuwMp/Yzz4opyFr0nu9H
fI7IfHfNKOWaFkNex+/2yIo5EYZDGT3gZoA1AGMGeKDV2xFbr8alVdI6ZjgwBxfaxWtWDnruHBTl
JbVQdyXkTbZnIManArMv4etXBEkQcYy7ZEGWJzOIyS8KwEvs9hHeJTmFgwb8HGkPCeNYAapjRbB2
q6yggTsBQxPJdZMfR2IHlutj5NfgqgVyShpgTD/8ozQGW+dvvhHFNnkHlxsaFLVU/lTwrLvZPuME
bs8=
=b9Bo
-----END PGP SIGNATURE-----

--------------tUiHshhowjtBrvcDh5JRdKKH--
