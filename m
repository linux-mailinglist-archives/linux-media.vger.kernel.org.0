Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB735B00BA
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 11:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbiIGJk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 05:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbiIGJkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 05:40:46 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE96B3B36;
        Wed,  7 Sep 2022 02:40:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id DD90B3379E;
        Wed,  7 Sep 2022 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1662543634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hFR44GoqzHfR0Jqt1EveLX2MXUFXxoqMEfu1b66SZE8=;
        b=BupMgH6r2oOUT+O7RJEqTLyByV1EhXk/W9ie2CNnBGmL1pGhy0B4MGfaEGyWyrUDAKuP1V
        kyhlcMiNMO4WZrYVihFL3Aze8SGgcwXab9NYs3MrlF/9KIZC7rWLbQJoyUcV7VC2fjc1dl
        raNDZVCatDW0oArjlPIof/l8tpUYzks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1662543634;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hFR44GoqzHfR0Jqt1EveLX2MXUFXxoqMEfu1b66SZE8=;
        b=EzjuB1Gulz5p6hN4zf1W8op8jR7tvQlPmilajS4zbQvdrpeDILkt9zbnczj6NF+Tb7KdDS
        oAEZAce0dSNRA+Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAE7813486;
        Wed,  7 Sep 2022 09:40:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FMe0KBJnGGPGNAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 09:40:34 +0000
Message-ID: <f078d10f-9613-d6b1-0ee8-50feaf7d5299@suse.de>
Date:   Wed, 7 Sep 2022 11:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] drm/ast: add dmabuf/prime buffer sharing support
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        oushixiong <oushixiong@kylinos.cn>,
        Dave Airlie <airlied@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
References: <20220901124451.2523077-1-oushixiong@kylinos.cn>
 <5bc77d8f-928c-1d41-9b3c-eaad1bf3cfff@suse.de>
 <ee27c832-a1fd-bc93-9f1b-33f828195e83@amd.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ee27c832-a1fd-bc93-9f1b-33f828195e83@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iJSkgEFYehhnOPYwWvF1fAN2"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iJSkgEFYehhnOPYwWvF1fAN2
Content-Type: multipart/mixed; boundary="------------2cRYgSQDxEbrXRJ7u9n4UTVp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 oushixiong <oushixiong@kylinos.cn>, Dave Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Message-ID: <f078d10f-9613-d6b1-0ee8-50feaf7d5299@suse.de>
Subject: Re: [PATCH v3] drm/ast: add dmabuf/prime buffer sharing support
References: <20220901124451.2523077-1-oushixiong@kylinos.cn>
 <5bc77d8f-928c-1d41-9b3c-eaad1bf3cfff@suse.de>
 <ee27c832-a1fd-bc93-9f1b-33f828195e83@amd.com>
In-Reply-To: <ee27c832-a1fd-bc93-9f1b-33f828195e83@amd.com>

