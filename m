Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C47305AFE1A
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 09:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiIGHvg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 03:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbiIGHvI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 03:51:08 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96FEA8CC5;
        Wed,  7 Sep 2022 00:50:59 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 052AC33A6A;
        Wed,  7 Sep 2022 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1662537058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Vy5SlEr2ku17EifmtWNioZleCzkfjIrymn3XBr57Z4o=;
        b=s1IISSoIrHeA8FzVOYzbYTJLujTA4rQGNwI9rLgywfhFKMMXvOJSPpRLfqcDs/aS7siHdD
        1WyMP1KfVJc59fxpMAbB8wrrWeOGqOTcOws5/j7XxTOLtOeeG03xVRMgWUfXQf5w1E40NX
        Zso1tk7dXwMoyOIRw1E776dza3pU/I0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1662537058;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Vy5SlEr2ku17EifmtWNioZleCzkfjIrymn3XBr57Z4o=;
        b=nQLPl8G2DVWgCcb0hhzV1Kpy7ytAj04n7LfW3dSPe9Ul6gGuxlGpN3iK4JUB/Yj/is+aVe
        6OXX2Y3GkM5TGiAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B079D13A66;
        Wed,  7 Sep 2022 07:50:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id gyInKmFNGGMyBQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 07:50:57 +0000
Message-ID: <5bc77d8f-928c-1d41-9b3c-eaad1bf3cfff@suse.de>
Date:   Wed, 7 Sep 2022 09:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] drm/ast: add dmabuf/prime buffer sharing support
Content-Language: en-US
To:     oushixiong <oushixiong@kylinos.cn>,
        Dave Airlie <airlied@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linaro-mm-sig@lists.linaro.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org
References: <20220901124451.2523077-1-oushixiong@kylinos.cn>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220901124451.2523077-1-oushixiong@kylinos.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------l0wfRm9CxlkXThZQ0NybHbvN"
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------l0wfRm9CxlkXThZQ0NybHbvN
Content-Type: multipart/mixed; boundary="------------FEenIKxhqnvAIsvN71G2jWdY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: oushixiong <oushixiong@kylinos.cn>, Dave Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, linux-media@vger.kernel.org
Message-ID: <5bc77d8f-928c-1d41-9b3c-eaad1bf3cfff@suse.de>
Subject: Re: [PATCH v3] drm/ast: add dmabuf/prime buffer sharing support
References: <20220901124451.2523077-1-oushixiong@kylinos.cn>
In-Reply-To: <20220901124451.2523077-1-oushixiong@kylinos.cn>

