Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEC01739F2
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 15:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgB1Oeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 09:34:50 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:5598 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgB1Oeu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 09:34:50 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: lWsWepbszCnd4vJWKFTVvNpgP2qgSJpebKPhzEuU+bwTLY7fspErpm0sYwN8frH0vVxFRvciLB
 EP2FOpgysBMTLEeY4zdrS+yRFGHJJhyVCHOQq6HrDsR1uy4HgmM7t9aLJiEjhAu2CLXHZboowh
 56lbIjiykn3YYdQrRzXNwqvhZbuAsJpU9gRMvnPfZSO/A6QEWJPCDNHvChKFHLhKHNcf4z0/E7
 Cxv+sV+8CGOL8eaffH4mxuemflRhxD+SBgZrLE2kYfelVMGkwfp8ESTnKGEYFVpiPp9qR6fUo8
 3Ig=
X-IronPort-AV: E=Sophos;i="5.70,496,1574146800"; 
   d="scan'208";a="70185741"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Feb 2020 07:34:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Feb 2020 07:34:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 28 Feb 2020 07:34:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xk/pKIKv3lQP5ptUcoJCZVmLTeB9y3az22m/Q6cRtb4NOanBQFTG1oRCtWrSzpIxVfeeWW8zdg83PWFKHj3r+r45711Q6jYcZ5nbUEziA+cJVZBTex/S9dFfU4ZYoTu4KCDmO77sAKO1ufXvQ7PwDY0C2KgQKXQ1foInGlPviV6q1Iu/TVIHYaWY9ywI5LiBndciwU8k9gkhEXahc3Bq5OXkYRVc6TOVfqGQmAcSD/736CBIcuA7a42tOsTuVREBWF+lDOFOEAhPY6VQF4GB9ONC7Kg6jqR/v5xkKm0bMz78brWUL2jFLZ6CyqswggCGKPp/giwnWcVeFiSPG/dGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8JmocEJkxS67G+96AnGK1ureVohVambSVX/FJ6X52Q=;
 b=CIqa03QIgbHTFkx6ExhQNZwZiyaPRifCE3mGSsfwT8dfK4/bVocNeeE17C+Ss7uvEtqLbLVhzW81O+E0pOlMdDrTsonMrMscqI+61Pb/ndHMCLs/VBC47w1O4JW/4eaMEhhsM0CaSpot+cvBTcqvhULzWsfbPK3X2dJwcbQIhceTJ7VBb4d/kfw/iaYQ9XB5DKH+41i89aqKyVLR3EsrLH3D0CcK71RxcCu2lpJnEvI2VxpzvAkdKV/GcEybkE3t/7Qdxy2ffPbfCIPN+f7ooA7Gko1/o/nbQcmCcibfRvLCU7mvlHuU5NKtkmhzA/6nA0M5JpqGcWEKTyElKyx+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8JmocEJkxS67G+96AnGK1ureVohVambSVX/FJ6X52Q=;
 b=eT8t+ZhCTPabuZjhpYTOikAO0uto0QfHJGEoZMLroWZVWLJbWNW9h/9B9+KkmyhyUcktiAdlUANCBfQg8dPzE0Hi1MpUurU79IatYmMoeQH4Kim3PURnIloVAuvIi+kbIShPoOYlcDRPQ7xv1NQjAzLl845Kn/UtqkogyiTmdW0=
