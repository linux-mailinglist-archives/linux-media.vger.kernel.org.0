Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7FC743B33
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbjF3LzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbjF3LzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:55:14 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40581EE;
        Fri, 30 Jun 2023 04:55:12 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E41471FD72;
        Fri, 30 Jun 2023 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688126110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OajfAptKWqd246/hZOM+TmqIH/OnKKq51izlu17iAyo=;
        b=VcETP7BFRNEHTfg0C7OmG4NCCEd4CoNYWqOfVyY/QETJIVudJW//m7CgRl4GDoPi1i/qkr
        hYTDKTjnTeEEOQ4xHcTkdkI544hh9KM/UT6TQnu3JBep8nol6J0ZoxVcpSrqpmM7HpwJJC
        XEE41cRdUi6MSxIQAyloT1BlyXmv0YA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688126110;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OajfAptKWqd246/hZOM+TmqIH/OnKKq51izlu17iAyo=;
        b=uNPYM4cMDM42bWRUuIUxCw80+RjLaQcllKoMOSLUYMAkGsxwG+z/k7OEnZ0Dbf/JO3O2P1
        9sNq6dOkq11wH2BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56CDC13915;
        Fri, 30 Jun 2023 11:55:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id u7MCFJ7CnmQbOQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 30 Jun 2023 11:55:10 +0000
Message-ID: <07cc89a5-5200-72e6-f078-694c5820a99a@suse.de>
Date:   Fri, 30 Jun 2023 13:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/9] drm/verisilicon: Add drm crtc funcs
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
 <20230602074043.33872-7-keith.zhao@starfivetech.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230602074043.33872-7-keith.zhao@starfivetech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tN2IYGVjIdwxc4q2re7JoQQg"
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
--------------tN2IYGVjIdwxc4q2re7JoQQg
Content-Type: multipart/mixed; boundary="------------HnxxtKxM70qkufM0uDcOrcr2";
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
Message-ID: <07cc89a5-5200-72e6-f078-694c5820a99a@suse.de>
Subject: Re: [PATCH 6/9] drm/verisilicon: Add drm crtc funcs
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-7-keith.zhao@starfivetech.com>
In-Reply-To: <20230602074043.33872-7-keith.zhao@starfivetech.com>

