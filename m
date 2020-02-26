Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB961701D0
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 16:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgBZPCy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 10:02:54 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:18329 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgBZPCx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 10:02:53 -0500
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: X5NzTrnxfpSoUyHbtcccHxZc2TrPkwDymi/NAjL662tejkgKcr+PZ5YtDmKNYuE0FTXWqztK1S
 9oJDwBAI91VLo0VQWxAwymObsLIDWMgJ6qDMdsja32kGHoYmVmRDBu8aITI38belGxxf6amMde
 X/hsGQyZ3X8EHPpiQqzwxBRbCkXb/S44V4XHaoWbpPBcRCePPnrS5RNZKqDKYhXePTXCYbcoD5
 smEUr+Dpq4ilDI3pGTH/0qkS/0jRnvfWNToT/liSpocDIJb6+9mwKdOkz3E28CtZ5T0aT4zWnI
 WW0=
X-IronPort-AV: E=Sophos;i="5.70,488,1574146800"; 
   d="scan'208";a="66820842"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Feb 2020 08:02:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 26 Feb 2020 08:02:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 26 Feb 2020 08:02:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ko2XfWQCvNTSr++K33SKQc4nDkhPXg2oG1QwY8pB6i9eL2PHDJ+QihsMTKC8CGHfCJGzdpSOdAwYuEjKD7z/F8byienjeFqE/6XHEJQuiHngll6MaDEVADkJnGPSDMgxJupQ+sHA18uIwTQPZ50Z5WnFLimG1ca0oH+pjUkNs1qV5+qVQQgNRbqlMPm1jM+vg+4aeKgVyG1tgrs+spkDn9gT36QWF7tsPwVic2FX9FkULjkXjCUe2tjGk+8FKrah6Sv/mM5OB7l2qHldngjXgvTWDbgAE2raj/MpUN46HYTxuYtUw41DZhLH9yH6RTcy8ZqTwyDwsM1Wc2j390RJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6akuVSWXkeXIVgaGR2Ky30P9QHQDNs6SN/iN7ClT/rE=;
 b=c6bFTFu1QZrqw1Qws7XYKmVasiUTc1tj8sHF4w9Q1USalwlw15zDIJZDwoncpCZGskMSVw0Y25nAJjoTULqe9PrV+MfhijrpZru2aVcIb1QlbYLjcgrXABFcq2/PyWmU9b6auZz4UWKkQCWRE5BBepZFpi6tjhrNgVAVDAIMw/BcwPQFmchgwZBKOg20ubCL7j5LSj6XP1VCuAcoQ+P3JbmLcFCkI/mDdRt/quWLb/ft99474gDaxFPllHWUERe+ljAS6ooljt/BTIPMXL8lmk7ZpLQVSpCRa3DiwScYxxRoMj8gQGK0CSTlc0OhRaUEkbaVqVAT2xCRq6oYjZu5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6akuVSWXkeXIVgaGR2Ky30P9QHQDNs6SN/iN7ClT/rE=;
 b=Qt1jB5bRHBGQiYhSLPGuSTui7Lp0swNsafNfQXylFiZTiL8aLUG/NTFFaaK/Enw2mvbLvGP/VRn74nd9+CxCNA3hnvWO2wlKzALmmoRQ2bycIhH78MXFW4jQL92CW0nr/DtCEfrUHYQ7XythyQfr2FZ2VKnqBKxYmm5M5dgQE/g=
Received: from DM6PR11MB4123.namprd11.prod.outlook.com (2603:10b6:5:196::12)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18; Wed, 26 Feb
 2020 15:02:46 +0000
