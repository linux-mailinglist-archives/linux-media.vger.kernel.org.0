Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33CAF5B9577
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 09:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiIOHdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 03:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbiIOHdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 03:33:46 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877205FF4;
        Thu, 15 Sep 2022 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663227223; x=1694763223;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ebUwqutbOuZp/t9aofeq/6drGyu8lFzboulMK1/QuVg=;
  b=guNYJ+BjhY3S/wKTyXamuYuVhU+6uR9hjMEWb2RkZWVZKZ1Tf2LRzRTh
   JpiBgB+7AWPeL8vYqNMCRQyg/qBvcjH33Z8y2yQZpoQ2aN2dml/l0IsHH
   MDaVBOYioB6Q3EFYFLsNFTKx0Ev41FmfDfPVVCltM30ONZrIfd03qZzbW
   +wiITJaNaiQY3VSM633Ntl70eR0HtybJNfG3Nw4vgmWyWHW+kXENYyB/5
   ZFccLLRqsavZNSRQHBboHrYomBaUk9Xn2ksSSJGrU/KOe8vgXr58mRkmE
   By7yJwXY8XVFVmntlljxCDTVwfMmwUdzVMNMbS6otPGlZqLz4EIibZxQa
   g==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="180590297"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 00:33:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 00:33:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 15 Sep 2022 00:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=my2Qd0gMxnvfrEBuAR/mYz7o3SFEhY6CUpUjW4Fvm4sDCDN21yh1ounCXErIKNKKAI+TVdLpJzhhv89767sZYfhNpXgVxgbG0NzULykfR5vCHZgG4Mrzh9MQj1KLtVxa8GuHcQ5FfwRoNGba39ZXq6iRk2EEu2wQkNqMPHRs69yWhX6bx1Q5dwTrRNwfzdHB8Yp5p8fepjBjPVEH8skhQYfmCCbDugjjzAbcYlLsiBqiOHtQH97AIFXUAop9X7OnSASTTTCi8kqUSg+yqrwH801LnmPfPweIWNZcUzYp9LbJ9nI4NKrEdYzveZXdGsIHj+lOovsZBh8UFZ0nUEDSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebUwqutbOuZp/t9aofeq/6drGyu8lFzboulMK1/QuVg=;
 b=VfgAt8WJgWfD/4eXf5pGXCoK1iGieAPfbd4usedV2sj9/9y1Eh5KI/ELYfT2t7SF0uDqV1dl3Ty4i4BAufy7NSOO070I3MkH+ULsct4Dk4/F58TWRf3mWEOHM15ir2cDrkpUY7Qsr5XiLbL3gDiXzc1i8MbZjwAD8Gz8dsDp9+Q2rdd03+rkfZr9KnTXX/t+kzSn/GApoWMH5ijGRIBOeRw0G3dE6HtCZbzM9iZHSErUDuxV3xXY/c5WNw1GYo7iAcE8AUL+p2ykpnFYuSBMkYw6WhtedI0bS/PAlKjROKcN0IC+56kIu1NA1BTT7TGKAyS/JtxD8rys3ybJ+N33zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebUwqutbOuZp/t9aofeq/6drGyu8lFzboulMK1/QuVg=;
 b=aJ7ioLPAKgYwWgcvzmXjQ6DlvUC+Uk3Q9bkkV1nDbQ0p5sJ7NIMlJhT4LxIvS6TJx3VITG3K/k4PW8py2KXY2fRNQVcZdCwpU9NF5f+F9p6HPVHFZlE3HeO7WyDroQtENESW3pVf2QKCrkxlon6y93qqdcnPDDSbok1wbvQWqgg=
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MN0PR11MB6060.namprd11.prod.outlook.com (2603:10b6:208:378::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 07:33:33 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::44a1:dd85:8d3b:56fd]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::44a1:dd85:8d3b:56fd%6]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 07:33:33 +0000
From:   <Shravan.Chippa@microchip.com>
To:     <daniele.alessandrelli@intel.com>, <paul.j.murphy@intel.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <Conor.Dooley@microchip.com>,
        <linux-kernel@vger.kernel.org>, <Prakash.Battu@microchip.com>
Subject: RE: [PATCH v3] media: i2c: imx334: support lower bandwidth mode
Thread-Topic: [PATCH v3] media: i2c: imx334: support lower bandwidth mode
Thread-Index: AQHYwcn+D4ZbzMGIaUyff+U32MoakK3fJ+QAgAD3JQA=
Date:   Thu, 15 Sep 2022 07:33:33 +0000
Message-ID: <PH0PR11MB5611A5CB97D29DF3F0BC9DC081499@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20220906082327.4029-1-shravan.chippa@microchip.com>
 <e5f49377bf005dcca22a333aaf85480df2165815.camel@intel.com>
