Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1E67582B9
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 14:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF0MjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 08:39:04 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:28330 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726308AbfF0MjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 08:39:03 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5RCSSMi017826;
        Thu, 27 Jun 2019 14:38:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=iTvZ7Qy8oIibUwXAe/7zciOjWIyxXJ+MY9nuagG4AsE=;
 b=0L/NQri0TlBpqbJX16cjTEsFo83GNORuGL9CN/N7b8gRVYi/Hff95RmFuw47O6JCulXt
 5THgz0DrChKGm5EBWsS2nUIzpbGwqn0Y9F6npgtR6ggXwNMuWXZzCDU9+/C+nPiKbfQZ
 qti4BV0G/otIl/AFLcADEwVrnWPmzHLyMjf4RYVVHibljUPjfiwJ3eitVRWPc7ef5vfB
 PLA0nKk2kD1WhcF+vuSjus9iQOCJClokzdXdzvo1Y7etgAcLxHmEYHpeoXqt7cl/hs77
 XbRT6Fv0CBJ4fqChW9NIWPM78Tp6pCBRC/HW7kqDlRe0Hg+f4vPhhZtAh1NrMnfqem6w kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2t9d2gpta0-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 27 Jun 2019 14:38:42 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF9AF31;
        Thu, 27 Jun 2019 12:38:41 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E49D27AE;
        Thu, 27 Jun 2019 12:38:41 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Jun
 2019 14:38:41 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Thu, 27 Jun 2019 14:38:40 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: Re: [PATCH v2 0/3] DCMI bridge support
Thread-Topic: [PATCH v2 0/3] DCMI bridge support
Thread-Index: AQHVJ4OqL2qtYdvbaESId3efmYQAfaaqeW6AgAOeMYCAAUJRAA==
Date:   Thu, 27 Jun 2019 12:38:40 +0000
Message-ID: <b21efe64-7762-308b-c2e5-503589041c35@st.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <20190620161721.h3wn4nibomrvriw4@kekkonen.localdomain>
 <ae097d67-58fe-82d7-78d6-2445664f28db@st.com>
 <20190626172503.GB6118@pendragon.ideasonboard.com>
