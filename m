Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0762738002
	for <lists+linux-media@lfdr.de>; Wed, 21 Jun 2023 13:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjFULEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jun 2023 07:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjFULEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jun 2023 07:04:42 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CC0E2;
        Wed, 21 Jun 2023 04:04:39 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0DD752197F;
        Wed, 21 Jun 2023 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687345478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DpV2PxPfbIbmclnO8fXxhnqdsuc/96H7MjmBcJJPyGA=;
        b=oVkC0omqAvXZZkv47u2kTw+v6yfcJ3K9hjQG6yBbyE2ww6izn7snasKlrkb+VGoOuXOT4Z
        +XF1iRHjfvf+XTvxuztYjxtgQR+8Bwkz4CSb33FzTqH3eYd0tMBQpxv8dlj1ybyCzAH18O
        YN8TJXM43xVEGxQrRel86jtfL/e/3HY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687345478;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DpV2PxPfbIbmclnO8fXxhnqdsuc/96H7MjmBcJJPyGA=;
        b=yb1mMqCC21OuvNLZJdaI6dp9y63ZEhuWLBTQw07DBYqRS7JQjux3RYutzBv2CDpHGJQB06
        +zsfbyDDat4T/6Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BC19134B1;
        Wed, 21 Jun 2023 11:04:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id G00oGUXZkmTkHwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 11:04:37 +0000
Message-ID: <30008535-8606-fc6d-9c07-23d46f59c957@suse.de>
Date:   Wed, 21 Jun 2023 13:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/9] drm/verisilicon: Add mode config funcs
Content-Language: en-US
To:     Keith Zhao <keith.zhao@starfivetech.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        christian.koenig@amd.com, Bjorn Andersson <andersson@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
        Chris Morgan <macromorgan@hotmail.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Shengyang Chen <shengyang.chen@starfivetech.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-6-keith.zhao@starfivetech.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230602074043.33872-6-keith.zhao@starfivetech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Yze0odKdOW0K8yKsB1h00GM2"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Yze0odKdOW0K8yKsB1h00GM2
Content-Type: multipart/mixed; boundary="------------PPvNvR0qpHX9yD9wX2P51MeF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Chris Morgan <macromorgan@hotmail.com>, Jack Zhu
 <jack.zhu@starfivetech.com>, Shengyang Chen
 <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Message-ID: <30008535-8606-fc6d-9c07-23d46f59c957@suse.de>
Subject: Re: [PATCH 5/9] drm/verisilicon: Add mode config funcs
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-6-keith.zhao@starfivetech.com>
In-Reply-To: <20230602074043.33872-6-keith.zhao@starfivetech.com>

