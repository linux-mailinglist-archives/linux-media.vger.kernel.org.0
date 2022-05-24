Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8FA532519
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 10:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbiEXIRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 04:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbiEXIRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 04:17:07 -0400
X-Greylist: delayed 1516 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 24 May 2022 01:17:06 PDT
Received: from www52.your-server.de (www52.your-server.de [213.133.104.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5230512D30
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=burnicki.net; s=default1902; h=Content-Type:In-Reply-To:Subject:From:
        References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
        bh=MQ9TRKnZ4HF4flg8DtlRXUN6EHuy96OtNX09tunUW9A=; b=vDJrSQQsoQaeFzGD0HzWqAueRW
        NgMjLnunK7zlwD/7F7BfmQBYMuTl8FMTA/tOtr+pc3Yu6jgH1rYfJ8uscTIEcjDG3LOtG/sj013uz
        tLDKVY26Tho43yNrUIwjVU3ywypCB9tFy9nceKMwlLc7hKGyztUGwzvgUNM5knXbfsMQcLA5yf2GY
        bJtEQ/f38zqZCXBnHwzdQrCvgTUsb8MUOxT402ZGhxzYsxVi1sntQP7H97buzaQdiUGB00D+a2Iga
        P2pdcQEsDFQyxJOvWiAUeZTmez17/PIVqGVQWcJIEuUPJbKyQ/cBYgsQJXMDzo5B1IzkjheFCoPj6
        Z2i/o3lg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www52.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <martin.burnicki@burnicki.net>)
        id 1ntPKT-0009zL-HC; Tue, 24 May 2022 09:51:45 +0200
Received: from [2a02:8108:98bf:f298:16dd:a9ff:fe28:c6cc]
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <martin.burnicki@burnicki.net>)
        id 1ntPKT-000EX7-9A; Tue, 24 May 2022 09:51:45 +0200
Message-ID: <5744615d-1126-418a-1c39-95df385605ac@burnicki.net>
Date:   Tue, 24 May 2022 09:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To:     Ken Smith <kens@kensnet.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Brad Love <brad@nextdimension.cc>
References: <20200423155908.GA22613@gofer.mess.org>
 <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
 <20200423163559.GB23006@gofer.mess.org>
 <0cd2436c-0a39-0f85-929e-5d8f333b5027@burnicki.net>
 <20200425114147.GA3037@gofer.mess.org>
 <4aa38e2a-6b98-6530-69d9-d945a467bf0b@burnicki.net>
 <1a2d9e15-55e2-88a7-d197-208a8ce99218@burnicki.net>
 <20200427080751.GA5925@gofer.mess.org>
 <e7d8aeb8-124a-f7b3-d469-4c47f182f067@burnicki.net>
 <0fc5d43f-7928-1649-220b-45916b189d8f@burnicki.net>
 <20200430164934.GA16730@gofer.mess.org>
 <49697978-c4ef-66fe-94ac-17117540c111@kensnet.org>
From:   Martin Burnicki <martin.burnicki@burnicki.net>
Subject: Re: HauppaugeTV-quadHD DVB-T & HVR5525 mpeg risc op code error
In-Reply-To: <49697978-c4ef-66fe-94ac-17117540c111@kensnet.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IcR0Or8oTU0ppu9roNl87qrA"
X-Authenticated-Sender: mailout@burnicki.net
X-Virus-Scanned: Clear (ClamAV 0.103.5/26550/Mon May 23 10:05:39 2022)
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IcR0Or8oTU0ppu9roNl87qrA
Content-Type: multipart/mixed; boundary="------------O8wqrcXARwTaIyy5nxFvwF1N";
 protected-headers="v1"
