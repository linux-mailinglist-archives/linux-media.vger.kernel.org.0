Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F29226CC17B
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 15:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbjC1Nym (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 09:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjC1Nyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 09:54:41 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41F91AB;
        Tue, 28 Mar 2023 06:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUZBF8Nr+qjqzIJngm0WNN/HI1gbTi9TFdCegJwXyLRUSCUe5xrauGzod0DdakuAAif2BIIOyS7rq6UVm8WIJO6lJjWUL7AZQsHB1A3fr+B8hGoFSJQXZTt53FKyloJN533Cy2RKHMH0rahAag+QI986gB0KwrtBiFuFN659EXZVuYNusFcG7GD8d/iD1QPZahG2XkcQ11/kdvXNmT9DLeA71R1oA1gFEqs4P0LU004pLFit/2LRMdX067Cp5GWmqgfACvEtJblXN+08DATwsO/+T/Q/jwWutG3tPeoQSTh4XdKaSgpeQmNIyCZO5TNyCD7ws0oey8T8Hsj+A7pHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOnaTUyYYNVKRoaYYil8juVV/0OsfCvtBZGkqsimZWY=;
 b=d6fab/PS1B4cMnnRm31SHdD18fiwYbS3Fz7T6DV6iWq1xSAzKre7hILEfmhmph+5MOjvd7Ze9bzPBdSq3CrjKrat9k1NX8hObUxwtJR+e2xlkBaBmHiZS6qOyjCQ3L/Lbh4PKYyNvPDRF2TqJrHjGy3Y4vT0I9jXIDVjmBVNvC6xtrb5V8hO63xpBFR5WSsICCGjVeGXH5HO83UQjE+lFigFHSGzRMso9jfvnc+Q4SSlfcKInT6+HusLLmLiVeDElin8CzhQyWSZyZvyJfCbBdpDf/zk939Bdt+9YZg2q4ucf3fpSYh16FBOECoAlpSl/dyUl9tHVJ9kOsUeatznFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOnaTUyYYNVKRoaYYil8juVV/0OsfCvtBZGkqsimZWY=;
 b=hH77ap5sSr73h6TuBEqh3yKn3vkRLE+tgaF8WrVOc9baz+oSNpwggXG2/J54cId+SCKxhZjrMPDFEoxh+icXJrH9REGUxqZ2e2YfNqtaWR6z0kKiwLIn7gln3e+8DJRbAVGUZRCAJrqVUsdmip7z5RV7956w+orSb4PzE6tauzQ=
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com (2603:1096:400:169::11)
 by TYWPR01MB8726.jpnprd01.prod.outlook.com (2603:1096:400:168::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 13:54:36 +0000
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::f687:2c30:bf97:7ca2]) by TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::f687:2c30:bf97:7ca2%7]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 13:54:36 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 051/117] media: rcar_drif: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 051/117] media: rcar_drif: Convert to platform remove
 callback returning void
