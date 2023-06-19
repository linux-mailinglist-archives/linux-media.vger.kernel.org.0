Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18877735775
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 14:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbjFSM7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 08:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbjFSM7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 08:59:24 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B873CE59;
        Mon, 19 Jun 2023 05:59:18 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 514AB1F38D;
        Mon, 19 Jun 2023 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687179557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lh6+S70S7hDPsJhFi3PjcsEGEjl78RapUhLKqahhnKw=;
        b=cGenO0lcQqIONtQ198ItAFZJ7+02dXMKD6JRKJLMlpaKINQhRx2lQTpf0l3JcevaxaFNTZ
        IF65EQm9zRXXZIcsQkT7fnARGoVHrLlHytFKdEvMsMPP/gExhX5tyfuhfaXen2GWZZPA6W
        s05LLbVDkjEjjjwkXzMxWGy9fmMxGTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687179557;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lh6+S70S7hDPsJhFi3PjcsEGEjl78RapUhLKqahhnKw=;
        b=IUn1L9uMqMh2tSUg0Ln0uDrgHLG47K3fblBeeCuOY277A0VN8hhcyoIa4pEUwdvqZqZcjz
        yEtpthuomi9TutAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D69FE139C2;
        Mon, 19 Jun 2023 12:59:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id HeGDMyRRkGSWfgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 12:59:16 +0000
Message-ID: <ab470eee-1b0c-ff8b-bcab-60de1ea04e39@suse.de>
Date:   Mon, 19 Jun 2023 14:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/9] drm/verisilicon: Add basic drm driver
Content-Language: en-US
To:     Keith Zhao <keith.zhao@starfivetech.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Shengyang Chen <shengyang.chen@starfivetech.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jagan Teki <jagan@edgeble.ai>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Changhuang Liang <changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-4-keith.zhao@starfivetech.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230602074043.33872-4-keith.zhao@starfivetech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5lnXIhPfI19x1b10ec8xdd9x"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5lnXIhPfI19x1b10ec8xdd9x
Content-Type: multipart/mixed; boundary="------------mjx4RIYHOndW9g7lUYt0Hgum";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Message-ID: <ab470eee-1b0c-ff8b-bcab-60de1ea04e39@suse.de>
Subject: Re: [PATCH 3/9] drm/verisilicon: Add basic drm driver
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-4-keith.zhao@starfivetech.com>
In-Reply-To: <20230602074043.33872-4-keith.zhao@starfivetech.com>

