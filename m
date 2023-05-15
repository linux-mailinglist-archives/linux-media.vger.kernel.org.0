Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD2B702D10
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 14:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241870AbjEOMtN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 08:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241613AbjEOMtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 08:49:12 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D89E49
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 05:49:04 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34FBu3Qu076485;
        Mon, 15 May 2023 06:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684151763;
        bh=WOQgnlvoO7WTMwYcgosl1MuNIRbcGWX/b0uV33N6bK0=;
        h=Date:To:CC:References:From:Subject:In-Reply-To;
        b=naK9ZikXoX7k1EuFTIAiVQAcujZ/7yFGOmjrBczirOTFruJq+DLP6qEON7YA4cU4b
         A7bJV5VRfNM4ASuIL4WWUI8JHYVihyT3q1ZU3nEY8t+Yi3cYjcuzM5a2bYv/OJc01M
         gr6a3JLSfRbUQvcItPyHIrUlTshjfWgqPeBdL42E=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34FBu3TL012453
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 May 2023 06:56:03 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 May 2023 06:56:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 May 2023 06:56:01 -0500
Received: from [172.24.145.240] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34FBtx9n085297;
        Mon, 15 May 2023 06:56:00 -0500
Message-ID: <52b0df19-ed9e-14cc-f9ab-e4a1d453524a@ti.com>
Date:   Mon, 15 May 2023 17:25:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        "Guoniu . zhou" <guoniu.zhou@nxp.com>
CC:     <slongerbeam@gmail.com>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
From:   Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
In-Reply-To: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="------------ko6Ve0tP000tqcE05pQBjls6"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--------------ko6Ve0tP000tqcE05pQBjls6
Content-Type: multipart/mixed; boundary="------------IUvaMhqQsdMUeo6i3h0auMWb";
 protected-headers="v1"
From: Jai Luthra <j-luthra@ti.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 "Guoniu . zhou" <guoniu.zhou@nxp.com>
Cc: slongerbeam@gmail.com, linux-media@vger.kernel.org, mchehab@kernel.org
Message-ID: <52b0df19-ed9e-14cc-f9ab-e4a1d453524a@ti.com>
Subject: Re: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>

--------------IUvaMhqQsdMUeo6i3h0auMWb
Content-Type: multipart/mixed; boundary="------------6B2XRWhcxMgJBKnSdFT7bd4g"

