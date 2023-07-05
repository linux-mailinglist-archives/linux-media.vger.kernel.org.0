Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5701747B12
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 03:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjGEBap (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 21:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjGEBan (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 21:30:43 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2088.outbound.protection.outlook.com [40.107.8.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3C410CF;
        Tue,  4 Jul 2023 18:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oxl5oO3Paznq7Q8gBNW7rck42/pHoaH22bN5NwVqojxLwqeDOxZIPoZrZiunNfeoJFEw/bhMwjcab9YRihptrSBMLyiiYSHmv6x9znqQK6M7EJeMExoDvPOmFANTy0kBzGXjqcGAPmyLW5BgibozyFAyQW/E22+XF8nB+cIvZlk+5kKgICWakDYpa0I9ikg+dvhP5cMlb3XGHToHHXD/gByrWjlirzJpz+8iGSoGkaeGo19q62aAztKkzm1IwVecd2dI0f/W+kn+ZOYCim0gdL/uaBVW4Rnqmp1xnKNArzetNVmn3dInPv8i/kHswjWk2vcQBBc6HsnzdvrerQrxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfA/3Ynbe+Udh2VMoeBwwWJTIlpn3+SllwX/+Lzhc/g=;
 b=iIeKBWtjaem3UD6s7MQToapEgf68koPoEJ7bgirD/bJPnR85WJCF3jPlA8I2SDrdfED9+qDGinGEmYvoumy9FAFPeUe9jLLJ8NxE3T7TAQJ4kPPsRxaN56ZNhc5r7FZ8YPxiPnG25IbaGmBovbevAFQGbLZHY7friBgISiRG2NCViivWtMSZQcIpEPF0AQyQRFSfdS6TUMyg55ZpEKwudNRqOK+iuSJu/WbL0b9wdCvgzJhTQsFHKNgWnwroZZ8XuSZd6yuglYyFiqZ+JHPQATtKzYOAtJzw632drbs1y/Pn4Gfd/DPlPfEeX/TeYsPKRyMaiDJ9fDK2xPMCkurx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfA/3Ynbe+Udh2VMoeBwwWJTIlpn3+SllwX/+Lzhc/g=;
 b=P4ZTOZ6t9Bdpvqky+0pEgc9EotfqxnWjdoWTfWgiUefqaLunn/s9bb9nql0w0HQ6rvB0McSD4y6liI5LXCMfyYaBIpWSi6JrSB2oavM5q5a7QY3yb/jDMbf+ZByYcfbX/vTMNLyibi/M2akaUsg7BN2ADLiKjKrd5G6bGt9kptM=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8734.eurprd04.prod.outlook.com (2603:10a6:102:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 01:30:38 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 01:30:38 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Conor Dooley <conor@kernel.org>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>
Subject: RE: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI
 CSI-2
Thread-Topic: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI
 CSI-2
Thread-Index: AQHZraIh2RFb/SSXAk2t6mby6BkWCK+p1OMAgACP1xA=
Date:   Wed, 5 Jul 2023 01:30:38 +0000
Message-ID: <AS8PR04MB9080CED9E49E7D7BDD41F26BFA2FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
 <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
 <20230704-unnamable-sandpaper-01fd3631e1df@spud>
In-Reply-To: <20230704-unnamable-sandpaper-01fd3631e1df@spud>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8734:EE_
x-ms-office365-filtering-correlation-id: 06961336-bb4f-4ef3-fe7c-08db7cf77040
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LImXcJjNy9BJeloXkpv6f4+7pX9/JSPAIprwcTTyiWgP28OOwRZDosw+bqgajWjKr3sa9lpcwyh7vBIFeaVgAOCghHg9UGWY+JRBkE2r3eJwxiha0F58gI/fGmh56BsUusgdDvn/J73d7Ddofa0YisDowZ9t+iISDOdtyVZa80q1ad/23IxICZUiUj+Nq51GsmY1TU6F1K1dTY6JsbsUdlw4xfU/O1PEou27fi+XLXNnUTqIXhGFlGtUklNgQA+klemK6s+lt1Tv01VUIETRyIozdscXJw3vnTOh+KjdAb7SbdOCyV7tJCe5HcQ3QUHVGnC+JIqe16DVePtuACsEWLWUTATDkClanngS6MCyp67njazhpzDxSpesw3Jkzevip6yaCtf60hcdWPD00VHAIJU9w/w/W1R4Z/c3Fh/45L6ivMeMABELclu9B95S3eSNJM8Gb7rDsF1W4vxWFdVAVH++EdYiZEM56Xi7hWY6t1CORuh90bwDrcloEBD4kOclnxxtxhPysC8MIVSsX4Bm5cfo2ab9kLJsFSkCjP1hdpQS4gJPpR9sYoryub2Y4s+Ir4eRMmcZKeIqGTHcsW4eEYKymcbnkmYNzzsq8V1Kl34=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(71200400001)(478600001)(83380400001)(966005)(86362001)(7696005)(66946007)(76116006)(6506007)(316002)(38100700002)(26005)(186003)(9686003)(53546011)(4326008)(122000001)(64756008)(66556008)(66446008)(54906003)(66476007)(110136005)(8936002)(8676002)(38070700005)(2906002)(41300700001)(55016003)(52536014)(5660300002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?UE1ObzdPYnZLMmRTSm1HUThjd0RhbjZXanVBSTlMd2NUZDJxUGNVWHkrOWtB?=
 =?gb2312?B?NVFFMEZMeUhycUtGTGw1S3F6czdzVEtRekRJS2VuRHB5bDhFU3NYdytpcHQx?=
 =?gb2312?B?OVBTdUdJWlJFT3Zud3Z2dDlBNHc4R0FSRFF6RHZ3dVdiMlpKelhuMEFlNGt1?=
 =?gb2312?B?YUhXbmo2ZTdMM2VPeVg2SmJyYjQxVHJZZEJ2bnlxdktWUXdWLzNOSkwrM0RL?=
 =?gb2312?B?eWZPUW42enVJcTFPN0dscDMxcU1mNmYxOGhmSHZaa0QxTkk5NVBXYkN5dUkv?=
 =?gb2312?B?RmlZSzJIMThCRldndThRYlRrdHFjcWxiR1kvdGg4QVhNM0JGODB3R1RoNmNG?=
 =?gb2312?B?bzh2OEUrY1c3TmtLb3BIeFhZb2IwcEZ6anh6TEJzOUpGYzZ2OSs3OEhNcUxR?=
 =?gb2312?B?VnRaR2c1eHl2WENMNEp4RDlSZngyK1g5YmNMYVZIMDhia1lUTERXY3RrNEdR?=
 =?gb2312?B?L0VjbGNQdG9xQnhuNERXQ1BrQ252QlllL2JGREw0R2ovTUdkZkJQSzQwUVJX?=
 =?gb2312?B?NW53VDJBY2o5bFNXSmRuUXRKc2haaTY1U2NlUVVmRkQ4ZEVuZzNwZ0RvNk9j?=
 =?gb2312?B?UW4veEJBQ1hoZng1M0hLdElmSHdFcTNSeFdsMURCVFRRMjJ4Wk95K3JCZ2to?=
 =?gb2312?B?YWNlbUdiZ3dpbXJvdEVGbW0wOVlvYm1IbUdTMVJNNnBkem04U0tzSlFUU3U3?=
 =?gb2312?B?Y0NjQnoyY1hyODZwT0ZyNXZIdmM3WU14b2pzTVhIYUQzQVQzVFpmTjZRejR2?=
 =?gb2312?B?NW4xRlVUb2V0dTAzOC8zS3N0OXJ1QmtiKzN0V2NIM3FXTnlaVERsTXNUNVVo?=
 =?gb2312?B?K2ZpRXBXLzNXNTFiaTQ0UUZMbFRaWmVUQjBkd2F4NUF3TzM2c2hHbTc4dDVj?=
 =?gb2312?B?Ym85OHdzUGtyRlAwNENDZUVDZ1FwcFJhT1MwNFN5QTNzazcyMjhxMFJ1dHNp?=
 =?gb2312?B?amFkcVc0M3Uxa1pHNWQzTjlNMGVHOGxOVHJ4cXYrc0pOa3FCcXltbW8rK0Z2?=
 =?gb2312?B?N0p2QzB5WHhlQnBWREpBbFFWY0hVenYxTmZyTmUxNzdibjl5Nk5Lc1NXNlZz?=
 =?gb2312?B?N0Q3Qllkb2oxT1ovb0xFNENYa1A3SjZnQ0NuL3F5T1paTUc1eHUyVEY4Tjky?=
 =?gb2312?B?c1o0ZDVnazR0aFh1NzlzRGlWcnl0Q2Z2eUhkbDlNUlJqUkx6OFMxdkdBTFBO?=
 =?gb2312?B?VlM5eHl1K3BSTjlBSXBwYlZSOVp4QXAzRFZFVE5MZ2xlVnJyUDgxdkdMQXN4?=
 =?gb2312?B?MmQyRHlXWkYrZi9uL0l6M0Foc2k0NGtaODB4c2N3ZUdrVGh0a2VTcmRxUWc4?=
 =?gb2312?B?N3UzODZGUEl5cXFrWXl2NEZVcTB5WmNmZWYrckVYa0svM242VHVZLzlzNG1k?=
 =?gb2312?B?U3BudS9oYTAwWDh1SDB0TEpMeG1nRHZSM0FYYk90L0lVUlQxT2FxOVVncUlN?=
 =?gb2312?B?Z0p3TjhIL0Z4em8xRHB3OGdCM2FlWC9HVjBPVm1rSUdDY0t1ODhaQUwyc25V?=
 =?gb2312?B?clp6MmxvZDdqOU1RMWxPdTZhWktPNGZrNEZwK1pFSHdHcTNNdDBLT2Jsdkxi?=
 =?gb2312?B?R2ZwV045UHpqS1A3MXdqTU1xVHNEYWhYakMrZDFpOEE1SnVna2JLazI2cGNa?=
 =?gb2312?B?V2JPRW5NLzZNVFpzTXloNTlFNGdMdmt2ZWxQUkh6RTlBdC9FUmhwMEY5VUZZ?=
 =?gb2312?B?OTR2WGY2ZXd0RGt1Tk9FSUVVWlJiRU1KMCthS0VqQUJTVDQzTllleERzazFz?=
 =?gb2312?B?YzIwYnVMU3pJNEJlMFY1NGZLQy9kbytRVkhZL1dOSVRHaXNxa1dXbkZRTWd0?=
 =?gb2312?B?MURqell2TXJJZngreU16N2dKdTdTTExlRXdDZ0JneS9kaW90blhTallaRjRI?=
 =?gb2312?B?ajRZbGk3a3pic2dURW9sNmE2VlZ3eHlUcFpERTVONVliL2M1d3UxVjVKWFdG?=
 =?gb2312?B?ZUpYTndKVnI2cGY4UGpmNjlLcVg5Zjd4dVkrUGtud1lyei8yVzZrdDArcnFp?=
 =?gb2312?B?dnJ6cittZGc5cDJINHloaEt3T2hZRWxiaE1ZOXh4NGRxNFFmdFNBZXVwVTNZ?=
 =?gb2312?B?Vis1aDVoc2hSMEZFVVBxbG9RUU0wREtueXlmT0NBY0tUekFmV1lFRWZXMWZp?=
 =?gb2312?Q?vyXCudPeOYnjr5oCULqq3zDkl?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06961336-bb4f-4ef3-fe7c-08db7cf77040
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 01:30:38.4908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zltF1IiWTVTvKOMEglxGWyKesnOitSJ97/53GlKNs5UZnBcoMcs6b4pCObaYZcqJsw/QY00sgUqCfX6FvI+3WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8734
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQ29ub3IsDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4NCj4g
U2VudDogMjAyM8TqN9TCNcjVIDA6NTQNCj4gVG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpo
b3VAb3NzLm54cC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXgNCj4gPGxpbnV4LWlteEBueHAuY29t
PjsgbWNoZWhhYkBrZXJuZWwub3JnOw0KPiBsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b207IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4ga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8u
b3JnOyBjb25vcitkdEBrZXJuZWwub3JnOw0KPiBqYWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNv
bQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gbWVkaWE6IGR0LWJpbmRpbmdzOiBBZGQgYmlu
ZGluZyBkb2MgZm9yIGkuTVg5MyBNSVBJDQo+IENTSS0yDQo+IA0KPiBIZXksDQo+IA0KPiBJIGtu
b3cgbGl0dGxlIGFib3V0IG1lZGlhIGJpbmRpbmdzLCBzbyBvbmx5IGdvdCBhIHNpbmdsZSBjb21t
ZW50IGZvciB5b3UuDQo+IA0KPiBPbiBNb24sIEp1bCAwMywgMjAyMyBhdCAwNzozNzozM1BNICsw
ODAwLCBndW9uaXUuemhvdUBvc3MubnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiAiR3Vvbml1Lnpo
b3UiIDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+DQo+ID4gQWRkIG5ldyBiaW5kaW5nIGRvY3Vt
ZW50YXRpb24gZm9yIERlc2lnbldhcmUgQ29yZSBNSVBJIENTSS0yIHJlY2VpdmVyDQo+ID4gYW5k
IERQSFkgZm91bmQgb24gTlhQIGkuTVg5My4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25p
dS56aG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3Mv
bWVkaWEvbnhwLGR3Yy1taXBpLWNzaTIueWFtbCAgICAgfCAxNDANCj4gKysrKysrKysrKysrKysr
KysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNDAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254
cCxkd2MtbWlwaS1jc2kyLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9ueHAsZHdjLW1pcGktY3NpMi55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmVjZTZmYjg5OTFkNA0KPiA+IC0tLSAvZGV2L251
bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbnhw
LGR3Yy1taXBpLWNzaTIueWFtbA0KPiANCj4gVGhlIGZpbGVuYW1lIG9mIHRoZSBiaW5kaW5nIHNo
b3VsZCBtYXRjaCB0aGUgY29tcGF0aWJsZS4NCj4gDQo+ID4gQEAgLTAsMCArMSwxNDAgQEANCj4g
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9tZWRpYS9ueHAsZHdjLW1pcGktY3NpMi55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3Rp
dGxlOiBOWFAgaS5NWDkzIE1JUEkgQ1NJLTIgSG9zdCBDb250cm9sbGVyIHJlY2VpdmVyDQo+ID4g
Kw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIEcuTi4gWmhvdSA8Z3Vvbml1Lnpob3VAbnhw
LmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8LQ0KPiA+ICsgIFRoZSBNSVBJIENTSS0y
IHJlY2VpdmVyIGZvdW5kIG9uIGkuTVg5MyBvcmlnaW5hdGVzIGZyb20gU3lub3BzeXMNCj4gPiAr
ICBEZXNpZ25XYXJlIENvcmUgYW5kIGl0IGltcGxlbWVudHMgdGhlIENTSS0yIHByb3RvY29sIG9u
IHRoZSBob3N0DQo+ID4gKyAgc2lkZSBhbmQgYSBEUEhZIGNvbmZpZ3VyZWQgYXMgYSBTbGF2ZSBh
Y3RzIGFzIHRoZSBwaHlzaWNhbCBsYXllci4NCj4gPiArICBUd28gZGF0YSBsYW5lcyBhcmUgc3Vw
cG9ydGVkIG9uIGkuTVg5MyBmYW1pbHkgZGV2aWNlcyBhbmQgdGhlIGRhdGENCj4gPiArICByYXRl
IG9mIGVhY2ggbGFuZSBzdXBwb3J0IHVwIHRvIDEuNUdicHMuDQo+ID4gKw0KPiA+ICsgIFdoaWxl
IHRoZSBDU0ktMiByZWNlaXZlciBpcyBzZXBhcmF0ZSBmcm9tIHRoZSBNSVBJIEQtUEhZIElQIGNv
cmUsDQo+ID4gKyB0aGUgUEhZIGlzIGNvbXBsZXRlbHkgd3JhcHBlZCBieSB0aGUgQ1NJLTIgY29u
dHJvbGxlciBhbmQgZXhwb3NlICBhDQo+ID4gKyBjb250cm9sIGludGVyZmFjZSB3aGljaCBvbmx5
IGNhbiBjb21tdW5pY2F0ZSB3aXRoIENTSS0yIGNvbnRyb2xsZXINCj4gPiArIFRoaXMgYmluZGlu
ZyB0aHVzIGNvdmVycyBib3RoIElQIGNvcmVzLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4g
PiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBmc2wsaW14OTMt
bWlwaS1jc2kyDQo+IA0KPiBFdmVyeXdoZXJlIGVsc2UgeW91IHNheSBOWFAsIHdoeSB1c2UgRnJl
ZXNjYWxlIGhlcmU/DQoNCkR1ZSB0byBoaXN0b3J5IHJlYXNvbiwgYWxsIGkuTVggcGxhdGZvcm1z
IG9mIE5YUCB1c2UgImZzbCIgYXMgdmVuZG9yIGFiYnJldmlhdGlvbiBwcmVmaXguDQoNCj4gDQo+
IENoZWVycywNCj4gQ29ub3IuDQo=