--------------FEenIKxhqnvAIsvN71G2jWdY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm9uIGEgbW9yZSBnZW5lcmFsIG5vdGUsIGxldCBtZSBzYXkgdGhhdCB5b3VyIHBh
dGNoIGRvZXNuJ3Qgc2VlbSB0byBmaXQgDQp0aGUgaWRlYXMgb2YgaG93IGJ1ZmZlciBzaGFy
aW5nIGlzIHN1cHBvc2VkIHRvIHdvcmsuIFlvdXIgcGF0Y2ggZG9lcyB0aGUgDQpCTUMgc2Ny
ZWVuIHVwZGF0ZSAnYmVoaW5kIHRoZSBzY2VuZXMuJw0KDQpTaG91bGRuJ3QgdXNlcnNwYWNl
IHNldCB1cCB0aGUgRFJNIHN0YXRlIGZvciBtaXJyb3JpbmcgdGhlIG91dHB1dCBvZiB0aGUg
DQpkaXNjcmV0ZSBjYXJkIHRvIHRoZSBCTUM/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
CkFtIDAxLjA5LjIyIHVtIDE0OjQ0IHNjaHJpZWIgb3VzaGl4aW9uZzoNCj4gDQo+IFRoaXMg
cGF0Y2ggYWRkcyBhc3Qgc3BlY2lmaWMgY29kZXMgZm9yIERSTSBwcmltZSBmZWF0dXJlLCB0
aGlzIGlzIHRvDQo+IGFsbG93IGZvciBvZmZsb2FkaW5nIG9mIHJlbmRpbmcgaW4gb25lIGRp
cmVjdGlvbiBhbmQgb3V0cHV0cyBpbiBvdGhlci4NCj4gDQo+IFRoaXMgcGF0Y2ggaXMgZGVz
aWduZWQgdG8gc29sdmUgdGhlIHByb2JsZW0gdGhhdCB0aGUgQVNUIGlzIG5vdCBkaXNwbGF5
ZWQNCj4gd2hlbiB0aGUgc2VydmVyIHBsdWcgaW4gYSBkaXNjcmV0ZSBncmFwaGljcyBjYXJk
IGF0IHRoZSBzYW1lIHRpbWUuDQo+IFdlIGNhbGwgdGhlIGRpcnR5IGNhbGxiYWNrIGZ1bmN0
aW9uIHRvIGNvcHkgdGhlIHJlbmRlcmluZyByZXN1bHRzIG9mIHRoZQ0KPiBkaXNjcmV0ZSBn
cmFwaGljcyBjYXJkIHRvIHRoZSBhc3Qgc2lkZSBieSBkbWEtYnVmLg0KPiANCj4gdjEtPnYy
Og0KPiAgICAtIEZpeCB0aGUgY29tbWVudC4NCj4gdjItPnYzOg0KPiAgICAtIHdlIHJlbW92
ZSB0aGUgZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSBjYWxsYmFjayBhbmQgdXNlIHRoZQ0K
PiAgICAgIGdlbV9wcmltZV9pbXBvcnQgY2FsbGJhY2ssIGJlY2F1c2UgaXQganVzdCBtYXAg
YW5kIGFjY2VzcyB0aGUgYnVmZmVyDQo+ICAgICAgd2l0aCB0aGUgQ1BVLiBhbmQgZG8gbm90
IHRvIHBpbiB0aGUgYnVmZmVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogb3VzaGl4aW9uZyA8
b3VzaGl4aW9uZ0BreWxpbm9zLmNuPg0KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9kcnYuYyAgfCAgMjcgKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3Qv
YXN0X21vZGUuYyB8IDEyNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDE1MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYw0KPiBpbmRleCA3NDY1YzRmMDE1NmEuLmZkM2M0
YmFkMmViNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4gQEAgLTI4LDYgKzI4
LDcgQEANCj4gICANCj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAgI2luY2x1
ZGUgPGxpbnV4L3BjaS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4NCj4gICAN
Cj4gICAjaW5jbHVkZSA8ZHJtL2RybV9hcGVydHVyZS5oPg0KPiAgICNpbmNsdWRlIDxkcm0v
ZHJtX2F0b21pY19oZWxwZXIuaD4NCj4gQEAgLTUwLDYgKzUxLDI5IEBAIG1vZHVsZV9wYXJh
bV9uYW1lZChtb2Rlc2V0LCBhc3RfbW9kZXNldCwgaW50LCAwNDAwKTsNCj4gICANCj4gICBE
RUZJTkVfRFJNX0dFTV9GT1BTKGFzdF9mb3BzKTsNCj4gICANCj4gK3N0YXRpYyBzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKmFzdF9nZW1fcHJpbWVfaW1wb3J0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsDQo+ICsJCQkJCQlzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikNCj4gK3sNCj4gKwlz
dHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZ2JvOw0KPiArDQo+ICsJZ2JvID0gZHJtX2dl
bV92cmFtX29mX2dlbShkbWFfYnVmLT5wcml2KTsNCj4gKwlpZiAoZ2JvLT5iby5iYXNlLmRl
diA9PSBkZXYpIHsNCj4gKwkJLyoNCj4gKwkJICogSW1wb3J0aW5nIGRtYWJ1ZiBleHBvcnRl
ZCBmcm9tIG91dCBvd24gZ2VtIGluY3JlYXNlcw0KPiArCQkgKiByZWZjb3VudCBvbiBnZW0g
aXRzZWxmIGluc3RlYWQgb2YgZl9jb3VudCBvZiBkbWFidWYuDQo+ICsJCSAqLw0KPiArCQlk
cm1fZ2VtX29iamVjdF9nZXQoJmdiby0+Ym8uYmFzZSk7DQo+ICsJCXJldHVybiAmZ2JvLT5i
by5iYXNlOw0KPiArCX0NCj4gKw0KPiArCWdibyA9IGRybV9nZW1fdnJhbV9jcmVhdGUoZGV2
LCBkbWFfYnVmLT5zaXplLCAwKTsNCj4gKwlpZiAoSVNfRVJSKGdibykpDQo+ICsJCXJldHVy
biBOVUxMOw0KPiArDQo+ICsJZ2V0X2RtYV9idWYoZG1hX2J1Zik7DQo+ICsJcmV0dXJuICZn
Ym8tPmJvLmJhc2U7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9k
cml2ZXIgYXN0X2RyaXZlciA9IHsNCj4gICAJLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9B
VE9NSUMgfA0KPiAgIAkJCSAgIERSSVZFUl9HRU0gfA0KPiBAQCAtNjMsNiArODcsOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgYXN0X2RyaXZlciA9IHsNCj4gICAJLm1p
bm9yID0gRFJJVkVSX01JTk9SLA0KPiAgIAkucGF0Y2hsZXZlbCA9IERSSVZFUl9QQVRDSExF
VkVMLA0KPiAgIA0KPiArCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2VtX3ByaW1lX2Zk
X3RvX2hhbmRsZSwNCj4gKwkuZ2VtX3ByaW1lX2ltcG9ydCA9IGFzdF9nZW1fcHJpbWVfaW1w
b3J0LA0KPiArDQo+ICAgCURSTV9HRU1fVlJBTV9EUklWRVINCj4gICB9Ow0KPiAgIA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+IGluZGV4IDQ1YjU2YjM5YWQ0Ny4uNjVhNDM0MmM1
NjIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+IEBAIC00OCw2ICs0OCw4
IEBADQo+ICAgI2luY2x1ZGUgImFzdF9kcnYuaCINCj4gICAjaW5jbHVkZSAiYXN0X3RhYmxl
cy5oIg0KPiAgIA0KPiArTU9EVUxFX0lNUE9SVF9OUyhETUFfQlVGKTsNCj4gKw0KPiAgIHN0
YXRpYyBpbmxpbmUgdm9pZCBhc3RfbG9hZF9wYWxldHRlX2luZGV4KHN0cnVjdCBhc3RfcHJp
dmF0ZSAqYXN0LA0KPiAgIAkJCQkgICAgIHU4IGluZGV4LCB1OCByZWQsIHU4IGdyZWVuLA0K
PiAgIAkJCQkgICAgIHU4IGJsdWUpDQo+IEBAIC0xNTM1LDggKzE1MzcsMTI5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5jcyBhc3RfbW9kZV9j
b25maWdfaGVscGVyX2Z1bmNzID0NCj4gICAJLmF0b21pY19jb21taXRfdGFpbCA9IGRybV9h
dG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbSwNCj4gICB9Ow0KPiAgIA0KPiArc3RhdGlj
IGludCBhc3RfaGFuZGxlX2RhbWFnZShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwgaW50
IHgsIGludCB5LA0KPiArCQkJCQlpbnQgd2lkdGgsIGludCBoZWlnaHQpDQo+ICt7DQo+ICsJ
c3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmRzdF9ibyA9IE5VTEw7DQo+ICsJdm9pZCAq
ZHN0ID0gTlVMTDsNCj4gKwlpbnQgcmV0ID0gMCwgaTsNCj4gKwl1bnNpZ25lZCBsb25nIG9m
ZnNldCA9IDA7DQo+ICsJYm9vbCB1bm1hcCA9IGZhbHNlOw0KPiArCXVuc2lnbmVkIGludCBi
eXRlc1BlclBpeGVsOw0KPiArCXN0cnVjdCBpb3N5c19tYXAgbWFwOw0KPiArCXN0cnVjdCBp
b3N5c19tYXAgZG1hYnVmX21hcDsNCj4gKw0KPiArCWJ5dGVzUGVyUGl4ZWwgPSBmYi0+Zm9y
bWF0LT5jcHBbMF07DQo+ICsNCj4gKwlpZiAoIWZiLT5vYmpbMF0tPmRtYV9idWYpDQo+ICsJ
CXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJaWYgKCFmYi0+b2JqWzBdLT5kbWFfYnVmLT52
bWFwX3B0ci52YWRkcikgew0KPiArCQlyZXQgPSBkbWFfYnVmX3ZtYXAoZmItPm9ialswXS0+
ZG1hX2J1ZiwgJmRtYWJ1Zl9tYXApOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJl
dDsNCj4gKwl9IGVsc2UNCj4gKwkJZG1hYnVmX21hcC52YWRkciA9IGZiLT5vYmpbMF0tPmRt
YV9idWYtPnZtYXBfcHRyLnZhZGRyOw0KPiArDQo+ICsJZHN0X2JvID0gZHJtX2dlbV92cmFt
X29mX2dlbShmYi0+b2JqWzBdKTsNCj4gKw0KPiArCXJldCA9IGRybV9nZW1fdnJhbV9waW4o
ZHN0X2JvLCAwKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCURSTV9FUlJPUigiYXN0X2JvX3Bp
biBmYWlsZWRcbiIpOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCWlmICgh
ZHN0X2JvLT5tYXAudmFkZHIpIHsNCj4gKwkJcmV0ID0gZHJtX2dlbV92cmFtX3ZtYXAoZHN0
X2JvLCAmbWFwKTsNCj4gKwkJaWYgKHJldCkgew0KPiArCQkJZHJtX2dlbV92cmFtX3VucGlu
KGRzdF9ibyk7DQo+ICsJCQlEUk1fRVJST1IoImZhaWxlZCB0byB2bWFwIGZiY29uXG4iKTsN
Cj4gKwkJCXJldHVybiByZXQ7DQo+ICsJCX0NCj4gKwkJdW5tYXAgPSB0cnVlOw0KPiArCX0N
Cj4gKwlkc3QgPSBkc3RfYm8tPm1hcC52YWRkcjsNCj4gKw0KPiArCWZvciAoaSA9IHk7IGkg
PCB5ICsgaGVpZ2h0OyBpKyspIHsNCj4gKwkJb2Zmc2V0ID0gaSAqIGZiLT5waXRjaGVzWzBd
ICsgKHggKiBieXRlc1BlclBpeGVsKTsNCj4gKwkJbWVtY3B5X3RvaW8oZHN0ICsgb2Zmc2V0
LCBkbWFidWZfbWFwLnZhZGRyICsgb2Zmc2V0LA0KPiArCQkJd2lkdGggKiBieXRlc1BlclBp
eGVsKTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAodW5tYXApDQo+ICsJCWRybV9nZW1fdnJhbV92
dW5tYXAoZHN0X2JvLCAmbWFwKTsNCj4gKw0KPiArCWRybV9nZW1fdnJhbV91bnBpbihkc3Rf
Ym8pOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gKw0KPiArc3RhdGljIGlu
dCBhc3RfdXNlcl9mcmFtZWJ1ZmZlcl9kaXJ0eShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpm
YiwNCj4gKwkJCQlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsDQo+ICsJCQkJdW5zaWduZWQgaW50
IGZsYWdzLA0KPiArCQkJCXVuc2lnbmVkIGludCBjb2xvciwNCj4gKwkJCQlzdHJ1Y3QgZHJt
X2NsaXBfcmVjdCAqY2xpcHMsDQo+ICsJCQkJdW5zaWduZWQgaW50IG51bV9jbGlwcykNCj4g
K3sNCj4gKwlpbnQgaSwgcmV0ID0gMDsNCj4gKw0KPiArCWRybV9tb2Rlc2V0X2xvY2tfYWxs
KGZiLT5kZXYpOw0KPiArCWlmIChmYi0+b2JqWzBdLT5kbWFfYnVmKSB7DQo+ICsJCXJldCA9
IGRtYV9idWZfYmVnaW5fY3B1X2FjY2VzcyhmYi0+b2JqWzBdLT5kbWFfYnVmLA0KPiArCQkJ
CURNQV9GUk9NX0RFVklDRSk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlnb3RvIHVubG9jazsN
Cj4gKwl9DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgbnVtX2NsaXBzOyBpKyspIHsNCj4g
KwkJcmV0ID0gYXN0X2hhbmRsZV9kYW1hZ2UoZmIsIGNsaXBzW2ldLngxLCBjbGlwc1tpXS55
MSwNCj4gKwkJCQljbGlwc1tpXS54MiAtIGNsaXBzW2ldLngxLCBjbGlwc1tpXS55MiAtIGNs
aXBzW2ldLnkxKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCWJyZWFrOw0KPiArCX0NCj4gKw0K
PiArCWlmIChmYi0+b2JqWzBdLT5kbWFfYnVmKSB7DQo+ICsJCWRtYV9idWZfZW5kX2NwdV9h
Y2Nlc3MoZmItPm9ialswXS0+ZG1hX2J1ZiwNCj4gKwkJCQlETUFfRlJPTV9ERVZJQ0UpOw0K
PiArCX0NCj4gKw0KPiArdW5sb2NrOg0KPiArCWRybV9tb2Rlc2V0X3VubG9ja19hbGwoZmIt
PmRldik7DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9p
ZCBhc3RfdXNlcl9mcmFtZWJ1ZmZlcl9kZXN0cm95KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIg
KmZiKQ0KPiArew0KPiArCXN0cnVjdCBpb3N5c19tYXAgZG1hYnVmX21hcDsNCj4gKw0KPiAr
CWlmIChmYi0+b2JqWzBdLT5kbWFfYnVmKSB7DQo+ICsJCWRtYWJ1Zl9tYXAuaXNfaW9tZW0g
PSBmYi0+b2JqWzBdLT5kbWFfYnVmLT52bWFwX3B0ci5pc19pb21lbTsNCj4gKwkJZG1hYnVm
X21hcC52YWRkciA9IGZiLT5vYmpbMF0tPmRtYV9idWYtPnZtYXBfcHRyLnZhZGRyOw0KPiAr
CQlpZiAoZG1hYnVmX21hcC52YWRkcikNCj4gKwkJCWRtYV9idWZfdnVubWFwKGZiLT5vYmpb
MF0tPmRtYV9idWYsICZkbWFidWZfbWFwKTsNCj4gKwl9DQo+ICsNCj4gKwlkcm1fZ2VtX2Zi
X2Rlc3Ryb3koZmIpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9m
cmFtZWJ1ZmZlcl9mdW5jcyBhc3RfZ2VtX2ZiX2Z1bmNzX2RpcnR5ZmIgPSB7DQo+ICsJLmRl
c3Ryb3kJPSBhc3RfdXNlcl9mcmFtZWJ1ZmZlcl9kZXN0cm95LA0KPiArCS5jcmVhdGVfaGFu
ZGxlCT0gZHJtX2dlbV9mYl9jcmVhdGVfaGFuZGxlLA0KPiArCS5kaXJ0eQkJPSBhc3RfdXNl
cl9mcmFtZWJ1ZmZlcl9kaXJ0eSwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgZHJt
X2ZyYW1lYnVmZmVyICoNCj4gK2FzdF9nZW1fZmJfY3JlYXRlX3dpdGhfZGlydHkoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxlLA0KPiArCQkJCWNvbnN0
IHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyICptb2RlX2NtZCkNCj4gK3sNCj4gKwlyZXR1cm4g
ZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9mdW5jcyhkZXYsIGZpbGUsIG1vZGVfY21kLA0KPiAr
CQkJCQkmYXN0X2dlbV9mYl9mdW5jc19kaXJ0eWZiKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIGFzdF9tb2RlX2NvbmZpZ19m
dW5jcyA9IHsNCj4gLQkuZmJfY3JlYXRlID0gZHJtX2dlbV9mYl9jcmVhdGUsDQo+ICsJLmZi
X2NyZWF0ZSA9IGFzdF9nZW1fZmJfY3JlYXRlX3dpdGhfZGlydHksDQo+ICAgCS5tb2RlX3Zh
bGlkID0gZHJtX3ZyYW1faGVscGVyX21vZGVfdmFsaWQsDQo+ICAgCS5hdG9taWNfY2hlY2sg
PSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjaywNCj4gICAJLmF0b21pY19jb21taXQgPSBkcm1f
YXRvbWljX2hlbHBlcl9jb21taXQsDQo+IA0KPiANCj4gQ29udGVudC10eXBlOiBUZXh0L3Bs
YWluDQo+IA0KPiBObyB2aXJ1cyBmb3VuZA0KPiAJCUNoZWNrZWQgYnkgSGlsbHN0b25lIE5l
dHdvcmsgQW50aVZpcnVzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------FEenIKxhqnvAIsvN71G2jWdY--