--------------6B2XRWhcxMgJBKnSdFT7bd4g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmFjb3BvLCBHdW9uaXUsDQoNCk9uIDA1LzA1LzIzIDEyOjQ2LCBKYWNvcG8gTW9uZGkg
d3JvdGU6DQo+IFdoaWxlIGxvb2tpbmcgYXQgR3Vvbml1IFpob3UgcGF0Y2hlcyBJIG5vdGlj
ZWQgdGhhdCB0aGVyZSB3ZXJlIGEgZmV3IGNsZWFudXBzDQo+IHJlbGF0ZWQgdG8gdGhlIHVz
YWdlIG9mIGZyYW1lX2ludGVydmFsIGZpbGVkcyBmb3IgTUlQSSBDU0ktMiBmcmFtZXJhdGUN
Cj4gY2FsY3VsYXRpb25zLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVk
LCBqdXN0IGNsZWFudXBzLg0KPiANCj4gR3Vvbml1OiBjb3VsZCB5b3UgcGxlYXNlIHRlc3Qg
dGhlc2Ugb24geW91ciBzZXR1cCBhcyB3ZWxsID8gQSB0ZXN0ZWQtYnkgdGFnDQo+IHdvdWxk
IGJlIHVzZWZ1bCENCj4gDQoNClRoYW5rcyBmb3IgdGhlIGxhdGVzdCBmaXhlcyENCg0KVGVz
dGluZyBvbiBteSBzZXR1cCAoQ1NJIG1vZHVsZSB3LyAyIGxhbmVzKSwgSSBub3RpY2UgdHdv
IHdlaXJkIGlzc3VlcyANCmFuZCB3b25kZXIgaWYgeW91IHNlZSB0aGUgc2FtZSBiZWhhdmlv
ciBvbiB5b3VyIHNldHVwcz8NCg0KSXNzdWUgMQ0KLS0tLS0tLQ0KDQpPbiBhIGZyZXNoIGJv
b3QgdGhlIHNlbnNvciBzdHJlYW1zIGF0IDYwZnBzLCBhbmQgY2hlY2tpbmcgbGlua19mcmVx
IGZyb20gDQp2NGwyLWN0bCBJIGdldCAzODRNaHouIEJ1dCBHX0ZSQU1FX0lOVEVSVkFMIHJl
dHVybnMgMzBGUFMgd2hlbiB1c2luZyANCmBtZWRpYS1jdGwgLXBgOg0KW3N0cmVhbTowIGZt
dDpVWVZZOF8xWDE2LzY0MHg0ODBAMS8zMF0NCg0KSXNzdWUgMg0KLS0tLS0tLQ0KDQpJZiBJ
IG1hbnVhbGx5IHNldCB0aGUgZnJhbWUgaW50ZXJ2YWwgdG8gQDEvNjAgdXNpbmcgbWVkaWEt
Y3RsLCBhbmQgdGhlbiANCnN0cmVhbSBpdCAtIGFjdHVhbCBmcmFtZXJhdGUgZ2V0cyByZWR1
Y2VkIHRvIDMwRlBTOg0KDQpyb290QGFtNjJ4eC1ldm06fiMgeWF2dGEgLXMgNjQweDQ4MCAt
ZiBVWVZZIC9kZXYvdmlkZW8wIC1jNQ0KLi4uLg0KMCAoMCkgWy1dIGFueSAwIDYxNDQwMCBC
IDQwMS40ODg3NTQgNDAxLjQ4ODg1NSAxMi43MTkgZnBzIHRzIG1vbm8vRW9GDQoxICgxKSBb
LV0gYW55IDEgNjE0NDAwIEIgNDAxLjUyMjA1NyA0MDEuNTIyMTQ3IDMwLjAyNyBmcHMgdHMg
bW9uby9Fb0YNCjIgKDIpIFstXSBhbnkgMiA2MTQ0MDAgQiA0MDEuNTU1NDM0IDQwMS41NTU1
ODQgMjkuOTYxIGZwcyB0cyBtb25vL0VvRg0KMyAoMykgWy1dIGFueSAzIDYxNDQwMCBCIDQw
MS41ODg3MjMgNDAxLjU4ODgxNCAzMC4wNDAgZnBzIHRzIG1vbm8vRW9GDQo0ICg0KSBbLV0g
YW55IDQgNjE0NDAwIEIgNDAxLjYyMjA1MSA0MDEuNjIyMTM1IDMwLjAwNSBmcHMgdHMgbW9u
by9Fb0YNCkNhcHR1cmVkIDUgZnJhbWVzIGluIDAuMjEyMDA1IHNlY29uZHMgKDIzLjU4NDI1
MiBmcHMsIDE0NDkwMTY0LjE0MDczMCBCL3MpLg0KOCBidWZmZXJzIHJlbGVhc2VkLg0KDQpB
ZnRlciBzZXR0aW5nIGZyYW1lIGludGVydmFsIHRvIEAxLzYwLCB0aGUgbGluay1mcmVxdWVu
Y3kgZ290IHJlZHVjZWQgdG8gDQoxOTJNaHosIHdoaWNoIHByb2JhYmx5IGV4cGxhaW5zIHRo
ZSBsb3cgZnJhbWVyYXRlLg0KDQpyb290QGFtNjJ4eC1ldm06fiMgdjRsMi1jdGwgLWQgL2Rl
di92NGwtc3ViZGV2MiAtQyBsaW5rX2ZyZXF1ZW5jeQ0KbGlua19mcmVxdWVuY3k6IDE5ICgx
OTIwMDAwMDAgMHhiNzFiMDAwKQ0KDQpJIHdpbGwgdGFrZSBhIGRlZXBlciBsb29rIGF0IHVw
ZGF0ZV9waXhlbF9yYXRlKCkgZnVuY3Rpb24gdG8gdHJ5IGFuZCBmaXggDQp0aGlzIC0gYnV0
IHdhbnRlZCB0byBjb25maXJtIGlmIHRoaXMgYWxzbyBoYXBwZW5zIG9uIHlvdXIgQ1NJIHNl
bnNvcnM/DQoNCkkgYWxzbyByZXBlYXRlZCBzYW1lIHRlc3RzIHdpdGhvdXQgdGhpcyBzZXJp
ZXMgYW5kIHN0aWxsIHNhdyBib3RoIA0KaXNzdWVzLiBJbiBmYWN0IElzc3VlIDIgd2FzIHdv
cnNlIGJlY2F1c2UgdGhlIHNlbnNvciBkaWQgbm90IHN0cmVhbSAqYXQgDQphbGwqIGlmIEkg
Y2hhbmdlZCBmcmFtZSBpbnRlcnZhbCB0byBAMS82MC4gTXkgZ3Vlc3MgaXMgUEFUQ0ggMi8y
IGZpeGVzIA0KdGhhdCBieSBub3QgdXBkYXRpbmcgdGhlIFZCTEFOSyB1c2luZyB0aGUgRFZQ
IHZhbHVlcy4NCg0KRm9yIHRoZSBzZXJpZXM6DQoNClRlc3RlZC1ieTogSmFpIEx1dGhyYSA8
ai1sdXRocmFAdGkuY29tPg0KDQpUaGFua3MsDQpKYWkNCg0KPiBUaGFua3MNCj4gICAgag0K
PiANCj4gSmFjb3BvIE1vbmRpICgyKToNCj4gICAgbWVkaWE6IG92NTY0MDogUmVtb3ZlIHVu
dXNlZCAnZnJhbWVyYXRlJyBwYXJhbWV0ZXINCj4gICAgbWVkaWE6IG92NTY0MDogRHJvcCBk
ZWFkIGNvZGUgdXNpbmcgZnJhbWVfaW50ZXJ2YWwNCj4gDQo+ICAgZHJpdmVycy9tZWRpYS9p
MmMvb3Y1NjQwLmMgfCAxNyArLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjQwLjEN
Cj4gDQo=
--------------6B2XRWhcxMgJBKnSdFT7bd4g
Content-Type: application/pgp-keys; name="OpenPGP_0x43DE91F9249A7145.asc"
Content-Disposition: attachment; filename="OpenPGP_0x43DE91F9249A7145.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3Ded/y
-----END PGP PUBLIC KEY BLOCK-----

