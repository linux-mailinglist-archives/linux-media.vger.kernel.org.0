Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B76767F6B
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 15:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjG2NWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 09:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjG2NWD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 09:22:03 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2269268B;
        Sat, 29 Jul 2023 06:22:00 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 38D0B1F8A3;
        Sat, 29 Jul 2023 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1690636919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1JF1YVPFRFSElrk4NYKWtXngObQO3CWxytU6jzO0PSE=;
        b=MN5rs5l/UlQQzzlmnPvUeSfSzAasUukKbdNZ+pBv0AHGgKVN6h2CaWNlK1JIYtBEwlN4K5
        6lpgU+RfMoQIhO+58QvaH3fU5heLcHXEtBDLZj0m/XlOD9FOCn3xiIDEzNVAf5Epu7yf7R
        V+CGbFyUDXen8xt2xqB/EfJwWxXx2EM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1690636919;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1JF1YVPFRFSElrk4NYKWtXngObQO3CWxytU6jzO0PSE=;
        b=cmR9QFxWPHy9Go3/Hst6Yw9kuoNOq6i88TKvKb++dgP4dDTN+gBvLayickx3eaX0WtVhYR
        m/EGeYUKSufrePCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EDB9213922;
        Sat, 29 Jul 2023 13:21:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Nbt4OHYSxWS7GQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Sat, 29 Jul 2023 13:21:58 +0000
Message-ID: <126ac851-2f81-4cfd-b06a-774f8428cc93@suse.de>
Date:   Sat, 29 Jul 2023 15:21:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, Sam Ravnborg <sam@ravnborg.org>
Cc:     javierm@redhat.com, linux-media@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-geode@lists.infradead.org, linux-omap@vger.kernel.org,
        kvm@vger.kernel.org
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <c1a4b7c9-50f2-c43f-277d-c2af9ccc0b50@gmx.de>
 <20230728210127.GA1156027@ravnborg.org>
 <78da21f8-7d00-797e-363a-736ee53b2eb6@gmx.de>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <78da21f8-7d00-797e-363a-736ee53b2eb6@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I3szWz4Z2oI0F9j5JFzjn9ZE"
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
--------------I3szWz4Z2oI0F9j5JFzjn9ZE
Content-Type: multipart/mixed; boundary="------------d5plY2EbLQyTGvHTtkDl97f4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, Sam Ravnborg <sam@ravnborg.org>
Cc: javierm@redhat.com, linux-media@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-omap@vger.kernel.org, kvm@vger.kernel.org
Message-ID: <126ac851-2f81-4cfd-b06a-774f8428cc93@suse.de>
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <c1a4b7c9-50f2-c43f-277d-c2af9ccc0b50@gmx.de>
 <20230728210127.GA1156027@ravnborg.org>
 <78da21f8-7d00-797e-363a-736ee53b2eb6@gmx.de>
In-Reply-To: <78da21f8-7d00-797e-363a-736ee53b2eb6@gmx.de>

