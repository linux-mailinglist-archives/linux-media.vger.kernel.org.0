Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D732C44D459
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 10:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhKKJwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 04:52:16 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:13222 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhKKJwP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 04:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636624166; x=1668160166;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=38XHGyn6wqPj+wjNz2Kv9iuu2sK+8M2EhFZf340oHg4=;
  b=z7Q7/f2/tG1YTDcu0lkZLO3GyEa4XWFpjk2PP/7B+1BoVlJbi38jdzPr
   QCWtMfE6BJoTqOLPuGeeQA+SWkyJe2cox5k3fk0ht1zSrUrFkbsmcW5xT
   u+D7Lz2SoreOBP9EBstXtBo558z447yjltN+DkLRPLXPeCMG+kXTsHn5g
   R1aCQ85K+4R6nE9fmudF0Z454FVPFAnIxgViZ1hOMyE9q2E9JLE4lCsFc
   4WSSMicyYPZKqLSas0Qkz+9xd9VUKT++hu7hQRiSN773IwyWhWDP5THQE
   /pGN2Is+0iEMgMDi/kxRB9v9m9tygXA9Ie+80dnZxxdOuyOBfBD9BuAcd
   g==;
IronPort-SDR: iMM4+LhcuQ2IZzQgqgtfytSRMnIryGi6ve0HWWrHNLXqJ5hgvLvjfS9xN+wdkkiyAntxvKEdMZ
 3TFjMrvTOAjhWDGH8hMBBXjBh+u8qsLZGo8KWO7t/wWn/oZOaZxdzAEmVlzl09A5MHPHZNUuL7
 k/piZD68jCFF8E6H71TFK0egRlV8CnAPjUpaSezY1I2nKUaymw1qYg+ArktVruZyfVsqsqH4Pb
 qrotD0IIfcZ2HHQ9jcvi047Z0/M3trIuJ8n0ZslpNNHnPZeCwqljXlr628cRV8rP87xryc+JLm
 CjgoVFo/oXFhPcK5T5C+3Ory
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; 
   d="scan'208";a="151565127"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Nov 2021 02:49:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 11 Nov 2021 02:49:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Thu, 11 Nov 2021 02:49:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dggULYT7wfcSa+baDiyE6jsfUcOIhb/LQhbEuat6AKxhfuOb1sAjKEI8ZXSCvHe8EHsQ6V+8cz9ou4fyiXiZ4CiDJ3MCD4esUHjuE4dSyjCkontutYCUl6k1CEOVFwQWdR+SKxyrs8kp6OMDZphcZqzhU7QVVjuVVtS7VJrdT0vOLQSBum9mNLZN/RWK0Xdbg1AG/OY1Pr685mFkmNsxBO2W/jEvUYv6KZMPzJ+N1ryjGLlGtcSEcf9MHpDRYo6bFI5laaQFLZIi8/K1Ql0OUU/NXyZKp/LZMZ951dH+vV8HTdia/Gj1OHbnZxnM8I7xly9t0HbHhsUayyG1FWznGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38XHGyn6wqPj+wjNz2Kv9iuu2sK+8M2EhFZf340oHg4=;
 b=If4wUMhkEg6X2zZw5+xenIWiySc+VmKAQfBgNtBnn3bhw5osBCk2w+W6EY+AifqJpDt+WHosXx0a4gBokh4nphn66V8qfdasggBJURtfNS4UxoL+AJ68BeFfmNBBhT+boLZPUFZzeEFRKfscFgVQWUqccRSTmFZN+cbXBri4TJXVvJL5KZK3IGHY6x380T7P6MgyWxRplBODGGOZOdX2PpkjJFCNgiBTOmX2Ec0yqcYeYmbyuXYpDFqe6xSKk5mHcNeBQW5U17rKNk5y+iiNtHqhDxHojS0DsESmC+Yluf7fdJQmd6dqQd4JAc/iW8/J/obhV3wGDu6qr3dAQgZf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38XHGyn6wqPj+wjNz2Kv9iuu2sK+8M2EhFZf340oHg4=;
 b=AZRa1hibMpqE1ac5XZwsMfzlFp16LBJWbrLtnW/jvRaIfoAzHpZ/VEjgJQ3+a4XpHhwKPMkBabXFu0G4vT08A5MHC6qHgW4GuepBBMbptsYWuy1QMcO94nklbIvCIMe+eI1RE5JTHqpubDpuKyAEiorKSvnrDSapgHsZzBspcs0=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN7PR11MB2820.namprd11.prod.outlook.com (2603:10b6:406:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Thu, 11 Nov
 2021 09:49:18 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21%7]) with mapi id 15.20.4690.019; Thu, 11 Nov 2021
 09:49:18 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <jacopo@jmondi.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <robh+dt@kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 11/21] media: atmel: atmel-isc-base: implement mbus_code
 support in enumfmt
Thread-Topic: [PATCH 11/21] media: atmel: atmel-isc-base: implement mbus_code
 support in enumfmt
Thread-Index: AQHXxxoS1Gy/4w2cQESQ0fKslgfHtKv0wBWAgAAHHgCAABQZAIAEu6+AgAAu5YCABG60gA==
Date:   Thu, 11 Nov 2021 09:49:18 +0000
Message-ID: <2980afd7-6dcb-859c-cf53-a62ee5dc09e7@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-12-eugen.hristev@microchip.com>
 <20211105092559.ce6pdm4hwvxkmutd@uno.localdomain>
 <20211105095128.7tu4rm6mogwy2dz6@uno.localdomain>
 <60f0d378-d998-464f-2d95-09db4e889b96@microchip.com>
 <20211108112011.j4wi2z7hcibot6pz@uno.localdomain>
 <75196668-fbcb-1b31-55ce-46e32a3a675d@microchip.com>
