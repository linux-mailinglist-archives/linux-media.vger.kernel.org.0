Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD35536901C
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 12:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhDWKOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 06:14:09 -0400
Received: from mail-eopbgr60080.outbound.protection.outlook.com ([40.107.6.80]:45915
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231142AbhDWKOI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 06:14:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbTRJvGqnCQsrHRKSqvN1hV2ppXO+ZFPWIL3YXjnrrFRclZchOxYVAg5k9e4BYCGKH6YVEuUOVdUBSSW75s1+az7ci9Xu9qtC+5l/XMny/W3LKrcOopnR0GtLObXjd98mh3p0IVYwW+bd5x4lZgJVbR8s4Fv7iiTo4uj67zYoM8Ow4/gS/vK8yk8c6+zqdRpz4FkKKxs7xBSIuuP3q2ei3K4hqjDPB3F6yohp+dWsl78F+w/ikptOOSYPDjc7VkkiNY7/LOEk6gEcqttR5nV8wdPp3s2niVLx3OY20l6sFmKAptHD4ZKpwq8G++WxINQdS/iqp78sLqFUgzdCzjqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5/C8oY5qdfLwLarrnygoghMHlIxRqIRSa3yb2fbLd8=;
 b=ExrPteBjZ17mytGZGlPmZmwfderBKf2js148uPxXKI97BfUwkO2BNp69uvEz7hGqjgBCOC19WUrmatdbuRFHdTNyzj/Z5Jl3QSfkdwyRWTj+w7Dn4nRxFQCBDWqIL6/2fLVtQN4v5HRrTeBQ7psfEVYOIOLrvXtaJjahloHdfgwW9MT2H0jp6Dja0CjrSh1NlTc7SLdDCD5Oa077wN7GdVdw2aG++24ALAmdGkYs9/sd/zp5TuK1fZAXyoLQeFhi9j2Jh/qNY7HS4u+BqcW6c2RHWWNK6JqqxOvtJiVWHUbU/5hNVe/KdRfwvj930xgwkYpLrh1dBcSuK4McmF6Qag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5/C8oY5qdfLwLarrnygoghMHlIxRqIRSa3yb2fbLd8=;
 b=QDwapiANK336hO+fWo8A5/jX5mRgNcyVeB3Ajq63vKbuKGAMX1QP6QxX5GdaNBExMFxwbWQi8ibf1GYjFHX+bg5bFE5uibbICHuns2+SXp1nhBubQb576jhhgqCJ+zi5yRvroGnQnwRIJC+ZZghU8EjcOJFQW8GrXEvOYwy/l0c=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7511.eurprd04.prod.outlook.com (2603:10a6:20b:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 10:13:28 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb%5]) with mapi id 15.20.4042.024; Fri, 23 Apr 2021
 10:13:28 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v10] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v10] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Index: AQHXKwoxrMm/h3gIQEKVaAxN42Yfgaq+14wAgAMk+YA=
Date:   Fri, 23 Apr 2021 10:13:28 +0000
Message-ID: <aaab2b5036e4fa217fb4e660884c85ecb580afc8.camel@oss.nxp.com>
References: <20210406172740.13904-1-mirela.rabulea@oss.nxp.com>
         <AM6PR04MB496668C16DBDC3D46A2A018080479@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB496668C16DBDC3D46A2A018080479@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.124.171.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 545e162f-fbbc-4fd2-5cd4-08d9064070c3
