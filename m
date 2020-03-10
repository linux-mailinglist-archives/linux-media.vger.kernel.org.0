Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 165AD180A38
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 22:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCJVUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 17:20:18 -0400
Received: from mail-eopbgr770124.outbound.protection.outlook.com ([40.107.77.124]:53154
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726268AbgCJVUS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 17:20:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgIWEo9zuKNL/haxBzNms40VRjpWfc3raPlrTIODOfvbxxtQ8whoy0DJ5JZKVN38O08TDPVkxYIkQvWoSR54zeXDea5DAC7LF93XVe99q4aYLMPLHjIUxQc4SzKIRY+APNZ0RAxurgQPyoWJSuOycAOH7u2/vTNbx2LrQrqs8LNjY5Ulk+nn9qB7dL60XZXKJOREjuvggqh/vjMeNpGNh7S9aKPHJm4k0hbCDNw95ovcOqK8rs4PL4ghesxLmaAcf9O1EUVKbmGhJG1qknmkuQoYlNpbUh7i8aNP+dwP3yj54rowgavmY0ff+kxR0O1IEaasWWdrridbdAGPfJJr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+XmqDfbXuBM0omhhi4DEAi2NRAv1tnorwzhX511KPw=;
 b=n5PRf897zcdVq7GVcAcEyW6k95uuVnaKmnIZaqRkhOA+1PPvtbMYl42ziqlJxOmucb80f2HbAoGEqrPgQtLiq71HlbvwCDOsNFYXoVpd3ZxQNebN4Ew2qbl50IXDtagASUnecL4r+D40WbdS7XQHBRuZSIEKYxPY0NQ8fxBetecq5Tft1Bb4ftBI94AVVhcQHiOM+mrCrRqw2fjbfJRd2hM6t+ipL2FOm9m/PlKQlmRiH4+Ch6d75e3a2NkmpdnwPKQlfzdtGa3/RnCDBtp2j2LMVacnSoNKCTwifY86Q35WAZAGYS0IXzjSQqidbayVuhI6o1Oc6a39OKAHANglwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+XmqDfbXuBM0omhhi4DEAi2NRAv1tnorwzhX511KPw=;
 b=JGlch8um/rJCAaEi3jhA8MohEJODwIjZ3GhwsHW7hSsIpA0YgA9lDAH6rx3KD18Wshr4EFAMy2oct95ekzqA5xLID6iEVgXxtQQxxTMopK6stORWRNMuYix7V2jCtYmHKB1R6RbaMh3r0PjBkNxUzQtkWU+Q28Y4ef8HBipa08s=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB5060.namprd06.prod.outlook.com (2603:10b6:208:6e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Tue, 10 Mar
 2020 21:20:14 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 21:20:14 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Changming Liu <charley.ashbringer@gmail.com>
Subject: RE: [bug-report] drivers/media/platform/am437x/: illegal value of
 enum in vpfe_ccdc_set_params
Thread-Topic: [bug-report] drivers/media/platform/am437x/: illegal value of
 enum in vpfe_ccdc_set_params
Thread-Index: AQHV9mAj2shtn0ZgEkuDqhi3x8K/16hCVUZQ
Date:   Tue, 10 Mar 2020 21:20:14 +0000
Message-ID: <BL0PR06MB4548AC7B9E990EDE0143E554E5FF0@BL0PR06MB4548.namprd06.prod.outlook.com>
References: <BL0PR06MB454878CAF243C837B7131597E5E10@BL0PR06MB4548.namprd06.prod.outlook.com>
 <CA+V-a8tnS=xER1FBEXd4hvJu+-Kz0dcafLtrNXLmeTZEPH60kg@mail.gmail.com>
In-Reply-To: <CA+V-a8tnS=xER1FBEXd4hvJu+-Kz0dcafLtrNXLmeTZEPH60kg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=liu.changm@northeastern.edu; 
x-originating-ip: [155.33.132.17]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca714ac3-0843-4057-f03d-08d7c538d31c
x-ms-traffictypediagnostic: BL0PR06MB5060:
x-microsoft-antispam-prvs: <BL0PR06MB5060A9A6C02BFFCA4E75DF87E5FF0@BL0PR06MB5060.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(189003)(199004)(54906003)(2906002)(71200400001)(75432002)(53546011)(6506007)(316002)(6916009)(786003)(66446008)(52536014)(76116006)(8936002)(8676002)(7696005)(66476007)(64756008)(66556008)(33656002)(86362001)(66946007)(81156014)(55016002)(9686003)(81166006)(478600001)(26005)(186003)(5660300002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR06MB5060;H:BL0PR06MB4548.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: northeastern.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zjz4LLt27nH7XoBMfbZ/TVSbKUz95+pLqRHVHxuyAK8GUwuPvG93xfKZn+8z3kDp2Zih1VN9BuN/yu+TY8BMZDfz0jXrtCmv3O2Sz8/PYVDseLVliVsxkraHtXTmI0V+x/NoPgyYixaeKtX80kidN3ozv6H2yUAvKxpuFMUwcYu8oiZwFQnFLfwrd9yxeV09hm3aar9BsM3cr8MuKs8LkxWeIE4764o9wP8QX+XYcpVk5xSca8ujzCS04T0EKYj49YeWS9D/EAbk/nG4WgaqGBa3E5ImJQ92F7MRnof3QNRlpXUzNpDsryUMmaGY4thXm8/E60u5dlQunuyXnuuFUUN/J+HBavKm5XtYulUIkUHhv/6lb7pc5PnObH6FYLiiKKQB8UZZbzkG/UAzS87HKn7HLHiWH7wT+Z/cP+fKo4urILvY9/rGQLji7uc8ZCGt
x-ms-exchange-antispam-messagedata: B9VSZKB/vuWAninXquZwSAiiuWPgQiyIPx/RqDAHKKXIYNNrYM002pVfpyjRMC+gBSaFmdn4VypeEtgO6B6WgT4dFKvPAeSB338KsFIWOt5OgXn8utIKexfuVBdaIFe6sxeSnADfQhT4pzMM81k1xA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: ca714ac3-0843-4057-f03d-08d7c538d31c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 21:20:14.5574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqQJlqULwcSUgt0ugbbGxfzh9aYEVpXQzYNZLgn03nAGwBeK+xdxMLcs0rw3ZkgrFv5MmpaXS27lfpGWS9PV9T4AyJ+6Zp/y+lrZTq5B1Ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB5060
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDksIDIw
MjAgNjoxNCBQTQ0KPiBUbzogQ2hhbmdtaW5nIExpdSA8bGl1LmNoYW5nbUBub3J0aGVhc3Rlcm4u
ZWR1Pg0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
YnVnLXJlcG9ydF0gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbTQzN3gvOiBpbGxlZ2FsIHZhbHVl
IG9mDQo+IGVudW0gaW4gdnBmZV9jY2RjX3NldF9wYXJhbXMNCj4gDQo+IEhpIENoYW5nbWluZw0K
PiANCj4gT24gU3VuLCBNYXIgOCwgMjAyMCBhdCAzOjMyIEFNIENoYW5nbWluZyBMaXUNCj4gPGxp
dS5jaGFuZ21Abm9ydGhlYXN0ZXJuLmVkdT4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIGVtYWlsIHdh
cyBzZW50IGR1ZSB0byB0aGUgcHJldmlvdXMgb25lIHdhcyByZWplY3RlZCBiZWNhdXNlIG9mIGl0
J3MgaW4NCj4gSFRNTCBmb3JtLg0KPiA+DQo+ID4gRnJvbTogQ2hhbmdtaW5nIExpdQ0KPiA+IFNl
bnQ6IFNhdHVyZGF5LCBNYXJjaCA3LCAyMDIwIDg6MzMgUE0NCj4gPiBUbzogcHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20NCj4gPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyB5YW9o
d2F5QGdtYWlsLmNvbQ0KPiA+IFN1YmplY3Q6IFtidWctcmVwb3J0XSBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2FtNDM3eC86IGlsbGVnYWwgdmFsdWUgb2YNCj4gPiBlbnVtIGluIHZwZmVfY2NkY19z
ZXRfcGFyYW1zDQo+ID4NCj4gPiBIaSBMYWQsDQo+ID4gR3JlZXRpbmdzLCBJJ20gYSBmaXJzdC15
ZWFyIFBoRCBzdHVkZW50IHdobyBpcyBpbnRlcmVzdGVkIGluIHRoZSB1c2FnZQ0KPiA+IG9mIFVC
U2FuIGluIGxpbnV4IGtlcm5lbC4gV2l0aCBzb21lIGV4cGVyaW1lbnRzLCBJJ3ZlIGZvdW5kIHRo
YXQsIGENCj4gdW5zaWduZWQgdW5kZXJmbG93IG1pZ2h0IGNhdXNlIHVuZGVzaXJlZCBiZWhhdmlv
ciBpbg0KPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtNDM3eC9hbTQzN3gtdnBmZS5jIGZ1bmN0
aW9uDQo+IHZwZmVfY2NkY19zZXRfcGFyYW1zLg0KPiA+DQo+ID4gTW9yZSBzcGVjaWZpY2FsbHks
IGFmdGVyIHRoZSBleGVjdXRpb24gb2YgeCA9DQo+ID4gY29weV9mcm9tX3VzZXIoJnJhd19wYXJh
bXMsIHBhcmFtcywgc2l6ZW9mKHJhd19wYXJhbXMpKTsgdGhlDQo+ID4gcmF3X3BhcmFtcyBhcmUg
ZmlsbGVkIHdpdGggZGF0YSBmcm9tIHVzZXIgc3BhY2UuDQo+ID4NCj4gPiBUaGVuIGRpdmluZyBp
bnRvIGZ1bmN0aW9uIHZwZmVfY2NkY192YWxpZGF0ZV9wYXJhbSwgd2hlbiBjYWxsaW5nDQo+ID4g
ZnVuY3Rpb24gY2NkY19kYXRhX3NpemVfbWF4X2JpdCwgYXQgbWF4X2RhdGEgPQ0KPiA+IGNjZGNf
ZGF0YV9zaXplX21heF9iaXQoY2NkY3BhcmFtLT5kYXRhX3N6KTsNCj4gPiB0aGUgZW51bSBtZW1i
ZXIsIG5hbWVkIGRhdGFfc3osIG9mIHN0cnVjdHVyZSBjY2RjcGFyYW0gaXMgY29tcGFyZWQNCj4g
PiB3aXRoIDcsIG90aGVyd2lzZSBkYXRhX3N6IGlzIHN1YnRyYWN0ZWQgZnJvbSAxNSwgYXMgaW4g
cmV0dXJuIHN6ID09DQo+ID4gVlBGRV9DQ0RDX0RBVEFfOEJJVFMgPyA3IDogMTUgLSBzejsNCj4g
Pg0KPiA+IFRoZSBwb3RlbnRpYWwgcHJvYmxlbSB3aXRoIHRoaXMgc25pcHBldCBvZiBjb2RlIGlz
IHRoYXQsIGFsdGhvdWdoIGluIGZ1bmN0aW9uDQo+IGNjZGNfZGF0YV9zaXplX21heF9iaXQsIGNj
ZGNwYXJhbS0+ZGF0YV9zeiBpcyB0cmVhdGVkIGFzIGFuIGVudW1lcmF0aW9uDQo+IHdpdGggdGhl
IHJhbmdlIGZyb20gMCB0byA3IGFjY29yZGluZyB0byB0aGUgZGVmaW5pdGlvbiBvZiBlbnVtDQo+
IHZwZmVfY2NkY19kYXRhX3NpemUsIGhvd2V2ZXIgaXQncyBlc3NlbnRpYWxseSBhbiB1bnNpZ25l
ZCAzMiBiaXQgaW50ZWdlciBmcm9tDQo+IHVzZXIgc3BhY2UuIEFzIGEgY29uc2VxdWVuY2UsIHRo
ZSByZXR1cm4gdmFsdWUgb2YgZnVuY3Rpb24NCj4gY2NkY19kYXRhX3NpemVfbWF4X2JpdCBtaWdo
dCBiZSBhbnkgdmFsdWUgZnJvbSAwIHRvIDI1NSBkdWUgdG8gdGhlDQo+IHVuc2lnbmVkIHVuZGVy
ZmxvdyBhbmQgdHJ1bmNhdGlvbi4NCj4gPg0KPiA+IEl0J3Mgd29ydGggbm90aW5nIHRoYXQsIGFs
dGhvdWdoIHRoZSB1c2FnZSBvZiBmdW5jdGlvbiBvZg0KPiA+IGNjZGNfZ2FtbWFfd2lkdGhfbWF4
X2JpdCBoYXMgc2ltaWxhciB1bmRlcmZsb3cgcHJvYmxlbSwgaS5lLiB0aGUgdmFsdWUNCj4gb2Yg
Y2NkY3BhcmFtLT5hbGF3LmdhbW1hX3dkIGlzIGFsc28gYW4gdW5zaWduZWQgMzIgYml0IGZyb20g
dXNlciBzcGFjZSwNCj4gd2hpbGUgaXRzZWxmIGlzIGEgZW51bSB0eXBlLiBIb3dldmVyIGl0J3Mg
Y2hlY2tlZCBpbiBpZiAoY2NkY3BhcmFtLQ0KPiA+YWxhdy5nYW1tYV93ZCA+IFZQRkVfQ0NEQ19H
QU1NQV9CSVRTXzA5XzAgfHwNCj4gPiAgICAgbWF4X2dhbW1hID4gbWF4X2RhdGEpIHsNCj4gPiAg
ICAgICAgICAgICAgICAgdnBmZV9kYmcoMSwgdnBmZSwgIkludmFsaWQgZGF0YSBsaW5lIHNlbGVj
dFxuIik7DQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+IH0NCj4gPiBU
aGlzIGlmIGNsYXVzZSBleGNsdWRlIGFsbCBpbGxlZ2FsIHZhbHVlcyBhbmQga2VlcCB0aGUgZW51
bSB2YXJpYWJsZSBpbiByYW5nZSwgSQ0KPiB3b25kZXIgaWYgaXQncyBuZWNlc3NhcnkgdG8gYXBw
bHkgdGhlIHNpbWlsYXIgY2hlY2sgdG8gY2NkY3BhcmFtLT5kYXRhX3N6IHRvDQo+IGtlZXAgdGhl
IGl0cyB2YWx1ZSBsZWdhbCBhcyB3ZWxsLg0KPiA+DQo+ID4gRHVlIHRvIHRoZSBsYWNrIG9mIGtu
b3dsZWRnZSBvZiB0aGUgaW50ZXJhY3Rpb24gYmV0d2VlbiB0aGlzIG1vZHVsZSBhbmQNCj4gdGhl
IHVzZXIgc3BhY2UsIEknbSBub3QgYWJsZSB0byBhc3Nlc3MgaWYgdGhpcyBpcyBhIHNlY3VyaXR5
LXJlbGF0ZWQgaXNzdWUuDQo+IEp1ZGdpbmcgZnJvbSB0aGUgYXBwZWFyYW5jZSwgYSBtYWxpY2lv
dXMgdXNlciBjYW4gcG9zc2libHkgbWFuaXB1bGF0ZSB0aGUNCj4gcmV0dXJuIHZhbHVlIG9mIGNj
ZGNfZGF0YV9zaXplX21heF9iaXQgYW5kIG1ha2UgdGhlIGNoZWNrIG9mDQo+ICJtYXhfZ2FtbWEg
PiBtYXhfZGF0YSIgYWx3YXlzIHBhc3MuIEknZCBiZSBtb3JlIHRoYW4gaGFwcHkgdG8gaGVhciB5
b3VyDQo+IHZhbHVhYmxlIG9waW5pb25zIGFuZCBwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24gaWYg
bmVlZGVkLiBJZiBzdWNoIGEgY2hlY2sgaXMNCj4gdW5uZWNlc3NhcnksIEkgd291bGQgYXBwcmVj
aWF0ZSBpdCBpZiBJIGNhbiBrbm93IHdoeSwgdGhpcyBjYW4gaGVscCBtZQ0KPiB1bmRlcnN0YW5k
IGxpbnV4IGEgbG90IQ0KPiA+DQo+IFRvdGFsbHkgYWdyZWUgKGdvb2QgY2F0Y2ghKSwgdnBmZV9j
Y2RjX3ZhbGlkYXRlX3BhcmFtKCkgc2hvdWxkIGJlIG1vcmUNCj4gc3RyaW5nZW50IG9uIGNoZWNr
aW5nIHRoZSB1c2VyIHNwYWNlIHBhcmFtcy4gV291bGQgeW91IGNyZWF0ZSBhIHBhdGNoIGZpeGlu
Zw0KPiBpdCA/DQo+IA0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIHJlY29nbml0aW9uISBU
aGlzIG1lYW5zIGEgbG90IHRvIG1lLg0KSSd2ZSBlbWFpbGVkIHlvdSBhIHBhdGNoIHdoaWNoIGNh
biBmaXggdGhpcyBpc3N1ZSB2aWEgbXkgZ21haWwgYWNjb3VudCwgZmVlbCBmcmVlIA0KdG8gc2Vl
IGl0IGFzIGFuIGFkdmljZSBhbmQgbW9kaWZ5IGl0IGFzIHlvdSB3aXNoIHRvLg0KDQpBbGwgdGhl
IGJlc3QsDQotLSBDaGFuZ21pbmcgTGl1DQoNCj4gQ2hlZXJzLA0KPiAtLVByYWJoYWthcg0KPiAN
Cj4gPiBMb29raW5nIGZvcndhcmQgdG8geW91ciByZXNwb25zZSENCj4gPg0KPiA+IEJlc3QgcmVn
YXJkcywNCj4gPiBDaGFuZ21pbmcgTGl1DQo=