In-Reply-To: <20190626172503.GB6118@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CC95BC9616EAA44ABD50C18309839EF@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-27_07:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciByZXZpZXdpbmcsDQoNCk9uIDYvMjYvMTkgNzoyNSBQ
TSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gSGkgSHVndWVzLA0KPiANCj4gT24gTW9uLCBK
dW4gMjQsIDIwMTkgYXQgMTA6MTA6MDVBTSArMDAwMCwgSHVndWVzIEZSVUNIRVQgd3JvdGU6DQo+
PiBIaSBTYWthcmksDQo+Pg0KPj4gICA+IC0gV2hlcmUncyB0aGUgc3ViLWRldmljZSByZXByZXNl
bnRpbmcgdGhlIGJyaWRnZSBpdHNlbGY/DQo+PiBUaGlzIGlzIHBvaW50ZWQgYnkgWzFdOiBkcml2
ZXJzL21lZGlhL2kyYy9zdC1taXBpZDAyLmMNCj4+DQo+PiAgID4gLSBBcyB0aGUgZHJpdmVyIGJl
Y29tZXMgTUMtY2VudHJpYywgY3JvcCBjb25maWd1cmF0aW9uIHRha2VzIHBsYWNlDQo+PiB0aHJv
dWdoDQo+PiAgID4gICBWNEwyIHN1Yi1kZXZpY2UgaW50ZXJmYWNlLCBub3QgdGhyb3VnaCB0aGUg
dmlkZW8gZGV2aWNlIG5vZGUuDQo+PiAgID4gLSBTYW1lIGdvZXMgZm9yIGFjY2Vzc2luZyBzZW5z
b3IgY29uZmlndXJhdGlvbjogaXQgZG9lcyBub3QgdGFrZSBwbGFjZQ0KPj4gICA+ICAgdGhyb3Vn
aCB2aWRlbyBub2RlIGJ1dCB0aHJvdWdoIHRoZSBzdWItZGV2aWNlIG5vZGVzLg0KPj4NCj4+IE91
ciBvYmplY3RpdmUgaXMgdG8gYmUgYWJsZSB0byBzdXBwb3J0IGVpdGhlciBhIHNpbXBsZSBwYXJh
bGxlbCBzZW5zb3INCj4+IG9yIGEgQ1NJLTIgc2Vuc29yIGNvbm5lY3RlZCB0aHJvdWdoIGEgYnJp
ZGdlIHdpdGhvdXQgYW55IGNoYW5nZXMgb24NCj4+IHVzZXJzcGFjZSBzaWRlIGJlY2F1c2Ugbm8g
YWRkaXRpb25hbCBwcm9jZXNzaW5nIG9yIGNvbnZlcnNpb24gaW52b2x2ZWQsDQo+PiBvbmx5IGRl
c2VyaWFsaXNhdGlvbiBpcyBtLg0KPj4gV2l0aCB0aGUgcHJvcG9zZWQgc2V0IG9mIHBhdGNoZXMs
IHdlIHN1Y2NlZWRlZCB0byBkbyBzbywgdGhlIHNhbWUNCj4+IG5vbi1yZWdyZXNzaW9uIHRlc3Rz
IGNhbXBhaWduIGlzIHBhc3NlZCB3aXRoIE9WNTY0MCBwYXJhbGxlbCBzZW5zb3INCj4+IChTVE0z
Mk1QMSBldmFsdWF0aW9uIGJvYXJkKSBvciBPVjU2NDAgQ1NJLTIgc2Vuc29yIChBdmVuZ2VyOTYg
Ym9hcmQgd2l0aA0KPj4gRDMgbWV6emFuaW5lIGJvYXJkKS4NCj4+DQo+PiBXZSBkb24ndCB3YW50
IGRyaXZlciB0byBiZSBNQy1jZW50cmljLCBtZWRpYSBjb250cm9sbGVyIHN1cHBvcnQgd2FzDQo+
PiByZXF1aXJlZCBvbmx5IHRvIGdldCBhY2Nlc3MgdG8gdGhlIHNldCBvZiBmdW5jdGlvbnMgbmVl
ZGVkIHRvIGxpbmsgYW5kDQo+PiB3YWxrIHRyb3VnaCBzdWJkZXZpY2VzOiBtZWRpYV9jcmVhdGVf
cGFkX2xpbmsoKSwNCj4+IG1lZGlhX2VudGl0eV9yZW1vdGVfcGFkKCksIGV0Yy4uLg0KPj4NCj4+
IFdlIGRpZCBhIHRyeSB3aXRoIHRoZSB2MSB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2hzZXQsIGRlbGVn
YXRpbmcgc3ViZGV2aWNlcw0KPj4gaGFuZGxpbmcgdG8gdXNlcnNwYWNlLCBieSB1c2luZyBtZWRp
YS1jb250cm9sbGVyLCBidXQgdGhpcyByZXF1aXJlIHRvDQo+PiBjb25maWd1cmUgZmlyc3QgdGhl
IHBpcGVsaW5lIGZvciBlYWNoIHNpbmdsZSBjaGFuZ2Ugb2YgcmVzb2x1dGlvbiBhbmQNCj4+IGZv
cm1hdCBiZWZvcmUgbWFraW5nIGFueSBjYXB0dXJlIHVzaW5nIHY0bDItY3RsIG9yIEdTdHJlYW1l
ciwgcXVpdGUNCj4+IGhlYXZ5IGluIGZhY3QuDQo+PiBCZW5qYW1pbiBkaWQgYW5vdGhlciB0cnkg
dXNpbmcgbmV3IGxpYmNhbWVyYSBjb2RlYmFzZSwgYnV0IGV2ZW4gZm9yIGENCj4+IGJhc2ljIGNh
cHR1cmUgdXNlLWNhc2UsIG5lZ290aWF0aW9uIGNvZGUgaXMgcXVpdGUgdHJpY2t5IGluIG9yZGVy
IHRvDQo+PiBtYXRjaCB0aGUgcmlnaHQgc3ViZGV2aWNlcyBidXMgZm9ybWF0IHRvIHRoZSByZXF1
aXJlZCBWNEwyIGZvcm1hdC4NCj4gDQo+IFdoeSB3b3VsZCBpdCBiZSB0cmlja2llciBpbiB1c2Vy
c3BhY2UgdGhhbiBpbiB0aGUga2VybmVsID8gVGhlIFY0TDINCj4gc3ViZGV2IG9wZXJhdGlvbnMg
YXJlIG1vcmUgb3IgbGVzcyBleHBvc2UgdmVyYmF0aW0gdGhyb3VnaCB0aGUgc3ViZGV2DQo+IHVz
ZXJzcGFjZSBBUEkuDQo+IA0KPj4gTW9yZW92ZXIsIGl0IHdhcyBub3QgY2xlYXIgaG93IHRvIGNh
bGwgbGliY2FtZXJhIGxpYnJhcnkgcHJpb3IgdG8gYW55DQo+PiB2NGwyLWN0bCBvciBHU3RyZWFt
ZXIgY2FsbHMuDQo+IA0KPiBsaWJjYW1lcmEgaXNuJ3QgbWVhbnQgdG8gYmUgY2FsbGVkIGJlZm9y
ZSB2NGwyLWN0bCBvciBHU3RyZWFtZXIuDQo+IEFwcGxpY2F0aW9ucyBhcmUgc3VwcG9zZWQgdG8g
YmUgYmFzZWQgZGlyZWN0bHkgb24gbGliY2FtZXJhLCBvciwgZm9yDQo+IGV4aXN0aW5nIHVzZXJz
cGFjZSBBUElzIHN1Y2ggYXMgVjRMMiBvciBHU3RyZWFtZXIsIGNvbXBhdGliaWxpdHkgbGF5ZXJz
DQo+IGFyZSBzdXBwb3NlZCB0byBiZSBkZXZlbG9wZWQuIEZvciBWNEwyIGl0IHdpbGwgdGFrZSB0
aGUgZm9ybSBvZiBhDQo+IExEX1BSRUxPQUQtYWJsZSAuc28gdGhhdCB3aWxsIGludGVyY2VwdCB0
aGUgVjRMMiBBUEkgY2FsbHMsIG1ha2luZyBtb3N0DQo+IFY0TDIgYXBwbGljYXRpb25zIHdvcmsg
d2l0aCBsaWJjYW1lcmEgdW5tb2RpZmllZCAoSSBzYWlkIG1vc3QgYXMgMTAwJQ0KPiBjb21wYXRp
YmlsaXR5IHdpbGwgbGlrZWx5IG5vdCBiZSBhY2hpZXZhYmxlKS4gRm9yIEdTdHJlYW1lciBpdCB3
aWxsIHRha2UNCj4gdGhlIGZvcm0gb2YgYSBHU3RyZWFtZXIgbGliY2FtZXJhIGVsZW1lbnQgdGhh
dCB3aWxsIHJlcGxhY2UgdGhlIFY0TDINCj4gc291cmNlIGVsZW1lbnQuDQo+IA0KPj4gQWRkaW5n
IDEwMCBsaW5lcyBvZiBjb2RlIGludG8gRENNSSB0byB3ZWxsIGNvbmZpZ3VyZSByZXNvbHV0aW9u
IGFuZA0KPj4gZm9ybWF0cyBmaXhlcyB0aGUgcG9pbnQgYW5kIGFsbG93cyB1cyB0byBrZWVwIGJh
Y2t3YXJkIGNvbXBhdGliaWxpdHkNCj4+IGFzIHBlciBvdXIgb2JqZWN0aXZlLCBzbyBpdCBzZWVt
cyBmYXIgbW9yZSByZWFzb25hYmxlIHRvIHVzIHRvIGRvIHNvDQo+PiBldmVuIGlmIERDTUkgY29u
dHJvbHMgbW9yZSB0aGFuIHRoZSBzdWJkZXZpY2UgaXQgaXMgY29ubmVjdGVkIHRvLg0KPj4gTW9y
ZW92ZXIgd2UgZm91bmQgc2ltaWxhciBjb2RlIGluIG90aGVyIHZpZGVvIGludGVyZmFjZXMgY29k
ZSBsaWtlDQo+PiBxY29tL2NhbXNzL2NhbXNzLmMgYW5kIHhpbGlueC94aWxpbngtZG1hLmMsIGNv
bnRyb2xsaW5nIHRoZSB3aG9sZQ0KPj4gcGlwZWxpbmUsIHNvIGl0IHNlZW1zIHRvIHVzIHF1aXRl
IG5hdHVyYWwgdG8gZ28gdGhpcyB3YXkuDQo+IA0KPiBJIGNhbid0IGNvbW1lbnQgb24gdGhlIHFj
b20tY2Ftc3MgZHJpdmVyIGFzIEknbSBub3QgYXdhcmUgb2YgaXRzDQo+IGludGVybmFscywgYnV0
IHdoZXJlIGhhdmUgeW91IGZvdW5kIHN1Y2ggY29kZSBpbiB0aGUgWGlsaW54IFY0TDIgZHJpdmVy
cw0KPiA/DQpGb3IgZXguIGluIHhpbGlueC94aWxpbngtZG1hLmMsIHN0cmVhbSBvbi9vZmYgaXMg
cHJvcGFnYXRlZCB0byBhbGwgDQpzdWJkZXZpY2VzIHdpdGhpbiBwaXBlbGluZToNCiAgKiBXYWxr
IHRoZSBlbnRpdGllcyBjaGFpbiBzdGFydGluZyBhdCB0aGUgcGlwZWxpbmUgb3V0cHV0IHZpZGVv
IG5vZGUgDQpzdGF0aWMgaW50IHh2aXBfcGlwZWxpbmVfc3RhcnRfc3RvcChzdHJ1Y3QgeHZpcF9w
aXBlbGluZSAqcGlwZSwgYm9vbCBzdGFydCkNCg0KU2FtZSBmb3IgcWNvbS9jYW1zcy9jYW1zcy12
aWRlby5jOg0Kc3RhdGljIGludCB2aWRlb19zdGFydF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1
ZSAqcSwgdW5zaWduZWQgaW50IGNvdW50KQ0KDQpGb3IgcmVzb2x1dGlvbi9mb3JtYXQsIGluIGV4
eW5vczQtaXMvZmltYy1jYXB0dXJlLmM6DQpzdGF0aWMgaW50IGZpbWNfcGlwZWxpbmVfdHJ5X2Zv
cm1hdChzdHJ1Y3QgZmltY19jdHggKmN0eCwNCi4uLg0KCXdoaWxlICgxKSB7DQouLi4NCgkJLyog
c2V0IGZvcm1hdCBvbiBhbGwgcGlwZWxpbmUgc3ViZGV2cyAqLw0KCQl3aGlsZSAobWUgIT0gJmZp
bWMtPnZpZF9jYXAuc3ViZGV2LmVudGl0eSkgew0KLi4uDQoJCQlyZXQgPSB2NGwyX3N1YmRldl9j
YWxsKHNkLCBwYWQsIHNldF9mbXQsIE5VTEwsICZzZm10KTsNCg0KPiANCj4+IFRvIHN1bW1hcml6
ZSwgaWYgd2UgY2Fubm90IGRvIHRoZSBuZWdvdGlhdGlvbiB3aXRoaW4ga2VybmVsLCBkZWxlZ2F0
aW5nDQo+PiB0aGlzIHRvIHVzZXJzcGFjZSBpbXBsaWVzIGZhciBtb3JlIGNvbXBsZXhpdHkgYW5k
IGJyZWFrcyBjb21wYXRpYmlsaXR5DQo+PiB3aXRoIGV4aXN0aW5nIGFwcGxpY2F0aW9ucyB3aXRo
b3V0IGFkZGluZyBuZXcgZnVuY3Rpb25hbGl0aWVzLg0KPj4NCj4+IEhhdmluZyBhbGwgdGhhdCBp
biBtaW5kLCB3aGF0IHNob3VsZCBiZSByZWNvbnNpZGVyZWQgaW4geW91ciBvcGluaW9uDQo+PiBT
YWthcmkgPyBEbyB5b3UgaGF2ZSBzb21lIGFsdGVybmF0aXZlcyA/DQo+IA0KPiBGaXJzdCBvZiBh
bGwsIGxldCdzIG5vdGUgdGhhdCB5b3VyIHBhdGNoIHNlcmllcyBwZXJmb3JtcyB0byByZWxhdGVk
IGJ1dA0KPiBzdGlsbCBpbmRlcGVuZGVudCBjaGFuZ2VzOiBpdCBlbmFibGVzIE1DIHN1cHBvcnQs
ICphbmQqIGVuYWJsZXMgdGhlIFY0TDINCj4gc3ViZGV2IHVzZXJzcGFjZSBBUEkuIFRoZSBmb3Jt
ZXIgaXMgY2xlYXJseSBuZWVkZWQgYW5kIHdpbGwgYWxsb3cgeW91IHRvDQo+IHVzZSB0aGUgTUMg
QVBJIGludGVybmFsbHkgaW4gdGhlIGtlcm5lbCwgc2ltcGxpZnlpbmcgcGlwZWxpbmUgdHJhdmVy
c2FsLg0KPiBUaGUgbGF0dGVyIHRoZW4gZW5hYmxlcyB0aGUgVjRMMiBzdWJkZXYgdXNlcnNwYWNl
IEFQSSwgbW92aW5nIHRoZQ0KPiBwaXBlbGluZSBjb25maWd1cmF0aW9uIHJlc3BvbnNpYmlsaXR5
IHRvIHVzZXJzcGFjZS4NCj4gDQo+IFlvdSBjb3VsZCBpbiB0aGVvcnkgbW92ZSB0byB0aGUgTUMg
QVBJIGluc2lkZSB0aGUga2VybmVsLCB3aXRob3V0DQo+IGVuYWJsaW5nIHN1cHBvcnQgZm9yIHRo
ZSBWNEwyIHN1YmRldiB1c2Vyc3BhY2UgQVBJLiBDb25maWd1cmluZyB0aGUNCj4gcGlwZWxpbmUg
YW5kIHByb3BhZ2F0aW5nIHRoZSBmb3JtYXRzIHdvdWxkIHRoZW4gYmUgdGhlIHJlc3BvbnNpYmls
aXR5IG9mDQo+IHRoZSBrZXJuZWwgZHJpdmVyLg0KDQpZZXMgdGhpcyBpcyBleGFjdGx5IHdoYXQg
d2Ugd2FudCB0byBkby4NCklmIEkgdW5kZXJzdGFuZCB3ZWxsLCB0byBkaXNhYmxlIHRoZSBWNEwy
IHN1YmRldiB1c2Vyc3BhY2UgQVBJLCBJIGp1c3QgDQpoYXZlIHRvIHJlbW92ZSB0aGUgbWVkaWEg
ZGV2aWNlIHJlZ2lzdHJ5Og0KLQkvKiBSZWdpc3RlciB0aGUgbWVkaWEgZGV2aWNlICovDQotCXJl
dCA9IG1lZGlhX2RldmljZV9yZWdpc3RlcigmZGNtaS0+bWRldik7DQotCWlmIChyZXQpIHsNCi0J
CWRldl9lcnIoZGNtaS0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIG1lZGlhIGRldmljZSAoJWQp
XG4iLA0KLQkJCXJldCk7DQotCQlnb3RvIGVycl9tZWRpYV9kZXZpY2VfY2xlYW51cDsNCi0JfQ0K
RG8geW91IHNlZSBhbnkgYWRkaXRpb25hbCB0aGluZ3MgdG8gZG8gPw0KDQoNCj4gSG93ZXZlciwg
dGhpcyB3aWxsIGxpbWl0IHlvdXIgZHJpdmVyIHRvIHRoZQ0KPiBmb2xsb3dpbmc6DQo+IA0KPiAt
IEZ1bGx5IGxpbmVhciBwaXBlbGluZXMgb25seSAoc2luZ2xlIHNlbnNvcikNCj4gLSBObyBzdXBw
b3J0IGZvciBjb250cm9scyBpbXBsZW1lbnRlZCBieSBtdWx0aXBsZSBlbnRpdGllcyBpbiB0aGUN
Cj4gICAgcGlwZWxpbmUgKGZvciBpbnN0YW5jZSBjb250cm9scyB0aGF0IHdvdWxkIGV4aXN0IGlu
IGJvdGggdGhlIHNlbnNvcg0KPiAgICBhbmQgdGhlIGJyaWRnZSwgc3VjaCBhcyBnYWlucykNCj4g
LSBObyBwcm9wZXIgc3VwcG9ydCBmb3Igc2NhbGluZyBjb25maWd1cmF0aW9uIGlmIG11bHRpcGxl
IGNvbXBvbmVudHMgaW4NCj4gICAgdGhlIHBpcGVsaW5lIGNhbiBzY2FsZQ0KPiANCj4gQXJlIHlv
dSB3aWxsaW5nIHRvIHNldCB0aG9zZSBsaW1pdGF0aW9ucyBpbiBzdG9uZSBhbmQgZ2l2ZSB1cCBv
bg0KPiBzdXBwb3J0aW5nIHRob3NlIGZlYXR1cmVzID8NCj4gDQoNClRoZSBpbnZvbHZlZCBoYXJk
d2FyZSBkbyBub3QgaGF2ZSB0aG9zZSBmZWF0dXJlcywgbm8gbmVlZCBvZiBleHRyYSANCmZ1bmN0
aW9uYWxpdGllcyB0byBiZSBleHBvc2VkIHRvIHVzZXJzcGFjZSwgc28gdGhpcyBpcyBmaW5lLg0K
DQoNCkknbGwgcHVzaCBhIHYzIHdpdGggdGhpcyBjaGFuZ2UgYW5kIHRoZSBvdGhlciBmaXhlcyBy
ZWxhdGVkIHRvIFNha2FyaSANCmFuZCBIYW5zIGNvbW1lbnRzLg0KDQpQbGVhc2UgU2FrYXJpICYg
SGFucywgYWxzbyBjb21tZW50IG9uIHRoYXQgY2hhbmdlIHRoYXQgd2UgY2FuIGNvbnZlcmdlIA0K
b24gdjMuDQoNCg0KQmVzdCByZWdhcmRzLA0KSHVndWVzLg==