--------------6B2XRWhcxMgJBKnSdFT7bd4g--

--------------IUvaMhqQsdMUeo6i3h0auMWb--

--------------ko6Ve0tP000tqcE05pQBjls6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmRiHcsACgkQQ96R+SSa
cUVmVQ/8CPk3cZw4l+jkssV90dh7gHLIaS8VJdanoz7VPyVbPX36Ap8UxmL6reWm
gZCPxdgt6YPUlYDB0PbzafywLxmgnSP2ehn1E5lRsXNncdwWGp2PAptd9S5TM66L
2FHeGktkf3Wu3w5SITAVCJ/wE9J78Fb9FLc+6X1iMK5XI4EZa+Y97bXAf3AKNo2A
ulgdFIhAAYEzG2d/oj46xyfDNrYdvhX/3TzTTESgiXjbX4b6F2+Q4p6vEiIqyPCx
1Vxl6Jlz7fMInjbX2al8ZVTnyaqzJgDmz0+l3oEsOvPmwpCQM+/Ing6sswB9XKZa
2wvdN05a4UbnuuuCIcQmOYwDll5/x625fgZSklS8BIEdk38mDxPS36qBRmFRVZLU
VqHVLgGwC0GWpJi7hPI5hhFGyOCJS7TdeDmNE1TaBtXAZe0m7FvXSqtzivMDwRc4
AnGCYsX3HeeEgnWmh7V3jDX6BO30hn+dAEOPuSA9f+E/kNJlZvIT9no0mC8NauJG
s3rm3uUFRl2f5xOFLS2tVn299tQiSRpLBM5BrqerQGOCO9FXTq2hYyURMKKC9WcY
CEzy9Nr6kqIdIgPrh58pra3vNoU5+GYTNG6keBw36zQOI+L7ITRQlKHtfAHjKlaT
K0Ibu/l/kDQ6xdkHCiDJLZMNXGPtlLGG2dwGCMfpqIXIY2eUQuI=
=22iL
-----END PGP SIGNATURE-----

--------------ko6Ve0tP000tqcE05pQBjls6--
