Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA33725410
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 08:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbjFGG02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 02:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjFGG01 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 02:26:27 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B8D1721
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 23:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik0uWSRxtV1agOWhEJqqn3alQPnbQHWnPNvhcHrhgbOlvtLsp5bC/PfVuK/1w1iKAIngpKDn9/YgouorxPbirDCNunWRhema/PnndC8pCx2DM4i4loAg8OUZe0ck0zZCLexYhZ/Sk8VKoFXb26hMexDnP4OKpqlaTvmwojebCVeFycPyb5vuMnnpsCd1CeUbkzgAcM9JC+Pd1H+ZnFNayCALvAY1AiDBadgB/l92Qgvft3KiapewVpeqf41eqXdf4BHpVcOtpQlEovKJd24Xob/rKQqpUMx+JWI8PrCamOkDo5KlbfhGAxqCUok9hdPcqrTOCdVD3p10Z68FF19STw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vn+rRRdmFLZdfxvZP6GJjYaohnitfs3jbgrbUpUNtzA=;
 b=hUQ2P6xFjss91wI7YYqODOOlZQq4Ql8cvfiOjUcFAvSZITtBvKhSSm40qcDJKSa2DVjFF52FKN+c1GqUHOS+6rj0CtSpSSP0GhmF4Q6UNGB+WOQWqD1BGyZP/UepYXa55eHzI6saSWZf7lO38xKyWkhNJDhZJJuZMl5pe5lyAZIm0K4xbYOLZCeLSEGDtenEou/6Sq8XlTmhGJPjr+dVV35Avy5wy2nX2Rreh8IT6UVG70QzSqyNs+DeCj28oPtHqwypAXXCy318ZsO+ptqCKQ2mzu8v4pFByJEWagA+73dmfbO1RwLNOD7B7L/QdgQYL5XjTNmVsxtmj/yTTXOmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn+rRRdmFLZdfxvZP6GJjYaohnitfs3jbgrbUpUNtzA=;
 b=gxTDTnwicJyb0XP9JxMaa6zZef7eoYvuYjUwMM1qs0frsq8a2bTRKap2bbVW4sZqiJA/KbaJvs8VTkNybBVk3QIpJN9L4OCyzJJi/+y3Q7wsN/T6i0TVefmfh2OZa9C/3Fu9wuTYbOV4S1zAbHtXlqxBR1Hamc2SHpcgu9b/yCI=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8166.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 06:26:22 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 06:26:22 +0000