In-Reply-To: <e5f49377bf005dcca22a333aaf85480df2165815.camel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|MN0PR11MB6060:EE_
x-ms-office365-filtering-correlation-id: 77054cdd-ab08-4039-14ca-08da96ec981f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ttc9DM3XX9acI+6f3pR+9jocQE26Z9fKwDp/hbpKquf8tbWn/l2uQf80czTMNGrVuhwOBnZa9PZJ5HeyX0JAd497L0c7qDpLEaHSdJs6RG26V0Pp2WoveKn8FB4uinZC3etelSlTYhAYSsp5SlH/gdD5HxcIrUFlcAkTn+yOyvlR6+XQZBE1Aw7gqZ4JRdMdmjKb+4mIpTCcjrlMPciXYFtIEUhRwU6d0XBv2XoA3UUuVL+Oac44RTmiNV1vLW555h2fma59JUruTibi9AvgGF6YwDWP+3hrGvRAEf5rszg7Molco0zQmoY5K3PYOmZ1r/hSy9O8jkJbPIXSKa6QQcuaKDDJmz9aom5Yqk3rWl6A7xkGuIHp7tQYrA1QHwhRaX8DVC46ySWspGVhRRSaSQ0C3OotVx3aqu97lbdyAowS6c4R3ZJxkscGH9/m7o3KYodenPm4s0oRd1c3qv3//Y8ibW7moWk6yjsaxayS5Oa0hHAuwsaVSMmI0DWwyia5MTvjXKZP/X6gkmoRpij0KkLqhld6dZwFvK8KK7uA/75XLIRpcplr2GdVG1VDJC7pSYSFMZYxYOwiXpJq4SLwA9Om7wPRmwGQmut2tSRACHL15+FCM3WJTzG1gCKt1Rs/nMUgwkWIdSUHJhFeGS6NzPxD5FRe9CsScfoL6d2PWZXcZvk2CdrDj/iZk3eVKo2DpTyceNwrwCoo1/P/v5ZSVpzN2PfFLHpF3AdDqrnV+tBf/8uBrQ3GWN8537SC3HVljAFAULTLJBY7Is4MDuyZGQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(83380400001)(41300700001)(71200400001)(38100700002)(26005)(38070700005)(86362001)(9686003)(5660300002)(4326008)(76116006)(66946007)(7696005)(8676002)(66556008)(55016003)(66446008)(110136005)(316002)(186003)(33656002)(53546011)(107886003)(54906003)(52536014)(30864003)(64756008)(2906002)(478600001)(122000001)(6506007)(8936002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UC9RRjJndHpPV2F1Tm16dHBCdVZaSFQ2Ri9jbHpQK1VIc2g5VWg1TU9kKzRk?=
 =?utf-8?B?dGF0czQ1ZGJpazU0SE9CNkx5blVoaFF1RDhzVnBtTHVFZUs5TW5POHFuUGdN?=
 =?utf-8?B?ckNNeTluT01NTjVCWnpjSW5ZMmgzb0J0TWROUllQcVNuTVlQOGtmWUtZNEdr?=
 =?utf-8?B?NEpxdXZKamgrUjFZRmZMME4xYldZNGwrSG9aSGw1b0lhbE82YWxCRjg3cDNX?=
 =?utf-8?B?SGtxQ3pGZlNBd1lLNzhYLzZ6bldmVWk4ZWI1NVlqWDhmZytNRHNQajU3QTVI?=
 =?utf-8?B?akRhWFNuWXNyQUc5bmZKMkR4Rmc4QjNqVkVNZHdGdXpBdEdMbXB6WVRlVFFF?=
 =?utf-8?B?RFU2M1NhOEQ4S294cjVVWEdWaWVRZ0xjcVJ6WjBnUDY5aEpyM3lVUWhXaTQv?=
 =?utf-8?B?Y2pSREd2YW95LzEwM3lZWmRFOVdoczdKYnhrejNYSnl2cm9FRHBKWE1aQ2pD?=
 =?utf-8?B?L1BWZWdiSHlsVjZ6Z2JOYkdBdGw3Mm9xQlNJZGlQdWFwUFU4VE50eUc2YXFZ?=
 =?utf-8?B?NkFDTXRlVVJvQWJ2Ui9RSlZzMm5EOG9iZEtCTmpyZjhwd0xaUzhoUFRHTTEz?=
 =?utf-8?B?RUVjTm1IUDl0NjZxcHNZMWVlNmxTTVpxaUNOSHVmZ3FJdkdZcjF2NWtSeEd5?=
 =?utf-8?B?RjZKcXQ4ck9pUTBxVkl6dHBVTkZRd2dSRGoveXhiQXlmMDM0Sm9LNWQ2bSt5?=
 =?utf-8?B?YThkVFhMdHpQU1NqNWlaOG5uUkRINWNUd21EMVVaU0h6Ly9yZmJGdjVxODdq?=
 =?utf-8?B?VG5PczBuRmw4RmpxTWdlUEd6NWlvTWVCYnFVRTF4OUJLQmhYWkx0bEtwNkFL?=
 =?utf-8?B?VnRYNVZCSnhRMDY3dzRjUVNLdWRhd09LYWp1bWtML1hkQndFQWFLWjd3R0Rr?=
 =?utf-8?B?UGlYUERzc2FBb0JrcWV2c2xjdm9hTU1PTTNlYzlXLy9Ed0E0MFJGc2hwMTdu?=
 =?utf-8?B?aGtnVnhxRXBESFZ6REZxSW5NWngySnllV1IxQTFXMjgxd1VyZk9mR2EybjF3?=
 =?utf-8?B?M1ZNdTRXK2psSmtjbkphWkdHK0lQak5tNDZKUC9COUNrT2RwM2IzUVg0WFZv?=
 =?utf-8?B?R2JWUnZLcGsvZmVQenBnSmVCZ0NySXVWaGJEbU5YUlBuNStuZFhEY0EvWi9Q?=
 =?utf-8?B?VlNhdUxiT3o1VmFQcnljdHE2WFNOR3B1Q2o1TzJ2VzFDRmpRdWZwZU1OV3ky?=
 =?utf-8?B?ZnUzU2MxdUtseUNmVk16Z2VHVG1lcXdnWkM1b1hkbnBpeFpaenhPdGtaMUlU?=
 =?utf-8?B?bmVQNDBtQUhON3BkOXFSTmlkQVE5NFRKcWI1WngrL25QT1ZTRSt3cndwODU1?=
 =?utf-8?B?bFZBak5zbWJSYnVlYUx0TFRKYUUxVTByQ0plMC9KbERmQ0xST1R4dW9tNDBE?=
 =?utf-8?B?MnVpRy91eVhORjMwem41bllxUXhSaWVEc0p0ckdCQUJURGJ1Z05GaTdiYzR4?=
 =?utf-8?B?Y1kxdjloaDg2Y3FFR2NZSmgwYTkrNWtwSXllOGVyNWpETHR3Tm0rVUFCYTN6?=
 =?utf-8?B?WitRcDVFOHR0MThVZ3EzZXhCUGtycjhpYytJcFo3alFrWWVkRXEvTlFBQXUz?=
 =?utf-8?B?dXJ5bVdHRHR5UmFucVAra0RNMTlFcDIxS1JDenlrMk01bXN1Y1c1QkJRdENm?=
 =?utf-8?B?UTdZVFVUcG9KRW85Z21ka0ptMmlvNjdKRHZxLzFCQ1ZXNUVPeDBjMmpiWGdo?=
 =?utf-8?B?NVVSRXo1WnNlWjRSd3JPTWJNYStYWGlBUmF5cHE5SzZyUFB4QWpCWmtGcGdM?=
 =?utf-8?B?OUVuaFkrWk0wTllWamNzZ08yYzRMRy9UaFAzbWlrN1lqRE9QUXc1SnNHN1FZ?=
 =?utf-8?B?R3Z6ekFpVU9qNmF0V0pHekdSSldPUnBONTUrTnVTQVJIL0s5QW4yWU94dWFN?=
 =?utf-8?B?R0gwOWxmcG0xMFFTQU52NWpSbStKMDB0TGVTSUxJRkpIMUZFTzU1Y0pJN2RM?=
 =?utf-8?B?SUJjSkNBVmRQa1hqSUI2NHQyRFVXNFdKK0JYQjhLN3paMlNQUE84d3BsWUE3?=
 =?utf-8?B?NFdQazZDK2RYR0xkcGVyaU1veVpJdVFtaURITzZScUhFM0tvRUFicEhNVWdN?=
 =?utf-8?B?ekE1OTEyUjNmUVNVa3lhYXhYOXB1ZjZjcU9QWDhqbUsrMktndVFqaVZmNkd0?=
 =?utf-8?B?dWNubHluWnJyTlJnVlVFUVhoQnZjVHpLOGFDSThYcG5CSDhNT0tJNUZuV21j?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77054cdd-ab08-4039-14ca-08da96ec981f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 07:33:33.4811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ht1BSwDQoJyuYrZ7WennuDijw2L8SJZa7u8YYfzPDHVKviSGnnXeLcbbGPplA7DJnaV5bVeHt/OYsBYADbLhsr4m7dfivXLMiEbgS0WtPE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6060
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxlc3NhbmRyZWxsaSwg
RGFuaWVsZSA8ZGFuaWVsZS5hbGVzc2FuZHJlbGxpQGludGVsLmNvbT4NCj4gU2VudDogMTQgU2Vw
dGVtYmVyIDIwMjIgMDk6NDkgUE0NCj4gVG86IE11cnBoeSwgUGF1bCBKIDxwYXVsLmoubXVycGh5
QGludGVsLmNvbT47IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gc2hyYXZhbiBDaGlwcGEgLSBJMzUw
ODggPFNocmF2YW4uQ2hpcHBhQG1pY3JvY2hpcC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmc7IENvbm9yIERvb2xleSAtIE01MjY5MQ0KPiA8Q29ub3IuRG9vbGV5QG1pY3Jv
Y2hpcC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBCYXR0dQ0KPiBQcmFrYXNo
IFJlZGR5IC0gSTMwMzk5IDxQcmFrYXNoLkJhdHR1QG1pY3JvY2hpcC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjNdIG1lZGlhOiBpMmM6IGlteDMzNDogc3VwcG9ydCBsb3dlciBiYW5kd2lk
dGggbW9kZQ0KPiANCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUNCj4gY29udGVudCBpcyBzYWZlDQo+IA0K
PiBPbiBUdWUsIDIwMjItMDktMDYgYXQgMTM6NTMgKzA1MzAsIHNocmF2YW4ga3VtYXIgd3JvdGU6
DQo+ID4gPiBGcm9tOiBTaHJhdmFuIENoaXBwYSA8c2hyYXZhbi5jaGlwcGFAbWljcm9jaGlwLmNv
bT4NCj4gPiA+DQo+ID4gPiBTb21lIHBsYXRmb3JtcyBtYXkgbm90IGJlIGNhcGFibGUgb2Ygc3Vw
cG9ydGluZyB0aGUgYmFuZHdpZHRoDQo+ID4gPiByZXF1aXJlZCBmb3IgMTIgYml0IG9yIDM4NDB4
MjE2MCByZXNvbHV0aW9ucy4NCj4gPiA+DQo+ID4gPiBBZGQgc3VwcG9ydCBmb3IgZHluYW1pY2Fs
bHkgc2VsZWN0aW5nIDEwIGJpdCBhbmQgMTkyMHgxMDgwDQo+ID4gPiByZXNvbHV0aW9ucyB3aGls
ZSBsZWF2aW5nIHRoZSBleGlzdGluZyBjb25maWd1cmF0aW9uIGFzIGRlZmF1bHQNCj4gPiA+DQo+
ID4gPiBDQzogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFByYWthc2ggQmF0dHUgPFByYWthc2guQmF0dHVAbWljcm9jaGlwLmNv
bT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNocmF2YW4gQ2hpcHBhIDxzaHJhdmFuLmNoaXBwYUBt
aWNyb2NoaXAuY29tPg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2ghDQo+IA0KPiA+ID4gLS0t
DQo+ID4gPiBbUEFUQ0ggdjNdDQo+ID4gPiBGaXggZm9yIHdhcm5pbmcgUmVwb3J0ZWQtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+ID4NCj4gPiA+IFtQQVRDSCB2Ml0N
Cj4gPiA+IEZpeGUgZm9yIGJpZyBSZXBvcnRlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG9Aam1v
bmRpLm9yZz4NCj4gPiA+IC1pbXgzMzRfZW51bV9mcmFtZV9zaXplKCkgbG9vcCBmdW5jdGlvbg0K
PiA+ID4NCj4gPiA+IENoYW5nZXMgU3VnZ2VzdGVkIGJ5OiBKYWNvcG8gTW9uZGkgPGphY29wb0Bq
bW9uZGkub3JnPg0KPiA+ID4gLXJlbmFtZWQgYXJyYXkgY29kZXNbXSAtLT4gaW14MzM0X21idXNf
Y29kZXNbXQ0KPiA+ID4gLW1vZGlmaWVkIHN1cHBvcnRlZF9tb2Rlc1tdIHRvIGdldCBoaWdoZXIg
cmVzb2x1dGlvbiBmaXJzdA0KPiA+ID4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvbWVkaWEv
aTJjL2lteDMzNC5jIHwgMzA1DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjc5IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9u
cygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQu
YyBiL2RyaXZlcnMvbWVkaWEvaTJjL2lteDMzNC5jDQo+ID4gPiBpbmRleCAwNjIxMjU1MDE3ODgu
LjkyMGQ0MDdhYWEyZCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDMz
NC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYw0KPiA+ID4gQEAgLTc5
LDcgKzc5LDYgQEAgc3RydWN0IGlteDMzNF9yZWdfbGlzdCB7DQo+ID4gPiAgICogc3RydWN0IGlt
eDMzNF9tb2RlIC0gaW14MzM0IHNlbnNvciBtb2RlIHN0cnVjdHVyZQ0KPiA+ID4gICAqIEB3aWR0
aDogRnJhbWUgd2lkdGgNCj4gPiA+ICAgKiBAaGVpZ2h0OiBGcmFtZSBoZWlnaHQNCj4gPiA+IC0g
KiBAY29kZTogRm9ybWF0IGNvZGUNCj4gPiA+ICAgKiBAaGJsYW5rOiBIb3Jpem9udGFsIGJsYW5r
aW5nIGluIGxpbmVzDQo+ID4gPiAgICogQHZibGFuazogVmVydGljYWwgYmxhbmtpbmcgaW4gbGlu
ZXMNCj4gPiA+ICAgKiBAdmJsYW5rX21pbjogTWluaW1hbCB2ZXJ0aWNhbCBibGFua2luZyBpbiBs
aW5lcw0KPiA+ID4gQEAgLTkxLDcgKzkwLDYgQEAgc3RydWN0IGlteDMzNF9yZWdfbGlzdCB7DQo+
ID4gPiAgc3RydWN0IGlteDMzNF9tb2RlIHsNCj4gPiA+ICAgICAgICAgdTMyIHdpZHRoOw0KPiA+
ID4gICAgICAgICB1MzIgaGVpZ2h0Ow0KPiA+ID4gLSAgICAgICB1MzIgY29kZTsNCj4gPiA+ICAg
ICAgICAgdTMyIGhibGFuazsNCj4gPiA+ICAgICAgICAgdTMyIHZibGFuazsNCj4gPiA+ICAgICAg
ICAgdTMyIHZibGFua19taW47DQo+ID4gPiBAQCAtMTE5LDYgKzExNyw3IEBAIHN0cnVjdCBpbXgz
MzRfbW9kZSB7DQo+ID4gPiAgICogQHZibGFuazogVmVydGljYWwgYmxhbmtpbmcgaW4gbGluZXMN
Cj4gPiA+ICAgKiBAY3VyX21vZGU6IFBvaW50ZXIgdG8gY3VycmVudCBzZWxlY3RlZCBzZW5zb3Ig
bW9kZQ0KPiA+ID4gICAqIEBtdXRleDogTXV0ZXggZm9yIHNlcmlhbGl6aW5nIHNlbnNvciBjb250
cm9scw0KPiA+ID4gKyAqIEBjdXJfY29kZTogY3VycmVudCBzZWxlY3RlZCBmb3JtYXQgY29kZQ0K
PiA+ID4gICAqIEBzdHJlYW1pbmc6IEZsYWcgaW5kaWNhdGluZyBzdHJlYW1pbmcgc3RhdGUNCj4g
PiA+ICAgKi8NCj4gPiA+ICBzdHJ1Y3QgaW14MzM0IHsNCj4gPiA+IEBAIC0xNDAsNiArMTM5LDcg
QEAgc3RydWN0IGlteDMzNCB7DQo+ID4gPiAgICAgICAgIHUzMiB2Ymxhbms7DQo+ID4gPiAgICAg
ICAgIGNvbnN0IHN0cnVjdCBpbXgzMzRfbW9kZSAqY3VyX21vZGU7DQo+ID4gPiAgICAgICAgIHN0
cnVjdCBtdXRleCBtdXRleDsNCj4gPiA+ICsgICAgICAgdTMyIGN1cl9jb2RlOw0KPiA+ID4gICAg
ICAgICBib29sIHN0cmVhbWluZzsNCj4gPiA+ICB9Ow0KPiA+ID4NCj4gPiA+IEBAIC0xNDcsNiAr
MTQ3LDE2OSBAQCBzdGF0aWMgY29uc3QgczY0IGxpbmtfZnJlcVtdID0gew0KPiA+ID4gICAgICAg
ICBJTVgzMzRfTElOS19GUkVRLA0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4gKy8qIFNlbnNvciBt
b2RlIHJlZ2lzdGVycyAqLw0KPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW14MzM0X3JlZyBt
b2RlXzE5MjB4MTA4MF9yZWdzW10gPSB7DQo+ID4gPiArICAgICAgIHsweDMwMDAsIDB4MDF9LA0K
PiA+ID4gKyAgICAgICB7MHgzMDE4LCAweDA0fSwNCj4gPiA+ICsgICAgICAgezB4MzAzMCwgMHhD
QX0sDQo+ID4gPiArICAgICAgIHsweDMwMzEsIDB4MDh9LA0KPiA+ID4gKyAgICAgICB7MHgzMDMy
LCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4MzAzNCwgMHg0Q30sDQo+ID4gPiArICAgICAgIHsw
eDMwMzUsIDB4MDR9LA0KPiA+ID4gKyAgICAgICB7MHgzMDJDLCAweEYwfSwNCj4gPiA+ICsgICAg
ICAgezB4MzAyRCwgMHgwM30sDQo+ID4gPiArICAgICAgIHsweDMwMkUsIDB4ODB9LA0KPiA+ID4g
KyAgICAgICB7MHgzMDJGLCAweDA3fSwNCj4gPiA+ICsgICAgICAgezB4MzA3NCwgMHhDQ30sDQo+
ID4gPiArICAgICAgIHsweDMwNzUsIDB4MDJ9LA0KPiA+ID4gKyAgICAgICB7MHgzMDhFLCAweENE
fSwNCj4gPiA+ICsgICAgICAgezB4MzA4RiwgMHgwMn0sDQo+ID4gPiArICAgICAgIHsweDMwNzYs
IDB4Mzh9LA0KPiA+ID4gKyAgICAgICB7MHgzMDc3LCAweDA0fSwNCj4gPiA+ICsgICAgICAgezB4
MzA5MCwgMHgzOH0sDQo+ID4gPiArICAgICAgIHsweDMwOTEsIDB4MDR9LA0KPiA+ID4gKyAgICAg
ICB7MHgzMzA4LCAweDM4fSwNCj4gPiA+ICsgICAgICAgezB4MzMwOSwgMHgwNH0sDQo+ID4gPiAr
ICAgICAgIHsweDMwQzYsIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzMEM3LCAweDAwfSwNCj4g
PiA+ICsgICAgICAgezB4MzBDRSwgMHgwMH0sDQo+ID4gPiArICAgICAgIHsweDMwQ0YsIDB4MDB9
LA0KPiA+ID4gKyAgICAgICB7MHgzMEQ4LCAweDE4fSwNCj4gPiA+ICsgICAgICAgezB4MzBEOSwg
MHgwQX0sDQo+ID4gPiArICAgICAgIHsweDMwNEMsIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgz
MDRFLCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4MzA0RiwgMHgwMH0sDQo+ID4gPiArICAgICAg
IHsweDMwNTAsIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzMEI2LCAweDAwfSwNCj4gPiA+ICsg
ICAgICAgezB4MzBCNywgMHgwMH0sDQo+ID4gPiArICAgICAgIHsweDMxMTYsIDB4MDh9LA0KPiA+
ID4gKyAgICAgICB7MHgzMTE3LCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4MzFBMCwgMHgyMH0s
DQo+ID4gPiArICAgICAgIHsweDMxQTEsIDB4MEZ9LA0KPiA+ID4gKyAgICAgICB7MHgzMDBDLCAw
eDNCfSwNCj4gPiA+ICsgICAgICAgezB4MzAwRCwgMHgyOX0sDQo+ID4gPiArICAgICAgIHsweDMx
NEMsIDB4Mjl9LA0KPiA+ID4gKyAgICAgICB7MHgzMTRELCAweDAxfSwNCj4gPiA+ICsgICAgICAg
ezB4MzE1QSwgMHgwQX0sDQo+ID4gPiArICAgICAgIHsweDMxNjgsIDB4QTB9LA0KPiA+ID4gKyAg
ICAgICB7MHgzMTZBLCAweDdFfSwNCj4gPiA+ICsgICAgICAgezB4MzE5RSwgMHgwMn0sDQo+ID4g
PiArICAgICAgIHsweDMxOTksIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzMTlELCAweDAwfSwN
Cj4gPiA+ICsgICAgICAgezB4MzFERCwgMHgwM30sDQo+ID4gPiArICAgICAgIHsweDMzMDAsIDB4
MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzNDFDLCAweEZGfSwNCj4gPiA+ICsgICAgICAgezB4MzQx
RCwgMHgwMX0sDQo+ID4gPiArICAgICAgIHsweDNBMDEsIDB4MDN9LA0KPiA+ID4gKyAgICAgICB7
MHgzQTE4LCAweDdGfSwNCj4gPiA+ICsgICAgICAgezB4M0ExOSwgMHgwMH0sDQo+ID4gPiArICAg
ICAgIHsweDNBMUEsIDB4Mzd9LA0KPiA+ID4gKyAgICAgICB7MHgzQTFCLCAweDAwfSwNCj4gPiA+
ICsgICAgICAgezB4M0ExQywgMHgzN30sDQo+ID4gPiArICAgICAgIHsweDNBMUQsIDB4MDB9LA0K
PiA+ID4gKyAgICAgICB7MHgzQTFFLCAweEY3fSwNCj4gPiA+ICsgICAgICAgezB4M0ExRiwgMHgw
MH0sDQo+ID4gPiArICAgICAgIHsweDNBMjAsIDB4M0Z9LA0KPiA+ID4gKyAgICAgICB7MHgzQTIx
LCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4M0EyMCwgMHg2Rn0sDQo+ID4gPiArICAgICAgIHsw
eDNBMjEsIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzQTIwLCAweDNGfSwNCj4gPiA+ICsgICAg
ICAgezB4M0EyMSwgMHgwMH0sDQo+ID4gPiArICAgICAgIHsweDNBMjAsIDB4NUZ9LA0KPiA+ID4g
KyAgICAgICB7MHgzQTIxLCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4M0EyMCwgMHgyRn0sDQo+
ID4gPiArICAgICAgIHsweDNBMjEsIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzMDc4LCAweDAy
fSwNCj4gPiA+ICsgICAgICAgezB4MzA3OSwgMHgwMH0sDQo+ID4gPiArICAgICAgIHsweDMwN0Es
IDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzMDdCLCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4
MzA4MCwgMHgwMn0sDQo+ID4gPiArICAgICAgIHsweDMwODEsIDB4MDB9LA0KPiA+ID4gKyAgICAg
ICB7MHgzMDgyLCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4MzA4MywgMHgwMH0sDQo+ID4gPiAr
ICAgICAgIHsweDMwODgsIDB4MDJ9LA0KPiA+ID4gKyAgICAgICB7MHgzMDk0LCAweDAwfSwNCj4g
PiA+ICsgICAgICAgezB4MzA5NSwgMHgwMH0sDQo+ID4gPiArICAgICAgIHsweDMwOTYsIDB4MDB9
LA0KPiA+ID4gKyAgICAgICB7MHgzMDlCLCAweDAyfSwNCj4gPiA+ICsgICAgICAgezB4MzA5Qywg
MHgwMH0sDQo+ID4gPiArICAgICAgIHsweDMwOUQsIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgz
MDlFLCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4MzBBNCwgMHgwMH0sDQo+ID4gPiArICAgICAg
IHsweDMwQTUsIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzMjg4LCAweDIxfSwNCj4gPiA+ICsg
ICAgICAgezB4MzI4QSwgMHgwMn0sDQo+ID4gPiArICAgICAgIHsweDM0MTQsIDB4MDV9LA0KPiA+
ID4gKyAgICAgICB7MHgzNDE2LCAweDE4fSwNCj4gPiA+ICsgICAgICAgezB4MzVBQywgMHgwRX0s
DQo+ID4gPiArICAgICAgIHsweDM2NDgsIDB4MDF9LA0KPiA+ID4gKyAgICAgICB7MHgzNjRBLCAw
eDA0fSwNCj4gPiA+ICsgICAgICAgezB4MzY0QywgMHgwNH0sDQo+ID4gPiArICAgICAgIHsweDM2
NzgsIDB4MDF9LA0KPiA+ID4gKyAgICAgICB7MHgzNjdDLCAweDMxfSwNCj4gPiA+ICsgICAgICAg
ezB4MzY3RSwgMHgzMX0sDQo+ID4gPiArICAgICAgIHsweDM3MDgsIDB4MDJ9LA0KPiA+ID4gKyAg
ICAgICB7MHgzNzE0LCAweDAxfSwNCj4gPiA+ICsgICAgICAgezB4MzcxNSwgMHgwMn0sDQo+ID4g
PiArICAgICAgIHsweDM3MTYsIDB4MDJ9LA0KPiA+ID4gKyAgICAgICB7MHgzNzE3LCAweDAyfSwN
Cj4gPiA+ICsgICAgICAgezB4MzcxQywgMHgzRH0sDQo+ID4gPiArICAgICAgIHsweDM3MUQsIDB4
M0Z9LA0KPiA+ID4gKyAgICAgICB7MHgzNzJDLCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4Mzcy
RCwgMHgwMH0sDQo+ID4gPiArICAgICAgIHsweDM3MkUsIDB4NDZ9LA0KPiA+ID4gKyAgICAgICB7
MHgzNzJGLCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4MzczMCwgMHg4OX0sDQo+ID4gPiArICAg
ICAgIHsweDM3MzEsIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzNzMyLCAweDA4fSwNCj4gPiA+
ICsgICAgICAgezB4MzczMywgMHgwMX0sDQo+ID4gPiArICAgICAgIHsweDM3MzQsIDB4RkV9LA0K
PiA+ID4gKyAgICAgICB7MHgzNzM1LCAweDA1fSwNCj4gPiA+ICsgICAgICAgezB4Mzc1RCwgMHgw
MH0sDQo+ID4gPiArICAgICAgIHsweDM3NUUsIDB4MDB9LA0KPiA+ID4gKyAgICAgICB7MHgzNzVG
LCAweDYxfSwNCj4gPiA+ICsgICAgICAgezB4Mzc2MCwgMHgwNn0sDQo+ID4gPiArICAgICAgIHsw
eDM3NjgsIDB4MUJ9LA0KPiA+ID4gKyAgICAgICB7MHgzNzY5LCAweDFCfSwNCj4gPiA+ICsgICAg
ICAgezB4Mzc2QSwgMHgxQX0sDQo+ID4gPiArICAgICAgIHsweDM3NkIsIDB4MTl9LA0KPiA+ID4g
KyAgICAgICB7MHgzNzZDLCAweDE4fSwNCj4gPiA+ICsgICAgICAgezB4Mzc2RCwgMHgxNH0sDQo+
ID4gPiArICAgICAgIHsweDM3NkUsIDB4MEZ9LA0KPiA+ID4gKyAgICAgICB7MHgzNzc2LCAweDAw
fSwNCj4gPiA+ICsgICAgICAgezB4Mzc3NywgMHgwMH0sDQo+ID4gPiArICAgICAgIHsweDM3Nzgs
IDB4NDZ9LA0KPiA+ID4gKyAgICAgICB7MHgzNzc5LCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4
Mzc3QSwgMHgwOH0sDQo+ID4gPiArICAgICAgIHsweDM3N0IsIDB4MDF9LA0KPiA+ID4gKyAgICAg
ICB7MHgzNzdDLCAweDQ1fSwNCj4gPiA+ICsgICAgICAgezB4Mzc3RCwgMHgwMX0sDQo+ID4gPiAr
ICAgICAgIHsweDM3N0UsIDB4MjN9LA0KPiA+ID4gKyAgICAgICB7MHgzNzdGLCAweDAyfSwNCj4g
PiA+ICsgICAgICAgezB4Mzc4MCwgMHhEOX0sDQo+ID4gPiArICAgICAgIHsweDM3ODEsIDB4MDN9
LA0KPiA+ID4gKyAgICAgICB7MHgzNzgyLCAweEY1fSwNCj4gPiA+ICsgICAgICAgezB4Mzc4Mywg
MHgwNn0sDQo+ID4gPiArICAgICAgIHsweDM3ODQsIDB4QTV9LA0KPiA+ID4gKyAgICAgICB7MHgz
Nzg4LCAweDBGfSwNCj4gPiA+ICsgICAgICAgezB4Mzc4QSwgMHhEOX0sDQo+ID4gPiArICAgICAg
IHsweDM3OEIsIDB4MDN9LA0KPiA+ID4gKyAgICAgICB7MHgzNzhDLCAweEVCfSwNCj4gPiA+ICsg
ICAgICAgezB4Mzc4RCwgMHgwNX0sDQo+ID4gPiArICAgICAgIHsweDM3OEUsIDB4ODd9LA0KPiA+
ID4gKyAgICAgICB7MHgzNzhGLCAweDA2fSwNCj4gPiA+ICsgICAgICAgezB4Mzc5MCwgMHhGNX0s
DQo+ID4gPiArICAgICAgIHsweDM3OTIsIDB4NDN9LA0KPiA+ID4gKyAgICAgICB7MHgzNzk0LCAw
eDdBfSwNCj4gPiA+ICsgICAgICAgezB4Mzc5NiwgMHhBMX0sDQo+ID4gPiArICAgICAgIHsweDM3
QjAsIDB4Mzd9LA0KPiA+ID4gKyAgICAgICB7MHgzRTA0LCAweDBFfSwNCj4gPiA+ICsgICAgICAg
ezB4MzBFOCwgMHg1MH0sDQo+ID4gPiArICAgICAgIHsweDMwRTksIDB4MDB9LA0KPiA+ID4gKyAg
ICAgICB7MHgzRTA0LCAweDBFfSwNCj4gPiA+ICsgICAgICAgezB4MzAwMiwgMHgwMH0sDQo+ID4g
PiArfTsNCj4gPiA+ICsNCj4gPiA+ICAvKiBTZW5zb3IgbW9kZSByZWdpc3RlcnMgKi8NCj4gPiA+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGlteDMzNF9yZWcgbW9kZV8zODQweDIxNjBfcmVnc1tdID0g
ew0KPiA+ID4gICAgICAgICB7MHgzMDAwLCAweDAxfSwNCj4gPiA+IEBAIC0yNDMsMjAgKzQwNiw1
NiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlteDMzNF9yZWcNCj4gbW9kZV8zODQweDIxNjBfcmVn
c1tdID0gew0KPiA+ID4gICAgICAgICB7MHgzYTAwLCAweDAxfSwNCj4gPiA+ICB9Ow0KPiA+ID4N
Cj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlteDMzNF9yZWcgcmF3MTBfZnJhbWVmbXRfcmVn
c1tdID0gew0KPiA+ID4gKyAgICAgICB7MHgzMDUwLCAweDAwfSwNCj4gPiA+ICsgICAgICAgezB4
MzE5RCwgMHgwMH0sDQo+ID4gPiArICAgICAgIHsweDM0MUMsIDB4RkZ9LA0KPiA+ID4gKyAgICAg
ICB7MHgzNDFELCAweDAxfSwNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgaW14MzM0X3JlZyByYXcxMl9mcmFtZWZtdF9yZWdzW10gPSB7DQo+ID4gPiArICAg
ICAgIHsweDMwNTAsIDB4MDF9LA0KPiA+ID4gKyAgICAgICB7MHgzMTlELCAweDAxfSwNCj4gPiA+
ICsgICAgICAgezB4MzQxQywgMHg0N30sDQo+ID4gPiArICAgICAgIHsweDM0MUQsIDB4MDB9LA0K
PiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiArLyoNCj4gPiA+ICsgKiBUaGUgc3VwcG9ydGVkIEJV
UyBmb3JtYXRzLg0KPiA+ID4gKyAqLw0KPiA+ID4gK3N0YXRpYyBjb25zdCB1MzIgaW14MzM0X21i
dXNfY29kZXNbXSA9IHsNCj4gPiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9TUkdHQjEwXzFYMTAs
DQo+ID4gPiArICAgICAgIE1FRElBX0JVU19GTVRfU1JHR0IxMl8xWDEyLA0KPiA+ID4gK307DQo+
ID4gPiArDQo+ID4gPiAgLyogU3VwcG9ydGVkIHNlbnNvciBtb2RlIGNvbmZpZ3VyYXRpb25zICov
DQo+ID4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBpbXgzMzRfbW9kZSBzdXBwb3J0ZWRfbW9kZSA9
IHsNCj4gPiA+IC0gICAgICAgLndpZHRoID0gMzg0MCwNCj4gPiA+IC0gICAgICAgLmhlaWdodCA9
IDIxNjAsDQo+ID4gPiAtICAgICAgIC5oYmxhbmsgPSA1NjAsDQo+ID4gPiAtICAgICAgIC52Ymxh
bmsgPSAyMzQwLA0KPiA+ID4gLSAgICAgICAudmJsYW5rX21pbiA9IDkwLA0KPiA+ID4gLSAgICAg
ICAudmJsYW5rX21heCA9IDEzMjg0MCwNCj4gPiA+IC0gICAgICAgLnBjbGsgPSA1OTQwMDAwMDAs
DQo+ID4gPiAtICAgICAgIC5saW5rX2ZyZXFfaWR4ID0gMCwNCj4gPiA+IC0gICAgICAgLmNvZGUg
PSBNRURJQV9CVVNfRk1UX1NSR0dCMTJfMVgxMiwNCj4gPiA+IC0gICAgICAgLnJlZ19saXN0ID0g
ew0KPiA+ID4gLSAgICAgICAgICAgICAgIC5udW1fb2ZfcmVncyA9IEFSUkFZX1NJWkUobW9kZV8z
ODQweDIxNjBfcmVncyksDQo+ID4gPiAtICAgICAgICAgICAgICAgLnJlZ3MgPSBtb2RlXzM4NDB4
MjE2MF9yZWdzLA0KPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW14MzM0X21vZGUgc3VwcG9y
dGVkX21vZGVzW10gPSB7DQo+ID4gPiArICAgICAgIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAu
d2lkdGggPSAzODQwLA0KPiA+ID4gKyAgICAgICAgICAgICAgIC5oZWlnaHQgPSAyMTYwLA0KPiA+
ID4gKyAgICAgICAgICAgICAgIC5oYmxhbmsgPSA1NjAsDQo+ID4gPiArICAgICAgICAgICAgICAg
LnZibGFuayA9IDIzNDAsDQo+ID4gPiArICAgICAgICAgICAgICAgLnZibGFua19taW4gPSA5MCwN
Cj4gPiA+ICsgICAgICAgICAgICAgICAudmJsYW5rX21heCA9IDEzMjg0MCwNCj4gPiA+ICsgICAg
ICAgICAgICAgICAucGNsayA9IDU5NDAwMDAwMCwNCj4gPiA+ICsgICAgICAgICAgICAgICAubGlu
a19mcmVxX2lkeCA9IDAsDQo+ID4gPiArICAgICAgICAgICAgICAgLnJlZ19saXN0ID0gew0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLm51bV9vZl9yZWdzID0gQVJSQVlfU0laRShtb2Rl
XzM4NDB4MjE2MF9yZWdzKSwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC5yZWdzID0g
bW9kZV8zODQweDIxNjBfcmVncywNCj4gPiA+ICsgICAgICAgICAgICAgICB9LA0KPiA+ID4gKyAg
ICAgICB9LCB7DQo+ID4gPiArICAgICAgICAgICAgICAgLndpZHRoID0gMTkyMCwNCj4gPiA+ICsg
ICAgICAgICAgICAgICAuaGVpZ2h0ID0gMTA4MCwNCj4gPiA+ICsgICAgICAgICAgICAgICAuaGJs
YW5rID0gNTYwLA0KPiA+ID4gKyAgICAgICAgICAgICAgIC52YmxhbmsgPSAxMTcwLA0KPiA+ID4g
KyAgICAgICAgICAgICAgIC52YmxhbmtfbWluID0gOTAsDQo+ID4gPiArICAgICAgICAgICAgICAg
LnZibGFua19tYXggPSAxMzI4NDAsDQo+ID4gPiArICAgICAgICAgICAgICAgLnBjbGsgPSA1OTQw
MDAwMDAsDQo+ID4gPiArICAgICAgICAgICAgICAgLmxpbmtfZnJlcV9pZHggPSAwLA0KPiA+ID4g
KyAgICAgICAgICAgICAgIC5yZWdfbGlzdCA9IHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIC5udW1fb2ZfcmVncyA9IEFSUkFZX1NJWkUobW9kZV8xOTIweDEwODBfcmVncyksDQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAucmVncyA9IG1vZGVfMTkyMHgxMDgwX3JlZ3MsDQo+
ID4gPiArICAgICAgICAgICAgICAgfSwNCj4gPiA+ICAgICAgICAgfSwNCj4gPiA+ICB9Ow0KPiA+
ID4NCj4gPiA+IEBAIC01MDYsMTAgKzcwNSwxMCBAQCBzdGF0aWMgaW50IGlteDMzNF9lbnVtX21i
dXNfY29kZShzdHJ1Y3QNCj4gdjRsMl9zdWJkZXYgKnNkLA0KPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHY0bDJfc3ViZGV2X3N0YXRlICpzZF9zdGF0ZSwNCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2NGwyX3N1YmRldl9t
YnVzX2NvZGVfZW51bSAqY29kZSkNCj4gPiA+ICB7DQo+ID4gPiAtICAgICAgIGlmIChjb2RlLT5p
bmRleCA+IDApDQo+ID4gPiArICAgICAgIGlmIChjb2RlLT5pbmRleCA+PSBBUlJBWV9TSVpFKGlt
eDMzNF9tYnVzX2NvZGVzKSkNCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gPiA+DQo+ID4gPiAtICAgICAgIGNvZGUtPmNvZGUgPSBzdXBwb3J0ZWRfbW9kZS5jb2RlOw0K
PiA+ID4gKyAgICAgICBjb2RlLT5jb2RlID0gaW14MzM0X21idXNfY29kZXNbY29kZS0+aW5kZXhd
Ow0KPiA+ID4NCj4gPiA+ICAgICAgICAgcmV0dXJuIDA7DQo+ID4gPiAgfQ0KPiA+ID4gQEAgLTUy
NiwxNSArNzI1LDIyIEBAIHN0YXRpYyBpbnQgaW14MzM0X2VudW1fZnJhbWVfc2l6ZShzdHJ1Y3QN
Cj4gdjRsMl9zdWJkZXYgKnNkLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSAqc2Rfc3RhdGUsDQo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHY0bDJfc3ViZGV2X2ZyYW1lX3NpemVfZW51
bSAqZnNpemUpDQo+ID4gPiAgew0KPiA+ID4gLSAgICAgICBpZiAoZnNpemUtPmluZGV4ID4gMCkN
Cj4gPiA+ICsgICAgICAgdW5zaWduZWQgaW50IGk7DQo+ID4gPiArDQo+ID4gPiArICAgICAgIGlm
IChmc2l6ZS0+aW5kZXggPj0gQVJSQVlfU0laRShzdXBwb3J0ZWRfbW9kZXMpKQ0KPiA+ID4gICAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4NCj4gPiA+IC0gICAgICAgaWYgKGZz
aXplLT5jb2RlICE9IHN1cHBvcnRlZF9tb2RlLmNvZGUpDQo+ID4gPiArICAgICAgIGZvciAoaSA9
IDA7IGkgPCBBUlJBWV9TSVpFKGlteDMzNF9tYnVzX2NvZGVzKTsgKytpKSB7DQo+ID4gPiArICAg
ICAgICAgICAgICAgaWYgKGlteDMzNF9tYnVzX2NvZGVzW2ldID09IGZzaXplLT5jb2RlKQ0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICAgIH0NCj4gPiA+
ICsNCj4gPiA+ICsgICAgICAgaWYgKGkgPT0gQVJSQVlfU0laRShpbXgzMzRfbWJ1c19jb2Rlcykp
DQo+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPg0KPiA+ID4gLSAg
ICAgICBmc2l6ZS0+bWluX3dpZHRoID0gc3VwcG9ydGVkX21vZGUud2lkdGg7DQo+ID4gPiArICAg
ICAgIGZzaXplLT5taW5fd2lkdGggPSBzdXBwb3J0ZWRfbW9kZXNbZnNpemUtPmluZGV4XS53aWR0
aDsNCj4gPiA+ICAgICAgICAgZnNpemUtPm1heF93aWR0aCA9IGZzaXplLT5taW5fd2lkdGg7DQo+
ID4gPiAtICAgICAgIGZzaXplLT5taW5faGVpZ2h0ID0gc3VwcG9ydGVkX21vZGUuaGVpZ2h0Ow0K
PiA+ID4gKyAgICAgICBmc2l6ZS0+bWluX2hlaWdodCA9IHN1cHBvcnRlZF9tb2Rlc1tmc2l6ZS0+
aW5kZXhdLmhlaWdodDsNCj4gPiA+ICAgICAgICAgZnNpemUtPm1heF9oZWlnaHQgPSBmc2l6ZS0+
bWluX2hlaWdodDsNCj4gPiA+DQo+ID4gPiAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gQEAgLTU1
Myw3ICs3NTksNyBAQCBzdGF0aWMgdm9pZCBpbXgzMzRfZmlsbF9wYWRfZm9ybWF0KHN0cnVjdCBp
bXgzMzQNCj4gKmlteDMzNCwNCj4gPiA+ICB7DQo+ID4gPiAgICAgICAgIGZtdC0+Zm9ybWF0Lndp
ZHRoID0gbW9kZS0+d2lkdGg7DQo+ID4gPiAgICAgICAgIGZtdC0+Zm9ybWF0LmhlaWdodCA9IG1v
ZGUtPmhlaWdodDsNCj4gPiA+IC0gICAgICAgZm10LT5mb3JtYXQuY29kZSA9IG1vZGUtPmNvZGU7
DQo+ID4gPiArICAgICAgIGZtdC0+Zm9ybWF0LmNvZGUgPSBpbXgzMzQtPmN1cl9jb2RlOw0KPiA+
ID4gICAgICAgICBmbXQtPmZvcm1hdC5maWVsZCA9IFY0TDJfRklFTERfTk9ORTsNCj4gPiA+ICAg
ICAgICAgZm10LT5mb3JtYXQuY29sb3JzcGFjZSA9IFY0TDJfQ09MT1JTUEFDRV9SQVc7DQo+ID4g
PiAgICAgICAgIGZtdC0+Zm9ybWF0LnljYmNyX2VuYyA9IFY0TDJfWUNCQ1JfRU5DX0RFRkFVTFQ7
DQo+ID4gPiBAQCAtNTkxLDYgKzc5NywyMSBAQCBzdGF0aWMgaW50IGlteDMzNF9nZXRfcGFkX2Zv
cm1hdChzdHJ1Y3QNCj4gdjRsMl9zdWJkZXYgKnNkLA0KPiA+ID4gICAgICAgICByZXR1cm4gMDsN
Cj4gPiA+ICB9DQo+ID4gPg0KPiA+ID4gK3N0YXRpYyBpbnQgaW14MzM0X2dldF9mb3JtYXRfY29k
ZShzdHJ1Y3QgaW14MzM0ICppbXgzMzQsIHN0cnVjdA0KPiB2NGwyX3N1YmRldl9mb3JtYXQgKmZt
dCkNCj4gPiA+ICt7DQo+ID4gPiArICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+ID4gKw0KPiA+
ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShpbXgzMzRfbWJ1c19jb2Rlcyk7
IGkrKykgew0KPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChpbXgzMzRfbWJ1c19jb2Rlc1tpXSA9
PSBmbXQtPmZvcm1hdC5jb2RlKQ0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
DQo+ID4gPiArICAgICAgIH0NCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgaWYgKGkgPj0gQVJSQVlf
U0laRShpbXgzMzRfbWJ1c19jb2RlcykpDQo+ID4gPiArICAgICAgICAgICAgICAgaSA9IDA7DQo+
IA0KPiBJZiBJIHVuZGVyc3RhbmQgdGhlIHVsdGltYXRlIGVmZmVjdCBvZiB0aGlzIGNvZGUgY29y
cmVjdGx5LCB3ZSBmYWxsYmFjaw0KPiB0byBNRURJQV9CVVNfRk1UX1NSR0dCMTBfMVgxMCBpZiB0
aGUgc3BlY2lmaWVkIGZvcm1hdCBjb2RlIGlzIG5vdA0KPiBzdXBwb3J0ZWQsIHdoaWxlIGJlZm9y
ZSB0aGlzIGNoYW5nZSB3ZSB3ZXJlIGFsd2F5cyB1c2luZw0KPiBNRURJQV9CVVNfRk1UX1NSR0dC
MTBfMVgxMi4gDQo+IA0KPiBJcyB0aGlzIGludGVuZGVkPyBXb3VsZCBpdCBiZSBiZXR0ZXIgdG8g
bGVhdmUgdGhlIHNhbWUgYmVoYXZpb3IgYXMgdGhlDQo+IGN1cnJlbnQgZHJpdmVyPw0KDQpJZiBp
dCBmYWlsIHRvIGZpbmQgdGggYnVzIGNvZGUgdGhlbiwgSSB3aWxsIHRyeSBzZXQgU1JHR0IxMF8x
WDEyIGFzIGRlZmF1bHQuDQoNCj4gDQo+ID4gPiArDQo+ID4gPiArICAgICAgIHJldHVybiBpbXgz
MzRfbWJ1c19jb2Rlc1tpXTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiAgLyoqDQo+ID4gPiAg
ICogaW14MzM0X3NldF9wYWRfZm9ybWF0KCkgLSBTZXQgc3ViZGV2aWNlIHBhZCBmb3JtYXQNCj4g
PiA+ICAgKiBAc2Q6IHBvaW50ZXIgdG8gaW14MzM0IFY0TDIgc3ViLWRldmljZSBzdHJ1Y3R1cmUN
Cj4gPiA+IEBAIC02MDYsMTAgKzgyNywxOSBAQCBzdGF0aWMgaW50IGlteDMzNF9zZXRfcGFkX2Zv
cm1hdChzdHJ1Y3QNCj4gdjRsMl9zdWJkZXYgKnNkLA0KPiA+ID4gICAgICAgICBzdHJ1Y3QgaW14
MzM0ICppbXgzMzQgPSB0b19pbXgzMzQoc2QpOw0KPiA+ID4gICAgICAgICBjb25zdCBzdHJ1Y3Qg
aW14MzM0X21vZGUgKm1vZGU7DQo+ID4gPiAgICAgICAgIGludCByZXQgPSAwOw0KPiA+ID4gKyAg
ICAgICB1MzIgY29kZTsNCj4gPiA+DQo+ID4gPiAgICAgICAgIG11dGV4X2xvY2soJmlteDMzNC0+
bXV0ZXgpOw0KPiA+ID4NCj4gPiA+IC0gICAgICAgbW9kZSA9ICZzdXBwb3J0ZWRfbW9kZTsNCj4g
PiA+ICsgICAgICAgY29kZSA9IGlteDMzNF9nZXRfZm9ybWF0X2NvZGUoaW14MzM0LCBmbXQpOw0K
PiANCj4gbml0cGljazogeW91IHByb2JhYmx5IGRvbid0IG5lZWQgdGhlICdjb2RlJyB2YXJpYWJs
ZSBhbmQgY2FuIHNpbXBseSBkbzoNCj4gDQo+ICAgIGlteDMzNC0+Y3VyX2NvZGUgPSBpbXgzMzRf
Z2V0X2Zvcm1hdF9jb2RlKGlteDMzNCwgZm10KTsNCj4gDQo+ID4gPiArDQo+ID4gPiArICAgICAg
IGlteDMzNC0+Y3VyX2NvZGUgPSBjb2RlOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBtb2RlID0g
djRsMl9maW5kX25lYXJlc3Rfc2l6ZShzdXBwb3J0ZWRfbW9kZXMsDQo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSUkFZX1NJWkUoc3VwcG9ydGVkX21vZGVzKSwN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd2lkdGgsIGhlaWdo
dCwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm10LT5mb3Jt
YXQud2lkdGgsIGZtdC0+Zm9ybWF0LmhlaWdodCk7DQo+ID4gPiArDQo+ID4gPiAgICAgICAgIGlt
eDMzNF9maWxsX3BhZF9mb3JtYXQoaW14MzM0LCBtb2RlLCBmbXQpOw0KPiA+ID4NCj4gPiA+ICAg
ICAgICAgaWYgKGZtdC0+d2hpY2ggPT0gVjRMMl9TVUJERVZfRk9STUFUX1RSWSkgew0KPiA+ID4g
QEAgLTYxNyw3ICs4NDcsNyBAQCBzdGF0aWMgaW50IGlteDMzNF9zZXRfcGFkX2Zvcm1hdChzdHJ1
Y3QNCj4gdjRsMl9zdWJkZXYgKnNkLA0KPiA+ID4NCj4gPiA+ICAgICAgICAgICAgICAgICBmcmFt
ZWZtdCA9IHY0bDJfc3ViZGV2X2dldF90cnlfZm9ybWF0KHNkLCBzZF9zdGF0ZSwgZm10LQ0KPiA+
cGFkKTsNCj4gPiA+ICAgICAgICAgICAgICAgICAqZnJhbWVmbXQgPSBmbXQtPmZvcm1hdDsNCj4g
PiA+IC0gICAgICAgfSBlbHNlIHsNCj4gPiA+ICsgICAgICAgfSBlbHNlIGlmIChpbXgzMzQtPmN1
cl9tb2RlICE9IG1vZGUpIHsNCj4gDQo+IFRoaXMgc2Vjb25kICdpZicgaXMgbm90IHVzZWQgaW4g
YW55IG90aGVyIGRyaXZlci4gSXMgdGhpcyBzb21lIGtpbmQgb2YNCj4gb3B0aW1pemF0aW9uPw0K
PiANCj4gSWYgdGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgYWZ0ZXIgcHJvYmUoKSBhbmQgaW14MzM0
LT5jdXJfbW9kZSA9PSBtb2RlLA0KPiBJIHRoaW5rIHRoYXQgaW14MzM0X3VwZGF0ZV9jb250cm9s
cygpIHdpbGwgbm90IGJlIGNhbGxlZCBmb3IgdGhlDQo+IHNwZWNpZmllZCBtb2RlLiBJJ20gbm90
IHN1cmUgaWYgdGhhdCdzIE9LIG9yIG5vdC4NCg0KSW4gcHJvYmUgZnVuY3Rpb24gaW14MzM0X2lu
aXRfY29udHJvbHMoKSB3aWxsIHRha2UgdGhlIGN1cl9tb2RlIHZhbHVlIGFzIGRlZmF1bHQgdmFs
dWVzLg0KTWF5IGJlIHdlIGRvIG5vdCBuZWVkIHRvIHVwZGF0ZSB0aGUgbW9kZSB2YWx1ZXMgdW50
aWwgdGhlIG1vZGUgY2hhbmdlcw0KDQo+IA0KPiA+ID4gICAgICAgICAgICAgICAgIHJldCA9IGlt
eDMzNF91cGRhdGVfY29udHJvbHMoaW14MzM0LCBtb2RlKTsNCj4gPiA+ICAgICAgICAgICAgICAg
ICBpZiAoIXJldCkNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlteDMzNC0+Y3VyX21v
ZGUgPSBtb2RlOw0KPiA+ID4gQEAgLTY0MiwxMSArODcyLDI2IEBAIHN0YXRpYyBpbnQgaW14MzM0
X2luaXRfcGFkX2NmZyhzdHJ1Y3QNCj4gdjRsMl9zdWJkZXYgKnNkLA0KPiA+ID4gICAgICAgICBz
dHJ1Y3QgdjRsMl9zdWJkZXZfZm9ybWF0IGZtdCA9IHsgMCB9Ow0KPiA+ID4NCj4gPiA+ICAgICAg
ICAgZm10LndoaWNoID0gc2Rfc3RhdGUgPyBWNEwyX1NVQkRFVl9GT1JNQVRfVFJZIDoNCj4gVjRM
Ml9TVUJERVZfRk9STUFUX0FDVElWRTsNCj4gPiA+IC0gICAgICAgaW14MzM0X2ZpbGxfcGFkX2Zv
cm1hdChpbXgzMzQsICZzdXBwb3J0ZWRfbW9kZSwgJmZtdCk7DQo+ID4gPiArICAgICAgIGlteDMz
NF9maWxsX3BhZF9mb3JtYXQoaW14MzM0LCAmc3VwcG9ydGVkX21vZGVzWzFdLCAmZm10KTsNCj4g
DQo+IFRoZSBuZXdseSBhZGRlZCBtb2RlIGlzIG5vdyB1c2VkIGJ5IHRoaXMgZnVuY3Rpb24gaW5z
dGVhZCBvZiB0aGUgb2xkDQo+IG9uZS4gTm90IHN1cmUgaWYgdGhpcyBpcyBpbnRlbmRlZCBvciBu
b3QuDQo+IA0KPiA+ID4NCj4gPiA+ICAgICAgICAgcmV0dXJuIGlteDMzNF9zZXRfcGFkX2Zvcm1h
dChzZCwgc2Rfc3RhdGUsICZmbXQpOw0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiArc3RhdGljIGlu
dCBpbXgzMzRfc2V0X2ZyYW1lZm10KHN0cnVjdCBpbXgzMzQgKmlteDMzNCkNCj4gPiA+ICt7DQo+
ID4gPiArICAgICAgIHN3aXRjaCAoaW14MzM0LT5jdXJfY29kZSkgew0KPiA+ID4gKyAgICAgICBj
YXNlIE1FRElBX0JVU19GTVRfU1JHR0IxMF8xWDEwOg0KPiA+ID4gKyAgICAgICAgICAgICAgIHJl
dHVybiBpbXgzMzRfd3JpdGVfcmVncyhpbXgzMzQsIHJhdzEwX2ZyYW1lZm10X3JlZ3MsDQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShyYXcx
MF9mcmFtZWZtdF9yZWdzKSk7DQo+ID4gPiArDQo+ID4gPiArICAgICAgIGNhc2UgTUVESUFfQlVT
X0ZNVF9TUkdHQjEyXzFYMTI6DQo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGlteDMzNF93
cml0ZV9yZWdzKGlteDMzNCwgcmF3MTJfZnJhbWVmbXRfcmVncywNCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKHJhdzEyX2ZyYW1lZm10X3Jl
Z3MpKTsNCj4gPiA+ICsgICAgICAgfQ0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiAgLyoqDQo+ID4gPiAgICogaW14MzM0X3N0
YXJ0X3N0cmVhbWluZygpIC0gU3RhcnQgc2Vuc29yIHN0cmVhbQ0KPiA+ID4gICAqIEBpbXgzMzQ6
IHBvaW50ZXIgdG8gaW14MzM0IGRldmljZQ0KPiA+ID4gQEAgLTY2Nyw2ICs5MTIsMTMgQEAgc3Rh
dGljIGludCBpbXgzMzRfc3RhcnRfc3RyZWFtaW5nKHN0cnVjdCBpbXgzMzQNCj4gKmlteDMzNCkN
Cj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4gICAgICAgICB9DQo+ID4g
Pg0KPiA+ID4gKyAgICAgICByZXQgPSBpbXgzMzRfc2V0X2ZyYW1lZm10KGlteDMzNCk7DQo+ID4g
PiArICAgICAgIGlmIChyZXQpIHsNCj4gPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGlteDMz
NC0+ZGV2LCAiJXMgZmFpbGVkIHRvIHNldCBmcmFtZSBmb3JtYXQ6ICVkXG4iLA0KPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIHJldCk7DQo+ID4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsNCj4gPiA+ICsgICAgICAgfQ0KPiA+ID4gKw0KPiA+ID4gICAgICAgICAv
KiBTZXR1cCBoYW5kbGVyIHdpbGwgd3JpdGUgYWN0dWFsIGV4cG9zdXJlIGFuZCBnYWluICovDQo+
ID4gPiAgICAgICAgIHJldCA9ICBfX3Y0bDJfY3RybF9oYW5kbGVyX3NldHVwKGlteDMzNC0+c2Qu
Y3RybF9oYW5kbGVyKTsNCj4gPiA+ICAgICAgICAgaWYgKHJldCkgew0KPiA+ID4gQEAgLTEwMzcs
NyArMTI4OSw4IEBAIHN0YXRpYyBpbnQgaW14MzM0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpDQo+ID4gPiAgICAgICAgIH0NCj4gPiA+DQo+ID4gPiAgICAgICAgIC8qIFNldCBkZWZh
dWx0IG1vZGUgdG8gbWF4IHJlc29sdXRpb24gKi8NCj4gPiA+IC0gICAgICAgaW14MzM0LT5jdXJf
bW9kZSA9ICZzdXBwb3J0ZWRfbW9kZTsNCj4gPiA+ICsgICAgICAgaW14MzM0LT5jdXJfbW9kZSA9
ICZzdXBwb3J0ZWRfbW9kZXNbMF07DQo+ID4gPiArICAgICAgIGlteDMzNC0+Y3VyX2NvZGUgPSBp
bXgzMzRfbWJ1c19jb2Rlc1swXTsNCj4gDQo+IGlteDMzNF9tYnVzX2NvZGVzWzBdIGlzIE1FRElB
X0JVU19GTVRfU1JHR0IxMF8xWDEwLCB3aGljaCBtZWFucw0KPiB0aGF0DQo+IHRoZSBkZWZhdWx0
IGNvbmZpZ3VyYXRpb24gd2lsbCBzd2l0Y2ggZnJvbSAxMiBiaXRzIHRvIDEwIGJpdHMsIGRlc3Bp
dGUNCj4gdGhlIGNvbW1pdCBtZXNzYWdlIHNheWluZyB0aGF0IHRoZSBkZWZhdWx0IGNvbmZpZ3Vy
YXRpb24gd2lsbCBzdGF5IHRoZQ0KPiBzYW1lLg0KSSB3aWxsIHRyeSB0byBtb2RpZnkgdGhlIGRl
ZmF1bHQgYnVzIGNvZGUgdG8gU1JHR0IxMF8xWDEyLg0KDQpUaGFua3MsDQpTaHJhdmFuDQo+IA0K
PiA+ID4gICAgICAgICBpbXgzMzQtPnZibGFuayA9IGlteDMzNC0+Y3VyX21vZGUtPnZibGFuazsN
Cj4gPiA+DQo+ID4gPiAgICAgICAgIHJldCA9IGlteDMzNF9pbml0X2NvbnRyb2xzKGlteDMzNCk7
DQoNCg==
