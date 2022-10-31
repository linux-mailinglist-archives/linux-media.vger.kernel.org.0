Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0D7613380
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 11:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiJaKWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 06:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiJaKWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 06:22:09 -0400
X-Greylist: delayed 485 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 31 Oct 2022 03:22:08 PDT
Received: from butterbrot.org (butterbrot.org [176.9.106.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C081DF2C;
        Mon, 31 Oct 2022 03:22:07 -0700 (PDT)
Received: from [172.25.26.111] (h175.natout.aau.dk [130.225.198.175])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id A8CE56581361;
        Mon, 31 Oct 2022 11:13:57 +0100 (CET)
Message-ID: <d8ca5bd3-0498-853b-4101-02bfec216aaa@butterbrot.org>
Date:   Mon, 31 Oct 2022 11:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-GB
To:     linux-input <linux-input@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Martin Kaltenbrunner <modin@yuri.at>,
        Raphael Wimmer <raphael.wimmer@ur.de>,
        Hans Verkuil <hans.verkuil@cisco.com>
From:   Florian Echtler <floe@butterbrot.org>
Subject: (very old) regression in sur40.ko
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6vYM0Km06glzuomhiRzJAEi3"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6vYM0Km06glzuomhiRzJAEi3
Content-Type: multipart/mixed; boundary="------------Uw5Lr1A2b3zkwk4rp0gdEn07";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: linux-input <linux-input@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Martin Kaltenbrunner <modin@yuri.at>,
 Raphael Wimmer <raphael.wimmer@ur.de>, Hans Verkuil <hans.verkuil@cisco.com>
Message-ID: <d8ca5bd3-0498-853b-4101-02bfec216aaa@butterbrot.org>
Subject: (very old) regression in sur40.ko

--------------Uw5Lr1A2b3zkwk4rp0gdEn07
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsDQoNCkkgZGlkbid0IHVzZSBteSBzdXI0MCBmb3IgcXVpdGUgc29t
ZSB0aW1lLCBidXQgcmVjZW50bHkgcGlja2VkIHVwIHdvcmsgb24gaXQgDQphZ2Fpbi4gQWZ0
ZXIgYSBrZXJuZWwgdXBkYXRlIHRvIDUuMTUsIEkgbm90aWNlZCB0aGF0IHRoZSB2aWRlbyBj
b21wb25lbnQgb2YgdGhlIA0KaW4tdHJlZSBzdXI0MCBkcml2ZXIgaGFkIGFwcGFyZW50bHkg
c3RvcHBlZCB3b3JraW5nIGFmdGVyIDUuOSAodGhpcyB3YXMgYWN0dWFsbHkgDQpub3RpY2Vk
IGJ5IEByd2ltbWVyIGEgeWVhciBhZ28sIGJ1dCBJIGRpZG4ndCBwcm9wZXJseSBmb2xsb3cg
dXAgYXQgdGhlIHRpbWUpLg0KDQpUaGlzIHRpbWUsIEkgZGlkIGZpbmFsbHkgZ28gdGhyb3Vn
aCB3aXRoIGEgdmVyeSB0ZWRpb3VzIDE0LXN0ZXAgYmlzZWN0aW9uIG9mIHRoZSANCmlzc3Vl
IGFuZCBlbmRlZCB1cCBhdCB0aGlzIGNvbW1pdDoNCg0KaHR0cHM6Ly9naXRodWIuY29tL3Rv
cnZhbGRzL2xpbnV4L2NvbW1pdC82ZWIwMjMzZWMyZDBkZjI4OGZlODUxNWQ1YjBiMmIxNTU2
MmUwNWJiDQoNClRoZSBpc3N1ZSBtYW5pZmVzdHMgYXMgYSBrZXJuZWwgb29wcyBpbiB2YjJf
ZG1hX3NnX2FsbG9jLCByZXN1bHRpbmcgaW4gYSBmYWlsZWQgDQp1c2Jfc2dfaW5pdCBjYWxs
IChwcm9iYWJseSBiZWNhdXNlIGRtYV9tYXNrIGFuZCBkbWFfcGZuX29mZnNldCBhcmUgbm93
IHVuc2V0KS4gDQpIb3cgd291bGQgSSBoYXZlIHRvIHVzZSB0aGUgKl9zZ18qIGZ1bmN0aW9u
cyBpbiBteSBkcml2ZXIgdG8gZml4IHRoaXM/DQoNCkZvciByZWZlcmVuY2UsIHRoZSBjb2Rl
IGluIHF1ZXN0aW9uIGlzOg0KDQoJcmVzdWx0ID0gdXNiX3NnX2luaXQoJnNnciwgc3VyNDAt
PnVzYmRldiwNCgkJdXNiX3JjdmJ1bGtwaXBlKHN1cjQwLT51c2JkZXYsIFZJREVPX0VORFBP
SU5UKSwgMCwNCgkJc2d0LT5zZ2wsIHNndC0+bmVudHMsIHN1cjQwLT5waXhfZm10LnNpemVp
bWFnZSwgMCk7DQoNCiBGcm9tIGxvb2tpbmcgYXQgdGhlIG90aGVyIHVzZXMgb2YgdXNiX3Nn
X2luaXQsIHdvdWxkIGl0IGJlIHN1ZmZpY2llbnQgdG8gY2hhbmdlIA0KdGhlIHZlcnkgbGFz
dCBwYXJhbWV0ZXIgZnJvbSAwIHRvIGVpdGhlciBHRlBfS0VSTkVMIG9yIEdGUF9OT0lPPyBJ
ZiB5ZXMsIHdoaWNoIA0Kb25lIGlzIGNvcnJlY3Q/DQoNCkJlc3QsIEZsb3JpYW4NCi0tIA0K
U0VOVCBGUk9NIE1ZIERFQyBWVDUwIFRFUk1JTkFMDQo=

--------------Uw5Lr1A2b3zkwk4rp0gdEn07--

--------------6vYM0Km06glzuomhiRzJAEi3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCY1+f5QUDAAAAAAAKCRDsLPKyEa9q2Elk
AJ9vkFC6rusFKgg6ctZ/6fki5Vi76gCfcd/hKCpg5AoN1nQsDI201TYwdZQ=
=JJty
-----END PGP SIGNATURE-----

--------------6vYM0Km06glzuomhiRzJAEi3--