From:   "G.N. Zhou" <guoniu.zhou@nxp.com>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] media: ov5640: fix low resolution image abnormal issue
Thread-Topic: [PATCH] media: ov5640: fix low resolution image abnormal issue
Thread-Index: AQHZiW+ro2GReV8sVUeNP/ppo3BIq69+/r/Q
Date:   Wed, 7 Jun 2023 06:26:22 +0000
Message-ID: <AS8PR04MB9080182A18EB8A338087F419FA53A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230518100557.2495843-1-guoniu.zhou@oss.nxp.com>
In-Reply-To: <20230518100557.2495843-1-guoniu.zhou@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AS8PR04MB8166:EE_
x-ms-office365-filtering-correlation-id: f61616fc-cdaf-42b9-fa11-08db67201ce6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lVLuouO9AonYEUfSmbpfXxIIb5G5tVkgJ5dD+uxCt/L6qHvILojFT7ml2B3ETHXVD0HmhabnsTSERjnhs+Rf/V4OoY5gWh4/eXt434fgRpbuf+HwmlKgD1KgZghMXt+Q/EuDGwDKGacc5LIP77zKgfYRIFPURZHNno04yio2Ny+dw3VHYl/5BPYTxkzQNoqKWUF8/Rxxfb3R8txMnMb0AwrlAQotqxlglzv324Lt2TbXCxtE2/mWgZsuTXLaz29twRwUnP20PSr4D8koePFPrb+Ry7sfEX4/lF8Sfj8ZcZKr1kHnFAeyVr1a9U2iAT6RGVLe45xAUMHPu/M1z2t4TGG5Ss/La7bWWTSv18ZqsCybYGtYOOrKntvGAqPDWwOQr5NfkI1I8kNdJbLe/d9uIMDfv4nG30nCOlNLmO9lEGBh/6axklb+cUZfzGXbvwQVJqlbmtsKq7wXmXFee6aokk6B6fB62Our0J7131ZWrw4XXZ/HQC1R1A0o3dAXhyyJ7+Pd9RMbx4T9o3Wp6S/5H1GeXun2KMTFwNcFsCtgKZR71DxtRNyO/CkMgae8Se+YlfIutzH0hXnRDKEobMRA9ZTghXC03l5fDzsWWrT2f40ON0YiEhxkzQbIoIP7fPsg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(26005)(9686003)(6506007)(53546011)(83380400001)(38100700002)(41300700001)(7696005)(186003)(478600001)(2906002)(110136005)(66446008)(66556008)(66476007)(64756008)(122000001)(76116006)(55016003)(66946007)(316002)(71200400001)(52536014)(8936002)(5660300002)(8676002)(4326008)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VWhmK1d2Uy9UaldiZHVzQmZ1VEFrQkVXUU9NZUF4VDcxVnVaWmRqNTA0OE5M?=
 =?gb2312?B?R3NJYUR3YUtUN28ySFloV1IzU0w2WDdVelN2R1RZOHU0QkllRFhzWk5sdXFj?=
 =?gb2312?B?amVkaUdET25VRlgxQmkya3E1MWJpQ1RkWkZnRVd2Z2NTU0tmVHV1amIyOUZN?=
 =?gb2312?B?eUxYTXgxTTk2Ym8wYTMyRTJzM0Z1RlBQa1dVQ1kvTi9wTlVjNVJmcUZjUllY?=
 =?gb2312?B?NjR4anBmYXFNV2c2cmxlK3FzTm91Z28ycVZhczB1UjY5SlR2dVd2cEhoR2Zl?=
 =?gb2312?B?Q0FPQi90djgrMWFkRVpzZ3ZSUWhRblpPdnJBdmNkTUcyenRJT2M3dWIwSHhM?=
 =?gb2312?B?TjNKZjltcThXUithdENjVmlBTWRUcG9IemoxRXFOakJtbTB1aUxoR05aMWZX?=
 =?gb2312?B?VUY2dWY4L2hLUkQ1d3dmaUdaN0lua2JmTWx3VlNNajVlNXJBSFVDOFZlNTJL?=
 =?gb2312?B?N2hwT2JVSGZiL3UzYjRDQlZQMlJrOU4xcFhlcVZrZStKc1RWMTU0NmhnR2tI?=
 =?gb2312?B?Ny9za0hpTEkxeTRqSkxNdURJRUFIVDJjb1NFejB6dSsyWjh1L0k0MExtMGJL?=
 =?gb2312?B?UFYvd2RHY1U5RVJlNFZIVmVjdWpzNFVSaUU5VDlYNmZxaHlSMmovbWtvcWhT?=
 =?gb2312?B?Vm4vMU4yVS9xZXBlampCVXJJNVdyTDZXTUZtREhCa3dVUHBNNjFraHVxcVBp?=
 =?gb2312?B?R1pBMnEyVUVPaUNQaGIvVDVJWm93UThaWmNzckliY1h0bzVVaWFHelBXaWRp?=
 =?gb2312?B?YUw4SmxtLzVVcWlLbHFFZGFyVU1xeGlta29GZE5yN1g4ajlwdDBKNzFPbUJl?=
 =?gb2312?B?VHdOM00zazV4S3JaT3N2MzBPcGlvcnZyektRVUV6R3RsWURmVG9hSkNWMGQ0?=
 =?gb2312?B?TnpoZTFWWHdzRHBTSmt2amlKWlY3bzkyTVZmTE5yemV5THBjZEUzSzloYmxz?=
 =?gb2312?B?WVZod3A3N3YzZmoxMW5nb3FWdjRqQlloclhyS3E3NC9COG1uaXl4bTJoSTNs?=
 =?gb2312?B?SEMraFJjZXZIS3p4RGxHbzFXZ2xoSy9CZzFadWZ2YXlpM24zU1JDR2lMSno2?=
 =?gb2312?B?bVF6OFd2eW9admdUcjJwM0RzbFlIZUF6RGx5NVlwUXhjMXF4VVRoNGh0cjlm?=
 =?gb2312?B?S2JOUUIyOFcrZE9RSEdZbjNDZGR4TFVOb080M2JMRk9Vd1lGYmx0NGMxbEsz?=
 =?gb2312?B?RWJERTlNN1JTRm9rZlJ4ZjNRcWhycXNxbjVXU2docmhMb2NKOFZyQXVVakNK?=
 =?gb2312?B?VktPMEJseGg5Q1lsTlZSVFRkTmN5YlBJb2RYdEl4K0xad3psd0k1MDdDbFNU?=
 =?gb2312?B?dmNicVdQM1V2d0l2ZHFjTlloNSs1L3A3WUVVb1VSQ0ZhMGNDWWFHck90QWgw?=
 =?gb2312?B?LzFqelh0d2M3VkFsQkRNUnp6blA3cVhKT21tbVoxNkNwc3FYQXBWYWNSaHJU?=
 =?gb2312?B?U1R6RFlQSTVUOFFod2hzc1JjNkw5WFdGazF3WHZKZzk3ZE5qRitMRGc0QWlL?=
 =?gb2312?B?YVhBNnJDT05hY1RGYTc3MWoyKzJZK3ZJblBITkRrYnk2TUFDbHpVZjBjVXhj?=
 =?gb2312?B?R0N5eFd2NEptMFJoZi9ibUlPanRlZmQ3NGQvQTdqQXlPNWpQLzVNa0NXWU5K?=
 =?gb2312?B?N0k5NkM1dFY2WHpmY3IyWUYrbFpMWTJseXhwY1g0OGx4N05NYzN3OXlCaWF3?=
 =?gb2312?B?SFhaYkZ2R2NVdUxvQ0xqZEkwd1FYUG5UUkF5SG5QRWo2TFM3SUxpT2tKU0JR?=
 =?gb2312?B?MU5VTlBONjdTYlR4Vk1sbzBGTTB2bDN3ditJYXBxbGZtdkEveG8yclNUWnpP?=
 =?gb2312?B?SGVMYXR4OEY0M0V6UE9ucjVhY2w2djVjazRib2RGTWZJZHlSL2wrVVJRR1ZD?=
 =?gb2312?B?SWF2UmtxUnp4S0pzM3gyeUpmVy9PSUE5WWZhM3IveHR0K3NDdXRaZHhlbjRZ?=
 =?gb2312?B?MUNjaGc1YlFQSGg0dGV6YmNGWWxTaHZVekF5VEE2MDhHRFRFS0R4SUI0SEVE?=
 =?gb2312?B?YnV1bHM3TU55TWs3U2RqNHEzbHd5cXlUMTZNMW1RaGZRL21sWWpOc0luL0dh?=
 =?gb2312?B?ek9XM2VYc3QrVnpHTG80UnYxb2l4RnpxZlJJNXVZSFBtbkVIOXZGdTRMVXNy?=
 =?gb2312?Q?fxKorHYkk8Eqb8lWQ3+Yr+JzU?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61616fc-cdaf-42b9-fa11-08db67201ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 06:26:22.4277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wzZFRvAJJMhR0vTSssILi2Mk74zZjjV5FPbSFPai7sFEAKX6qpZjCAwwkjOKNZkieSXyM+6ZFeWKIF352nVgug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8166
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQUxMLA0KDQpJcyB0aGVyZSBhbnkgY29tbWVudHMgb3IgdXBkYXRlPyBJIHdpbGwgYXBwcmVj
aWF0ZSB0aGF0IGlmIHRoZXJlIGFyZSBhbnkuDQoNCkJlc3QgUmVnYXJkcw0KRy5OIFpob3UNCg0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEcuTi4gWmhvdSAoT1NTKQ0K
PiBTZW50OiAyMDIzxOo11MIxOMjVIDE4OjAxDQo+IFRvOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmc7IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gc2xvbmdlcmJlYW1AZ21haWwuY29tOyBqYWNv
cG9Aam1vbmRpLm9yZzsgc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbQ0KPiBDYzogbGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tDQo+IFN1YmplY3Q6IFtQQVRDSF0gbWVkaWE6IG92
NTY0MDogZml4IGxvdyByZXNvbHV0aW9uIGltYWdlIGFibm9ybWFsIGlzc3VlDQo+IA0KPiBGcm9t
OiAiR3Vvbml1Lnpob3UiIDxndW9uaXUuemhvdUBueHAuY29tPg0KPiANCj4gT1Y1NjQwIHdpbGwg
b3V0cHV0IGFibm9ybWFsIGltYWdlIGRhdGEgd2hlbiB3b3JrIGF0IGxvdyByZXNvbHV0aW9uICgz
MjB4MjQwLA0KPiAxNzZ4MTQ0IGFuZCAxNjB4MTIwKSBhZnRlciBzd2l0Y2hpbmcgZnJvbSBoaWdo
IHJlc29sdXRpb24sIHN1Y2ggYXMgMTA4MFAsIHRoZQ0KPiB0aW1lIGludGVydmFsIGJldHdlZW4g
aGlnaCBhbmQgbG93IHN3aXRjaGluZyBtdXN0IGJlIGxlc3MgdGhhbiAxMDAwbXMgaW4gb3JkZXIN
Cj4gdG8gT1Y1NjQwIGRvbid0IGVudGVyIHN1c3BlbmQgc3RhdGUgZHVyaW5nIHRoZSB0aW1lLg0K
PiANCj4gVGhlIHJlYXNvbiBpcyBieSAweDM4MjQgdmFsdWUgZG9uJ3QgcmVzdG9yZSB0byBpbml0
aWFsaXplIHZhbHVlIHdoZW4gZG8gcmVzb2x1dGlvbg0KPiBzd2l0Y2hpbmcuIEluIGhpZ2ggcmVz
b2x1dGlvbiBzZXR0aW5nIGFycmF5LCAweDM4MjQgaXMgc2V0IHRvIDB4MDQsIGJ1dCBsb3cNCj4g
cmVzb2x1dGlvbiBzZXR0aW5nIGFycmF5IHJlbW92ZSAweDM4MjQgaW4gY29tbWl0IGRiMTVjMTk1
N2EyZCAoIm1lZGlhOg0KPiBvdjU2NDA6IFJlbW92ZSBkdXBsaWNhdGVkIG1vZGUgc2V0dGluZ3Mi
KS4gU28gd2hlbiBkbyByZXNvbHV0aW9uIHN3aXRjaGluZw0KPiBmcm9tIGhpZ2ggdG8gbG93LCBz
dWNoIGFzIDEwODBQIHRvIDMyMHgyNDAsIGFuZCB0aGUgdGltZSBpbnRlcnZhbCBpcyBsZXNzIHRo
YW4NCj4gYXV0byBzdXNwZW5kIGRlbGF5IHRpbWUgd2hpY2ggbWVhbnMgZ2xvYmFsIGluaXRpYWxp
emUgc2V0dGluZyBhcnJheSB3aWxsIG5vdCBiZQ0KPiBsb2FkZWQsIHRoZSBvdXRwdXQgaW1hZ2Ug
ZGF0YSBhcmUgYWJub3JtYWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUuemhvdSA8Z3Vv
bml1Lnpob3VAbnhwLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYyB8
IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIGIvZHJpdmVycy9t
ZWRpYS9pMmMvb3Y1NjQwLmMgaW5kZXgNCj4gMTUzNjY0OWI5ZTkwLi5iMWE0NTY1ZmRjMGYgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jDQo+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvaTJjL292NTY0MC5jDQo+IEBAIC02MzQsNyArNjM0LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCByZWdfdmFsdWUgb3Y1NjQwX3NldHRpbmdfbG93X3Jlc1tdDQo+ID0gew0KPiAgCXsweDNh
MGEsIDB4MDAsIDAsIDB9LCB7MHgzYTBiLCAweGY2LCAwLCAwfSwgezB4M2EwZSwgMHgwMywgMCwg
MH0sDQo+ICAJezB4M2EwZCwgMHgwNCwgMCwgMH0sIHsweDNhMTQsIDB4MDMsIDAsIDB9LCB7MHgz
YTE1LCAweGQ4LCAwLCAwfSwNCj4gIAl7MHg0MDAxLCAweDAyLCAwLCAwfSwgezB4NDAwNCwgMHgw
MiwgMCwgMH0sDQo+IC0JezB4NDQwNywgMHgwNCwgMCwgMH0sIHsweDUwMDEsIDB4YTMsIDAsIDB9
LA0KPiArCXsweDQ0MDcsIDB4MDQsIDAsIDB9LCB7MHgzODI0LCAweDAyLCAwLCAwfSwgezB4NTAw
MSwgMHhhMywgMCwgMH0sDQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnX3Zh
bHVlIG92NTY0MF9zZXR0aW5nXzcyMFBfMTI4MF83MjBbXSA9IHsNCj4gLS0NCj4gMi4zNy4xDQoN
Cg==