--------------l0wfRm9CxlkXThZQ0NybHbvN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYTWAFAwAAAAAACgkQlh/E3EQov+CU
eA//djBedY9+r6PllsHR/k33KpWjwLBmwe2OQXQNlUibjiNH/U8vP0eAK6wKHdO1+qqTnvpEn1q9
JdbcPbzYI7naP8bN9l3GJQXlxULZ+rPU5KsGNcd+4WRJs9QmxhWJsZon+dcHgoX0Lu4WbBijme6w
AXLf8ZpMucLJiUsDaZukeJAx6SX4ZfdyfyD4lSMLj2C/g8nRNyX+2hnEgueHAHluHEzI/Ov7OPiP
3QJ+l1wiqfYvEfihwkVZ8edGFpRa75c92x/AyeWzobi0R4sVJsT3LQ746HiVfsDSUSrvyK/J4cM4
Gt1ZbIEGjM1+jNrsqucygA5vL6nRYE81wMeqCbWJpR/DPdUf65Nb1clIq+4ekZpCiSmlOcPxiOFy
QVbz5vmeevCJi3a2rzzdeumM8LAClmNO2MBHusxluG4ZmM5G24Ggcjco38bPf4FoXdGQ/BL3iFGN
ri3hyz2ldrtcyAJdKgd4+A7IHNTYN1k9uk1ZznEZH5SAdU9Xln0seokoEAA4TfNdS25KnnsLn1E4
r2aUwoceGy3T9QDhMydq7uz1GECHupK2ayWEHJQJFYUc/PwDyXKs9SDg/Ai1LvCv+HjgNFHThRut
5CmsD1xeEW1uVfUNV97uUHDPhZzas9x5IXsOEZnpf8jqJBkC8lVpSzjKFnzu9De6qUq0ju5sIvIa
1BY=
=xtG8
-----END PGP SIGNATURE-----

--------------l0wfRm9CxlkXThZQ0NybHbvN--
