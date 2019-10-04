Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A109CB6BB
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 10:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387525AbfJDI5W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 04:57:22 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:22706 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387413AbfJDI5W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 04:57:22 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: GYVcn7c6QtDxUMJSkErOYx/SLZ7y7NfcYGfeDNCELxFTxVfevGh4l7Y3qQcUHuGyxT2vnuQn26
 n6HQSRWEqDNb5aq0dFw4MQMQzRc7y5yDd2kV6mshUv/wcPdS8U9Rb2IwHnOL4nEuycqcaJ1zjW
 oskW5yYDrWr6hQMDTkGbNXrYjMHyuDWoeMfhZLldYOSBmGvE6uAW0PZ4JfP/CKZFXnT9sAfKBj
 jkIyl4hZ8wGlqhztsaN569QPlQJUTgsUrEI+QShVA9qSNcLHM5Ib/BBp0wX1/yGMXx0No2yCZB
 +KU=
X-IronPort-AV: E=Sophos;i="5.67,255,1566889200"; 
   d="scan'208";a="51505268"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2019 01:57:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 4 Oct 2019 01:57:12 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 4 Oct 2019 01:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPKeSagVwZT5VGM/XLZLBJ4Ospr5TWR1GYjgShgaqWz7H7LLt9AZxLtHR4QGoDkFN7cUScoYAoBZD+XAYM8p2VheXmH4a6YL3GRESjx1aan1DRRJAwei+ywKOC7LkZ42haoHOz6mxpHTtZPz/CNOe+FQKgtkXZ7PS4na+qYVxHT6Bk8nnjXv2c/2rXTvv71KrcQ5GvwuG+ixt0t8EmboMhyOLyNDmZWtQX37DmK0BHbsNDC60oPWcMHBg3CnNuNe7l8FaI8sUfHewaYcxBEh+ZRQvhYe026wXMY3I6yI9l5DJMrlzxJCnlUr0BfrdEwfMXDioy4Yty6CvGg3MEuCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93jieOK0oiyW69jHc/RHKvbaEWfpq4faYVAasJXS/H0=;
 b=McjmvETKfYofkyb8ZJDRLs0lT6ULCB3S4IgXBYfBLzNFzNofsfdAR11fJFs+0i9Fd/kwe0SoKx4oMnzaf/wVVa1eNcOSYdEB4uOWtFE+0AjdDnaFdiU4hWUPAU98oruo/i/xerKkeU3/ssItIspmrEd6ThsHRNbQ5fHVHDyR94//9eeIvcPV7MmBUB/bDJ4UQCJF9hXgk4SkguBkXV8j6hXJ2eN+jF+zAtStiwG2us7kHunQKE8fbToKOD2oWQ0mNM/sWRjxVbaWZ8k1t1ONWfawciCYQC5Z5dZysoMDy1GDNe0zzFZ2M66++CTyOubPFbZ0LauvEW/PV9QNMuC/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93jieOK0oiyW69jHc/RHKvbaEWfpq4faYVAasJXS/H0=;
 b=Cy5hIzxuxbbSoc3BwnI8KWqle+/5MJKz80uGu8zgtLNho1faroxfnhc74qIOCX7FqNCaznBm0jPbCpF0bY+GvNJxr7wY3yyWQQG8uiADgO56gTMEd/eLV1WV8VVBALZbsqUqSPmvpmng8XZoB95rQT65uXMQt76Gzc6H3Q6S0aI=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1611.namprd11.prod.outlook.com (10.172.36.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 08:57:11 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4%10]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 08:57:11 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <yzhai003@ucr.edu>, <linux-media@vger.kernel.org>,
        <zhiyunq@cs.ucr.edu>, <csong@cs.ucr.edu>
Subject: Re: The potential uninitialized variables used in function
 isc_interrupt()
Thread-Topic: The potential uninitialized variables used in function
 isc_interrupt()