--------------PPvNvR0qpHX9yD9wX2P51MeF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgS2VpdGgNCg0KQW0gMDIuMDYuMjMgdW0gMDk6NDAgc2NocmllYiBLZWl0aCBaaGFvOg0K
PiBBZGQgbW9kZSBzZXR0aW5nIGZ1bmN0aW9ucyBmb3IgSkg3MTEwIFNvQy4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEtlaXRoIFpoYW8gPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL01ha2VmaWxlIHwgICAx
ICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJ2LmMgfCAgIDMgKw0K
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2ZiLmMgIHwgMTgxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNv
bi92c19mYi5oICB8ICAxNSArKysNCg0KSSdkIGNhbGwgdGhlc2UgZmlsZXMgdnNfbW9kZXNl
dC57YyxofSB0byBiZSBjb25zaXN0ZW50IHdpdGggdGhlIHJlc3Qgb2YgDQp0aGUgZHJpdmVy
cy4NCg0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMjAwIGluc2VydGlvbnMoKykNCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2ZiLmMNCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2Zi
LmgNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vTWFr
ZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vTWFrZWZpbGUNCj4gaW5kZXgg
MzAzNjBlMzcwZTQ3Li4zODI1NGRjNWQ5OGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmVy
aXNpbGljb24vTWFrZWZpbGUNCj4gQEAgLTEsNiArMSw3IEBADQo+ICAgIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiAgIA0KPiAgIHZzX2RybS1vYmpzIDo9IHZzX2Ry
di5vIFwNCj4gKwkJdnNfZmIubyBcDQo+ICAgCQl2c19nZW0ubw0KPiAgIA0KPiAgIG9iai0k
KENPTkZJR19EUk1fVkVSSVNJTElDT04pICs9IHZzX2RybS5vDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
dmVyaXNpbGljb24vdnNfZHJ2LmMNCj4gaW5kZXggZTBhMmZjNDNiNTVmLi5kODRhYWNkNzUx
YmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19kcnYu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJ2LmMNCj4gQEAg
LTMwLDYgKzMwLDcgQEANCj4gICAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4NCj4gICAN
Cj4gICAjaW5jbHVkZSAidnNfZHJ2LmgiDQo+ICsjaW5jbHVkZSAidnNfZmIuaCINCj4gICAj
aW5jbHVkZSAidnNfZ2VtLmgiDQo+ICAgDQo+ICAgI2RlZmluZSBEUlZfTkFNRQkic3RhcmZp
dmUiDQo+IEBAIC0xMTgsNiArMTE5LDggQEAgc3RhdGljIGludCB2c19kcm1fYmluZChzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+ICAgCWlmIChyZXQpDQo+ICAgCQlnb3RvIGVycl9tb2RlOw0K
PiAgIA0KPiArCXZzX21vZGVfY29uZmlnX2luaXQoZHJtX2Rldik7DQo+ICsNCj4gICAJcmV0
ID0gZHJtX3ZibGFua19pbml0KGRybV9kZXYsIGRybV9kZXYtPm1vZGVfY29uZmlnLm51bV9j
cnRjKTsNCj4gICAJaWYgKHJldCkNCj4gICAJCWdvdG8gZXJyX2JpbmQ7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZmIuYyBiL2RyaXZlcnMvZ3B1
L2RybS92ZXJpc2lsaWNvbi92c19mYi5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uM2U4NWY3MzY1MDg0DQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2ZiLmMNCj4gQEAgLTAsMCArMSwx
ODEgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsvKg0K
PiArICogQ29weXJpZ2h0IChDKSAyMDIzIFZlcmlTaWxpY29uIEhvbGRpbmdzIENvLiwgTHRk
Lg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gKyNpbmNs
dWRlIDxsaW51eC92ZXJzaW9uLmg+DQo+ICsNCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2RhbWFn
ZV9oZWxwZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPg0KPiArI2lu
Y2x1ZGUgPGRybS9kcm1fY3J0Yy5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fY3J0Y19oZWxw
ZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiArI2luY2x1ZGUgPGRy
bS9kcm1fZnJhbWVidWZmZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPg0KPiAr
I2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPg0KPiArDQo+ICsj
aW5jbHVkZSAidnNfZmIuaCINCj4gKyNpbmNsdWRlICJ2c19nZW0uaCINCj4gKw0KPiArI2Rl
ZmluZSBmb3VyY2NfbW9kX3ZzX2dldF90eXBlKHZhbCkgXA0KPiArCSgoKHZhbCkgJiBEUk1f
Rk9STUFUX01PRF9WU19UWVBFX01BU0spID4+IDU0KQ0KPiArDQo+ICtzdGF0aWMgc3RydWN0
IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyB2c19mYl9mdW5jcyA9IHsNCj4gKwkuY3JlYXRlX2hh
bmRsZQk9IGRybV9nZW1fZmJfY3JlYXRlX2hhbmRsZSwNCj4gKwkuZGVzdHJveQk9IGRybV9n
ZW1fZmJfZGVzdHJveSwNCj4gKwkuZGlydHkJCT0gZHJtX2F0b21pY19oZWxwZXJfZGlydHlm
YiwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICoNCj4g
K3ZzX2ZiX2FsbG9jKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGNvbnN0IHN0cnVjdCBkcm1f
bW9kZV9mYl9jbWQyICptb2RlX2NtZCwNCj4gKwkgICAgc3RydWN0IHZzX2dlbV9vYmplY3Qg
KipvYmosIHVuc2lnbmVkIGludCBudW1fcGxhbmVzKQ0KPiArew0KPiArCXN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiOw0KPiArCWludCByZXQsIGk7DQo+ICsNCj4gKwlmYiA9IGt6YWxs
b2Moc2l6ZW9mKCpmYiksIEdGUF9LRVJORUwpOw0KPiArCWlmICghZmIpDQo+ICsJCXJldHVy
biBFUlJfUFRSKC1FTk9NRU0pOw0KPiArDQo+ICsJZHJtX2hlbHBlcl9tb2RlX2ZpbGxfZmJf
c3RydWN0KGRldiwgZmIsIG1vZGVfY21kKTsNCj4gKw0KPiArCWZvciAoaSA9IDA7IGkgPCBu
dW1fcGxhbmVzOyBpKyspDQo+ICsJCWZiLT5vYmpbaV0gPSAmb2JqW2ldLT5iYXNlOw0KPiAr
DQo+ICsJcmV0ID0gZHJtX2ZyYW1lYnVmZmVyX2luaXQoZGV2LCBmYiwgJnZzX2ZiX2Z1bmNz
KTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoZGV2LT5kZXYsICJGYWlsZWQgdG8g
aW5pdGlhbGl6ZSBmcmFtZWJ1ZmZlcjogJWRcbiIsDQo+ICsJCQlyZXQpOw0KPiArCQlrZnJl
ZShmYik7DQo+ICsJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+ICsJfQ0KPiArDQo+ICsJcmV0
dXJuIGZiOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAq
dnNfZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICsJCQkJCSAgICBzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwNCj4gKwkJCQkJICAgIGNvbnN0IHN0cnVjdCBkcm1f
bW9kZV9mYl9jbWQyICptb2RlX2NtZCkNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICpmYjsNCj4gKwljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvOw0KPiAr
CXN0cnVjdCB2c19nZW1fb2JqZWN0ICpvYmpzW01BWF9OVU1fUExBTkVTXTsNCj4gKwlzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsNCj4gKwl1bnNpZ25lZCBpbnQgaGVpZ2h0LCBzaXpl
Ow0KPiArCXVuc2lnbmVkIGNoYXIgaSwgbnVtX3BsYW5lczsNCj4gKwlpbnQgcmV0ID0gMDsN
Cj4gKw0KPiArCWluZm8gPSBkcm1fZ2V0X2Zvcm1hdF9pbmZvKGRldiwgbW9kZV9jbWQpOw0K
PiArCWlmICghaW5mbykNCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ICsNCj4g
KwludW1fcGxhbmVzID0gaW5mby0+bnVtX3BsYW5lczsNCj4gKwlpZiAobnVtX3BsYW5lcyA+
IE1BWF9OVU1fUExBTkVTKQ0KPiArCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gKw0K
PiArCWZvciAoaSA9IDA7IGkgPCBudW1fcGxhbmVzOyBpKyspIHsNCj4gKwkJb2JqID0gZHJt
X2dlbV9vYmplY3RfbG9va3VwKGZpbGVfcHJpdiwgbW9kZV9jbWQtPmhhbmRsZXNbaV0pOw0K
PiArCQlpZiAoIW9iaikgew0KPiArCQkJZGV2X2VycihkZXYtPmRldiwgIkZhaWxlZCB0byBs
b29rdXAgR0VNIG9iamVjdC5cbiIpOw0KPiArCQkJcmV0ID0gLUVOWElPOw0KPiArCQkJZ290
byBlcnI7DQo+ICsJCX0NCj4gKw0KPiArCQloZWlnaHQgPSBkcm1fZm9ybWF0X2luZm9fcGxh
bmVfaGVpZ2h0KGluZm8sDQo+ICsJCQkJCQkgICAgICBtb2RlX2NtZC0+aGVpZ2h0LCBpKTsN
Cj4gKw0KPiArCQlzaXplID0gaGVpZ2h0ICogbW9kZV9jbWQtPnBpdGNoZXNbaV0gKyBtb2Rl
X2NtZC0+b2Zmc2V0c1tpXTsNCj4gKw0KPiArCQlpZiAob2JqLT5zaXplIDwgc2l6ZSkgew0K
PiArCQkJZHJtX2dlbV9vYmplY3RfcHV0KG9iaik7DQo+ICsNCj4gKwkJCXJldCA9IC1FSU5W
QUw7DQo+ICsJCQlnb3RvIGVycjsNCj4gKwkJfQ0KPiArDQo+ICsJCW9ianNbaV0gPSB0b192
c19nZW1fb2JqZWN0KG9iaik7DQo+ICsJfQ0KPiArDQo+ICsJZmIgPSB2c19mYl9hbGxvYyhk
ZXYsIG1vZGVfY21kLCBvYmpzLCBpKTsNCj4gKwlpZiAoSVNfRVJSKGZiKSkgew0KPiArCQly
ZXQgPSBQVFJfRVJSKGZiKTsNCj4gKwkJZ290byBlcnI7DQo+ICsJfQ0KPiArDQo+ICsJcmV0
dXJuIGZiOw0KPiArDQo+ICtlcnI6DQo+ICsJZm9yICg7IGkgPiAwOyBpLS0pDQo+ICsJCWRy
bV9nZW1fb2JqZWN0X3B1dCgmb2Jqc1tpIC0gMV0tPmJhc2UpOw0KPiArDQo+ICsJcmV0dXJu
IEVSUl9QVFIocmV0KTsNCj4gK30NCj4gKw0KPiArc3RydWN0IHZzX2dlbV9vYmplY3QgKnZz
X2ZiX2dldF9nZW1fb2JqKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPiArCQkJCQl1
bnNpZ25lZCBjaGFyIHBsYW5lKQ0KPiArew0KPiArCWlmIChwbGFuZSA+IE1BWF9OVU1fUExB
TkVTKQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4gKw0KPiArCXJldHVybiB0b192c19nZW1fb2Jq
ZWN0KGZiLT5vYmpbcGxhbmVdKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZm9ybWF0X2luZm8gdnNfZm9ybWF0c1tdID0gew0KPiArCXsuZm9ybWF0ID0gRFJN
X0ZPUk1BVF9OVjEyLCAuZGVwdGggPSAwLCAubnVtX3BsYW5lcyA9IDIsIC5jaGFyX3Blcl9i
bG9jayA9IHsgMjAsIDQwLCAwIH0sDQo+ICsJIC5ibG9ja193ID0geyA0LCA0LCAwIH0sIC5i
bG9ja19oID0geyA0LCA0LCAwIH0sIC5oc3ViID0gMiwgLnZzdWIgPSAyLCAuaXNfeXV2ID0g
dHJ1ZX0sDQo+ICsJey5mb3JtYXQgPSBEUk1fRk9STUFUX1lVVjQ0NCwgLmRlcHRoID0gMCwg
Lm51bV9wbGFuZXMgPSAzLCAuY2hhcl9wZXJfYmxvY2sgPSB7IDIwLCAyMCwgMjAgfSwNCj4g
KwkgLmJsb2NrX3cgPSB7IDQsIDQsIDQgfSwgLmJsb2NrX2ggPSB7IDQsIDQsIDQgfSwgLmhz
dWIgPSAxLCAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVlfSwNCj4gK307DQo+ICsNCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICoNCj4gK3ZzX2xvb2t1cF9mb3Jt
YXRfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvIGZvcm1hdHNbXSwNCj4gKwkJ
ICAgICAgaW50IG51bV9mb3JtYXRzLCB1MzIgZm9ybWF0KQ0KPiArew0KPiArCWludCBpOw0K
PiArDQo+ICsJZm9yIChpID0gMDsgaSA8IG51bV9mb3JtYXRzOyBpKyspIHsNCj4gKwkJaWYg
KGZvcm1hdHNbaV0uZm9ybWF0ID09IGZvcm1hdCkNCj4gKwkJCXJldHVybiAmZm9ybWF0c1tp
XTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gTlVMTDsNCj4gK30NCj4gKw0KPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKg0KPiArdnNfZ2V0X2Zvcm1hdF9pbmZv
KGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyICpjbWQpDQo+ICt7DQo+ICsJaWYgKGZv
dXJjY19tb2RfdnNfZ2V0X3R5cGUoY21kLT5tb2RpZmllclswXSkgPT0NCj4gKwkJRFJNX0ZP
Uk1BVF9NT0RfVlNfVFlQRV9DVVNUT01fMTBCSVQpDQo+ICsJCXJldHVybiB2c19sb29rdXBf
Zm9ybWF0X2luZm8odnNfZm9ybWF0cywgQVJSQVlfU0laRSh2c19mb3JtYXRzKSwNCj4gKwkJ
CQkJCQkJCSBjbWQtPnBpeGVsX2Zvcm1hdCk7DQo+ICsJZWxzZQ0KPiArCQlyZXR1cm4gTlVM
TDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdf
ZnVuY3MgdnNfbW9kZV9jb25maWdfZnVuY3MgPSB7DQo+ICsJLmZiX2NyZWF0ZQkJCSA9IHZz
X2ZiX2NyZWF0ZSwNCg0KTWF5YmUgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUsIGJ1dCBp
dCBsb29rcyBsaWtlIHlvdSBjYW4gY2FsbA0KZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9mdW5j
cygpIHRvIGNyZWF0ZSB0aGUgZnJhbWVidWZmZXIuDQoNCj4gKwkuZ2V0X2Zvcm1hdF9pbmZv
CSA9IHZzX2dldF9mb3JtYXRfaW5mbywNCj4gKwkub3V0cHV0X3BvbGxfY2hhbmdlZCA9IGRy
bV9mYl9oZWxwZXJfb3V0cHV0X3BvbGxfY2hhbmdlZCwNCj4gKwkuYXRvbWljX2NoZWNrCQkg
PSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjaywNCj4gKwkuYXRvbWljX2NvbW1pdAkJID0gZHJt
X2F0b21pY19oZWxwZXJfY29tbWl0LA0KPiArfTsNCj4gKw0KPiArc3RhdGljIHN0cnVjdCBk
cm1fbW9kZV9jb25maWdfaGVscGVyX2Z1bmNzIHZzX21vZGVfY29uZmlnX2hlbHBlcnMgPSB7
DQo+ICsJLmF0b21pY19jb21taXRfdGFpbCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90
YWlsX3JwbSwNCj4gK307DQo+ICsNCj4gK3ZvaWQgdnNfbW9kZV9jb25maWdfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiArew0KDQpJZiBwb3NzaWJsZSwgbW92ZSB0aGUgY2Fs
bCB0byBkcm1fbW9kZV9jb25maWdfaW5pdCgpIGludG8gdGhpcyBmdW5jdGlvbi4NCg0KPiAr
CWRldi0+bW9kZV9jb25maWcuZmJfbW9kaWZpZXJzX25vdF9zdXBwb3J0ZWQgPSBmYWxzZTsN
Cj4gKw0KPiArCWlmIChkZXYtPm1vZGVfY29uZmlnLm1heF93aWR0aCA9PSAwIHx8DQo+ICsJ
ICAgIGRldi0+bW9kZV9jb25maWcubWF4X2hlaWdodCA9PSAwKSB7DQo+ICsJCWRldi0+bW9k
ZV9jb25maWcubWluX3dpZHRoICA9IDA7DQo+ICsJCWRldi0+bW9kZV9jb25maWcubWluX2hl
aWdodCA9IDA7DQo+ICsJCWRldi0+bW9kZV9jb25maWcubWF4X3dpZHRoICA9IDQwOTY7DQo+
ICsJCWRldi0+bW9kZV9jb25maWcubWF4X2hlaWdodCA9IDQwOTY7DQo+ICsJfQ0KPiArCWRl
di0+bW9kZV9jb25maWcuZnVuY3MgPSAmdnNfbW9kZV9jb25maWdfZnVuY3M7DQo+ICsJZGV2
LT5tb2RlX2NvbmZpZy5oZWxwZXJfcHJpdmF0ZSA9ICZ2c19tb2RlX2NvbmZpZ19oZWxwZXJz
Ow0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3Zz
X2ZiLmggYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZmIuaA0KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjc4ZGRhOGU0Mjg5NA0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19m
Yi5oDQo+IEBAIC0wLDAgKzEsMTUgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChDKSAyMDIzIFZlcmlTaWxp
Y29uIEhvbGRpbmdzIENvLiwgTHRkLg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgX19WU19G
Ql9IX18NCj4gKyNkZWZpbmUgX19WU19GQl9IX18NCj4gKw0KPiArI2RlZmluZSBNQVhfTlVN
X1BMQU5FUwkJMyAvKiBjb2xvdXIgZm9ybWF0IHBsYW5lICovDQoNClRoZXJlJ3MgRFJNX0ZP
Uk1BVF9NQVhfUExBTkVTIGFscmVhZHkuIFBsZWFzZSBkb24ndCBpbnRyb2R1Y2UgYSBjb25z
dGFudCANCndpdGggdGhlIHNhbWUgcHVycG9zZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiArDQo+ICtzdHJ1Y3QgdnNfZ2VtX29iamVjdCAqdnNfZmJfZ2V0X2dlbV9vYmooc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+ICsJCQkJCXVuc2lnbmVkIGNoYXIgcGxhbmUp
Ow0KPiArDQo+ICt2b2lkIHZzX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldik7DQo+ICsjZW5kaWYgLyogX19WU19GQl9IX18gKi8NCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVy
ZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25h
bGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------PPvNvR0qpHX9yD9wX2P51MeF--

