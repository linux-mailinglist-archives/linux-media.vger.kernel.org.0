Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12361628299
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 15:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237052AbiKNOcV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 09:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237084AbiKNOcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 09:32:15 -0500
Received: from butterbrot.org (butterbrot.org [176.9.106.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A38E2A434
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 06:32:06 -0800 (PST)
Received: from [192.168.178.20] (unknown [85.191.191.33])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id 2C39F58C21DA;
        Mon, 14 Nov 2022 15:32:04 +0100 (CET)
Message-ID: <01c9cd34-2499-79a2-7142-7269a9ff7711@butterbrot.org>
Date:   Mon, 14 Nov 2022 15:32:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Correct way to use vb2_dma_sg via USB?
Content-Language: en-GB
From:   Florian Echtler <floe@butterbrot.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Christoph Hellwig <hch@lst.de>
References: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>
In-Reply-To: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IJliftE0WrGif1kmPyCX0E0n"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IJliftE0WrGif1kmPyCX0E0n
Content-Type: multipart/mixed; boundary="------------j300NnWcplUBKtxmaw00FVgM";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, Christoph Hellwig <hch@lst.de>
Message-ID: <01c9cd34-2499-79a2-7142-7269a9ff7711@butterbrot.org>
Subject: Re: Correct way to use vb2_dma_sg via USB?
References: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>
In-Reply-To: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>

--------------j300NnWcplUBKtxmaw00FVgM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U29ycnkgdG8gbmFnIGFnYWluLCBidXQgaXMgdGhlcmUgYW55b25lIGFyb3VuZCB3aG8gbWln
aHQgYmUgYWJsZSB0byBnaXZlIG1lIA0KaGludD8gSGF2ZSBub3QgYmVlbiBhYmxlIHRvIGZp
bmQgYW55IGNvbmNsdXNpdmUgZG9jdW1lbnRhdGlvbiBvbiB0aGlzLg0KDQpCZXN0LCBGbG9y
aWFuDQoNCk9uIDA5LjExLjIyIDExOjA5LCBGbG9yaWFuIEVjaHRsZXIgd3JvdGU6DQo+IEhl
bGxvIGV2ZXJ5b25lLA0KPiANCj4gd2hpbGUgdHJ5aW5nIHRvIGZpeCB0aGUgcmVncmVzc2lv
biBpbiBzdXI0MC5rbyBtZW50aW9uZWQgZWFybGllciwgSSBub3RpY2VkIHRoYXQgDQo+IGFw
cGFyZW50bHkgc29tZSBvdGhlciBiaXRzIG9mIHRoZSBETUEgcGlwZWxpbmUgaGF2ZSBjaGFu
Z2VkIGFzIHdlbGwgaW4gdGhlIA0KPiBtZWFudGltZS4NCj4gDQo+IFRoZSBjb2RlIGJpdCBp
biBxdWVzdGlvbiBpbiBzdXI0MC5jIGN1cnJlbnRseSBsb29rcyBhcyBmb2xsb3dzOg0KPiAN
Cj4gIMKgwqDCoMKgc2d0ID0gdmIyX2RtYV9zZ19wbGFuZV9kZXNjKCZuZXdfYnVmLT52Yi52
YjJfYnVmLCAwKTsNCj4gDQo+ICDCoMKgwqDCoHJlc3VsdCA9IHVzYl9zZ19pbml0KCZzZ3Is
IHN1cjQwLT51c2JkZXYsDQo+ICDCoMKgwqDCoMKgwqDCoCB1c2JfcmN2YnVsa3BpcGUoc3Vy
NDAtPnVzYmRldiwgVklERU9fRU5EUE9JTlQpLCAwLA0KPiAgwqDCoMKgwqDCoMKgwqAgc2d0
LT5zZ2wsIHNndC0+bmVudHMsIHN1cjQwLT5waXhfZm10LnNpemVpbWFnZSwgR0ZQX0tFUk5F
TCk7DQo+IA0KPiBIb3dldmVyLCB3aGVuIEkgcHV0IGluIHNvbWUgZGVidWcgb3V0cHV0LCBJ
IG5vdGljZWQgdGhhdCBzZ3QtPm5lbnRzIGlzIHplcm8uIA0KPiBTaG91bGRuJ3QgdGhhdCBi
ZSBpbml0aWFsaXplZCBieSB2YjJfZG1hX3NnX3BsYW5lX2Rlc2M/DQo+IA0KPiBJIHRyaWVk
IHRvIG1hbnVhbGx5IHNldCBpdCB0byAxIGFuZCBnb3Qgc29tZSBwYXJ0aWFsbHktZmlsbGVk
IGJ1ZmZlcnMgYmFjaywgc28gDQo+IHRoaXMgc2VlbXMgdGhlIHJpZ2h0IHdheSB0byBnbywg
YnV0IEkgY291bGRuJ3QgZmluZCBhbnkgb3RoZXIgZHJpdmVyL2V4YW1wbGUgDQo+IHRoYXQg
dXNlcyB0aGlzIGNvbWJpbmF0aW9uLiBBbnkgaGludHMgdmVyeSB3ZWxjb21lLg0KPiANCj4g
QmVzdCwgRmxvcmlhbg0KDQotLSANClNFTlQgRlJPTSBNWSBERUMgVlQ1MCBURVJNSU5BTA0K
DQo=

--------------j300NnWcplUBKtxmaw00FVgM--

--------------IJliftE0WrGif1kmPyCX0E0n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCY3JRYwUDAAAAAAAKCRDsLPKyEa9q2Iz5
AJwPyesvVqULu2n/SgJb9IE/gJHnLACgr4P/fd2W6U2FVjMMtnpYDQV5n0U=
=W+u5
-----END PGP SIGNATURE-----

--------------IJliftE0WrGif1kmPyCX0E0n--