--------------d5plY2EbLQyTGvHTtkDl97f4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSGVsZ2UNCg0KQW0gMjkuMDcuMjMgdW0gMDg6NTEgc2NocmllYiBIZWxnZSBEZWxsZXI6
DQo+IE9uIDcvMjgvMjMgMjM6MDEsIFNhbSBSYXZuYm9yZyB3cm90ZToNCj4+IEhpIEhlbGdl
LA0KPj4NCj4+IE9uIEZyaSwgSnVsIDI4LCAyMDIzIGF0IDA4OjQ2OjU5UE0gKzAyMDAsIEhl
bGdlIERlbGxlciB3cm90ZToNCj4+PiBPbiA3LzI4LzIzIDE4OjM5LCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+Pj4gTW9zdCBmYmRldiBkcml2ZXJzIG9wZXJhdGUgb24gSS9PIG1l
bW9yeS4NCj4+Pg0KPj4+IEp1c3Qgbml0cGlja2luZyBoZXJlOg0KPj4+IFdoYXQgaXMgSS9P
IG1lbW9yeT8NCj4+PiBJc24ndCBpdCBlaXRoZXIgbWVtb3J5LCBvciBJL08gPw0KPj4+IEkg
bWVhbiwgSSB3b3VsZCBuZXZlciB0aGluayBvZiB0aGUgY2ZiKiBkcmF3IGZ1bmN0aW9ucyB1
bmRlciBJL08uDQo+Pj4NCj4+Pj4gQW5kIG1vc3Qgb2YgdGhvc2UgdXNlIHRoZQ0KPj4+PiBk
ZWZhdWx0IGltcGxlbWVudGF0aW9ucyBmb3IgZmlsZSBJL08gYW5kIGNvbnNvbGUgZHJhd2lu
Zy4gQ29udmVydCBhbGwNCj4+Pj4gdGhlc2UgbG93LWhhbmdpbmcgZnJ1aXRzIHRvIHRoZSBm
Yl9vcHMgaW5pdGlhbGl6ZXIgbWFjcm8gYW5kIEtjb25maWcNCj4+Pj4gdG9rZW4gZm9yIGZi
ZGV2IEkvTyBoZWxwZXJzLg0KPj4+DQo+Pj4gSSBkbyBzZWUgdGhlIG1vdGl2YXRpb24gZm9y
IHlvdXIgcGF0Y2gsIGJ1dCBJIHRoaW5rIHRoZQ0KPj4+IG1hY3JvIG5hbWVzIGFyZSB2ZXJ5
IG1pc2xlYWRpbmcuDQo+Pj4NCj4+PiBZb3UgaGF2ZToNCj4+PiAjZGVmaW5lIF9fRkJfREVG
QVVMVF9JT19PUFNfUkRXUiBcDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAuZmJfcmVhZMKgwqDC
oMKgwqDCoMKgID0gZmJfaW9fcmVhZCwgXA0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgLmZiX3dy
aXRlwqDCoMKgwqDCoMKgID0gZmJfaW9fd3JpdGUNCj4+Pg0KPj4+ICNkZWZpbmUgX19GQl9E
RUZBVUxUX0lPX09QU19EUkFXIFwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC5mYl9maWxscmVj
dMKgwqDCoCA9IGNmYl9maWxscmVjdCwgXA0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgLmZiX2Nv
cHlhcmVhwqDCoMKgID0gY2ZiX2NvcHlhcmVhLCBcDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAu
ZmJfaW1hZ2VibGl0wqDCoCA9IGNmYl9pbWFnZWJsaXQNCj4+Pg0KPj4+ICNkZWZpbmUgX19G
Ql9ERUZBVUxUX0lPX09QU19NTUFQIFwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC5mYl9tbWFw
wqDCoMKgwqDCoMKgwqAgPSBOVUxMIC8qIGRlZmF1bHQgaW1wbGVtZW50YXRpb24gKi8NCj4+
Pg0KPj4+ICNkZWZpbmUgRkJfREVGQVVMVF9JT19PUFMgXA0KPj4+IMKgwqDCoMKgwqDCoMKg
wqAgX19GQl9ERUZBVUxUX0lPX09QU19SRFdSLCBcDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBf
X0ZCX0RFRkFVTFRfSU9fT1BTX0RSQVcsIFwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIF9fRkJf
REVGQVVMVF9JT19PUFNfTU1BUA0KPj4+DQo+Pj4gSSB0aGluayBGQl9ERUZBVUxUX0lPX09Q
UyBpcyBPSyBmb3IgcmVhZC93cml0ZS9tbWFwLg0KPj4+IEJ1dCBJIHdvdWxkIHN1Z2dlc3Qg
dG8gc3BsaXQgb3V0IF9fRkJfREVGQVVMVF9JT19PUFNfRFJBVy4NCj4+PiBTb21ldGhpbmcg
bGlrZToNCj4+PiAjZGVmaW5lIEZCX0RFRkFVTFRfSU9fT1BTIFwNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgIF9fRkJfREVGQVVMVF9JT19PUFNfUkRXUiwgXA0KPj4+IMKgwqDCoMKgwqDCoMKg
wqAgX19GQl9ERUZBVUxUX0lPX09QU19NTUFQDQo+Pg0KPj4NCj4+PiAjZGVmaW5lIEZCX0RF
RkFVTFRfQ0ZCX09QUyBcDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAuZmJfZmlsbHJlY3TCoMKg
wqAgPSBjZmJfZmlsbHJlY3QsIFwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC5mYl9jb3B5YXJl
YcKgwqDCoCA9IGNmYl9jb3B5YXJlYSwgXA0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgLmZiX2lt
YWdlYmxpdMKgwqAgPSBjZmJfaW1hZ2VibGl0DQo+Pg0KPj4gVGhlIHByZWZpeCBjZmIsIEkg
aGF2ZSByZWNlbnRseSBsZWFybmVkLCBlcXVhbHMgY29sb3IgZnJhbWUgYnVmZmVyLg0KPiAN
Cj4gY29ycmVjdC4NCj4gDQo+PiBUaGV5IGFyZSBuYW1lZCBzdWNoIGZvciBwdXJlbHkgaGlz
dG9yaWNhbCByZWFzb25zLg0KPiANCj4gd2VsbCwgdGhleSBvcGVyYXRlIG9uIE1FTU9SWSB3
aGljaCByZXByZXNlbnRzIGEgKGNvbG9yKSBmcmFtZSBidWZmZXIsDQo+IGVpdGhlciBpbiBo
b3N0IG1lbW9yeSBvciBtZW1vcnkgb24gc29tZSBjYXJkIG9uIHNvbWUgYnVzLg0KPiBTbywg
dGhlIG5hbWluZyBjZmIgaXMgbm90IGhpc3RvcmljYWwsIGJ1dCBldmVuIHRvZGF5IGNvcnJl
Y3QuDQo+IA0KPj4gV2hhdCBpcyBpbXBvcnRhbnQgaXMgd2hlcmUgdGhlIGRhdGEgYXJlIGNv
cGllZCBhcyB3ZSBoYXZlIHR3bw0KPj4gaW1wbGVtZW50YXRpb25zIG9mIGZvciBleGFtcGxl
IGNvcHlhcmVhIC0gb25lIHVzaW5nIHN5c3RlbSBtZW1vcnksIHRoZQ0KPj4gb3RoZXIgdXNp
bmcgSU8gbWVtb3J5Lg0KPiANCj4gc3lzX2NvcHlhcmVhKCkgYW5kIGNmYl9jb3B5YXJlYSgp
Lg0KPiANCj4+IFRoZSBuYW1pbmcgRkJfREVGQVVMVF9JT19PUFMgc2F5cyB0aGlzIGlzIHRo
ZSBkZWZhdWx0cyB0byBJTyBtZW1vcnkNCj4+IG9wZXJhdGlvbnMsIHdoaWNoIHRlbGwgd2hh
dCB0aGV5IGRvDQo+IA0KPiBUaGlzIGlzIGV4YWN0bHkgd2hhdCBJIGZpbmQgbWlzbGVhZGlu
Zy4gSU9fT1BTIHNvdW5kcyB0aGF0IGl0IG9wZXJhdGVzDQo+IG9uIGZpbGUgSS9PIChsaWtl
IGZpbGUgcmVhZC93cml0ZSksIGJ1dCBub3Qgb24gaW9tZW0uDQo+IA0KPj4gYW5kIGF2b2lk
IHRoZSBzdHJhbmdlIGNmYiBhY3JvbnltLg0KPiANCj4+IFJlc2VydmUgY2ZiIGZvciBjb2xv
ciBmcmFtZSBidWZmZXJzIG9ubHkgLSBhbmQgbWF5YmUgaW4gdGhlIGVuZCByZW5hbWUNCj4+
IHRoZSB0aHJlZSBjZmJjb3B5YXJlYSwgY2ZiZmlsbHJlY3QsIGNmYmltZ2JsdCB0byB1c2Ug
dGhlIGlvIHByZWZpeC4NCj4gDQo+IEFnYWluLCB0aGUgaW8gcHJlZml4IGlzIHdoYXQgSSB0
aGluayBpcyBtaXNsZWFkaW5nLg0KPiBXaHkgbm90IG5hbWUgaXQgd2hhdCBpdCByZWFsbHkg
aXMgYW5kIHdoYXQgaXMgdXNlZCBpbiB0aGUga2VybmVsIA0KPiBhbHJlYWR5LCBlLmcuDQo+
IGlvbWVtX2NvcHlhcmVhKCkgYW5kIHN5c21lbV9jb3B5YXJlYSgpLg0KPiB3aGljaCB3b3Vs
ZCBsZWFkIHRvDQo+IEZCX0RFRkFVTFRfSU9NRU1fT1BTIGFuZCBGQl9ERUZBVUxUX1NZU01F
TV9PUFMuDQoNClllcyB0aGVyZSdzIGJlZW4gYSBiaXQgb2YgY29uZnVzaW9uIGFuZCBkaXNj
dXNzaW9uIG9uIHRoZSBuYW1pbmcgYmVmb3JlLiANCkknZCBiZSBoYXBweSBpZiB3ZSBjYW4g
c3RhbmRhcmRpemUgb24gc3lzbWVtIGFuZCBpb21lbS4NCg0KSSBjYW4gYWRkIGEgcGF0Y2gg
dG8gdGhpcyBwYXRjaHNldCB0byByZW5hbWUgdGhlIF9JT18gbWFjcm9zIGFuZCB0b2tlbnMg
DQp0byB1c2UgX0lPTUVNXy4gVGhhdCdzIG5vdCB0b28gbXVjaCBjaGFuZ2UuIEEgbGF0ZXIg
cGF0Y2hzZXQgY2FuIGFkZHJlc3MgDQpzeXNtZW0gYW5kIGRlZmVycmVkIEkvTyBoZWxwZXJz
IHNlcGFyYXRlbHkuDQoNCk9uIG1vdGl2YXRpb246IGZvciBub3cgaXQncyBhIGNsZWFudXAg
dG8gbWFrZSB0aGUgYSBiaXQgY29kZSBlYXNpZXIgdG8gDQp1bmRlcnN0YW5kLiBCdXQgb25j
ZSBhbGwgZHJpdmVycyBzZXQgdGhlaXIgY2FsbGJhY2tzIGNvcnJlY3RseSwgd2UgY2FuIA0K
bWFrZSB0aGUgSS9PIG1lbSBjb2RlIG9wdGlvbmFsLiBJdCdzIGN1cnJlbnRseSB0aGUgZGVm
YXVsdCBhbmQgYnVpbHQtaW4gDQp1bmNvbmRpdGlvbmFsbHkuIEJ1dCBpdCdzIG5vdCB1bmNv
bW1vbiB0aGF0IGl0J3MgdW51c2VkIGVudGlyZWx5Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+ICANCj4+IFdoaWNoIGlzIG11Y2ggc2ltcGxlciB0byBkbyBhZnRlciB0aGlzIHNl
cmllcyAtIGFuZCBuaWNlIGV4dHJhIGJlbmVmaXQuDQo+Pg0KPj4gSSBob3BlIHRoaXMgcHJv
cGVybHkgZXhwbGFpbnMgd2h5IEkgbGlrZSB0aGUgY3VycmVudCBuYW1pbmcgYW5kDQo+PiBh
Y2tlZCBpdCB3aGVuIHRoZSBtYWNyb3Mgd2VyZSBpbnRyb2R1Y2VkLg0KPiANCj4gSU1ITyB0
aGUgbmFtaW5nIGlzbid0IHBlcmZlY3QsIGJ1dCB0aGF0J3MganVzdCBuaXRwaWNraW5nLg0K
PiBCZXNpZGVzIHRoYXQsIFRob21hcycgcGF0Y2hlcyBhcmUgYSBuaWNlIGNsZWFudXAuDQo+
IFNvLCBpZiB5b3Ugd2FudCBhZGQgYQ0KPiBBY2tlZC1ieTogSGVsZ2UgRGVsbGVyIDxkZWxs
ZXJAZ214LmRlPg0KPiB0byB0aGUgc2VyaWVzLg0KPiANCj4gSGVsZ2UNCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51
ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcg
TWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=