Thread-Index: AQHZX+/Wmw33KSFqi06aiSN1902/1q8QOWCg
Date:   Tue, 28 Mar 2023 13:54:36 +0000
Message-ID: <TYWPR01MB8775936B1DA1F4DFA972AE85C2889@TYWPR01MB8775.jpnprd01.prod.outlook.com>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-54-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-54-u.kleine-koenig@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB8775:EE_|TYWPR01MB8726:EE_
x-ms-office365-filtering-correlation-id: 3c34b57a-7994-4f47-d591-08db2f93f772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PElGmdPfzmhd1Z6tY3+6i80hibxELZbOAloyoKSPsurGb2Ks/fvrIlCQ9hHz9y2yUF1C8FFq8KuB2LnNiXpDtas7eEX/uYUG3p3GY20VZkHZ23GAqNp0bSVHZIBYIN9BHrLGmzjS3iPDazhHSWKOe85PNsLtVnA28+iQ19DM7fMfuJ+/1feRCYDQhXILZRGSmijn/6fAN0NP4Dk5d7zdPCX8BdqAYWt5qGr3b4hdLmh2DMokRGeIsn+zkgFTd3vLhtHlN9npFEATjhEeGOjs7MEj92SYr14S1N2AjyZp31bxcuysPiyU5dZGuWa3q/WlsGKzzsO5HwjOaOezYmaVFkRz75+9xSM9bPOEx2ybWTld7mIVrM1HfRDTZHaPgxcNS3GALI/48lhxBy2zM2FBtwOsSYpK4JljcIG5E1R1uZWmlB/mJ0JXpWDpSn9LINYU6TRWG4La2iu6RXJTVgYGZ1mO6VJzyGSrUuuoPhJs/bmJUT1MF/rMR6OL36Qj0/4mILXcvxxlJLo/li46AI3Cnse9WGDpvuc7Kji7134aK55pO01rZ1c1mTSvTZd5jva8BpsicChQyGLS4XbAPyBfMc0EKE2M+HpSWi+eeGv+6wFGQWWXeWNAgLBmhr8O1GHK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB8775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199021)(66574015)(83380400001)(64756008)(2906002)(8676002)(66556008)(66946007)(4326008)(66476007)(478600001)(7696005)(76116006)(54906003)(71200400001)(38070700005)(316002)(9686003)(110136005)(26005)(55016003)(186003)(6506007)(52536014)(86362001)(41300700001)(66446008)(8936002)(122000001)(33656002)(38100700002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVJNZjVKMGdMcmNLWkNNQ3pzRENqVUY3TzFNNCtXeDBDWnY4Vmw2TnhHSGtX?=
 =?utf-8?B?YVljdk1nd09lcnBZbnROWGdhR2dWSFd4S2EvZm1wSTNvb3c0RWdpRkQ4WUJ1?=
 =?utf-8?B?aWI0Mk9icDRDWldKR1daUVhFVGFCMUVJTUllZ1Y5ZXEzTWRRMVp4SDM3Zm5D?=
 =?utf-8?B?MW9zbGg5SlQ1bVptKzJZUHQwUTgzY3FYcWowUTlpallXNHJBcEkzODY4UE9k?=
 =?utf-8?B?TlA3eW1yWWlXR2MyYjJldHN2aGUzakNWUDlCQjkvc1cySHFJY01LVnBNUXNQ?=
 =?utf-8?B?RVJLaXhFMXF5ZlJKNk5QTU1aREI1TjhKNnk2WC9UWGlJTkV6Z25qRTY1ekNv?=
 =?utf-8?B?SnJpNmc0NmtzemFkeUgvZXZDM1VZSnhaYzd2S1Nqa1dBRVJFWFpqWko5U0U0?=
 =?utf-8?B?MlhZcjM2Z3AzZ3Qrd3gyaEhvVysySzlMYmthd0pESXc1Z2cyMEZxSWY2Rmsz?=
 =?utf-8?B?OTZXclpzcUJjaTNzd2ZJbWtoQ0RDZ2ZXOWJ5MnI0eUhXVHJjcVhkaWkrcUFU?=
 =?utf-8?B?SVJFbGFVWWdrZ3BmNW1BVzQvQmFTU2trM1lIUmlSeXk4SDB0Rmp0K2VUWnBO?=
 =?utf-8?B?TEdnV1ZxVmFnL0pzZlZ5dmlpaWVEaUpxbU1lTzBaUTlGZEcvV1llekx0WURo?=
 =?utf-8?B?SjlVVGlVaW1NdnJBSUUzbnRwTXNTdkNGbFpJWkJPRERDN0xhdUxJNEZyQmN3?=
 =?utf-8?B?ZTBoRHJINXJza0YvMWtoZUZwTm1hVWhmeThZVlZXa3VSZ0FMNzYrbDRka2xG?=
 =?utf-8?B?S1AzQWRKS0o4b1BjZE5FMWdvR1BkN29uNU8vZDU2VXJMMVN5cUhNZ092c3Nt?=
 =?utf-8?B?d3ZtbEFpL3V0cGVhNDl3WTJ6SWZDR2txbmJzZkFMbFJNeDFxS1pMZmg3TnRl?=
 =?utf-8?B?LzZHekRtOEw3emF2TVFFbzM1ZFEyQ2RRZWhuRWFxR3ZIZ082ZU9zL2Rhd2pW?=
 =?utf-8?B?K213KytZRUFZcExCYmx0Q2dCUDJGcEdudlhEcUp3dDJaeTNRU3dTaDRVdUJK?=
 =?utf-8?B?RGdOanJ6amN4RkhDd1lHZG13YkZ3cHFKUnBiUzlySWhiNDRDRGJzLzI2b0FZ?=
 =?utf-8?B?eWlIUnZHcmhKaEdDUGVRRFI1akcxOUIwTDN4Q0FtTFd1dTFRU1NQQ1ZOeVlM?=
 =?utf-8?B?bGcySXFOaUc4d3EzcXFUeDFDa1poUGx5Nmt0LzhmN2FiSlBBOFU0OE1uVXVj?=
 =?utf-8?B?U1JzOWJrTHNTNWNMSlNHRTVsQVQxUEZuOGE3Y1U0cnpYSzRwclpSVGFiTnZE?=
 =?utf-8?B?WW5TR3VlTHNFWUp5YlRFWStjMUJuTkVtZEthWjRHZ1RFTTJNbGJLVnFwWU9H?=
 =?utf-8?B?V2lYVHV5Ulc3NENvbWg1SHVwWS9ZOWtNa1N2RXY3ZTByN1hQRE9ZVXlpSWNy?=
 =?utf-8?B?ZUh6RGFSWkQwT0g0WDBMWkxLYk9QRU9aMGRlVW5CMU9vTW9xTXVRWkRBempR?=
 =?utf-8?B?cWxxblRoK2QxMDdncjUyRFVtK2NHZ2JLMkVHcStzNlM2L2tySDhzUnB0QWl2?=
 =?utf-8?B?ZW5xWWU2NlJjNHNLcDdVa0JUUHdwZVE0NDduclExdFV4TGY5Q2hDYTY4aXo1?=
 =?utf-8?B?S092bGxZQm9WeXNxUGNrZll6SzlsVnpYdERvY3kyUmRGUEZQR1d5OHI2T1BD?=
 =?utf-8?B?TzZKK0taalZpdFB0UDM4RUlwQ2lzeDRDTzExV000a003V2FFVDdQb3dtYTZm?=
 =?utf-8?B?SlpvcmNaMmo2bEFobzFBNDdmYnBaTEd4UVFJR01PdUNiYktQQWpXdVc3R1FD?=
 =?utf-8?B?NG9PTzdFOGNGMi9OM1lIdkp5NXkzSFFvUHNXQnU2YjlRT3NwZ3NaV1U5Z3JK?=
 =?utf-8?B?ZTdBMFYwRzdhb1pnWUtacXpvdmJTdFIzVVJaRmVXSGJUYUxZU3pxNkliaUdH?=
 =?utf-8?B?aXN5dnVEcVk4REtyd0dOQktKZWIxNkRFeU5CbUM0b2JxRnZlVTlrYUhhWTFm?=
 =?utf-8?B?ZFJDSzB5TUpzbEYvOXpLYXJEQStGRnBlVXVBRjJFUzU4QTJySDlaTEJ6Tkta?=
 =?utf-8?B?VTB4SEV3RjdDV3lOR2l5dDU2TXdYVE1XRkhkUlkrYmEzYWMvTytPZG1NL1J2?=
 =?utf-8?B?RmJwUlBHd2tyTzY4THBqWHNYdmNVdEErYkZFRDkzQ2pENnRORXZUYmxsTVl6?=
 =?utf-8?B?L0JVblhxamtzMVVFbHp1ZjIxbURTYThNZlMwVW5hMnIxVzFJRE9nelRTVFdG?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB8775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c34b57a-7994-4f47-d591-08db2f93f772
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 13:54:36.1000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2iogfERMn9CDaQOE0XI/UzPOPcwlotdHYuL7CuahIC+EbjsvS/2RD12CTuQF8z6oQ6ah0CP+0lPAqrYk6szLzgKCnDDdlC4F/ISChcnbaT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8726
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCj4gDQo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJl
dHVybnMgYW4gaW50IHdoaWNoDQo+IG1ha2VzDQo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3Jvbmds
eSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJvciBoYW5kbGluZw0KPiBieQ0KPiByZXR1
cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFsdWUgcmV0dXJuZWQgaXMgKG1vc3Rs
eSkNCj4gaWdub3JlZA0KPiBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBs
ZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzDQo+IGENCj4gcXVlc3QgdG8gbWFrZSB0aGUg
cmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3RlcCBvZg0KPiB0aGlz
DQo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGlj
aCBhbHJlYWR5IHJldHVybnMNCj4gdm9pZC4NCj4gDQo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMg
ZHJpdmVyIGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUNCj4gY2FsbGJh
Y2sgdG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpSZXZp
ZXdlZC1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+
DQoNCg0KPiAtLS0NCj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yY2FyX2RyaWYu
YyB8IDggKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5l
c2FzL3JjYXJfZHJpZi5jDQo+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3JjYXJf
ZHJpZi5jDQo+IGluZGV4IDNmZWM0MWY2ZTk2NC4uM2E5MmY0NTM1YzE4IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcmNhcl9kcmlmLmMNCj4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3JjYXJfZHJpZi5jDQo+IEBAIC0xNDMzLDE5ICsx
NDMzLDE3IEBAIHN0YXRpYyBpbnQgcmNhcl9kcmlmX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ICB9DQo+IA0KPiAgLyogRFJJRiBjaGFubmVsIHJlbW92ZSAqLw0KPiAt
c3RhdGljIGludCByY2FyX2RyaWZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICtzdGF0aWMgdm9pZCByY2FyX2RyaWZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IHJjYXJfZHJpZiAqY2ggPSBwbGF0Zm9ybV9nZXRfZHJ2
ZGF0YShwZGV2KTsNCj4gIAlzdHJ1Y3QgcmNhcl9kcmlmX3NkciAqc2RyID0gY2gtPnNkcjsNCj4g
DQo+ICAJLyogQ2hhbm5lbCAwIHdpbGwgYmUgdGhlIFNEUiBpbnN0YW5jZSAqLw0KPiAgCWlmIChj
aC0+bnVtKQ0KPiAtCQlyZXR1cm4gMDsNCj4gKwkJcmV0dXJuOw0KPiANCj4gIAkvKiBTRFIgaW5z
dGFuY2UgKi8NCj4gIAlyY2FyX2RyaWZfc2RyX3JlbW92ZShzZHIpOw0KPiAtDQo+IC0JcmV0dXJu
IDA7DQo+ICB9DQo+IA0KPiAgLyogRklYTUU6IEltcGxlbWVudCBzdXNwZW5kL3Jlc3VtZSBzdXBw
b3J0ICovDQo+IEBAIC0xNDc2LDcgKzE0NzQsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciByY2FyX2RyaWZfZHJpdmVyID0NCj4gew0KPiAgCQkucG0gPSAmcmNhcl9kcmlmX3BtX29w
cywNCj4gIAkJfSwNCj4gIAkucHJvYmUgPSByY2FyX2RyaWZfcHJvYmUsDQo+IC0JLnJlbW92ZSA9
IHJjYXJfZHJpZl9yZW1vdmUsDQo+ICsJLnJlbW92ZV9uZXcgPSByY2FyX2RyaWZfcmVtb3ZlLA0K
PiAgfTsNCj4gDQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHJjYXJfZHJpZl9kcml2ZXIpOw0K
PiAtLQ0KPiAyLjM5LjINCg0K
