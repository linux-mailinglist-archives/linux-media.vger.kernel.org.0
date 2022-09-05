Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187C65ACEBE
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 11:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236470AbiIEJTW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 05:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiIEJTU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 05:19:20 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7310A3CBE9;
        Mon,  5 Sep 2022 02:19:19 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2AFBD34AFE;
        Mon,  5 Sep 2022 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1662369558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+KfXzdsej2R8a3SdgchU2S09/NOa+dW7R/tpIWhRf0o=;
        b=m8G1+Tbdjf5pDK2gjqjGzw5eARctZA93qf+6GWCwnssMtOuAk6TB3tf9v90iiUhZDJwXKh
        1Ag+RErjgHIUkhCrdnKEzWyN/IcUx55jTFulqoBI2Gy2e0h68twAY+7+S+H4E6dcg7KYXC
        fuzgSHZtwRPwd1DOBqRMaAR8QGefQw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1662369558;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+KfXzdsej2R8a3SdgchU2S09/NOa+dW7R/tpIWhRf0o=;
        b=8q57l8N+D0mDYznrlqLGvjFnL0dJP8R+xixZUl/cPeZ2tB3wK3kEeyxZ+ztErtChC16i3p
        utPgZR+F5/qu/oAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECD69139C7;
        Mon,  5 Sep 2022 09:19:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id p7PEOBW/FWMmJAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 09:19:17 +0000
Message-ID: <c834cd82-3b55-6ceb-3af0-3a3126fcc354@suse.de>
Date:   Mon, 5 Sep 2022 11:19:17 +0200
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
 boundary="------------ByfTnMX8hi7dxzO6CUZv8nCW"
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ByfTnMX8hi7dxzO6CUZv8nCW
Content-Type: multipart/mixed; boundary="------------FJRCP9xMoQplx469M88CqVVC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: oushixiong <oushixiong@kylinos.cn>, Dave Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, linux-media@vger.kernel.org
Message-ID: <c834cd82-3b55-6ceb-3af0-3a3126fcc354@suse.de>
Subject: Re: [PATCH v3] drm/ast: add dmabuf/prime buffer sharing support
References: <20220901124451.2523077-1-oushixiong@kylinos.cn>
In-Reply-To: <20220901124451.2523077-1-oushixiong@kylinos.cn>