From: Martin Burnicki <martin.burnicki@burnicki.net>
To: Ken Smith <kens@kensnet.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Brad Love <brad@nextdimension.cc>
Message-ID: <5744615d-1126-418a-1c39-95df385605ac@burnicki.net>
Subject: Re: HauppaugeTV-quadHD DVB-T & HVR5525 mpeg risc op code error
References: <20200423155908.GA22613@gofer.mess.org>
 <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
 <20200423163559.GB23006@gofer.mess.org>
 <0cd2436c-0a39-0f85-929e-5d8f333b5027@burnicki.net>
 <20200425114147.GA3037@gofer.mess.org>
 <4aa38e2a-6b98-6530-69d9-d945a467bf0b@burnicki.net>
 <1a2d9e15-55e2-88a7-d197-208a8ce99218@burnicki.net>
 <20200427080751.GA5925@gofer.mess.org>
 <e7d8aeb8-124a-f7b3-d469-4c47f182f067@burnicki.net>
 <0fc5d43f-7928-1649-220b-45916b189d8f@burnicki.net>
 <20200430164934.GA16730@gofer.mess.org>
 <49697978-c4ef-66fe-94ac-17117540c111@kensnet.org>
In-Reply-To: <49697978-c4ef-66fe-94ac-17117540c111@kensnet.org>