--------------mjx4RIYHOndW9g7lUYt0Hgum
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgYXBwcmVjaWF0ZSB0aGF0IHlvdSBzcGxpdCB0aGUgZHJpdmVyIGludG8gc21h
bGwgcGF0Y2hlcy4gUGxlYXNlIGZpbmQgDQpzb21lIGNvbW1lbnRzIGJlbG93Lg0KDQpBbSAw
Mi4wNi4yMyB1bSAwOTo0MCBzY2hyaWViIEtlaXRoIFpoYW86DQo+IEFkZCBhIGJhc2ljIHBs
YXRmb3JtIGRyaXZlciBvZiB0aGUgRFJNIGRyaXZlciBmb3IgSkg3MTEwIFNvQy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEtlaXRoIFpoYW8gPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNv
bT4NCj4gLS0tDQo+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAyICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgfCAgIDIg
Kw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArDQo+
ICAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL0tjb25maWcgIHwgIDEzICsrDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL01ha2VmaWxlIHwgICA2ICsNCj4gICBkcml2
ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJ2LmMgfCAyODQgKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2Rydi5o
IHwgIDQ4ICsrKysrDQo+ICAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggICAgICAg
IHwgIDgzICsrKysrKysrDQo+ICAgaW5jbHVkZS91YXBpL2RybS92c19kcm0uaCAgICAgICAg
ICAgIHwgIDUwICsrKysrDQo+ICAgOSBmaWxlcyBjaGFuZ2VkLCA0ODkgaW5zZXJ0aW9ucygr
KQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24v
S2NvbmZpZw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNp
bGljb24vTWFrZWZpbGUNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3ZlcmlzaWxpY29uL3ZzX2Rydi5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS92ZXJpc2lsaWNvbi92c19kcnYuaA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBp
bmNsdWRlL3VhcGkvZHJtL3ZzX2RybS5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5F
UlMgYi9NQUlOVEFJTkVSUw0KPiBpbmRleCAyOTNhYTEzZDQ4NGMuLmRhNWI2NzY2YTdiYiAx
MDA2NDQNCj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAg
LTcwNTUsNiArNzA1NSw4IEBAIEw6CWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gICBTOglNYWludGFpbmVkDQo+ICAgVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0
b3Aub3JnL2RybS9kcm0tbWlzYw0KPiAgIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLw0KPiArRjoJZHJpdmVycy9ncHUvZHJtL3Zl
cmlzaWxpY29uLw0KPiArRjoJaW5jbHVkZS91YXBpL2RybS92c19kcm0uaA0KPiAgIA0KPiAg
IERSTSBEUklWRVJTIEZPUiBWSVZBTlRFIEdQVSBJUA0KPiAgIE06CUx1Y2FzIFN0YWNoIDxs
LnN0YWNoQHBlbmd1dHJvbml4LmRlPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPiBpbmRleCBiYTNmYjA0YmI2
OTEuLmY3ZTQ2MWZhNDY1NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25m
aWcNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4gQEAgLTM3MSw2ICszNzEs
OCBAQCBzb3VyY2UgImRyaXZlcnMvZ3B1L2RybS9zb2xvbW9uL0tjb25maWciDQo+ICAgDQo+
ICAgc291cmNlICJkcml2ZXJzL2dwdS9kcm0vc3ByZC9LY29uZmlnIg0KPiAgIA0KPiArc291
cmNlICJkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vS2NvbmZpZyINCj4gKw0KPiAgIGNv
bmZpZyBEUk1fSFlQRVJWDQo+ICAgCXRyaXN0YXRlICJEUk0gU3VwcG9ydCBmb3IgSHlwZXIt
ViBzeW50aGV0aWMgdmlkZW8gZGV2aWNlIg0KPiAgIAlkZXBlbmRzIG9uIERSTSAmJiBQQ0kg
JiYgTU1VICYmIEhZUEVSVg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL01ha2Vm
aWxlIGIvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlDQo+IGluZGV4IGEzMzI1N2QyYmM3Zi4u
ZTUwNjIyZWU0ZTQ2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlDQo+IEBAIC0xOTQsMyArMTk0LDQg
QEAgb2JqLXkJCQkrPSBndWQvDQo+ICAgb2JqLSQoQ09ORklHX0RSTV9IWVBFUlYpICs9IGh5
cGVydi8NCj4gICBvYmoteQkJCSs9IHNvbG9tb24vDQo+ICAgb2JqLSQoQ09ORklHX0RSTV9T
UFJEKSArPSBzcHJkLw0KPiArb2JqLSQoQ09ORklHX0RSTV9WRVJJU0lMSUNPTikgKz0gdmVy
aXNpbGljb24vDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24v
S2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9LY29uZmlnDQo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uODlkMTIxODVmNzNiDQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL0tj
b25maWcNCj4gQEAgLTAsMCArMSwxMyBAQA0KPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiArDQo+ICtjb25maWcgRFJNX1ZFUklTSUxJQ09ODQo+ICsJdHJpc3Rh
dGUgIkRSTSBTdXBwb3J0IGZvciBWZXJpU2lsaWNvbiINCg0KQ2FuIHlvdSByZW5hbWUgdGhl
IGRyaXZlciBhbmQgZmlsZXM/ICdWZXJpU2lsaWNvbicgc2VlbXMgDQp1bnByb25vdW5jZWFi
bGUuIFNpbXBseSAnU3RhckZpdmUnIGFuZCBzdGFyZml2ZS8gd291bGQgYmUgZmluZS4NCg0K
PiArCWRlcGVuZHMgb24gRFJNDQo+ICsJc2VsZWN0IERSTV9LTVNfSEVMUEVSDQo+ICsJc2Vs
ZWN0IENNQQ0KPiArCXNlbGVjdCBETUFfQ01BDQo+ICsJaGVscA0KPiArCSAgQ2hvb3NlIHRo
aXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEgVmVyaVNpbGljb24gc29jIGNoaXBzZXQuDQo+ICsJ
ICBUaGlzIGRyaXZlciBwcm92aWRlcyBWZXJpU2lsaWNvbiBrZXJuZWwgbW9kZQ0KPiArCSAg
c2V0dGluZyBhbmQgYnVmZmVyIG1hbmFnZW1lbnQuIEl0IGRvZXMgbm90DQo+ICsJICBwcm92
aWRlIDJEIG9yIDNEIGFjY2VsZXJhdGlvbi4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNv
bi9NYWtlZmlsZQ0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjY0Y2UxYjI2NTQ2Yw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZQ0KPiBAQCAtMCwwICsxLDYgQEANCj4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKw0KPiArdnNfZHJtLW9ianMgOj0g
dnNfZHJ2Lm8NCj4gKw0KPiArb2JqLSQoQ09ORklHX0RSTV9WRVJJU0lMSUNPTikgKz0gdnNf
ZHJtLm8NCj4gKw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29u
L3ZzX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2Rydi5jDQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjRkMzMzNTk4NDc3
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29u
L3ZzX2Rydi5jDQo+IEBAIC0wLDAgKzEsMjg0IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBWZXJp
U2lsaWNvbiBIb2xkaW5ncyBDby4sIEx0ZC4NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8
bGludXgvY2xrLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvY29tcG9uZW50Lmg+DQo+ICsjaW5j
bHVkZSA8bGludXgvZGVsYXkuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2Zf
Z3JhcGguaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vZl9yZXNlcnZlZF9tZW0uaD4NCj4gKyNp
bmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvcmVzZXQu
aD4NCj4gKyNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+DQo+ICsNCj4gKyNpbmNsdWRlIDxk
cm0vZHJtX2FwZXJ0dXJlLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+DQo+ICsj
aW5jbHVkZSA8ZHJtL2RybV9jcnRjX2hlbHBlci5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1f
ZGVidWdmcy5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+DQo+ICsjaW5jbHVkZSA8
ZHJtL2RybV9mYl9oZWxwZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2ZiZGV2X2dlbmVy
aWMuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4NCj4gKyNpbmNsdWRlIDxkcm0v
ZHJtX2ZvdXJjYy5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4NCj4gKyNpbmNs
dWRlIDxkcm0vZHJtX29mLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcmltZS5oPg0KPiAr
I2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV92YmxhbmsuaD4NCj4gKw0KPiArI2luY2x1ZGUgInZzX2Rydi5oIg0KPiArDQo+ICsjZGVm
aW5lIERSVl9OQU1FCSJzdGFyZml2ZSINCj4gKyNkZWZpbmUgRFJWX0RFU0MJIlN0YXJmaXZl
IERSTSBkcml2ZXIiDQo+ICsjZGVmaW5lIERSVl9EQVRFCSIyMDIzMDUxNjEiDQo+ICsjZGVm
aW5lIERSVl9NQUpPUgkxDQo+ICsjZGVmaW5lIERSVl9NSU5PUgkwDQo+ICsNCj4gK3N0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHZzX2RybV9wbGF0Zm9ybV9kcml2ZXI7DQo+ICsN
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGZvcHMgPSB7DQo+ICsJ
Lm93bmVyCQkJPSBUSElTX01PRFVMRSwNCj4gKwkub3BlbgkJCT0gZHJtX29wZW4sDQo+ICsJ
LnJlbGVhc2UJCT0gZHJtX3JlbGVhc2UsDQo+ICsJLnVubG9ja2VkX2lvY3RsCT0gZHJtX2lv
Y3RsLA0KPiArCS5jb21wYXRfaW9jdGwJPSBkcm1fY29tcGF0X2lvY3RsLA0KPiArCS5wb2xs
CQkJPSBkcm1fcG9sbCwNCj4gKwkucmVhZAkJCT0gZHJtX3JlYWQsDQo+ICt9Ow0KPiArDQo+
ICtzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgdnNfZHJtX2RyaXZlciA9IHsNCj4gKwkuZHJp
dmVyX2ZlYXR1cmVzCT0gRFJJVkVSX01PREVTRVQgfCBEUklWRVJfQVRPTUlDIHwgRFJJVkVS
X0dFTSwNCj4gKwkubGFzdGNsb3NlCQk9IGRybV9mYl9oZWxwZXJfbGFzdGNsb3NlLA0KPiAr
CS5wcmltZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwNCj4g
KwkucHJpbWVfZmRfdG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsDQo+
ICsJLmZvcHMJCQk9ICZmb3BzLA0KPiArCS5uYW1lCQkJPSBEUlZfTkFNRSwNCj4gKwkuZGVz
YwkJCT0gRFJWX0RFU0MsDQo+ICsJLmRhdGUJCQk9IERSVl9EQVRFLA0KPiArCS5tYWpvcgkJ
CT0gRFJWX01BSk9SLA0KPiArCS5taW5vcgkJCT0gRFJWX01JTk9SLA0KPiArfTsNCj4gKw0K
PiArdm9pZCB2c19kcm1fdXBkYXRlX3BpdGNoX2FsaWdubWVudChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtX2RldiwNCj4gKwkJCQkgICB1bnNpZ25lZCBpbnQgYWxpZ25tZW50KQ0KPiArew0K
PiArCXN0cnVjdCB2c19kcm1fcHJpdmF0ZSAqcHJpdiA9IGRybV9kZXYtPmRldl9wcml2YXRl
Ow0KPiArDQo+ICsJaWYgKGFsaWdubWVudCA+IHByaXYtPnBpdGNoX2FsaWdubWVudCkNCj4g
KwkJcHJpdi0+cGl0Y2hfYWxpZ25tZW50ID0gYWxpZ25tZW50Ow0KPiArfQ0KPiArDQo+ICtz
dGF0aWMgaW50IHZzX2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3sNCj4gKwlz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldjsNCj4gKwlzdHJ1Y3QgdnNfZHJtX3ByaXZhdGUg
KnByaXY7DQo+ICsJaW50IHJldDsNCj4gKwlzdGF0aWMgdTY0IGRtYV9tYXNrID0gRE1BX0JJ
VF9NQVNLKDQwKTsNCj4gKw0KPiArCS8qIFJlbW92ZSBleGlzdGluZyBkcml2ZXJzIHRoYXQg
bWF5IG93biB0aGUgZnJhbWVidWZmZXIgbWVtb3J5LiAqLw0KPiArCXJldCA9IGRybV9hcGVy
dHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKGZhbHNlLCAmdnNfZHJtX2RyaXZlcik7DQo+ICsJ
aWYgKHJldCkgew0KPiArCQlEUk1fREVWX0VSUk9SKGRldiwNCg0KZHJtX2VycigpLCBkcm1f
aW5mbygpLCBkcm1fd2FybigpLCBldGMuICBIZXJlIGFuZCBldmVyd2hlcmUgZWxzZS4gVGhl
IA0KRFJNX0RFVl8qKCkgcHJpbnQgbWFjcm9zIGFyZSBvYnNvbGV0ZS4NCg0KPiArCQkJICAg
ICAgIkZhaWxlZCB0byByZW1vdmUgZXhpc3RpbmcgZnJhbWVidWZmZXJzIC0gJWQuXG4iLA0K
PiArCQkJICAgICAgcmV0KTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwlk
cm1fZGV2ID0gZHJtX2Rldl9hbGxvYygmdnNfZHJtX2RyaXZlciwgZGV2KTsNCj4gKwlpZiAo
SVNfRVJSKGRybV9kZXYpKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihkcm1fZGV2KTsNCj4gKw0K
PiArCWRldl9zZXRfZHJ2ZGF0YShkZXYsIGRybV9kZXYpOw0KPiArDQo+ICsJcHJpdiA9IGRl
dm1fa3phbGxvYyhkcm1fZGV2LT5kZXYsIHNpemVvZihzdHJ1Y3QgdnNfZHJtX3ByaXZhdGUp
LA0KPiArCQkJICAgIEdGUF9LRVJORUwpOw0KPiArCWlmICghcHJpdikgew0KPiArCQlyZXQg
PSAtRU5PTUVNOw0KPiArCQlnb3RvIGVycl9wdXRfZGV2Ow0KPiArCX0NCj4gKw0KPiArCXBy
aXYtPnBpdGNoX2FsaWdubWVudCA9IDY0Ow0KPiArCXByaXYtPmRtYV9kZXYgPSBkcm1fZGV2
LT5kZXY7DQo+ICsJcHJpdi0+ZG1hX2Rldi0+Y29oZXJlbnRfZG1hX21hc2sgPSBkbWFfbWFz
azsNCj4gKwlkcm1fZGV2LT5kZXZfcHJpdmF0ZSA9IHByaXY7DQoNCmRldl9wcml2YXRlIGlz
IG9ic29sZXRlIGFuZCBhYm91dCB0byBnbyBhd2F5IGF0IHNvbWUgcG9pbnQuDQoNClBsZWFz
ZSBlbWJlZCBkcm1fZGV2aWNlIGluIHZzX2RybV9wcml2YXRlIGFuZCBhbGxvY2F0ZSB0aGUg
bWVtb3J5IHdpdGggDQpkZXZtX2RybV9kZXZfYWxsb2MoKS4NCg0KPiArDQo+ICsJZHJtX21v
ZGVfY29uZmlnX2luaXQoZHJtX2Rldik7DQoNCmRybW1fbW9kZV9jb25maWdfaW5pdCgpIHBs
ZWFzZS4NCg0KPiArDQo+ICsJLyogTm93IHRyeSBhbmQgYmluZCBhbGwgb3VyIHN1Yi1jb21w
b25lbnRzICovDQo+ICsJcmV0ID0gY29tcG9uZW50X2JpbmRfYWxsKGRldiwgZHJtX2Rldik7
DQo+ICsJaWYgKHJldCkNCj4gKwkJZ290byBlcnJfbW9kZTsNCj4gKw0KPiArCXJldCA9IGRy
bV92YmxhbmtfaW5pdChkcm1fZGV2LCBkcm1fZGV2LT5tb2RlX2NvbmZpZy5udW1fY3J0Yyk7
DQo+ICsJaWYgKHJldCkNCj4gKwkJZ290byBlcnJfYmluZDsNCj4gKw0KPiArCWRybV9tb2Rl
X2NvbmZpZ19yZXNldChkcm1fZGV2KTsNCj4gKw0KPiArCWRybV9rbXNfaGVscGVyX3BvbGxf
aW5pdChkcm1fZGV2KTsNCj4gKw0KPiArCXJldCA9IGRybV9kZXZfcmVnaXN0ZXIoZHJtX2Rl
diwgMCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJZ290byBlcnJfaGVscGVyOw0KPiArDQo+ICsJ
ZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZHJtX2RldiwgMzIpOw0KPiArDQo+ICsJcmV0dXJu
IDA7DQo+ICsNCj4gK2Vycl9oZWxwZXI6DQo+ICsJZHJtX2ttc19oZWxwZXJfcG9sbF9maW5p
KGRybV9kZXYpOw0KPiArZXJyX2JpbmQ6DQo+ICsJY29tcG9uZW50X3VuYmluZF9hbGwoZHJt
X2Rldi0+ZGV2LCBkcm1fZGV2KTsNCj4gK2Vycl9tb2RlOg0KPiArCWRybV9tb2RlX2NvbmZp
Z19jbGVhbnVwKGRybV9kZXYpOw0KPiArCWlmIChwcml2LT5kb21haW4pDQo+ICsJCWlvbW11
X2RvbWFpbl9mcmVlKHByaXYtPmRvbWFpbik7DQo+ICtlcnJfcHV0X2RldjoNCj4gKwlkcm1f
ZGV2LT5kZXZfcHJpdmF0ZSA9IE5VTEw7DQo+ICsJZGV2X3NldF9kcnZkYXRhKGRldiwgTlVM
TCk7DQo+ICsJZHJtX2Rldl9wdXQoZHJtX2Rldik7DQo+ICsJcmV0dXJuIHJldDsNCj4gK30N
Cj4gKw0KPiArc3RhdGljIHZvaWQgdnNfZHJtX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYp
DQo+ICt7DQo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsNCj4gKwlzdHJ1Y3QgdnNfZHJtX3ByaXZhdGUgKnByaXYgPSBkcm1fZGV2LT5k
ZXZfcHJpdmF0ZTsNCj4gKw0KPiArCWRybV9kZXZfdW5yZWdpc3Rlcihkcm1fZGV2KTsNCj4g
Kw0KPiArCWRybV9rbXNfaGVscGVyX3BvbGxfZmluaShkcm1fZGV2KTsNCj4gKw0KPiArCWNv
bXBvbmVudF91bmJpbmRfYWxsKGRybV9kZXYtPmRldiwgZHJtX2Rldik7DQo+ICsNCj4gKwlk
cm1fbW9kZV9jb25maWdfY2xlYW51cChkcm1fZGV2KTsNCj4gKw0KPiArCWlmIChwcml2LT5k
b21haW4pIHsNCj4gKwkJaW9tbXVfZG9tYWluX2ZyZWUocHJpdi0+ZG9tYWluKTsNCj4gKwkJ
cHJpdi0+ZG9tYWluID0gTlVMTDsNCj4gKwl9DQo+ICsNCj4gKwlkcm1fZGV2LT5kZXZfcHJp
dmF0ZSA9IE5VTEw7DQo+ICsJZGV2X3NldF9kcnZkYXRhKGRldiwgTlVMTCk7DQo+ICsJZHJt
X2Rldl9wdXQoZHJtX2Rldik7DQoNCllvdSByYXRoZXIgd2FudCB0byBjb252ZXJ0IHRoZSBp
bmRpdmlkdWFsIHN0ZXBzIG9mIHRoaXMgY2xlYW51cCB0byANCm1hbmFnZWQgZnVuY3Rpb25z
IChkcm1tXyBhbmQgZGV2bV8pIHRvIGF1dG9tYXRlIHRoZSBjbGVhbnVwIHdoZW4gYXMgcGFy
dCANCm9mIGRybV9kZXZfcHV0KCkuDQoNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBjb21wb25lbnRfbWFzdGVyX29wcyB2c19kcm1fb3BzID0gew0KPiArCS5iaW5kID0g
dnNfZHJtX2JpbmQsDQo+ICsJLnVuYmluZCA9IHZzX2RybV91bmJpbmQsDQo+ICt9Ow0KPiAr
DQo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciAqZHJtX3N1Yl9kcml2ZXJzW10g
PSB7DQo+ICt9Ow0KPiArDQo+ICsjZGVmaW5lIE5VTV9EUk1fRFJJVkVSUyBcDQo+ICsJKHNp
emVvZihkcm1fc3ViX2RyaXZlcnMpIC8gc2l6ZW9mKHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
KikpDQoNCkRvZXMgdGhpcyByZWFsbHkgd29yaz8gc2l6ZW9mKGRybV9zdWJfZHJpdmVycykg
aXNuJ3Qga25vdyBhdCBjb21waWxlIA0KdGltZS4gSXQgaXMgYWx3YXlzIGFzc3VtZWQgdG8g
YmUgMCBBRkFJQ1QuIE9yIGRvIHlvdSBmaWxsIHRoaXMgYXJyYXkgaW4gDQpsYXRlciBwYXRj
aGVzPw0KDQoNCj4gKw0KPiArc3RhdGljIGludCBjb21wYXJlX2RldihzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEpDQo+ICt7DQo+ICsJcmV0dXJuIGRldiA9PSAoc3RydWN0IGRl
dmljZSAqKWRhdGE7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgY29tcG9uZW50X21h
dGNoICp2c19kcm1fbWF0Y2hfYWRkKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3sNCj4gKwlz
dHJ1Y3QgY29tcG9uZW50X21hdGNoICptYXRjaCA9IE5VTEw7DQo+ICsJaW50IGk7DQo+ICsN
Cj4gKwlmb3IgKGkgPSAwOyBpIDwgTlVNX0RSTV9EUklWRVJTOyArK2kpIHsNCj4gKwkJc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciAqZHJ2ID0gZHJtX3N1Yl9kcml2ZXJzW2ldOw0KPiArCQlz
dHJ1Y3QgZGV2aWNlICpwID0gTlVMTCwgKmQ7DQo+ICsNCj4gKwkJd2hpbGUgKChkID0gcGxh
dGZvcm1fZmluZF9kZXZpY2VfYnlfZHJpdmVyKHAsICZkcnYtPmRyaXZlcikpKSB7DQo+ICsJ
CQlwdXRfZGV2aWNlKHApOw0KPiArDQo+ICsJCQljb21wb25lbnRfbWF0Y2hfYWRkKGRldiwg
Jm1hdGNoLCBjb21wYXJlX2RldiwgZCk7DQo+ICsJCQlwID0gZDsNCj4gKwkJfQ0KPiArCQlw
dXRfZGV2aWNlKHApOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiBtYXRjaCA/OiBFUlJfUFRS
KC1FTk9ERVYpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IHZzX2RybV9wbGF0Zm9ybV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiArCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsJc3RydWN0IGNvbXBvbmVudF9tYXRjaCAq
bWF0Y2g7DQo+ICsNCj4gKwltYXRjaCA9IHZzX2RybV9tYXRjaF9hZGQoZGV2KTsNCj4gKwlp
ZiAoSVNfRVJSKG1hdGNoKSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIobWF0Y2gpOw0KPiArDQo+
ICsJcmV0dXJuIGNvbXBvbmVudF9tYXN0ZXJfYWRkX3dpdGhfbWF0Y2goZGV2LCAmdnNfZHJt
X29wcywgbWF0Y2gpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IHZzX2RybV9wbGF0Zm9y
bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3sNCj4gKwljb21w
b25lbnRfbWFzdGVyX2RlbCgmcGRldi0+ZGV2LCAmdnNfZHJtX29wcyk7DQo+ICsJcmV0dXJu
IDA7DQo+ICt9DQo+ICsNCj4gKyNpZmRlZiBDT05GSUdfUE1fU0xFRVANCj4gK3N0YXRpYyBp
bnQgdnNfZHJtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCXN0cnVj
dCBkcm1fZGV2aWNlICpkcm0gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKw0KPiArCXJl
dHVybiBkcm1fbW9kZV9jb25maWdfaGVscGVyX3N1c3BlbmQoZHJtKTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIGludCB2c19kcm1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3sN
Cj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+
ICsNCj4gKwlyZXR1cm4gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9yZXN1bWUoZHJtKTsNCj4g
K30NCj4gKyNlbmRpZg0KPiArDQo+ICtzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFModnNfZHJt
X3BtX29wcywgdnNfZHJtX3N1c3BlbmQsIHZzX2RybV9yZXN1bWUpOw0KPiArDQo+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB2c19kcm1fZHRfaWRzW10gPSB7DQo+ICsJ
eyAuY29tcGF0aWJsZSA9ICJ2ZXJpc2lsaWNvbixkaXNwbGF5LXN1YnN5c3RlbSIsIH0sDQo+
ICt9Ow0KPiArDQo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCB2c19kcm1fZHRfaWRzKTsN
Cj4gKw0KPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdnNfZHJtX3BsYXRmb3Jt
X2RyaXZlciA9IHsNCj4gKwkucHJvYmUgPSB2c19kcm1fcGxhdGZvcm1fcHJvYmUsDQo+ICsJ
LnJlbW92ZSA9IHZzX2RybV9wbGF0Zm9ybV9yZW1vdmUsDQo+ICsNCj4gKwkuZHJpdmVyID0g
ew0KPiArCQkubmFtZSA9IERSVl9OQU1FLA0KPiArCQkub2ZfbWF0Y2hfdGFibGUgPSB2c19k
cm1fZHRfaWRzLA0KPiArCQkucG0gPSAmdnNfZHJtX3BtX29wcywNCj4gKwl9LA0KPiArfTsN
Cj4gKw0KPiArc3RhdGljIGludCBfX2luaXQgdnNfZHJtX2luaXQodm9pZCkNCj4gK3sNCj4g
KwlpbnQgcmV0Ow0KPiArDQo+ICsJcmV0ID0gcGxhdGZvcm1fcmVnaXN0ZXJfZHJpdmVycyhk
cm1fc3ViX2RyaXZlcnMsIE5VTV9EUk1fRFJJVkVSUyk7DQo+ICsJaWYgKHJldCkNCj4gKwkJ
cmV0dXJuIHJldDsNCj4gKw0KPiArCXJldCA9IHBsYXRmb3JtX2RyaXZlcl9yZWdpc3Rlcigm
dnNfZHJtX3BsYXRmb3JtX2RyaXZlcik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcGxhdGZvcm1f
dW5yZWdpc3Rlcl9kcml2ZXJzKGRybV9zdWJfZHJpdmVycywgTlVNX0RSTV9EUklWRVJTKTsN
Cj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIF9fZXhp
dCB2c19kcm1fZmluaSh2b2lkKQ0KPiArew0KPiArCXBsYXRmb3JtX2RyaXZlcl91bnJlZ2lz
dGVyKCZ2c19kcm1fcGxhdGZvcm1fZHJpdmVyKTsNCj4gKwlwbGF0Zm9ybV91bnJlZ2lzdGVy
X2RyaXZlcnMoZHJtX3N1Yl9kcml2ZXJzLCBOVU1fRFJNX0RSSVZFUlMpOw0KPiArfQ0KPiAr
DQo+ICttb2R1bGVfaW5pdCh2c19kcm1faW5pdCk7DQo+ICttb2R1bGVfZXhpdCh2c19kcm1f
ZmluaSk7DQo+ICsNCj4gK01PRFVMRV9ERVNDUklQVElPTigiVmVyaVNpbGljb24gRFJNIERy
aXZlciIpOw0KPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3Zl
cmlzaWxpY29uL3ZzX2Rydi5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uMDM4MmI0NGUzYmYwDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2Rydi5oDQo+IEBAIC0wLDAgKzEsNDggQEAN
Cj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQo+ICsvKg0KPiAr
ICogQ29weXJpZ2h0IChDKSAyMDIzIFZlcmlTaWxpY29uIEhvbGRpbmdzIENvLiwgTHRkLg0K
PiArICovDQo+ICsNCj4gKyNpZm5kZWYgX19WU19EUlZfSF9fDQo+ICsjZGVmaW5lIF9fVlNf
RFJWX0hfXw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICsjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvdmVyc2lv
bi5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9nZW0uaD4NCj4gKw0KPiArLyoNCj4gKyAqDQo+ICsgKiBAZG1hX2RldjogZGV2aWNlIGZv
ciBETUEgQVBJLg0KPiArICoJLSB1c2UgdGhlIGZpcnN0IGF0dGFjaGVkIGRldmljZSBpZiBz
dXBwb3J0IGlvbW11DQo+ICsJZWxzZSB1c2UgZHJtIGRldmljZSAob25seSBjb250aWd1b3Vz
IGJ1ZmZlciBzdXBwb3J0KQ0KPiArICogQGRvbWFpbjogaW9tbXUgZG9tYWluIGZvciBEUk0u
DQo+ICsgKgktIGFsbCBEQyBJT01NVSBzaGFyZSBzYW1lIGRvbWFpbiB0byByZWR1Y2UgbWFw
cGluZw0KPiArICogQHBpdGNoX2FsaWdubWVudDogYnVmZmVyIHBpdGNoIGFsaWdubWVudCBy
ZXF1aXJlZCBieSBzdWItZGV2aWNlcy4NCj4gKyAqDQo+ICsgKi8NCj4gK3N0cnVjdCB2c19k
cm1fcHJpdmF0ZSB7DQo+ICsJc3RydWN0IGRldmljZSAqZG1hX2RldjsNCj4gKwlzdHJ1Y3Qg
aW9tbXVfZG9tYWluICpkb21haW47DQo+ICsJdW5zaWduZWQgaW50IHBpdGNoX2FsaWdubWVu
dDsNCj4gK307DQoNCkFzIG1lbnRpb25lZCwgdGhpcyBzdHJ1Y3QgbmVlZHMgdG8gZW1iZWQg
c3RydWN0IGRybV9kZXZpY2UuDQoNCj4gKw0KPiArdm9pZCB2c19kcm1fdXBkYXRlX3BpdGNo
X2FsaWdubWVudChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiwNCj4gKwkJCQkgICB1bnNp
Z25lZCBpbnQgYWxpZ25tZW50KTsNCj4gKw0KPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgZGV2
aWNlICp0b19kbWFfZGV2KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJc3Ry
dWN0IHZzX2RybV9wcml2YXRlICpwcml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsNCj4gKw0KPiAr
CXJldHVybiBwcml2LT5kbWFfZGV2Ow0KDQpBbmQgdGhpcyBuZWVkcyB0byBiZSBhbiB1cGNh
c3QgdmlhIGNvbnRhaW5lcl9vZigpLg0KDQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBpc19pb21tdV9lbmFibGVkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICt7DQo+
ICsJc3RydWN0IHZzX2RybV9wcml2YXRlICpwcml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsNCj4g
Kw0KPiArCXJldHVybiBwcml2LT5kb21haW4gPyB0cnVlIDogZmFsc2U7DQo+ICt9DQo+ICsN
Cj4gKyNlbmRpZiAvKiBfX1ZTX0RSVl9IX18gKi8NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
dWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgN
Cj4gaW5kZXggZGU3MDNjNmJlOTY5Li5hZjRmYjUwZjkyMDcgMTAwNjQ0DQo+IC0tLSBhL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0v
ZHJtX2ZvdXJjYy5oDQoNClRoZSBVQVBJIGNoYW5nZXMgc2hvdWxkbid0IGJlIG5lZWRlZCBp
biB0aGlzIHBhdGNoPw0KDQo+IEBAIC00MTksNiArNDE5LDcgQEAgZXh0ZXJuICJDIiB7DQo+
ICAgI2RlZmluZSBEUk1fRk9STUFUX01PRF9WRU5ET1JfQVJNICAgICAweDA4DQo+ICAgI2Rl
ZmluZSBEUk1fRk9STUFUX01PRF9WRU5ET1JfQUxMV0lOTkVSIDB4MDkNCj4gICAjZGVmaW5l
IERSTV9GT1JNQVRfTU9EX1ZFTkRPUl9BTUxPR0lDIDB4MGENCj4gKyNkZWZpbmUgRFJNX0ZP
Uk1BVF9NT0RfVkVORE9SX1ZTICAgICAgMHgwYg0KPiAgIA0KPiAgIC8qIGFkZCBtb3JlIHRv
IHRoZSBlbmQgYXMgbmVlZGVkICovDQo+ICAgDQo+IEBAIC0xNTE5LDYgKzE1MjAsODggQEAg
ZHJtX2ZvdXJjY19jYW5vbmljYWxpemVfbnZpZGlhX2Zvcm1hdF9tb2QoX191NjQgbW9kaWZp
ZXIpDQo+ICAgI2RlZmluZSBBTURfRk1UX01PRF9DTEVBUihmaWVsZCkgXA0KPiAgIAkofigo
X191NjQpQU1EX0ZNVF9NT0RfIyNmaWVsZCMjX01BU0sgPDwgQU1EX0ZNVF9NT0RfIyNmaWVs
ZCMjX1NISUZUKSkNCj4gICANCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVFlQRV9O
T1JNQUwgICAgICAgIDB4MDANCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVFlQRV9D
T01QUkVTU0VEICAgIDB4MDENCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVFlQRV9D
VVNUT01fMTBCSVQgIDB4MDINCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVFlQRV9N
QVNLICAgICAoKF9fdTY0KTB4MyA8PCA1NCkNCj4gKw0KPiArI2RlZmluZSBmb3VyY2NfbW9k
X3ZzX2NvZGUodHlwZSwgdmFsKSBcDQo+ICsJZm91cmNjX21vZF9jb2RlKFZTLCAoKCgoX191
NjQpdHlwZSkgPDwgNTQpIHwgKHZhbCkpKQ0KPiArDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRf
TU9EX1ZTX0RFQ19USUxFX01PREVfTUFTSyAgICAweDNGDQo+ICsjZGVmaW5lIERSTV9GT1JN
QVRfTU9EX1ZTX0RFQ19USUxFXzhYOF9YTUFKT1IgICAweDAwDQo+ICsjZGVmaW5lIERSTV9G
T1JNQVRfTU9EX1ZTX0RFQ19USUxFXzhYOF9ZTUFKT1IgICAweDAxDQo+ICsjZGVmaW5lIERS
TV9GT1JNQVRfTU9EX1ZTX0RFQ19USUxFXzE2WDQgICAgIDB4MDINCj4gKyNkZWZpbmUgRFJN
X0ZPUk1BVF9NT0RfVlNfREVDX1RJTEVfOFg0ICAgICAgMHgwMw0KPiArI2RlZmluZSBEUk1f
Rk9STUFUX01PRF9WU19ERUNfVElMRV80WDggICAgICAweDA0DQo+ICsjZGVmaW5lIERSTV9G
T1JNQVRfTU9EX1ZTX0RFQ19SQVNURVJfMTZYNCAgIDB4MDYNCj4gKyNkZWZpbmUgRFJNX0ZP
Uk1BVF9NT0RfVlNfREVDX1RJTEVfNjRYNCAgICAgMHgwNw0KPiArI2RlZmluZSBEUk1fRk9S
TUFUX01PRF9WU19ERUNfVElMRV8zMlg0ICAgICAweDA4DQo+ICsjZGVmaW5lIERSTV9GT1JN
QVRfTU9EX1ZTX0RFQ19SQVNURVJfMjU2WDEgIDB4MDkNCj4gKyNkZWZpbmUgRFJNX0ZPUk1B
VF9NT0RfVlNfREVDX1JBU1RFUl8xMjhYMSAgMHgwQQ0KPiArI2RlZmluZSBEUk1fRk9STUFU
X01PRF9WU19ERUNfUkFTVEVSXzY0WDQgICAweDBCDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRf
TU9EX1ZTX0RFQ19SQVNURVJfMjU2WDIgIDB4MEMNCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9N
T0RfVlNfREVDX1JBU1RFUl8xMjhYMiAgMHgwRA0KPiArI2RlZmluZSBEUk1fRk9STUFUX01P
RF9WU19ERUNfUkFTVEVSXzEyOFg0ICAweDBFDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9E
X1ZTX0RFQ19SQVNURVJfNjRYMSAgIDB4MEYNCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0Rf
VlNfREVDX1RJTEVfMTZYOCAgICAgMHgxMA0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9W
U19ERUNfVElMRV84WDE2ICAgICAweDExDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZT
X0RFQ19SQVNURVJfNTEyWDEgIDB4MTINCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNf
REVDX1JBU1RFUl8zMlg0ICAgMHgxMw0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19E
RUNfUkFTVEVSXzY0WDIgICAweDE0DQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX0RF
Q19SQVNURVJfMzJYMiAgIDB4MTUNCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfREVD
X1JBU1RFUl8zMlgxICAgMHgxNg0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19ERUNf
UkFTVEVSXzE2WDEgICAweDE3DQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX0RFQ19U
SUxFXzEyOFg0ICAgIDB4MTgNCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfREVDX1RJ
TEVfMjU2WDQgICAgMHgxOQ0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19ERUNfVElM
RV81MTJYNCAgICAweDFBDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX0RFQ19USUxF
XzE2WDE2ICAgIDB4MUINCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfREVDX1RJTEVf
MzJYMTYgICAgMHgxQw0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19ERUNfVElMRV82
NFgxNiAgICAweDFEDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX0RFQ19USUxFXzEy
OFg4ICAgIDB4MUUNCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfREVDX1RJTEVfOFg0
X1MgICAgMHgxRg0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19ERUNfVElMRV8xNlg0
X1MgICAweDIwDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX0RFQ19USUxFXzMyWDRf
UyAgIDB4MjENCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfREVDX1RJTEVfMTZYNF9M
U0IgMHgyMg0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19ERUNfVElMRV8zMlg0X0xT
QiAweDIzDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX0RFQ19USUxFXzMyWDggICAg
IDB4MjQNCj4gKw0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19ERUNfQUxJR05fMzIg
ICAgICAoMHgwMSA8PCA2KQ0KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19ERUNfQUxJ
R05fNjQgICAgICAoMHgwMSA8PCA3KQ0KPiArDQo+ICsjZGVmaW5lIGZvdXJjY19tb2RfdnNf
ZGVjX2NvZGUodGlsZSwgYWxpZ24pIFwNCj4gKwlmb3VyY2NfbW9kX3ZzX2NvZGUoRFJNX0ZP
Uk1BVF9NT0RfVlNfVFlQRV9DT01QUkVTU0VELCBcDQo+ICsJCQkJKCh0aWxlKSB8IChhbGln
bikpKQ0KPiArDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX05PUk1fTU9ERV9NQVNL
ICAgICAgICAweDFGDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX0xJTkVBUiAgICAg
ICAgICAgICAgICAweDAwDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX1RJTEVENHg0
ICAgICAgICAgICAgICAweDAxDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX1NVUEVS
X1RJTEVEX1hNQUpPUiAgICAweDAyDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZTX1NV
UEVSX1RJTEVEX1lNQUpPUiAgICAweDAzDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX1ZT
X1RJTEVfOFg4ICAgICAgICAgICAgICAweDA0DQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9E
X1ZTX1RJTEVfTU9ERTEgICAgICAgICAgICAweDA1DQo+ICsjZGVmaW5lIERSTV9GT1JNQVRf
TU9EX1ZTX1RJTEVfTU9ERTIgICAgICAgICAgICAweDA2DQo+ICsjZGVmaW5lIERSTV9GT1JN
QVRfTU9EX1ZTX1RJTEVfOFg0ICAgICAgICAgICAgICAweDA3DQo+ICsjZGVmaW5lIERSTV9G
T1JNQVRfTU9EX1ZTX1RJTEVfTU9ERTQgICAgICAgICAgICAweDA4DQo+ICsjZGVmaW5lIERS
TV9GT1JNQVRfTU9EX1ZTX1RJTEVfTU9ERTUgICAgICAgICAgICAweDA5DQo+ICsjZGVmaW5l
IERSTV9GT1JNQVRfTU9EX1ZTX1RJTEVfTU9ERTYgICAgICAgICAgICAweDBBDQo+ICsjZGVm
aW5lIERSTV9GT1JNQVRfTU9EX1ZTX1NVUEVSX1RJTEVEX1hNQUpPUl84WDQgICAgMHgwQg0K
PiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9WU19TVVBFUl9USUxFRF9ZTUFKT1JfNFg4ICAg
IDB4MEMNCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVElMRV9ZICAgICAgICAgICAg
ICAgIDB4MEQNCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVElMRV8xMjhYMSAgICAg
ICAgICAgIDB4MEYNCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVElMRV8yNTZYMSAg
ICAgICAgICAgIDB4MTANCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVElMRV8zMlgx
ICAgICAgICAgICAgIDB4MTENCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVElMRV82
NFgxICAgICAgICAgICAgIDB4MTINCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfVlNfVElM
RV9NT0RFNFg0ICAgICAgICAgIDB4MTUNCj4gKw0KPiArI2RlZmluZSBmb3VyY2NfbW9kX3Zz
X25vcm1fY29kZSh0aWxlKSBcDQo+ICsJZm91cmNjX21vZF92c19jb2RlKERSTV9GT1JNQVRf
TU9EX1ZTX1RZUEVfTk9STUFMLCBcDQo+ICsJCQkJKHRpbGUpKQ0KPiArDQo+ICsjZGVmaW5l
IGZvdXJjY19tb2RfdnNfY3VzdG9tX2NvZGUodGlsZSkgXA0KPiArCWZvdXJjY19tb2RfdnNf
Y29kZShEUk1fRk9STUFUX01PRF9WU19UWVBFX0NVU1RPTV8xMEJJVCwgXA0KPiArCQkJCSh0
aWxlKSkNCj4gKw0KPiAgICNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQ0KPiAgIH0NCj4gICAj
ZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vdnNfZHJtLmggYi9pbmNs
dWRlL3VhcGkvZHJtL3ZzX2RybS5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uOTZiN2ZjOTVkNjU4DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIv
aW5jbHVkZS91YXBpL2RybS92c19kcm0uaA0KDQpBbm90aGVyIFVBUEkgYWRkaXRpb24gdGhh
dCBhcHBlYXJzIHRvIGJlIHVudXNlZC4gUGxlYXNlIG9ubHkgYWRkIHRoaW5ncyANCnRoYXQg
eW91J3JlIHVzaW5nLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IEBAIC0wLDAgKzEs
NTAgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKyBXSVRIIExp
bnV4LXN5c2NhbGwtbm90ZSAqLw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMCBW
ZXJpU2lsaWNvbiBIb2xkaW5ncyBDby4sIEx0ZC4NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVm
IF9fVlNfRFJNX0hfXw0KPiArI2RlZmluZSBfX1ZTX0RSTV9IX18NCj4gKw0KPiArI2luY2x1
ZGUgImRybS5oIg0KPiArDQo+ICtlbnVtIGRybV92c19kZWdhbW1hX21vZGUgew0KPiArCVZT
X0RFR0FNTUFfRElTQUJMRSA9IDAsDQo+ICsJVlNfREVHQU1NQV9CVDcwOSA9IDEsDQo+ICsJ
VlNfREVHQU1NQV9CVDIwMjAgPSAyLA0KPiArfTsNCj4gKw0KPiArZW51bSBkcm1fdnNfc3lu
Y19kY19tb2RlIHsNCj4gKwlWU19TSU5HTEVfREMgPSAwLA0KPiArCVZTX01VTFRJX0RDX1BS
SU1BUlkgPSAxLA0KPiArCVZTX01VTFRJX0RDX1NFQ09OREFSWSA9IDIsDQo+ICt9Ow0KPiAr
DQo+ICtlbnVtIGRybV92c19tbXVfcHJlZmV0Y2hfbW9kZSB7DQo+ICsJVlNfTU1VX1BSRUZF
VENIX0RJU0FCTEUgPSAwLA0KPiArCVZTX01NVV9QUkVGRVRDSF9FTkFCTEUgPSAxLA0KPiAr
fTsNCj4gKw0KPiArc3RydWN0IGRybV92c193YXRlcm1hcmsgew0KPiArCV9fdTMyIHdhdGVy
bWFyazsNCj4gKwlfX3U4IHFvc19sb3c7DQo+ICsJX191OCBxb3NfaGlnaDsNCj4gK307DQo+
ICsNCj4gK3N0cnVjdCBkcm1fdnNfY29sb3JfbWdtdCB7DQo+ICsJX191MzIgY29sb3JrZXk7
DQo+ICsJX191MzIgY29sb3JrZXlfaGlnaDsNCj4gKwlfX3UzMiBjbGVhcl92YWx1ZTsNCj4g
Kwlib29sICBjbGVhcl9lbmFibGU7DQo+ICsJYm9vbCAgdHJhbnNwYXJlbmN5Ow0KPiArfTsN
Cj4gKw0KPiArc3RydWN0IGRybV92c19yb2kgew0KPiArCWJvb2wgZW5hYmxlOw0KPiArCV9f
dTE2IHJvaV94Ow0KPiArCV9fdTE2IHJvaV95Ow0KPiArCV9fdTE2IHJvaV93Ow0KPiArCV9f
dTE2IHJvaV9oOw0KPiArfTsNCj4gKw0KPiArI2VuZGlmIC8qIF9fVlNfRFJNX0hfXyAqLw0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0
NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXll
cnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51
ZXJuYmVyZykNCg==