--------------FJRCP9xMoQplx469M88CqVVC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkndmUgYmVlbiBvbiB2YWNhdGlvbi4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5
Lg0KDQpJIGhhdmUgcGxhbnMgdG8gcmVwbGFjZSBhc3QncyBtZW1vcnkgbWFuYWdlciB3aXRo
IHRoZSBHRU0gU0hNRU0gaGVscGVycy4gDQpUaGVzZSBhbHJlYWR5IHN1cHBvcnQgUFJJTUUg
YnVmZmVyIHNoYXJpbmcgYW5kIHRoZSB1c2VjYXNlIHlvdSBkZXNjcmliZS4gDQpJIGFsc28g
Y29uc2lkZXIgdGhlIEdFTSBWUkFNIGhlbHBlcnMgdXNlZCBieSBhc3QgYXMgZGVwcmVjYXRl
ZC4gVGhlcmUncyANCm5vIGJlbmVmaXQgb3ZlciBTSE1FTSBoZWxwZXJzLCBleGNlcHQgd2l0
aCB0aGUgYm9jaHMgZHJpdmVyLiBTbyB3aGF0ZXZlciANCndlIG1lcmdlIGhlcmUsIG1pZ2h0
IG5vdCBsaXZlIGZvciB0b28gbG9uZy4NCg0KQW0gMDEuMDkuMjIgdW0gMTQ6NDQgc2Nocmll
YiBvdXNoaXhpb25nOg0KPiANCj4gVGhpcyBwYXRjaCBhZGRzIGFzdCBzcGVjaWZpYyBjb2Rl
cyBmb3IgRFJNIHByaW1lIGZlYXR1cmUsIHRoaXMgaXMgdG8NCj4gYWxsb3cgZm9yIG9mZmxv
YWRpbmcgb2YgcmVuZGluZyBpbiBvbmUgZGlyZWN0aW9uIGFuZCBvdXRwdXRzIGluIG90aGVy
Lg0KPiANCj4gVGhpcyBwYXRjaCBpcyBkZXNpZ25lZCB0byBzb2x2ZSB0aGUgcHJvYmxlbSB0
aGF0IHRoZSBBU1QgaXMgbm90IGRpc3BsYXllZA0KPiB3aGVuIHRoZSBzZXJ2ZXIgcGx1ZyBp
biBhIGRpc2NyZXRlIGdyYXBoaWNzIGNhcmQgYXQgdGhlIHNhbWUgdGltZS4NCj4gV2UgY2Fs
bCB0aGUgZGlydHkgY2FsbGJhY2sgZnVuY3Rpb24gdG8gY29weSB0aGUgcmVuZGVyaW5nIHJl
c3VsdHMgb2YgdGhlDQo+IGRpc2NyZXRlIGdyYXBoaWNzIGNhcmQgdG8gdGhlIGFzdCBzaWRl
IGJ5IGRtYS1idWYuDQoNCkkgYXNzdW1lIHRoYXQgdXNlcnNwYWNlIGd1YXJhbnRlZXMgdGhh
dCBib3RoLCBBU1BFRUQgYW5kIGRpc2NyZXRlIA0KZGV2aWNlLCBhcmUgc2V0IHRoZSB0aGUg
c2FtZSBkaXNwbGF5IHJlc29sdXRpb24/DQoNCj4gDQo+IHYxLT52MjoNCj4gICAgLSBGaXgg
dGhlIGNvbW1lbnQuDQo+IHYyLT52MzoNCj4gICAgLSB3ZSByZW1vdmUgdGhlIGdlbV9wcmlt
ZV9pbXBvcnRfc2dfdGFibGUgY2FsbGJhY2sgYW5kIHVzZSB0aGUNCj4gICAgICBnZW1fcHJp
bWVfaW1wb3J0IGNhbGxiYWNrLCBiZWNhdXNlIGl0IGp1c3QgbWFwIGFuZCBhY2Nlc3MgdGhl
IGJ1ZmZlcg0KPiAgICAgIHdpdGggdGhlIENQVS4gYW5kIGRvIG5vdCB0byBwaW4gdGhlIGJ1
ZmZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG91c2hpeGlvbmcgPG91c2hpeGlvbmdAa3ls
aW5vcy5jbj4NCj4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMg
IHwgIDI3ICsrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAx
MjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAxNTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpUaGVyZSdzIG5vdGhp
bmcgc3BlY2lmaWNhbGx5IHRvIEFTVCBoZXJlLiBDb3VsZCB0aGlzIGJlIGJ1aWxkIG9uIEdF
TSANClZSQU0gaGVscGVycyBpbnN0ZWFkPyBBIGhhbmRmdWwgb2Ygb3RoZXIgZHJpdmVycyBz
aG91bGQgdGhlbiBiZSBhYmxlIHRvIA0KdXNlIHRoZSBmdW5jdGlvbmFsaXR5Lg0KDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9kcnYuYw0KPiBpbmRleCA3NDY1YzRmMDE1NmEuLmZkM2M0YmFk
MmViNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4gQEAgLTI4LDYgKzI4LDcg
QEANCj4gICANCj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAgI2luY2x1ZGUg
PGxpbnV4L3BjaS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4NCg0KU29ydCBh
bHBoYWJldGljYWxseSBwbGVhc2UuDQoNCj4gICANCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9h
cGVydHVyZS5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4NCj4g
QEAgLTUwLDYgKzUxLDI5IEBAIG1vZHVsZV9wYXJhbV9uYW1lZChtb2Rlc2V0LCBhc3RfbW9k
ZXNldCwgaW50LCAwNDAwKTsNCj4gICANCj4gICBERUZJTkVfRFJNX0dFTV9GT1BTKGFzdF9m
b3BzKTsNCj4gICANCj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmFzdF9nZW1f
cHJpbWVfaW1wb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICsJCQkJCQlzdHJ1Y3Qg
ZG1hX2J1ZiAqZG1hX2J1ZikNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVj
dCAqZ2JvOw0KPiArDQo+ICsJZ2JvID0gZHJtX2dlbV92cmFtX29mX2dlbShkbWFfYnVmLT5w
cml2KTsNCj4gKwlpZiAoZ2JvLT5iby5iYXNlLmRldiA9PSBkZXYpIHsNCj4gKwkJLyoNCj4g
KwkJICogSW1wb3J0aW5nIGRtYWJ1ZiBleHBvcnRlZCBmcm9tIG91dCBvd24gZ2VtIGluY3Jl
YXNlcw0KPiArCQkgKiByZWZjb3VudCBvbiBnZW0gaXRzZWxmIGluc3RlYWQgb2YgZl9jb3Vu
dCBvZiBkbWFidWYuDQo+ICsJCSAqLw0KPiArCQlkcm1fZ2VtX29iamVjdF9nZXQoJmdiby0+
Ym8uYmFzZSk7DQo+ICsJCXJldHVybiAmZ2JvLT5iby5iYXNlOw0KPiArCX0NCj4gKw0KPiAr
CWdibyA9IGRybV9nZW1fdnJhbV9jcmVhdGUoZGV2LCBkbWFfYnVmLT5zaXplLCAwKTsNCj4g
KwlpZiAoSVNfRVJSKGdibykpDQo+ICsJCXJldHVybiBOVUxMOw0KPiArDQo+ICsJZ2V0X2Rt
YV9idWYoZG1hX2J1Zik7DQo+ICsJcmV0dXJuICZnYm8tPmJvLmJhc2U7DQo+ICt9DQo+ICsN
Cj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgYXN0X2RyaXZlciA9IHsNCj4g
ICAJLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9BVE9NSUMgfA0KPiAgIAkJCSAgIERSSVZF
Ul9HRU0gfA0KPiBAQCAtNjMsNiArODcsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9k
cml2ZXIgYXN0X2RyaXZlciA9IHsNCj4gICAJLm1pbm9yID0gRFJJVkVSX01JTk9SLA0KPiAg
IAkucGF0Y2hsZXZlbCA9IERSSVZFUl9QQVRDSExFVkVMLA0KPiAgIA0KPiArCS5wcmltZV9m
ZF90b19oYW5kbGUgPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwNCj4gKwkuZ2VtX3By
aW1lX2ltcG9ydCA9IGFzdF9nZW1fcHJpbWVfaW1wb3J0LA0KPiArDQo+ICAgCURSTV9HRU1f
VlJBTV9EUklWRVINCj4gICB9Ow0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+
IGluZGV4IDQ1YjU2YjM5YWQ0Ny4uNjVhNDM0MmM1NjIyIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfbW9kZS5jDQo+IEBAIC00OCw2ICs0OCw4IEBADQo+ICAgI2luY2x1ZGUgImFzdF9k
cnYuaCINCj4gICAjaW5jbHVkZSAiYXN0X3RhYmxlcy5oIg0KPiAgIA0KPiArTU9EVUxFX0lN
UE9SVF9OUyhETUFfQlVGKTsNCj4gKw0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBhc3RfbG9h
ZF9wYWxldHRlX2luZGV4KHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0LA0KPiAgIAkJCQkgICAg
IHU4IGluZGV4LCB1OCByZWQsIHU4IGdyZWVuLA0KPiAgIAkJCQkgICAgIHU4IGJsdWUpDQo+
IEBAIC0xNTM1LDggKzE1MzcsMTI5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVf
Y29uZmlnX2hlbHBlcl9mdW5jcyBhc3RfbW9kZV9jb25maWdfaGVscGVyX2Z1bmNzID0NCj4g
ICAJLmF0b21pY19jb21taXRfdGFpbCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWls
X3JwbSwNCj4gICB9Ow0KPiAgIA0KPiArc3RhdGljIGludCBhc3RfaGFuZGxlX2RhbWFnZShz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwgaW50IHgsIGludCB5LA0KPiArCQkJCQlpbnQg
d2lkdGgsIGludCBoZWlnaHQpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9nZW1fdnJhbV9vYmpl
Y3QgKmRzdF9ibyA9IE5VTEw7DQo+ICsJdm9pZCAqZHN0ID0gTlVMTDsNCj4gKwlpbnQgcmV0
ID0gMCwgaTsNCj4gKwl1bnNpZ25lZCBsb25nIG9mZnNldCA9IDA7DQo+ICsJYm9vbCB1bm1h
cCA9IGZhbHNlOw0KPiArCXVuc2lnbmVkIGludCBieXRlc1BlclBpeGVsOw0KPiArCXN0cnVj
dCBpb3N5c19tYXAgbWFwOw0KPiArCXN0cnVjdCBpb3N5c19tYXAgZG1hYnVmX21hcDsNCj4g
Kw0KPiArCWJ5dGVzUGVyUGl4ZWwgPSBmYi0+Zm9ybWF0LT5jcHBbMF07DQo+ICsNCj4gKwlp
ZiAoIWZiLT5vYmpbMF0tPmRtYV9idWYpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+
ICsJaWYgKCFmYi0+b2JqWzBdLT5kbWFfYnVmLT52bWFwX3B0ci52YWRkcikgew0KPiArCQly
ZXQgPSBkbWFfYnVmX3ZtYXAoZmItPm9ialswXS0+ZG1hX2J1ZiwgJmRtYWJ1Zl9tYXApOw0K
PiArCQlpZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKwl9IGVsc2UNCj4gKwkJZG1h
YnVmX21hcC52YWRkciA9IGZiLT5vYmpbMF0tPmRtYV9idWYtPnZtYXBfcHRyLnZhZGRyOw0K
DQpJdCdzIHRvbyBsYXRlIHRvIGNhbGwgZG1hX2J1Zl92bWFwKCkgaGVyZS4gVGhlIGNvcnJl
Y3QgcGxhY2Ugd291bGQgYmUgDQpkcm1fcGxhbmVfaGVscGVyX2Z1bmNzLnByZXBhcmVfZmIg
Zm9yIHRoZSB2bWFwIGFuZCB0aGUgcmVzdWx0aW5nIGFkZHJlc3MgDQp3b3VsZCBoYXZlIHRv
IGJlIHN0b3JlZCBpbiBhIFZSQU0gcGxhbmUgc3RhdGUuICBUaGUgdnVubWFwIGNhbGwgd291
bGQgZ28gDQppbnRvIGRybV9wbGFuZV9oZWxwZXJfZnVuY3MuY2xlYW51cF9mYi4NCg0KV2Ug
YWxyZWFkeSBoYXZlIHByZXBhcmVfZmIvY2xlYW51cF9mYiBmb3IgdGhlIFZSQU0gaGVscGVy
cy4gIFRoZXJlJ3Mgbm8gDQpWUkFNLXNwZWNpZmljIHBsYW5lLXN0YXRlIHlldC4NCg0KPiAr
DQo+ICsJZHN0X2JvID0gZHJtX2dlbV92cmFtX29mX2dlbShmYi0+b2JqWzBdKTsNCj4gKw0K
PiArCXJldCA9IGRybV9nZW1fdnJhbV9waW4oZHN0X2JvLCAwKTsNCj4gKwlpZiAocmV0KSB7
DQo+ICsJCURSTV9FUlJPUigiYXN0X2JvX3BpbiBmYWlsZWRcbiIpOw0KPiArCQlyZXR1cm4g
cmV0Ow0KPiArCX0NCg0KTGlrZSB2bWFwLCBwaW5uaW5nIHNob3VsZCBiZSBkb25lIGJ5IHRo
ZSBleGlzdGluZyBwcmVwYXJlX2ZiIGhlbHBlcg0KZHJtX2dlbV92cmFtX3BsYW5lX2hlbHBl
cl9wcmVwYXJlX2ZiKCkuDQoNCj4gKw0KPiArCWlmICghZHN0X2JvLT5tYXAudmFkZHIpIHsN
Cj4gKwkJcmV0ID0gZHJtX2dlbV92cmFtX3ZtYXAoZHN0X2JvLCAmbWFwKTsNCj4gKwkJaWYg
KHJldCkgew0KPiArCQkJZHJtX2dlbV92cmFtX3VucGluKGRzdF9ibyk7DQo+ICsJCQlEUk1f
RVJST1IoImZhaWxlZCB0byB2bWFwIGZiY29uXG4iKTsNCj4gKwkJCXJldHVybiByZXQ7DQo+
ICsJCX0NCj4gKwkJdW5tYXAgPSB0cnVlOw0KPiArCX0NCj4gKwlkc3QgPSBkc3RfYm8tPm1h
cC52YWRkcjsNCj4gKw0KPiArCWZvciAoaSA9IHk7IGkgPCB5ICsgaGVpZ2h0OyBpKyspIHsN
Cj4gKwkJb2Zmc2V0ID0gaSAqIGZiLT5waXRjaGVzWzBdICsgKHggKiBieXRlc1BlclBpeGVs
KTsNCj4gKwkJbWVtY3B5X3RvaW8oZHN0ICsgb2Zmc2V0LCBkbWFidWZfbWFwLnZhZGRyICsg
b2Zmc2V0LA0KPiArCQkJd2lkdGggKiBieXRlc1BlclBpeGVsKTsNCj4gKwl9DQoNCmRybV9m
Yl9tZW1weSgpIGltcGxlbWVudHMgdGhpcyBsb2dpYyBhbHJlYWR5Lg0KDQo+ICsNCj4gKwlp
ZiAodW5tYXApDQo+ICsJCWRybV9nZW1fdnJhbV92dW5tYXAoZHN0X2JvLCAmbWFwKTsNCj4g
Kw0KPiArCWRybV9nZW1fdnJhbV91bnBpbihkc3RfYm8pOw0KDQpDbGVhbnVwIGdvZXMgaW50
byBkcm1fZ2VtX3ZyYW1fcGxhbmVfaGVscGVyX2NsZWFudXBfZmIoKQ0KDQo+ICsNCj4gKwly
ZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArDQo+ICtzdGF0aWMgaW50IGFzdF91c2VyX2ZyYW1l
YnVmZmVyX2RpcnR5KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPiArCQkJCXN0cnVj
dCBkcm1fZmlsZSAqZmlsZSwNCj4gKwkJCQl1bnNpZ25lZCBpbnQgZmxhZ3MsDQo+ICsJCQkJ
dW5zaWduZWQgaW50IGNvbG9yLA0KPiArCQkJCXN0cnVjdCBkcm1fY2xpcF9yZWN0ICpjbGlw
cywNCj4gKwkJCQl1bnNpZ25lZCBpbnQgbnVtX2NsaXBzKQ0KPiArew0KPiArCWludCBpLCBy
ZXQgPSAwOw0KPiArDQo+ICsJZHJtX21vZGVzZXRfbG9ja19hbGwoZmItPmRldik7DQo+ICsJ
aWYgKGZiLT5vYmpbMF0tPmRtYV9idWYpIHsNCj4gKwkJcmV0ID0gZG1hX2J1Zl9iZWdpbl9j
cHVfYWNjZXNzKGZiLT5vYmpbMF0tPmRtYV9idWYsDQo+ICsJCQkJRE1BX0ZST01fREVWSUNF
KTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCWdvdG8gdW5sb2NrOw0KPiArCX0NCg0KVGhpcyBp
cyBhbHJlYWR5IGF2YWlsYWJsZSBpbiBkcm1fZ2VtX2ZiX2JlZ2luX2NwdV9hY2Nlc3MoKQ0K
DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgbnVtX2NsaXBzOyBpKyspIHsNCj4gKwkJcmV0
ID0gYXN0X2hhbmRsZV9kYW1hZ2UoZmIsIGNsaXBzW2ldLngxLCBjbGlwc1tpXS55MSwNCj4g
KwkJCQljbGlwc1tpXS54MiAtIGNsaXBzW2ldLngxLCBjbGlwc1tpXS55MiAtIGNsaXBzW2ld
LnkxKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCWJyZWFrOw0KPiArCX0NCj4gKw0KPiArCWlm
IChmYi0+b2JqWzBdLT5kbWFfYnVmKSB7DQo+ICsJCWRtYV9idWZfZW5kX2NwdV9hY2Nlc3Mo
ZmItPm9ialswXS0+ZG1hX2J1ZiwNCj4gKwkJCQlETUFfRlJPTV9ERVZJQ0UpOw0KDQpUaGF0
J3MgaW4gZHJtX2dlbV9mYl9lbmRfY3B1X2FjY2VzcygpDQoNCj4gKwl9DQo+ICsNCj4gK3Vu
bG9jazoNCj4gKwlkcm1fbW9kZXNldF91bmxvY2tfYWxsKGZiLT5kZXYpOw0KPiArDQo+ICsJ
cmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgYXN0X3VzZXJfZnJhbWVi
dWZmZXJfZGVzdHJveShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikNCj4gK3sNCj4gKwlz
dHJ1Y3QgaW9zeXNfbWFwIGRtYWJ1Zl9tYXA7DQo+ICsNCj4gKwlpZiAoZmItPm9ialswXS0+
ZG1hX2J1Zikgew0KPiArCQlkbWFidWZfbWFwLmlzX2lvbWVtID0gZmItPm9ialswXS0+ZG1h
X2J1Zi0+dm1hcF9wdHIuaXNfaW9tZW07DQo+ICsJCWRtYWJ1Zl9tYXAudmFkZHIgPSBmYi0+
b2JqWzBdLT5kbWFfYnVmLT52bWFwX3B0ci52YWRkcjsNCj4gKwkJaWYgKGRtYWJ1Zl9tYXAu
dmFkZHIpDQo+ICsJCQlkbWFfYnVmX3Z1bm1hcChmYi0+b2JqWzBdLT5kbWFfYnVmLCAmZG1h
YnVmX21hcCk7DQo+ICsJfQ0KPiArDQo+ICsJZHJtX2dlbV9mYl9kZXN0cm95KGZiKTsNCj4g
K30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXJfZnVuY3Mg
YXN0X2dlbV9mYl9mdW5jc19kaXJ0eWZiID0gew0KPiArCS5kZXN0cm95CT0gYXN0X3VzZXJf
ZnJhbWVidWZmZXJfZGVzdHJveSwNCj4gKwkuY3JlYXRlX2hhbmRsZQk9IGRybV9nZW1fZmJf
Y3JlYXRlX2hhbmRsZSwNCj4gKwkuZGlydHkJCT0gYXN0X3VzZXJfZnJhbWVidWZmZXJfZGly
dHksDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqDQo+
ICthc3RfZ2VtX2ZiX2NyZWF0ZV93aXRoX2RpcnR5KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwNCj4gKwkJCQljb25zdCBzdHJ1Y3QgZHJtX21vZGVf
ZmJfY21kMiAqbW9kZV9jbWQpDQo+ICt7DQo+ICsJcmV0dXJuIGRybV9nZW1fZmJfY3JlYXRl
X3dpdGhfZnVuY3MoZGV2LCBmaWxlLCBtb2RlX2NtZCwNCj4gKwkJCQkJJmFzdF9nZW1fZmJf
ZnVuY3NfZGlydHlmYik7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9tb2RlX2NvbmZpZ19mdW5jcyBhc3RfbW9kZV9jb25maWdfZnVuY3MgPSB7DQo+IC0JLmZi
X2NyZWF0ZSA9IGRybV9nZW1fZmJfY3JlYXRlLA0KPiArCS5mYl9jcmVhdGUgPSBhc3RfZ2Vt
X2ZiX2NyZWF0ZV93aXRoX2RpcnR5LA0KDQpBRkFJQ1QsIHRoZSB3aG9sZSBmcmFtZWJ1ZmZl
ciB1cGRhdGUgY29kZSBjYW4gYmUgc29sdmVkIHdpdGggZXhpc3RpbmcgDQpnZW5lcmljIGhl
bHBlcnMgYW5kIHRoZSBWUkFNIHVwZGF0ZXMgSSBvdXRsaW5lZCBhYm92ZS4gQXMgcGFydCBv
ZiBhc3QncyANCmF0b21pYyB1cGRhdGUsIHRoZSBkaXNwbGF5ZWQgZGF0YSB3aWxsIGJlIHVw
ZGF0ZWQgZnJvbSB0aGUgDQpkbWEtYnVmLWF0dGFjaGVkIGV4dGVybmFsIEJPLg0KDQpCdXQg
YXMgSSBzYWlkLCBJIGNvbnNpZGVyIHRoZSBWUkFNIGhlbHBlcnMgYSBkZXByZWNhdGVkLiBB
bmQgb25jZSBJIA0KbW92ZWQgYXN0IHRvIHRoZSBTSE1FTSBoZWxwZXJzLCB0aGUgZnVuY3Rp
b25hbGl0eSB3aWxsIGJlIHRoZXJlIGFzIHdlbGwuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCg0KPiAgIAkubW9kZV92YWxpZCA9IGRybV92cmFtX2hlbHBlcl9tb2RlX3ZhbGlkLA0K
PiAgIAkuYXRvbWljX2NoZWNrID0gZHJtX2F0b21pY19oZWxwZXJfY2hlY2ssDQo+ICAgCS5h
dG9taWNfY29tbWl0ID0gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0LA0KPiANCj4gDQo+IENv
bnRlbnQtdHlwZTogVGV4dC9wbGFpbg0KPiANCj4gTm8gdmlydXMgZm91bmQNCj4gCQlDaGVj
a2VkIGJ5IEhpbGxzdG9uZSBOZXR3b3JrIEFudGlWaXJ1cw0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------FJRCP9xMoQplx469M88CqVVC--

