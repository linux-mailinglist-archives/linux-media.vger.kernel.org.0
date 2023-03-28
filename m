Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA0F6CB8B1
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 09:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbjC1HwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 03:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjC1HwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 03:52:00 -0400
X-Greylist: delayed 543 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Mar 2023 00:51:31 PDT
Received: from butterbrot.org (butterbrot.org [176.9.106.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F225E423B
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=butterbrot.org;
        s=202303; t=1679989345;
        bh=/WHB/OPd8StWx+7aE6R8RTgfQ9s9dmIkJcm0O3aIoKs=;
        h=Date:To:From:Subject;
        b=GCuZUDM3c+CV6z3MbDCkHAU/TiCOw2rMmy9b5HYcBurWtFfO3RLBTs0rdZ1m9kd7Q
         a8DvXSup0Ml/4EFL1jKJnZnaeRdOGFKwvSeeWDXYOmV5dIkr3trOGJS1h9qgVKe7pu
         ZNeNJv2TPCkFjAf8ZX0rYgQOKTjd6MaGUZHFwlbXG93Z83FeYIUqbQKap9E5tNRehN
         McMcBdpaqZ9ezwVI0RfD52LIWYc164uBJAdBCCGo3N6v/al80ARHpIGOuE79O2aJiX
         QMbEqQ3ZkS67YDu+ih5J/3+sy/nJ2lzlvsy2JVUnlBS6qQCffueqN1idGCd9zb391W
         e1vTPMqnuVLmw==
Received: from [192.168.178.20] (unknown [85.191.191.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id 248024FC0DEF
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 09:42:25 +0200 (CEST)
Message-ID: <d5bc46ad-0eb6-54f5-2e9e-7dd2d49ac9c9@butterbrot.org>
Date:   Tue, 28 Mar 2023 09:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Florian Echtler <floe@butterbrot.org>
Subject: Backtrace in media_pipeline_stop with bcm2835-unicam
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lq9VusEZ2UYZd6drCNWY53za"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lq9VusEZ2UYZd6drCNWY53za
Content-Type: multipart/mixed; boundary="------------7Q2pVhozHTOzO0DtLvpdtZ7E";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <d5bc46ad-0eb6-54f5-2e9e-7dd2d49ac9c9@butterbrot.org>
Subject: Backtrace in media_pipeline_stop with bcm2835-unicam

--------------7Q2pVhozHTOzO0DtLvpdtZ7E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsDQoNCkknbSBydW5uaW5nIGEgUmFzcGJlcnJ5IFBpIHdpdGggSFEg
Y2FtZXJhIGFzIHRpbWVsYXBzZSB3ZWJjYW0uIEV2ZXJ5dGhpbmcgc2VlbXMgDQp0byBiZSB3
b3JraW5nIGZpbmUsIHNvIHRoaXMgaXMgcHJvYmFibHkgcmVsYXRpdmVseSBsb3cgcHJpb3Jp
dHksIGJ1dCBJIHN0aWxsIA0Kd2FudGVkIHRvIG1lbnRpb24gdGhhdCBJJ20gZ2V0dGluZyB0
aGUgZm9sbG93aW5nIGJhY2t0cmFjZSBpbiANCm1lZGlhX3BpcGVsaW5lX3N0b3AgZm9yIGV2
ZXJ5IHBpY3R1cmUgdGFrZW4gd2l0aCBsaWJjYW1lcmE6DQoNClsyNDQ3MzEuMTcxMTc1XSAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NClsyNDQ3MzEuMTcxMjEwXSBX
QVJOSU5HOiBDUFU6IDAgUElEOiA5MDAgYXQgZHJpdmVycy9tZWRpYS9tYy9tYy1lbnRpdHku
Yzo4NzMgDQptZWRpYV9waXBlbGluZV9zdG9wKzB4MjgvMHgzNCBbbWNdDQpbMjQ0NzMxLjE3
MTQxN10gTW9kdWxlcyBsaW5rZWQgaW46IGNtYWMgYWxnaWZfaGFzaCBhZXNfYXJtIGFlc19n
ZW5lcmljIGVjYiANCmFsZ2lmX3NrY2lwaGVyIGFmX2FsZyBibmVwIGlteDQ3NyBoY2lfdWFy
dCBidGJjbSBibHVldG9vdGggYnJjbWZtYWMgZWNkaF9nZW5lcmljIA0KZWNjIGxpYmFlcyB2
YzQgYnJjbXV0aWwgc2hhMjU2X2dlbmVyaWMgbGlic2hhMjU2IHNuZF9zb2NfaGRtaV9jb2Rl
YyA4MDIxcSBnYXJwIA0Kc3RwIGxsYyBkcm1fZGlzcGxheV9oZWxwZXIgY2VjIGNmZzgwMjEx
IGRybV9kbWFfaGVscGVyIGRybV9rbXNfaGVscGVyIA0Kc25kX3NvY19jb3JlIGJjbTI4MzVf
dW5pY2FtIHNuZF9jb21wcmVzcyB2NGwyX2R2X3RpbWluZ3Mgc25kX3BjbV9kbWFlbmdpbmUg
DQpzeXNjb3B5YXJlYSB2NGwyX2Z3bm9kZSBzeXNmaWxscmVjdCBzeXNpbWdibHQgYmNtMjgz
NV9jb2RlYyhDKSBpMmNfbXV4X3BpbmN0cmwgDQpmYl9zeXNfZm9wcyBpMmNfbXV4IHJhc3Bi
ZXJyeXBpX2h3bW9uIHY0bDJfYXN5bmMgYmNtMjgzNV92NGwyKEMpIGJjbTI4MzVfaXNwKEMp
IA0KdjRsMl9tZW0ybWVtIGJjbTI4MzVfbW1hbF92Y2hpcShDKSByZmtpbGwgdmlkZW9idWYy
X3ZtYWxsb2MgdmlkZW9idWYyX2RtYV9jb250aWcgDQp2aWRlb2J1ZjJfbWVtb3BzIHZpZGVv
YnVmMl92NGwyIHZpZGVvYnVmMl9jb21tb24gc25kX2JjbTI4MzUoQykgdmlkZW9kZXYgc25k
X3BjbSANCnNuZF90aW1lciBpMmNfYmNtMjgzNSBzbmQgdmNfc21fY21hKEMpIG1jIHVpb19w
ZHJ2X2dlbmlycSB1aW8gZml4ZWQgZHJtIGZ1c2UgDQpkcm1fcGFuZWxfb3JpZW50YXRpb25f
cXVpcmtzIGJhY2tsaWdodCBpcF90YWJsZXMgeF90YWJsZXMgaXB2Ng0KWzI0NDczMS4xNzE4
MjldIENQVTogMCBQSUQ6IDkwMCBDb21tOiByYXNwYmVycnlfZmFrZWggVGFpbnRlZDogRyAg
ICAgICAgV0MgDQogICA2LjEuMTkrICMxNjM3DQpbMjQ0NzMxLjE3MTg0OF0gSGFyZHdhcmUg
bmFtZTogQkNNMjgzNQ0KWzI0NDczMS4xNzE4NjVdICB1bndpbmRfYmFja3RyYWNlIGZyb20g
c2hvd19zdGFjaysweDE4LzB4MWMNClsyNDQ3MzEuMTcxOTA0XSAgc2hvd19zdGFjayBmcm9t
IGR1bXBfc3RhY2tfbHZsKzB4MzQvMHg1OA0KWzI0NDczMS4xNzE5MzRdICBkdW1wX3N0YWNr
X2x2bCBmcm9tIF9fd2FybisweDdjLzB4ZjgNClsyNDQ3MzEuMTcxOTY3XSAgX193YXJuIGZy
b20gd2Fybl9zbG93cGF0aF9mbXQrMHg2MC8weGNjDQpbMjQ0NzMxLjE3MjAwMl0gIHdhcm5f
c2xvd3BhdGhfZm10IGZyb20gbWVkaWFfcGlwZWxpbmVfc3RvcCsweDI4LzB4MzQgW21jXQ0K
WzI0NDczMS4xNzIxNTBdICBtZWRpYV9waXBlbGluZV9zdG9wIFttY10gZnJvbSB1bmljYW1f
c3RvcF9zdHJlYW1pbmcrMHg4OC8weDE2OCANCltiY20yODM1X3VuaWNhbV0NClsyNDQ3MzEu
MTcyMzQzXSAgdW5pY2FtX3N0b3Bfc3RyZWFtaW5nIFtiY20yODM1X3VuaWNhbV0gZnJvbSAN
Cl9fdmIyX3F1ZXVlX2NhbmNlbCsweDMwLzB4Mjg0IFt2aWRlb2J1ZjJfY29tbW9uXQ0KWzI0
NDczMS4xNzI1NTRdICBfX3ZiMl9xdWV1ZV9jYW5jZWwgW3ZpZGVvYnVmMl9jb21tb25dIGZy
b20gDQp2YjJfY29yZV9zdHJlYW1vZmYrMHgyMC8weGI4IFt2aWRlb2J1ZjJfY29tbW9uXQ0K
WzI0NDczMS4xNzI3MzldICB2YjJfY29yZV9zdHJlYW1vZmYgW3ZpZGVvYnVmMl9jb21tb25d
IGZyb20gDQpfX3ZpZGVvX2RvX2lvY3RsKzB4MjI0LzB4NDU4IFt2aWRlb2Rldl0NClsyNDQ3
MzEuMTczNDYwXSAgX192aWRlb19kb19pb2N0bCBbdmlkZW9kZXZdIGZyb20gdmlkZW9fdXNl
cmNvcHkrMHgxMTgvMHg1NzQgDQpbdmlkZW9kZXZdDQpbMjQ0NzMxLjE3NDI2OF0gIHZpZGVv
X3VzZXJjb3B5IFt2aWRlb2Rldl0gZnJvbSBzeXNfaW9jdGwrMHgxMGMvMHg5MGMNClsyNDQ3
MzEuMTc0NzA1XSAgc3lzX2lvY3RsIGZyb20gcmV0X2Zhc3Rfc3lzY2FsbCsweDAvMHgxYw0K
WzI0NDczMS4xNzQ3MzJdIEV4Y2VwdGlvbiBzdGFjaygweGRjOTA1ZmE4IHRvIDB4ZGM5MDVm
ZjApDQpbMjQ0NzMxLjE3NDc1Ml0gNWZhMDogICAgICAgICAgICAgICAgICAgYTQzMTFlZjAg
YTQzMGQ2NWMgMDAwMDAwMGYgNDAwNDU2MTMgDQphNDMxMmYzMCAwMDAwMDAwMA0KWzI0NDcz
MS4xNzQ3NzBdIDVmYzA6IGE0MzExZWYwIGE0MzBkNjVjIGE0MzBkNjcwIDAwMDAwMDM2IDAy
MzhlNTY4IDAwMDAwMDAwIA0KYjZlOTAxMzQgMDIzOGU1MDgNClsyNDQ3MzEuMTc0NzgzXSA1
ZmUwOiBhNTJiOWQ0NCBhNGNjNzcwYyBhNTIzNzk0MCBiNmQwZGQ0Yw0KWzI0NDczMS4xNzQ3
OTVdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KDQpCZXN0LCBGbG9y
aWFuDQotLSANClNFTlQgRlJPTSBNWSBERUMgVlQ1MCBURVJNSU5BTA0K

--------------7Q2pVhozHTOzO0DtLvpdtZ7E--

--------------lq9VusEZ2UYZd6drCNWY53za
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCZCKaYAUDAAAAAAAKCRDsLPKyEa9q2PrF
AJ9nFBfKVa2ys6vfV3ZJ/927gK7TXwCg5p+kUVomqnSmqaqDG3Act9+3jAI=
=Ylvh
-----END PGP SIGNATURE-----

--------------lq9VusEZ2UYZd6drCNWY53za--
