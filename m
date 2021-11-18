Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC72455541
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 08:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243604AbhKRHOm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 02:14:42 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:10445 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243609AbhKRHNz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 02:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637219456; x=1668755456;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bSfRQpwTJsMKfv2QjXohuwNefzHs89ToJi9Sg6WolIQ=;
  b=L3/RJoShDTrI450hQGIPqUl//TPdh9f4ALLK78Fcn/sMHzrzmekH5NWL
   wXbg/p/qs/9Md5ctuXqvP+Ble1r/60KMdOCrLgVJrs2iAvks44kDZTlI+
   tXeuqb4ySWXb9aa8p+aRHzcMbhK0YjkRtRBS7nQTuP8QaYPOb2vyXkFpZ
   qfgFdooJz08zhwP0R8OzoSgGUYxvcMAyaeHzhMT6/bJALzgLcE0KiKMvy
   lDc78uSzje/SIwxpBm1wH9qcuZCY+0ZL+yM54PyqnpRjZAsnflUOp/bHL
   6MABCj5GAEEr5kYIFE4KW96zSZhn2PTYh868GXn2py2wFOyxeexRdRqme
   g==;
IronPort-SDR: Lk5pzJbavhXd0ok6As9uGW14u4ugs3p2uq4HTb/cq+3v8eKn7ZC1RSzemW8/tlSJJ4MxU7FbYX
 yTRfA3YfFQxQ5lgcCeuEGDlrr8Vta5YzjHTAdKv6ZzgPrpfDriG671KtghkdoVSO5Hjtwxl/60
 oCCx8EQVeMkOvFNWVz0L01y+j5ndZFSadv+xMgON233WQnhfA3/MrDrMqCyVIlrjKRBuaW+fsK
 Wq+3VBw3SGdiWu3T0gE4c1wOn11jA4g7OmZre5EpXqewPtCKtsTuVeo09fvyNZ4pnPpZDw/aVB
 CbtogswdIYbYY24Ey0sd9Pcd
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; 
   d="scan'208";a="143765071"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 00:10:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 00:10:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Thu, 18 Nov 2021 00:10:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DC9SwRvo9rkOA6kuUcm/69kQYA7itDXi0CvCZAH/LJatJx5UY6KTbWVd1gu7iS2kSjyUcISAwdlnbuxh0TXEp/tm653TUojv7pfdIvUPn9TzW5IIiHEf+kYob32qgqit30Pyhe/MFP8OGqhU+5CZUFt6RBrqkWJ4ISs+K1BABThGnIR8SQhGqyoyAGzepREIqaW5klvYo6cgVCO7bM7kX0lJ/9j2jF3TxEPPv1nDANq5flIJkknO6XepgPQUvHbEIDPDHjn7wsIg0vuuonl7adeLyokYl1aEIZBY35EpFQ0QWrEg3xE6GQyoVnCimQnEv7PNaqK61aknsZ6ioew5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSfRQpwTJsMKfv2QjXohuwNefzHs89ToJi9Sg6WolIQ=;
 b=oZI8uCOEtvluafVJ70JZgQLc7eaV+ifiR9nnX7frnyqwbs8jPLza+i5ewBqafXz3HH9BWlaXIiricOfla4xrV5CFfNmYbbcdXQv3ZH4ZaUbUtgCmh90RALJ50twk7adWyF5FKrmcQOvTk0E9ZK9USY8XdRXqzoDAIUnmI3s7rKo1K0ghpMwZpVs2xLGGNQd+zoMq4x6lu7WVNrcKszlfMBXOtGY27fzaIr1DGMcPtQ4BZAnCMJtwqjAkW6Jk2znq7BG+hUb/QNbW3hRfIst2xrRoqbhLwVfzsjBtvRwPWPL79QgwlPDgEcGBzGDidqwFWIIkRFnwTVBq0azZjxwgCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSfRQpwTJsMKfv2QjXohuwNefzHs89ToJi9Sg6WolIQ=;
 b=Ui6vinYdswfG5IbPU6+8FNvNmKmNWwzKppJ/IAYi8HaclzPV15AIF4nIzE44O0RviS3zJo7krLyjKjG4ZBVbtZThf0ziTd+urcDEjd0K3WTVOJF4trKBAnOnHI2T2kKJIBV3XSj/VkneAVcl5Xc4SUkU9E8EPFIHGAuWqrQ0fVQ=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN9PR11MB5306.namprd11.prod.outlook.com (2603:10b6:408:137::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 18 Nov
 2021 07:10:49 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21%7]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 07:10:48 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <anil.mamidala@xilinx.com>, <laurent.pinchart@ideasonboard.com>
