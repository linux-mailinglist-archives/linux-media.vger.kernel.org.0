Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C734F26D7BB
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 11:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgIQJeQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 05:34:16 -0400
Received: from mail-eopbgr1410105.outbound.protection.outlook.com ([40.107.141.105]:45152
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726180AbgIQJeP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 05:34:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fgyx2Ezvqg+ufwwEmE6yuZQ5rXxU3puTmAe0rlfL/qeZ0xXdQ9GwDiVijH7C/MGEfGjn5Tquv9LTjethqv0J8gBw2lIoiQjHC2/g++NkzKRU2aEgBM5HlOpw9w3OvIVtplP623YV5ovF11AS85BGSkiqmMJGA/eO8OaaqMeKArflZJ3yyXfA/YrG1/5hNxYWzdGnoZgezUdba54FNQjh5/w6X41+DyWQWtCFCjc0TM1dbc++D4lOnabRICeaVC2H6RoMMI4m6CA9i3rUMu80JicnL1jNRmYhAadu5Vm9X1wivxrDQ98AvxuH5juVoa9DD9n5kvsmO9hmTK3XKGbYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1S2ldcPZJ+kYBixLlongo8BzjVNu3FVddkwh+3erVG4=;
 b=bZiSHL2G6zSM4uaVDM/s74rxQyJxK5OgbIy6CHMFxLHOOkGWZ4p8SW5m+0GF0ih00IAkJUeXcGIQAVtCzgS9u+K+X23oacZYS3nF85RLaifyTBI8MibK3GhZbmJ86sepB2n9Fv3m8gSleuqV9eR6grEga3Qc3yJJ1bR29q2uS1kieZFJwsOsxGIXxcWRETA1IXhXtwK/PiOmDATbgEGKwLeJQ8Hamw+aYv2Q3yZDQ5P/S9Lm/2SjRWC2gIMNpWqedrMuyspPzjot6jOW7xOhBwMJB1Wa15nI37wBwWBdpptqkb65QVIW3J64h1xt7gi3ABwi7ZIQ+4a8dfX4SwkUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1S2ldcPZJ+kYBixLlongo8BzjVNu3FVddkwh+3erVG4=;
 b=h1h9Iuaj7fJWrjwlDSyz7uyiCO1xU2Vgcvry4ZI2XYZkQSMsn9Jo6QQNOtnjJlVjMBdpYWrfIs+JF1Y+KLN5aTApitV+wukjuSWF4LnmlwrAE24gHeKTw86YZ7B6941xuylLzMW3pTMFBufbCoNkpwxx9sfJy77TSjGzfwcXF3s=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSAPR01MB3571.jpnprd01.prod.outlook.com (2603:1096:604:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 09:34:12 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3391.013; Thu, 17 Sep 2020
 09:34:12 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 0/3] Document r8a77990 DRIF support
Thread-Topic: [PATCH v2 0/3] Document r8a77990 DRIF support
Thread-Index: AQHWjBiDWqW4u1Bt6EWz1E34sCU7DqlsAigAgACQkQA=
Date:   Thu, 17 Sep 2020 09:34:11 +0000
Message-ID: <OSAPR01MB274019F29904461003EE340CC23E0@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com>
 <20200917005502.GQ3853@pendragon.ideasonboard.com>
In-Reply-To: <20200917005502.GQ3853@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a7e1b3ae-43eb-45f8-a1a7-08d85aecd5e5
x-ms-traffictypediagnostic: OSAPR01MB3571:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB3571939FBC5E9852BABFB030C23E0@OSAPR01MB3571.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v+/jsRrfWNAP35+MP96jDjjRj7Krlg2Qsy3Nw67l/ilpCysZ7Om0upr+57ioolMwfKuKU+o6RzHkuupYdaOLc8Iv633cVBq6UCdyfVlNZoo4jW/VSuZgoTAHm3OGvsGq93E/E9Yi/livUX9VyJHg9UzbgWQnS0wZfyqXqah+0GTEdDEB70pVDuDUJfL04Mm3UU37WWmkUNY/G/5PnCEwAoSVkYqn7iL57sUDViuEgTaERwFCuvNmfVGky5MrdXpGpz2GHTnusg3aqjocTHWUgIVlORw+lz3F7/ThpZabxzZJgPhjFkPfUckI7OPAZU33yjSacZjFLBodyVMjs/moRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(66476007)(71200400001)(66556008)(64756008)(8936002)(66446008)(66946007)(8676002)(33656002)(2906002)(76116006)(54906003)(4326008)(5660300002)(26005)(6916009)(186003)(86362001)(7696005)(6506007)(316002)(478600001)(55016002)(9686003)(83380400001)(107886003)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: u/6IpRdjyGtLD45Kl3VItFcQI9YA8f2wA4Yv3hTPGwU57/EvMyToKQbxosAxMxG1+jrFwTSV+HE0I9ZmKkqpKXW7CfzgNP+UFtzHOLLkWjKQ0/UJnKy4+Wx8suTYH1UleCgbeD2kOulpsv4mWRaWAcWsDVkXk75+HeGNsZJJ0DqkJRGZ/FMm8gn5HYl7ADxfXcDWewfFs+CuiZ3KhKI/BMTkS4OXOgkZGT5850A6fykZzjwNAVpL55Kn4PVUYL7PhbF81/h40LsoW+0TYSDe/NfpIzxSRJAwhapbR458+fqhm306qC9RZx4GR3gE9D8hj8Qw39e3qFtaqNmVEojKSG2G2dJXMRo8Rj+887YX0kuQ+3mqh5N0fSs+4+5afpmpTBsrSExoUQY3q6O1yjoh7xFSaa/WRVL40p5nOoqZ7H70KvDGoqiAlYZ85QB+Hb1hT88zNb/F+7H1NCz1mD7IUDqUxIvfeIwqCpuF7unWAaHsy8pFsJOOsnz49SP9VW4kuiXby99NQasQmC+VjHW2TG5h2zbBTsVCHIgbJARRzsbH10CN/uBU8q7RajQZ7vFjHW9pyIdbBPocxpqKLJVPOGncnXXGyBPzSHJHuwTQ2Absb9OyuKPZV8q0BCrilZOjlIoZifoZh7fBcDdS1bwAUA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e1b3ae-43eb-45f8-a1a7-08d85aecd5e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 09:34:11.9163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjtyPQhZWgfTqn1RIdeEjLQkL5WLnSc4YFufLUF7brJB3gfOUoq8b4MWepBvx4vT70sqSDUfPfxKgb1ewELLR4jlmitbPMulwDRi2zAxyQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3571
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLg0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMTcgU2VwdGVtYmVyIDIwMjAgMDE6NTUNCj4NCj4gSGkgRmFicml6aW8sDQo+DQo+IFRoYW5r
IHlvdSBmb3IgdGhlIHBhdGNoZXMuDQo+DQo+IE9uIFdlZCwgU2VwIDE2LCAyMDIwIGF0IDExOjU5
OjQ2QU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gPiBEZWFyIEFsbCwNCj4gPg0K
PiA+IHRoaXMgc2VyaWVzIGRvY3VtZW50cyBEUklGIHN1cHBvcnQgZm9yIHRoZSByOGE3Nzk5MA0K
PiA+IChhLmsuYS4gUi1DYXIgRTMpLg0KPg0KPiBUaGlzIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBJ
J2QgbGlrZSB0byBnaXZlIFJvYiBhbiBvcHBvcnR1bml0eSB0byByZXZpZXcNCj4gdGhlIERUIGJp
bmRpbmdzLiBBcyB3ZSdyZSBhbHJlYWR5IGF0IHY1LjktcmM1LCB0aGlzIHdpbGwgbGlrZWx5IG1l
YW4NCj4gbWlzc2luZyB0aGUgdjUuMTAgbWVyZ2Ugd2luZG93ICh0aGUgbGludXgtbWVkaWEgdHJl
ZSBjbG9zZXMgYXQgLXJjNikuIEkNCj4gZG9uJ3Qgc2VlIHRoaXMgc2VyaWVzIGJlaW5nIHVyZ2Vu
dCwgYnV0IHBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UNCj4gZGlzYWdyZWUuDQoNClRoYXQncyBm
aW5lIGJ5IG1lLg0KDQpCUiwNCkZhYg0KDQo+DQo+ID4gRmFicml6aW8gQ2FzdHJvICgzKToNCj4g
PiAgIE1BSU5UQUlORVJTOiBBZGQgRmFicml6aW8gQ2FzdHJvIHRvIFJlbmVzYXMgRFJJRg0KPiA+
ICAgbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogcmVuZXNhcyxkcmlmOiBDb252ZXJ0IHRvIGpz
b24tc2NoZW1hDQo+ID4gICBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiByZW5lc2FzLGRyaWY6
IEFkZCByOGE3Nzk5MCBzdXBwb3J0DQo+ID4NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL3JlbmVz
YXMsZHJpZi50eHQgICAgICAgICAgIHwgMTc3IC0tLS0tLS0tLS0tLQ0KPiA+ICAuLi4vYmluZGlu
Z3MvbWVkaWEvcmVuZXNhcyxkcmlmLnlhbWwgICAgICAgICAgfCAyNzEgKysrKysrKysrKysrKysr
KysrDQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMyArLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI3MyBpbnNlcnRpb25zKCspLCAxNzggZGVs
ZXRpb25zKC0pDQo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NA0KPiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvcmVuZXNhcyxkcmlmLnR4dA0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMs
ZHJpZi55YW1sDQo+DQo+IC0tDQo+IFJlZ2FyZHMsDQo+DQo+IExhdXJlbnQgUGluY2hhcnQNCg0K
DQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBHbWJILCBHZXNjaGFlZnRzZnVlaHJlci9QcmVz
aWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHogZGVyIEdlc2VsbHNjaGFmdC9SZWdpc3RlcmVkIG9m
ZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFzdHJhc3NlIDEwLCA0MDQ3MiBEdWVzc2VsZG9yZiwg
R2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0NvbW1lcmNpYWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3Jm
LCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlkZW50aWZpY2F0aW9uIG5vLjogREUgMTE5MzUzNDA2
IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5vLjogREUgMTQ5Nzg2NDcNCg==