--------------O8wqrcXARwTaIyy5nxFvwF1N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMjQuMDUuMjIgdW0gMDA6MzYgc2NocmllYiBLZW4gU21pdGg6DQo+IA0KPiBTZWFuIFlv
dW5nIHdyb3RlOg0KPj4gT24gVHVlLCBBcHIgMjgsIDIwMjAgYXQgMDg6MjQ6MjBQTSArMDIw
MCwgTWFydGluIEJ1cm5pY2tpIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+Pj4gQW0gMjcuMDQu
MjAgdW0gMTA6NTkgc2NocmllYiBNYXJ0aW4gQnVybmlja2k6DQo+Pj4+IFNlYW4gWW91bmcg
d3JvdGU6DQo+Pj4+PiBXb3VsZCB5b3UgbWluZCB0ZXN0aW5nIHRoaXMgcGF0Y2ggcGxlYXNl
Pw0KPj4+PiBJJ20gZ29pbmcgdG8gdHJ5IGl0IHRoaXMgZXZlbmluZy4NCj4+Pj4NCj4+Pj4g
SSdsbCBoYXZlIHRvIGZpbmQgb3V0IGhvdyB0byBkbyBhbiBvdXQtb2YtdHJlZSBidWlsZCBm
b3IgYSBjb3B5IG9mIHRoZQ0KPj4+PiBjeCBtb2R1bGUgdGhhdCBpbmNsdWRlcyB0aGUgcGF0
Y2guDQo+Pj4+DQo+Pj4+IE15IG93biBrZXJuZWwgZHJpdmVyIGlzIGFsd2F5cyBhbmQgb25s
eSBidWlsdCBvdXQtb2YtdHJlZSwgYnV0IGZvciB0aGUNCj4+Pj4gY3ggZHJpdmVyIEkgbmVl
ZCB0byBzZWUgd2hpY2ggZmlsZXMgSSBuZWVkIHRvIGNvcHkgdG8gYSBsb2NhbCANCj4+Pj4g
ZGlyZWN0b3J5LA0KPj4+PiBhbmQgaWYgdGhlcmUgaXMgYW55dGhpbmcgZWxzZSB0aGF0IG5l
ZWRzIHRvIGJlIGRvbmUgdG8gYnVpbGQgYSBjb3B5IG9mDQo+Pj4+IGl0IG91dC1vZi10cmVl
Lg0KPj4+IFNvcnJ5LCBJIGhhdmVuJ3QgbWFuYWdlZCB0byB0ZXN0IHRoZSBwYXRjaCwgeWV0
Lg0KPj4+DQo+Pj4gQ3VycmVudGx5IEkgaGF2ZSB0aGUgZHJpdmVyIGxvYWRlZCB3aXRoDQo+
Pj4NCj4+PiBvcHRpb25zIGN4MjM4ODUgZG1hX3Jlc2V0X3dvcmthcm91bmQ9Mg0KPj4+DQo+
Pj4gYnV0IHRvZGF5IHRoZXJlIHdlcmUgMyBvY2N1cnJlbmNlcyBvZiB0aGUgcmlzYyBvcGNv
ZGUgZXJyb3I6DQo+Pj4NCj4+Pg0KPj4gRHJhdHMuDQo+Pg0KPj4+IFNvIHRoZSB3b3JrYXJv
dW5kIGRvZXNuJ3Qgc2VlbSB0byBmaXggdGhlIHByb2JsZW0gYW55d2F5LCBhbmQgdGhlIHBh
dGNoDQo+Pj4gd291bGQganVzdCBlbmFibGUgdGhlIHdvcmthcm91bmQgd2l0aCBvdXQgdGhl
IHNwZWNpZmljIG9wdGlvbiwgcmlnaHQ/DQo+PiBZZXMsIHRoYXQncyByaWdodC4NCj4+DQo+
Pj4gVGhlIGVmZmVjdCBvZiB0aGUgd29ya2Fyb3VuZCBsb29rcyBqdXN0IGxpa2UgZGVidWcg
bGV2ZWxzIGxvd2VyIHRoYW4gNywNCj4+PiBpdCBqdXN0IHNlZW1zIHRvIHJlZHVjZSB0aGUg
cHJvYmFiaWxpdHkgdGhhdCB0aGUgYnVnIG9jY3VycywgYnV0IGRvZXNuJ3QNCj4+PiByZWFs
bHkgZml4IGl0Lg0KPj4+DQo+Pj4gU28gbXkgY29uY2x1c2lvbiBpcyBzdGlsbCB0aGF0IHRo
YXQgdGhpcyBzbWVsbHMgbGlrZSBhIG1pc3NpbmcgbWVtb3J5DQo+Pj4gYmFycmllciBvciBz
byBpbiB0aGUgZHJpdmVyLg0KPj4+DQo+Pj4gU2luY2UgdGhlIGRyaXZlciBzZWVtcyB0byB3
b3JrIHByb3Blcmx5IHdpdGggb2xkZXIgbWFpbmJvYXJkcy9DUFUgdHlwZXMsDQo+Pj4gdGhp
cyBkb2Vzbid0IHNvdW5kIGxpa2UgYSBwcm9ibGVtIGluIHRoZSBDWCBjaGlwLCBJTU8uDQo+
PiBJIHdvdWxkIGFncmVlIHdpdGggdGhhdC4gSSB3b3VsZCBzdXNwZWN0IHNhbWUgaXNzdWUg
d2FzIGJlaW5nIHBhcGVyZWQgDQo+PiBvdmVyDQo+PiBieSB0aGUgcGF0Y2g7IG5vdyB3aGF0
IHRoYXQgaXNzdWUgaXMsIEkgZG9uJ3Qga25vdy4gQ2VydGFpbmx5IHNvbWUgDQo+PiBvcmRl
cmluZw0KPj4gb3IgYmFycmllciBpc3N1ZSBzZWVtcyBsaWtlbHkuDQo+Pg0KPj4gQWN0dWFs
bHkgSSBzdXNwZWN0ZWQgdGhpcyBhbGwgYWxvbmcsIGJ1dCB0aGUgd29ya2Fyb3VuZCBpcyB0
aGUgYmVzdCB3ZSANCj4+IGhhdmUuDQo+Pg0KPj4gSSB0aGluaywgc29tZSB0aW1lIHNwZW50
IGh1bnRpbmcgZG93biB0aGUgaXNzdWUgd291bGQgcmVhbGx5IGJlIGhlbHBmdWwNCj4+IGhl
cmUuIEhvcGVmdWxseSB0aGF0IGRvZXNuJ3QgbWVhbiB0b28gbWFueSBhYm9ydGVkIHJlY29y
ZGluZ3MuLg0KPj4NCj4+IFRoYW5rcywNCj4+DQo+PiBTZWFuDQo+Pg0KPiANCj4gSGksIEkn
ZCBsaWtlIHRvIHJlc3VycmVjdCB0aGlzIHRocmVhZCAoY29waWVkIGJlbG93KS4gSSBoYXZl
IGEgc3lzdGVtIA0KPiBzaG93aW5nIHRoaXMgZXJyb3IuIEl0cyBhIEhQIE1MMzUwIHNlcnZl
ciB3aXRoIDJ4IFhlb24gNTY3NSBydW5uaW5nIA0KPiBSb2NreSBMaW51eCA4LjUuIEl0IGhh
cyBhIEhhdXBwYXVnZSBIVlI1NTI1IGNhcmQgdGhhdCB1c2VzIHRoZSBzYW1lIA0KPiBjeDIz
ODg1IGtlcm5lbCBtb2R1bGUgYXMgdGhlIHF1YWRIRCBjYXJkIGRpc2N1c3NlZCBhYm92ZS4g
VGhlIEhWUjU1MjUgaXMgDQo+IGEgZHVhbCBEVkItVDIvRFZCLVMyIGNhcmQuDQo+IA0KPiBJ
biBvdGhlciB0aHJlYWRzIEkgcmVhZCBhYm91dCB0aGUgZG1hX3Jlc2V0X3dvcmthcm91bmQg
b3B0aW9uLiBUaGF0IA0KPiBvcHRpb24gZGlkIG5vdCBhcHBlYXIgdG8gYmUgaW4gdGhlIHZl
cnNpb24gaW5jbHVkZWQgaW4gc3RhbmRhcmQga2VybmVsIA0KPiBpbiBSb2NreSA4LjUuIEkg
aGF2ZSBsb2FkZWQgYSA1LjQga2VybmVsIGFuZCBjb21waWxlZCB0aGUgRFZCIG1lZGlhIA0K
PiBtb2R1bGVzIGZyb20gLmdpdCBzb3VyY2UgYW5kIHNldCBkbWFfcmVzZXRfd29ya2Fyb3Vu
ZD0yIGluIGEgZmlsZSBpbiANCj4gbW9kcHJvYmUuZC4gVGhlIGJ1aWx0IG1vZHVsZSBzaG93
cyB2ZXJzaW9uIDAuMC40DQo+IA0KPiBTYWRseSB0aGUgZXJyb3IgcmVtYWlucy4gVGhlIHN5
c3RlbSBydW5zIE15dGhUViB2LjMxLiBUaGUgbWFpbiBzeW1wdG9tIA0KPiBpcyBvY2Nhc2lv
bmFsIGFib3J0ZWQgcmVjb3JkaW5ncy4gQWx0aG91Z2ggdGhlIGNhcmQgZG9lcyBhcHBlYXIg
dG8gDQo+IHJlY292ZXIsIG5vdCByZXF1aXJpbmcgYSByZWJvb3QvY29sZCByZXN0YXJ0Lg0K
PiANCj4gSSdkIGFwcHJlY2lhdGUgc29tZSBhc3Npc3RhbmNlIHdpdGggdGhpcy4gV2hhdCBp
bmZvcm1hdGlvbiBjYW4gSSBwcm92aWRlIA0KPiB0byBoZWxwIHRvIHRyYWNlIHRoaXMuDQoN
CkknbSBhbHNvIG1haW50YWluaW5nIGEgZHJpdmVyIHdoaWNoIHN0YXJ0ZWQgdG8gc2hvdyBw
cm9ibGVtcyBvbiBzeXN0ZW1zIA0Kd2l0aCBuZXcgQ1BVcyBhbmQgY2hpcHNldHMgcXVpdGUg
c29tZSB0aW1lIGFnbywgZm9yIGV4YW1wbGUgb24gc29tZSANClJ5emVuIENQVXMuIEluIG15
IGNhc2UgaXQgdHVybmVkIG91dCB0aGF0IHRoZSBwcm9ibGVtIHdhcyBiZWNhdXNlIG15IA0K
ZHJpdmVyIGFjY2Vzc2VkIG1lbW9yeSBsb2NhdGlvbnMgb24gYSBteSBQQ0kgY2FyZCBkaXJl
Y3RseSB2aWEgYSBwb2ludGVyLg0KDQpMb29rcyBsaWtlIHRoZSBwcm9ibGVtIG9jY3VycmVk
IGJlY2F1c2UgdGhlIENQVS9jaGlwc2V0ICJvcHRpbWl6ZWQiIGFuZCANCnJlLW9yZGVyZWQg
dGhlIGV4ZWN1dGlvbiBvZiBzb21lIG1hY2hpbmUgaW5zdHJ1Y3Rpb25zLiBUaGVyZSBhcmUg
DQoiYmFycmllciIgaW5zdHJ1Y3Rpb25zIHRoYXQgY2FuIGJlIGluc2VydGVkIGluIHRoZSBz
b3VyY2UgY29kZSB0byBhdm9pZCANCnRoaXMsIGJ1dCBteSBvcmlnaW5hbCBjb2RlIGRpZG4n
dCB1c2UgdGhlbSBiZWNhdXNlIHRoZSBkcml2ZXIgaGFkIGJlZW4gDQp3b3JraW5nIG9uIG1h
bnkgc3lzdGVtcyBmb3IgYSBsb25nIHRpbWUuDQoNCkFueXdheSwgdGhlIGxvdyBsZXZlbCBm
dW5jdGlvbnMgcHJvdmlkZWQgYnkgdGhlIGtlcm5lbCB0byBhY2Nlc3MgDQpyZWdpc3RlcnMg
b24gYSBwZXJpcGhlcmFsIGFyZSBpbXBsZW1lbnRlZCB0byB1c2UgdGhvc2UgYmFycmllcnMs
IHNvIA0Kc2ltcGx5IHVzaW5nIHRob3NlIHByaW1pdGl2ZXMgKHdyaXRlbCwgcmVhZGwgYW5k
IGZyaWVuZHMpIGluc3RlYWQgb2YgDQphY2Nlc3NpbmcgdGhlIHJlZ2lzdGVycyBkaXJlY3Rs
eSB2aWEgYSBwb2ludGVyICgqcCA9IGNtZDsgdmFsID0gKihwKzEpICkgDQpmaXhlZCB0aGUg
cHJvYmxlbSBmb3IgbXkgZHJpdmVyLg0KDQpBbGwgdGhlIHN5bXB0b21zIGRlc2NyaWJlZCBo
ZXJlIGZvciB0aGUgY3gyMzg4NSBtb2R1bGUgbWFrZSBtZSBhc3N1bWUgDQp0aGF0IHRoZSBw
cm9ibGVtIGlzIHZlcnkgc2ltaWxhciwgaS5lLiBkdWUgdG8gYSBtaXNzaW5nIGJhcnJpZXIg
DQppbnN0cnVjdGlvbiBzb21ld2hlcmUgaW4gdGhlIHNvdXJjZSBjb2RlLiBVbmZvcnR1bmF0
ZWx5IEknbSBub3QgZmFtaWxpYXIgDQp3aXRoIHRoZSBMaW51eCBtZWRpYSBkcml2ZXIgc3R1
ZmYsIHNvIEkgZG9uJ3Qga25vdyB3aGVyZSBJIGNvdWxkIHN0YXJ0IA0KdG8gbG9vayBmb3Ig
YSBtaXNzaW5nIGJhcnJpZXIgaW5zdHJ1Y3Rpb24uDQoNClRoZSBvbmx5IHdvcmthcm91bmQg
dGhhdCBmaXhlZCB0aGUgcHJvYmxlbSBmb3IgbWUsIGFuZCB0aGF0IEknbSBzdGlsbCANCnVz
aW5nLCBpcyB0byBsb2FkIHRoZSBjeDIzODg1IG1vZHVsZSB3aXRoIGEgaGlnaCBkZWJ1ZyBs
ZXZlbCwgYnkgcHV0dGluZyANCmEgbGluZQ0KDQpvcHRpb25zIGN4MjM4ODUgZGVidWc9OA0K
DQppbnRvIGEgZmlsZQ0KDQovZXRjL21vZHByb2JlLmQvY3gyMzg4NS5jb25mDQoNClRoaXMg
cHJvZHVjZXMgYSBIVUdFIGFtb3VudCBvZiBrZXJuZWwgbG9nIG1lc3NhZ2VzIChkbWVzZyks
IGJ1dCB3aXRoIA0KbG93ZXIgZGVidWcgbGV2ZWxzIHRoZSBkcml2ZXIgc3RpbGwgZGlkbid0
IHdvcmsgcmVsaWFibHkuDQoNClRvIG1ha2UgdGhpcyBzdGFibGUgZm9yIGEgbG9uZyB0aW1l
LCBJIGNoYW5nZWQgL3Zhci9sb2cvIHRvIE5PVCBwb2ludCB0byANCm15IFNTRCBidXQgdG8g
YSByZWFsIGhhcmQgZGlzaywgYW5kIEkgY3JlYXRlZCBhIGNyb25qb2IgZmlsZSBpbiANCi9l
dGMvZXRjL2Nyb24uZC8gd2l0aCB0aGUgbGluZQ0KDQoxIDAtMjMgKiAqICogcm9vdCBybSAt
ZiAvdmFyL2xvZy9rZXJuLmxvZyoNCg0KdG8gcGVyaW9kaWNhbGx5IHJlbW92ZSB0aGUgaHVn
ZSBrZXJuZWwgbG9nIGZpbGVzLg0KDQpUaGlzIGhhY2sgd29ya3MgZm9yIG1lIHNpbmNlIHRo
aXMgaGFzIGJlZW4gZGlzY3Vzc2VkIG9uIHRoaXMgTUwgeWVhcnMgYWdvLg0KDQoNCk1hcnRp
bg0K

