Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6DC63C421
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 16:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235949AbiK2PuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 10:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbiK2Ptn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 10:49:43 -0500
Received: from butterbrot.org (butterbrot.org [176.9.106.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D142AE1C
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 07:48:58 -0800 (PST)
Received: from [192.168.172.72] (77.241.129.1.mobile.3.dk [77.241.129.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id B0B5E5900631;
        Tue, 29 Nov 2022 16:48:55 +0100 (CET)
Message-ID: <47d4a419-a5fb-1361-93e2-c039625e94f9@butterbrot.org>
Date:   Tue, 29 Nov 2022 16:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Correct way to use vb2_dma_sg via USB?
Content-Language: en-GB
From:   Florian Echtler <floe@butterbrot.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Christoph Hellwig <hch@lst.de>
References: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>
 <01c9cd34-2499-79a2-7142-7269a9ff7711@butterbrot.org>
In-Reply-To: <01c9cd34-2499-79a2-7142-7269a9ff7711@butterbrot.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JW0XPqNsMsw59qnrKlI1c0DJ"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JW0XPqNsMsw59qnrKlI1c0DJ
Content-Type: multipart/mixed; boundary="------------qqQixGDl18lC13iVBcw50VcR";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, Christoph Hellwig <hch@lst.de>
Message-ID: <47d4a419-a5fb-1361-93e2-c039625e94f9@butterbrot.org>
Subject: Re: Correct way to use vb2_dma_sg via USB?
References: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>
 <01c9cd34-2499-79a2-7142-7269a9ff7711@butterbrot.org>
In-Reply-To: <01c9cd34-2499-79a2-7142-7269a9ff7711@butterbrot.org>

--------------qqQixGDl18lC13iVBcw50VcR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

Rm9sbG93aW5nIHVwIG9uIFtQQVRDSCAxLzddIG1lZGlhOiB2aWRlb2J1Zi1kbWEtY29udGln
OiB1c2UgZG1hX21tYXBfY29oZXJlbnQ6DQoNCklmIHRoZSB2aWRlb2J1ZiBmcmFtZXdvcmsg
aXMgZ29pbmcgdG8gYmUgcmVwbGFjZWQgYW55d2F5LCB3b3VsZCBpdCBldmVuIG1ha2UgDQpz
ZW5zZSB0byB0cnkgYW5kIGZpeCB0aGlzIGJ1ZyBpbiB0aGUgKGFkbWl0dGVkbHkgdmVyeSBz
cGVjaWZpYykgc3VyNDAgZHJpdmVyPw0KDQpJZiB0aGUgYW5zd2VyIHNob3VsZCBiZSB5ZXMs
IHRoZW4gSSdkIHN0aWxsIG5lZWQgYSBoaW50IGFib3V0IGhvdyB0byBtYWtlIA0KdmIyX2Rt
YV9zZyB3b3JrIHdpdGggdXNiX3NnX2luaXQuLi4NCg0KQmVzdCwgRmxvcmlhbg0KDQpPbiAx
NC4xMS4yMiAxNTozMiwgRmxvcmlhbiBFY2h0bGVyIHdyb3RlOg0KPiBTb3JyeSB0byBuYWcg
YWdhaW4sIGJ1dCBpcyB0aGVyZSBhbnlvbmUgYXJvdW5kIHdobyBtaWdodCBiZSBhYmxlIHRv
IGdpdmUgbWUgDQo+IGhpbnQ/IEhhdmUgbm90IGJlZW4gYWJsZSB0byBmaW5kIGFueSBjb25j
bHVzaXZlIGRvY3VtZW50YXRpb24gb24gdGhpcy4NCj4gDQo+IEJlc3QsIEZsb3JpYW4NCj4g
DQo+IE9uIDA5LjExLjIyIDExOjA5LCBGbG9yaWFuIEVjaHRsZXIgd3JvdGU6DQo+PiBIZWxs
byBldmVyeW9uZSwNCj4+DQo+PiB3aGlsZSB0cnlpbmcgdG8gZml4IHRoZSByZWdyZXNzaW9u
IGluIHN1cjQwLmtvIG1lbnRpb25lZCBlYXJsaWVyLCBJIG5vdGljZWQgDQo+PiB0aGF0IGFw
cGFyZW50bHkgc29tZSBvdGhlciBiaXRzIG9mIHRoZSBETUEgcGlwZWxpbmUgaGF2ZSBjaGFu
Z2VkIGFzIHdlbGwgaW4gDQo+PiB0aGUgbWVhbnRpbWUuDQo+Pg0KPj4gVGhlIGNvZGUgYml0
IGluIHF1ZXN0aW9uIGluIHN1cjQwLmMgY3VycmVudGx5IGxvb2tzIGFzIGZvbGxvd3M6DQo+
Pg0KPj4gwqDCoMKgwqDCoHNndCA9IHZiMl9kbWFfc2dfcGxhbmVfZGVzYygmbmV3X2J1Zi0+
dmIudmIyX2J1ZiwgMCk7DQo+Pg0KPj4gwqDCoMKgwqDCoHJlc3VsdCA9IHVzYl9zZ19pbml0
KCZzZ3IsIHN1cjQwLT51c2JkZXYsDQo+PiDCoMKgwqDCoMKgwqDCoMKgIHVzYl9yY3ZidWxr
cGlwZShzdXI0MC0+dXNiZGV2LCBWSURFT19FTkRQT0lOVCksIDAsDQo+PiDCoMKgwqDCoMKg
wqDCoMKgIHNndC0+c2dsLCBzZ3QtPm5lbnRzLCBzdXI0MC0+cGl4X2ZtdC5zaXplaW1hZ2Us
IEdGUF9LRVJORUwpOw0KPj4NCj4+IEhvd2V2ZXIsIHdoZW4gSSBwdXQgaW4gc29tZSBkZWJ1
ZyBvdXRwdXQsIEkgbm90aWNlZCB0aGF0IHNndC0+bmVudHMgaXMgemVyby4gDQo+PiBTaG91
bGRuJ3QgdGhhdCBiZSBpbml0aWFsaXplZCBieSB2YjJfZG1hX3NnX3BsYW5lX2Rlc2M/DQo+
Pg0KPj4gSSB0cmllZCB0byBtYW51YWxseSBzZXQgaXQgdG8gMSBhbmQgZ290IHNvbWUgcGFy
dGlhbGx5LWZpbGxlZCBidWZmZXJzIGJhY2ssIHNvIA0KPj4gdGhpcyBzZWVtcyB0aGUgcmln
aHQgd2F5IHRvIGdvLCBidXQgSSBjb3VsZG4ndCBmaW5kIGFueSBvdGhlciBkcml2ZXIvZXhh
bXBsZSANCj4+IHRoYXQgdXNlcyB0aGlzIGNvbWJpbmF0aW9uLiBBbnkgaGludHMgdmVyeSB3
ZWxjb21lLg0KPj4NCj4+IEJlc3QsIEZsb3JpYW4NCj4gDQoNCi0tIA0KU0VOVCBGUk9NIE1Z
IERFQyBWVDUwIFRFUk1JTkFMDQoNCg==

--------------qqQixGDl18lC13iVBcw50VcR--

--------------JW0XPqNsMsw59qnrKlI1c0DJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCY4Yp5gUDAAAAAAAKCRDsLPKyEa9q2GEj
AKC0c5GOIEsnhEE0M9V34ybRdwRZcQCgmLdbScmk+/V4OtXDZhSa2uHdWOw=
=cyKX
-----END PGP SIGNATURE-----

--------------JW0XPqNsMsw59qnrKlI1c0DJ--
