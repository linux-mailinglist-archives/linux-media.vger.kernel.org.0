Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAB9E1479F6
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 10:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729093AbgAXJEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 04:04:43 -0500
Received: from mail-co1nam11on2064.outbound.protection.outlook.com ([40.107.220.64]:8038
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726294AbgAXJEn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 04:04:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMVqYCZsQq9sTQq6mZey6QxYNyPDho6sWBaeANvQYzNs7tSUrmESVp4zatlJccGgs+35vdqL/PvXIYMtl3zu+w0dEndZggcdgN84m/ZZO6g30LAmbWrxdRZBPWzvMZAb2iA3zsFNdL6fJhjgFbdlR3gxKC9wvo9UmsPHc6s8OnzKyQqLs/mLucFijEg+CZvL09A86aEX8SmnAW8gdE5weGo988ZtmUb5tcRGx4XgqRVL3XnpWXSrNz9x2SGpJ6izdwYM8CBrzO4oSDDKls/re1szafsWkl0eiEBLMDJWCxkcuNNy7+O4+x5V4Zjm++7VcC8ckozWQkOezlDBuRFi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/jP67mZe1Sb+0gr3YDnrmt3gJrUNvhaCkI9LtLdni4=;
 b=ax74+8zsFwvay+x1nOf4VKL8zALCycl0hhNfz129r+vHwTawuiBvD4EuHo4KTboxtI2mPNWj1g1hyq5a4LsK1GNzZZ5oIZUVOFPN+qQq2Y9VJWVKsuOksllQ9WaSCFRfMqvTrdqtxSJWNWs0qudVW9nkeaM48C7D31vzkm9LIMqIxs0ONKxnqkS8ttPsvMKBjdwHAnKQNzwHV6s2l+nEa/ZOzGDlg1QtbnPPTd2x4TJ3k5DLmoDChIzP1V09AxsrG3lbFBT848LuTplloyGNLjadJh8Fh11Se15qedPD4199kCr5UkSOBuiE7TC5yHGAWDVr7YpNiOgrLFCnfztzJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/jP67mZe1Sb+0gr3YDnrmt3gJrUNvhaCkI9LtLdni4=;
 b=gMuOp3p/N9UhRW2UBbM5E7cIp8oHDVNp2KMyxKyscbEb0VXGUQWXHtlXdbfpNCHIacDQNc+37tHFkwofsR2KiEBZS0n1zMERryLTYUsaejh8Y1weOiGqdZoTdhkdWd96nQeXcou1NWtdOJK5SUnwYRlkwgEWxB7deDCs+ODjtn8=
Received: from CY4PR02MB3142.namprd02.prod.outlook.com (10.165.88.151) by
 CY4PR02MB2407.namprd02.prod.outlook.com (10.169.183.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Fri, 24 Jan 2020 09:04:39 +0000
Received: from CY4PR02MB3142.namprd02.prod.outlook.com
 ([fe80::80a2:e947:f188:1fbe]) by CY4PR02MB3142.namprd02.prod.outlook.com
 ([fe80::80a2:e947:f188:1fbe%7]) with mapi id 15.20.2665.017; Fri, 24 Jan 2020
 09:04:39 +0000
From:   Vishal Sagar <vsagar@xilinx.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Dylan Yip <dylany@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
        Madhurkiran Harikrishnan <MADHURKI@xilinx.com>,
        Jianqiang Chen <jianqian@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        Cyril Chemparathy <cyrilc@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Subhransu Sekhar Prusty <sprusty@xilinx.com>,
        Anil Kumar Chimbeti <anilchc@xilinx.com>
Subject: RE: [RFC] V4L HDR Architecture Proposal
Thread-Topic: [RFC] V4L HDR Architecture Proposal
Thread-Index: AQHV0e3ljePhMxexpUCwZQuK397w2qf5POqg
Date:   Fri, 24 Jan 2020 09:04:39 +0000
Message-ID: <CY4PR02MB314231543765B9CC09C0735BA70E0@CY4PR02MB3142.namprd02.prod.outlook.com>
References: <BYAPR02MB57027075B640D2F530E890E8B00C0@BYAPR02MB5702.namprd02.prod.outlook.com>
 <825d563b-7cb7-5055-d1af-b9b8eba1deb9@xs4all.nl>
In-Reply-To: <825d563b-7cb7-5055-d1af-b9b8eba1deb9@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsagar@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a2404eff-b81c-4def-a5eb-08d7a0ac71b5
x-ms-traffictypediagnostic: CY4PR02MB2407:|CY4PR02MB2407:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR02MB2407363F9C067BE5AD10F483A70E0@CY4PR02MB2407.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(189003)(199004)(66946007)(8936002)(9686003)(33656002)(66446008)(2906002)(64756008)(107886003)(4326008)(478600001)(186003)(66476007)(66556008)(76116006)(52536014)(81156014)(55016002)(71200400001)(86362001)(26005)(8676002)(81166006)(5660300002)(7696005)(53546011)(54906003)(316002)(110136005)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR02MB2407;H:CY4PR02MB3142.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BRf4ql40QJkVVLYGQ5iEWzgd5nabBzm5Z+5lWItxD+XyUSH9MyA4dnZxVO4xzcxPTrlaU3GMYz9ZzO9IE2S3yFAKWdvDDR6j/n+XHBbczl0gdDzbAh7UGa7CE8iwXhf/5V1ZeVt1VSPVwby7C/pI+BAtJ0FBT95xhB0WPz8tcPNXTdY4+r48o3j3QhLmuwrQfDmkqvoPFJddcqIfD5HpGEQFaGFj1GhRtF7PZ4B0speLGbV5W/UkUD5H1Y0hQ5oID+yOonWUXdRp0TjvcLTnyUgvKvr9fcz5q4SLBTIafMO0GeHCNDkZTWBOjXU7ZZca/DiZCcQ8vjfZViytLETv8TslCbk3xh0pq8bQLZcd6+S8J24vhhUfIL/h5SmhV4E072qhKCtbkUbeDVcDrIYvXeh4v8nS7oVpCRCR0RUKTlDauHOg0fVCTuxmo/7i/UL6nv8+HkoYdcXZR7uToYIuuNelJUMI2lENT0IKoKFpGdw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2404eff-b81c-4def-a5eb-08d7a0ac71b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 09:04:39.8073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+9m4uviKrW/FGz3ftsr9TqQhh1yuOLxTPqunOXDE1J0/veh9d0dPFMD41Bw6rVN9fzfnIkGdIgNBW0z9DOSMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2407
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KVGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlIQ0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IGxpbnV4LW1lZGlhLW93bmVyQHZnZXIua2VybmVsLm9yZyA8
bGludXgtbWVkaWEtDQo+IG93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIEhhbnMg
VmVya3VpbA0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAyMywgMjAyMCA2OjM2IFBNDQo+IFRv
OiBEeWxhbiBZaXAgPGR5bGFueUB4aWxpbnguY29tPjsgTGF1cmVudCBQaW5jaGFydA0KPiA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwu
b3JnDQo+IENjOiBWYXJ1bmt1bWFyIEFsbGFnYWRhcGEgPFZBUlVOS1VNQHhpbGlueC5jb20+OyBN
YWRodXJraXJhbg0KPiBIYXJpa3Jpc2huYW4gPE1BREhVUktJQHhpbGlueC5jb20+OyBKaWFucWlh
bmcgQ2hlbg0KPiA8amlhbnFpYW5AeGlsaW54LmNvbT47IEh5dW4gS3dvbiA8aHl1bmtAeGlsaW54
LmNvbT47IEN5cmlsIENoZW1wYXJhdGh5DQo+IDxjeXJpbGNAeGlsaW54LmNvbT47IFZpc2hhbCBT
YWdhciA8dnNhZ2FyQHhpbGlueC5jb20+OyBTYW5kaXAgS290aGFyaQ0KPiA8c2FuZGlwa0B4aWxp
bnguY29tPjsgU3ViaHJhbnN1IFNla2hhciBQcnVzdHkgPHNwcnVzdHlAeGlsaW54LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtSRkNdIFY0TCBIRFIgQXJjaGl0ZWN0dXJlIFByb3Bvc2FsDQo+IA0KPiBI
aSBEeWxhbiwNCj4gDQo+IE9uIDEvMjIvMjAgOToxMyBQTSwgRHlsYW4gWWlwIHdyb3RlOg0KPiA+
IEhpIEFsbCwNCj4gPg0KPiA+IFdlIGFyZSBwbGFubmluZyB0byBhZGQgSERSMTAgYW5kIEhEUjEw
KyBtZXRhZGF0YSBzdXBwb3J0IGludG8gdGhlIFY0TA0KPiBmcmFtZXdvcmsgYW5kIHdlcmUgaG9w
aW5nIGZvciBzb21lIGZlZWRiYWNrIGJlZm9yZSB3ZSBzdGFydGVkDQo+IGltcGxlbWVudGF0aW9u
Lg0KPiANCj4gTmljZSENCj4gDQo+ID4NCj4gPiBGb3IgY29udGV4dCwgWGlsaW54IEhETUkgUlgg
SVAgY3VycmVudGx5IHVzZXMgYSBBWEkgTElURSBpbnRlcmZhY2Ugd2hlcmUNCj4gSERSIG1ldGFk
YXRhIGlzIG9idGFpbmVkIGZyb20gYSBoYXJkd2FyZSBGSUZPLiBUbyBhY2Nlc3MgdGhlc2UgcGFj
a2V0cyBhDQo+IENQVSBjb3B5IGlzIHJlcXVpcmVkLg0KPiA+IFdlIGFyZSBpbiB0aGUgcHJvY2Vz
cyBvZiBtaWdyYXRpbmcgdG93YXJkcyBhIEFYSSBNTSBpbnRlcmZhY2Ugd2hlcmUgdGhlDQo+IGhh
cmR3YXJlIHdpbGwgZGlyZWN0bHkgd3JpdGUgSERSIG1ldGFkYXRhIGludG8gbWVtb3J5Lg0KPiA+
IEN1cnJlbnRseSB0aGUgSERNSSBSWCBkcml2ZXIgKGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
aGRtaS0NCj4gbW9kdWxlcy9ibG9iL21hc3Rlci9oZG1pL3hpbGlueC1oZG1pcnguYykgaXMgbW9k
ZWxlZCBhcyBhIHY0bCBzdWJkZXYuIFRoaXMNCj4gaXMgbGlua2VkIHRvIGEgRE1BIElQIHdoaWNo
IHV0aWxpemVzIHRoZSBETUEgZW5naW5lIEFQSXMgYW5kIHJlZ2lzdGVycyBpdHNlbGYNCj4gYXMg
YSB2aWRlbyBub2RlIGZvciB2aWRlbyBkYXRhLg0KPiA+DQo+ID4gSERSMTAgd2lsbCBvbmx5IGNv
bnNpc3Qgb2Ygc3RhdGljIG1ldGFkYXRhIHdoaWNoIHdpbGwgY29tZSBvbmNlIHBlciBzdHJlYW0u
DQo+IEhvd2V2ZXIsIEhEUjEwKyB3aWxsIGhhdmUgZHluYW1pYyBtZXRhZGF0YSB3aGljaCBjYW4g
cG90ZW50aWFsbHkgY29tZQ0KPiBvbmNlIHBlciBmcmFtZSBhbmQgYmUgdXAgdG8gfjQwMDAgYnl0
ZXMuIFdlIHdvdWxkIGxpa2UgVjRMIGFyY2hpdGVjdHVyZSB0bw0KPiBiZSBmbGV4aWJsZSB0byBz
dXBwb3J0IGJvdGguDQo+IA0KPiBUaGUga2V5IGhlcmUgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2Vl
biBFeHRlbmRlZCBJbmZvRnJhbWVzIHRoYXQgY2FuIGJlDQo+IGxvbmcgYW5kIHRoZSBvdGhlcnMs
IHRoYXQgaGF2ZSBhIG1heGltdW0gc2l6ZS4gVGhlIGxhdHRlciBzaG91bGQgYmUgaGFuZGxlZA0K
PiBieSBjb250cm9scywgdGhlIGZpcnN0IGlzIG1vcmUgZGlmZmljdWx0Lg0KPiANCg0KQXJlIHlv
dSBzdWdnZXN0aW5nIHRvIGhhbmRsZSBzdGF0aWMgSERSIHZpYSByZWFkIG9ubHkgdjRsIGNvbnRy
b2xzIGluIGEgbWV0YSB2aWRlbyBub2RlPw0KDQo+IENhbiB5b3UgdGVsbCBhIGJpdCBtb3JlIGFi
b3V0IGhvdyB0aGUgaGFyZHdhcmUgb3BlcmF0ZXM/IEFyZSBhbGwgSW5mb0ZyYW1lcw0KPiBvYnRh
aW5lZCB0aHJvdWdoIHRoZSBodyBmaWZvLCBvciBhcmUgc29tZSBzdG9yZWQgaW4gcmVnaXN0ZXJz
IGFuZCBzb21lIGdvDQo+IHRocm91Z2ggdGhlIGZpZm8/DQo+IA0KDQpJbiB0aGUgY3VycmVudCBp
bXBsZW1lbnRhdGlvbiBvZiB0aGUgSERNSSBSeCBJUCwgYWxsIEluZm9GcmFtZXMgYXJlIHJlYWQg
ZnJvbSBhIHJlZ2lzdGVyIGJ5dGUgYnkgYnl0ZSB3aGljaCBoYXMgRklGTyBhdCB0aGUgYmFjay4N
ClRoZSByZWdpc3RlciBpcyBhY2Nlc3NpYmxlIGJ5IGFuIEFYSSBMaXRlIGludGVyZmFjZS4NClRo
ZSBGSUZPIGNhbiBzdG9yZSBtYXhpbXVtIDggcGFja2V0cy4gRWFjaCBwYWNrZXQgaXMgMzYgYnl0
ZXMgaW4gc2l6ZSAoMzEgYnl0ZXMgZGF0YSBhbmQgNSBieXRlcyBFQ0MgY2FsY3VsYXRlZCBieSBJ
UCkuIA0KSW5mb0ZyYW1lcyBhcmUgb25lIHR5cGUgb2YgcGFja2V0cy4gDQpUaGVyZSBhcmUgb3Ro
ZXIgdHlwZXMgbGlrZSBHZW5lcmFsIENvbnRyb2wgUGFja2V0LCBBdWRpbyBDbG9jayBSZWdlbmVy
YXRpb24gUGFja2V0LCBldGMuIHJlZmVycmVkIGluIFRhYmxlIDUtOCBwYWNrZXQgdHlwZXMgaW4g
SERNSSBzcGVjaWZpY2F0aW9uIHYxLjRiKQ0KDQpJbiBmdXR1cmUgd2UgcGxhbiBvbiBhZGRpbmcg
YW4gQVhJTU0gaW50ZXJmYWNlIGluIHRoZSBJUCB0byBoYW5kbGUgRHluYW1pYyBIRFIuIFRoZSB0
ZW50YXRpdmUgYmVoYXZpb3Igd2lsbCBiZSBhcyBiZWxvdyAtDQpUaGUgZHJpdmVyIHdpbGwgcHJv
dmlkZSBhIGJ1ZmZlciBwb2ludGVyIHRvIHRoZSBJUCB2aWEgYSByZWdpc3Rlci4gVGhlIElQIHdp
bGwgZHVtcCB0aGUgaW5mb2ZyYW1lcydzIGV4dHJhY3RlZCBkYXRhIGludG8gdGhpcyBidWZmZXIu
IA0KV2l0aCBGcmFtZSBzeW5jLCBJUCB3aWxsIHJldHVybiB0aGUgbGVuZ3RoIG9mIHRoZSBidWZm
ZXIgaW4gdGhlIHByb3ZpZGVkIGJ1ZmZlci4NCg0KPiBEb2VzIHRoZSBoYXJkd2FyZSBzZXQgbWF4
aW11bSBzaXplcyBmb3Igc3BlY2lmaWMgSW5mb0ZyYW1lcyBvciB0aGUgdG90YWwNCj4gc2l6ZSBv
ZiBhbGwgSW5mb0ZyYW1lcyBjb21iaW5lZD8gT3IgY2FuIGl0IGJlIGFueSBzaXplPw0KPg0KSG9w
ZSB0aGUgYWJvdmUgaW5mbyBhYm91dCBGSUZPIGRlcHRoIGZvciBjdXJyZW50IEhETUkgUnggSVAg
YW5zd2VycyB0aGlzLg0KIA0KPiBEb2VzIGl0IGFjY2VwdCBhbnkgSW5mb0ZyYW1lIG9yIG9ubHkg
c3BlY2lmaWMgSW5mb0ZyYW1lIHR5cGVzPyBPciBpcyB0aGlzDQo+IHByb2dyYW1tYWJsZT8NCj4g
DQoNCkhETUkgUnggSVAgYWNjZXB0cyBhbGwgdHlwZXMgb2YgSW5mb0ZyYW1lcy4NCg0KUmVnYXJk
cw0KVmlzaGFsIFNhZ2FyDQoNCj4gUmVnYXJkcywNCj4gDQo+IAlIYW5zDQo+IA0KPiA+DQo+ID4g
V2UgaGF2ZSAyIGRpZmZlcmVudCBwcm9wb3NhbHMgdGhhdCB3ZSBiZWxpZXZlIHdpbGwgd29yazoN
Cj4gPg0KPiA+IEEuIDIgdmlkZW8gbm9kZSBhcHByb2FjaCAoMSBmb3IgdmlkZW8sIDEgZm9yIG1l
dGFkYXRhKSAtIFRoaXMgd2lsbCBhbGlnbiB3aXRoDQo+IGN1cnJlbnQgdjRsIG1ldGFkYXRhIHN0
cnVjdHVyZSAoaS5lLiB1dmMpIGJ1dCB3aWxsIHJlcXVpcmUgb3VyIEhETUkgUlggZHJpdmVyDQo+
IHRvIHJlZ2lzdGVyIGEgc3ViZGV2IGFuZCBkZXZpY2Ugbm9kZQ0KPiA+IAlhLiBPdXIgSERNSSBS
WCBkcml2ZXIgd2lsbCByZWdpc3RlciBhIHY0bCBzdWJkZXYgKGZvciB2aWRlbyBkYXRhKSBhbmQg
YQ0KPiBtZXRhZGF0YSBub2RlDQo+ID4gCQlpLiBJcyB0aGlzIGFjY2VwdGFibGU/DQo+ID4gCWIu
IEFwcGxpY2F0aW9ucyB3aWxsIHFidWYvZHFidWYgdG8gYm90aCB2aWRlbyBhbmQgbWV0YWRhdGEg
bm9kZXMgZm9yDQo+ID4gZWFjaCBmcmFtZQ0KPiA+DQo+ID4gQi4gMSB2aWRlbyBub2RlIGFwcHJv
YWNoIC0gVGhpcyB3aWxsIGF2b2lkIG1peGluZyB2NGwgc3ViZGV2IGFuZCB2NGwgZGV2aWNlDQo+
IG5vZGUgZnVuY3Rpb25hbGl0eSBpbnNpZGUgSERNSSBSWCBkcml2ZXIgYnV0IGl0IHN0cmF5cyBm
cm9tIGN1cnJlbnQgdjRsDQo+IG1ldGFkYXRhIGFyY2hpdGVjdHVyZSBhbmQgYWxzbyBjaGFuZ2Vz
IHY0bCBzdWJkZXYgZnVuY3Rpb25hbGl0eQ0KPiA+IAlhLiBXZSB3b3VsZCBhZGQgYSAicmVhZCIg
ZnVuY3Rpb24gdG8gdjRsIHN1YmRldidzDQo+ID4gCQlpLiBUaGlzIHdpbGwgYWxzbyByZXF1aXJl
IHVzIHRvIGFkZCBzb21lICJjYXBhYmlsaXRpZXMiIGZpZWxkIHRvDQo+IHN1YmRldiBvciBiZSBh
YmxlIHRvIHF1ZXJ5IGZvciB0aGUgInJlYWQiIGZ1bmN0aW9uDQo+ID4gCWIuIEhETUkgUnggZHJp
dmVyIHdpbGwgcmVnaXN0ZXIgYSB2NGwgc3ViZGV2IHdpdGggInJlYWQiDQo+IGZ1bmN0aW9uL2Nh
cGFiaWxpdHkNCj4gPiAJYy4gQXBwbGljYXRpb24gY2FuIGRpcmVjdGx5IHBhc3MgYSBidWZmZXIg
aW4gdGhlICJyZWFkIiBmdW5jdGlvbiB0bw0KPiBIRE1JIFJYIHN1YmRldiB0byBvYnRhaW4gSERS
IG1ldGFkYXRhDQo+ID4gCQlpLiBXZSB3aWxsIG5lZWQgdG8gcGFzcyBzdWJkZXYgbmFtZSBmcm9t
IGFwcGxpY2F0aW9uIG9yIGJlDQo+IGFibGUgdG8gcXVlcnkgYWxsIHN1YmRldnMgZm9yIHRoaXMg
InJlYWQiIGNhcGFiaWxpdHksIGlzIHRoaXMgYWNjZXB0YWJsZT8NCj4gPg0KPiA+IFBsZWFzZSBs
ZXQgbWUga25vdyB5b3VyIG9waW5pb25zIG9uIHdoaWNoIGFwcHJvYWNoIGlzIGJlc3Qgb3IgcHJv
cG9zZQ0KPiA+IGFub3RoZXIgYXBwcm9hY2ggaWYgdGhlc2UgMiBhcmUgdW5maXQuIFRoYW5rcw0K
PiA+DQo+ID4gQmVzdCwNCj4gPiBEeWxhbiBZaXANCj4gPg0KDQo=