Received: from DM6PR11MB4123.namprd11.prod.outlook.com (2603:10b6:5:196::12)
 by DM6PR11MB2778.namprd11.prod.outlook.com (2603:10b6:5:c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Fri, 28 Feb
 2020 14:34:46 +0000
Received: from DM6PR11MB4123.namprd11.prod.outlook.com
 ([fe80::f42c:82b3:ecda:5ff4]) by DM6PR11MB4123.namprd11.prod.outlook.com
 ([fe80::f42c:82b3:ecda:5ff4%6]) with mapi id 15.20.2750.021; Fri, 28 Feb 2020
 14:34:46 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <dave.stevenson@raspberrypi.com>
CC:     <andrey.konovalov@linaro.org>, <sakari.ailus@iki.fi>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx219: add support for enum frame interval
Thread-Topic: [PATCH] media: i2c: imx219: add support for enum frame interval
Thread-Index: AQHV7YFRL4HEUFiYjUmuc7e6XxI0FKgwn2yAgAAFgACAAAN6gIAABMYA
Date:   Fri, 28 Feb 2020 14:34:46 +0000
Message-ID: <4d89fcc2-07bb-f83d-94e2-d0c3c1520471@microchip.com>
References: <20200227151752.21985-1-eugen.hristev@microchip.com>
 <CAPY8ntB17QjCSyefwTrMhudwkiFYT_5x3i1=KjzFv+p6tbrQEA@mail.gmail.com>
 <c6c1082d-3f40-c709-39cf-d1547f0c0308@microchip.com>
 <CAPY8ntDrsEJboMr2=Phce=mT6DJpivhE--L00qd4uecF81AXkg@mail.gmail.com>
In-Reply-To: <CAPY8ntDrsEJboMr2=Phce=mT6DJpivhE--L00qd4uecF81AXkg@mail.gmail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f23cebb-83dd-4b28-82c9-08d7bc5b5bef
x-ms-traffictypediagnostic: DM6PR11MB2778:
x-microsoft-antispam-prvs: <DM6PR11MB2778350BDC02E47C07424204E8E80@DM6PR11MB2778.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(136003)(376002)(366004)(39860400002)(189003)(199004)(81166006)(4326008)(2616005)(31696002)(2906002)(6916009)(66446008)(81156014)(76116006)(66946007)(64756008)(86362001)(5660300002)(66476007)(36756003)(91956017)(66556008)(8936002)(71200400001)(478600001)(8676002)(54906003)(6506007)(186003)(26005)(6512007)(316002)(53546011)(31686004)(966005)(6486002)(461764006);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB2778;H:DM6PR11MB4123.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GY67Rlx//sTZCWCuVhcsqLUVdys3ESLrwBX/YJHfNgvVtTkFk5Qdqjq8f+SQX33/RY6qCHBxMo6yn1TmwSN9JHXBtgLztatiUGV06Z5EGMQ6L5H8NkVH6wdKtwUcldYr81xuhFgyY5cxTbaIEogyDqQ4I0+0gnNAc8L2s1bBOA5DkKlgmrkDIrFX8zwAgD3gL3GF1sQhTyzRx0xeEFkjmQl/4yEQzBS6f3uWpuSvTMI5vAI4OnSUBdRS//fl7lTOqElCxDzkG3pplXDuqxh1dCIRYM5vLPewVEeHXdkWeFTGX0TNfrSanghAxBWDdB2J0ccZPvhK+JG2C980K/rhPxoy2iki2y3sCCKpKkdKy9Ac/NlEAQaGsJj28Li7CvQRxp0gGgnS40gMTAbTX3B5blso6QYqpKd12OT5VZntPlg7Z6cFk/9iRrYYeO3MUE1e9YOwhmS5e5Dx8PBVOp6cSTYXd7rm4SFhDZH+iWkEtRffZ0fai0mq57xEvz0rusxEC2jMAA44ix9pYIGM0IkIqw3M6LB1ALEQTpR5X6bi8o2/MWCCmLt/aX7WO7aLXTpP
x-ms-exchange-antispam-messagedata: WoFK8xzoY4EJGVI+rGNdAUk2wCRmEcfDJWinCh+MDFIRJkQi+cqI5bwsz4HxydUpVJrrFgvP1I7dtx2CfdTvWki21UUnE97Ag/h5n0rPfc9cTkmyyYCUjpWHM8+EoC+kNl9hiZ5kkkWeLj4VA3yytQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <57DFC34DFA420F498E4A15B3E3BE95AF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f23cebb-83dd-4b28-82c9-08d7bc5b5bef
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 14:34:46.5714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARpPObIMLhZr/dxq+aUpBvqQ3ac3TMpQqAdgDlkRV1epUIeJGYbjVPhzrwkwj6pjfgW7brpQOEyOiFkiqTCm5By5ZPlimTfEw/H/nZ9B6cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2778
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjguMDIuMjAyMCAxNjoxNiwgRGF2ZSBTdGV2ZW5zb24gd3JvdGU6DQo+IE9uIEZyaSwgMjgg
RmViIDIwMjAgYXQgMTQ6MDUsIDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20+IHdyb3RlOg0K
Pj4NCj4+IE9uIDI4LjAyLjIwMjAgMTU6NDQsIERhdmUgU3RldmVuc29uIHdyb3RlOg0KPj4+IEhp
IEV1Z2VuLg0KPj4+DQo+Pj4gT24gVGh1LCAyNyBGZWIgMjAyMCBhdCAxNToxOSwgRXVnZW4gSHJp
c3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gQWRk
IHN1cHBvcnQgZm9yIGVudW0gZnJhbWUgaW50ZXJ2YWxzIElPQ1RMLg0KPj4+PiBUaGUgY3VycmVu
dCBzdXBwb3J0ZWQgZnJhbWVyYXRlcyBhcmUgb25seSBhdmFpbGFibGUgYXMgY29tbWVudHMgaW5z
aWRlDQo+Pj4+IHRoZSBjb2RlLg0KPj4+PiBBZGQgc3VwcG9ydCBmb3IgVklESU9DX0VOVU1fRlJB
TUVJTlRFUlZBTFMgYXMgdGhlIGVudW1fZnJhbWVfaW50ZXJ2YWwNCj4+Pj4gY2FsbGJhY2sgYXMg
cGFkIG9wcy4NCj4+Pj4NCj4+Pj4gICAgIyB2NGwyLWN0bCAtLWxpc3QtZnJhbWVpbnRlcnZhbHMg
d2lkdGg9MTkyMCxoZWlnaHQ9MTA4MCxwaXhlbGZvcm1hdD1SRzEwDQo+Pj4+ICAgIGlvY3RsOiBW
SURJT0NfRU5VTV9GUkFNRUlOVEVSVkFMUw0KPj4+PiAgICAgICAgICAgSW50ZXJ2YWw6IERpc2Ny
ZXRlIDAuMDY3cyAoMTUuMDAwIGZwcykNCj4+Pj4gICAgICAgICAgIEludGVydmFsOiBEaXNjcmV0
ZSAwLjAzM3MgKDMwLjAwMCBmcHMpDQo+Pj4+ICAgICAgICAgICBJbnRlcnZhbDogRGlzY3JldGUg
MC4wMzNzICgzMC4wMDAgZnBzKQ0KPj4+DQo+Pj4gQnV0IHRoZSBmcmFtZSByYXRlcyBhcmUgbm90
IGRpc2NyZXRlLiBZb3UgaGF2ZSBmcmFtZSByYXRlIGNvbnRyb2wgdmlhDQo+Pj4gVjRMMl9DSURf
VkJMQU5LLCB3aGljaCBjYW4gYmUgdXNlZCBpbiBjb25qdW5jdGlvbiB3aXRoIFY0TDJfQ0lEX0hC
TEFOSw0KPj4+IGFuZCBWNEwyX0NJRF9QSVhFTF9SQVRFIHRvIGRldGVybWluZSBhY3R1YWwgZnJh
bWUgcGVyaW9kLg0KPj4+DQo+Pj4gU2VlIGh0dHBzOi8vbGludXh0di5vcmcvZG93bmxvYWRzL3Y0
bC1kdmItYXBpcy1uZXcvdWFwaS92NGwvZXh0LWN0cmxzLWltYWdlLXNvdXJjZS5odG1sP2hpZ2hs
aWdodD12NGwyX2NpZF92YmxhbmsNCj4+PiBJIGJlbGlldmUgdGhpcyBpcyB0aGUgcHJlZmVycmVk
IHJvdXRlIHRvIGRvaW5nIGZyYW1lIHJhdGUgY29udHJvbCBvbg0KPj4+IGltYWdlIHNlbnNvcnMu
IEkgYXNzdW1lIHNvbWVvbmUgd2lsbCBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZyBvbiB0aGF0Lg0K
Pj4NCj4+DQo+PiBPa2F5Li4uICwgSSB3YXMgZ3VpZGVkIHRvd2FyZHMgdGhpcyBieSB0aGUgY29t
bWVudHMgaW4gdGhlIGNvZGUsIHNheWluZw0KPj4gdGhhdCB0aGUgdGhyZWUgc3VwcG9ydGVkIG1v
ZGVzIGFyZSBhdCBhIGNvbnN0YW50IGZyYW1lIHBlciBzZWNvbmQuLi4NCj4+DQo+PiBUaG9zZSBj
b21tZW50cyBhcmUgd3JvbmcgdGhlbiA/DQo+IA0KPiBZZXMsIHRoZSBjb21tZW50cyBmb3IgZWFj
aCBvZiB0aGUgbW9kZXMgKGVnICIvKiA4TVBpeCAxNWZwcyBtb2RlICovIikNCj4gcHJvYmFibHkg
c2hvdWxkbid0IGhhdmUgdGhlIGZyYW1lIHJhdGUgaW4gdGhlbS4gSSBkb24ndCBzZWUgYW55IG90
aGVyDQo+IHJlZmVyZW5jZXMuIFRob3NlIGZyYW1lIHJhdGVzIGFyZSB0aGUgZGVmYXVsdHMgb25s
eSwgYXMgc2V0IHZpYSBlZw0KPiBJTVgyMTlfVlRTXzE1RlBTLg0KPiANCj4gSSBvcmlnaW5hbGx5
IHdyb3RlIHRoZSBkcml2ZXIgd2l0aG91dCBmcmFtZSByYXRlIGNvbnRyb2wsIGFuZCB0aGUNCj4g
Y29tbWVudHMgb2J2aW91c2x5IGRpZG4ndCBnZXQgdXBkYXRlZCB3aGVuIFZUUy9IVFMgc3VwcG9y
dCB3YXMgYWRkZWQNCj4gOi0vDQoNClNvIGluIG15IHVuZGVyc3RhbmRpbmcsIGFjdHVhbGx5LCB0
byBnZXQgYWN0dWFsIGZyYW1lIHJhdGUsIHdlIHNob3VsZCANCnVzZSBhbm90aGVyIGNvbnRyb2ws
IGFuZCB0aGUgZW51bSBmcmFtZSBpbnRlcnZhbHMgaXMgYWN0dWFsbHkgaW1wb3NzaWJsZSANCnRv
IHVzZSwgc2luY2UgdGhlIHNlbnNvciBzdXBwb3J0cyBhIG11bHRpdHVkZSBvZiBmcmFtZSByYXRl
cywgYW5kIGl0IA0Kd291bGQgYmUgZWdyZWdpb3VzIHRvIGVudW1lcmF0ZSB0aGVtIGFsbC4NCg0K
SXMgdGhpcyB0aGUgY2FzZSA/DQoNCk15IGlkZWEgd2FzIHRoYXQgdjRsMi1jdGwgLS1saXN0LWZv
cm1hdHMtZXh0IHdpbGwgbm90IHNob3cgYW55dGhpbmcgDQpyZWxhdGVkIHRvIGZyYW1lIHJhdGUu
IFNvIHVzaW5nIHRoaXMgY29tbWFuZCwgd2lsbCBvbmx5IGdldCB0aGUgDQpyZXNvbHV0aW9uLCBi
dXQgZG9uJ3Qga25vdyB3aGF0IHRvIGV4cGVjdCBpbiB0ZXJtcyBvZiBmcmFtZSByYXRlLg0KV291
bGRuJ3QgYmUgdXNlZnVsIHRvIGltcGxlbWVudCB0aGlzICdkZWZhdWx0JyBmcmFtZSByYXRlIGlu
IHRoaXMgSU9DVEwgPw0KDQoNClRoYW5rcyBmb3IgZXhwbGFuYXRpb25zDQo+IA0KPj4gVGhhbmtz
IGZvciByZXBseWluZywNCj4+DQo+PiBFdWdlbg0KPj4NCj4+Pg0KPj4+ICAgICBEYXZlDQo+Pj4N
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2No
aXAuY29tPg0KPj4+PiAtLS0NCj4+Pj4NCj4+Pj4gSGVsbG8sDQo+Pj4+DQo+Pj4+IFRoaXMgaXMg
b24gdG9wIG9mIFNha2FyaSdzIHRyZWUgaW4gbGludXh0di5vcmcNCj4+Pj4NCj4+Pj4gVGhhbmtz
DQo+Pj4+IEV1Z2VuDQo+Pj4+DQo+Pj4+ICAgIGRyaXZlcnMvbWVkaWEvaTJjL2lteDIxOS5jIHwg
MjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAy
NyBpbnNlcnRpb25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2ky
Yy9pbXgyMTkuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL2lteDIxOS5jDQo+Pj4+IGluZGV4IGYxZWZm
YjVhNWY2Ni4uMTdmY2VkZDRlZGI2IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL21lZGlhL2ky
Yy9pbXgyMTkuYw0KPj4+PiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9pbXgyMTkuYw0KPj4+PiBA
QCAtMTI3LDYgKzEyNyw4IEBAIHN0cnVjdCBpbXgyMTlfbW9kZSB7DQo+Pj4+ICAgICAgICAgICB1
bnNpZ25lZCBpbnQgd2lkdGg7DQo+Pj4+ICAgICAgICAgICAvKiBGcmFtZSBoZWlnaHQgKi8NCj4+
Pj4gICAgICAgICAgIHVuc2lnbmVkIGludCBoZWlnaHQ7DQo+Pj4+ICsgICAgICAgLyogRnJhbWUg
cmF0ZSAqLw0KPj4+PiArICAgICAgIHU4IGZwczsNCj4+Pj4NCj4+Pj4gICAgICAgICAgIC8qIFYt
dGltaW5nICovDQo+Pj4+ICAgICAgICAgICB1bnNpZ25lZCBpbnQgdnRzX2RlZjsNCj4+Pj4gQEAg
LTM4MSw2ICszODMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlteDIxOV9tb2RlIHN1cHBvcnRl
ZF9tb2Rlc1tdID0gew0KPj4+PiAgICAgICAgICAgICAgICAgICAvKiA4TVBpeCAxNWZwcyBtb2Rl
ICovDQo+Pj4+ICAgICAgICAgICAgICAgICAgIC53aWR0aCA9IDMyODAsDQo+Pj4+ICAgICAgICAg
ICAgICAgICAgIC5oZWlnaHQgPSAyNDY0LA0KPj4+PiArICAgICAgICAgICAgICAgLmZwcyA9IDE1
LA0KPj4+PiAgICAgICAgICAgICAgICAgICAudnRzX2RlZiA9IElNWDIxOV9WVFNfMTVGUFMsDQo+
Pj4+ICAgICAgICAgICAgICAgICAgIC5yZWdfbGlzdCA9IHsNCj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAubnVtX29mX3JlZ3MgPSBBUlJBWV9TSVpFKG1vZGVfMzI4MHgyNDY0X3JlZ3Mp
LA0KPj4+PiBAQCAtMzkxLDYgKzM5NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14MjE5X21v
ZGUgc3VwcG9ydGVkX21vZGVzW10gPSB7DQo+Pj4+ICAgICAgICAgICAgICAgICAgIC8qIDEwODBQ
IDMwZnBzIGNyb3BwZWQgKi8NCj4+Pj4gICAgICAgICAgICAgICAgICAgLndpZHRoID0gMTkyMCwN
Cj4+Pj4gICAgICAgICAgICAgICAgICAgLmhlaWdodCA9IDEwODAsDQo+Pj4+ICsgICAgICAgICAg
ICAgICAuZnBzID0gMzAsDQo+Pj4+ICAgICAgICAgICAgICAgICAgIC52dHNfZGVmID0gSU1YMjE5
X1ZUU18zMEZQU18xMDgwUCwNCj4+Pj4gICAgICAgICAgICAgICAgICAgLnJlZ19saXN0ID0gew0K
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIC5udW1fb2ZfcmVncyA9IEFSUkFZX1NJWkUo
bW9kZV8xOTIwXzEwODBfcmVncyksDQo+Pj4+IEBAIC00MDEsNiArNDA1LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBpbXgyMTlfbW9kZSBzdXBwb3J0ZWRfbW9kZXNbXSA9IHsNCj4+Pj4gICAgICAg
ICAgICAgICAgICAgLyogMngyIGJpbm5lZCAzMGZwcyBtb2RlICovDQo+Pj4+ICAgICAgICAgICAg
ICAgICAgIC53aWR0aCA9IDE2NDAsDQo+Pj4+ICAgICAgICAgICAgICAgICAgIC5oZWlnaHQgPSAx
MjMyLA0KPj4+PiArICAgICAgICAgICAgICAgLmZwcyA9IDMwLA0KPj4+PiAgICAgICAgICAgICAg
ICAgICAudnRzX2RlZiA9IElNWDIxOV9WVFNfMzBGUFNfQklOTkVELA0KPj4+PiAgICAgICAgICAg
ICAgICAgICAucmVnX2xpc3QgPSB7DQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgLm51
bV9vZl9yZWdzID0gQVJSQVlfU0laRShtb2RlXzE2NDBfMTIzMl9yZWdzKSwNCj4+Pj4gQEAgLTY4
MCw2ICs2ODUsMjcgQEAgc3RhdGljIGludCBpbXgyMTlfZW51bV9mcmFtZV9zaXplKHN0cnVjdCB2
NGwyX3N1YmRldiAqc2QsDQo+Pj4+ICAgICAgICAgICByZXR1cm4gMDsNCj4+Pj4gICAgfQ0KPj4+
Pg0KPj4+PiArc3RhdGljIGludCBpbXgyMTlfZW51bV9mcmFtZV9pbnRlcnZhbChzdHJ1Y3QgdjRs
Ml9zdWJkZXYgKnNkLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCB2NGwyX3N1YmRldl9wYWRfY29uZmlnICpjZmcsDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHY0bDJfc3ViZGV2X2ZyYW1lX2ludGVydmFs
X2VudW0gKmZpZSkNCj4+Pj4gK3sNCj4+Pj4gKyAgICAgICBzdHJ1Y3QgaW14MjE5ICppbXgyMTkg
PSB0b19pbXgyMTkoc2QpOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgaWYgKGZpZS0+aW5kZXggPj0g
QVJSQVlfU0laRShzdXBwb3J0ZWRfbW9kZXMpKQ0KPj4+PiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICBpZiAoZmllLT5jb2RlICE9IGlteDIxOV9n
ZXRfZm9ybWF0X2NvZGUoaW14MjE5KSkNCj4+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgaWYgKGZpZS0+cGFkKQ0KPj4+PiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICBmaWUtPmludGVydmFs
Lm51bWVyYXRvciA9IDE7DQo+Pj4+ICsgICAgICAgZmllLT5pbnRlcnZhbC5kZW5vbWluYXRvciA9
IHN1cHBvcnRlZF9tb2Rlc1tmaWUtPmluZGV4XS5mcHM7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICBy
ZXR1cm4gMDsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiAgICBzdGF0aWMgdm9pZCBpbXgyMTlfcmVz
ZXRfY29sb3JzcGFjZShzdHJ1Y3QgdjRsMl9tYnVzX2ZyYW1lZm10ICpmbXQpDQo+Pj4+ICAgIHsN
Cj4+Pj4gICAgICAgICAgIGZtdC0+Y29sb3JzcGFjZSA9IFY0TDJfQ09MT1JTUEFDRV9TUkdCOw0K
Pj4+PiBAQCAtMTAwNCw2ICsxMDMwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX3N1YmRl
dl9wYWRfb3BzIGlteDIxOV9wYWRfb3BzID0gew0KPj4+PiAgICAgICAgICAgLmdldF9mbXQgPSBp
bXgyMTlfZ2V0X3BhZF9mb3JtYXQsDQo+Pj4+ICAgICAgICAgICAuc2V0X2ZtdCA9IGlteDIxOV9z
ZXRfcGFkX2Zvcm1hdCwNCj4+Pj4gICAgICAgICAgIC5lbnVtX2ZyYW1lX3NpemUgPSBpbXgyMTlf
ZW51bV9mcmFtZV9zaXplLA0KPj4+PiArICAgICAgIC5lbnVtX2ZyYW1lX2ludGVydmFsID0gaW14
MjE5X2VudW1fZnJhbWVfaW50ZXJ2YWwsDQo+Pj4+ICAgIH07DQo+Pj4+DQo+Pj4+ICAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgdjRsMl9zdWJkZXZfb3BzIGlteDIxOV9zdWJkZXZfb3BzID0gew0KPj4+
PiAtLQ0KPj4+PiAyLjIwLjENCj4+Pj4NCj4+DQoNCg==