--------------HnxxtKxM70qkufM0uDcOrcr2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDYuMjMgdW0gMDk6NDAgc2NocmllYiBLZWl0aCBaaGFvOg0KPiBBZGQg
Y3J0YyBkcml2ZXIgd2hpY2ggaW1wbGVtZW50cyBjcnRjIHJlbGF0ZWQgb3BlcmF0aW9uIGZ1
bmN0aW9ucy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtlaXRoIFpoYW8gPGtlaXRoLnpoYW9A
c3RhcmZpdmV0ZWNoLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxp
Y29uL01ha2VmaWxlICB8ICAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29u
L3ZzX2NydGMuYyB8IDM4OCArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGRyaXZl
cnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19jcnRjLmggfCAgNzQgKysrKysNCj4gICBkcml2
ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfdHlwZS5oIHwgIDcyICsrKysrDQo+ICAgNCBm
aWxlcyBjaGFuZ2VkLCA1MzUgaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfY3J0Yy5jDQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19jcnRjLmgNCj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX3R5cGUu
aA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9NYWtl
ZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZQ0KPiBpbmRleCAz
ODI1NGRjNWQ5OGQuLmJhZTVmYmFiOWJiYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3ZlcmlzaWxpY29uL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi9NYWtlZmlsZQ0KPiBAQCAtMSw2ICsxLDcgQEANCj4gICAjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICAgDQo+ICAgdnNfZHJtLW9ianMgOj0gdnNfZHJ2
Lm8gXA0KPiArCQl2c19jcnRjLm8gXA0KPiAgIAkJdnNfZmIubyBcDQo+ICAgCQl2c19nZW0u
bw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3Zz
X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19jcnRjLmMNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hOWU3NDJkN2JkMWEN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24v
dnNfY3J0Yy5jDQo+IEBAIC0wLDAgKzEsMzg4IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBWZXJp
U2lsaWNvbiBIb2xkaW5ncyBDby4sIEx0ZC4NCj4gKyAqDQo+ICsgKi8NCj4gKw0KPiArI2lu
Y2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4NCj4g
KyNpbmNsdWRlIDxsaW51eC9tZWRpYS1idXMtZm9ybWF0Lmg+DQo+ICsNCj4gKyNpbmNsdWRl
IDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2F0b21p
Yy5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPg0KPiArI2luY2x1ZGUgPGRybS9k
cm1fZ2VtX2F0b21pY19oZWxwZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5o
Pg0KPiArI2luY2x1ZGUgPGRybS92c19kcm0uaD4NCj4gKw0KPiArI2luY2x1ZGUgInZzX2Ny
dGMuaCINCj4gKw0KPiArdm9pZCB2c19jcnRjX2Rlc3Ryb3koc3RydWN0IGRybV9jcnRjICpj
cnRjKQ0KPiArew0KPiArCXN0cnVjdCB2c19jcnRjICp2c19jcnRjID0gdG9fdnNfY3J0Yyhj
cnRjKTsNCj4gKw0KPiArCWRybV9jcnRjX2NsZWFudXAoY3J0Yyk7DQo+ICsJa2ZyZWUodnNf
Y3J0Yyk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHZzX2NydGNfcmVzZXQoc3RydWN0
IGRybV9jcnRjICpjcnRjKQ0KPiArew0KPiArCXN0cnVjdCB2c19jcnRjX3N0YXRlICpzdGF0
ZTsNCj4gKw0KPiArCWlmIChjcnRjLT5zdGF0ZSkgew0KPiArCQlfX2RybV9hdG9taWNfaGVs
cGVyX2NydGNfZGVzdHJveV9zdGF0ZShjcnRjLT5zdGF0ZSk7DQo+ICsNCj4gKwkJc3RhdGUg
PSB0b192c19jcnRjX3N0YXRlKGNydGMtPnN0YXRlKTsNCj4gKwkJa2ZyZWUoc3RhdGUpOw0K
PiArCQljcnRjLT5zdGF0ZSA9IE5VTEw7DQo+ICsJfQ0KPiArDQo+ICsJc3RhdGUgPSBremFs
bG9jKHNpemVvZigqc3RhdGUpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXN0YXRlKQ0KPiAr
CQlyZXR1cm47DQo+ICsNCj4gKwlfX2RybV9hdG9taWNfaGVscGVyX2NydGNfcmVzZXQoY3J0
YywgJnN0YXRlLT5iYXNlKTsNCj4gKw0KPiArCXN0YXRlLT5zeW5jX21vZGUgPSBWU19TSU5H
TEVfREM7DQo+ICsJc3RhdGUtPm91dHB1dF9mbXQgPSBNRURJQV9CVVNfRk1UX1JCRzg4OF8x
WDI0Ow0KPiArCXN0YXRlLT5lbmNvZGVyX3R5cGUgPSBEUk1fTU9ERV9FTkNPREVSX05PTkU7
DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKg0KPiArdnNf
Y3J0Y19hdG9taWNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4g
K3sNCj4gKwlzdHJ1Y3QgdnNfY3J0Y19zdGF0ZSAqb3JpX3N0YXRlOw0KPiArCXN0cnVjdCB2
c19jcnRjX3N0YXRlICpzdGF0ZTsNCj4gKw0KPiArCWlmIChXQVJOX09OKCFjcnRjLT5zdGF0
ZSkpDQo+ICsJCXJldHVybiBOVUxMOw0KDQpJJ2QgbGVhdmUgdGhpcyBjaGVjayBvdXQuIElJ
UkMsIGNydGMtPnN0YXRlIG5vdCBzdXBwb3NlZCB0byBiZSBOVUxMIA0KaGVyZS4gUmF0aGVy
IGxldCBpdCBjcmFzaC4NCg0KPiArDQo+ICsJb3JpX3N0YXRlID0gdG9fdnNfY3J0Y19zdGF0
ZShjcnRjLT5zdGF0ZSk7DQo+ICsJc3RhdGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBH
RlBfS0VSTkVMKTsNCj4gKwlpZiAoIXN0YXRlKQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4gKw0K
PiArCV9fZHJtX2F0b21pY19oZWxwZXJfY3J0Y19kdXBsaWNhdGVfc3RhdGUoY3J0YywgJnN0
YXRlLT5iYXNlKTsNCj4gKw0KPiArCXN0YXRlLT5zeW5jX21vZGUgPSBvcmlfc3RhdGUtPnN5
bmNfbW9kZTsNCj4gKwlzdGF0ZS0+b3V0cHV0X2ZtdCA9IG9yaV9zdGF0ZS0+b3V0cHV0X2Zt
dDsNCj4gKwlzdGF0ZS0+ZW5jb2Rlcl90eXBlID0gb3JpX3N0YXRlLT5lbmNvZGVyX3R5cGU7
DQo+ICsJc3RhdGUtPmJnX2NvbG9yID0gb3JpX3N0YXRlLT5iZ19jb2xvcjsNCj4gKwlzdGF0
ZS0+YnBwID0gb3JpX3N0YXRlLT5icHA7DQo+ICsJc3RhdGUtPnN5bmNfZW5hYmxlID0gb3Jp
X3N0YXRlLT5zeW5jX2VuYWJsZTsNCj4gKwlzdGF0ZS0+ZGl0aGVyX2VuYWJsZSA9IG9yaV9z
dGF0ZS0+ZGl0aGVyX2VuYWJsZTsNCj4gKwlzdGF0ZS0+dW5kZXJmbG93ID0gb3JpX3N0YXRl
LT51bmRlcmZsb3c7DQo+ICsNCj4gKwlyZXR1cm4gJnN0YXRlLT5iYXNlOw0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgdm9pZCB2c19jcnRjX2F0b21pY19kZXN0cm95X3N0YXRlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywNCj4gKwkJCQkJIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUp
DQo+ICt7DQo+ICsJX19kcm1fYXRvbWljX2hlbHBlcl9jcnRjX2Rlc3Ryb3lfc3RhdGUoc3Rh
dGUpOw0KPiArCWtmcmVlKHRvX3ZzX2NydGNfc3RhdGUoc3RhdGUpKTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIGludCB2c19jcnRjX2F0b21pY19zZXRfcHJvcGVydHkoc3RydWN0IGRybV9j
cnRjICpjcnRjLA0KPiArCQkJCSAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRl
LA0KPiArCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpwcm9wZXJ0eSwNCj4gKwkJ
CQkgICAgICAgdWludDY0X3QgdmFsKQ0KPiArew0KPiArCXN0cnVjdCB2c19jcnRjICp2c19j
cnRjID0gdG9fdnNfY3J0YyhjcnRjKTsNCj4gKwlzdHJ1Y3QgdnNfY3J0Y19zdGF0ZSAqdnNf
Y3J0Y19zdGF0ZSA9IHRvX3ZzX2NydGNfc3RhdGUoc3RhdGUpOw0KPiArDQo+ICsJaWYgKHBy
b3BlcnR5ID09IHZzX2NydGMtPnN5bmNfbW9kZSkNCj4gKwkJdnNfY3J0Y19zdGF0ZS0+c3lu
Y19tb2RlID0gdmFsOw0KPiArCWVsc2UgaWYgKHByb3BlcnR5ID09IHZzX2NydGMtPm1tdV9w
cmVmZXRjaCkNCj4gKwkJdnNfY3J0Y19zdGF0ZS0+bW11X3ByZWZldGNoID0gdmFsOw0KPiAr
CWVsc2UgaWYgKHByb3BlcnR5ID09IHZzX2NydGMtPmJnX2NvbG9yKQ0KPiArCQl2c19jcnRj
X3N0YXRlLT5iZ19jb2xvciA9IHZhbDsNCj4gKwllbHNlIGlmIChwcm9wZXJ0eSA9PSB2c19j
cnRjLT5wYW5lbF9zeW5jKQ0KPiArCQl2c19jcnRjX3N0YXRlLT5zeW5jX2VuYWJsZSA9IHZh
bDsNCj4gKwllbHNlIGlmIChwcm9wZXJ0eSA9PSB2c19jcnRjLT5kaXRoZXIpDQo+ICsJCXZz
X2NydGNfc3RhdGUtPmRpdGhlcl9lbmFibGUgPSB2YWw7DQo+ICsJZWxzZQ0KPiArCQlyZXR1
cm4gLUVJTlZBTDsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMg
aW50IHZzX2NydGNfYXRvbWljX2dldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
DQo+ICsJCQkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUsDQo+
ICsJCQkJICAgICAgIHN0cnVjdCBkcm1fcHJvcGVydHkgKnByb3BlcnR5LA0KPiArCQkJCSAg
ICAgICB1aW50NjRfdCAqdmFsKQ0KPiArew0KPiArCXN0cnVjdCB2c19jcnRjICp2c19jcnRj
ID0gdG9fdnNfY3J0YyhjcnRjKTsNCj4gKwljb25zdCBzdHJ1Y3QgdnNfY3J0Y19zdGF0ZSAq
dnNfY3J0Y19zdGF0ZSA9DQo+ICsJCWNvbnRhaW5lcl9vZihzdGF0ZSwgY29uc3Qgc3RydWN0
IHZzX2NydGNfc3RhdGUsIGJhc2UpOw0KPiArDQo+ICsJaWYgKHByb3BlcnR5ID09IHZzX2Ny
dGMtPnN5bmNfbW9kZSkNCj4gKwkJKnZhbCA9IHZzX2NydGNfc3RhdGUtPnN5bmNfbW9kZTsN
Cj4gKwllbHNlIGlmIChwcm9wZXJ0eSA9PSB2c19jcnRjLT5tbXVfcHJlZmV0Y2gpDQo+ICsJ
CSp2YWwgPSB2c19jcnRjX3N0YXRlLT5tbXVfcHJlZmV0Y2g7DQo+ICsJZWxzZSBpZiAocHJv
cGVydHkgPT0gdnNfY3J0Yy0+YmdfY29sb3IpDQo+ICsJCSp2YWwgPSB2c19jcnRjX3N0YXRl
LT5iZ19jb2xvcjsNCj4gKwllbHNlIGlmIChwcm9wZXJ0eSA9PSB2c19jcnRjLT5wYW5lbF9z
eW5jKQ0KPiArCQkqdmFsID0gdnNfY3J0Y19zdGF0ZS0+c3luY19lbmFibGU7DQo+ICsJZWxz
ZSBpZiAocHJvcGVydHkgPT0gdnNfY3J0Yy0+ZGl0aGVyKQ0KPiArCQkqdmFsID0gdnNfY3J0
Y19zdGF0ZS0+ZGl0aGVyX2VuYWJsZTsNCj4gKwllbHNlDQo+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgdnNfY3J0
Y19sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4gK3sNCj4gKwlyZXR1
cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCB2c19jcnRjX2VuYWJsZV92Ymxhbmso
c3RydWN0IGRybV9jcnRjICpjcnRjKQ0KPiArew0KPiArCXN0cnVjdCB2c19jcnRjICp2c19j
cnRjID0gdG9fdnNfY3J0YyhjcnRjKTsNCj4gKw0KPiArCXZzX2NydGMtPmZ1bmNzLT5lbmFi
bGVfdmJsYW5rKHZzX2NydGMtPmRldiwgdHJ1ZSk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4g
K30NCj4gKw0KPiArc3RhdGljIHZvaWQgdnNfY3J0Y19kaXNhYmxlX3ZibGFuayhzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMpDQo+ICt7DQo+ICsJc3RydWN0IHZzX2NydGMgKnZzX2NydGMgPSB0
b192c19jcnRjKGNydGMpOw0KPiArDQo+ICsJdnNfY3J0Yy0+ZnVuY3MtPmVuYWJsZV92Ymxh
bmsodnNfY3J0Yy0+ZGV2LCBmYWxzZSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2NydGNfZnVuY3MgdnNfY3J0Y19mdW5jcyA9IHsNCj4gKwkuc2V0X2NvbmZp
ZwkJPSBkcm1fYXRvbWljX2hlbHBlcl9zZXRfY29uZmlnLA0KPiArCS5kZXN0cm95CQk9IHZz
X2NydGNfZGVzdHJveSwNCj4gKwkucGFnZV9mbGlwCQk9IGRybV9hdG9taWNfaGVscGVyX3Bh
Z2VfZmxpcCwNCj4gKwkucmVzZXQJCQk9IHZzX2NydGNfcmVzZXQsDQo+ICsJLmF0b21pY19k
dXBsaWNhdGVfc3RhdGUgPSB2c19jcnRjX2F0b21pY19kdXBsaWNhdGVfc3RhdGUsDQo+ICsJ
LmF0b21pY19kZXN0cm95X3N0YXRlCT0gdnNfY3J0Y19hdG9taWNfZGVzdHJveV9zdGF0ZSwN
Cj4gKwkuYXRvbWljX3NldF9wcm9wZXJ0eQk9IHZzX2NydGNfYXRvbWljX3NldF9wcm9wZXJ0
eSwNCj4gKwkuYXRvbWljX2dldF9wcm9wZXJ0eQk9IHZzX2NydGNfYXRvbWljX2dldF9wcm9w
ZXJ0eSwNCj4gKwkubGF0ZV9yZWdpc3RlcgkJPSB2c19jcnRjX2xhdGVfcmVnaXN0ZXIsDQo+
ICsJLmVuYWJsZV92YmxhbmsJCT0gdnNfY3J0Y19lbmFibGVfdmJsYW5rLA0KPiArCS5kaXNh
YmxlX3ZibGFuawkJPSB2c19jcnRjX2Rpc2FibGVfdmJsYW5rLA0KPiArfTsNCj4gKw0KPiAr
c3RhdGljIHU4IGNhbF9waXhlbF9iaXRzKHUzMiBidXNfZm9ybWF0KQ0KPiArew0KPiArCXU4
IGJwcDsNCj4gKw0KPiArCXN3aXRjaCAoYnVzX2Zvcm1hdCkgew0KPiArCWNhc2UgTUVESUFf
QlVTX0ZNVF9SR0I1NjVfMVgxNjoNCj4gKwljYXNlIE1FRElBX0JVU19GTVRfVVlWWThfMVgx
NjoNCj4gKwkJYnBwID0gMTY7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgTUVESUFfQlVTX0ZN
VF9SR0I2NjZfMVgxODoNCj4gKwljYXNlIE1FRElBX0JVU19GTVRfUkdCNjY2XzFYMjRfQ1BB
REhJOg0KPiArCQlicHAgPSAxODsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBNRURJQV9CVVNf
Rk1UX1VZVlkxMF8xWDIwOg0KPiArCQlicHAgPSAyMDsNCj4gKwkJYnJlYWs7DQo+ICsJY2Fz
ZSBNRURJQV9CVVNfRk1UX0JHUjg4OF8xWDI0Og0KPiArCWNhc2UgTUVESUFfQlVTX0ZNVF9V
WVlWWVk4XzBfNVgyNDoNCj4gKwljYXNlIE1FRElBX0JVU19GTVRfWVVWOF8xWDI0Og0KPiAr
CQlicHAgPSAyNDsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBNRURJQV9CVVNfRk1UX1JHQjEw
MTAxMF8xWDMwOg0KPiArCWNhc2UgTUVESUFfQlVTX0ZNVF9VWVlWWVkxMF8wXzVYMzA6DQo+
ICsJY2FzZSBNRURJQV9CVVNfRk1UX1lVVjEwXzFYMzA6DQo+ICsJCWJwcCA9IDMwOw0KPiAr
CQlicmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlicHAgPSAyNDsNCj4gKwkJYnJlYWs7DQo+
ICsJfQ0KPiArDQo+ICsJcmV0dXJuIGJwcDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGJvb2wg
dnNfY3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gKwkJCSAgICAg
ICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwNCj4gKwkJCSAgICAgICBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9kZSkNCj4gK3sNCj4gKwlzdHJ1
Y3QgdnNfY3J0YyAqdnNfY3J0YyA9IHRvX3ZzX2NydGMoY3J0Yyk7DQo+ICsNCj4gKwlyZXR1
cm4gdnNfY3J0Yy0+ZnVuY3MtPm1vZGVfZml4dXAodnNfY3J0Yy0+ZGV2LCBtb2RlLCBhZGp1
c3RlZF9tb2RlKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgdnNfY3J0Y19hdG9taWNf
ZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gKwkJCQkgIHN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSkNCj4gK3sNCj4gKwlzdHJ1Y3QgdnNfY3J0YyAqdnNfY3J0YyA9
IHRvX3ZzX2NydGMoY3J0Yyk7DQo+ICsJc3RydWN0IHZzX2NydGNfc3RhdGUgKnZzX2NydGNf
c3RhdGUgPSB0b192c19jcnRjX3N0YXRlKGNydGMtPnN0YXRlKTsNCj4gKw0KPiArCXZzX2Ny
dGNfc3RhdGUtPmJwcCA9IGNhbF9waXhlbF9iaXRzKHZzX2NydGNfc3RhdGUtPm91dHB1dF9m
bXQpOw0KPiArDQo+ICsJdnNfY3J0Yy0+ZnVuY3MtPmVuYWJsZSh2c19jcnRjLT5kZXYsIGNy
dGMpOw0KPiArCWRybV9jcnRjX3ZibGFua19vbihjcnRjKTsNCj4gK30NCj4gKw0KPiArc3Rh
dGljIHZvaWQgdnNfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
DQo+ICsJCQkJICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQ0KPiArew0KPiAr
CXN0cnVjdCB2c19jcnRjICp2c19jcnRjID0gdG9fdnNfY3J0YyhjcnRjKTsNCj4gKw0KPiAr
CWRybV9jcnRjX3ZibGFua19vZmYoY3J0Yyk7DQo+ICsNCj4gKwl2c19jcnRjLT5mdW5jcy0+
ZGlzYWJsZSh2c19jcnRjLT5kZXYsIGNydGMpOw0KPiArDQo+ICsJaWYgKGNydGMtPnN0YXRl
LT5ldmVudCAmJiAhY3J0Yy0+c3RhdGUtPmFjdGl2ZSkgew0KPiArCQlzcGluX2xvY2tfaXJx
KCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOw0KPiArCQlkcm1fY3J0Y19zZW5kX3ZibGFua19l
dmVudChjcnRjLCBjcnRjLT5zdGF0ZS0+ZXZlbnQpOw0KPiArCQlzcGluX3VubG9ja19pcnEo
JmNydGMtPmRldi0+ZXZlbnRfbG9jayk7DQo+ICsNCj4gKwkJY3J0Yy0+c3RhdGUtPmV2ZW50
ID0gTlVMTDsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHZzX2NydGNfYXRv
bWljX2JlZ2luKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gKwkJCQkgc3RydWN0IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlKQ0KPiArew0KPiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
Y3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLA0KPiAr
CQkJCQkJCQkJICBjcnRjKTsNCj4gKw0KPiArCXN0cnVjdCB2c19jcnRjICp2c19jcnRjID0g
dG9fdnNfY3J0YyhjcnRjKTsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB2c19jcnRjLT5k
ZXY7DQo+ICsJc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpibG9iID0gY3J0Yy0+c3RhdGUt
PmdhbW1hX2x1dDsNCj4gKwlzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqbHV0Ow0KPiArDQo+ICsJ
aWYgKGNydGNfc3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCkgew0KPiArCQlpZiAoYmxvYiAm
JiBibG9iLT5sZW5ndGgpIHsNCj4gKwkJCWx1dCA9IGJsb2ItPmRhdGE7DQo+ICsJCQl2c19j
cnRjLT5mdW5jcy0+c2V0X2dhbW1hKGRldiwgY3J0YywgbHV0LA0KPiArCQkJCQkJICBibG9i
LT5sZW5ndGggLyBzaXplb2YoKmx1dCkpOw0KPiArCQkJdnNfY3J0Yy0+ZnVuY3MtPmVuYWJs
ZV9nYW1tYShkZXYsIGNydGMsIHRydWUpOw0KPiArCQl9IGVsc2Ugew0KPiArCQkJdnNfY3J0
Yy0+ZnVuY3MtPmVuYWJsZV9nYW1tYShkZXYsIGNydGMsIGZhbHNlKTsNCj4gKwkJfQ0KPiAr
CX0NCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgdnNfY3J0Y19hdG9taWNfZmx1c2goc3Ry
dWN0IGRybV9jcnRjICpjcnRjLA0KPiArCQkJCSBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAq
c3RhdGUpDQo+ICt7DQo+ICsJc3RydWN0IHZzX2NydGMgKnZzX2NydGMgPSB0b192c19jcnRj
KGNydGMpOw0KPiArCXN0cnVjdCBkcm1fcGVuZGluZ192YmxhbmtfZXZlbnQgKmV2ZW50ID0g
Y3J0Yy0+c3RhdGUtPmV2ZW50Ow0KPiArDQo+ICsJdnNfY3J0Yy0+ZnVuY3MtPmNvbW1pdCh2
c19jcnRjLT5kZXYpOw0KPiArDQo+ICsJaWYgKGV2ZW50KSB7DQo+ICsJCVdBUk5fT04oZHJt
X2NydGNfdmJsYW5rX2dldChjcnRjKSAhPSAwKTsNCj4gKw0KPiArCQlzcGluX2xvY2tfaXJx
KCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOw0KPiArCQlkcm1fY3J0Y19hcm1fdmJsYW5rX2V2
ZW50KGNydGMsIGV2ZW50KTsNCj4gKwkJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2
ZW50X2xvY2spOw0KPiArCQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOw0KPiArCX0NCj4g
K30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3Mg
dnNfY3J0Y19oZWxwZXJfZnVuY3MgPSB7DQo+ICsJLm1vZGVfZml4dXAgPSB2c19jcnRjX21v
ZGVfZml4dXAsDQo+ICsJLmF0b21pY19lbmFibGUJPSB2c19jcnRjX2F0b21pY19lbmFibGUs
DQo+ICsJLmF0b21pY19kaXNhYmxlID0gdnNfY3J0Y19hdG9taWNfZGlzYWJsZSwNCj4gKwku
YXRvbWljX2JlZ2luCT0gdnNfY3J0Y19hdG9taWNfYmVnaW4sDQo+ICsJLmF0b21pY19mbHVz
aAk9IHZzX2NydGNfYXRvbWljX2ZsdXNoLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgdnNfc3luY19tb2RlX2VudW1fbGlzdFtdID0g
ew0KPiArCXsgVlNfU0lOR0xFX0RDLAkJCSJzaW5nbGUgZGMgbW9kZSIgfSwNCj4gKwl7IFZT
X01VTFRJX0RDX1BSSU1BUlksCQkicHJpbWFyeSBkYyBmb3IgbXVsdGkgZGMgbW9kZSIgfSwN
Cj4gKwl7IFZTX01VTFRJX0RDX1NFQ09OREFSWSwJInNlY29uZGFyeSBkYyBmb3IgbXVsdGkg
ZGMgbW9kZSIgfSwNCj4gK307DQo+ICsNCj4gK3N0cnVjdCB2c19jcnRjICp2c19jcnRjX2Ny
ZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiwNCj4gKwkJCSAgICAgICBzdHJ1Y3Qg
dnNfZGNfaW5mbyAqaW5mbykNCj4gK3sNCj4gKwlzdHJ1Y3QgdnNfY3J0YyAqY3J0YzsNCj4g
KwlpbnQgcmV0Ow0KPiArDQo+ICsJaWYgKCFpbmZvKQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4g
Kw0KPiArCWNydGMgPSBremFsbG9jKHNpemVvZigqY3J0YyksIEdGUF9LRVJORUwpOw0KPiAr
CWlmICghY3J0YykNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsNCj4gKwlyZXQgPSBkcm1fY3J0
Y19pbml0X3dpdGhfcGxhbmVzKGRybV9kZXYsICZjcnRjLT5iYXNlLA0KPiArCQkJCQlOVUxM
LCBOVUxMLCAmdnNfY3J0Y19mdW5jcywNCj4gKwkJCQkJaW5mby0+bmFtZSA/IGluZm8tPm5h
bWUgOiBOVUxMKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlnb3RvIGVycl9mcmVlX2NydGM7DQo+
ICsNCj4gKwlkcm1fY3J0Y19oZWxwZXJfYWRkKCZjcnRjLT5iYXNlLCAmdnNfY3J0Y19oZWxw
ZXJfZnVuY3MpOw0KPiArDQo+ICsJLyogU2V0IHVwIHRoZSBjcnRjIHByb3BlcnRpZXMgKi8N
Cj4gKwlpZiAoaW5mby0+cGlwZV9zeW5jKSB7DQo+ICsJCWNydGMtPnN5bmNfbW9kZSA9IGRy
bV9wcm9wZXJ0eV9jcmVhdGVfZW51bShkcm1fZGV2LCAwLA0KPiArCQkJCQkJCSAgICJTWU5D
X01PREUiLA0KPiArCQkJCQkJCSAgICB2c19zeW5jX21vZGVfZW51bV9saXN0LA0KPiArCQkJ
CQkJCSAgICBBUlJBWV9TSVpFKHZzX3N5bmNfbW9kZV9lbnVtX2xpc3QpKTsNCj4gKw0KPiAr
CQlpZiAoIWNydGMtPnN5bmNfbW9kZSkNCj4gKwkJCWdvdG8gZXJyX2NsZWFudXBfY3J0czsN
Cj4gKw0KPiArCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmY3J0Yy0+YmFzZS5iYXNl
LA0KPiArCQkJCQkgICBjcnRjLT5zeW5jX21vZGUsDQo+ICsJCQkJCSAgIFZTX1NJTkdMRV9E
Qyk7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGluZm8tPmdhbW1hX3NpemUpIHsNCj4gKwkJcmV0
ID0gZHJtX21vZGVfY3J0Y19zZXRfZ2FtbWFfc2l6ZSgmY3J0Yy0+YmFzZSwNCj4gKwkJCQkJ
CSAgIGluZm8tPmdhbW1hX3NpemUpOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJZ290byBlcnJf
Y2xlYW51cF9jcnRzOw0KPiArDQo+ICsJCWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KCZj
cnRjLT5iYXNlLCAwLCBmYWxzZSwNCj4gKwkJCQkJICAgaW5mby0+Z2FtbWFfc2l6ZSk7DQo+
ICsJfQ0KPiArDQo+ICsJaWYgKGluZm8tPmJhY2tncm91bmQpIHsNCj4gKwkJY3J0Yy0+Ymdf
Y29sb3IgPSBkcm1fcHJvcGVydHlfY3JlYXRlX3JhbmdlKGRybV9kZXYsIDAsDQo+ICsJCQkJ
CQkJICAgIkJHX0NPTE9SIiwgMCwgMHhmZmZmZmZmZik7DQo+ICsNCj4gKwkJaWYgKCFjcnRj
LT5iZ19jb2xvcikNCj4gKwkJCWdvdG8gZXJyX2NsZWFudXBfY3J0czsNCj4gKw0KPiArCQlk
cm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmY3J0Yy0+YmFzZS5iYXNlLCBjcnRjLT5iZ19j
b2xvciwgMCk7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGluZm8tPnBhbmVsX3N5bmMpIHsNCj4g
KwkJY3J0Yy0+cGFuZWxfc3luYyA9IGRybV9wcm9wZXJ0eV9jcmVhdGVfYm9vbChkcm1fZGV2
LCAwLCAiU1lOQ19FTkFCTEVEIik7DQo+ICsNCj4gKwkJaWYgKCFjcnRjLT5wYW5lbF9zeW5j
KQ0KPiArCQkJZ290byBlcnJfY2xlYW51cF9jcnRzOw0KPiArDQo+ICsJCWRybV9vYmplY3Rf
YXR0YWNoX3Byb3BlcnR5KCZjcnRjLT5iYXNlLmJhc2UsIGNydGMtPnBhbmVsX3N5bmMsIDAp
Ow0KPiArCX0NCj4gKw0KPiArCWNydGMtPmRpdGhlciA9IGRybV9wcm9wZXJ0eV9jcmVhdGVf
Ym9vbChkcm1fZGV2LCAwLCAiRElUSEVSX0VOQUJMRUQiKTsNCj4gKwlpZiAoIWNydGMtPmRp
dGhlcikNCj4gKwkJZ290byBlcnJfY2xlYW51cF9jcnRzOw0KPiArDQo+ICsJZHJtX29iamVj
dF9hdHRhY2hfcHJvcGVydHkoJmNydGMtPmJhc2UuYmFzZSwgY3J0Yy0+ZGl0aGVyLCAwKTsN
Cj4gKw0KPiArCWNydGMtPm1heF9icGMgPSBpbmZvLT5tYXhfYnBjOw0KPiArCWNydGMtPmNv
bG9yX2Zvcm1hdHMgPSBpbmZvLT5jb2xvcl9mb3JtYXRzOw0KPiArCXJldHVybiBjcnRjOw0K
PiArDQo+ICtlcnJfY2xlYW51cF9jcnRzOg0KPiArCWRybV9jcnRjX2NsZWFudXAoJmNydGMt
PmJhc2UpOw0KPiArDQo+ICtlcnJfZnJlZV9jcnRjOg0KPiArCWtmcmVlKGNydGMpOw0KPiAr
CXJldHVybiBOVUxMOw0KPiArfQ0KPiArDQo+ICt2b2lkIHZzX2NydGNfaGFuZGxlX3ZibGFu
ayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgdW5kZXJmbG93KQ0KPiArew0KPiArCXN0
cnVjdCB2c19jcnRjX3N0YXRlICp2c19jcnRjX3N0YXRlID0gdG9fdnNfY3J0Y19zdGF0ZShj
cnRjLT5zdGF0ZSk7DQo+ICsNCj4gKwlkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKGNydGMpOw0K
PiArDQo+ICsJdnNfY3J0Y19zdGF0ZS0+dW5kZXJmbG93ID0gdW5kZXJmbG93Ow0KPiArfQ0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2NydGMuaCBi
L2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19jcnRjLmgNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zM2IzYjE0MjQ5Y2UNCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfY3J0Yy5o
DQo+IEBAIC0wLDAgKzEsNzQgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChDKSAyMDIzIFZlcmlTaWxpY29u
IEhvbGRpbmdzIENvLiwgTHRkLg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgX19WU19DUlRD
X0hfXw0KPiArI2RlZmluZSBfX1ZTX0NSVENfSF9fDQo+ICsNCj4gKyNpbmNsdWRlIDxkcm0v
ZHJtX2NydGMuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+DQo+ICsN
Cj4gKyNpbmNsdWRlICJ2c190eXBlLmgiDQo+ICsNCj4gK3N0cnVjdCB2c19jcnRjX2Z1bmNz
IHsNCj4gKwl2b2lkICgqZW5hYmxlKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1f
Y3J0YyAqY3J0Yyk7DQo+ICsJdm9pZCAoKmRpc2FibGUpKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRybV9jcnRjICpjcnRjKTsNCj4gKwlib29sICgqbW9kZV9maXh1cCkoc3RydWN0
IGRldmljZSAqZGV2LA0KPiArCQkJICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km1vZGUsDQo+ICsJCQkgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9k
ZSk7DQo+ICsJdm9pZCAoKnNldF9nYW1tYSkoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMsDQo+ICsJCQkgIHN0cnVjdCBkcm1fY29sb3JfbHV0ICpsdXQsIHVu
c2lnbmVkIGludCBzaXplKTsNCj4gKwl2b2lkICgqZW5hYmxlX2dhbW1hKShzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gKwkJCSAgICAgYm9vbCBlbmFi
bGUpOw0KPiArCXZvaWQgKCplbmFibGVfdmJsYW5rKShzdHJ1Y3QgZGV2aWNlICpkZXYsIGJv
b2wgZW5hYmxlKTsNCj4gKwl2b2lkICgqY29tbWl0KShzdHJ1Y3QgZGV2aWNlICpkZXYpOw0K
PiArfTsNCg0KV2h5IGlzIHRoaXMgaGVyZT8gWW91IGFyZSByZXByb2R1Y2luZyBvdXIgaW50
ZXJmYWNlIHdpdGggYW4gaW50ZXJuYWwgDQppbnRlcmZhY2UuIEkga25vdyB3aGVyZSB0aGlz
IGxlYWRzIHRvOiB5b3UgaGF2ZSBtdWx0aXBsZSBjaGlwc2V0IA0KcmV2aXNpb25zIGFuZCBl
YWNoIGhhcyBpdHMgb3duIGltcGxlbWVuYXRpb24gb2YgdGhlc2UgaW50ZXJuYWwgaW50ZXJm
YWNlcy4NCg0KVGhhdCB3aWxsIGFic29sdXRlbHkgY29tZSBiYWNrIHRvIGhhdW50IHlvdSBp
biB0aGUgbG9uZyBydW5nOiB0aGUgbW9yZSANCmNoaXAgcmV2aXNpb25zIHlvdSBzdXBwb3J0
LCB0aGUgbW9yZSBvYnNjdXJlIHRoZXNlIGludGVybmFsIGludGVyZmFjZXMgDQphbmQgaW1w
bGVudGF0aW9ucyBiZWNvbWUuIEFuZCB5b3Ugd29uJ3QgYmUgYWJsZSB0byBjaGFuZ2UgdGhl
c2UgDQpjYWxsYmFja3MsIGFzIHRoYXQgYWZmZWN0cyBhbGwgcmV2aXNpb25zLiBXZSd2ZSBz
ZWVuIHRoaXMgd2l0aCBhIGZldyANCmRyaXZlcnMuIEl0IHdpbGwgYmVjb21lIHVubWFpbnRh
aW5hYmxlLg0KDQpBIGJldHRlciBhcHByb2FjaCBpcyB0byB0cmVhdCBEUk0ncyBhdG9taWMg
Y2FsbGJhY2sgZnVuY3MgYW5kIGF0b21pYyANCmhlbHBlciBmdW5jcyBhcyB5b3VyIGludGVy
ZmFjZSBmb3IgZWFjaCBjaGlwIHJldmlzaW9uLiBTbyBmb3IgZWFjaCANCm1vZGVsLCB5b3Ug
aW1wbGVtZW50IGEgc2VwYXJhdGUgbW9kZXNldHRpbmcgcGlwZWxpbmUuIFdoZW4geW91IGFk
ZCBhIG5ldyANCmNoaXAgcmV2aXNpb24sIHlvdSBjb3B5IHRoZSBwcmV2aW91cyBjaGlwJ3Mg
Y29kZSBpbnRvIGEgbmV3IGZpbGUgYW5kIA0KYWRvcHQgaXQuIElmIHlvdSBmaW5kIGNvbW9u
IGNvZGUgYW1vbmcgaW5kaXZpZHVhbCByZXZpc2lvbnMsIHlvdSBjYW4gcHV0IA0KaXQgaW50
byBhIHNoYXJlZCBoZWxwZXIuICBXaXRoIHRoaXMgZGVzaWduLCBlYWNoIGNoaXAgcmV2aXNp
b24gc3RhbmRzIG9uIA0KaXRzIG93bi4NCg0KSSBzdWdnZXN0IHRvIHN0dWR5IHRoZSBtZ2Fn
MjAwIGRyaXZlci4gSXQgZGV0ZWN0cyB0aGUgY2hpcCByZXZpc2lvbiB2ZXJ5IA0KZWFybHkg
YW5kIGJ1aWxkcyBhIGNoaXAtc3BlY2lmaWMgbW9kZXNldHRpbmcgcGlwbGluZS4gQWx0aG91
Z2ggZWFjaCBjaGlwIA0KaXMgaGFuZGxlZCBzZXBhcmF0ZWx5LCBhIGxvdCBvZiBzaGFyZWQg
Y29kZSBpcyBpbiBoZWxwZXJzLiBTbyB0aGUgc2l6ZSANCm9mIHRoZSBkcml2ZXIgcmVtYWlu
cyBzbWFsbC4NCg0KPiArDQo+ICtzdHJ1Y3QgdnNfY3J0Y19zdGF0ZSB7DQo+ICsJc3RydWN0
IGRybV9jcnRjX3N0YXRlIGJhc2U7DQo+ICsNCj4gKwl1MzIgc3luY19tb2RlOw0KPiArCXUz
MiBvdXRwdXRfZm10Ow0KPiArCXUzMiBiZ19jb2xvcjsNCj4gKwl1OCBlbmNvZGVyX3R5cGU7
DQo+ICsJdTggbW11X3ByZWZldGNoOw0KPiArCXU4IGJwcDsNCj4gKwlib29sIHN5bmNfZW5h
YmxlOw0KPiArCWJvb2wgZGl0aGVyX2VuYWJsZTsNCj4gKwlib29sIHVuZGVyZmxvdzsNCj4g
K307DQo+ICsNCj4gK3N0cnVjdCB2c19jcnRjIHsNCj4gKwlzdHJ1Y3QgZHJtX2NydGMgYmFz
ZTsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXY7DQoNClRoYXQncyBzdG9yZWQgaW4gYmFzZS5k
ZXYgYWxyZWFkeS4NCg0KPiArCXN0cnVjdCBkcm1fcGVuZGluZ192YmxhbmtfZXZlbnQgKmV2
ZW50Ow0KDQpUaGF0J3MgaW4gZHJtX2NydGNfc3RhdGUuZXZlbnQgYWxyZWFkeS4NCg0KPiAr
CXVuc2lnbmVkIGludCBtYXhfYnBjOw0KPiArCXVuc2lnbmVkIGludCBjb2xvcl9mb3JtYXRz
OyAvKiBzdXBwb3J0ZWQgY29sb3IgZm9ybWF0ICovDQoNClRoZXNlIGNvbWUgZnJvbSBhIHZz
X2RjX2luZm8uIFdoeSBub3QganVzdCBzdG9yZSBhIHBvaW50ZXIgdG8gdGhlIGluZm8gDQpp
bnN0ZWFkPw0KDQo+ICsNCj4gKwlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpzeW5jX21vZGU7DQo+
ICsJc3RydWN0IGRybV9wcm9wZXJ0eSAqbW11X3ByZWZldGNoOw0KPiArCXN0cnVjdCBkcm1f
cHJvcGVydHkgKmJnX2NvbG9yOw0KPiArCXN0cnVjdCBkcm1fcHJvcGVydHkgKnBhbmVsX3N5
bmM7DQo+ICsJc3RydWN0IGRybV9wcm9wZXJ0eSAqZGl0aGVyOw0KPiArDQo+ICsJY29uc3Qg
c3RydWN0IHZzX2NydGNfZnVuY3MgKmZ1bmNzOw0KDQpQbGVhc2UsIHNlZSBteSByYW50IHdo
eSB0aGF0J3Mgbm90IGEgZ29vZCBpZGVhLg0KDQo+ICt9Ow0KPiArDQo+ICt2b2lkIHZzX2Ny
dGNfZGVzdHJveShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOw0KPiArDQo+ICtzdHJ1Y3QgdnNf
Y3J0YyAqdnNfY3J0Y19jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYsDQo+ICsJ
CQkgICAgICAgc3RydWN0IHZzX2RjX2luZm8gKmluZm8pOw0KPiArdm9pZCB2c19jcnRjX2hh
bmRsZV92Ymxhbmsoc3RydWN0IGRybV9jcnRjICpjcnRjLCBib29sIHVuZGVyZmxvdyk7DQo+
ICsNCj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHZzX2NydGMgKnRvX3ZzX2NydGMoc3RydWN0
IGRybV9jcnRjICpjcnRjKQ0KPiArew0KPiArCXJldHVybiBjb250YWluZXJfb2YoY3J0Yywg
c3RydWN0IHZzX2NydGMsIGJhc2UpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHN0
cnVjdCB2c19jcnRjX3N0YXRlICoNCj4gK3RvX3ZzX2NydGNfc3RhdGUoc3RydWN0IGRybV9j
cnRjX3N0YXRlICpzdGF0ZSkNCj4gK3sNCj4gKwlyZXR1cm4gY29udGFpbmVyX29mKHN0YXRl
LCBzdHJ1Y3QgdnNfY3J0Y19zdGF0ZSwgYmFzZSk7DQo+ICt9DQo+ICsjZW5kaWYgLyogX19W
U19DUlRDX0hfXyAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxp
Y29uL3ZzX3R5cGUuaCBiL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c190eXBlLmgN
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi42ZjhkYjY1
YTcwM2QNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNp
bGljb24vdnNfdHlwZS5oDQo+IEBAIC0wLDAgKzEsNzIgQEANCj4gKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChDKSAy
MDIzIFZlcmlTaWxpY29uIEhvbGRpbmdzIENvLiwgTHRkLg0KPiArICovDQo+ICsNCj4gKyNp
Zm5kZWYgX19WU19UWVBFX0hfXw0KPiArI2RlZmluZSBfX1ZTX1RZUEVfSF9fDQo+ICsNCj4g
KyNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+DQoNCldoeT8NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiArDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wbGFuZS5oPg0KPiArI2luY2x1
ZGUgPGRybS9kcm1fcGxhbmVfaGVscGVyLmg+DQo+ICsNCj4gK3N0cnVjdCB2c19wbGFuZV9p
bmZvIHsNCj4gKwljb25zdCBjaGFyICpuYW1lOw0KPiArCXU4IGlkOw0KPiArCWVudW0gZHJt
X3BsYW5lX3R5cGUgdHlwZTsNCj4gKwl1bnNpZ25lZCBpbnQgbnVtX2Zvcm1hdHM7DQo+ICsJ
Y29uc3QgdTMyICpmb3JtYXRzOw0KPiArCXU4IG51bV9tb2RpZmllcnM7DQo+ICsJY29uc3Qg
dTY0ICptb2RpZmllcnM7DQo+ICsJdW5zaWduZWQgaW50IG1pbl93aWR0aDsNCj4gKwl1bnNp
Z25lZCBpbnQgbWluX2hlaWdodDsNCj4gKwl1bnNpZ25lZCBpbnQgbWF4X3dpZHRoOw0KPiAr
CXVuc2lnbmVkIGludCBtYXhfaGVpZ2h0Ow0KPiArCXVuc2lnbmVkIGludCByb3RhdGlvbjsN
Cj4gKwl1bnNpZ25lZCBpbnQgYmxlbmRfbW9kZTsNCj4gKwl1bnNpZ25lZCBpbnQgY29sb3Jf
ZW5jb2Rpbmc7DQo+ICsNCj4gKwkvKiAwIG1lYW5zIG5vIGRlLWdhbW1hIExVVCAqLw0KPiAr
CXVuc2lnbmVkIGludCBkZWdhbW1hX3NpemU7DQo+ICsNCj4gKwlpbnQgbWluX3NjYWxlOyAv
KiAxNi4xNiBmaXhlZCBwb2ludCAqLw0KPiArCWludCBtYXhfc2NhbGU7IC8qIDE2LjE2IGZp
eGVkIHBvaW50ICovDQo+ICsNCj4gKwkvKiBkZWZhdWx0IHpvcmRlciB2YWx1ZSwNCj4gKwkg
KiBhbmQgMjU1IG1lYW5zIHVuc3VwcG9ydGVkIHpvcmRlciBjYXBhYmlsaXR5DQo+ICsJICov
DQo+ICsJdTgJIHpwb3M7DQo+ICsNCj4gKwlib29sIHdhdGVybWFyazsNCj4gKwlib29sIGNv
bG9yX21nbXQ7DQo+ICsJYm9vbCByb2k7DQo+ICt9Ow0KPiArDQo+ICtzdHJ1Y3QgdnNfZGNf
aW5mbyB7DQo+ICsJY29uc3QgY2hhciAqbmFtZTsNCj4gKw0KPiArCXU4IHBhbmVsX251bTsN
Cj4gKw0KPiArCS8qIHBsYW5lcyAqLw0KPiArCXU4IHBsYW5lX251bTsNCj4gKwljb25zdCBz
dHJ1Y3QgdnNfcGxhbmVfaW5mbyAqcGxhbmVzOw0KPiArDQo+ICsJdTggbGF5ZXJfbnVtOw0K
PiArCXVuc2lnbmVkIGludCBtYXhfYnBjOw0KPiArCXVuc2lnbmVkIGludCBjb2xvcl9mb3Jt
YXRzOw0KPiArDQo+ICsJLyogMCBtZWFucyBubyBnYW1tYSBMVVQgKi8NCj4gKwl1MTYgZ2Ft
bWFfc2l6ZTsNCj4gKwl1OCBnYW1tYV9iaXRzOw0KPiArDQo+ICsJdTE2IHBpdGNoX2FsaWdu
bWVudDsNCj4gKw0KPiArCWJvb2wgcGlwZV9zeW5jOw0KPiArCWJvb2wgbW11X3ByZWZldGNo
Ow0KPiArCWJvb2wgYmFja2dyb3VuZDsNCj4gKwlib29sIHBhbmVsX3N5bmM7DQo+ICsJYm9v
bCBjYXBfZGVjOw0KPiArfTsNCj4gKw0KPiArI2VuZGlmIC8qIF9fVlNfVFlQRV9IX18gKi8N
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------HnxxtKxM70qkufM0uDcOrcr2--