CC:     <robh@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <sakari.ailus@iki.fi>,
        <naveenku@xilinx.com>, <stefan.hladnik@gmail.com>,
        <frebaudo@witekio.com>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 AP1302
Thread-Topic: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 AP1302
Thread-Index: AQHXuqX/166/c7G6hkeYn5LacUPtp6vS9ViAgDYsLYA=
Date:   Thu, 18 Nov 2021 07:10:48 +0000
Message-ID: <93666088-a622-4c29-49b7-0a9074713974@microchip.com>
References: <20211006113254.3470-1-anil.mamidala@xilinx.com>
 <20211006113254.3470-2-anil.mamidala@xilinx.com>
 <YWiK/xXEQwC5HgWD@robh.at.kernel.org>
In-Reply-To: <YWiK/xXEQwC5HgWD@robh.at.kernel.org>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5d3d52b-10d9-4ffd-d822-08d9aa628c62
x-ms-traffictypediagnostic: BN9PR11MB5306:
x-microsoft-antispam-prvs: <BN9PR11MB5306EEAFEDFD2AD7A5911211E89B9@BN9PR11MB5306.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ogQeiz+YMIdb9HUX8Xtfor5sbVxCBFvNO0XSOI+qrGYFR2qkTigJ/LdTYLwadmIqdccBe/Mmmm/1YWlYSjN3G+LHpMlSBfiMteMqpkJfK+QFT6Gl95hm0jEGXLhnECYclS0s6ZXPULMLXNEaC+m7VHi0fwpCu+jxIglyLQn33rf196bh70h+B+o015Bw5ju23mw+D//sFQJg6j+RAzjGlhQ9+DRQ0XVvWgySGZTVl5wNJzVnN9rfNtFu8q2uhEe0xy1x4EXmPk/AdemPVlupmU13WU58H69BiWRJZ8USMcbzIv607USfOpMNt3FIjKff0PTRvFoOozr9TXKRtASW7BbPhcj+Px3bh/AS4Z7kkCkeiynAu9BKKdk/4AW0O+dE5a4ZtYaLBz5dwPKV0ZieW6NNiLqrB+aNYtEFox2HCYzSekA9vwY8HPytl5w1wkI0A1u7igsy6MBL+GFAOqs9wnSsZ6GDZKNaNsP3A32bywCRatx1ZzOpIvnKfB3hFP/7617AQOR3veqAO48Ji67UL7jX81KUto6u1b78LYuShGuO2x+c32adG5Lz4gSbpVreOGNyVcnJ7FbvfghaweFUacGHx8xYbwuL0IYgL1zsshINWRzgxezDmPMCnfwdEcSrTW9OegprzjXWMuyXlIYma8Iyg1p7zokSobe2BhQKb1kxIImdsdnHvOiu5l0XX/aMwZUwGsU9qH5xUyH2c2XAAI9L8p/F6t9C/O6RVK89wvzzru9Z/wclcdvvyCcatuvjN9H/VYANhS0n8sGPg3BdLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(4326008)(66946007)(5660300002)(31696002)(122000001)(2616005)(53546011)(6506007)(508600001)(26005)(66556008)(91956017)(76116006)(6486002)(66446008)(66476007)(64756008)(36756003)(2906002)(186003)(6512007)(110136005)(54906003)(316002)(71200400001)(86362001)(8676002)(8936002)(38100700002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nlgvai9vdGlhSFNqZlFNQXdvSnVHRkJQODhid0o3QlBBOW85SVJIWlJWdWRT?=
 =?utf-8?B?NjE2NlRNeEdJQVJER3U3YjVOby9KZ3Q5dTYyNHJ0cnArMituV2xuSjI5SkpQ?=
 =?utf-8?B?ckxhdEVER0NKZDFlN2FIa05GUHpIZVIvblZLSHY3N2JCM21tYmhuYWxjNDUx?=
 =?utf-8?B?S0lwNThoS1ZQMHdhSUpPZFJhS3VMdWVFUmVBblVzRVZCMXVGbk1ubU1wL1F6?=
 =?utf-8?B?VnVVeWxqYlVvMGRqdVBkYmU3bjhKSSt6RXpKN21ZUkdwb1lUc1haVE9KN1Rh?=
 =?utf-8?B?QnlqZTkrbXRBd0hSclAwdkFYQnJ1VnEyeFpNV295RHdFVTdrQldCMWRzaFNo?=
 =?utf-8?B?aFg4eHMxWGNkck00YUJ1OHFiUnNhc2RQZG9iRXpnY0RVRXFaZmkrdHB6SlIy?=
 =?utf-8?B?S3F1aXBna3JwODd2djRIZHhia0NVQ0tzQ1dCeWc5WklaZksxQmxGWnhrRWlU?=
 =?utf-8?B?Unc4ZWdoaGlwNXVzNklJQlJCYUFwZnhkOWxidi81RGN3SGFOMkZnckJGSzZQ?=
 =?utf-8?B?aUQ1cDJTRlVQRGRSWlJ4MWFFSzVmck9mVFlCRGgvaG5CeHRjVFUxQ2JCWmp2?=
 =?utf-8?B?OUo5aFMwc0ZBcml2N1FvTFFTbGlWcHcwN1BrRGpjK3pmNmN5bXJ2c0NhSE1R?=
 =?utf-8?B?T3pwYTdIbndnSllwTnlXOUZpYkh1UXFzK1JOamN0NzQybU9DRytaVDYwN2pS?=
 =?utf-8?B?SjVycnZZSThBaVVjcGJab1FndUxYL1JFTURkK1NnTTFKTWRSQjQyTVROZVNT?=
 =?utf-8?B?Yno1V0gxNXQ4VnhXNlpzQUttNTJZWFErekFyRkNWWGM2YmxKVlBjZ1JTS05n?=
 =?utf-8?B?b0o5T0pyVlQ0cGFEczhCQVZWM2RrcHJKaG43TUtKZTY1SVE1b3JRcGUrRFhl?=
 =?utf-8?B?aDE3bGNKTmxPQkkyZlhEZHJ4Z0lWRW1FU1lyR3U1MUtNR1dvS3VOVnQ5SUdP?=
 =?utf-8?B?U3BLdTZjVGJyRzVUb3N3NmJlc3JDU0lUQTM2WERnaGZVZnRHNXYrRW93aWJR?=
 =?utf-8?B?WlBSa2Y4d0dzdlBEM20xRHBoL1NodWdadnc0NENoQXo4bkNiVmFMZVNJUkJU?=
 =?utf-8?B?dFZRREpUNlZHSlQzU3FGTkhQQjQvZUhyWFJLTHo2MktieklVZS9hUGpHZXZE?=
 =?utf-8?B?OE1YSzhxR3hWY1Eva0d1dHBseVFvWG51azh6aCtVemQ1c1ppMnZ6ZGpqTEEw?=
 =?utf-8?B?a2dVejNOUFRYWncxb2txUEhBTVAyeWJyOUtZWEdhYUZFeUR1Q2VFWk5Da2Nn?=
 =?utf-8?B?bnoxVHJnRUtPSXl6RExPZmNuR2h0NjJuZzFGd2E2ekdrNjc1UEphRWVDMzZW?=
 =?utf-8?B?Tm9admtHMnhxeGJkQTVFUTZ0dUZmZWUyOEVLQTdKV2kwdjBsY3AxeGxSNnh5?=
 =?utf-8?B?ZHpjMk4zR3czZzlGMHVPQ3JmUWtWVE5SbVRmZTNCNW1UM0NGNzVQNEtsdE1p?=
 =?utf-8?B?WmV0cytVY1dXaFpOK3J3VXhncUpGTGVkMi8vWkpxLzVjWWRIR1VDMzZxcnlJ?=
 =?utf-8?B?V2JZVmJZcVJveFhHRzdOTENIKzFyR0pLaDBGS2FiSDJVZkRZdzhULzlIcGpP?=
 =?utf-8?B?bTAxY3Z1MC8yaUJRM2NXakcwbS9rT1lBSUNwUVRCL3gwSzBKcDQrNHdkaVk5?=
 =?utf-8?B?dDdoRkNrZWl0bDhSbjBhamN3UXFQRW56SS9sRWVZczEwQWt4cXVsY3dnek9k?=
 =?utf-8?B?U1JOdURIZ1djTUpkcmREbWlQK3ZkNHdhZVVENHRwRmZFaDBYdFZaV2pXcWp5?=
 =?utf-8?B?TDVJMENEaVRyVXZUN2pQMDVqbFozVWRRR0FqZkRyNUdjSitMSEk1SEE5bFRH?=
 =?utf-8?B?SFpPRC9Mb2FVWVFLWDhkbW5mYmsxMXFvb1RQTHZCMVppZnhtdFpxMy9xMXQ5?=
 =?utf-8?B?aDFRNXR4TTBYaklCSmpmZDViRUJqSDRHUXd1Y3R2U21PQlVsZU5xUmRKUzd6?=
 =?utf-8?B?a1NPbHhQVU9Wc0Rhdm54bVE4OUsvWkFEaU51cFRrUVRqaEd2c2VTVEE5NGxE?=
 =?utf-8?B?SEtBcjIwMWlkODk0NTNIbGdjMHp6Sy82aVVzSndscGtuWGNDNTVMR28xSzV4?=
 =?utf-8?B?Z0tzUngwdk51Qm9wdm9HcnR4M1Y2OXptUXptWllvWFV6WnppYmduTm9oZ0h0?=
 =?utf-8?B?MWQrWUZWbWdBbEl1M0M2cGRaeEhyd1p5TE5DWE9HWHlUTWs1bStlTGFFU0Y0?=
 =?utf-8?B?WWV6WWdJVkdzSG5JNEI2N09JOGgwOHF0Z0oxMkdZTGFrVVRkZEJ4ckpTeHp4?=
 =?utf-8?B?K0txS1Nkdy9aVi9BZW5zV0JqME1BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3275A31CBDD5B047AD35E6A757E502DA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d3d52b-10d9-4ffd-d822-08d9aa628c62
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 07:10:48.7335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRNJpamtCkN3YF4MIyTrXtbWsMH2EtK01K5m8nnJhE5S0MoGTyujSOngPDD+8YEniQ/v6xUch/bGmK+WVxFDJ3gmzn9q0hvlZIxwP2sLl1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5306
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTAvMTQvMjEgMTA6NTQgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBXZWQsIE9jdCAw
NiwgMjAyMSBhdCAwNTozMjo1NEFNIC0wNjAwLCBBbmlsIEt1bWFyIE1hbWlkYWxhIHdyb3RlOg0K
Pj4gVGhlIEFQMTMwMiBpcyBhIHN0YW5kYWxvbmUgSVNQIGZvciBPTiBTZW1pY29uZHVjdG9yIHNl
bnNvcnMuDQo+PiBBZGQgY29ycmVzcG9uZGluZyBEVCBiaW5kaW5ncy4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBBbmlsIEt1bWFyIE1hbWlkYWxhIDxhbmlsLm1hbWlkYWxhQHhpbGlueC5jb20+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGxhZG5payA8c3RlZmFuLmhs
YWRuaWtAZ21haWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogRmxvcmlhbiBSZWJhdWRvIDxmcmVi
YXVkb0B3aXRla2lvLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9pMmMvb25ubixhcDEzMDIueWFtbCB8IDIwMiArKysrKysrKysrKysrKysrKysrKysNCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDIwMiBpbnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL29ubm4sYXAx
MzAyLnlhbWwNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2kyYy9vbm5uLGFwMTMwMi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vbm5uLGFwMTMwMi55YW1sDQo+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMC4uZDk2ZTlkYg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vbm5uLGFw
MTMwMi55YW1sDQo+PiBAQCAtMCwwICsxLDIwMiBAQA0KDQpbc25pcF0NCg0KPj4gKyAgICAgICAg
ICAgIHNlbnNvcnMgew0KPj4gKyAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4+ICsgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArDQo+PiArICAgICAg
ICAgICAgICAgIG9ubm4sbW9kZWwgPSAib25ubixhcjAxNDQiOw0KDQpIZWxsbyBBbmlsLCBMYXVy
ZW50LA0KDQpJcyB0aGVyZSBhIGRyaXZlciBhdmFpbGFibGUgZm9yIHRoaXMgc2Vuc29yIG1vZGVs
ID8gKG9yIG1heWJlIHNvbWUgcGF0Y2ggDQppbiBwcm9ncmVzcyApDQpJIGFtIHRyeWluZyB0byBz
ZWUgaWYgSSBjb3VsZCB1c2UgdGhpcyBzZW5zb3Igd2l0aCBjdXJyZW50IGF2YWlsYWJsZSANCnNv
ZnR3YXJlIG9yIG5vdC4NCg0KVGhhbmtzICENCg0K
