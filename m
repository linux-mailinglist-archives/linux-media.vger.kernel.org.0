Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD1E622813
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 11:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiKIKJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 05:09:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiKIKJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 05:09:41 -0500
Received: from butterbrot.org (butterbrot.org [176.9.106.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A14B13D19
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 02:09:40 -0800 (PST)
Received: from [172.25.26.111] (h175.natout.aau.dk [130.225.198.175])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id 558ED58A52AD;
        Wed,  9 Nov 2022 11:09:35 +0100 (CET)
Message-ID: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>
Date:   Wed, 9 Nov 2022 11:09:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Language: en-GB
From:   Florian Echtler <floe@butterbrot.org>
Subject: Correct way to use vb2_dma_sg via USB?
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WAncRmCRjphAKG94WfGErwKw"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WAncRmCRjphAKG94WfGErwKw
Content-Type: multipart/mixed; boundary="------------2S0E5CSvUjxZ60ldaOpi3feV";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Message-ID: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>
Subject: Correct way to use vb2_dma_sg via USB?

--------------2S0E5CSvUjxZ60ldaOpi3feV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsDQoNCndoaWxlIHRyeWluZyB0byBmaXggdGhlIHJlZ3Jlc3Npb24g
aW4gc3VyNDAua28gbWVudGlvbmVkIGVhcmxpZXIsIEkgbm90aWNlZCB0aGF0IA0KYXBwYXJl
bnRseSBzb21lIG90aGVyIGJpdHMgb2YgdGhlIERNQSBwaXBlbGluZSBoYXZlIGNoYW5nZWQg
YXMgd2VsbCBpbiB0aGUgbWVhbnRpbWUuDQoNClRoZSBjb2RlIGJpdCBpbiBxdWVzdGlvbiBp
biBzdXI0MC5jIGN1cnJlbnRseSBsb29rcyBhcyBmb2xsb3dzOg0KDQoJc2d0ID0gdmIyX2Rt
YV9zZ19wbGFuZV9kZXNjKCZuZXdfYnVmLT52Yi52YjJfYnVmLCAwKTsNCg0KCXJlc3VsdCA9
IHVzYl9zZ19pbml0KCZzZ3IsIHN1cjQwLT51c2JkZXYsDQoJCXVzYl9yY3ZidWxrcGlwZShz
dXI0MC0+dXNiZGV2LCBWSURFT19FTkRQT0lOVCksIDAsDQoJCXNndC0+c2dsLCBzZ3QtPm5l
bnRzLCBzdXI0MC0+cGl4X2ZtdC5zaXplaW1hZ2UsIEdGUF9LRVJORUwpOw0KDQpIb3dldmVy
LCB3aGVuIEkgcHV0IGluIHNvbWUgZGVidWcgb3V0cHV0LCBJIG5vdGljZWQgdGhhdCBzZ3Qt
Pm5lbnRzIGlzIHplcm8uIA0KU2hvdWxkbid0IHRoYXQgYmUgaW5pdGlhbGl6ZWQgYnkgdmIy
X2RtYV9zZ19wbGFuZV9kZXNjPw0KDQpJIHRyaWVkIHRvIG1hbnVhbGx5IHNldCBpdCB0byAx
IGFuZCBnb3Qgc29tZSBwYXJ0aWFsbHktZmlsbGVkIGJ1ZmZlcnMgYmFjaywgc28gDQp0aGlz
IHNlZW1zIHRoZSByaWdodCB3YXkgdG8gZ28sIGJ1dCBJIGNvdWxkbid0IGZpbmQgYW55IG90
aGVyIGRyaXZlci9leGFtcGxlIA0KdGhhdCB1c2VzIHRoaXMgY29tYmluYXRpb24uIEFueSBo
aW50cyB2ZXJ5IHdlbGNvbWUuDQoNCkJlc3QsIEZsb3JpYW4NCi0tIA0KU0VOVCBGUk9NIE1Z
IERFQyBWVDUwIFRFUk1JTkFMDQo=

--------------2S0E5CSvUjxZ60ldaOpi3feV--

--------------WAncRmCRjphAKG94WfGErwKw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCY2t8XgUDAAAAAAAKCRDsLPKyEa9q2DpP
AKC5O8jEo18dGfPdngTMni0GfhJy7ACgu84KvDU+UEhIsfL0DxZr9LiJdBI=
=x01A
-----END PGP SIGNATURE-----

--------------WAncRmCRjphAKG94WfGErwKw--