--------------O8wqrcXARwTaIyy5nxFvwF1N--

--------------IcR0Or8oTU0ppu9roNl87qrA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE3vwg95zo8pNumOSRA0Yuubu0vo8FAmKMjpAFAwAAAAAACgkQA0Yuubu0vo/0
WhAAlSWs0eV2fQuLB6UyhO4G5f+q2zFf7pE4pVyosk6mGEhNcNR4BMkrhVPTIXFm0vbxqYVerFLB
D05dQWvSuFw1ebbpp0WT/Wjxjnyhese3DwPaFzDvWgWV4rGN4r719X7FfocadQQNubvl8CVG06Uc
9qhhKNg7YPIVLCWV6I0PLIG77WgcDVZkrWiPeBhuxbp/gN95HdEqPDIs6ZbesPGOikzrmfOvk92I
HogL/NPCYIkQ2X1/tJuCYspl3+8c3VhrbFQad6e7o4ByH13lI+p0hIWHGmBUlZARR+GWvWytg9sX
SQHAm+vtE4hNKLUWT02ysDkSZK8Jy4ce8L7ULZHmsjeS5qc/rl7isdRsoIO60CIKRHSQvIkSJDby
uNl+UuYRYL7Imh8mO350/FCo50WSbeR7oULCGmv7En2NBzsDL3f0lNUBjhya6pL5XndR7rKDfJ5L
NYSKqAAacmhmkfszXm8NJpQ/uhR6AA0EF5xSMJHKdGxpZe2F462KgPg3je5ZYNlvThtV6/t7VGck
V0fd9BkKGzjwL238OOjSP3DN+10UHI0ew+KmGExTLeOMxkuTUtK7tYCkXvsI3+bcqz4pHwBkS+FK
8KTp1WzllU3LcPS6hYOBlLv3lL99VQlG5fBJd8pDNZacbcOj8yy48JzhGN6xHi7g9QB9Je85++ip
QfQ=
=aRVA
-----END PGP SIGNATURE-----

--------------IcR0Or8oTU0ppu9roNl87qrA--