--------------tN2IYGVjIdwxc4q2re7JoQQg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSewp0FAwAAAAAACgkQlh/E3EQov+Ad
+w/9Flx3yKl2/FCLSo08ChQaaRwx8WO4x2pEW+X7b1IQVVjPJQXRcjcwxX98wWGEEftC+7A4IfG2
pxlJ8KaMtXvV6tMp5hiPSTrs70u0xVBrcIsjOVsHJo3M880R4Rm6P/M7Ywpd9K5zyoGEc6WvIT1L
qsKU/9pWdqaPJDtoAbc2G+88dv6R0NFr915KRqo9RnNFmJrsy1gMVjJkkUnG8ZesFqhUtMffF7nE
T3ayp0R4poIvyFfzSE02wretN9uODGujTWxjLChafYD935vBH7c8cc8UB1DIeMezeodu03CYqgFJ
/uR4IEsBuizeSyPygegllZoAJsM/geoZIDgH2kaOaOIqzwrUJDenQULV/Urw7+NFAzWlR93PlJmw
Q1ZD5Qc7omXdh6bRPZkqmsiCVtd+phygqihpmvv4sL0zH0az9T9VDL32uH0EMW92db+zq/ydvpKN
juqnzE4z8Vysd6d6Qwk+n/JjemSJ4oD/gEuYGDnS0HnSLAXvu+Nl0/p89gN1fHd3ry7qZaB4JuUL
AFPSkMg/1XxdmTqIFc/+cNlVGDMEkpG422akRDdInKM+/HzS8HUvaeGmkB0IXyQBe6FxpCUhkKpC
Iz1QIu/t56kLuVUHXGUIi2wNsQV5S19dSqsxdCBZ8E07A4tp6R5p6Q3Xbna3VfanXCH4XDiihwI7
DEA=
=XZS9
-----END PGP SIGNATURE-----

--------------tN2IYGVjIdwxc4q2re7JoQQg--
