Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93A75614AB1
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 13:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiKAMaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 08:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiKAMaO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 08:30:14 -0400
Received: from butterbrot.org (butterbrot.org [176.9.106.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A759BE0A7;
        Tue,  1 Nov 2022 05:30:12 -0700 (PDT)
Received: from [192.168.117.72] (77.241.129.138.mobile.3.dk [77.241.129.138])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id CE2CB65829EB;
        Tue,  1 Nov 2022 13:30:09 +0100 (CET)
Message-ID: <702aa771-2dcd-1b26-76a1-7acb1a3bed0e@butterbrot.org>
Date:   Tue, 1 Nov 2022 13:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: (very old) regression in sur40.ko
Content-Language: en-GB
From:   Florian Echtler <floe@butterbrot.org>
To:     linux-input <linux-input@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Martin Kaltenbrunner <modin@yuri.at>,
        Raphael Wimmer <raphael.wimmer@ur.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Christoph Hellwig <hch@lst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <d8ca5bd3-0498-853b-4101-02bfec216aaa@butterbrot.org>
In-Reply-To: <d8ca5bd3-0498-853b-4101-02bfec216aaa@butterbrot.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xE061Vj88LCuyLyJwDvirPGM"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xE061Vj88LCuyLyJwDvirPGM
Content-Type: multipart/mixed; boundary="------------856vdkG5jSsou0Xybhf4ybmv";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: linux-input <linux-input@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Martin Kaltenbrunner <modin@yuri.at>,
 Raphael Wimmer <raphael.wimmer@ur.de>, Hans Verkuil
 <hans.verkuil@cisco.com>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <702aa771-2dcd-1b26-76a1-7acb1a3bed0e@butterbrot.org>
Subject: Re: (very old) regression in sur40.ko
References: <d8ca5bd3-0498-853b-4101-02bfec216aaa@butterbrot.org>
In-Reply-To: <d8ca5bd3-0498-853b-4101-02bfec216aaa@butterbrot.org>

--------------856vdkG5jSsou0Xybhf4ybmv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

W2ZvcmdvdCBDQyB0byBDaHJpc3RvcGggSGVsbHdpZyBhbmQgR3JlZyBLSCB3aG8gYXV0aG9y
ZWQgdGhlIGNvbW1pdCBpbiBxdWVzdGlvbl0NCg0KT24gMzEuMTAuMjIgMTE6MTMsIEZsb3Jp
YW4gRWNodGxlciB3cm90ZToNCj4gSGVsbG8gZXZlcnlvbmUsDQo+IA0KPiBJIGRpZG4ndCB1
c2UgbXkgc3VyNDAgZm9yIHF1aXRlIHNvbWUgdGltZSwgYnV0IHJlY2VudGx5IHBpY2tlZCB1
cCB3b3JrIG9uIGl0IA0KPiBhZ2Fpbi4gQWZ0ZXIgYSBrZXJuZWwgdXBkYXRlIHRvIDUuMTUs
IEkgbm90aWNlZCB0aGF0IHRoZSB2aWRlbyBjb21wb25lbnQgb2YgdGhlIA0KPiBpbi10cmVl
IHN1cjQwIGRyaXZlciBoYWQgYXBwYXJlbnRseSBzdG9wcGVkIHdvcmtpbmcgYWZ0ZXIgNS45
ICh0aGlzIHdhcyBhY3R1YWxseSANCj4gbm90aWNlZCBieSBAcndpbW1lciBhIHllYXIgYWdv
LCBidXQgSSBkaWRuJ3QgcHJvcGVybHkgZm9sbG93IHVwIGF0IHRoZSB0aW1lKS4NCj4gDQo+
IFRoaXMgdGltZSwgSSBkaWQgZmluYWxseSBnbyB0aHJvdWdoIHdpdGggYSB2ZXJ5IHRlZGlv
dXMgMTQtc3RlcCBiaXNlY3Rpb24gb2YgdGhlIA0KPiBpc3N1ZSBhbmQgZW5kZWQgdXAgYXQg
dGhpcyBjb21taXQ6DQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
Y29tbWl0LzZlYjAyMzNlYzJkMGRmMjg4ZmU4NTE1ZDViMGIyYjE1NTYyZTA1YmINCj4gDQo+
IFRoZSBpc3N1ZSBtYW5pZmVzdHMgYXMgYSBrZXJuZWwgb29wcyBpbiB2YjJfZG1hX3NnX2Fs
bG9jLCByZXN1bHRpbmcgaW4gYSBmYWlsZWQgDQo+IHVzYl9zZ19pbml0IGNhbGwgKHByb2Jh
Ymx5IGJlY2F1c2UgZG1hX21hc2sgYW5kIGRtYV9wZm5fb2Zmc2V0IGFyZSBub3cgdW5zZXQp
LiANCj4gSG93IHdvdWxkIEkgaGF2ZSB0byB1c2UgdGhlICpfc2dfKiBmdW5jdGlvbnMgaW4g
bXkgZHJpdmVyIHRvIGZpeCB0aGlzPw0KPiANCj4gRm9yIHJlZmVyZW5jZSwgdGhlIGNvZGUg
aW4gcXVlc3Rpb24gaXM6DQo+IA0KPiAgwqDCoMKgwqByZXN1bHQgPSB1c2Jfc2dfaW5pdCgm
c2dyLCBzdXI0MC0+dXNiZGV2LA0KPiAgwqDCoMKgwqDCoMKgwqAgdXNiX3JjdmJ1bGtwaXBl
KHN1cjQwLT51c2JkZXYsIFZJREVPX0VORFBPSU5UKSwgMCwNCj4gIMKgwqDCoMKgwqDCoMKg
IHNndC0+c2dsLCBzZ3QtPm5lbnRzLCBzdXI0MC0+cGl4X2ZtdC5zaXplaW1hZ2UsIDApOw0K
PiANCj4gIEZyb20gbG9va2luZyBhdCB0aGUgb3RoZXIgdXNlcyBvZiB1c2Jfc2dfaW5pdCwg
d291bGQgaXQgYmUgc3VmZmljaWVudCB0byBjaGFuZ2UgDQo+IHRoZSB2ZXJ5IGxhc3QgcGFy
YW1ldGVyIGZyb20gMCB0byBlaXRoZXIgR0ZQX0tFUk5FTCBvciBHRlBfTk9JTz8gSWYgeWVz
LCB3aGljaCANCj4gb25lIGlzIGNvcnJlY3Q/DQo+IA0KPiBCZXN0LCBGbG9yaWFuDQoNCi0t
IA0KU0VOVCBGUk9NIE1ZIERFQyBWVDUwIFRFUk1JTkFMDQoNCg==

--------------856vdkG5jSsou0Xybhf4ybmv--

--------------xE061Vj88LCuyLyJwDvirPGM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCY2ERUAUDAAAAAAAKCRDsLPKyEa9q2MmL
AKCtXOoBGCgkG/KQ/DE+i6LMR90NugCg1P4jJ33zvNNT+aUcZG5W8WbMbG4=
=84O+
-----END PGP SIGNATURE-----

--------------xE061Vj88LCuyLyJwDvirPGM--
