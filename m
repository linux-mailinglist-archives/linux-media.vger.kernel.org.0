Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C5F45E7E1
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 07:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352627AbhKZGhL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 01:37:11 -0500
Received: from mail-eopbgr20041.outbound.protection.outlook.com ([40.107.2.41]:51781
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1358877AbhKZGfL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 01:35:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8FifW/3P1SH20Qp8d5UkxuoJPWW8/CeBU8kcljgRNN2XBjoqTteM7wGhF70b/+dXgoZlPVc/p3Vw5okNuL6B/wfnP81yL0PDmSWwV1HzkpDt5zTj2wlGYJ1PO/mh4iKiokPlJbtDg4YA6IFcdUTeJKXo/eWjRprc6HvyhG4stlCHydmKWkGn820bEwH5sG3QfIDimlkYfNfXDm7+hg7lAgQ2LBTjb/kI0wR2Fb5OJfzvV9OZcCSiYCxY7QAcxNQMB3zD/vdYnJzKyU//gdieYLvsVuIFTpub2S/oJeSknjaacX0eLGOGoNtEZ69EJFYcgAT4rmJemD1mgpzjnDJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1q4x1DEPCxSsSXUWtjOywXCEqvm3QFFntHqIf8a7nw=;
 b=TyFy9Xyq0vARg8bhzrmo0SlE+pay4qg63lhUgouWk/fyEygePCBvtiSi/ah4pK3r2T7TaS3y73VcBxmQlbT9Yvi4a4zW63BBbiTjOI7ZduylMKqp0T4pkgY3YwRxYhp6VuUfdf0s4u4KLdHWbauME/gT9Pfuhm3zgiJodcEKnsiJLy53P4aog4bZbtHy+AIKkFEEu4cMvBSTjJvG/fCC2ArTzBPR0y66X2w5z2Vi2ozAjCFg8Cy+B7OoBJ/5mZgDCxdJ5PVwBNr1j3FWPANsu86mggK72rqTwc9xa3SvzcO+tXZFG9S/WyOtG6qnVsBDAGT+N4jE1zxriDFdOUi/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1q4x1DEPCxSsSXUWtjOywXCEqvm3QFFntHqIf8a7nw=;
 b=mNFlHfafCVWtGMNAoRbRQCADhwCObPZE5ScCyBHtroN9/NSjnhXsH2yet6bpwGbicfREH4gYwN8+XiDopTJ3KA7vX1HHc6AlXTex3+N2iXdGLzdE0hbfYQuGGYxq7HG2Lmc7S92GYG2Q5IRH/YME+iB1mqN6F8oO/97/L5vp3Gc=
Received: from DB8PR04MB6346.eurprd04.prod.outlook.com (2603:10a6:10:10c::14)
 by DBBPR04MB8027.eurprd04.prod.outlook.com (2603:10a6:10:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 26 Nov
 2021 06:31:56 +0000
Received: from DB8PR04MB6346.eurprd04.prod.outlook.com
 ([fe80::74e2:49f5:1171:f2c0]) by DB8PR04MB6346.eurprd04.prod.outlook.com
 ([fe80::74e2:49f5:1171:f2c0%2]) with mapi id 15.20.4713.026; Fri, 26 Nov 2021
 06:31:56 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder driver
Thread-Topic: [EXT] Re: [PATCH v12 00/13] amphion video decoder/encoder driver
Thread-Index: AQHX1UX9FZgXdhHdu0aj4y6UzYn6WqwRlHeAgADanLCAAG2egIAA8C0ggACs9YCAAPadQA==
Date:   Fri, 26 Nov 2021 06:31:56 +0000
Message-ID: <DB8PR04MB6346B64E4129D81BA0CF0A1CE7639@DB8PR04MB6346.eurprd04.prod.outlook.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
         <9947131322e034bb6336802e5afb4b6132ca5071.camel@ndufresne.ca>
         <AM6PR04MB6341BF1FB2A839961DBADF4EE7619@AM6PR04MB6341.eurprd04.prod.outlook.com>
         <9b7fd6802c89c5d3bb6a42b44f13a90f6c3caf22.camel@ndufresne.ca>
         <AM6PR04MB6341F599A97253C1BA812467E7629@AM6PR04MB6341.eurprd04.prod.outlook.com>
 <0deb3fa15dd162d7c7b6dbe24821fdf9523dddd3.camel@ndufresne.ca>
In-Reply-To: <0deb3fa15dd162d7c7b6dbe24821fdf9523dddd3.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e707a7b-b41a-44ff-84dc-08d9b0a67171
x-ms-traffictypediagnostic: DBBPR04MB8027:
x-microsoft-antispam-prvs: <DBBPR04MB80272A0C925E101DC2F8FBACE7639@DBBPR04MB8027.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZJRoeu1Lli0w8JEwECzisSWfJ+V79SW+M9w8HQ/fMYW6QlMYI+bF/Z3h+ULZoMXzu3A17ejNVFu0f7ApJflkz0JHM2mi6QltJf1Aw4cNaV6bxBt92FYywHSX83LpBOEoSqwXSZ41m2nsnIrDbC7FdUuKmZ3tpP9AtI9aLBgW5MQ0kUeC6HYYibh7OnnQpj0dbt4e7PTwudRUI8hTugqevGTeZ7YV4RR8tB86jVvVDhn2BDw7Grhe3ZcLbwildA66vmSWoW8wb4V6gdseFhGap3EPvSbIVk5E/gvvqRkUtxRjSqJ3M+4mIesbTK+wD92za4l0B5p2O801a+wCadm6yUn6SW0r9Va5Ox2Sk5bKgG8ZYTVt/dx2aQ0XbJTMuG0WdeFOq/6JWUX5UPmioUr3lmd3Et5AUaR4AZWjS5hTrW0kifG4iF6phE960F7+fAUa70la6h42f2Q8imZOwLXWRdTdjjRa33JE2FEqgIXwUrldGYFQrFs9/WBfnbYA1qttmg5DkuENY2xhzAx73P7PLe+zIAYLMMB8nTuVvPBmiN17CJOuAO7TWgaGnAU9+RVAnLdg88egsGpfXfHeGYrRcYUR6aEBx3xo7fv2hQ/gW74TsQpkYScxAQ2YRV6dvU5j+E8/gXDrSGV0AfWLlqrPIkR1AJmAExzID5ly+ur5UDeXjYkfaAfsd3Nqxi6WrDWHNFDqLwHLXwXaSuEQxNNdlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6346.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016003)(2906002)(38100700002)(44832011)(7416002)(64756008)(66556008)(66476007)(66946007)(19627235002)(508600001)(8676002)(110136005)(38070700005)(6506007)(33656002)(71200400001)(4326008)(66446008)(54906003)(83380400001)(316002)(53546011)(8936002)(26005)(7696005)(5660300002)(186003)(52536014)(86362001)(122000001)(76116006)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXkyM2VPR3Nma1RvdmpocTNUYUh0VnI2RGtuLzBuQ1ZPWnRBZEVYY1JaTkxt?=
 =?utf-8?B?cWlSUGpIY2tPMjZsTlAzeWNIMEhCdmRXUVN6cmJFUnZkNlRCTDZtMkdCOGs3?=
 =?utf-8?B?RDcxTmVhdFJLOUVNaUtVWkh4RS9xb0ltenlyOEtVQ1ZPZXQrbVp6dVNaWXo1?=
 =?utf-8?B?NGFJcG5wUksyUUdPaENtWjRpQW1Pbi8yVUhBRXNLK3lVcHNrdGNsRzJvY1pp?=
 =?utf-8?B?TlZ0WEhvNDNFSFpmcnl2S2JxMExzQnRDYTJBT2dzSWtid3BtcndRamZWdVpw?=
 =?utf-8?B?cERNL0h2NHZCMmpMMkNRZ2lFOGtSSXdKYXFNc3cza01ycFdtNTJrN0FtVU80?=
 =?utf-8?B?TE1zdTRBR0NVaGJzYTZsYlllM0kvNWFKNU9DcWtkWVE1YTlDWWR1Z3FvRjNi?=
 =?utf-8?B?QnNEL0RFV0c1S1g1Uk1VQXRPRmZ3K28wYloyQjRlejVNOHFPTHhERTBLaWov?=
 =?utf-8?B?WmtYdGVGVWFoRHNpRmt4NHJxbWJJZHV6U0ZMS0hjRDVkaklpb1ZHR1UzZlU0?=
 =?utf-8?B?QWgyWnFxOTgyMmtEOVdET0dZVWJYVE00L3lDTDNRdGNhaExBYk4rTGNpclZ0?=
 =?utf-8?B?elRLRGVVSHJmcDlkU014anZ5emRxZVZVUStCU1NYUExWaE13Sk9KVFZjRVBN?=
 =?utf-8?B?WDhiczc4SmEyeUVZNGN4TUxSZHBPOW82VENzc2pXMHlaMkpiK1dGVGxKYzNY?=
 =?utf-8?B?SUVROFcvZjBVcU9XVktBbjJTajlyRmxZSnFJQ29USVVHZzdzRXhmanhVdXVy?=
 =?utf-8?B?Z3Q5NFYwd0RNSVQ0SVBQci90M1kyd243c3RWeWVOVTN6UFQ5Uk5SRGdueUR3?=
 =?utf-8?B?bUVFVksyVnFpSFM4SkFQN1Q1czRuSS9oVnIzVWgzTEhmaUZ3VkFoOG5lY1dx?=
 =?utf-8?B?MVovNVN6NFh3ajV6aDhURDU5NTg5REpjOGFPdXBZZzJPSy95bzNJV0g3c1Q2?=
 =?utf-8?B?TmxFQnYvTXI5MVNRdlZmNmFEby85cnNhdTN1by9lN29mMHd3QzdVVHlrOEJq?=
 =?utf-8?B?Z1hLSksxNCtTWDFQRU1MazlLSmU5YTJlK1F2SW80ZWhZeWpnRW9zQzhnQTht?=
 =?utf-8?B?ay84QnQ1SktRK05NRHJGekpkN1NkeW1Jc0hUNkt4RUxERWRGUVZJcHpNNGxi?=
 =?utf-8?B?N3N2UEFBUFpnYnc1MGx1RHV1YW5lZ3Q2U2lTWG0vaW9KYVJ0WEUreGthTHkw?=
 =?utf-8?B?WEdyLzJhZTJxcC93VFU1UTlGZHFQR3FMQTdrY2cwdVJOZU1HeC8rR1JiUERD?=
 =?utf-8?B?dkIvdW1ZSzlvOUNRbHZXWXFkRmhoTy9FSm5aNVd2Y1dXY1JWczV5OUtDVnZB?=
 =?utf-8?B?RlZURFR3bE9BSFlaWkJzSzZvd3NLOHRvTHlqc2VFeDF1MzU4RnVOOC8xL3pT?=
 =?utf-8?B?UzY3c3kwZkNGK0xaRzJSdzdUalpmaXdkSWJxTEorY1BhdXVwaXJDbE9hdVpn?=
 =?utf-8?B?K0RNNGNQNE5tZ1p2eTBWZkNLZ1FzYy9vK3NEUk5PR0hkN1FPNXd2emhzMWdr?=
 =?utf-8?B?VFZOazZsUXVzSTJUWmFWL3FOdXdxam4waUFHeWd4cE10M2NGTlptUDV4bVdp?=
 =?utf-8?B?Q1R6WFptakhYVjgrcGc1VUh2d0EyZ29QazN6ZHNzZm9NUlZLT1pFQkRhbnYr?=
 =?utf-8?B?YnhiTDViTTJQdnp6RXZNSWRkMmh3ME5KL0Y5UVU5UTdnWllZM3JVN0FNRGQ5?=
 =?utf-8?B?V1duWGJGN2YzYyt4RmI4N2xGR24zbUZOaWVMYnN3MGdCNDZiaTRPYWRKcmxn?=
 =?utf-8?B?THZzV1prSllDOWV2Z01XVHNtcXR4YU9teHpWSFZUd050d25YL25BckZjbnpk?=
 =?utf-8?B?MVJITklwQjMxdnFwazZZNDJ6eXZVNlR4Ykp5a0NpSmwvSVJ6UlR2cUR5MHhB?=
 =?utf-8?B?OU1yUGlCd2p2bVhSRFRJNGl5NjVyQml3VlFRUU9GY1crSkVsSWNXZlBGNWM1?=
 =?utf-8?B?d2hPUURVeHVuUFgySU8yMUNUKytNakNxZUZXVitORm1GcmdkSHh4ditDNkNJ?=
 =?utf-8?B?U2tjZEhaTEJSOHBSN215bzdJMElkTFJJOFYyKzZYNTU1c2tIdUJ1RUFKbW5h?=
 =?utf-8?B?MTYyUm5JTHNjVXRqWXpYYkxLNjFmM2RLTFVacTRNRVJUZXpnSmx2TFlpYXNj?=
 =?utf-8?B?OTN1S1hXMXIzZzBsenVpOHdJMlRZSDJ0QUNKU3pVc2VaSnMxKzYyNm1iajE5?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6346.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e707a7b-b41a-44ff-84dc-08d9b0a67171
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 06:31:56.2581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e2oB0HEdNgStCVdukFFKzQFsIgZV1Q81aiUrugQMB/l+f98DVKblV7DoKZSBOPkxBqCNCn6uj/YLReV8opEqfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8027
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWNvbGFzIER1ZnJlc25lIFtt
YWlsdG86bmljb2xhc0BuZHVmcmVzbmUuY2FdDQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAy
NSwgMjAyMSAxMTozNiBQTQ0KPiBUbzogTWluZyBRaWFuIDxtaW5nLnFpYW5AbnhwLmNvbT47IG1j
aGVoYWJAa2VybmVsLm9yZzsNCj4gc2hhd25ndW9Aa2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwu
b3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlDQo+IENjOiBodmVya3VpbC1jaXNjb0B4czRhbGwu
bmw7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOw0KPiBkbC1saW51
eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhw
LmNvbT47DQo+IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW0VYVF0gUmU6IFtQQVRDSCB2
MTIgMDAvMTNdIGFtcGhpb24gdmlkZW8gZGVjb2Rlci9lbmNvZGVyDQo+IGRyaXZlcg0KPiANCj4g
Q2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBMZSBqZXVkaSAyNSBub3ZlbWJyZSAyMDIxIMOgIDA1
OjI1ICswMDAwLCBNaW5nIFFpYW4gYSDDqWNyaXQgOg0KPiA+IEZvciB0ZXN0IFtKQ1QtVkMtSEVW
Q19WMV0gKEdTdHJlYW1lci1ILjI2NS1WNEwyLUdzdDEuMCkNCj4gPiBWUFNTUFNQUFNfQV9NYWlu
Q29uY2VwdF8xLCBUaGUgdnB1IHJlcG9ydCBhbiB1bnN1cHBvcnRlZCBtZXNzYWdlIHRvDQo+IGRy
aXZlciwgc28gZHJpdmVyIHJlcG9ydCBwb2xsZXJyIHRvIGdzdHJlYW1lci4NCj4gPiBCdXQgdGhp
cyBzdHJlYW0gY2FuIGJlIGRlY29kZWQgdXNpbmcgdGhlIGFtcGhpb24gdnB1IHdoZW4gSSB0ZXN0
IGl0DQo+ID4gdXNpbmcgb3VyIHVuaXQgdGVzdCwgSSBjaGVja2VkIHRoZSBkaWZmZXJlbmNlLCB0
aGVyZSBhcmUgbWFueSB2cHMsIHNwcw0KPiA+IGFuZCBwcHMgYXQgdGhlIGJlZ2lubmluZywgZ3N0
cmVhbWVyIHdpbGwgc2tpcCB0aGUgZmlyc3QgdnB1IGFuZCB0d28NCj4gPiBwcHMsIHRvdGFsbHkg
c2tpcCA1NiBieXRlcy4gSXQgbGVkcyB0byB2cHUgY2FuJ3QgZGVjb2RlIEFuZCBvdXIgdW5pdCB0
ZXN0IHdvbid0DQo+IHNraXAgYW50aGluZywgc28gdGhlIHZwdSBjYW4gZGVjb2RlIHRoZSBzdHJl
YW0uDQo+IA0KPiBUaGlzIHNwZWNpZmljIHRlc3QgdHJpZ2dlcnMgYSBidWcgaW4gR1N0cmVhbWVy
IEhFVkMgcGFyc2VyLCBJJ20gYXdhcmUgb2YgdGhpcw0KPiBvbmUsIGFuZCBpdCBpcyBvbiBteSB0
b2RvIHRvIGZpeCAoanVzdCBub3QgYXMgdHJpdmlhbCBhcyBpdCBsb29rcyBsaWtlLCB0aGUgVkNM
IG5hbA0KPiBkZXRlY3Rpb24gY29kZSB3YXMgaW1wbGVtZW50ZWQgd3JvbmcgYW5kIHRoYXQgZW5k
ZWQgdXAgbGVha2luZyBpbnRvIHRoZQ0KPiByZXN0IG9mIHRoZSBkZXNpZ24pLiBUaGlzIHNwZWNp
ZmljIHRlc3Qgd2lsbCBvZiBjb3Vyc2UgYmUgbWFya2VkIGFuZCBza2lwcGVkIGZvciBDSQ0KPiB0
ZXN0IHRoYXQgdXNlcyBHU3RyZWFtZXIuDQo+IA0KPiByZWdhcmRzLA0KPiBOaWNvbGFzDQoNCkhp
IE5pY29sYXMsDQoNCiAgICBGb3IgdGhlIGgyNjQgZGVjb2RlciB0ZXN0LCBJZiBJIHRlc3Qgd2l0
aCBvdXIgdW5pdCB0ZXN0IHRvb2wsIHRoZSByZXN1bHQgaXMgMTI0LzEzNSB0ZXN0cyBzdWNjZXNz
ZnVsbHksDQpCdXQgb25seSA3NS8xMzUgdGVzdHMgc3VjY2Vzc2Z1bGx5IHdoZW4gdGVzdCB1c2lu
ZyBnc3RyZWFtZXIuDQogICAgVGhlcmUgYXJlIDQ5IHRlc3RzIHdpdGggZGlmZmVyZW50IHJlc3Vs
dHMsIGFuZCBhbGwgb2YgdGhlIDQ5IHRlc3Qgc3RyZWFtcyBhcmUgaW50ZXJsYWNlZCBzdHJlYW0u
DQpUaGUgYW1waGlvbiB2cHUgd2lsbCBvdXRwdXQgdGhlIGludGVybGFjZWQgZnJhbWUgZGlyZWN0
bHksIGl0IHdvbid0IG1lcmdlIHRoZSBpbnRlcmxhY2VkIHR3byBwYXJ0cyBpbnRvIG9uZSBwcm9n
cmVzc2l2ZSBmcmFtZS4NCiAgICAgQW5kIHRoZSBnc3RyZWFtZXIgdGlsZWQgdW5wYWNrIGZ1bmN0
aW9uKHVucGFja19OVjEyX1RJTEVEKSB3b24ndCBoYW5kbGUgdGhlIGludGVybGFjZWQgY2FzZSwg
c28gdGhlIG91dHB1dCBmcmFtZSBpcyBhYm5vcm1hbCwgYW5kIGxlZCB0byB0ZXN0IGZhaWwuDQog
ICAgIEkgdGhpbmsgaXQgc2hvdWxkIGJlIGEgaGFyZHdhcmUgbGltaXRhdGlvbiBvZiB0aGUgYW1w
aGlvbiB2cHUuIEFuZCBtYXliZSB0aGUgZ3N0cmVhbWVyIHZpZGVvY29udmVydCBjYW4gaGFuZGxl
IGl0Lg0KVGhlIGludGVybGFjZWQgbGlzdCBpcyBhcyBiZWxvdzoNCltKVlQtQVZDX1YxXSBjYWJh
Y19tb3RfZmxkMF9mdWxsDQpbSlZULUFWQ19WMV0gY2FiYWNfbW90X21iYWZmMF9mdWxsDQpbSlZU
LUFWQ19WMV0gY2FiYWNfbW90X3BpY2FmZjBfZnVsbA0KW0pWVC1BVkNfVjFdIENBQlJFRjNfU2Fu
ZF9EDQpbSlZULUFWQ19WMV0gQ0FGSTFfU1ZBX0MNCltKVlQtQVZDX1YxXSBDQU1BMV9Tb255X0MN
CltKVlQtQVZDX1YxXSBDQU1BMV9UT1NISUJBX0INCltKVlQtQVZDX1YxXSBDQU1BM19TYW5kX0UN
CltKVlQtQVZDX1YxXSBDQU1BQ0kzX1NvbnlfQw0KW0pWVC1BVkNfVjFdIENBTUFOTDFfVE9TSElC
QV9CDQpbSlZULUFWQ19WMV0gQ0FNQU5MMl9UT1NISUJBX0INCltKVlQtQVZDX1YxXSBDQU1BTkwz
X1NhbmRfRQ0KW0pWVC1BVkNfVjFdIENBTUFTTDNfU29ueV9CDQpbSlZULUFWQ19WMV0gQ0FNUF9N
T1RfTUJBRkZfTDMwDQpbSlZULUFWQ19WMV0gQ0FNUF9NT1RfTUJBRkZfTDMxDQpbSlZULUFWQ19W
MV0gQ0FOTE1BMl9Tb255X0MNCltKVlQtQVZDX1YxXSBDQU5MTUEzX1NvbnlfQw0KW0pWVC1BVkNf
VjFdIENBUEExX1RPU0hJQkFfQg0KW0pWVC1BVkNfVjFdIENBUEFNQTNfU2FuZF9GDQpbSlZULUFW
Q19WMV0gY2F2bGNfbW90X2ZsZDBfZnVsbF9CDQpbSlZULUFWQ19WMV0gY2F2bGNfbW90X21iYWZm
MF9mdWxsX0INCltKVlQtQVZDX1YxXSBjYXZsY19tb3RfcGljYWZmMF9mdWxsX0INCltKVlQtQVZD
X1YxXSBDVkNBTkxNQTJfU29ueV9DDQpbSlZULUFWQ19WMV0gQ1ZGSTFfU29ueV9EDQpbSlZULUFW
Q19WMV0gQ1ZGSTFfU1ZBX0MNCltKVlQtQVZDX1YxXSBDVkZJMl9Tb255X0gNCltKVlQtQVZDX1Yx
XSBDVkZJMl9TVkFfQw0KW0pWVC1BVkNfVjFdIENWTUExX1NvbnlfRA0KW0pWVC1BVkNfVjFdIENW
TUExX1RPU0hJQkFfQg0KW0pWVC1BVkNfVjFdIENWTUFOTDFfVE9TSElCQV9CDQpbSlZULUFWQ19W
MV0gQ1ZNQU5MMl9UT1NISUJBX0INCltKVlQtQVZDX1YxXSBDVk1BUEFRUDNfU29ueV9FDQpbSlZU
LUFWQ19WMV0gQ1ZNQVFQMl9Tb255X0cNCltKVlQtQVZDX1YxXSBDVk1BUVAzX1NvbnlfRA0KW0pW
VC1BVkNfVjFdIENWTVBfTU9UX0ZMRF9MMzBfQg0KW0pWVC1BVkNfVjFdIENWTVBfTU9UX0ZSTV9M
MzFfQg0KW0pWVC1BVkNfVjFdIENWTkxGSTFfU29ueV9DDQpbSlZULUFWQ19WMV0gQ1ZOTEZJMl9T
b255X0gNCltKVlQtQVZDX1YxXSBDVlBBMV9UT1NISUJBX0INCltKVlQtQVZDX1YxXSBGSTFfU29u
eV9FDQpbSlZULUFWQ19WMV0gTVI2X0JUX0INCltKVlQtQVZDX1YxXSBNUjdfQlRfQg0KW0pWVC1B
VkNfVjFdIE1SOF9CVF9CDQpbSlZULUFWQ19WMV0gTVI5X0JUX0INCltKVlQtQVZDX1YxXSBTaGFy
cF9NUF9GaWVsZF8xX0INCltKVlQtQVZDX1YxXSBTaGFycF9NUF9GaWVsZF8yX0INCltKVlQtQVZD
X1YxXSBTaGFycF9NUF9GaWVsZF8zX0INCltKVlQtQVZDX1YxXSBTaGFycF9NUF9QQUZGXzFyMg0K
W0pWVC1BVkNfVjFdIFNoYXJwX01QX1BBRkZfMnINCg0K