--------------ByfTnMX8hi7dxzO6CUZv8nCW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMVvxUFAwAAAAAACgkQlh/E3EQov+B5
tg/+Px95//AevtG1N56ywQrN2LD57bCQXU1kt/1yPqnLWTUXg5GX6DlLuG2QGnLkzQ1I36SPtdnI
Om8NE7k4K5RSD+ebnlWw7nrLqR++IYXpNTRtDD1obbMNptl7kuuqw/q/8F7hFHvJWeaG+7RtgjiE
oUrM8Nz2WL9u90BgHLj1MPV7B0QxWDQv3SmTFX07MKXb8RY2pIEd4CgDvatUSOlXAy4aUxFLULan
ci1eMfpj2/T1qWR1jW51/c+DFpoh6HofXNfyERPyVkSpo1dEkivPbUWfNlPOeLQx+F3Uf329TqQx
Ruy4MjfhUtuCIf6WVjtRLqvAfGnZR4/xqAHO9y+NpjSoWqY7pbGronySKVZ6pGH5VkNX9fkw9vGJ
LDxyXEkZVSbagyTB+EGBzdhGwA4Zm1RNP6N/1AwBNGHLakxL0iJLnl/hGQ6Qp9Wzhn8BkthmCUSu
sbpjZ+bQSP5gzaE3SqE+yCYEtK9vh4XQ8YyBK1VpttWc1wk5NW7WJRfO3axm/vINqESSxF094eDZ
HA7mj5EmQSs31emUyYdQ0fgLmlfs5dXrUwkMGQ2Ju9ZXJj8xwJflSgtfdRAoPsx2J6/7EMJ2ES27
AdD2eb0tdOiHgwqq/xxVsWX9xcCOShrPPWDPKyLlocErafHS0XuyreRo9lXwghJB+MdutLXs2OT4
uBU=
=8wYj
-----END PGP SIGNATURE-----

--------------ByfTnMX8hi7dxzO6CUZv8nCW--