--------------2cRYgSQDxEbrXRJ7u9n4UTVp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDkuMjIgdW0gMTA6MTAgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBJIHdhcyB3b25kZXJpbmcgcHJldHR5IG11Y2ggdGhlIHNh
bWUgdGhpbmcsIGJ1dCB0aGVuIHRob3VnaHQgdGhhdCB0aGlzIA0KPiBtaWdodCBiZSB0aGUg
Zmlyc3Qgc3RlcCB0byBkaXJlY3Qgc2Nhbm91dCBmcm9tIERNQS1idWZzLg0KPiANCj4gSWYg
dGhpcyBpc24ndCB0aGUgY2FzZSB0aGVuIEkgdG8gc2VlIHRoaXMgcmF0aGVyIGNyaXRpY2Fs
bHkgc2luY2UgdGhhdCANCj4gZnVuY3Rpb25hbGl0eSBiZWxvbmdzIGludG8gdXNlcnNwYWNl
Lg0KDQpXaXRoIEdFTSBWUkFNIGhlbHBlcnMsIGFzdCBjdXJyZW50bHkgZG9lc24ndCBzdXBw
b3J0IGRtYS1idWYgc2hhcmluZy4gSSANCmRvIGhhdmUgcGF0Y2hlcyB0aGF0IGNvbnZlcnQg
aXQgdG8gR0VNIFNITUVNIChmb3Igb3RoZXIgcmVhc29ucyksIHdoaWNoIA0Kd291bGQgYWxz
byBhZGQgdGhpcyBmdW5jdGlvbmFsaXR5Lg0KDQpJIGludGVudCB0byBwb3N0IHRoZXNlIHBh
dGNoZXMgaW4gdGhlIGNvbWluZyBkYXlzLiBNeSBzdWdnZXN0aW9uIGlzIHRvIA0KbWVyZ2Ug
dGhlbSBmaXJzdCBhbmQgdGhlbiBzZWUgaG93IHRvIGdvIGZyb20gdGhlcmUuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4gDQo+
IEFtIDA3LjA5LjIyIHVtIDA5OjUwIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+PiBI
aSwNCj4+DQo+PiBvbiBhIG1vcmUgZ2VuZXJhbCBub3RlLCBsZXQgbWUgc2F5IHRoYXQgeW91
ciBwYXRjaCBkb2Vzbid0IHNlZW0gdG8gZml0IA0KPj4gdGhlIGlkZWFzIG9mIGhvdyBidWZm
ZXIgc2hhcmluZyBpcyBzdXBwb3NlZCB0byB3b3JrLiBZb3VyIHBhdGNoIGRvZXMgDQo+PiB0
aGUgQk1DIHNjcmVlbiB1cGRhdGUgJ2JlaGluZCB0aGUgc2NlbmVzLicNCj4+DQo+PiBTaG91
bGRuJ3QgdXNlcnNwYWNlIHNldCB1cCB0aGUgRFJNIHN0YXRlIGZvciBtaXJyb3JpbmcgdGhl
IG91dHB1dCBvZiANCj4+IHRoZSBkaXNjcmV0ZSBjYXJkIHRvIHRoZSBCTUM/DQo+Pg0KPj4g
QmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+PiBBbSAwMS4wOS4yMiB1bSAxNDo0NCBz
Y2hyaWViIG91c2hpeGlvbmc6DQo+Pj4NCj4+PiBUaGlzIHBhdGNoIGFkZHMgYXN0IHNwZWNp
ZmljIGNvZGVzIGZvciBEUk0gcHJpbWUgZmVhdHVyZSwgdGhpcyBpcyB0bw0KPj4+IGFsbG93
IGZvciBvZmZsb2FkaW5nIG9mIHJlbmRpbmcgaW4gb25lIGRpcmVjdGlvbiBhbmQgb3V0cHV0
cyBpbiBvdGhlci4NCj4+Pg0KPj4+IFRoaXMgcGF0Y2ggaXMgZGVzaWduZWQgdG8gc29sdmUg
dGhlIHByb2JsZW0gdGhhdCB0aGUgQVNUIGlzIG5vdCANCj4+PiBkaXNwbGF5ZWQNCj4+PiB3
aGVuIHRoZSBzZXJ2ZXIgcGx1ZyBpbiBhIGRpc2NyZXRlIGdyYXBoaWNzIGNhcmQgYXQgdGhl
IHNhbWUgdGltZS4NCj4+PiBXZSBjYWxsIHRoZSBkaXJ0eSBjYWxsYmFjayBmdW5jdGlvbiB0
byBjb3B5IHRoZSByZW5kZXJpbmcgcmVzdWx0cyBvZiB0aGUNCj4+PiBkaXNjcmV0ZSBncmFw
aGljcyBjYXJkIHRvIHRoZSBhc3Qgc2lkZSBieSBkbWEtYnVmLg0KPj4+DQo+Pj4gdjEtPnYy
Og0KPj4+IMKgwqAgLSBGaXggdGhlIGNvbW1lbnQuDQo+Pj4gdjItPnYzOg0KPj4+IMKgwqAg
LSB3ZSByZW1vdmUgdGhlIGdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgY2FsbGJhY2sgYW5k
IHVzZSB0aGUNCj4+PiDCoMKgwqDCoCBnZW1fcHJpbWVfaW1wb3J0IGNhbGxiYWNrLCBiZWNh
dXNlIGl0IGp1c3QgbWFwIGFuZCBhY2Nlc3MgdGhlIA0KPj4+IGJ1ZmZlcg0KPj4+IMKgwqDC
oMKgIHdpdGggdGhlIENQVS4gYW5kIGRvIG5vdCB0byBwaW4gdGhlIGJ1ZmZlci4NCj4+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IG91c2hpeGlvbmcgPG91c2hpeGlvbmdAa3lsaW5vcy5jbj4N
Cj4+PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPg0KPj4+IC0tLQ0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jwqAg
fMKgIDI3ICsrKysrKysNCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMg
fCAxMjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+Pj4gwqAgMiBmaWxl
cyBjaGFuZ2VkLCAxNTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jIA0KPj4+IGIvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4+PiBpbmRleCA3NDY1YzRmMDE1NmEuLmZk
M2M0YmFkMmViNCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9k
cnYuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jDQo+Pj4gQEAg
LTI4LDYgKzI4LDcgQEANCj4+PiDCoCDCoCAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+
Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPj4+ICsjaW5jbHVkZSA8bGludXgvZG1h
LWJ1Zi5oPg0KPj4+IMKgIMKgICNpbmNsdWRlIDxkcm0vZHJtX2FwZXJ0dXJlLmg+DQo+Pj4g
wqAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPg0KPj4+IEBAIC01MCw2ICs1
MSwyOSBAQCBtb2R1bGVfcGFyYW1fbmFtZWQobW9kZXNldCwgYXN0X21vZGVzZXQsIGludCwg
MDQwMCk7DQo+Pj4gwqAgwqAgREVGSU5FX0RSTV9HRU1fRk9QUyhhc3RfZm9wcyk7DQo+Pj4g
wqAgK3N0YXRpYyBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmFzdF9nZW1fcHJpbWVfaW1wb3J0
KHN0cnVjdCANCj4+PiBkcm1fZGV2aWNlICpkZXYsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRtYV9idWYgKmRtYV9idWYp
DQo+Pj4gK3sNCj4+PiArwqDCoMKgIHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm87
DQo+Pj4gKw0KPj4+ICvCoMKgwqAgZ2JvID0gZHJtX2dlbV92cmFtX29mX2dlbShkbWFfYnVm
LT5wcml2KTsNCj4+PiArwqDCoMKgIGlmIChnYm8tPmJvLmJhc2UuZGV2ID09IGRldikgew0K
Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgICogSW1wb3J0
aW5nIGRtYWJ1ZiBleHBvcnRlZCBmcm9tIG91dCBvd24gZ2VtIGluY3JlYXNlcw0KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgICogcmVmY291bnQgb24gZ2VtIGl0c2VsZiBpbnN0ZWFkIG9mIGZf
Y291bnQgb2YgZG1hYnVmLg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgICovDQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIGRybV9nZW1fb2JqZWN0X2dldCgmZ2JvLT5iby5iYXNlKTsNCj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuICZnYm8tPmJvLmJhc2U7DQo+Pj4gK8KgwqDCoCB9DQo+Pj4g
Kw0KPj4+ICvCoMKgwqAgZ2JvID0gZHJtX2dlbV92cmFtX2NyZWF0ZShkZXYsIGRtYV9idWYt
PnNpemUsIDApOw0KPj4+ICvCoMKgwqAgaWYgKElTX0VSUihnYm8pKQ0KPj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gTlVMTDsNCj4+PiArDQo+Pj4gK8KgwqDCoCBnZXRfZG1hX2J1Zihk
bWFfYnVmKTsNCj4+PiArwqDCoMKgIHJldHVybiAmZ2JvLT5iby5iYXNlOw0KPj4+ICt9DQo+
Pj4gKw0KPj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RyaXZlciBhc3RfZHJpdmVy
ID0gew0KPj4+IMKgwqDCoMKgwqAgLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9BVE9NSUMg
fA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERSSVZFUl9HRU0gfA0K
Pj4+IEBAIC02Myw2ICs4Nyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RyaXZlciBh
c3RfZHJpdmVyID0gew0KPj4+IMKgwqDCoMKgwqAgLm1pbm9yID0gRFJJVkVSX01JTk9SLA0K
Pj4+IMKgwqDCoMKgwqAgLnBhdGNobGV2ZWwgPSBEUklWRVJfUEFUQ0hMRVZFTCwNCj4+PiDC
oCArwqDCoMKgIC5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hh
bmRsZSwNCj4+PiArwqDCoMKgIC5nZW1fcHJpbWVfaW1wb3J0ID0gYXN0X2dlbV9wcmltZV9p
bXBvcnQsDQo+Pj4gKw0KPj4+IMKgwqDCoMKgwqAgRFJNX0dFTV9WUkFNX0RSSVZFUg0KPj4+
IMKgIH07DQo+Pj4gwqAgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21v
ZGUuYyANCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPj4+IGluZGV4
IDQ1YjU2YjM5YWQ0Ny4uNjVhNDM0MmM1NjIyIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3Qv
YXN0X21vZGUuYw0KPj4+IEBAIC00OCw2ICs0OCw4IEBADQo+Pj4gwqAgI2luY2x1ZGUgImFz
dF9kcnYuaCINCj4+PiDCoCAjaW5jbHVkZSAiYXN0X3RhYmxlcy5oIg0KPj4+IMKgICtNT0RV
TEVfSU1QT1JUX05TKERNQV9CVUYpOw0KPj4+ICsNCj4+PiDCoCBzdGF0aWMgaW5saW5lIHZv
aWQgYXN0X2xvYWRfcGFsZXR0ZV9pbmRleChzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCwNCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1OCBpbmRl
eCwgdTggcmVkLCB1OCBncmVlbiwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1OCBibHVlKQ0KPj4+IEBAIC0xNTM1LDggKzE1MzcsMTI5IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgDQo+Pj4gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5j
cyBhc3RfbW9kZV9jb25maWdfaGVscGVyX2Z1bmNzID0NCj4+PiDCoMKgwqDCoMKgIC5hdG9t
aWNfY29tbWl0X3RhaWwgPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0sDQo+
Pj4gwqAgfTsNCj4+PiDCoCArc3RhdGljIGludCBhc3RfaGFuZGxlX2RhbWFnZShzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyICpmYiwgaW50IHgsIA0KPj4+IGludCB5LA0KPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgd2lkdGgsIGludCBoZWlnaHQp
DQo+Pj4gK3sNCj4+PiArwqDCoMKgIHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpkc3Rf
Ym8gPSBOVUxMOw0KPj4+ICvCoMKgwqAgdm9pZCAqZHN0ID0gTlVMTDsNCj4+PiArwqDCoMKg
IGludCByZXQgPSAwLCBpOw0KPj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAw
Ow0KPj4+ICvCoMKgwqAgYm9vbCB1bm1hcCA9IGZhbHNlOw0KPj4+ICvCoMKgwqAgdW5zaWdu
ZWQgaW50IGJ5dGVzUGVyUGl4ZWw7DQo+Pj4gK8KgwqDCoCBzdHJ1Y3QgaW9zeXNfbWFwIG1h
cDsNCj4+PiArwqDCoMKgIHN0cnVjdCBpb3N5c19tYXAgZG1hYnVmX21hcDsNCj4+PiArDQo+
Pj4gK8KgwqDCoCBieXRlc1BlclBpeGVsID0gZmItPmZvcm1hdC0+Y3BwWzBdOw0KPj4+ICsN
Cj4+PiArwqDCoMKgIGlmICghZmItPm9ialswXS0+ZG1hX2J1ZikNCj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgaWYgKCFmYi0+b2Jq
WzBdLT5kbWFfYnVmLT52bWFwX3B0ci52YWRkcikgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXQgPSBkbWFfYnVmX3ZtYXAoZmItPm9ialswXS0+ZG1hX2J1ZiwgJmRtYWJ1Zl9tYXApOw0K
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7DQo+Pj4gK8KgwqDCoCB9IGVsc2UNCj4+PiArwqDCoMKgwqDCoMKg
wqAgZG1hYnVmX21hcC52YWRkciA9IGZiLT5vYmpbMF0tPmRtYV9idWYtPnZtYXBfcHRyLnZh
ZGRyOw0KPj4+ICsNCj4+PiArwqDCoMKgIGRzdF9ibyA9IGRybV9nZW1fdnJhbV9vZl9nZW0o
ZmItPm9ialswXSk7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgcmV0ID0gZHJtX2dlbV92cmFtX3Bp
bihkc3RfYm8sIDApOw0KPj4+ICvCoMKgwqAgaWYgKHJldCkgew0KPj4+ICvCoMKgwqDCoMKg
wqDCoCBEUk1fRVJST1IoImFzdF9ib19waW4gZmFpbGVkXG4iKTsNCj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHJldDsNCj4+PiArwqDCoMKgIH0NCj4+PiArDQo+Pj4gK8KgwqDCoCBp
ZiAoIWRzdF9iby0+bWFwLnZhZGRyKSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGRy
bV9nZW1fdnJhbV92bWFwKGRzdF9ibywgJm1hcCk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChyZXQpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fZ2VtX3ZyYW1fdW5w
aW4oZHN0X2JvKTsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoImZh
aWxlZCB0byB2bWFwIGZiY29uXG4iKTsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gcmV0Ow0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4gK8KgwqDCoMKgwqDCoMKg
IHVubWFwID0gdHJ1ZTsNCj4+PiArwqDCoMKgIH0NCj4+PiArwqDCoMKgIGRzdCA9IGRzdF9i
by0+bWFwLnZhZGRyOw0KPj4+ICsNCj4+PiArwqDCoMKgIGZvciAoaSA9IHk7IGkgPCB5ICsg
aGVpZ2h0OyBpKyspIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgb2Zmc2V0ID0gaSAqIGZiLT5w
aXRjaGVzWzBdICsgKHggKiBieXRlc1BlclBpeGVsKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAg
bWVtY3B5X3RvaW8oZHN0ICsgb2Zmc2V0LCBkbWFidWZfbWFwLnZhZGRyICsgb2Zmc2V0LA0K
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdpZHRoICogYnl0ZXNQZXJQaXhlbCk7DQo+
Pj4gK8KgwqDCoCB9DQo+Pj4gKw0KPj4+ICvCoMKgwqAgaWYgKHVubWFwKQ0KPj4+ICvCoMKg
wqDCoMKgwqDCoCBkcm1fZ2VtX3ZyYW1fdnVubWFwKGRzdF9ibywgJm1hcCk7DQo+Pj4gKw0K
Pj4+ICvCoMKgwqAgZHJtX2dlbV92cmFtX3VucGluKGRzdF9ibyk7DQo+Pj4gKw0KPj4+ICvC
oMKgwqAgcmV0dXJuIDA7DQo+Pj4gK30NCj4+PiArDQo+Pj4gKw0KPj4+ICtzdGF0aWMgaW50
IGFzdF91c2VyX2ZyYW1lYnVmZmVyX2RpcnR5KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZi
LA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9maWxl
ICpmaWxlLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQg
aW50IGZsYWdzLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgaW50IGNvbG9yLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGRybV9jbGlwX3JlY3QgKmNsaXBzLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgaW50IG51bV9jbGlwcykNCj4+PiArew0KPj4+ICvCoMKgwqAg
aW50IGksIHJldCA9IDA7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgZHJtX21vZGVzZXRfbG9ja19h
bGwoZmItPmRldik7DQo+Pj4gK8KgwqDCoCBpZiAoZmItPm9ialswXS0+ZG1hX2J1Zikgew0K
Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBkbWFfYnVmX2JlZ2luX2NwdV9hY2Nlc3MoZmIt
Pm9ialswXS0+ZG1hX2J1ZiwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IERNQV9GUk9NX0RFVklDRSk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpDQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB1bmxvY2s7DQo+Pj4gK8KgwqDCoCB9DQo+
Pj4gKw0KPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IG51bV9jbGlwczsgaSsrKSB7DQo+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGFzdF9oYW5kbGVfZGFtYWdlKGZiLCBjbGlwc1tp
XS54MSwgY2xpcHNbaV0ueTEsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjbGlwc1tpXS54MiAtIGNsaXBzW2ldLngxLCBjbGlwc1tpXS55MiAtIGNsaXBzW2ldLnkx
KTsNCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsNCj4+PiArwqDCoMKgIH0NCj4+PiArDQo+Pj4gK8KgwqDCoCBpZiAo
ZmItPm9ialswXS0+ZG1hX2J1Zikgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfYnVmX2Vu
ZF9jcHVfYWNjZXNzKGZiLT5vYmpbMF0tPmRtYV9idWYsDQo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBETUFfRlJPTV9ERVZJQ0UpOw0KPj4+ICvCoMKgwqAgfQ0KPj4+
ICsNCj4+PiArdW5sb2NrOg0KPj4+ICvCoMKgwqAgZHJtX21vZGVzZXRfdW5sb2NrX2FsbChm
Yi0+ZGV2KTsNCj4+PiArDQo+Pj4gK8KgwqDCoCByZXR1cm4gcmV0Ow0KPj4+ICt9DQo+Pj4g
Kw0KPj4+ICtzdGF0aWMgdm9pZCBhc3RfdXNlcl9mcmFtZWJ1ZmZlcl9kZXN0cm95KHN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgKmZiKQ0KPj4+ICt7DQo+Pj4gK8KgwqDCoCBzdHJ1Y3QgaW9z
eXNfbWFwIGRtYWJ1Zl9tYXA7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgaWYgKGZiLT5vYmpbMF0t
PmRtYV9idWYpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgZG1hYnVmX21hcC5pc19pb21lbSA9
IGZiLT5vYmpbMF0tPmRtYV9idWYtPnZtYXBfcHRyLmlzX2lvbWVtOw0KPj4+ICvCoMKgwqDC
oMKgwqDCoCBkbWFidWZfbWFwLnZhZGRyID0gZmItPm9ialswXS0+ZG1hX2J1Zi0+dm1hcF9w
dHIudmFkZHI7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChkbWFidWZfbWFwLnZhZGRyKQ0K
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9idWZfdnVubWFwKGZiLT5vYmpbMF0t
PmRtYV9idWYsICZkbWFidWZfbWFwKTsNCj4+PiArwqDCoMKgIH0NCj4+PiArDQo+Pj4gK8Kg
wqDCoCBkcm1fZ2VtX2ZiX2Rlc3Ryb3koZmIpOw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBhc3RfZ2VtX2ZiX2Z1bmNz
X2RpcnR5ZmIgPSB7DQo+Pj4gK8KgwqDCoCAuZGVzdHJvecKgwqDCoCA9IGFzdF91c2VyX2Zy
YW1lYnVmZmVyX2Rlc3Ryb3ksDQo+Pj4gK8KgwqDCoCAuY3JlYXRlX2hhbmRsZcKgwqDCoCA9
IGRybV9nZW1fZmJfY3JlYXRlX2hhbmRsZSwNCj4+PiArwqDCoMKgIC5kaXJ0ecKgwqDCoMKg
wqDCoMKgID0gYXN0X3VzZXJfZnJhbWVidWZmZXJfZGlydHksDQo+Pj4gK307DQo+Pj4gKw0K
Pj4+ICtzdGF0aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqDQo+Pj4gK2FzdF9nZW1fZmJf
Y3JlYXRlX3dpdGhfZGlydHkoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9m
aWxlIA0KPj4+ICpmaWxlLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29uc3Qgc3RydWN0IGRybV9tb2RlX2ZiX2NtZDIgKm1vZGVfY21kKQ0KPj4+ICt7DQo+Pj4g
K8KgwqDCoCByZXR1cm4gZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9mdW5jcyhkZXYsIGZpbGUs
IG1vZGVfY21kLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAmYXN0X2dlbV9mYl9mdW5jc19kaXJ0eWZiKTsNCj4+PiArfQ0KPj4+ICsNCj4+PiDCoCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBhc3RfbW9kZV9jb25m
aWdfZnVuY3MgPSB7DQo+Pj4gLcKgwqDCoCAuZmJfY3JlYXRlID0gZHJtX2dlbV9mYl9jcmVh
dGUsDQo+Pj4gK8KgwqDCoCAuZmJfY3JlYXRlID0gYXN0X2dlbV9mYl9jcmVhdGVfd2l0aF9k
aXJ0eSwNCj4+PiDCoMKgwqDCoMKgIC5tb2RlX3ZhbGlkID0gZHJtX3ZyYW1faGVscGVyX21v
ZGVfdmFsaWQsDQo+Pj4gwqDCoMKgwqDCoCAuYXRvbWljX2NoZWNrID0gZHJtX2F0b21pY19o
ZWxwZXJfY2hlY2ssDQo+Pj4gwqDCoMKgwqDCoCAuYXRvbWljX2NvbW1pdCA9IGRybV9hdG9t
aWNfaGVscGVyX2NvbW1pdCwNCj4+Pg0KPj4+DQo+Pj4gQ29udGVudC10eXBlOiBUZXh0L3Bs
YWluDQo+Pj4NCj4+PiBObyB2aXJ1cyBmb3VuZA0KPj4+IMKgwqDCoMKgwqDCoMKgIENoZWNr
ZWQgYnkgSGlsbHN0b25lIE5ldHdvcmsgQW50aVZpcnVzDQo+Pg0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------2cRYgSQDxEbrXRJ7u9n4UTVp--