--------------Yze0odKdOW0K8yKsB1h00GM2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSS2UQFAwAAAAAACgkQlh/E3EQov+Bi
fg//fevLYJjgjuEprXnte/hU8J3lBXNejZNBlGKh3RCwgZedfIElPcpLngwNqe0ZAP5B3HavpwiJ
7ekKBPvvNc2jj/pdrAo6RTSh+dlDZv1+Jp3D85RlbMjqP4Bf0ZnQTdd+X6y44f19X5kXVL/q0DGU
MjbUpkv6ZyObeNTqzTN9ns4+xqiOxod4ButJpVA25VL9txs0EpRdBT7twpbIAAdCNFv1nZp/Rtyw
0U1xzk0KFkNV1SpLqrCpGEQLhG2H7RzQ9BC0Ia78dhAKYYF2mqCy7Lv8/syodXZ9JM6VglzJOI1n
rYNyor5LgT87WY4P+q2BoaUZsmTyHIUeH6kMyYuTeEQH+y0yX7SNiLuJao6CnqiI84yEWTNaQvJB
IoV/slOb31Fye9ika3DsSXDSpa9dC/qaSisyWJLJkvJTY+fQV5OU3OOkQBd/JhugEJIcwZO7tbZ+
XI6IDxk+9tgOQ6zAvo6d32oZaHBsJhlfDMQChm/0wlVmHYYeG5tuMnXWLCAwfjwUBJ/h9jr0f3mo
40/AAcKV0CXABD//mc6iMmSgezk55CbJbV36Ad4exGThVKmTnmtRJaDlzVggdvYSKjDXQ6TRf5r/
Zl/MDW3Mks+lNlB9uDb2l/p6DnktTzVT4OA7h9zHtyUnJLsWaAUEm5WFaMeCatA675dCX3/5/0ns
WDE=
=MT2o
-----END PGP SIGNATURE-----

--------------Yze0odKdOW0K8yKsB1h00GM2--
