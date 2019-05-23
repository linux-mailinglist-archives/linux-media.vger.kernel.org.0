Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEAD28C0C
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 23:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730546AbfEWVFC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 17:05:02 -0400
Received: from mail-oln040092066014.outbound.protection.outlook.com ([40.92.66.14]:23040
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726222AbfEWVFC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 17:05:02 -0400
Received: from VE1EUR01FT040.eop-EUR01.prod.protection.outlook.com
 (10.152.2.55) by VE1EUR01HT076.eop-EUR01.prod.protection.outlook.com
 (10.152.3.119) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16; Thu, 23 May
 2019 21:04:58 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com (10.152.2.60) by
 VE1EUR01FT040.mail.protection.outlook.com (10.152.3.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Thu, 23 May 2019 21:04:58 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0]) by VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0%4]) with mapi id 15.20.1922.016; Thu, 23 May 2019
 21:04:58 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Thread-Topic: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Thread-Index: AQHVCwZV113RJIvxkU+HTUkBX8F+66Z5QEiA
Date:   Thu, 23 May 2019 21:04:58 +0000
Message-ID: <VI1PR03MB42069F5239582E3FEBD1C925AC010@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
In-Reply-To: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0094.eurprd05.prod.outlook.com
 (2603:10a6:207:1::20) To VI1PR03MB4206.eurprd03.prod.outlook.com
 (2603:10a6:803:51::23)
