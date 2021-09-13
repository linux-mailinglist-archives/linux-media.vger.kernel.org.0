Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF414088FA
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 12:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238497AbhIMK2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 06:28:02 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:50438 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237875AbhIMK2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 06:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1631528806; x=1663064806;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BhMVc1S9HCvU/2gb6+am2yCoh6f9g7SQ6oX2uCbN4/4=;
  b=S9kkDkPjOuRHoaq8ZrJu/c/KQjI7+8K8PfHQ/y2zY7hX6ZwhGatdLIAK
   SOrAVyic0Vr4eAcGPitzU41g6f7GSf7Gjj0Im9r9Y1KmS/MHngmJUga+Y
   4IPewJaA5GbVCtNBkrXA66YI9QMn2lUhjKR97M4C53lVJKUZr3t0SxuAp
   oRa2tARO2r0zHObP3Ov6KfuvtCG578k1Wz7iFm37mwVLzbdRLedIqlUfG
   cJPFnf6veWejj9Zj7i65Qarr0Uy9JXqHPbAY3d+kPERR0dlpyMfaGAzPp
   H5zfnVUPXAc9otIlKu4/SI9G5IaMJzNbBneZZS3VLWl/KRx2129z2HkZZ
   Q==;
IronPort-SDR: CnJtr3y3wfJ392Hrmw8S/nSl7KE9vP8XEEv//otZj87wCeaOD8HovnPjuGeqnM4si96VZlLbnY
 a/h24N4uYB70WEA/jDZsmjTXeLBhcEH+O7KvryV6W333OdtqVI/JnWujGeh5D3SXOHaZL4wB4r
 DMU+FBK0NTXKzkXdWFs8flK/jTFnty2/lknVfSMgfp5cSj2hRaRWV0H8yovb5Ugb0DX/zh4ftA
 x2G9cblJpmerSF50YoRlp0I/5fY2UiAGuDHhzDamM6rxRDkgVT+R7ycjQM7ngSY3WtYtjrujbQ
 Oxdnx8VvLiEBc7xWw4NoffKH
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; 
   d="scan'208";a="131596097"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Sep 2021 03:26:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 13 Sep 2021 03:26:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Mon, 13 Sep 2021 03:26:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUiXK31ET6Op7J27ior/iCjJ4l1J8+rwU4zk2v1+sSB6GCNnKix75eXt15Dqgp/Z6VpZv2VIRabkH7JInVxqe0BPYa55ZOlgZ2+aoxkfOEVjcWLEQeTwxk0yIpKbSKm4gZVUPyph9zyYxy5EHs8L7ngrCNKFJonfH3pKXpYTE+EdacKeKyeKEksCH/9deq+9JYPWaM66D35JTkhxVR1k7kwUt325g3tCLCA4EY7XcwPMud7y8SLSNEZRkiJHas1JZuvZSmwF/MHD7EjAQ2tCIm5OEEiuTDymZachPP9Lka89q+/ooAiq8dieND+IvwnpEiAtOGKDEWyqPAYi0/MKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=BhMVc1S9HCvU/2gb6+am2yCoh6f9g7SQ6oX2uCbN4/4=;
 b=MjkKZfLXlaXyVBISYVFRACif1RBRfpL+14dxhgE2RP+nDYxWhs7unDIUy8uSqw4oBCR6x42CfXrBtsrDDdhWzfWDZ6S9wztWYrzwO+DaX39ewWa+k05zyn64GpsMZTvy6DV4HKoONSAzZLjW5P9KKd8X0X6Gw35I22FlpUjaeP1l7wlqo7EDC/pZVK8JjA2aZCkLgnGnBfMrz9oAIJFboD0PkQa24hu2pWOC2I+CHvGa6LEU2UFc/Hr1NH+g6A6y5oZfnG/irEoyNasOtA3lEeU8dKq+Ou8hCIC2VtYx/BbBn8/X4QODoUpfUXttKfdAHXyZ4i3AsR7iYBAnAyl85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhMVc1S9HCvU/2gb6+am2yCoh6f9g7SQ6oX2uCbN4/4=;
 b=WMdLrNsB2KZT16wut/HvFpReVVhWBF28C1ey9lJFzLsrZfdmEIRoAjnVDLuWZWksZrGQtkd1VmoHhrpeubnuFuVP3w3E6nk3DsNdUb8FkplN15BtnJ5aYC/nl43EyxEevMiTIWxs9gHqaJnJ+jvfzuc+dF5Sz//B0o63e0CjaBI=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB4147.namprd11.prod.outlook.com (2603:10b6:405:80::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 10:26:43 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::c5c0:630e:5d91:342b]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::c5c0:630e:5d91:342b%6]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 10:26:43 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <mchehab+huawei@kernel.org>