--------------d5plY2EbLQyTGvHTtkDl97f4--

--------------I3szWz4Z2oI0F9j5JFzjn9ZE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTFEnYFAwAAAAAACgkQlh/E3EQov+Al
Mg/+Isj8ZIJGuIoa+HS+YNkmI+5I4PAG/d+dxr4OzIlV6QFK559CvHRkl72LFlUjfrY9dtxqBCoU
FK9R+MoYfatZKO350vUZtXCZ9lMYxWLgKsFADX11bX/HwX3zxuGaoGt8AKbCPhum/Pb20+exqN1q
PkZWjyk34mUYwWM2+UxZrVArvzaCi+4WFLdC3iHpg6v5v0QXa68VZZJC9npovci6J81tLvoP9u2r
QRsP7Wurf2ZFR3h+vGNG6gm5zaVL8fCl3bFdFfA7QfF5AsPwdc72H9sULOG6znkV/uHLWa14NT/M
53Mzgh0Cpsmy7cnP9L04pAM4RNCwqwoXVCVomcE0zg0CJpD+vYimEzGWlAf3ROHGyuutWfVHSLXc
uRmsost29r6tUqjMXprg1nteapqXrYTj3NNl5gfEAvpXiZwxUX7zT2+rNjt1i+FJEPFAObpCfmrp
aek50GqObFdmI8A87bT0Xq+kzUSdQpe9iKXpEWNfTb7haGm2ZjNvZAjs4PcbHkJZ48FjN2up7EyJ
g2u8HVjLcPUVptvTIFXThiyQApcfcbSkN8XVsUn7cL0TayIBHt7yJw1z+Hjoo0+tNrRmV/EOgZ6x
6yKaLGNQtLsK9ktThllsld3hpriJoQ68T5MFzmvmp4HWb/bowxdneLtM+yRVM8KUDQNbjThLiu7S
fgU=
=0PKh
-----END PGP SIGNATURE-----

--------------I3szWz4Z2oI0F9j5JFzjn9ZE--