Received: from DM6PR11MB4123.namprd11.prod.outlook.com
 ([fe80::f42c:82b3:ecda:5ff4]) by DM6PR11MB4123.namprd11.prod.outlook.com
 ([fe80::f42c:82b3:ecda:5ff4%6]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 15:02:46 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@iki.fi>
CC:     <linux-media@vger.kernel.org>, <hverkuil@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: v4l2-core: fix entity initialization in
 device_register_subdev
Thread-Topic: [PATCH] media: v4l2-core: fix entity initialization in
 device_register_subdev
Thread-Index: AQHV7J6nOcs4VVxha02L+sjL59cMs6gtkVAAgAAAywA=
Date:   Wed, 26 Feb 2020 15:02:46 +0000
Message-ID: <0121a282-1509-42b9-e9c3-8c0bc6a1d25d@microchip.com>
References: <20200226121545.19880-1-eugen.hristev@microchip.com>
 <20200226145900.GL5023@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200226145900.GL5023@valkosipuli.retiisi.org.uk>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a047fdce-95ff-4e39-6e23-08d7baccf05e
x-ms-traffictypediagnostic: DM6PR11MB4691:
x-microsoft-antispam-prvs: <DM6PR11MB4691F480A0DEE50F9A8155B3E8EA0@DM6PR11MB4691.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(199004)(189003)(186003)(6486002)(66946007)(66556008)(76116006)(64756008)(91956017)(2906002)(66476007)(6512007)(6506007)(66446008)(26005)(36756003)(53546011)(5660300002)(71200400001)(8676002)(81156014)(2616005)(8936002)(498600001)(4326008)(86362001)(81166006)(54906003)(31696002)(6916009)(31686004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB4691;H:DM6PR11MB4123.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: huhiJuWCsD7ipFHnddpVsiCF1eSu3mxRrO+eXFThGep7DTcA622dNV1Sc8QSyumHG4VH2aQCIMVw3JTHiD9UvDZFz6QvFCFImE7rthFw81kJJSVXkIl2mC1ZMN3VgevvZlbFjNCDriWMbe+g7xJr7riI8kg25cgjTyMoQaIAnVCRJJl8iO7Zas2gSRJcHoNTe7DxKzAqNhEn36w09q/Rt3REz3ypoaapH0vcc/0dvnYVcT/7lC4SyolC51PBXgSTQPlZhHiNxe5CnkNpFI3k8iLLe3xOwa6wELEdZezy95jmtu+uvPzBdlgqKqALVchlFtNUZDLYSjjLJOHoCExK7miPuqRKCl51BB/WwrUN88YNeVcQTX9Fzbbhl3GpO/BHacrnN7wBzT1kStplqTFxW+lCaZDLmMJImy8K/ylqbbvDZNl23otXJ4VrH3g3BYA2
x-ms-exchange-antispam-messagedata: KC3pAihgDSJpunlHhyEnroZAMNdfoYTLeqeIvSBQ3NCsYLe0ClG5UPQPWiYK5LANqoaG/zVmPrTM0vaHD1fh7Z0jef8hWH6CQQQXCmT16eziRXl7M5uOQygOJPb9yA/fhmqYhc9URT5biElgBBXw2Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1C7CFE3E7DC694A908DACF363AEDED0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a047fdce-95ff-4e39-6e23-08d7baccf05e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 15:02:46.3680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qE0K5zUnhe5TVEh+KYdSWlY8n93doEH6+KN36dXXDwWngJNEo5ALdiiSzSPoTLWm1NFWcC0h009kP+0ehrqfe2q153BleZ2ORZOCLo1I9PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjYuMDIuMjAyMCAxNjo1OSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KDQo+IEhpIEV1Z2VuLA0K
PiANCj4gT24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDI6MTU6NDVQTSArMDIwMCwgRXVnZW4gSHJp
c3RldiB3cm90ZToNCj4+IFRoZSBjaGVjayBmb3IgcGFyYW1ldGVycyBpcyBkb25lIGJlbG93IGlu
IHRoZSBmdW5jdGlvbi4NCj4+IEluaXRpYWxpemUgdGhlIGVudGl0eSB2YXJpYWJsZSBwcm9wZXJs
eSwgYWZ0ZXIgdGhlIHBhcmFtZXRlcnMNCj4+IGhhdmUgYmVlbiBjaGVja2VkLg0KPj4NCj4+IEZp
eGVzOiA2MWY1ZGI1NDlkZGUgKCJbbWVkaWFdIHY0bDogTWFrZSB2NGwyX3N1YmRldiBpbmhlcml0
IGZyb20gbWVkaWFfZW50aXR5IikNCj4+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1
Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL3Y0
bDItY29yZS92NGwyLWRldmljZS5jIHwgMyArKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL3Y0bDItY29yZS92NGwyLWRldmljZS5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRs
Mi1kZXZpY2UuYw0KPj4gaW5kZXggNjNkNmIxNDdiMjFlLi42ZTMzMTMyZWJiMTkgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWRldmljZS5jDQo+PiArKysgYi9k
cml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWRldmljZS5jDQo+PiBAQCAtMTEyLDcgKzExMiw3
IEBAIGludCB2NGwyX2RldmljZV9yZWdpc3Rlcl9zdWJkZXYoc3RydWN0IHY0bDJfZGV2aWNlICp2
NGwyX2RldiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdjRsMl9z
dWJkZXYgKnNkKQ0KPj4gICB7DQo+PiAgICNpZiBkZWZpbmVkKENPTkZJR19NRURJQV9DT05UUk9M
TEVSKQ0KPj4gLSAgICAgc3RydWN0IG1lZGlhX2VudGl0eSAqZW50aXR5ID0gJnNkLT5lbnRpdHk7
DQo+PiArICAgICBzdHJ1Y3QgbWVkaWFfZW50aXR5ICplbnRpdHk7DQo+PiAgICNlbmRpZg0KPj4g
ICAgICAgIGludCBlcnI7DQo+Pg0KPj4gQEAgLTE0MSw2ICsxNDEsNyBAQCBpbnQgdjRsMl9kZXZp
Y2VfcmVnaXN0ZXJfc3ViZGV2KHN0cnVjdCB2NGwyX2RldmljZSAqdjRsMl9kZXYsDQo+PiAgICAg
ICAgICAgICAgICBnb3RvIGVycm9yX21vZHVsZTsNCj4+DQo+PiAgICNpZiBkZWZpbmVkKENPTkZJ
R19NRURJQV9DT05UUk9MTEVSKQ0KPj4gKyAgICAgZW50aXR5ID0gJnNkLT5lbnRpdHk7DQo+PiAg
ICAgICAgLyogUmVnaXN0ZXIgdGhlIGVudGl0eS4gKi8NCj4+ICAgICAgICBpZiAodjRsMl9kZXYt
Pm1kZXYpIHsNCj4+ICAgICAgICAgICAgICAgIGVyciA9IG1lZGlhX2RldmljZV9yZWdpc3Rlcl9l
bnRpdHkodjRsMl9kZXYtPm1kZXYsIGVudGl0eSk7DQo+IA0KPiBUaGFua3MgZm9yIHRoZSBwYXRj
aC4NCj4gDQo+IEluc3RlYWQgb2Yga2VlcGluZyBhIHNob3J0aGFuZCBmb3IgZW50aXR5IGxvY2Fs
bHksIEknZCBqdXN0IHJlZmVyIHRvDQo+ICZzZC0+ZW50aXR5LiBJdCdzIG1vcmUgc2ltcGxlLCBh
bmQgZ2V0cyBhd2F5IHdpdGggb25lIHBhaXIgb2YgI2lmIC8gI2VuZGlmDQo+IGFzIHdlbGwuDQoN
CkhpLA0KDQpJIHRob3VnaHQgYWJvdXQgdGhhdCBhcyB3ZWxsLCBidXQgY29uc2lkZXJlZCB0byBt
b2RpZnkgYXMgbGl0dGxlIGFzIA0KcG9zc2libGUgdGhlIG9yaWdpbmFsIGNvZGUuDQoNCldpbGwg
c2VuZCBhIHYyLg0KDQpFdWdlbg0KDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gU2FrYXJp
IEFpbHVzDQo+IA0KDQo=