CC:     <Jonathan.Cameron@Huawei.com>, <linuxarm@huawei.com>,
        <mauro.chehab@huawei.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <mchehab@kernel.org>,
        <Nicolas.Ferre@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 08/25] media: atmel: properly get pm_runtime
Thread-Topic: [PATCH 08/25] media: atmel: properly get pm_runtime
Thread-Index: AQHXQZL+MGs0ijyAgUSZwiGLPkSbCarUy5mAgDhgXQCAAAmegIAAJ7wAgIoKzgCAAAMCAIALJWwA
Date:   Mon, 13 Sep 2021 10:26:43 +0000
Message-ID: <8c7d26ce-e646-aaf7-15ab-6f047425161e@microchip.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <975645970144b6c8401ab9bd1243619978a868a9.1620207353.git.mchehab+huawei@kernel.org>
 <20210505130835.000006b7@Huawei.com>
 <cd524923-93f0-e15c-816f-595a80184206@microchip.com>
 <20210610113827.57db9e77@coco.lan>
 <e25d024e-4fa6-dd67-b97a-1d2640f2b560@microchip.com>
 <20210906100310.4891fa2c@coco.lan>
 <1b480d13-3575-b486-e5dc-df08b50e4225@microchip.com>
In-Reply-To: <1b480d13-3575-b486-e5dc-df08b50e4225@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fb63005-f8f4-434f-0b0c-08d976a0fb3e
x-ms-traffictypediagnostic: BN6PR11MB4147:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB4147F31EEA57FABB6339F718E8D99@BN6PR11MB4147.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fom1bauI4Q86pSYYRrobVH7lZ86otDYWm2+FFHUEu9hkrGgos6O53b/zC5wKsBUvFaK7gNDuFRW0/GfJ/q6PIgCRAwGzuKNgKFMXuXNPFk663jXFS7M11z2pyPbNgN9ZRBdidQ5tW5Gnkmjng3picgsI3e0E0Rp3NMiBRRAkggClWWOdIbG0+ZxAjLS3eOGeJpfkSsSKfDxsNt7JuSghs76raRK5vGiqj086IRlGWrSDPhPUeGV5YqgIly9utBPML8oJny9wnoCh9AEb56FJIrM98N4D+7EjMgNRsA+GDOOghA/gFiuT+zzVGZamNJeB1dcQ/pM6h/b5OewjJEslRq+1Hj4IHaoD0wLqCYEC6pWjR0FV9ImI580UuLdJq5xNqfLam4AE6PuDVmmKP73rqZ1IB4Pkcz35FndIqjgqXSLxGGZDTJUcmAfpldntbZG9Uch8hgMc//A66vmr6PzgM7C7v5fo0b7gbP1rHtC0zbu1zdcjXxSQQEB+47KK/p0ioGtwZj1qlmNlfpwXB2FyLlV4WYWj62DlVSyBSR/q8teHA437WHeK7BoWBQM6O/7l53iumjiaveASujvJW5hBXY6xPvYpnlBAvXFsScd6hO6jPYyVV1l0dAaOB4nxpN7ilNPaUGTkQ+voq8QXTYGZ0qJfUwwVTe9ZwCvaalYYs1KSSjstTXSFS8foe4Gj8aOjRs2UJIdyxe8e+jGRNsjoZiljILzcZfgg+1Bl3zdBqiVUjdOuqEGNXycRcWSXSMR44sjSzrhb5Ax4+a0ZV6XV14Vjfmau+cu2o+27JGx5TfUM+sSOVe/x02XSFh64YwSObqx6nKspRX3MqgIl0v+RjqXPUB5808mBK/ZwGySadOI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(396003)(136003)(346002)(31696002)(4326008)(91956017)(38100700002)(122000001)(38070700005)(86362001)(71200400001)(8936002)(53546011)(6506007)(31686004)(5660300002)(76116006)(36756003)(66446008)(64756008)(54906003)(6486002)(26005)(66946007)(478600001)(2906002)(8676002)(83380400001)(2616005)(186003)(316002)(107886003)(966005)(6512007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2RHWlFxS2JFRzJwNlVsaDZlUHFqTjNla0VFUUdnSmp1U0cvSk9zMkhIL3oz?=
 =?utf-8?B?M2U5clZyZ3ZwZmh2L0dVV3JUcTJIZDN0enVlWnJDT0tYNGluNU9YdWg1Vnhu?=
 =?utf-8?B?aHJSVllmQkdseU8yWml4TkhpcXZ6R3B1ZysrQlo5YXNZQUFPVmg3a002WXZt?=
 =?utf-8?B?dEFNLzZIM1RGbFNxWmdxU09vWm40ektEMTR2NFp6RkxmZDljM0xQVVJLeUVQ?=
 =?utf-8?B?ZXhQOEN5Q3dzRy9NQk9DL1I0OVUySXdxcHhyZzhrZzZ3Q0xROXBBZXVQWWVx?=
 =?utf-8?B?ZUVKQW1KN1htSVhDeGMxS3o4K1EremFFSTNzWGpBTzNobkhMcUlscnRhemk5?=
 =?utf-8?B?MnBwUCtqVnZKUG1LcC9TTUxCT3hyOWNOWnJIbFBCRkdZa1YydU92QzFucnl6?=
 =?utf-8?B?bVBXWkVPSU5DWlZ0NUNjb25TQkwrUVBsazBGVGZBeDJqVUR5OW5IS1ZJejBl?=
 =?utf-8?B?WEFOSlIrS0R5RnBDZ0cvR3FjNlJ1ZzJqNm0wTmR0WkdZdXlhL3Zjb292NVFQ?=
 =?utf-8?B?QmN4M2ZRdTFMem04aEZGRE1ndXUzTHFHVmRWOTkvMGk0b0d4L2NyMENHYXd6?=
 =?utf-8?B?SEVBQWV2SWU4Z29uaUJ1QnlnTkQvNjdiaTIrTzVQTStlSjdzWTV6Q2VVOGVm?=
 =?utf-8?B?V1czM3VBMEI3MTR1YWVoUEowaDJkQk1vV0pkQWc4OHlQcmxVaGp6eSt6SXlO?=
 =?utf-8?B?Rk1xNXcyQUVGdStlVG1mL3l1Wm5GMXNGMU41UncrY1h0K0J2RVJCWUZmekYx?=
 =?utf-8?B?RS9LQ01EdUJQNUpEcmVmNnQzdzlkMFhacXJjeWVaanhSWEpHNFQxVnNTa3ow?=
 =?utf-8?B?WjJudndmT0llTGovbVJPQ3llQkNBWU81SU9hOFJPa0NBY3psS3AvUERkR3lI?=
 =?utf-8?B?dlFzeE9jMElQUVFFQm5SMGY2WHdZeGVxYjV0SHluMkdyRUNwS25laHlPdUth?=
 =?utf-8?B?Slc5MVFoMVhFRUtEWnJzeVVIYWJUa0lMRk5BOFdBcFdhdzV0dDVuOU9LMjcx?=
 =?utf-8?B?VXdpVlVrbU0zZzdFeTF4c1VyQjlpaHBxc25sWTdHMTZOa3NPdTRrSVZCcEdT?=
 =?utf-8?B?YmlVVVJ6dUt4NE90V0ZVWjdKdGh5R3ZUV3piYkhxUlV4cWUwTkJrZVBWb3FY?=
 =?utf-8?B?aUZ0Wnc3Z2pKTCtVTVM5NUZJVlhtcG15M2xaUWZseVZwYXJGTFJpcklrcVFj?=
 =?utf-8?B?S2NIL0QweVYxNGp0clJiZWtpenkrSmRTOGdoUGNUdTFhRk1vZmxVSm1UMStm?=
 =?utf-8?B?aDdDUDBnNmtObHlBYWJGbzNYVTdMd0RSOWdaVU1qdFpheTRuWlFHNWpiQkcw?=
 =?utf-8?B?T2xKQXF1dnZPWjRwZ3gyd0pQK3lzYVhjdWNvRHkxSHNudENrd0Z2TkpZODBF?=
 =?utf-8?B?bFFqVkF3T25zOG0yc05pZVZFbnIwbmY5TVUwRmxXUWZBbHVnQ2xYU296STJ5?=
 =?utf-8?B?LzY2NWRBaG9ld0dhYVJQSnl4cW03SjNCVFhiRE9wWGFYdkluTU1xUS85VHRw?=
 =?utf-8?B?TDdYU1hmQWZKWngzZmg2eDFDY0dWOXhtNGpjbTVZQXlCamh1SEZaMEErc1B3?=
 =?utf-8?B?U0c2Um5KVDZObVljc0N2R2pVc2xtWGlFTzYrY1pOcVNLVitJbWVGOTBWRm16?=
 =?utf-8?B?Ung2UEY1M0FLVFdXMGpnM21PVk05T0pYSGlMQm5GbTFRTjBMZjRHRUtPU3Z6?=
 =?utf-8?B?Y3pId1dEZEVpVjlMbnpoRzh3SWlCQVZXU3FSUmliZmZ6RjlDcTQvTEwxcUY5?=
 =?utf-8?Q?+v5BSLLFS4zH2I0/zE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6698D645F37ACD4082B65853B2F91344@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb63005-f8f4-434f-0b0c-08d976a0fb3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 10:26:43.0542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rXfXr4apdAp3mQxh3HFwJH0zm1smMYBKgU2M9NE13OisZFNmjnISMfLD6K+KKNzKPBLOKoxB4zvjlUCNfbHS4RySCUwbxwIiPQqDEfNcxYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4147
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gOS82LzIxIDExOjEzIEFNLCBFdWdlbiBIcmlzdGV2IC0gTTE4MjgyIHdyb3RlOg0KPiBPbiA5
LzYvMjEgMTE6MDMgQU0sIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToNCj4+IEhpIEV1Z2Vu
LA0KPj4NCj4+IEVtIFRodSwgMTAgSnVuIDIwMjEgMTI6MDA6NDIgKzAwMDANCj4+IDxFdWdlbi5I
cmlzdGV2QG1pY3JvY2hpcC5jb20+IGVzY3JldmV1Og0KPj4NCj4+PiBPbiA2LzEwLzIxIDEyOjM4
IFBNLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6DQo+Pj4+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPj4+Pg0KPj4+PiBFbSBUaHUsIDEwIEp1biAyMDIxIDA5OjA0OjA3
ICswMDAwDQo+Pj4+IDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20+IGVzY3JldmV1Og0KPj4+
Pg0KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1l
bC1pc2MtYmFzZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFz
ZS5jDQo+Pj4+Pj4+IGluZGV4IGZlM2VjOGQwZWFlZS4uY2U4ZTEzNTFmYTUzIDEwMDY0NA0KPj4+
Pj4+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMN
Cj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFz
ZS5jDQo+Pj4+Pj4+IEBAIC0yOTQsOSArMjk0LDEzIEBAIHN0YXRpYyBpbnQgaXNjX3dhaXRfY2xr
X3N0YWJsZShzdHJ1Y3QgY2xrX2h3ICpodykNCj4+Pj4+Pj4gICAgICBzdGF0aWMgaW50IGlzY19j
bGtfcHJlcGFyZShzdHJ1Y3QgY2xrX2h3ICpodykNCj4+Pj4+Pj4gICAgICB7DQo+Pj4+Pj4+ICAg
ICAgICAgICBzdHJ1Y3QgaXNjX2NsayAqaXNjX2NsayA9IHRvX2lzY19jbGsoaHcpOw0KPj4+Pj4+
PiArICAgICBpbnQgcmV0Ow0KPj4+Pj4+Pg0KPj4+Pj4+PiAtICAgICBpZiAoaXNjX2Nsay0+aWQg
PT0gSVNDX0lTUENLKQ0KPj4+Pj4+PiAtICAgICAgICAgICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMo
aXNjX2Nsay0+ZGV2KTsNCj4+Pj4+Pj4gKyAgICAgaWYgKGlzY19jbGstPmlkID09IElTQ19JU1BD
Sykgew0KPj4+Pj4+PiArICAgICAgICAgICAgIHJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9n
ZXQoaXNjX2Nsay0+ZGV2KTsNCj4+Pj4+Pj4gKyAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4+Pj4+ICsgICAgIH0N
Cj4+Pj4+DQo+Pj4+PiBIaSBNYXVybywNCj4+Pj4+DQo+Pj4+PiBXaXRoIHRoaXMgcGF0Y2gsIHRo
ZSBJU0MgaXMgYnJva2VuIG9uIGxhdGVzdCBtZWRpYSB0cmVlLiBJdCBsb29rcyBsaWtlDQo+Pj4+
PiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0IGZvciB0aGUgSVNDX0lTUENLIGNsb2NrIHJldHVy
bnMgLUVOT0FDQ0VTUyBhbmQNCj4+Pj4+IHRodXMsIHRoZSBwcm9iZSBvZiB0aGUgZHJpdmVyIGZh
aWxzOg0KPj4+Pj4NCj4+Pj4+IGF0bWVsLXNhbWE1ZDItaXNjIGYwMDA4MDAwLmlzYzogZmFpbGVk
IHRvIGVuYWJsZSBpc3BjazogLTEzDQo+Pj4+PiBhdG1lbC1zYW1hNWQyLWlzYzogcHJvYmUgb2Yg
ZjAwMDgwMDAuaXNjIGZhaWxlZCB3aXRoIGVycm9yIC0xMw0KPj4NCj4+IFdoYXQncyB0aGUgY3Vy
cmVudCBzdGF0dXMgb2YgdGhpcyBpc3N1ZT8NCj4gDQo+IEhpIE1hdXJvLA0KPiANCj4gQ3VycmVu
dGx5LCBhcyBmYXIgYXMgSSBrbm93LCB0aGUgSVNDIGlzIGJyb2tlbiBpbiA1LjE0IGFuZCBjdXJy
ZW50IExpbnV4DQo+IG1hc3Rlci4gSSBwbGFuIHRvIGludmVzdGlnYXRlIHRoaXMgaXNzdWUgdGhp
cyB3ZWVrIChvciB0aGUgbmV4dC4uLiksDQo+IHRvZ2V0aGVyIHdpdGggc29tZSBvdGhlciB0aGlu
Z3MuIEkgd2FudCB0byB0cnlvdXQgdGhlIFBNIHBhcnQgb2YgdGhlDQo+IGRyaXZlciB0byBzZWUg
d2hlcmUgaXMgdGhlIHByb2JsZW0uDQo+IFdoZW4gSSBjb21lIHVwIHdpdGggYSBmaXggb3IgcGF0
Y2gsIEkgd2lsbCBzZW5kIGl0IG9uIHRoZSBtYWlsaW5nIGxpc3QuDQo+IElmIHlvdSBoYXZlIGFu
eSBpZGVhcyB0aGF0IEkgY2FuIHRyeSBtZWFud2hpbGUsIGZlZWwgZnJlZSB0byBjb250YWN0IG1l
DQo+IHRvIHNlbmQgYSBwYXRjaCB0aGF0IEkgY2FuIHRlc3QuDQo+IA0KPiANCg0KSGkgTWF1cm8s
DQoNClJlZ2FyZGluZyB0aGlzIGlzc3VlLCBJIHNlbnQgYSBwYXRjaCBvbiB0aGUgTUwgdGhhdCBz
aG91bGQgc29sdmUgaXQuDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3Qv
bGludXgtbWVkaWEvcGF0Y2gvMjAyMTA5MTMxMDIyNTQuMTA4NjM4LTEtZXVnZW4uaHJpc3RldkBt
aWNyb2NoaXAuY29tLw0KDQpFdWdlbg0KDQo+IEV1Z2VuDQo+IA0KPiANCj4+DQo+PiBJZiB0aGUg
YnVnIHN0aWxsIGhhcHBlbnMsIHdlIG5lZWQgYSBmaXggZm9yIGl0Lg0KPj4NCj4+IFdlIG1pZ2h0
IHJldmVydCB0aGlzIHBhdGNoLCBidXQgdGhpcyB3b3VsZCBqdXN0IGJlIG1hc2tpbmcgc29tZSBv
dGhlcg0KPj4gaGlkZGVuIGJ1Zy4NCj4+DQo+PiBSZWdhcmRzLA0KPj4gTWF1cm8NCj4+DQo+Pg0K
Pj4NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gQ291bGQgeW91IHBvaW50IG91dCBob3cgSSBjb3VsZCBm
aXggdGhpcyA/IE1heWJlIHRoZSBpc2NfY2xrLT5kZXYgaXMgbm90DQo+Pj4+PiBwcm9wZXJseSBo
YW5kbGVkL2luaXRpYWxpemVkIGluIHNvbWUgb3RoZXIgcGFydCBvZiB0aGUgY29kZSA/DQo+Pj4+
DQo+Pj4+IExvb2tpbmcgYXQgUlBNIGltcGxlbWVudGF0aW9uOg0KPj4+Pg0KPj4+PiAgICAgICAg
ICAgIHN0YXRpYyBpbnQgcnBtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBycG1mbGFn
cykNCj4+Pj4gICAgICAgICAgICB7DQo+Pj4+IC4uLg0KPj4+PiAgICAgICAgICAgIGlmIChkZXYt
PnBvd2VyLnJ1bnRpbWVfZXJyb3IpDQo+Pj4+ICAgICAgICAgICAgICAgICAgICByZXR2YWwgPSAt
RUlOVkFMOw0KPj4+PiAgICAgICAgICAgIGVsc2UgaWYgKGRldi0+cG93ZXIuZGlzYWJsZV9kZXB0
aCA9PSAxICYmIGRldi0+cG93ZXIuaXNfc3VzcGVuZGVkDQo+Pj4+ICAgICAgICAgICAgICAgICYm
IGRldi0+cG93ZXIucnVudGltZV9zdGF0dXMgPT0gUlBNX0FDVElWRSkNCj4+Pj4gICAgICAgICAg
ICAgICAgICAgIHJldHZhbCA9IDE7DQo+Pj4+ICAgICAgICAgICAgZWxzZSBpZiAoZGV2LT5wb3dl
ci5kaXNhYmxlX2RlcHRoID4gMCkNCj4+Pj4gICAgICAgICAgICAgICAgICAgIHJldHZhbCA9IC1F
QUNDRVM7DQo+Pj4+IC4uLg0KPj4+Pg0KPj4+PiBJdCBzb3VuZHMgdGhhdCBSUE0gaXMgZGlzYWJs
ZWQgZm9yIHRoaXMgY2xvY2suIERpZCB5b3UgY2FsbA0KPj4+PiBwbV9ydW50aW1lX2VuYWJsZSgp
IGJlZm9yZSBjYWxsaW5nIGlzY19jbGtfcHJlcGFyZSgpPw0KPj4+Pg0KPj4+PiBUaGFua3MsDQo+
Pj4+IE1hdXJvDQo+Pj4+DQo+Pj4NCj4+PiBJIHRyaWVkIHRvIGNhbGwgcG1fcnVudGltZV9lbmFi
bGUgZm9yIHRoZSBjbGsgYXQgY2xrX2luaXQgdGltZSwgYnV0DQo+Pj4gZG9pbmcgdGhhdCBtYWtl
cyB0aGUgcnVudGltZSBmb3IgdGhlIElTQyBmYWlsIGxpa2UgdGhpczoNCj4+Pg0KPj4+IGF0bWVs
LXNhbWE1ZDItaXNjIGYwMDA4MDAwLmlzYzogVW5iYWxhbmNlZCBwbV9ydW50aW1lX2VuYWJsZSEN
Cj4+DQo+Pg0KPj4NCj4+IFRoYW5rcywNCj4+IE1hdXJvDQo+Pg0KPiANCg0K
