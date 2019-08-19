Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A48C92845
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 17:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfHSPYb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 11:24:31 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:18714 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfHSPYb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 11:24:31 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 7vlq4+XFQX/Dg87pTH3AmoLJTsbkvE3MbW5DJGg2qobfAPERMv5NHjeZD6XDxqG3Vg3O8F5VqM
 7YeGepJmz/6UTWNHEjTWB2MSz3mPN9jewRqug/5IxDFGsYqx6PageFL9iad9aAlFlk+b/FBjmA
 b2eWXCHFqxHgpgTU+1yC0cqiLu57P1AaKOZS2pFw0PRQ7xMzrExWS/XM6AFlua4lRfUM4HiPFP
 pbzudV/ta24c0N9r10lHWCLjIXk8lU3Bih7QgHa8Uw1Tiv7j3GDdSHTqbuQ/2jZMpZzJ9TPIjz
 Dto=
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; 
   d="scan'208";a="47067113"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2019 08:24:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 19 Aug 2019 08:24:28 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 19 Aug 2019 08:24:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldcWczClbOfiLAqwEiMOCAkJ6MvejAj9AD/nXc2uzRyMS/8Zi/p2kiirJ10kgbfXvuWfQ0dyFKkyPffhYE6vZusjTfYdGVRZveng7oqQRYzmMIfgL0WiCSzBNOTS/S6rUDMHwhs7tiB5UUy+d9SH6EjubnOyjBPocoOSH/yVR4cL5dCyzF+2ROt61b+e19PWbFnPmR7kjNLogWxvTlok+9FGHTiyVxEnQIp+zLu4i8P7vu+hfGBX7iCXhvIkWjQKbGehOSJIQuF5jIOSkjDDyRY9rdMI55i36BF5uj2PkzhyWv/RN3/2d7KIEw9RZFF0vzJM/hKeKtpwk+dbFfI8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qvtaKLfTzHU4t5/GkgPFvzuFXKsuTkx78WZfKWqErw=;
 b=C9Xjp4e+WeO9MouO/IBxwK01S4OR/O8FBvoXQ80w0VFWVRw7NplB7gm36Pr4ilyZiSOaeBuOTkzepIEzHRzDyaoHOJ1RVll9LzV1+B2koWSUAmMuw8xqpAzU90PoFOMxkn5aJ6UZ3A40SAFkoWdCoNKAHiikOiEHu4mcshTgRQ5Kz8DOnvj/7Arn5gfT7yuT53wgqCLritDSuQQofFNa0FMR1UgxkQxAUXkBDB6rgYLDA6UULHstI/fGu7vyhbYoKPVrMWcp9s/CyMCqjjQcW6Y0E459wR1PnXxe7Sl4WNBWCFNM/rjVvLkH/zQEoT6xQpZQ/ZejScN5m6gFkr4h4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qvtaKLfTzHU4t5/GkgPFvzuFXKsuTkx78WZfKWqErw=;
 b=eBdVZb4MWlaUUfZKvBNDrFTmRs6VJmDWys8EfvOtzkmh3OZD6mwBqbGZrKvstjP04/HOVzqU+1sIzGxxIYCnP9vA/PiotLAow4EvSMAQcBY0MZ3xdlBAcWgIoNvHBnm2GdWdBOtKTBM/aZ0rsIu0I3QzHbaDYNoHvjZ5gEhAH3s=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1755.namprd11.prod.outlook.com (10.175.91.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 15:24:26 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2178.018; Mon, 19 Aug
 2019 15:24:26 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <laurent.pinchart@ideasonboard.com>, <ezequiel@collabora.com>,
        <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <acourbot@chromium.org>,
        <jacopo+renesas@jmondi.org>, <tfiga@chromium.org>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
Thread-Topic: [ANN] Topics for a media summit in Lyon in October
Thread-Index: AQHVVAmMy7Vq5akymUqo4Qo4OG8IHKcCG7UAgAB1RgCAAAXUAIAABAYA
Date:   Mon, 19 Aug 2019 15:24:26 +0000
Message-ID: <1f760902-5211-b93a-b07a-9d3fcdf4b83c@microchip.com>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <f401e64d-82aa-582d-90fe-a06476546453@xs4all.nl>
 <b2ea9a321cd20be9f42c2fb22364ea5d365870c2.camel@collabora.com>
 <20190819150448.GH5011@pendragon.ideasonboard.com>
In-Reply-To: <20190819150448.GH5011@pendragon.ideasonboard.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR08CA0035.eurprd08.prod.outlook.com
 (2603:10a6:803:104::48) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190819181912324
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba8fcc16-b14c-4f9a-621c-08d724b95226
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1755;
x-ms-traffictypediagnostic: DM5PR11MB1755:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR11MB1755632D66B0FFA63EA98A37E8A80@DM5PR11MB1755.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(366004)(189003)(199004)(14444005)(256004)(66946007)(66476007)(64756008)(66556008)(66446008)(4326008)(6512007)(26005)(53546011)(6506007)(186003)(386003)(102836004)(6436002)(31686004)(31696002)(36756003)(2906002)(66574012)(71200400001)(71190400001)(25786009)(6116002)(3846002)(6306002)(486006)(86362001)(316002)(11346002)(229853002)(5660300002)(446003)(6246003)(8676002)(99286004)(52116002)(81166006)(6486002)(2616005)(54906003)(14454004)(476003)(110136005)(81156014)(305945005)(53936002)(478600001)(76176011)(8936002)(966005)(7736002)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1755;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XTgPpyczYu1Odn51TqK5LViefY27rM9MSY5Nb3dtkMz2A1V8MwFxgkz8iyWkC5GuJdRO5eonZs0NSSLPT2utoi9bCcA4T3p8VCj7X6XYUwmg0n3A9rXhsrlSs8mOIVpHQJrrnkKNceiv8Csa2WK11FU/o6kqGuEuNXq739C+8jdS7doxJBUcRDqLa+eTDsxGAvfacE0juqmVmL6jTylkLobcAqW3+9GumdyCEFDRllAfFJOoAF6Tt/AGzJRsCo53wUUbWS3EeGx1Js+WmE3kgANfqNeCiNUOZbjTn9dNmtPLuFcXoMxAxHhbwgLeRM5tOb2cFAfy8t+EoiRs+UcIb/DkzB8xRY5Omsaln7TLz3GCmUlqZGreHXKIkozYl1XUSbsgvUBqP2gMZji7u09Y6cQgMgzSZ7gSgIyWOT2Qs78=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9635BFB1C2EE534288B0D286705551E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8fcc16-b14c-4f9a-621c-08d724b95226
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 15:24:26.5070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4vSVkgvH7zVAMmJLctJj+GaMApgwsEmRW590clGNhGZg8uqeiAGTU4rNgBqJ463Qz71T34q7PLqInGahNZNsv2WHpVlm6Gl80Rc3wWS2lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1755
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDE5LjA4LjIwMTkgMTg6MDQsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+IEhlbGxv
LA0KPiANCj4gT24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTE6NDM6NTZBTSAtMDMwMCwgRXplcXVp
ZWwgR2FyY2lhIHdyb3RlOg0KPj4gT24gTW9uLCAyMDE5LTA4LTE5IGF0IDA5OjQ0ICswMjAwLCBI
YW5zIFZlcmt1aWwgd3JvdGU6DQo+Pj4gT24gOC8xNi8xOSAxMDowNiBBTSwgSGFucyBWZXJrdWls
IHdyb3RlOg0KPj4+PiBSYXRoZXIgdGhlbiBkaXNjdXNzaW5nIHRvcGljcyBmb3IgYSBtZWV0aW5n
IHVuZGVyIHRoZSBzdWJqZWN0ICdMaXNib24nDQo+Pj4+IGxldCdzIHN0YXJ0IGEgbmV3IHRocmVh
ZCByZWZlcnJpbmcgdG8gdGhlIHJpZ2h0IHBsYWNlIDotKQ0KPj4+Pg0KPj4+PiBJIHdpbGwgdHJ5
IHRvIG9yZ2FuaXplIGEgcm9vbSwgZWl0aGVyIGR1cmluZyB0aGUgRUxDRSBvciAoaWYgdGhhdCBk
b2Vzbid0DQo+Pj4+IHdvcmspIHBlcmhhcHMgb24gdGhlIFRodXJzZGF5IGFmdGVyd2FyZHMuIElm
IHRoYXQncyBnb2luZyB0byBiZSBhIHByb2JsZW0NCj4+Pj4gZm9yIHNvbWVvbmUsIHBsZWFzZSBs
ZXQgbWUga25vdy4NCj4+Pj4NCj4+Pj4gSSBkbyBuZWVkIHRvIGtub3cgaG93IG1hbnkgcGVvcGxl
IEkgY2FuIGV4cGVjdC4gSSBoYXZlIHRoZSBmb2xsb3dpbmcNCj4+Pj4gY29uZmlybWVkIGF0dGVu
ZGVlcyAoYW5kIHBsZWFzZSByZXBseSBpZiB5b3UgYXJlIG5vdCBsaXN0ZWQhKToNCj4+Pj4NCj4+
Pj4gQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9taXVtLm9yZz4NCj4+Pj4gVG9tYXN6
IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4NCj4+Pj4gSmFjb3BvIE1vbmRpIDxqYWNvcG9Aam1v
bmRpLm9yZz4NCj4+Pj4gTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPg0KPj4+PiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD4NCj4+Pj4N
Cj4+Pj4gSSBrbm93IHRoZXJlIHdlcmUgbW9yZSB3aG8gbWVudGlvbmVkIG9uIGlyYyB0aGF0IHRo
ZXkgd291bGQgYXR0ZW5kLA0KPj4+PiBidXQgaXQgaXMgZWFzaWVyIHRvIGtlZXAgdHJhY2sgaWYg
SSBoYXZlIGl0IGluIGFuIGVtYWlsLg0KPj4+Pg0KPj4+PiBUb3BpY3MgcG9zdGVkIHVuZGVyIHRo
ZSBwcmV2aW91cyB0aHJlYWQ6DQo+Pj4+DQo+Pj4+IFRvbWFzejoNCj4+Pj4NCj4+Pj4gSSB3b3Vs
ZCB3YW50IHRvIGRpc2N1c3MgdmFyaW91cyB2NGwyX2J1ZmZlciBpbXByb3ZlbWVudHMsIGUuZy4N
Cj4+Pj4gLSBETUEtYnVmIGltcG9ydCB3aXRoIHBsYW5lIG9mZnNldHMsDQo+Pj4+IC0gdW5pZnlp
bmcgdGhlIGJ1ZmZlciBzdHJ1Y3RzIGZvciBNIGFuZCBub24tTSBmb3JtYXRzLA0KPj4+PiAtIGFi
aWxpdHkgdG8gaW1wb3J0IGRpZmZlcmVudCBGRHMgd2l0aCBvZmZzZXRzIGZvciBub24tTSBmb3Jt
YXRzIGlmIHRoZQ0KPj4+PiBsYXlvdXQgbWF0Y2hlcyBkcml2ZXIgZXhwZWN0YXRpb25zLCBldGMu
DQo+Pj4+DQo+Pj4+IEJlc2lkZXMgdGhhdCwgSSB3b3VsZCBiZSBpbnRlcmVzdGVkIGluIHRoZSBn
ZW5lcmFsIGlkZWEgb24gaGFuZGxpbmcNCj4+Pj4gY29tcGxleCBjYW1lcmFzIGluIHRoZSBMaW51
eCBrZXJuZWwgaW4gc3BpdGUgb2YgdGhlIHJlbWFpbmluZyBWNEwyDQo+Pj4+IGxpbWl0YXRpb25z
LCBlLmcuDQo+Pj4+IC0gY29tYmluYXRvcmlhbCBleHBsb3Npb24gb2YgL2Rldi92aWRlbyBub2Rl
cywNCj4+Pj4gLSBzaWduaWZpY2FudCBpb2N0bCBvdmVyaGVhZCwNCj4+Pj4gLSBodWdlIGFtb3Vu
dCBvZiBoaXN0b3JpY2FsIGxlZ2FjeSBtYWtpbmcgdGhlIGRyaXZlciBhbmQgdXNlcnNwYWNlDQo+
Pj4+ICAgIGltcGxlbWVudGF0aW9ucyBvdmVybHkgZGlmZmljdWx0IGFuZCBwcm9uZSB0byByZXBl
dGl0aXZlIG1pc3Rha2VzLA0KPj4+PiAtIHRoZSBhYm92ZSBhbHNvIGxpbWl0aW5nIHRoZSBmbGV4
aWJpbGl0eSBvZiB0aGUgQVBJIC0gZm9ybWF0cywgZnJhbWUNCj4+Pj4gICAgcmF0ZXMsIGV0Yy4g
c2V0IHVzaW5nIGRpc3RpbmN0IEFQSXMsIG5vdCBjb3ZlcmVkIGJ5IFJlcXVlc3QgQVBJLCB3aXRo
DQo+Pj4+ICAgIG5vbi1mYWlsdXJlICJuZWdvdGlhdGlvbiBoZWxsIiwgZXRjLg0KPj4+PiAtIGxh
Y2sgb2YgZmVuY2VzLCBldGMuDQo+Pj4+DQo+Pj4+IEphY29wbzoNCj4+Pj4NCj4+Pj4gQXBhcnQg
ZnJvbSBkaXNjdXNzaW5nIGxpYmNhbWVyYSBhbmQgaG9wZSB3ZSBjb3VsZCBraWNrc3RhcnQgYSBy
ZXZpZXcgb2YNCj4+Pj4gaXRzIEFQSSwgSSB3b3VsZCBsaWtlIHRvIHJlLXN0YXJ0IGRpc2N1c3Np
bmcgbXVsdGlwbGV4ZWQgc3RyZWFtIHN1cHBvcnQsDQo+Pj4+IGJ1dCB0aGF0IHdvdWxkIHJlcXVp
cmUgU2FrYXJpIHRvIGJlIHRoZXJlLCBzb21ldGhpbmcgSSdtIG5vdCBjZXJ0YWluDQo+Pj4+IGFi
b3V0LiBTYWthcmk/DQo+Pj4+DQo+Pj4+IEFsZXhhbmRyZToNCj4+Pj4NCj4+Pj4gSWYgQ29sbGFi
b3JhL0Jvb3RsaW4gaXMgdGhlcmUsIEknZCBjZXJ0YWlubHkgd2FudCB0byBkaXNjdXNzIHN0YXRl
bGVzcw0KPj4+PiBjb2RlY3MsIGluIHBhcnRpY3VsYXIgbTJtIGNvZGVjIGhlbHBlcnMgYW5kIGZp
bmFsaXplIHRoZSBzcGVjaWZpY2F0aW9uDQo+Pj4+IGluIGdlbmVyYWwuDQo+Pj4NCj4+PiBIYW5z
Og0KPj4+DQo+Pj4gRmluYWxpemUgdGhlIHN0YXRlZnVsIGVuY29kZXIgQVBJLiBUaGVyZSBhcmUg
c3RpbGwgdHdvIFRPRE9zIHRoZXJlLCBzZWU6DQo+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9jb3Zlci8xMDk3Mjc4My8NCj4+Pg0KPj4NCj4+IEEgZmV3IENvbGxhYm9yYW5zLCBpbmNs
dWRpbmcgbWUgd2lsbCBiZSBhdHRlbmRpbmcuDQo+Pg0KPj4gT24gbXkgc2lkZSwgSSdkIGxpa2Ug
dG8gZGlzY3VzcyB0aGUgc3RhZ2luZyBzdGF0ZWxlc3MgY29kZWMgZHJpdmVycw0KPj4gYW5kIHRo
ZSBjb25kaXRpb25zIGFuZCByZXF1aXJlbWVudHMgZm9yIHRoZW0gdG8gbW92ZSBvdXQgb2Ygc3Rh
Z2luZy4NCj4gDQo+IElmIHRpbWUgKGFuZCBpbnRlcmVzdCkgcGVybWl0cywgd2UgY291bGQgYWxz
byBkaXNjdXNzIHRoZSBuZXh0IHN0ZXBzIGZvcg0KPiBsaWJjYW1lcmEgYW5kIHRoZWlyIGltcGxp
Y2F0aW9ucyBvbiB0aGUga2VybmVsIHNpZGUuDQo+IA0KPiBJcyB0aGVyZSBhbnkgbmV3cyByZWdh
cmRpbmcgdGhlIGRhdGUgb2YgdGhlIG1lZXRpbmcgPyBUaHVyc2RheSBhZnRlciB0aGUNCj4gY29u
ZmVyZW5jZSB3b3VsZCBiZSBiZXN0IGZvciBtZSwgYnV0IGlmIGl0J3MgZHVyaW5nIHRoZSBjb25m
ZXJlbmNlLCBJDQo+IGNvdWxkIHN0aWxsIGF0dGVuZCBwYXJ0IG9mIHRoZSBkaXNjdXNzaW9ucyAo
ZGVwZW5kaW5nIG9uIHRoZSBjb25mZXJlbmNlDQo+IHNjaGVkdWxlKS4NCj4gDQoNCkhlbGxvLA0K
DQpJIHdpbGwgYmUgaW4gTHlvbiBhbmQgd291bGQgbG92ZSB0byBhdHRlbmQuIEkgYW0gcHJldHR5
IG11Y2ggbmV3IHRvIA0KbWVkaWEgc3Vic3lzdGVtIGFuZCBlYWdlciB0byBsZWFybiBtb3JlIGFi
b3V0IGl0Lg0KTXkgaW50ZXJlc3QgaXMgcmVsYXRlZCB0byBwbGF0Zm9ybSBkcml2ZXJzIGFuZCBz
dXBwb3J0IGZvciBzbWFsbCBJU1BzIA0KaW5zaWRlIGhhcmR3YXJlIGNvbnRyb2xsZXJzLg0KDQpQ
LlMuIE5vdCBzdXJlIGlmIHdpbGwgYmUgc3RpbGwgdGhlcmUgb24gVGh1cnNkYXkgb3Igb25seSBN
b24tV2VkDQoNClRoYW5rcywNCkV1Z2VuDQo=