--------------mjx4RIYHOndW9g7lUYt0Hgum--

--------------5lnXIhPfI19x1b10ec8xdd9x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSQUSMFAwAAAAAACgkQlh/E3EQov+DE
yxAAsAhcU2cRWHTx0UbCq1qEwzGp74HrSTH5bACSJzBCnKQrbycs/FwacM9/9nUKNDl/u7V+abbD
GO21DkL+t3qRYq9i6rj+Oe1FQQVkQ63dd00Dxc9uC5q/t5LA4We3gLDY5CzrfTbP7GobrB8wXvaZ
YURZNph8h5aM4c4qlyizw9NROVUro9eMwXXNag2TeeE0UNxaFTiFPFmMESmUThpSootx0BVJavIQ
vROBQ2kwgSbHKGKL69M2U8D3e+qROBlQnnTyOmKfqrURo4SBcHAPxe08GT2PTSHd3MuoEqn40V9m
oyKYeLWgSTwDFix6eTmv2auffihDAIUoQNPeJ0SGdo4d56z7mERzkDYFXTGdIKWZqZxZK6B5BYqm
6U844KcHUaDh1CPC354XdvxiGjhRzcm4JMAPgOHFi3YNJDSr1wAHYdUwMzL0310YCBcwAiDKUm+m
DLDIQ0d+Upu1LtU+PTwoFXrc3FZac8sBZH2vB2yYhtPdx9U4Gh2MgxCNL5WlpnwX+FKYlMKrg/ES
sMFuA7BPjXoUkM7uZy3PB0JDCUEkqhlDilfSqfl1omefSatmPWHCvlUeKTPVXpeWTYPIVoYaQT9Q
YY8YAJlcfMeNNCSXv3xKYe98EA8UZPRh2uG0njG8aJ5yhqyhQX0M9YPZCWg2YxTVH3+XT4WglVX0
flU=
=B5we
-----END PGP SIGNATURE-----

--------------5lnXIhPfI19x1b10ec8xdd9x--