--------------iJSkgEFYehhnOPYwWvF1fAN2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYZxIFAwAAAAAACgkQlh/E3EQov+C0
VBAAgxMUm7dYmt0YijlCjJ5mC4jud86b7zf7tL/uWrB9w1inHMeM/8PhY64TBnkqJuMo4ilvY4//
Asz9EOZcvUUQKUaqZ94GunGqtzlQNM42fRA872cdnRVd2d9vunQ/k8+QnQjUBsh98Z8Qt/1mRqgP
iEZtsCQ/m/O8Mjdpw6AloY0Oi6PqOaAwTT4mlcMnU24JA3G/CqlNpd0wOTzFMstLJYvVdohci3Bo
qh+tTAghzlAmzjn9NWkTRnU5dDZgrrFP/d6Wc6rf5dOY0w6m5QkH54fSxK4YZC5a9EzoMuczJthp
fDW1lHF4v/EpaVlv7hLGM2S/zfOUThfNeOlOs5DYBWIp7lCGNaa2Gef4Qmsp2GLwtUjVJPrWH9j5
/E55mw51fx1dug3KCQ3a+0OnfMu9ZT91a9cC3kObfzri5ROKFKG9M+PoNcsA36BK4q2LjYIXLawY
PZ0/m/A//5V50Hnh1voO517zLfl01LxyMQxKzdeJ6mfU1YN48f0m7pIY8ybTn2WipGJj6QLwan1I
xpifEPwwiKGMF7jdWHCMO0a/j7eGT4S7HmX69OmbciFBjSPXCmE8vgKr2W/ssn0NrRL3owIXTZqp
NsGbhrrQslGOKlEhgVIbj1nbPwq3rIGcSrbwDlMW6LkBLxiCj6GPoetNAetQwbMaW/2Ruf+vqCd/
1EA=
=TFKj
-----END PGP SIGNATURE-----

--------------iJSkgEFYehhnOPYwWvF1fAN2--
