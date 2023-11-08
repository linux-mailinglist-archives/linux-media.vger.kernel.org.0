Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 739777E4E8E
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 02:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbjKHB0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 20:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbjKHB0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 20:26:44 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA09195
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 17:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdJVld4uCGC4Qd4Ukrirukpt2QTpM+Sf6Nyo/JkVQEAh9NRrE/mmaMgFbEVyQMT6Se10XViOFTXpktYcWqtdCPYghMj2cmEq4DUocrHvM4CeZtYhXi+CZ0VQmlTVHCDK/5Uy6oSXUqbqT3JB3WUOFrDzYM3O1Nh+LFbxuJelf8gJfhS7hg3bvYem+zmgYSbX0PWdb+pK+nrdHs0e6ECKtWASY70ZpQbmq6YknMwBY+QqvAAj/3C1W7+9p6Sly+n/NBGz+XA5dgviGX96KQigA1oux3z8Pj62KN3HTrNBQMKLfVoy4FNTENflicNztCGJ+vxQ23da13tTW1tG36+7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8cVrZeyKo5BWHCBXKP8XvIqrGacH2NP9fRdfkQh+Ss=;
 b=enf/Lwdf3HfqwpQ38/irGY6aPuokG1BfzaSzC0N8n7b6k6l1SYqovX30YN+EZLh8jpeeqVWOD1sd/3wiBPYwC5VN0yI72vXuZmmmQdPHSDTq1EpAM85cx+LuePzzA/Eaa3NlVqe2MBaN7/eX62BO8+hsvSeQ0W6wKMbmzP/B+b0r6xVlIrXC1h59YNJLvPiBFV24KGUtSpLnBimoAGTGPR4fRacvfyHydeoxqEtzh+MCsnzLZ+LnHJD8brIFBLwftwTqj3ayCnC8vUFCxvwzXwwlu1eDt8fqR+JiLAIQ0kfd4QvfqGV7O518qkUuC7gYWMChMB7YshT+EJ2JmhFsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8cVrZeyKo5BWHCBXKP8XvIqrGacH2NP9fRdfkQh+Ss=;
 b=j8FGZuOhDsW02mSBduCyq5jGa80wyUiwf2Spzng6phcZNmdCpnLpGm8brBsjbnW5TWin8ilEpHLmIaTyXlmtWRzopDfV5LY0EH8rqlLzjeF+BZILzumcwK0Iwvb+M8DontGhC9Z0LmYVuUxxu4ZXn7BA3uKXniM9nmEHXBbvl/4=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM0PR04MB6850.eurprd04.prod.outlook.com (2603:10a6:208:180::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 01:26:39 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::4086:6256:e32d:8ef3]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::4086:6256:e32d:8ef3%6]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 01:26:39 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Eagle Zhou <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [EXT] [PATCH 1/1] media: amphion: Fix VPU core alias name
