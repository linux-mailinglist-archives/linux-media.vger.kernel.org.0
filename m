Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36CAC507D5
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 12:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730280AbfFXKKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 06:10:38 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:1743 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730450AbfFXKKg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 06:10:36 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5OA62I3032026;
        Mon, 24 Jun 2019 12:10:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=f7nKa6SlB25HuKxpO9ORVYe76aQxcf81fhY3D6AwPCY=;
 b=qVAS3sfAEQKMyPUYW5onOQocf3HQ1xMc8a9OD35wBW1ET4c0Z+4Dm3+rqFboLskfsnvq
 L8mMSSDW3Cwvjy3glbyAwXs6v05wRZy+NzeQ83Zf3S24eyII1+VfHuj/zjb5mblxv1Iv
 UO0OC8n4axKvQk5Ek1PG8cU8IxqL6PNFQ/CPrT1/+Z6u7yJEeCdnZ9YrJPn6XMhHtMbI
 eQJVmp3lvfvasGSVYBAR2Lebs7rZy2l/a381BzqK3tcgn6RHHFO4f3TjrST9Cf9oJAB1
 FPe6EN0eDxbQHR9+LqDu5Ja2axh+NPg3/kTx550GNqA2g+DFAnNpKo9yB7QJJwZ4JER7 Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2t9d2g29h3-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 24 Jun 2019 12:10:08 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 541973A;
        Mon, 24 Jun 2019 10:10:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16CA22661;
        Mon, 24 Jun 2019 10:10:06 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 24 Jun
 2019 12:10:05 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Mon, 24 Jun 2019 12:10:05 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
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
Thread-Index: AQHVJ4OqL2qtYdvbaESId3efmYQAfaaqeW6A
Date:   Mon, 24 Jun 2019 10:10:05 +0000
Message-ID: <ae097d67-58fe-82d7-78d6-2445664f28db@st.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <20190620161721.h3wn4nibomrvriw4@kekkonen.localdomain>
In-Reply-To: <20190620161721.h3wn4nibomrvriw4@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <85607FCBA25C3B4296E8D683984E4084@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-24_08:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQogPiAtIFdoZXJlJ3MgdGhlIHN1Yi1kZXZpY2UgcmVwcmVzZW50aW5nIHRo
ZSBicmlkZ2UgaXRzZWxmPw0KVGhpcyBpcyBwb2ludGVkIGJ5IFsxXTogZHJpdmVycy9tZWRpYS9p
MmMvc3QtbWlwaWQwMi5jDQoNCiA+IC0gQXMgdGhlIGRyaXZlciBiZWNvbWVzIE1DLWNlbnRyaWMs
IGNyb3AgY29uZmlndXJhdGlvbiB0YWtlcyBwbGFjZQ0KdGhyb3VnaA0KID4gICBWNEwyIHN1Yi1k
ZXZpY2UgaW50ZXJmYWNlLCBub3QgdGhyb3VnaCB0aGUgdmlkZW8gZGV2aWNlIG5vZGUuDQogPiAt
IFNhbWUgZ29lcyBmb3IgYWNjZXNzaW5nIHNlbnNvciBjb25maWd1cmF0aW9uOiBpdCBkb2VzIG5v
dCB0YWtlIHBsYWNlDQogPiAgIHRocm91Z2ggdmlkZW8gbm9kZSBidXQgdGhyb3VnaCB0aGUgc3Vi
LWRldmljZSBub2Rlcy4NCg0KT3VyIG9iamVjdGl2ZSBpcyB0byBiZSBhYmxlIHRvIHN1cHBvcnQg
ZWl0aGVyIGEgc2ltcGxlIHBhcmFsbGVsIHNlbnNvcg0Kb3IgYSBDU0ktMiBzZW5zb3IgY29ubmVj
dGVkIHRocm91Z2ggYSBicmlkZ2Ugd2l0aG91dCBhbnkgY2hhbmdlcyBvbiANCnVzZXJzcGFjZSBz
aWRlIGJlY2F1c2Ugbm8gYWRkaXRpb25hbCBwcm9jZXNzaW5nIG9yIGNvbnZlcnNpb24gaW52b2x2
ZWQsIA0Kb25seSBkZXNlcmlhbGlzYXRpb24gaXMgbS4NCldpdGggdGhlIHByb3Bvc2VkIHNldCBv
ZiBwYXRjaGVzLCB3ZSBzdWNjZWVkZWQgdG8gZG8gc28sIHRoZSBzYW1lIA0Kbm9uLXJlZ3Jlc3Np
b24gdGVzdHMgY2FtcGFpZ24gaXMgcGFzc2VkIHdpdGggT1Y1NjQwIHBhcmFsbGVsIHNlbnNvciAN
CihTVE0zMk1QMSBldmFsdWF0aW9uIGJvYXJkKSBvciBPVjU2NDAgQ1NJLTIgc2Vuc29yIChBdmVu
Z2VyOTYgYm9hcmQgd2l0aCANCkQzIG1lenphbmluZSBib2FyZCkuDQoNCldlIGRvbid0IHdhbnQg
ZHJpdmVyIHRvIGJlIE1DLWNlbnRyaWMsIG1lZGlhIGNvbnRyb2xsZXIgc3VwcG9ydCB3YXMgDQpy
ZXF1aXJlZCBvbmx5IHRvIGdldCBhY2Nlc3MgdG8gdGhlIHNldCBvZiBmdW5jdGlvbnMgbmVlZGVk
IHRvIGxpbmsgYW5kDQp3YWxrIHRyb3VnaCBzdWJkZXZpY2VzOiBtZWRpYV9jcmVhdGVfcGFkX2xp
bmsoKSwgDQptZWRpYV9lbnRpdHlfcmVtb3RlX3BhZCgpLCBldGMuLi4NCg0KV2UgZGlkIGEgdHJ5
IHdpdGggdGhlIHYxIHZlcnNpb24gb2YgdGhpcyBwYXRjaHNldCwgZGVsZWdhdGluZyBzdWJkZXZp
Y2VzIA0KaGFuZGxpbmcgdG8gdXNlcnNwYWNlLCBieSB1c2luZyBtZWRpYS1jb250cm9sbGVyLCBi
dXQgdGhpcyByZXF1aXJlIHRvIA0KY29uZmlndXJlIGZpcnN0IHRoZSBwaXBlbGluZSBmb3IgZWFj
aCBzaW5nbGUgY2hhbmdlIG9mIHJlc29sdXRpb24gYW5kIA0KZm9ybWF0IGJlZm9yZSBtYWtpbmcg
YW55IGNhcHR1cmUgdXNpbmcgdjRsMi1jdGwgb3IgR1N0cmVhbWVyLCBxdWl0ZSANCmhlYXZ5IGlu
IGZhY3QuDQpCZW5qYW1pbiBkaWQgYW5vdGhlciB0cnkgdXNpbmcgbmV3IGxpYmNhbWVyYSBjb2Rl
YmFzZSwgYnV0IGV2ZW4gZm9yIGEgDQpiYXNpYyBjYXB0dXJlIHVzZS1jYXNlLCBuZWdvdGlhdGlv
biBjb2RlIGlzIHF1aXRlIHRyaWNreSBpbiBvcmRlciB0bw0KbWF0Y2ggdGhlIHJpZ2h0IHN1YmRl
dmljZXMgYnVzIGZvcm1hdCB0byB0aGUgcmVxdWlyZWQgVjRMMiBmb3JtYXQuDQpNb3Jlb3Zlciwg
aXQgd2FzIG5vdCBjbGVhciBob3cgdG8gY2FsbCBsaWJjYW1lcmEgbGlicmFyeSBwcmlvciB0byBh
bnkNCnY0bDItY3RsIG9yIEdTdHJlYW1lciBjYWxscy4NCg0KQWRkaW5nIDEwMCBsaW5lcyBvZiBj
b2RlIGludG8gRENNSSB0byB3ZWxsIGNvbmZpZ3VyZSByZXNvbHV0aW9uIGFuZCANCmZvcm1hdHMg
Zml4ZXMgdGhlIHBvaW50IGFuZCBhbGxvd3MgdXMgdG8ga2VlcCBiYWNrd2FyZCBjb21wYXRpYmls
aXR5DQphcyBwZXIgb3VyIG9iamVjdGl2ZSwgc28gaXQgc2VlbXMgZmFyIG1vcmUgcmVhc29uYWJs
ZSB0byB1cyB0byBkbyBzbw0KZXZlbiBpZiBEQ01JIGNvbnRyb2xzIG1vcmUgdGhhbiB0aGUgc3Vi
ZGV2aWNlIGl0IGlzIGNvbm5lY3RlZCB0by4NCk1vcmVvdmVyIHdlIGZvdW5kIHNpbWlsYXIgY29k
ZSBpbiBvdGhlciB2aWRlbyBpbnRlcmZhY2VzIGNvZGUgbGlrZSANCnFjb20vY2Ftc3MvY2Ftc3Mu
YyBhbmQgeGlsaW54L3hpbGlueC1kbWEuYywgY29udHJvbGxpbmcgdGhlIHdob2xlIA0KcGlwZWxp
bmUsIHNvIGl0IHNlZW1zIHRvIHVzIHF1aXRlIG5hdHVyYWwgdG8gZ28gdGhpcyB3YXkuDQoNClRv
IHN1bW1hcml6ZSwgaWYgd2UgY2Fubm90IGRvIHRoZSBuZWdvdGlhdGlvbiB3aXRoaW4ga2VybmVs
LCBkZWxlZ2F0aW5nDQp0aGlzIHRvIHVzZXJzcGFjZSBpbXBsaWVzIGZhciBtb3JlIGNvbXBsZXhp
dHkgYW5kIGJyZWFrcyBjb21wYXRpYmlsaXR5DQp3aXRoIGV4aXN0aW5nIGFwcGxpY2F0aW9ucyB3
aXRob3V0IGFkZGluZyBuZXcgZnVuY3Rpb25hbGl0aWVzLg0KDQpIYXZpbmcgYWxsIHRoYXQgaW4g
bWluZCwgd2hhdCBzaG91bGQgYmUgcmVjb25zaWRlcmVkIGluIHlvdXIgb3BpbmlvbiANClNha2Fy
aSA/IERvIHlvdSBoYXZlIHNvbWUgYWx0ZXJuYXRpdmVzID8NCg0KQmVzdCByZWdhcmRzLA0KSHVn
dWVzLg0KDQoNCk9uIDYvMjAvMTkgNjoxNyBQTSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiBIaSBI
dWd1ZXMsDQo+IA0KPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxMDo0ODoyOUFNICswMjAwLCBI
dWd1ZXMgRnJ1Y2hldCB3cm90ZToNCj4+IFRoaXMgcGF0Y2ggc2VyaWUgYWxsb3dzIHRvIGNvbm5l
Y3Qgbm9uLXBhcmFsbGVsIGNhbWVyYSBzZW5zb3IgdG8NCj4+IERDTUkgdGhhbmtzIHRvIGEgYnJp
ZGdlIGNvbm5lY3RlZCBpbiBiZXR3ZWVuIHN1Y2ggYXMgU1RNSVBJRDAyIFsxXS4NCj4+DQo+PiBN
ZWRpYSBjb250cm9sbGVyIHN1cHBvcnQgaXMgaW50cm9kdWNlZCBmaXJzdCwgdGhlbiBzdXBwb3J0
IG9mDQo+PiBzZXZlcmFsIHN1Yi1kZXZpY2VzIHdpdGhpbiBwaXBlbGluZSB3aXRoIGR5bmFtaWMg
bGlua2luZw0KPj4gYmV0d2VlbiB0aGVtLg0KPj4gSW4gb3JkZXIgdG8ga2VlcCBiYWNrd2FyZCBj
b21wYXRpYmlsaXR5IHdpdGggYXBwbGljYXRpb25zDQo+PiByZWx5aW5nIG9uIFY0TDIgaW50ZXJm
YWNlIG9ubHksIGZvcm1hdCBzZXQgb24gdmlkZW8gbm9kZQ0KPj4gaXMgcHJvcGFnYXRlZCB0byBh
bGwgc3ViLWRldmljZXMgY29ubmVjdGVkIHRvIGNhbWVyYSBpbnRlcmZhY2UuDQo+Pg0KPj4gWzFd
IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2RldmljZXRyZWUvbXNnMjc4MDAyLmh0bWwN
Cj4gDQo+IEdlbmVyYWwgbm90ZXMgb24gdGhlIHNldCwgbm90IHJlbGF0ZWQgdG8gYW55IHNpbmds
ZSBwYXRjaDoNCj4gDQo+IC0gV2hlcmUncyB0aGUgc3ViLWRldmljZSByZXByZXNlbnRpbmcgdGhl
IGJyaWRnZSBpdHNlbGY/DQo+IA0KPiAtIEFzIHRoZSBkcml2ZXIgYmVjb21lcyBNQy1jZW50cmlj
LCBjcm9wIGNvbmZpZ3VyYXRpb24gdGFrZXMgcGxhY2UgdGhyb3VnaA0KPiAgICBWNEwyIHN1Yi1k
ZXZpY2UgaW50ZXJmYWNlLCBub3QgdGhyb3VnaCB0aGUgdmlkZW8gZGV2aWNlIG5vZGUuDQo+IA0K
PiAtIFNhbWUgZ29lcyBmb3IgYWNjZXNzaW5nIHNlbnNvciBjb25maWd1cmF0aW9uOiBpdCBkb2Vz
IG5vdCB0YWtlIHBsYWNlDQo+ICAgIHRocm91Z2ggdmlkZW8gbm9kZSBidXQgdGhyb3VnaCB0aGUg
c3ViLWRldmljZSBub2Rlcy4NCj4g