x-ms-traffictypediagnostic: AS8PR04MB7511:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7511598F1E441C8751888DC5CE459@AS8PR04MB7511.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZdWn9rWPFE4ziWm/jkpt/s+djfwOjqWY0N9tTfEEg1BXxp4gjRKyWfSt5PBcTbJJm5rqtelh3hUww2PtrZmbYzlrQcfIRwPWUiEn+GNmMu7UnVOYhE4J0+7iBt9aiqHRx5s+bbhUC6K5uqMOSqXowXrfL2Ljh7Jds6cMAcS0tTdF1rw/tN2WaUB0fXxz6PdUFNYYEyeVBy2v+rTJJd4fHGLWPIRq0Jjd4i8/API/tik7OfNwQacwzMbTmaF6FEM9O/AftTJhF7yeUO08QShC0pST44wtHojO0RQ8sCjFivNlTbtLyqB3sPBf+LnAgDi4+q3zrkNb/VbFZHwMuZteSWMK+nWiwCxQAuUyUZGCupbXJmHIcmYUKsfYEoe6YgHeYVyudwgei2yAGUy6LHe9QgEbb/ZLZQxi7+zCkwTvfLuAyqZQGolQK3fafqs0j+jbSTi237ew6nkK4ZCHWieh+uWwJHUcjgy1Ebwg/5If9cXsvvUDUS+/ZYgPtxKM28AqcTBR9UNp3RoFUa3WI5GPLilp2gZYI6tpxUtZjnEg16ltqti9qvm6hYyGnG1LUF4GAA07pItpCQnFDD320CqJ9KdfVeuSM7TqIcK+yF2zU82SV0er5b3x8czPUE/al7BSIm3BUxP18tKBh6dThpH8P6dhOUsKdxZs30AUv4eoXN8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(6486002)(186003)(5660300002)(86362001)(26005)(38100700002)(66556008)(71200400001)(2616005)(110136005)(478600001)(76116006)(64756008)(6506007)(66476007)(66946007)(83380400001)(7416002)(8936002)(8676002)(122000001)(66446008)(6512007)(91956017)(2906002)(316002)(54906003)(4326008)(99106002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YmJrcVFJcVlGNkExTVRHb3YxcE1pYzZtSGlHTTlzbFRmRm9DTkx5aUQ2dDll?=
 =?utf-8?B?ZE5EajJnMHNFWm82cWcrQVdlRHdWQ0F2cU1xdnUrSUtkSlBmbU4xL1d6cGJS?=
 =?utf-8?B?ZnRqTmlTNVpRMkJNUlFCTmpudnpIWGh6d2EyOWN0V1FNKzVqZmZZVU9leGpB?=
 =?utf-8?B?SGVnQU5JS25LUHEwTHo1T2N3TmNKbllJYTQzd1NtK05pRnZuazhBWVA3UDhM?=
 =?utf-8?B?VjdZdTNQMVIwdUk1OXJvelBOZ3pWa1crOVdTNkdDNjJEc1MrQ2hPS2Nqaktu?=
 =?utf-8?B?azFuOWk4b3RBaW0vdzRpRDR4MXRIQmI1dEtYUmJZRE90TjRMNm5uTWgwTmJC?=
 =?utf-8?B?UUNwMUVnb1RuTVpIUlVmdmJidkszQUFHb25Tem16T1I2VjFqemsyYjNUZDBS?=
 =?utf-8?B?NUE3UUtpaFJSZXIzRlVPSGdxTmUwaCtmalVQdG1CMzhnN1Y2YjVPcWRrVFU5?=
 =?utf-8?B?V0wxQUwrVHpYZ3cxaVRnYStnLy9LQThWTlRweW9ZWDZSb1VtRVZGcE9iQnZH?=
 =?utf-8?B?Q21Dd3VUSDgvQlVVUG1lVEJ1cm5WYjUvcFB1ZUpCRWR3WUtQRjByZkpzdGRY?=
 =?utf-8?B?NmhMM3FmaDZLTVVRb3dwdkJLSy9xeERENzlyR3lCc0NoeDJkVEhXU1AwUUQ0?=
 =?utf-8?B?Tk1nSkZWNUJSMlpMK3Z1aEpScm1kb0lGWE1rdndPcjRobkptaUxTUHNjc3Ju?=
 =?utf-8?B?b1M1bEV6Ti90WHVmQTNTTU4vZlRDTXN2SFhCV0FIV1Nob2trRjQxVHBYZXRK?=
 =?utf-8?B?NHBaTEJMTjFUaEJuK2xOTmgzd0FHd2ZZdTYyRk1MdUNwQXErOGZxQ3BZQ0Rx?=
 =?utf-8?B?UnJCOTFJMW8rZFVvY3gycGZpVGh5OHRkWTNlMW42MEF2anlCTEZJN0VCalBO?=
 =?utf-8?B?WXNDWkhmQXBoeU16ZkpRNXIrem0wMHFuam4zQldvbWhtbmtVZkVmcjdxeUFw?=
 =?utf-8?B?ekZLQkJjSnZHSksxN2pXb3ZDZVQxYy9wdmJNR1p6Vm1nalZnbW9BUStOOTFB?=
 =?utf-8?B?Nm4wd2NWU004Rm9Ba0QwWUxDeHFGSkRGWC9FL2RIQmF1UUxLQnladkpnV2s0?=
 =?utf-8?B?b0dKelRtaDlRazBXNXpxNG8rV290OTNwbW1aUWM3QTFLS3lVbGN2RFhGU2Ny?=
 =?utf-8?B?OENMMURjN296SG01M3VYSlp6ZHVTUHZ2WXFjQmxqdFBMdVM0RmtsanN2aWpI?=
 =?utf-8?B?LzVXR24yR2pnTS9FUmRGbjBmUnVqYzlKWFhUOVM5MnFSOE05NUM4bkE4QVFG?=
 =?utf-8?B?T0x4bW82WGpFRGd5ZEdaa3VuYTR5MUhmZHN3b2o0YVFqTEFkd2FMc3hwaGY1?=
 =?utf-8?B?bU9rR1kwSVU3TlQ5QlNoTHB3TlVpQjdHbDlLR3U4dHlCamZuSUZiS3VpQUJL?=
 =?utf-8?B?NzRCdVhsYzluUGwzMEJYUFIwRXVPY1dhQTBxT0c2STZTVmt2U2Jtamd1eFZ4?=
 =?utf-8?B?RGE5V0VibGtuVXlPQzRVaDArZmtmN20rRk12NHpsYzdUY0ZBWkRmdEtlSmxv?=
 =?utf-8?B?YlZvaDdEdnlHbXppWkNZSXpZQW12QzdvZWZvUk10ZXZ1YUMrMWQvNTc2ejZi?=
 =?utf-8?B?cmhzdERRMU10Z2lha0J3T204QU5tSmp6QXcyV0x0cldqU3UrMVpzaUUvUk9D?=
 =?utf-8?B?WDRwbk5DNTFlRWxXVC9ENzZqSHdEeHgySEhMYVRtaE8zR0hpTS9PeFJTTWFt?=
 =?utf-8?B?OTd1QVVGRnZid2Y1WTdnZmFOL1pzcUVvVGU0L0xIY1JZSE1uTzBzMVI1cEVC?=
 =?utf-8?Q?LwJbL4sFxBRTyXW3VJK9I0VQsG9ISJgjJjbo6Eu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <248CCD6450EF15409180F10E15081602@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545e162f-fbbc-4fd2-5cd4-08d9064070c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2021 10:13:28.7921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0seraXCnv1N3KpwZyIE/E2HDvXgLLsTvmtDgBhQSEifsCinPV23nW6nebst9UtdNhMZ09Go3dQB9sziupkKqtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7511
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQWlzaGVuZywNCnRoYW5rcyBmb3IgZmVlZGJhY2ssIHJlc3BvbnNlcyBiZWxvdy4NCg0KT24g
V2VkLCAyMDIxLTA0LTIxIGF0IDEwOjEyICswMDAwLCBBaXNoZW5nIERvbmcgd3JvdGU6DQo+ICsg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IA0KPiA+IEZyb206IE1pcmVs
YSBSYWJ1bGVhIChPU1MpIDxtaXJlbGEucmFidWxlYUBvc3MubnhwLmNvbT4NCj4gPiBTZW50OiBX
ZWRuZXNkYXksIEFwcmlsIDcsIDIwMjEgMToyOCBBTQ0KPiA+IA0KPiA+IEFkZCBkdHMgZm9yIGlt
YWdpbmcgc3Vic3l0ZW0sIGluY2x1ZGUganBlZyBub2RlcyBoZXJlLg0KPiA+IFRlc3RlZCBvbiBp
bXg4cXhwIG9ubHksIHNob3VsZCB3b3JrIG9uIGlteDhxbSwgYnV0IGl0IHdhcyBub3QNCj4gPiB0
ZXN0ZWQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5y
YWJ1bGVhQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gVGhpcyB3YXMgcGF0Y2ggIzcgaW4gdGhlIGlu
aXRpYWwgcGF0Y2ggc2V0IHRoYXQgYWRkZWQgbXhjLWpwZWcNCj4gPiBkcml2ZXINCj4gPiANCj4g
PiBDaGFuZ2VzIGluIHYxMDoNCj4gPiAgIEFkZHJlc3NlZCBmZWVkYmFjayBmcm9tIEFpc2hlbmcg
RG9uZzoNCj4gPiAgICAgLUFkZCBqcGVnIGNsb2NrcyBpbiB0aGUganBlZyBkdHMgbm9kZXMuDQo+
ID4gICAgIC1BZGFwdCB0byB0aGUgcmVjZW50IHNwbGl0IG9mIHRoZSBkdHMgaW50byBzdWJzeXN0
ZW1zOg0KPiA+ICAgICAgYWRkIHRoZSBpbWFnaW5nIHN1YnN5c3RlbSwgYW5kIHBsYWNlIGpwZWcg
bm9kZXMgdGhlcmUuDQo+ID4gDQo+ID4gIC4uLi9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OC1zcy1pbWcuZHRzaSB8IDg5DQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgICAgfCAgMSArDQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNp
DQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjE0NTdkMjE5
YTY1OA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+ID4gQEAgLTAsMCArMSw4OSBAQA0KPiA+ICsvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNCj4gPiArLyoNCj4gPiArICogQ29weXJp
Z2h0IDIwMTktMjAyMSBOWFANCj4gPiArICogWmhvdSBHdW9uaXUgPGd1b25pdS56aG91QG54cC5j
b20+DQo+ID4gKyAqLw0KPiA+ICtpbWdfc3Vic3lzOiBidXNANTgwMDAwMDAgew0KPiA+ICsJY29t
cGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4gPiArCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+
ICsJI3NpemUtY2VsbHMgPSA8MT47DQo+ID4gKwlyYW5nZXMgPSA8MHg1ODAwMDAwMCAweDAgMHg1
ODAwMDAwMCAweDEwMDAwMDA+Ow0KPiA+ICsNCj4gPiArCWltZ19pcGdfY2xrOiBjbG9jay1pbWct
aXBnIHsNCj4gPiArCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiArCQkjY2xvY2st
Y2VsbHMgPSA8MD47DQo+ID4gKwkJY2xvY2stZnJlcXVlbmN5ID0gPDIwMDAwMDAwMD47DQo+ID4g
KwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19pcGdfY2xrIjsNCj4gPiArCX07DQo+ID4gKw0K
PiA+ICsJaW1nX2pwZWdfZGVjX2NsazogY2xvY2stY29udHJvbGxlckA1ODVkMDAwMCB7DQo+IA0K
PiBzL2Nsay9scGNnDQoNCkNoYW5uZ2VkIGluIHYxMQ0KDQo+IA0KPiA+ICsJCWNvbXBhdGlibGUg
PSAiZnNsLGlteDhxeHAtbHBjZyI7DQo+ID4gKwkJcmVnID0gPDB4NTg1ZDAwMDAgMHgxMDAwMD47
DQo+ID4gKwkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiA+ICsJCWNsb2NrcyA9IDwmaW1nX2lwZ19j
bGs+LCA8JmltZ19pcGdfY2xrPjsNCj4gPiArCQljbG9jay1pbmRpY2VzID0gPElNWF9MUENHX0NM
S18wPiwNCj4gPiArCQkJCTxJTVhfTFBDR19DTEtfND47DQo+ID4gKwkJY2xvY2stb3V0cHV0LW5h
bWVzID0gImltZ19qcGVnX2RlY19jbGsiLA0KPiA+ICsJCQkJICAgICAiaW1nX2pwZWdfZGVjX2lw
Z19jbGsiOw0KPiA+ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19N
UD47DQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiArCWltZ19qcGVnX2VuY19jbGs6IGNsb2NrLWNvbnRy
b2xsZXJANTg1ZjAwMDAgew0KPiANCj4gcy9jbGsvbHBjZw0KDQpDaGFubmdlZCBpbiB2MTENCg0K
PiANCj4gPiArCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ciOw0KPiA+ICsJCXJlZyA9
IDwweDU4NWYwMDAwIDB4MTAwMDA+Ow0KPiA+ICsJCSNjbG9jay1jZWxscyA9IDwxPjsNCj4gPiAr
CQljbG9ja3MgPSA8JmltZ19pcGdfY2xrPiwgPCZpbWdfaXBnX2Nsaz47DQo+ID4gKwkJY2xvY2st
aW5kaWNlcyA9IDxJTVhfTFBDR19DTEtfMD4sDQo+ID4gKwkJCQk8SU1YX0xQQ0dfQ0xLXzQ+Ow0K
PiA+ICsJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJpbWdfanBlZ19lbmNfY2xrIiwNCj4gPiArCQkJ
CSAgICAgImltZ19qcGVnX2VuY19pcGdfY2xrIjsNCj4gPiArCQlwb3dlci1kb21haW5zID0gPCZw
ZCBJTVhfU0NfUl9NSlBFR19FTkNfTVA+Ow0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwljYW1lcmFk
ZXY6IGNhbWVyYSB7DQo+IA0KPiBJcyB0aGlzIG5vZGUgbmVjZXNzYXJ5Pw0KDQpEcm9wcGVkIGlu
IHYxMQ0KDQo+IA0KPiA+ICsJCWNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7DQo+ID4gKwkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKwkJI3NpemUtY2VsbHMgPSA8MT47DQo+ID4gKwkJcmFu
Z2VzOw0KPiA+ICsNCj4gPiArCQlqcGVnZGVjOiBqcGVnZGVjQDU4NDAwMDAwIHsNCj4gPiArCQkJ
Y29tcGF0aWJsZSA9ICJueHAsaW14OHF4cC1qcGdkZWMiOw0KPiANCj4gSXMgdGhpcyBjb21wYXRp
YmxlIHN0cmluZyB1cHN0cmVhbWVkIGFscmVhZHk/DQoNClllcywgaXQncyB1cHN0cmVhbWVkLg0K
DQo+IA0KPiA+ICsJCQlyZWcgPSA8MHg1ODQwMDAwMCAweDAwMDUwMDAwID47DQo+ID4gKwkJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAzMDkgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkg
ICAgIDxHSUNfU1BJIDMxMCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArCQkJCSAgICAgPEdJ
Q19TUEkgMzExIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsJCQkJICAgICA8R0lDX1NQSSAz
MTIgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKwkJCWNsb2NrcyA9IDwmaW1nX2pwZWdfZGVj
X2NsayAwPiwNCj4gPiArCQkJCSA8JmltZ19qcGVnX2RlY19jbGsgMT47DQo+IA0KPiBJcyB0aGUg
aW5kZXggY29ycmVjdCBoZXJlPw0KDQpZZXMsIHBlciBpcyBmb3IgdGhlIGxvd2VyIDE2IGJpdHMg
KDE1OjApIG9mIExQQ0dfTUpQRUdfQ09NTU9OX0RFQ19SRUdTLA0KYW5kIGlwZyBmb3IgdGhlIHVw
cGVyIDE2LWJpdHMgKDMxOjE2KSBvZiBMUENHX01KUEVHX0NPTU1PTl9ERUNfUkVHUy4NClRoZSBJ
TVhfTFBDR19DTEtfNCBpcyAxNi4NCg0KPiANCj4gPiArCQkJY2xvY2stbmFtZXMgPSAicGVyIiwg
ImlwZyI7DQo+ID4gKwkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmaW1nX2pwZWdfZGVjX2NsayAwPiwN
Cj4gPiArCQkJCQkgIDwmaW1nX2pwZWdfZGVjX2NsayAxPjsNCj4gPiArCQkJYXNzaWduZWQtY2xv
Y2stcmF0ZXMgPSA8MjAwMDAwMDAwPjsNCj4gDQo+IE1pc21hdGNoIHdpdGggYXNzaWduZWQtY2xv
Y2tzDQoNCkFsaWduZWQgaW4gdjExLg0KDQo+IA0KPiA+ICsJCQlwb3dlci1kb21haW5zID0gPCZw
ZCBJTVhfU0NfUl9NSlBFR19ERUNfTVA+LA0KPiA+ICsJCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdf
REVDX1MwPiwNCj4gPiArCQkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19TMT4sDQo+ID4gKwkJ
CQkJPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfUzI+LA0KPiA+ICsJCQkJCTwmcGQgSU1YX1NDX1Jf
TUpQRUdfREVDX1MzPjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiArCQlqcGVnZW5jOiBqcGVnZW5j
QDU4NDUwMDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJueHAsaW14OHF4cC1qcGdlbmMiOw0K
PiA+ICsJCQlyZWcgPSA8MHg1ODQ1MDAwMCAweDAwMDUwMDAwID47DQo+ID4gKwkJCWludGVycnVw
dHMgPSA8R0lDX1NQSSAzMDUgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkgICAgIDxH
SUNfU1BJIDMwNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArCQkJCSAgICAgPEdJQ19TUEkg
MzA3IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsJCQkJICAgICA8R0lDX1NQSSAzMDggSVJR
X1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKwkJCWNsb2NrcyA9IDwmaW1nX2pwZWdfZW5jX2NsayAw
PiwNCj4gPiArCQkJCSA8JmltZ19qcGVnX2VuY19jbGsgMT47DQo+IA0KPiBEaXR0bw0KPiANCj4g
PiArCQkJY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ID4gKwkJCWFzc2lnbmVkLWNsb2Nr
cyA9IDwmaW1nX2pwZWdfZW5jX2NsayAwPiwNCj4gPiArCQkJCQkgIDwmaW1nX2pwZWdfZW5jX2Ns
ayAxPjsNCj4gPiArCQkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjAwMDAwMDAwPjsNCj4gDQo+
IERpdHRvDQo+IA0KPiA+ICsJCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9NSlBFR19F
TkNfTVA+LA0KPiA+ICsJCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MwPiwNCj4gPiArCQkJ
CQk8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMT4sDQo+ID4gKwkJCQkJPCZwZCBJTVhfU0NfUl9N
SlBFR19FTkNfUzI+LA0KPiA+ICsJCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MzPjsNCj4g
PiArCQl9Ow0KPiA+ICsJfTsNCj4gPiArfTsNCj4gDQo+IFJlZ2FyZHMNCj4gQWlzaGVuZw0KPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5k
dHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4g
PiBpbmRleCAxZTZiNDk5NTA5MWUuLjJkOTU4OTMwOWJkMCAxMDA2NDQNCj4gPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiBAQCAtMjU4LDYgKzI1OCw3
IEBADQo+ID4gIAl9Ow0KPiA+IA0KPiA+ICAJLyogc29ydGVkIGluIHJlZ2lzdGVyIGFkZHJlc3Mg
Ki8NCj4gPiArCSNpbmNsdWRlICJpbXg4LXNzLWltZy5kdHNpIg0KPiA+ICAJI2luY2x1ZGUgImlt
eDgtc3MtYWRtYS5kdHNpIg0KPiA+ICAJI2luY2x1ZGUgImlteDgtc3MtY29ubi5kdHNpIg0KPiA+
ICAJI2luY2x1ZGUgImlteDgtc3MtZGRyLmR0c2kiDQo+ID4gLS0NCj4gPiAyLjE3LjENCj4gDQo+
IA0K