x-incomingtopheadermarker: OriginalChecksum:4916E29999A3F48BF938B02CF6A6C703125917C35E5EB0EE75730DF7138909B0;UpperCasedChecksum:417EE4FFC52158C522A626544990715ABEE9F87022CC216DD42220EAED5EA004;SizeAsReceived:7866;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [UtRaYd8EyQeDOz+rkJXDeXsefGEWl9LE]
x-microsoft-original-message-id: <8d65b6b1-858d-c52a-7aee-eb24db7d6a8d@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:VE1EUR01HT076;
x-ms-traffictypediagnostic: VE1EUR01HT076:
x-microsoft-antispam-message-info: /mQa/fV1mHhnK5tdl3JvciHyfv9FtQZZJXmL4jzR8nIz9vG3DnJdFHOplauAhT2ge2iKx0xe9+C0uO6mq0Wu8h4Kz2ycHEdAB15miai1Jm1vlf+Y2sLvS5jBn5vGnRSH+QnZQiByTkUDp9JFqHWWqvtZ0xJK1MOc7TT17Odz5zJXOpj2czYHS2H61m09pgaD
Content-Type: text/plain; charset="utf-8"
Content-ID: <0428CB9032C0934C8B271A9B84D6AF92@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fb0a5c-7db1-4c41-76e7-08d6dfc24ff1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 21:04:58.3964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT076
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0wNS0xNSAxMjowOSwgUGF1bCBLb2NpYWxrb3dza2kgd3JvdGU6DQo+IEhpLA0KPg0K
PiBXaXRoIHRoZSBSb2NrY2hpcCBzdGF0ZWxlc3MgVlBVIGRyaXZlciBpbiB0aGUgd29ya3MsIHdl
IG5vdyBoYXZlIGENCj4gYmV0dGVyIGlkZWEgb2Ygd2hhdCB0aGUgc2l0dWF0aW9uIGlzIGxpa2Ug
b24gcGxhdGZvcm1zIG90aGVyIHRoYW4NCj4gQWxsd2lubmVyLiBUaGlzIGVtYWlsIHNoYXJlcyBt
eSBjb25jbHVzaW9ucyBhYm91dCB0aGUgc2l0dWF0aW9uIGFuZCBob3cNCj4gd2Ugc2hvdWxkIHVw
ZGF0ZSB0aGUgTVBFRy0yLCBILjI2NCBhbmQgSC4yNjUgY29udHJvbHMgYWNjb3JkaW5nbHkuDQo+
DQo+IFsuLi5dDQo+DQo+IC0gQ2xlYXIgc3BsaXQgb2YgY29udHJvbHMgYW5kIHRlcm1pbm9sb2d5
DQo+DQo+IFNvbWUgY29kZWNzIGhhdmUgZXhwbGljaXQgTkFMIHVuaXRzIHRoYXQgYXJlIGdvb2Qg
Zml0cyB0byBtYXRjaCBhcw0KPiBjb250cm9sczogZS5nLiBzbGljZSBoZWFkZXIsIHBwcywgc3Bz
LiBJIHRoaW5rIHdlIHNob3VsZCBzdGljayB0byB0aGUNCj4gYml0c3RyZWFtIGVsZW1lbnQgbmFt
ZXMgZm9yIHRob3NlLg0KPg0KPiBGb3IgSC4yNjQsIHRoYXQgd291bGQgc3VnZ2VzdCB0aGUgZm9s
bG93aW5nIGNoYW5nZXM6DQo+IC0gcmVuYW1pbmcgdjRsMl9jdHJsX2gyNjRfZGVjb2RlX3BhcmFt
IHRvIHY0bDJfY3RybF9oMjY0X3NsaWNlX2hlYWRlcjsNCj4gLSBraWxsaW5nIHY0bDJfY3RybF9o
MjY0X2RlY29kZV9wYXJhbSBhbmQgaGF2aW5nIHRoZSByZWZlcmVuY2UgbGlzdHMNCj4gd2hlcmUg
dGhleSBiZWxvbmcsIHdoaWNoIHNlZW1zIHRvIGJlIHNsaWNlX2hlYWRlcjsNCg0KSSBoYXZlIHR3
byBtb3JlIGNoYW5nZXMgYW5kL29yIGNsYXJpZmljYXRpb25zIHRoYXQgaXMgbmVlZGVkIGZvciB2
NGwyX2N0cmxfaDI2NF9zY2FsaW5nX21hdHJpeCwNCnRoZSBleHBlY3RlZCBvcmRlciBvZiBzY2Fs
aW5nX2xpc3QgZWxlbWVudHMgbmVlZHMgdG8gYmUgZGVmaW5lZCBhbmQgZG9jdW1lbnRlZC4NCg0K
SW4gY2VkcnVzIGRyaXZlciB0aGUgZXhwZWN0ZWQgb3JkZXIgb2YgZWxlbWVudHMgaXMgYWZ0ZXIg
dGhlIGludmVyc2Ugc2Nhbm5pbmcgcHJvY2VzcyBhcyBiZWVuIGFwcGxpZWQuDQpUaGlzIGlzIGlu
IHRoZSBvcmRlciB0aGUgaGFyZHdhcmUgZXhwZWN0cyBhbmQgd2hhdCBib3RoIGZmbXBlZyB1c2Ug
aW50ZXJuYWxseSBhbmQgdmFhcGkgZXhwZWN0cywNCmFsbG93cyBmb3Igc2ltcGxlIG1lbWNweS9z
cmFtIHdyaXRlIGluIGJvdGggdXNlcnNwYWNlIGFuZCBkcml2ZXIuDQoNClRoZSByb2NrY2hpcCB2
cHUgaDI2NCBkcml2ZXIgZnJvbSBjaHJvbWVvcyB3YXMgZXhwZWN0aW5nIGVsZW1lbnRzIGluIHNj
YWxpbmcgbGlzdCBvcmRlciBhbmQgd291bGQgYXBwbHkNCnRoZSBpbnZlcnNlIHppZy16YWcgc2Nh
biBpbiBkcml2ZXIuIFNpZGUgbm90ZTogaXQgd291bGQgYWxzbyB3cm9uZ2x5IGFwcGx5IHppZy16
YWcgc2NhbiBpbnN0ZWFkIG9mIGZpZWxkIHNjYW4gb24gZmllbGQgY29kZWQgY29udGVudC4NCg0K
SSBwcm9wb3NlIGEgY2xhcmlmaWNhdGlvbiB0aGF0IHRoZSBzY2FsaW5nIGxpc3RzIGVsZW1lbnQg
b3JkZXIgc2hvdWxkIGJlIGFmdGVyIHRoZSBpbnZlcnNlIHNjYW5uaW5nIHByb2Nlc3MgYXMgYmVl
biBhcHBsaWVkLA0KdGhlIG9yZGVyIHRoYXQgY2VkcnVzLCByb2NrY2hpcCBhbmQgdmFhcGkgZXhw
ZWN0cy4NCg0KU2Vjb25kbHkgdGhlIG9yZGVyIG9mIHRoZSBzaXggc2NhbGluZ19saXN0Xzh4OCBs
aXN0cyBpcyBjdXJyZW50bHkgdXNpbmcgImZmbXBlZyBvcmRlciIgd2hlcmUgSW50cmEgWSBpcyBp
biBbMF0gYW5kIEludGVyIFkgaW4gWzNdLg0KVGFibGUgNy0yIGluIEguMjY0IHNwZWNpZmljYXRp
b24gbGlzdCB0aGVtIGluIGZvbGxvd2luZyBvcmRlciAoaW5kZXggNi0xMSk6IEludHJhIFksIElu
dGVyIFksIEludHJhIENiLCBJbnRlciBDYiwgSW50cmEgQ3IgYW5kIEludGVyIENyLg0KVGhlIDh4
OCBDYi9DciBsaXN0cyBzaG91bGQgb25seSBiZSBuZWVkZWQgZm9yIDQ6NDo0IGNvbnRlbnQuDQoN
ClJvY2tjaGlwIHdhcyBleHBlY3RpbmcgSW50cmEvSW50ZXIgWSB0byBiZSBpbiBbMF0gYW5kIFsx
XSwgY2VkcnVzIHVzZSBsaXN0IFswXSBhbmQgWzNdLg0KVkEtQVBJIG9ubHkgc2VlbSB0byBzdXBw
b3J0IEludHJhL0ludGVyIFksIGZmbXBlZyB2YWFwaSBod2FjY2VsIGNvcGllcyBbMF0gYW5kIFsz
XSBpbnRvIHZhYXBpIFswXSBhbmQgWzFdLg0KDQpJIHByb3Bvc2UgYSBjbGFyaWZpY2F0aW9uIHRo
YXQgdGhlIDh4OCBzY2FsaW5nIGxpc3RzIHVzZSB0aGUgc2FtZSBvcmRlciBhcyB0aGV5IGFyZSBs
aXN0ZWQgaW4gVGFibGUgNy0yLA0KYW5kIHRoYXQgY2VkcnVzIGRyaXZlciBpcyBjaGFuZ2VkIHRv
IHVzZSA4eDggbGlzdHMgZnJvbSBbMF0gYW5kIFsxXSBpbnN0ZWFkIG9mIFswXSBhbmQgWzNdLg0K
DQpSZWdhcmRzLA0KSm9uYXMNCg0KPiBJJ20gdXAgZm9yIHByZXBhcmluZyBhbmQgc3VibWl0dGlu
ZyB0aGVzZSBjb250cm9sIGNoYW5nZXMgYW5kIHVwZGF0aW5nDQo+IGNlZHJ1cyBpZiB0aGV5IHNl
ZW0gYWdyZWVhYmxlLg0KPg0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCj4NCj4gQ2hlZXJzLA0KPg0K
PiBQYXVsDQo=