In-Reply-To: <75196668-fbcb-1b31-55ce-46e32a3a675d@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2663c1ee-5e3a-47d2-5fba-08d9a4f887b9
x-ms-traffictypediagnostic: BN7PR11MB2820:
x-microsoft-antispam-prvs: <BN7PR11MB2820E3E6D04330C730387DA9E8949@BN7PR11MB2820.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WbKuEn2uZI0Pwa6J+xorCn2wfMLCSJry2t8uABBAbS41b2WsCcrbHRPVlZcfZjD9aNvKAbs2EPd0H/l0z96FpSKAzpboyzGRI4T7W9MQ20mkRiSj+F/7DqEojxsK0ekQbbvKW22eXhYvueaAQUFtoq1e1kObYaprUsz2sccQ69DeCZumUQMJMyuu5YxtADZoTgkRVaSlK7D8H/lF6gn08kAN33wX+hyLGBoOQcydSQZ9W5tQ635OBdlyGiim7+KhoqJDWgnEaj4VWn+nDd7vKI+xGBB/HnWFZwCzeOhQomjjWSSD2newOl4JRb7nPBpVLUhdfQwPwUrnT1k9oKOfMEq7yZOxSZ64z1dwWyK5HHaEW7KS0zgMeeJRcusI9+VOaggNt0uuRwlFO3P2hxqjWIGxBFpuQlZtHXuJ3K1c2P5OIDRoJMi3SSxpB2QN6L0UJKbBiWXx4jLyhIV63kDGx6oZb3W3MRM+ytPf4bWNKHsdDzmuike7UWL1Cx92p86uLTieEcESsqmo2vApN8R9g3tu1TmGvEwhc7mkw/Cxfb7r3nrplvnLkoQYIAkiPhfld8S21xlwIZqA3JKURlR8rBKIVYnyruFnKM7fFPzsX0tmdrYQal5EZP9JwZHW1svMtPjJL99dhrYxUSq/RdJSWRHTzQIkCMYeNJQC4l+wVLoYdAYMVFYvt/7Xws18yLW0J1BhIjCFQsx7E34uNFey4s0A6uYfvHtDvQDixaH0/c9JZwt5aVappInMwU4yE1R4FAp5vLBZoehW5zMwI50Vsw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(71200400001)(6916009)(186003)(6512007)(38100700002)(107886003)(30864003)(26005)(83380400001)(86362001)(54906003)(31686004)(2616005)(316002)(6506007)(2906002)(53546011)(508600001)(66476007)(64756008)(8936002)(66556008)(6486002)(31696002)(122000001)(66946007)(8676002)(66446008)(5660300002)(91956017)(38070700005)(36756003)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzhRa0pZVTAxWndodVVzQmNMVVFwOEl6bTd2U3NMd0J3TW5yaWt5NzdyZHJw?=
 =?utf-8?B?VVRCNWpHdnBLaXBCRmo5VlV6VjFFbTRGc2d4ME82V1g4TEJBMlY0akYyR3RK?=
 =?utf-8?B?Umt0V3pWSUp4V1p4akZjcE1lcXpxekhYODdxc2padmJUamJhUjFTOTFEZm1k?=
 =?utf-8?B?MzRrMzljcDFtdC8wSys0T050U1lFd3dUQzliNGRtVll1NDBZakR3UDJtKy9Y?=
 =?utf-8?B?d0R2UWpRQk45aENXbyt1WnFzWlhOVURCUjQ2M0ZGZkNBU0Z0MDNjR2F4TnZt?=
 =?utf-8?B?bnN1amRMb29LdjB0SUNMQTJ3RnRoQnBhbjAyZzBKejJnQStYaVkxMkZxNy9M?=
 =?utf-8?B?djh3SVZWbDhIUHVKZytmM1VBL1pBVzB5NWVCMEdNeitaR2JwOWpiMWs4Sll0?=
 =?utf-8?B?RkJLVVhCVlFKYXp2UmdsclVvc3JYbGJUVld6MEU0b3pkSHBIYXc3WG1pNHVr?=
 =?utf-8?B?eExrU2RRRDgraWlKc3ZSUEF0Sk94WlRQZU0xWG93YTR0S3o0U2J0QVNkNUpY?=
 =?utf-8?B?YUlZVGlML0NLUFRDYk9mcHVOOVpPclQrR0NBdFM0Y3ArY09CV20rYSt6cGhS?=
 =?utf-8?B?WTU0Q0dheVgvcW9MRkc4M2FVRll1RWdJU0hTV3RDdzYzZEc1SUs3aWR5UWUr?=
 =?utf-8?B?UzJNQzduM01xdjg4Q253QjRicWRaZjErRTR2NU5nd3g1OE9YYnFFcnJCd1JM?=
 =?utf-8?B?THFmaXRoUWlRb3JjK2JnNmdYd0poTE5pYnRpdjVQdCtjdEJ5WTF2aVB1ajc0?=
 =?utf-8?B?ci9NUGVGbVhUZjdValFFRWlDRUo4MmYrYmZnOUhYWE1paWhMSTE1Vi9IblFH?=
 =?utf-8?B?T1E4RTMxR0YyWnhwZlk2MEVpd1BsWWNycDI3U2djSytqTWZ3d1pzVWg2U3pm?=
 =?utf-8?B?R0o3OE9WOGJmeTlIQzBSVHc4WGhSUEh4S1JRcUZuSkNuTnBzbDlnVkRHemVP?=
 =?utf-8?B?YTZlc25GTm9pM0t1Mk9DOEx6NXNnTEl5QjNkdElqOXdEeVArcjVxUk9KS0Iy?=
 =?utf-8?B?VGt2NXRqNUR0bGY3anlHUEJuU2xSOWdnNm0zeXVWMEtuT21HengzbDYvbkFy?=
 =?utf-8?B?WWlMdlJhU25oc3ltQ0NNd3YzZ1BwT3h6cHVtZjA3YWJGSExORVBMcmhRZHkv?=
 =?utf-8?B?aGQ5S2d0aUZLdHhvbzhvbk84ajBwOFhJVjV1dEpMTUtmREhDZForbkZraFNI?=
 =?utf-8?B?OGFHVWRXR3Z1SUJMdlRIbDVLaHFsOHFKM1l2bUNaMjI3ZlBoa05ud3FwRE9T?=
 =?utf-8?B?SWJxeGNrY1BRb3VQd0IrR0R5djBRbWhzYUdXVEt6SSt3aGNQOGxKMVpIM1BT?=
 =?utf-8?B?R1UzRWd5MGQ5YmRoVk8zYWU5RkZIQlpzQkFVb2lvbGtSSTVPSGw0Y0crY3RU?=
 =?utf-8?B?MTlaUmtQUHZvTXhaZTdNTUJlaFp3YjZQenpZbGtsRFdsdll5bE1mYWxocjh5?=
 =?utf-8?B?YWJaSkhrTWFOQ2srYk15SXBkWHNpNkVyVStwVm1iS3dwcEtzMFJ3eFFWQWtQ?=
 =?utf-8?B?Mzk2ZFpWa3JMVXI1UStoQjhOdmUxRE44ZkFCT1FyMThKWGYzUWJpbFdEc3Bp?=
 =?utf-8?B?MVYzNlpZdG0yTE5uYnEvQVZNOUJjTXZHSDNjcStyTEFBZEJ6SXVYQWNYZzZw?=
 =?utf-8?B?MlJoVkVFbHZPMWE2N1UzR1VnOHlMNFdMTjFTTmZpcm1YaldJRkxEU3hTUmZL?=
 =?utf-8?B?RDVvTmhwdlRNL0xBRWRyU1JTZWpDSkNLRlIvaFJJdVNnNDZSK2F4OHFUajYv?=
 =?utf-8?B?eHMxQkgyZmpwbXlvNnBUSXVOU0JqVFUwb2U0Z2JPVlA5SExkVWpKc21LWmJm?=
 =?utf-8?B?MmFZd0pzUUNEOUlDOTRndS9ENVcweDgxTkpMK2R4bnFsSEFkRkpJQ0VzU085?=
 =?utf-8?B?Tlh5eXpaUkYyOGh6NzdSSE5mKzFpbUNjcUlxSzNaNWFkbm12QjhCYlBpWW1a?=
 =?utf-8?B?RllPSkNlU3VZY1Q5Ti84RjFvNjI4bnBwYk1XSGg3UzkxN1dOYmJQcGZYZldB?=
 =?utf-8?B?Qi9sQm9JajFwVXMrdzVMQnpWZFRUN3VZbEFjVDNVanVGZlZsTFk4Z3RoSEMx?=
 =?utf-8?B?RkdBZVZ5OU5zdkJUT0ZFeWNXNDRrVkJtUGJPbGltNlRhSkVGbW5TTzVJRVds?=
 =?utf-8?B?c0VyY2ZhTTBSaDdhRk1sT0hMWTFjemhna2JXNlpoTy9DeVN5SUtIVXBoM0Nw?=
 =?utf-8?B?cmVzZlhobmUyMHN3Y1dnaGdWNHI1bTk4UDVjT0Z4d05GOTNlSldxSk5GWENX?=
 =?utf-8?B?Q1B6U1ZJRU5jVVQzWnBxYTdQWWhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB2B49AF73261A439261FDC0D39D7BD7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2663c1ee-5e3a-47d2-5fba-08d9a4f887b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 09:49:18.4458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTjShcPuSfpLNXY0UM9QXq8xMDfWfqYn6PgZW/XQp4jnrIaugzbJk+hYluq92dzHp1WvoNVE5vtbsY80NLqDzxkK87nBY633dx5h6blSS90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2820
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvOC8yMSA0OjA4IFBNLCBFdWdlbiBIcmlzdGV2IC0gTTE4MjgyIHdyb3RlOg0KPiBPbiAx
MS84LzIxIDE6MjAgUE0sIEphY29wbyBNb25kaSB3cm90ZToNCj4+IEhpIEV1Z2VuDQo+Pg0KPj4g
T24gRnJpLCBOb3YgMDUsIDIwMjEgYXQgMTE6MDM6MjVBTSArMDAwMCwgRXVnZW4uSHJpc3RldkBt
aWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+IE9uIDExLzUvMjEgMTE6NTEgQU0sIEphY29wbyBNb25k
aSB3cm90ZToNCj4+Pj4gSGkgRXVnZW4NCj4+Pj4NCj4+Pj4gT24gRnJpLCBOb3YgMDUsIDIwMjEg
YXQgMTA6MjU6NTlBTSArMDEwMCwgSmFjb3BvIE1vbmRpIHdyb3RlOg0KPj4+Pj4gSGkgRXVnZW4s
DQo+Pj4+Pg0KPj4+Pj4gT24gRnJpLCBPY3QgMjIsIDIwMjEgYXQgMTA6NTI6MzdBTSArMDMwMCwg
RXVnZW4gSHJpc3RldiB3cm90ZToNCj4+Pj4+PiBJZiBlbnVtZm10IGlzIGNhbGxlZCB3aXRoIGFu
IG1idXNfY29kZSwgdGhlIGVudW1mbXQgaGFuZGxlciBzaG91bGQgb25seQ0KPj4+Pj4+IHJldHVy
biB0aGUgZm9ybWF0cyB0aGF0IGFyZSBzdXBwb3J0ZWQgZm9yIHRoaXMgbWJ1c19jb2RlLg0KPj4+
Pj4+IFRvIG1ha2UgaXQgbW9yZSBlYXN5IHRvIHVuZGVyc3RhbmQgdGhlIGZvcm1hdHMsIGNoYW5n
ZWQgdGhlIHJlcG9ydCBvcmRlcg0KPj4+Pj4+IHRvIHJlcG9ydCBmaXJzdCB0aGUgbmF0aXZlIGZv
cm1hdHMsIGFuZCBhZnRlciB0aGF0IHRoZSBmb3JtYXRzIHRoYXQgdGhlIElTQw0KPj4+Pj4+IGNh
biBjb252ZXJ0IHRvLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJpc3Rl
diA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KPj4+Pj4NCj4+Pj4+IFJldmlld2VkLWJ5
OiBKYWNvcG8gTW9uZGkgPGphY29wb0BqbW9uZGkub3JnPg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gVG9v
IHNvb24hIFNvcnJ5Li4uDQo+Pj4+DQo+Pj4+PiBUaGFua3MNCj4+Pj4+ICAgICAgIGoNCj4+Pj4+
DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4gICAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRt
ZWwtaXNjLWJhc2UuYyB8IDUxICsrKysrKysrKysrKysrKystLS0NCj4+Pj4+PiAgICAgMSBmaWxl
IGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+Pj4+Pj4NCj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFz
ZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5jDQo+Pj4+
Pj4gaW5kZXggMmRkMjUxMWM3YmUxLi4xZjdmYmU1ZTRkNzkgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5jDQo+Pj4+Pj4gKysr
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5jDQo+Pj4+Pj4g
QEAgLTQ5OSwyMSArNDk5LDU2IEBAIHN0YXRpYyBpbnQgaXNjX2VudW1fZm10X3ZpZF9jYXAoc3Ry
dWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQo+Pj4+Pj4gICAgICAgIHUzMiBpbmRleCA9IGYt
PmluZGV4Ow0KPj4+Pj4+ICAgICAgICB1MzIgaSwgc3VwcG9ydGVkX2luZGV4Ow0KPj4+Pj4+DQo+
Pj4+Pj4gLSAgIGlmIChpbmRleCA8IGlzYy0+Y29udHJvbGxlcl9mb3JtYXRzX3NpemUpIHsNCj4+
Pj4+PiAtICAgICAgICAgICBmLT5waXhlbGZvcm1hdCA9IGlzYy0+Y29udHJvbGxlcl9mb3JtYXRz
W2luZGV4XS5mb3VyY2M7DQo+Pj4+Pj4gLSAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4+Pj4gKyAg
IHN1cHBvcnRlZF9pbmRleCA9IDA7DQo+Pj4+Pj4gKw0KPj4+DQo+Pj4gSGkgSmFjb3BvLA0KPj4+
DQo+Pj4gVGhpcyBmb3IgbG9vcCBiZWxvdyBmaXJzdCBpdGVyYXRlcyB0aHJvdWdoIHRoZSBmb3Jt
YXRzIHRoYXQgd2VyZQ0KPj4+IGlkZW50aWZpZWQgYXMgZGlyZWN0bHkgc3VwcG9ydGVkIGJ5IHRo
ZSBzdWJkZXZpY2UuDQo+Pj4gQXMgd2UgYXJlIGFibGUgaW4gdGhlIElTQyB0byBqdXN0IGR1bXAg
d2hhdCB0aGUgc3ViZGV2aWNlIGNhbiBzdHJlYW0sIHdlDQo+Pj4gYWR2ZXJ0aXNlIGFsbCB0aGVz
ZSBmb3JtYXRzIGhlcmUuDQo+Pj4gKGlmIHRoZSB1c2Vyc3BhY2UgcmVxdWlyZXMgb25lIHNwZWNp
ZmljIG1idXMgY29kZSwgd2Ugb25seSBhZHZlcnRpc2UgdGhlDQo+Pj4gY29ycmVzcG9uZGluZyBm
b3JtYXQpDQo+Pj4NCj4+Pj4+PiArICAgZm9yIChpID0gMDsgaSA8IGlzYy0+Zm9ybWF0c19saXN0
X3NpemU7IGkrKykgew0KPj4+Pj4+ICsgICAgICAgICAgIGlmICghaXNjLT5mb3JtYXRzX2xpc3Rb
aV0uc2Rfc3VwcG9ydCkNCj4+Pj4NCj4+Pj4NCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOw0KPj4+Pj4+ICsgICAgICAgICAgIC8qDQo+Pj4+Pj4gKyAgICAgICAgICAgICogSWYg
c3BlY2lmaWMgbWJ1c19jb2RlIGlzIHJlcXVlc3RlZCwgcHJvdmlkZSBvbmx5DQo+Pj4+Pj4gKyAg
ICAgICAgICAgICogc3VwcG9ydGVkIGZvcm1hdHMgd2l0aCB0aGlzIG1idXMgY29kZQ0KPj4+Pj4+
ICsgICAgICAgICAgICAqLw0KPj4+Pj4+ICsgICAgICAgICAgIGlmIChmLT5tYnVzX2NvZGUgJiYg
Zi0+bWJ1c19jb2RlICE9DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgIGlzYy0+Zm9ybWF0c19saXN0
W2ldLm1idXNfY29kZSkNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+
Pj4+ICsgICAgICAgICAgIGlmIChzdXBwb3J0ZWRfaW5kZXggPT0gaW5kZXgpIHsNCj4+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgIGYtPnBpeGVsZm9ybWF0ID0gaXNjLT5mb3JtYXRzX2xpc3RbaV0u
Zm91cmNjOw0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4+Pj4gKyAg
ICAgICAgICAgfQ0KPj4+Pj4+ICsgICAgICAgICAgIHN1cHBvcnRlZF9pbmRleCsrOw0KPj4+Pj4+
ICAgICAgICB9DQo+Pj4+Pj4NCj4+Pj4+PiAtICAgaW5kZXggLT0gaXNjLT5jb250cm9sbGVyX2Zv
cm1hdHNfc2l6ZTsNCj4+Pj4+PiArICAgLyoNCj4+Pj4+PiArICAgICogSWYgdGhlIHNlbnNvciBk
b2VzIG5vdCBzdXBwb3J0IHRoaXMgbWJ1c19jb2RlIHdoYXRzb2V2ZXIsDQo+Pj4+Pj4gKyAgICAq
IHRoZXJlIGlzIG5vIHJlYXNvbiB0byBhZHZlcnRpc2UgYW55IG9mIG91ciBvdXRwdXQgZm9ybWF0
cw0KPj4+Pj4+ICsgICAgKi8NCj4+Pj4+PiArICAgaWYgKHN1cHBvcnRlZF9pbmRleCA9PSAwKQ0K
Pj4+Pj4+ICsgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+Pg0KPj4+PiBTaG91bGRuJ3Qg
eW91IGFsc28gcmV0dXJuIC1FSU5WQUwgaWYgaW5kZXggPiBzdXBwb3J0ZWRfaW5kZXggPw0KPj4+
DQo+Pj4gTm8uIElmIHdlIGNvdWxkIG5vdCBmaW5kIGFueSBmb3JtYXQgdGhhdCB0aGUgc2Vuc29y
IGNhbiB1c2UNCj4+PiAoc3VwcG9ydGVkX2luZGV4ID09IDApLCBhbmQgdGhhdCBvdXIgSVNDIGNh
biBhbHNvIHVzZSwgdGhlbiB3ZSBkb24ndA0KPj4+IHN1cHBvcnQgYW55dGhpbmcsIHRodXMsIHJl
dHVybiAtRUlOVkFMIHJlZ2FyZGxlc3Mgb2YgdGhlIGluZGV4Lg0KPj4+DQo+Pj4+DQo+Pj4+IElu
IHRoYXQgY2FzZSwgSSdtIG5vdCBnZXR0bmcgd2hhdCB0aGUgcmVzdCBvZiB0aGUgZnVuY3Rpb24g
aXMgZm9yID8NCj4+Pj4NCj4+Pg0KPj4+IFRoaXMgaXMgdGhlIGNhc2Ugd2hlbiB3ZSBpZGVudGlm
aWVkIG9uZSBzdXBwb3J0ZWQgZm9ybWF0IGZvciBib3RoIHRoZQ0KPj4+IHNlbnNvciBhbmQgdGhl
IElTQyAoY2FzZSB3aGVyZSBzdXBwb3J0ZWRfaW5kZXggZm91bmQgZWFybGllciBpcyA+PSAxKQ0K
Pj4+DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAvKg0KPj4+Pj4+ICsgICAgKiBJZiB0aGUgc2Vuc29y
IHVzZXMgYSBmb3JtYXQgdGhhdCBpcyBub3QgcmF3LCB0aGVuIHdlIGNhbm5vdA0KPj4+Pj4+ICsg
ICAgKiBjb252ZXJ0IGl0IHRvIGFueSBvZiB0aGUgZm9ybWF0cyB0aGF0IHdlIHVzdWFsbHkgY2Fu
IHdpdGggYQ0KPj4+Pj4+ICsgICAgKiBSQVcgc2Vuc29yLiBUaHVzLCBkbyBub3QgYWR2ZXJ0aXNl
IHRoZW0uDQo+Pj4+Pj4gKyAgICAqLw0KPj4+Pj4+ICsgICBpZiAoIWlzYy0+Y29uZmlnLnNkX2Zv
cm1hdCB8fA0KPj4+Pj4+ICsgICAgICAgIUlTQ19JU19GT1JNQVRfUkFXKGlzYy0+Y29uZmlnLnNk
X2Zvcm1hdC0+bWJ1c19jb2RlKSkNCj4+Pj4+PiArICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4+Pj4+Pg0KPj4+DQo+Pj4gTmV4dCwgaWYgdGhlIGN1cnJlbnQgZm9ybWF0IGZyb20gdGhlIHN1
YmRldiBpcyBub3QgcmF3LCB3ZSBhcmUgZG9uZS4NCj4+DQo+PiBPaywgSSB0aGluayBoZXJlIGl0
J3Mgd2VyZSBJIGRpc2Nvbm5lY3QuDQo+Pg0KPj4gSSBkb24ndCB0aGluayB5b3Ugc2hvdWxkIGNh
cmUgYWJvdXQgdGhlIC1jdXJyZW50LSBmb3JtYXQgb24gdGhlDQo+PiBzdWJkZXYsIGFzIG9uY2Ug
eW91IG1vdmUgdG8gTUMgdGhlIElTQyBmb3JtYXRzIHNob3VsZCBiZSBlbnVtZXJhdGVkDQo+PiBy
ZWdhcmRsZXNzIG9mIHRoZSBob3cgdGhlIHJlbW90ZSBzdWJkZXYgaXMgY29uZmlndXJlZC4gUmF0
aGVyLCB5b3UNCj4+IHNob3VsZCBjb25zaWRlciBpZiBJU19SQVcoZi0+bWJ1c19jb2RlKSBhbmQg
ZnJvbSB0aGVyZSBlbnVtZXJhdGUgdGhlDQo+PiBvdXRwdXQgZm9ybWF0cyB5b3UgY2FuIGdlbmVy
YXRlIGZyb20gcmF3IGJheWVyIChpbiBhZGRpdGlvbiB0byB0aGUNCj4+IG9uZXMgdGhhdCBjYW4g
YmUgcHJvZHVjZWQgYnkgZHVtcGluZyB0aGUgc2Vuc29yIHByb2R1Y2VkIGZvcm1hdHMpDQo+IA0K
PiBBY3R1YWxseSAsIGluIHNvbWUgd29yZHMsIHRoaXMgaXMgd2hhdCBJIGFtIGRvaW5nLg0KPiBJ
IGFtIGZvbGxvd2luZyBMYXVyZW50J3MgYWR2aWNlOg0KPiBlbnVtZXJhdGUgdGhlIGZvcm1hdHMg
c3VwcG9ydGVkIGZvciBhIGdpdmVuIG1idXMgY29kZS4NCj4gDQo+IEluIGNvbnNlcXVlbmNlLCBp
ZiB0aGUgbWJ1cyBjb2RlIGdpdmVuIGlzIGEgcmF3IG1idXMgY29kZSAsIEkgY2FuDQo+IGFkdmVy
dGlzZSBhbGwgbXkgSVNDIGZvcm1hdHMsIGFuZCBpZiB0aGUgbWJ1cyBjb2RlIGlzIG5vdCByYXcs
IEkgZG9uJ3QgLg0KPiANCj4gU28gSSBhbSBkb2luZyB3aGF0IHlvdSBhcmUgc2F5aW5nLCBuYW1l
bHkgdGhyZWUgY2FzZXM6DQo+IA0KPiBJZiB0aGVyZSBpcyBubyBtYnVzIGNvZGUgZ2l2ZW4gYXMg
YSBwYXJhbWV0ZXIgdG8gdGhpcyBmdW5jdGlvbiwgSQ0KPiBhZHZlcnRpc2UgYWxsIG15IGZvcm1h
dHMsIHJhdywgbm9uLXJhdywgZXRjLg0KPiANCj4gSWYgdGhlcmUgaXMgcmF3IG1idXMgY29kZSBn
aXZlbiwgSSBhZHZlcnRpc2UgdGhpcyBzcGVjaWZpYyByYXcgbWJ1cyBjb2RlDQo+IGlmIHRoZSBz
ZW5zb3Igc3VwcG9ydHMgaXQsIGFuZCB0aGUgSVNDIHN1cHBvcnRzIGl0LCBhbmQgaW4gYWRkaXRp
b24sIGFsbA0KPiB0aGUgZm9ybWF0cyBJU0MgY2FuIGNvbnZlcnQgZnJvbSByYXcgdG8uDQo+IA0K
PiBJZiB0aGUgbWJ1cyBjb2RlIGdpdmVuIGlzIG5vdCByYXcsIHRoZW4sIEkgY2FuIG9ubHkgYWR2
ZXJ0aXNlIHRoaXMNCj4gc3BlY2lmaWMgbm9uLXJhdyBmb3JtYXQsIHNpbmNlIHRoZXJlIGlzIG5v
dGhpbmcgbW9yZSBJIGNhbiBkbyB3aXRoIGl0Lg0KPiBJdCB3b3VsZG4ndCBtYWtlIG11Y2ggc2Vu
c2UgdG8gc3RpbGwgYWR2ZXJ0aXNlIG15IHJnYix5dXYgZm9ybWF0cywgc2luY2UNCj4gdGhleSBj
YW5ub3QgYmUgdXNlZCBhdCBhbGwsIGFuZCBteSBsYXRlciB0cnlfdmFsaWRhdGVfZm9ybWF0cyB3
aWxsIGJhaWwgb3V0DQo+IA0KPiANCj4+DQo+Pj4gQnV0LCBpZiBpdCdzIHJhdywgd2UgY2FuIHVz
ZSBpdCB0byBjb252ZXJ0IHRvIGEgcGxldGhvcmEgb2Ygb3RoZXINCj4+PiBmb3JtYXRzLiBTbyB3
ZSBoYXZlIHRvIGVudW1lcmF0ZSB0aGVtIGJlbG93IDoNCj4+Pg0KPj4+IFdpdGggdGhlIHByZXZp
b3VzIGNoZWNrcywgSSBhbSBtYWtpbmcgc3VyZSB0aGF0IHRoZSBJU0MgY2FuIHJlYWxseQ0KPj4+
IGNvbnZlcnQgdG8gdGhlc2UgZm9ybWF0cywgb3RoZXJ3aXNlIHRoZXkgYXJlIGJhZGx5IHJlcG9y
dGVkDQo+Pj4NCj4+PiBIb3BlIHRoaXMgbWFrZXMgdGhpbmdzIG1vcmUgY2xlYXIsIGJ1dCBwbGVh
c2UgYXNrIGlmIHNvbWV0aGluZyBsb29rcyBzdHJhbmdlDQo+Pj4NCj4+DQo+PiBJIHRoaW5rIG91
ciBkaXNjb25uZWN0aW9uIGNvbWVzIGZyb20gdGhlIHdheSB0aGUgc3VwcG9ydGVkIGZvcm1hdHMg
YXJlDQo+PiBkZWZpbmVkIGluIElTQyBhbmQgSSB0aGluayB0aGVpciBkZWZpbml0aW9uIGNvdWxk
IGJlIHJld29ya2QgdG8NCj4+IHNpbXBsaWZ5IHRoZSBmb3JtYXQgc2VsZWN0aW9uIGxvZ2ljLg0K
Pj4NCj4+IFRoZSBkcml2ZXIgZGVmaW5lcyB0aHJlZSBsaXN0cyBvZiBmb3JtYXRzOg0KPj4NCj4+
IC0gaXNjLT5jb250cm9sbGVyX2Zvcm1hdHMNCj4+DQo+PiAgICAgICAgICBzdGF0aWMgY29uc3Qg
c3RydWN0IGlzY19mb3JtYXQgc2FtYTdnNV9jb250cm9sbGVyX2Zvcm1hdHNbXSA9IHsNCj4+ICAg
ICAgICAgICB7DQo+PiAgICAgICAgICAgICAgICAgICAuZm91cmNjICAgICAgICAgPSBWNEwyX1BJ
WF9GTVRfQVJHQjQ0NCwNCj4+ICAgICAgICAgICB9LA0KPj4gICAgICAgICAgIHsNCj4+ICAgICAg
ICAgICAgICAgICAgIC5mb3VyY2MgICAgICAgICA9IFY0TDJfUElYX0ZNVF9BUkdCNTU1LA0KPj4g
ICAgICAgICAgIH0sDQo+PiAgICAgICAgICAgLi4uDQo+Pg0KPj4gICAgICAgICAgIH07DQo+Pg0K
Pj4gICAgVGhlc2UgYXJlIGxpc3RlZCB3aXRoIHRoZSBvdXRwdXQgZm91cmNjIG9ubHksIGFuZCBp
ZiBJIGdldA0KPj4gICAgdHJ5X2NvbmZpZ3VyZV9waXBlbGluZSgpIHJpZ2h0LCB0aGV5IGNhbiBi
ZSBnZW5lcmF0ZWQgZnJvbSBhbnkgQmF5ZXINCj4+ICAgIFJBVyBmb3JtYXQuIElzIHRoaXMgcmln
aHQgPw0KPj4NCj4+IC0gaXNjLT5mb3JtYXRzX2xpc3QNCj4+DQo+PiAgICAgICAgICAgc3RhdGlj
IHN0cnVjdCBpc2NfZm9ybWF0IHNhbWE3ZzVfZm9ybWF0c19saXN0W10gPSB7DQo+PiAgICAgICAg
ICAgICAgICAgICB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIC5mb3VyY2MgICAgICAg
ICA9IFY0TDJfUElYX0ZNVF9TQkdHUjgsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIC5t
YnVzX2NvZGUgICAgICA9IE1FRElBX0JVU19GTVRfU0JHR1I4XzFYOCwNCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLnBmZV9jZmcwX2JwcyAgID0gSVNDX1BGRV9DRkcwX0JQU19FSUdIVCwN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgLmNmYV9iYXljZmcgICAgID0gSVNDX0JBWV9D
RkdfQkdCRywNCj4+ICAgICAgICAgICAgICAgICAgIH0sDQo+PiAgICAgICAgICAgICAgICAgICB7
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIC5mb3VyY2MgICAgICAgICA9IFY0TDJfUElY
X0ZNVF9TR0JSRzgsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIC5tYnVzX2NvZGUgICAg
ICA9IE1FRElBX0JVU19GTVRfU0dCUkc4XzFYOCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLnBmZV9jZmcwX2JwcyAgID0gSVNDX1BGRV9DRkcwX0JQU19FSUdIVCwNCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLmNmYV9iYXljZmcgICAgID0gSVNDX0JBWV9DRkdfR0JHQiwNCj4+
ICAgICAgICAgICAgICAgICAgIH0sDQo+Pg0KPj4gICAgICAgICAgICAuLi4NCj4+DQo+PiAgICAg
ICAgICAgIH07DQo+Pg0KPj4gICAgIFRoZXNlIGFyZSBmb3JtYXRzIHRoZSBJU0MgY2FuIG91dHB1
dCBieSBkdW1waW5nIHRoZSBzZW5zb3Igb3V0cHV0LA0KPj4gICAgIGhlbmNlIHRoZXkgcmVxdWly
ZSBhIHNwZWNpZmljIGZvcm1hdCB0byBiZSBvdXRwdXQgZnJvbSB0aGUgc2Vuc29yDQo+Pg0KPj4g
LSBpc2MtPnVzZXJfZm9ybWF0cw0KPj4NCj4+ICAgICAgICAgICBzdGF0aWMgaW50IGlzY19mb3Jt
YXRzX2luaXQoKSB7DQo+Pg0KPj4gICAgICAgICAgICAgICAgICAgLi4uDQo+Pg0KPj4gICAgICAg
ICAgICAgICAgICAgZm10ID0gJmlzYy0+Zm9ybWF0c19saXN0WzBdOw0KPj4gICAgICAgICAgICAg
ICAgICAgZm9yIChpID0gMCwgaiA9IDA7IGkgPCBsaXN0X3NpemU7IGkrKykgew0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoZm10LT5zZF9zdXBwb3J0KQ0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlzYy0+dXNlcl9mb3JtYXRzW2orK10gPSBmbXQ7DQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZtdCsrOw0KPj4gICAgICAgICAgICAgICAgICAgfQ0K
Pj4NCj4+ICAgICAgICAgfQ0KPj4NCj4+ICAgICB0aGlzIGxpc3QgaXMgb2J0YWluZWQgYXQgcnVu
dGltZSBieSByZXN0cmljdGluZyB0aGUgZm9ybWF0c19saXN0IHRvDQo+PiAgICAgd2hhdCB0aGUg
c2Vuc29yIGNhbiBhY3R1YWxseSBvdXRwdXQuIEkgdGhpbmsgdGhlc2UsIGlmIHlvdSBtb3ZlIHRv
DQo+PiAgICAgTUMgc2hvdWxkIGJlIHJlbW92ZWQgYnV0IEknbSBub3QgMTAwJSBzdXJlIGl0IGlz
IHBvc3NpYmxlIHdpdGggdGhlDQo+PiAgICAgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBzZXRf
Zm10KCkuDQo+Pg0KPj4gRG8geW91IHRoaW5rIGNvbnRyb2xsZXJfZm9ybWF0cyBhbmQgZm9ybWF0
c19saXN0IHNob3VsZCBiZSB1bmlmaWVkID8NCj4+DQo+PiBJZiBteSB1bmRlcnN0YW5kaW5nIHRo
YXQgYWxsIGNvbnRyb2xsZXJfZm9ybWF0cyBjYW4gYmUgZ2VuZXJhdGVkIGZyb20NCj4+IFJBVyBC
YXllciBmb3JtYXRzIHlvdSBjb3VsZCBtb2RlbCBzdHJ1Y3QgaXNjX2Zvcm1hdCBhcw0KPj4NCj4+
ICAgICAgICAgICBzdHJ1Y3QgaXNjX2Zvcm1hdCB7DQo+PiAgICAgICAgICAgICAgICAgICB1MzIg
ICAgIGZvdXJjYzsNCj4+ICAgICAgICAgICAgICAgICAgIGJvb2wgICAgcHJvY2Vzc2VkOw0KPj4g
ICAgICAgICAgICAgICAgICAgdTMyICAgICBtYnVzX2NvZGVzDQo+PiAgICAgICAgICAgICAgICAg
ICB1MzIgICAgIGNmYV9iYXljZmc7DQo+PiAgICAgICAgICAgICAgICAgICB1MzIgICAgIHBmZV9j
ZmcwX2JwczsNCj4+ICAgICAgICAgICB9Ow0KPj4NCj4+IGFuZCBoYXZlIGluIGV4YW1wbGU6DQo+
Pg0KPj4gICAgICAgICAgIHsNCj4+ICAgICAgICAgICAgICAgICAgIC5mb3VyY2MgICAgICAgICA9
IFY0TDJfUElYX0ZNVF9BUkdCNDQ0LA0KPj4gICAgICAgICAgICAgICAgICAgLnByb2Nlc3NlZCAg
ICAgID0gdHJ1ZSwNCj4+ICAgICAgICAgICAgICAgICAgIC5tYnVzX2NvZGVzICAgICA9IG51bGxw
dHIsDQo+PiAgICAgICAgICAgICAgICAgICAuLi4uDQo+PiAgICAgICAgICAgfSwNCj4+ICAgICAg
ICAgICB7DQo+PiAgICAgICAgICAgICAgICAgICAuZm91cmNjICAgICAgICAgPSBWNEwyX1BJWF9G
TVRfU0JHR1I4LA0KPj4gICAgICAgICAgICAgICAgICAgLnByb2Nlc3NlZCAgICAgID0gZmFsc2Us
DQo+PiAgICAgICAgICAgICAgICAgICAubWJ1c19jb2RlcyAgICAgPSB7IE1FRElBX0JVU19GTVRf
U0JHR1I4XzFYOCB9DQo+PiAgICAgICAgICAgICAgICAgICAucGZlX2NmZzBfYnBzICAgPSBJU0Nf
UEZFX0NGRzBfQlBTX0VJR0hULA0KPj4gICAgICAgICAgICAgICAgICAgLmNmYV9iYXljZmcgICAg
ID0gSVNDX0JBWV9DRkdfQkdCRywNCj4+ICAgICAgICAgICB9LA0KPj4NCj4+IGFuZCB3aGVuIGVu
dW1lcmF0aW5nIGFuZCBjb25maWd1cmluZyBmb3JtYXRzIGNoZWNrIHRoYXQNCj4+DQo+PiAgICAg
ICAgICAgaWYgKGlzY19mb3JtYXRbaV0ucHJvY2Vzc2VkICYmDQo+PiAgICAgICAgICAgICAgIChm
LT5tYnVzX2NvZGUgJiYgSVNfUkFXKGYtPm1idXMpY29kZSkpDQo+Pg0KPj4gb3INCj4+DQo+PiAg
ICAgICAgICAgaWYgKCFpc2NfZm9ybWF0W2ldLnByb2Nlc3NlZCAmJg0KPj4gICAgICAgICAgICAg
ICAoZi0+bWJ1c19jb2RlID09IGlzY19mb3JtYXRbaV0ubWJ1c19jb2RlDQo+Pg0KPj4gaWYgeW91
IGhhdmUgb3RoZXIgcmVzdHJpY3Rpb25zIGFzIGluIGV4YW1wbGUgVjRMMl9QSVhfRk1UX1lVVjQy
MA0KPj4gcmVxdWlyaW5nIGEgcGFja2VkIFlVViBmb3JtYXQsIHlvdSBjYW4gaW1wbGVtZW50IG1v
cmUgY29tcGxleA0KPj4gdmFsaWRhdGlvbnMgdG8gbWF0Y2ggcHJvY2Vzc2VkIGZvcm1hdHMsIGxp
a2UgeW91IGRvIGluIHRyeV92YWxpZGF0ZV9mb3JtYXRzKCkNCj4+DQo+PiBBbHNvLCBhbmQgYSBi
aXQgdW5yZWxhdGVkIHRvIGVudW1fZm10LCBpZiBJIGdvdCB0aGlzIHJpZ2h0DQo+PiBhdCBmb3Jt
YXQgY29uZmlndXJhdGlvbiB0aW1lIHlvdSBtYXRjaCB0aGUgSVNDIGZvcm1hdCB3aXRoDQo+PiB0
aGUgc2Vuc29yIGZvcm1hdC4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBtb3ZlZCB0byAubGlua192
YWxpZGF0ZSgpIG9wIHRpbWUuDQo+Pg0KPj4gVGhlIE1DIGNvcmUgY2FsbHMgLmxpbmtfdmFsaWRh
dGUgd2hlbiBzdHJlYW1pbmcgaXMgc3RhcnRlZCBvbiBlYWNoDQo+PiBlbnRpdHkgcGFydCBvZiBh
IHBpcGVsaW5lLCBhbmQgdGhlcmUgeW91IGNvdWxkIG1ha2Ugc3VyZSB0aGF0IHRoZSBJU0Mgb3V0
cHV0IGZvcm1hdCBjYW4gYmUgcHJvZHVjZWQgdXNpbmcNCj4+IHRoZSBzZW5zb3IgZm9ybWF0IChh
bmQgc2l6ZXMpLiBUaGlzIHdpbGwgZ3JlYXRseSBzaW1wbGlmeSBzZXRfZm10KCkgYXMNCj4+IHRo
ZXJlIHlvdSB3aWxsIGhhdmUganVzdCB0byBtYWtlIHN1cmUgdGhlIHN1cHBsaWVkIGZvcm1hdCBp
cyBpbiB0aGUNCj4+IGxpc3Qgb2YgdGhlIElTQyBzdXBwb3J0ZWQgb25lcyBhbmQgdGhhdCdzIGl0
LiBJZiB1c2Vyc3BhY2UgZmFpbHMgdG8NCj4+IGNvbmZpZ3VyZSB0aGUgcGlwZWxpbmUgY29ycmVj
dGx5IChpbiBleGFtcGxlIGJ5IHNldHRpbmcgYSBub24gUkFXDQo+PiBCYXllciBzZW5zb3Igb24g
dGhlIGZvcm1hdCBhbmQgcmVxdWVzdGluZyBhIFJBVyBCYXllciBmb3JtYXQgZnJvbSBJU0MsDQo+
PiB5b3Ugd2lsbCBmYWlsIGF0IHNfc3RyZWFtKCkgdGltZSBieSByZXR1cm5pbmcgYW4gRVBJUEUu
DQoNCkhpIEphY29wbywNCg0KSSB0cmllZCB0byBsb29rIG92ZXIgdGhlIGxpbmtfdmFsaWRhdGUg
Y2FsbC4NCkl0IGxvb2tzIGxpa2UgdGhpcyBpcyBvbmx5IGNhbGxlZCBieSBtZWRpYV9waXBlbGlu
ZV9zdGFydCwgd2hpY2ggbW9zdCANCmRyaXZlcnMgdXNlIGluIHN0YXJ0X3N0cmVhbWluZygpIC4N
Ckhvd2V2ZXIsIEkgbmVlZCB0aGUgZm9ybWF0IHZhbGlkYXRpb24gdG8gYmUgZG9uZSBiZWZvcmUg
dGhhdCwgYXQgDQpzdHJlYW1vbigpIHRpbWUsIGJlY2F1c2UgYWZ0ZXIgc3RyZWFtb24oKSAsIHRo
ZSB2YjIgcXVldWUgd2lsbCBiZSBmaWxsZWQgDQp3aXRoIGJ1ZmZlcnMsIGFuZCBJIG5lZWQgdG8g
a25vdyBleGFjdGx5IHdoaWNoIGZvcm1hdCBJIHdpbGwgYmUgdXNpbmcuDQpTbywgZG8geW91IHRo
aW5rIGl0J3MgZmluZSB0byBrZWVwIHRoZSBmb3JtYXQgdmFsaWRhdGlvbiBhdCBzdHJlYW1vbigp
IA0KdGltZSBpbnN0ZWFkIG9mIGNhbGxpbmcgbWVkaWFfcGlwZWxpbmVfc3RhcnQgaW4gc3RhcnRf
c3RyZWFtaW5nID8NCg0KQ3VycmVudGx5IEkgYW0gbm90IGNhbGxpbmcgbWVkaWFfcGlwZWxpbmVf
c3RhcnQgYXQgYWxsLg0KRG8geW91IHRoaW5rIGl0J3MgcmVxdWlyZWQ/DQoNCk9yIG1heWJlIEkg
YW0gbWlzc2luZyBzb21ldGhpbmcgYW5kIGl0IHNob3VsZCBiZSBkb25lIGluIGEgZGlmZmVyZW50
IHdheSA/DQoNClRoYW5rcyAhDQoNCj4+DQo+PiBIb3BlIGFsbCBvZiB0aGlzIG1ha2VzIGEgYml0
IG9mIHNlbnNlIDopDQo+IA0KPiBBYm91dCB0aGlzIGxhc3QgcGFydCB5b3UgYXJlIHRlbGxpbmcg
bWU6IEkgaGF2ZSB0byB0ZWxsIHlvdSB3aGF0IGFtIEkNCj4gZG9pbmcgcmlnaHQgbm93OiB3aXRo
IHRoaXMgcGF0Y2ggc2VyaWVzLCBpbmNsdWRpbmcgdGhpcyBwYXRjaCwgSSBhbQ0KPiBhZGRpbmcg
c3VwcG9ydCBmb3IgbWMgaGFuZGxpbmcgaW4gdGhpcyBkcml2ZXIsIGJ1dCEgdGhlIGRyaXZlciBp
cyBzdGlsbA0KPiBjb21wbGV0ZWx5IGNvbXBhdGlibGUgd2l0aCAndGhlIG9sZCB3YXknIGxpa2Ug
c2V0dGluZyBmbXQtdmlkZW8gZm9yDQo+IC9kZXYvdmlkZW8wIGFuZCBldmVyeXRoaW5nIGlzIHBy
b3BhZ2F0ZWQgZG93biB0aGUgcGlwZWxpbmUuDQo+IA0KPiBJIGFtIGRvaW5nIHRoZSBjb252ZXJz
aW9uIHRvIG1jLW9ubHkgdHlwZSBvZiBkcml2ZXIgaW4gbXVsdGlwbGUgc3RlcHMuDQo+IFRoaXMg
c2VyaWVzIGFkZHMgdGhlICduZXcgd2F5JyB3aGlsZSBoYXZpbmcgdGhlICdvbGQgd2F5JyBzdGls
bCB0aGVyZS4NCj4gQXQgdGhlIG1vbWVudCBJIGFtIHdvcmtpbmcgb24gYW5vdGhlciBwYXRjaCBv
biB0b3Agb2YgdGhpcyBzZXJpZXMgdGhhdA0KPiB3aWxsIGJhc2ljYWxseSByZW1vdmUgbW9zdCBv
ZiBteSBmb3JtYXQgcHJvcGFnYXRpb24gbG9naWMgZnJvbQ0KPiAvZGV2L3ZpZGVvMCB0byB0aGUg
c3ViZGV2aWNlLCBhbmQgYWZ0ZXIgdGhpcyBwYXRjaCB0aGF0IGlzIG9uIHRoZSB3YXksDQo+IHRo
ZSAnb2xkIHdheScgaXMgZ29uZS4gVGhlIHNlbnNvciB3aWxsICpoYXZlIHRvKiBiZSBjb25maWd1
cmVkIHRocm91Z2gNCj4gdXNlcnNwYWNlIGJlY2F1c2UgSVNDIHdpbGwgbmV2ZXIgY2FsbCBzZXRf
Zm10IG9uIGl0IGF0IGFsbC4NCj4gDQo+IFNvIHRoZSBwdXJwb3NlIG9mIHRoZSBwYXRjaCB5b3Ug
YXJlIHJldmlld2luZyBub3cgaXMgdG8gaGF2ZSB0aGUgbWJ1cw0KPiBjb2RlIHBhcmFtZXRlciBp
biB0aGUgZW51bV9mbXRfdmlkX2NhcCBpbiB0aGUgd2F5IHRoZSBjdXJyZW50IGRyaXZlcg0KPiBo
YW5kbGVzIHRoaW5ncy4NCj4gDQo+IFNvIGlmIHlvdSBhZ3JlZSwgSSB3aWxsIGxldCB0aGUgb3Ro
ZXIgcGF0Y2ggc3BlYWsgZm9yIGl0c2VsZiBhbmQgcmV3b3JrDQo+IHRoZSBsb2dpYyBjb21wbGV0
ZWx5IC4NCj4gSSBhbSBjdXJyZW50bHkgdHJ5aW5nIHRvIGRvIGl0IGF0IHN0cmVhbW9uKCkgdGlt
ZSBsaWtlIExhdXJlbnQgdG9sZCBtZSwNCj4gYnV0IEkgY2FuIHRyeSB0byBoYXZlIGl0IGF0IHZh
bGlkYXRlIGxpbmsgYXMgd2VsbCwgdG8gc2VlIGhvdyBpdCB3b3Jrcy4NCj4gDQo+IEkgd2lsbCBh
ZGQgdGhhdCBwYXRjaCB0byB0aGUgc2VyaWVzIHdoZW4gaXQncyByZWFkeSBhbmQgSSBoYXZlIGEg
djIgb2YNCj4gdGhpcyBzZXJpZXMgYXMgd2VsbC4gU28gaW4gYmFieSBzdGVwcywgSSBhbSB3b3Jr
aW5nIHRvd2FyZHMgdGhlIGdvYWwuIEkNCj4gYW0gbm90IHN1cmUgaWYgdGhpcyBtZWFucyB0aGF0
IHlvdSBjb3VsZCBhZ3JlZSB0byB0aGlzIHBhdGNoIGFzLWlzLCBvciBJDQo+IGhhdmUgdG8gaW50
ZWdyYXRlIGl0IGNvbXBsZXRlbHkgaW50byBhIGJpZ2dlciBwYXRjaCB0aGF0IHdpbGwgYWxzbyBm
aXgNCj4gZXZlcnl0aGluZyB1cCBpbmNsdWRpbmcgdGhlIGZvcm1hdCBsb2dpYy4NCj4gDQo+IFRo
YW5rcyBhZ2FpbiBmb3IgeW91ciByZXZpZXcgYW5kIGlkZWFzDQo+IA0KPiBFdWdlbg0KPj4NCj4+
Pj4+PiArICAgLyoNCj4+Pj4+PiArICAgICogSXRlcmF0ZSBhZ2FpbiB0aHJvdWdoIHRoZSBmb3Jt
YXRzIHRoYXQgd2UgY2FuIGNvbnZlcnQgdG8uDQo+Pj4+Pj4gKyAgICAqIEhvd2V2ZXIsIHRvIGF2
b2lkIGR1cGxpY2F0ZXMsIHNraXAgdGhlIGZvcm1hdHMgdGhhdA0KPj4+Pj4+ICsgICAgKiB0aGUg
c2Vuc29yIGFscmVhZHkgc3VwcG9ydHMgZGlyZWN0bHkNCj4+Pj4+PiArICAgICovDQo+Pj4+Pj4g
KyAgIGluZGV4IC09IHN1cHBvcnRlZF9pbmRleDsNCj4+Pj4+PiAgICAgICAgc3VwcG9ydGVkX2lu
ZGV4ID0gMDsNCj4+Pj4+Pg0KPj4+Pj4+IC0gICBmb3IgKGkgPSAwOyBpIDwgaXNjLT5mb3JtYXRz
X2xpc3Rfc2l6ZTsgaSsrKSB7DQo+Pj4+Pj4gLSAgICAgICAgICAgaWYgKCFJU0NfSVNfRk9STUFU
X1JBVyhpc2MtPmZvcm1hdHNfbGlzdFtpXS5tYnVzX2NvZGUpIHx8DQo+Pj4+Pj4gLSAgICAgICAg
ICAgICAgICFpc2MtPmZvcm1hdHNfbGlzdFtpXS5zZF9zdXBwb3J0KQ0KPj4+Pj4+ICsgICBmb3Ig
KGkgPSAwOyBpIDwgaXNjLT5jb250cm9sbGVyX2Zvcm1hdHNfc2l6ZTsgaSsrKSB7DQo+Pj4+Pj4g
KyAgICAgICAgICAgLyogaWYgdGhpcyBmb3JtYXQgaXMgYWxyZWFkeSBzdXBwb3J0ZWQgYnkgc2Vu
c29yLCBza2lwIGl0ICovDQo+Pj4+Pj4gKyAgICAgICAgICAgaWYgKGZpbmRfZm9ybWF0X2J5X2Zv
dXJjYyhpc2MsIGlzYy0+Y29udHJvbGxlcl9mb3JtYXRzW2ldLmZvdXJjYykpDQo+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4+PiAgICAgICAgICAgICAgICBpZiAo
c3VwcG9ydGVkX2luZGV4ID09IGluZGV4KSB7DQo+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICBm
LT5waXhlbGZvcm1hdCA9IGlzYy0+Zm9ybWF0c19saXN0W2ldLmZvdXJjYzsNCj4+Pj4+PiArICAg
ICAgICAgICAgICAgICAgIGYtPnBpeGVsZm9ybWF0ID0NCj4+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaXNjLT5jb250cm9sbGVyX2Zvcm1hdHNbaV0uZm91cmNjOw0KPj4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4+Pj4gICAgICAgICAgICAgICAgfQ0K
Pj4+Pj4+ICAgICAgICAgICAgICAgIHN1cHBvcnRlZF9pbmRleCsrOw0KPj4+Pj4+IC0tDQo+Pj4+
Pj4gMi4yNS4xDQo+Pj4+Pj4NCj4+Pg0KPiANCg0K