Thread-Index: AQHVemDqSu6Wg36LbEyXvRwA7qMb36dKLRIA
Date:   Fri, 4 Oct 2019 08:57:11 +0000
Message-ID: <d72f782f-bf4f-be32-e839-70df074ecd41@microchip.com>
References: <CABvMjLQGfNgp4tfV3WQ9CFf57-CN6s5eu1V5ymBPsxEBD3si8g@mail.gmail.com>
In-Reply-To: <CABvMjLQGfNgp4tfV3WQ9CFf57-CN6s5eu1V5ymBPsxEBD3si8g@mail.gmail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0194.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::24) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191004115130403
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbc44117-a04c-497f-510e-08d748a8d7cf
x-ms-traffictypediagnostic: DM5PR11MB1611:
x-microsoft-antispam-prvs: <DM5PR11MB161157621AC6B215457B23DEE89E0@DM5PR11MB1611.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(376002)(39860400002)(346002)(136003)(199004)(189003)(66446008)(66946007)(66476007)(229853002)(66556008)(186003)(64756008)(2906002)(478600001)(476003)(2501003)(6116002)(3846002)(86362001)(71200400001)(36756003)(71190400001)(446003)(316002)(6512007)(81156014)(81166006)(8936002)(6436002)(14454004)(8676002)(6486002)(11346002)(31686004)(110136005)(31696002)(486006)(6246003)(99286004)(2171002)(66066001)(76176011)(2616005)(256004)(4744005)(5660300002)(25786009)(7736002)(26005)(53546011)(386003)(305945005)(102836004)(6506007)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1611;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a0GiFzufxUsSNzbse/yCffsmaqn9S8N5LwAphLudLIKfAmKbXKTWcp8B0c5tuhbIAUbMjIvsAvCUeSFf3dx06j7L2dz42cEcFCoAmwhtFXP2bVkPWiSvRIi6iz0Yug8Vpu+B5AgV0qOxRbW2f66+STMsQ9cySsO36yJVXYsWO2aZFFjRmwRFvpNWbyS4fs5TwevwsKbHR5qhGBCo+/F7HVj22j2L3f+YHvB9rVBoQjQOgem1QNPiW24Zxn+ew7zNWQgrIm5c3LxpIe0wu/umzYETN26k34GSubbbQyFxj5EEJUanKrdJ/7DTEBDiRo1CWSud+DY0QMEyGpfmv3C8y3KHftduLlG4guOZHiHW61+NfO+EWR9jc87Mr1V93g7m7S3Y4B4dVrh/b7TJKZJp7nbag04hzhwei0taEFrPC3Q=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBEE164549FCCD46BCDCEACDD493D58D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc44117-a04c-497f-510e-08d748a8d7cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 08:57:11.1277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PiG61ssApKOjpPt1we0WMC6mFp6OBLQQ7aSFc948Xf3vrRp/PIs4d78AwrrYGmC0wEDiCBzhTEVYjMDrgegxEE4t44U2oo6EJgqqVXexMfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1611
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDA0LjEwLjIwMTkgMDY6MDcsIFlpemh1byBaaGFpIHdyb3RlOg0KPiBIaSBFdWdlbjoN
Cj4gDQo+IEluIGZ1bmN0aW9uIGlzY19pbnRlcnJ1cHQoKSwgdmFyaWFibGUgImlzY19pbnRzciIg
YW5kICJpc2NfaW50bWFzayINCj4gKGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwt
aXNjLWJhc2UuYykNCj4gY291bGQgYmUgdW5pbml0aWFsaXplZCBpZiByZWdtYXBfcmVhZCgpIGZh
aWxzIGFuZCByZXR1cm4gLUVJTlZBTCAuDQo+IEhvd2V2ZXIsIHRoZXkgYXJlIHVzZWQgdG8gZGVj
aWRlIHRoZSBjb250cm9sIGZsb3cgbGF0ZXIgaW4gdGhlIGlmDQo+ICAgc3RhdGVtZW50LCB3aGlj
aCBpcyBwb3RlbnRpYWxseSB1bnNhZmUuDQo+IA0KPiBXZSBjYW5ub3Qgc2ltcGx5IHJldHVybiAt
RUlOVkFMIGluIGlzY19pbnRlcnJ1cHQoKSBiZWNhdXNlIGl0IGlzDQo+IG91dCBvZiB0aGUgcmV0
dXJuIHR5cGU6IGlycXJldHVybl90Lg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHRpbWUgdG8gY2hl
Y2sgdGhpcyBjYXNlLg0KPiANCg0KSGkgWWl6aHVvLA0KDQpUaGFua3MgZm9yIHlvdXIgaW5zaWdo
dHMuIFRoZSByZWdtYXBfcmVhZCB3aWxsIHJlYWQgZGlyZWN0bHkgZnJvbSANCmhhcmR3YXJlIGJs
b2NrIHJlZ2lzdGVycyAuIElmIGl0IGZhaWxzLCB0aGVuIGl0J3MgYSBiaWcgaGFyZHdhcmUgDQpw
cm9ibGVtLCB3aGljaCB3aWxsIGxlYWQgdG8gYSBsb3Qgb2YgY3Jhc2hlcyBhbnl3YXkuDQpJZiB5
b3UgZmVlbCB3ZSBzaG91bGQgaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGVzIHRvIGEgc2FmZSB2YWx1
ZSwgSSBoYXZlIA0KcGVyc29uYWxseSBub3RoaW5nIGFnYWluc3QgaXQuDQpPdGhlciBwZW9wbGUg
b24gdGhlIG1haWxpbmcgbGlzdCBoYXZlIGEgZGlmZmVyZW50IG9waW5pb24gPw0KDQpUaGFua3Ms
DQpFdWdlbg0K