Thread-Topic: [EXT] [PATCH 1/1] media: amphion: Fix VPU core alias name
Thread-Index: AQHaEUovq/lKRAlPUUG43hIVa0pxSbBvoo7A
Date:   Wed, 8 Nov 2023 01:26:39 +0000
Message-ID: <AM6PR04MB634196FC7046F63169A3C339E7A8A@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <20231107071521.953318-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231107071521.953318-1-alexander.stein@ew.tq-group.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB6341:EE_|AM0PR04MB6850:EE_
x-ms-office365-filtering-correlation-id: e3a1b0ea-946d-4cfc-42df-08dbdff9c1e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jQIGEptAnI5EUIOdogl4pN+4t5U/HrLiLhBbX2yg7/EEcADwcST3D6v5YHEEn+1bTZZrEsCPQkfbY+670OfuJ/Ycbi8c0TREOJ9yIqwWhFQWvw/bBXx3o4TnIt+1b/11FOB4UrRZbPdBCjHTPQp/Do1LENrwjIYNO+Wj7YqXdLRerx0g8iNpHVhwW643p3x0bYGvE0ptItMpKpcDsQGPvNcKQZYGCzUmToXe3bxHPhAPVx3Pxxcja0mIz6wU/9kDTb1Si0nIzHJFOV1nB9JxSJLww+JN8CvgJMYwxgNDDk9q0gM3rW30D+LrJaZt6uA+mGQGfAFzAz4ffWbKW5U8M/aVPsfK8yD4wVXYamkNBYxYxLmAO4XEq+BFU8ImgpZU6l3/g+58uL7OGStRUmJR4CuVGQMlLL+Orsvf9RrZGhU7OKQ2kuSTUgQRImPw2ov7kKPA3Fk7GgFd/jL2wZtlkpW3FIVJD/eeYonCGiOtJwXGhU20ssSO3zGDbgfUx0OJXh8PQWOMenGEN1bpF7Dcn+J+ABB6TPZT/MJMqbA06Xlnsl1dH22e4E0ejLksJza8HgyAqshV+wrhs1iHXkg5neQCB2bTfAwDgYXTrSiOEsSRAnZCTwILIqVa8LeXd5d4e05QZduTZhQAFGj+bOKdgX2dJ0b0RC3LZiKt1IWqQCo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(1800799009)(186009)(9686003)(71200400001)(41300700001)(7696005)(6506007)(38070700009)(38100700002)(33656002)(122000001)(86362001)(83380400001)(26005)(44832011)(110136005)(316002)(55016003)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(5660300002)(52536014)(8936002)(8676002)(2906002)(478600001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?USswTGhHbllvcHFYMzNGc3UrMm9MS3k0T0F4MVFzNHo4U0ZBREJxTWdTWDE1?=
 =?gb2312?B?QWE3czBvMHpOa29mM0twMmpLcW8zcm9aQk1wdndKVWRIZW9VdlZyNTRrQXNv?=
 =?gb2312?B?c3h0Slpkb2J2Zmh3dVdtcENjVzBTWHRHVFhMOERRZEhhSHNlTkJUVHVzSmVl?=
 =?gb2312?B?M29FdVQvMTZsVDhjSTNoVkw3T3BObER4RUpBZWJVTnpXTzJSV0I2YjdqT3A4?=
 =?gb2312?B?QThKR3dkalpBQ1pWcThrb3llK0FMSktBTWFuazZieEpxZjM5Ty8zc2svWkhE?=
 =?gb2312?B?ZkRpRlgwNUFMbDFJbTJqVnpVcWxUR0ZvTkJKalRXQVNTVlhBNXRQUDJsZDZ3?=
 =?gb2312?B?T3h5YTRqUkd2RncyT1hvZVEvemozZExxVlNFRWxjU2tTOHAvbGJvbGRDQk13?=
 =?gb2312?B?N3FRNG8xMzRETVhpZ0JqUlpUZkdoY3Bvb2syT3V5N2c5Smp0dFptQ0xFbDRq?=
 =?gb2312?B?SUh1UWlkVDVBZVdBOUVLdURnWEI3c04xUlVTSEVSTVVydjF0dmxlOE15VzNu?=
 =?gb2312?B?L3dNcjdMVXcrNk9VOWkvaCtLZTE0TytwYU12RXNDRVg3SzF0VlZxeVZWUVpW?=
 =?gb2312?B?VEw3RTR1ZVJzUlJhQVNsMzkxQUYvdDczajliSTRGc1ZNMGVEMGMyc0h2cW0w?=
 =?gb2312?B?YVUvcng0c2IzZmxYYzhoZmVaZk03dDFBS3ZOZUR5L2ZodmxqRWxlckpGSXJp?=
 =?gb2312?B?VXBCTGloeWpSd1l0b01VRTZhMHhQanJSZVJQOHpGeGQ5eVVJSW9SVDhzUEc0?=
 =?gb2312?B?dmtZWU1oOFp6b3VlK3NNQjlWQndsb3ZaNnlucExZSktyQk13MjVxaXVCb1N6?=
 =?gb2312?B?TENiNk44MG5LZWtSMkllbWwzNTVqa3U5emx0TFdubFo0YjFJeEk5dGRqMmkw?=
 =?gb2312?B?K3FKd0tGMnBlb0t2UjBvcXFzV2R4ZWk5TGF6SEIyWFNJUjNLZ3RxUlhsUktK?=
 =?gb2312?B?MGhKWGx5L0tMN3NZeWViQi94aGxLbWIydmZybXBaVk9LbXJvajJyRExwZFdk?=
 =?gb2312?B?NXdlWE9lek9rUnhsYXlDNlhqT0lxc1BIeGh6SFlTWm9SUzF2REt1THlGWUV4?=
 =?gb2312?B?cVFWTDAveXdJeFJXaUtTYmJsR1lpTVcrY0k3ckJhZlVueHZBdkU0aGRMU0pC?=
 =?gb2312?B?am9jQUplRGtCWXJLemlKb3hZT2Rrd2lNa3JRQ0ZNK2hQN3hSZ3lXMzRsdisx?=
 =?gb2312?B?Mmt0cUxPWG14UHJDV3lMWmFPd2ErV3BWeHVxU2NMSkZGTU5DeUU0dDNKdVBp?=
 =?gb2312?B?a0s1Q0lmRmhxTnlGMXBCWUpBZmxzdjl0ck9jZUFROXZPc1I5NGVVTkhITWNl?=
 =?gb2312?B?cGpZanVHeXlzNnBEdzBHV0ZlcVJoMWg2STBMaTZOanhDeDl6VXlhT3o2bml4?=
 =?gb2312?B?TmdZSmJTUi9nODJiMGdYbWtXbGoreGJaUEdmY3lodkJ2eERTcXRTTXM3Z1Vq?=
 =?gb2312?B?R0JPS3NUQjFTUDJSMEdTZ0wyMkNlMUxpTStnWjB1WUFNbTJVZWphbXp3YjlK?=
 =?gb2312?B?S2prWWVWdTFPL0hhdngxQXM1NnNFYU5JUG1RaEVqOXozMnVyaGVONCtlb2hO?=
 =?gb2312?B?d0RDRFlmcmcyUnNXMi9GNXZWcUNSbTV6VmhWd1lCL0g4Q1FLUHFKTzJWSyt6?=
 =?gb2312?B?NHZUSDQ0emk3OEFkZEx4dVlvVHZtZnRsR2FVeVF3azYzUG05WEtFaUxaY2Y2?=
 =?gb2312?B?TXlUT1A3c042RGl3UlhQeFdWK3FpT0RUa0tzT1dkakU5YkpmVGJGZEtYYUhN?=
 =?gb2312?B?dmlnaXU5eFdydE5SZlc3Z2orM3J0Wi9mK0cxSklvL1NiMFMyQjh4akdISVJ5?=
 =?gb2312?B?MWo1ekd6elRjK1Z0dTl3RXN2aFdCTG9RZ1ArQ0RnSlFIeHB0MGhBUFB3bjAx?=
 =?gb2312?B?VGg5ZloreEt2b2d1OHZCeXJ1emRuWkpMK0RmVGxiZWhkZXpaaFIzUG92dHBD?=
 =?gb2312?B?RDY5Ynp2VFFwRVZ5VHJqNXprbmdKbHQ5aHlNcG1PUWVtZ2RTblNSbjl5TVhz?=
 =?gb2312?B?T2tPK1B5LzI5TTF5UzRXOEo3ZGN0aHNuUnl4ZzU0bDBTVjRORklpRyswVmFk?=
 =?gb2312?B?Yzgzc1RyNEZJVjBabnpQR3BEUS9nalMwR2ZVQmpJT3JSdnZIRGpDREVUUDI1?=
 =?gb2312?Q?jyko=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a1b0ea-946d-4cfc-42df-08dbdff9c1e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 01:26:39.5588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NWc0EpFjv73yUKdJw76zqeQTUpULN8xvmhtXZgGxpb8m40aJTDKH+LSO9Z7xGjlB3xAeK8qvQ4+HhGK2hHzGSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6850
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PkZyb206IEFsZXhhbmRlciBTdGVpbiA8YWxleGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4N
Cj5TZW50OiAyMDIzxOoxMdTCN8jVIDE1OjE1DQo+VG86IE1pbmcgUWlhbiA8bWluZy5xaWFuQG54
cC5jb20+OyBFYWdsZSBaaG91IDxlYWdsZS56aG91QG54cC5jb20+Ow0KPk1hdXJvIENhcnZhbGhv
IENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPg0KPkNjOiBBbGV4YW5kZXIgU3RlaW4gPGFsZXhh
bmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+OyBsaW51eC0NCj5tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcNCj5TdWJqZWN0OiBbRVhUXSBbUEFUQ0ggMS8xXSBtZWRpYTogYW1waGlvbjogRml4IFZQVSBj
b3JlIGFsaWFzIG5hbWUNCj4NCj5DYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQ
bGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3INCj5vcGVuaW5nIGF0dGFjaG1l
bnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQN
Cj50aGlzIGVtYWlsJyBidXR0b24NCj4NCj4NCj5TdGFydGluZyB3aXRoIGNvbW1pdCBmNjAzOGRl
MjkzZjI4ICgiYXJtNjQ6IGR0czogaW14OHFtOiBGaXggVlBVIGNvcmUgYWxpYXMNCj5uYW1lIikg
dGhlIGFsaWFzIGZvciBWUFUgY29yZXMgdXNlcyBkYXNoZXMgaW5zdGVhZCBvZiB1bmRlcnNjb3Jl
cy4NCj5BZGp1c3QgdGhlIGFsaWFzIHN0ZW0gYWNjb3JkaW5nbHkuIEZpeGVzIHRoZSBlcnJvcnM6
DQo+YW1waGlvbi12cHUtY29yZSAyZDA0MDAwMC52cHUtY29yZTogY2FuJ3QgZ2V0IHZwdSBjb3Jl
IGlkIGFtcGhpb24tdnB1LQ0KPmNvcmUgMmQwNTAwMDAudnB1LWNvcmU6IGNhbid0IGdldCB2cHUg
Y29yZSBpZA0KPg0KPkZpeGVzOiBmNjAzOGRlMjkzZjI4ICgiYXJtNjQ6IGR0czogaW14OHFtOiBG
aXggVlBVIGNvcmUgYWxpYXMgbmFtZSIpDQo+U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN0ZWlu
IDxhbGV4YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tPg0KDQpSZXZpZXdlZC1ieTogTWluZyBR
aWFuIDxtaW5nLnFpYW5AbnhwLmNvbT4NCg0KPi0tLQ0KPlRoaXMgaXMgdGVjaG5pY2FsbHkgbm90
IGEgZml4LCBidXQgbmVlZHMgdG8gYmUgYXBwbGllZCB0b2dldGhlciB3aXRoIHRvZ2V0aGVyDQo+
cmVmZXJlbmNlZCBjb21taXQgaW4gdGhlIGZpeGVzIHRhZy4NCj4NCj4gZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9hbXBoaW9uL3ZwdV9jb3JlLmMgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL2FtcGhpb24vdnB1X2NvcmUuYw0KPmIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9h
bXBoaW9uL3ZwdV9jb3JlLmMNCj5pbmRleCAxYWY2ZmM5NDYwZDRkLi4zYTIwMzBkMDJlNDVlIDEw
MDY0NA0KPi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfY29yZS5jDQo+
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV9jb3JlLmMNCj5AQCAtNjQy
LDcgKzY0Miw3IEBAIHN0YXRpYyBpbnQgdnB1X2NvcmVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZQ0KPipwZGV2KQ0KPiAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4NCj4gICAg
ICAgIGNvcmUtPnR5cGUgPSBjb3JlLT5yZXMtPnR5cGU7DQo+LSAgICAgICBjb3JlLT5pZCA9IG9m
X2FsaWFzX2dldF9pZChkZXYtPm9mX25vZGUsICJ2cHVfY29yZSIpOw0KPisgICAgICAgY29yZS0+
aWQgPSBvZl9hbGlhc19nZXRfaWQoZGV2LT5vZl9ub2RlLCAidnB1LWNvcmUiKTsNCj4gICAgICAg
IGlmIChjb3JlLT5pZCA8IDApIHsNCj4gICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJjYW4n
dCBnZXQgdnB1IGNvcmUgaWRcbiIpOw0KPiAgICAgICAgICAgICAgICByZXR1cm4gY29yZS0+aWQ7
DQo+LS0NCj4yLjM0LjENCg0K
