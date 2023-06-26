Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8943173D5BF
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 04:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjFZCOm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 22:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjFZCOk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 22:14:40 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2070.outbound.protection.outlook.com [40.107.105.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E735CFA;
        Sun, 25 Jun 2023 19:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuslOZpd/Y9rnJhZoBtGQCBg8BMRDiKyrzZSLTDCAjdA8IBm180XFSTBSyQ8UEmYQu/okVN3pC6S5n9eMEiEGSPsexig1hs50418VbgkjiAFWfWS0Hlk4TFIuhUliP2b+tHsKlfWvmuPqUBabNH8pwvv0BCne4RiGjpoSCSP+NGatPx5pBV9JbJi0hYFb1Sk8JsDtcPhFIOwDmaKkqk0WhQ72ORrxq9TYiRXM/01pbPUlsp9zBqVb5FqkcTgrAgcFJONyvwPzjXw1U3pUCaxhruobu2Q2zXPB9pjZVl8Q0Rn+VCYaSMXpdTsrhZFcARmWxDz/aUBO4tW7AJNgzoQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HCcUL6naEOLD6yamfkrq2P/13I+6LYIXKNCUEnlmPY=;
 b=c4jjNaOn2a2CANMyfcgw8co5Qdp/GUQnHrWNc7OMStt5Yr3KOKSzTu8Koa8JxHO1iyp3/Qa9mBc1QySI1paYtgjYanrBIOuYfUcAJDhRvJhe0DePhYZaay83LjQ/U8NJNLtqDSYzdjPuVy2oS7IAYB/jywlMDuSgrTi3kZftnEWjNtgdJy6RImCxiEANy/WevffdHkJHBnqYAa2krH8jCsb1B/GjWd0WehRv/derwItTAYXttEpCZpfwCy7+EUGWyK2hitbxXJUwSpmL2SHiGO2pvJgUr+DPSTZS83qIiD1uQnQeVUNnBkq+NVbU78YGSt+wPr8LY6b13CbUVM4Z1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HCcUL6naEOLD6yamfkrq2P/13I+6LYIXKNCUEnlmPY=;
 b=WCLTNzi0Z6u344PndXx1IEeH5awAf3F0pAjn1XoJdRFg8xHH9RKQhE38C+bGgP7gxz1GYDyptOa2aw5NZcmbF/R/bLDT8TB5Yyx+G+zZWD0HIzyWCUFDcm8f8CWNBS1bGbxPv5BgC3FICvAIkwIDADAzPI/tPI0T5eZdqZ0/2XM=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7868.eurprd04.prod.outlook.com (2603:10a6:10:1f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 02:14:35 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 02:14:35 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: RE: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93
 support
Thread-Topic: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93
 support
Thread-Index: AQHZp9PzsAyZVAg+V0mxGR/6sAbPMQ==
Date:   Mon, 26 Jun 2023 02:14:35 +0000
Message-ID: <AS8PR04MB908009DD13F7D963B21F8A62FA26A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
 <20230625080916.3553621-4-guoniu.zhou@oss.nxp.com>
 <63eb8605-fa23-fe13-e635-1cfdbcafb5c7@linaro.org>
 <AS8PR04MB90809D01798D2B11D7CB9681FA21A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <AS8PR04MB90805AAA11EBA29F4EA20632FA21A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <abd16b7d-981e-68e1-b5de-62b2857a114f@linaro.org>
In-Reply-To: <abd16b7d-981e-68e1-b5de-62b2857a114f@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DBBPR04MB7868:EE_
x-ms-office365-filtering-correlation-id: 28f829b0-2a6d-4a19-236f-08db75eb163e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tcNdjbwSbWhNe4M0r0lpaX5DNJ85v8iHYNDm/nY4hHMoETPih08yAK0CZMBFCKyO46fFAtgFIB1OpqxFVKHisLteVuZ775ux5n9tsIYbgX+ERQ4DxGPH4eeK8s4henIRw7MURQdtciV9DMWiUP///TMwywGjtoeLn0hXSESs0t0BbPuuNsayX3KXdozlHPVjxmX9IefiC52j8/wIMJdQVjJ/8DBhVBnEyVxbiwdHdu2dNeAceUWCncIYbMIEp/OYvkVtUwe/UNGnLyFu8QN8oXwyvVqBsc5u74OU/y8mVOogUVpWj2soa1img5hQcftvFJ1B1lw1Bt9oE+gJBiH8A12OtMKIhkAx5TVI/o//nfioH2dZ2xUMoYaeLkN1hqvSo7D8TAQvMSjYZ8njrg1X4aofgnAEAKnhBRBdQ+KXuwruoeiSlqaFD7PEvurTTt0s9Uw6N8pbIIBcpP7Wu1uXDkPfapbHwY+oJWkYnxY7wVprj0Ky6fvGfW1v13Y8i9L/Spjq/KNMkLZcTBBt0nPk4EI+cIlNat88SOVjnTMx6EAWrQeU3k6ZmYCbpC2cALXkBoDXP7fT2ycLLVYJqpgvRJqJQvQix04yGGBMQ6O9quup7W+m6e8g9zYZLkblTvyz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(2906002)(26005)(186003)(71200400001)(122000001)(38100700002)(53546011)(6506007)(9686003)(52536014)(5660300002)(83380400001)(41300700001)(66446008)(66556008)(66946007)(76116006)(64756008)(66476007)(8936002)(7416002)(8676002)(33656002)(55016003)(38070700005)(54906003)(7696005)(86362001)(4326008)(316002)(110136005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGIxU1ZiUGgzdWZSSjZaMWlpYjJ4bEMyQkx2bjdxT2V0QWptZ2lrT2RDb0xT?=
 =?utf-8?B?Z3NBVjRMQ2VWYzBtY3NLeWhPckNsTm9sclEvODdPVVNtaERVK3hORnBFcit5?=
 =?utf-8?B?Ri81S1BYc0IvanA0R0x1MTJuK1Zhd1BKOCtaanQxcUpCYzNhUkF1bHNuUS9N?=
 =?utf-8?B?T1BsdkgrSUhjeU9tVkdRekFJOVFybnBGYlBQTWZ4aFZVYVlsbE9OZXhTaVRU?=
 =?utf-8?B?emk0VGU1Z0dVeWpBcmNGTjFycmcreWpvMlJoSkpXQ1VQdElpNnV2RjFqR1J6?=
 =?utf-8?B?SFNtdm56WmNLMHlIak5GWmV2QUgvcGUvMUZCMlgyRmI2Z2tidGhhRTE4Ylpo?=
 =?utf-8?B?U0d4Y0hXVHAxaFRwTzQ0M0lWZmt0V2ExSGJ1NGxyT3h4bEFFemYzSFFOK2ZF?=
 =?utf-8?B?TjVnUmUyMXQzaVp3VUdZZ0ZaclczQTNzb1JOK05UY1FIdWZjRUprMU9meElU?=
 =?utf-8?B?SGtxQjFINzI3T0VJMjYrNVBpWXlhYlprRVY0VlNSRnFicDl3YWF2VFpjZ0J3?=
 =?utf-8?B?dGpjKzhCQ0RNN1NMdlNMMHI1cVRydTNiMERUVE45UWF1SHlOSENJK1B4S2xW?=
 =?utf-8?B?cFZMSmNCQ1kwRGlkUk91cHJKWWJPczZVSTZYamVGRXk5ZXFSRVRlTEE0K2Fh?=
 =?utf-8?B?NDFraWlZY3dvVW81dmJGV3FLWEFaRER5QWh4RndKYjVJV2xpS1RsZ2RONUhB?=
 =?utf-8?B?Qnd3Wm5vL3YrUnhXR3l5aG5NMjNwcUxuTVg1Nzlya2Vqa1hUQ3VaeTBvTGVJ?=
 =?utf-8?B?TTJDQWtSSWR2UFQxWGhLRENPVTExYmIyZk1XQ21SSUZPVTdvSUlieFZOemp5?=
 =?utf-8?B?anZLVWJkTXY3K1YyVW9OdjV0WE9rNmVlcXhLREI5Y3Fnak16UTFKZ2pOT3Za?=
 =?utf-8?B?dk5LSC9uWCs3NklWcElFdjlyRHNrRU1YSlkwYThtZEloK3Vpd3BVVXg2Ly9W?=
 =?utf-8?B?aUFUWWJVY2k1M1hVVzN6SnJDWkE1VlI5MGVqdzBDQjJIemhvaER3YzBmclBB?=
 =?utf-8?B?QzNydVhYQWR6d0UxaERXSXVsOGwxcDBzb3UvdEc5eHExVUV3MW9SYzlBM0tp?=
 =?utf-8?B?a3BpeTdTalZ0WlMwdzgwcWU3bVl5WWJlU0M0ZHNlQys1SDB2S3FocjJycVkz?=
 =?utf-8?B?dzJKNEhhN2Q2QUhRUzZhM1lQc1gxN0Q5T25pZDhsdGM5Rjlnai91UmIwVjZD?=
 =?utf-8?B?UHpPa1k5T2R3T0k0aExiaktaeWlxZitsTTNiT09BL0w1OVlRNnJ5VnRqQ3hz?=
 =?utf-8?B?QWxXUmdHVEFFVzkxVG5xNlhEeXpGZEZYd3AxYmNWaXlyMUxFYm5TKzg1TVlu?=
 =?utf-8?B?aGZYdkZiMStyZTYwY2l5QWdKTjhJRTBrUm94U3c5QzFBdkc1dDBUZzU5dFFN?=
 =?utf-8?B?MGJqV2VDT2dIYlpNbnpjNzRUcWJRcjhSZDMrMElLMUFXYXZqQ2NqKzFaRXZx?=
 =?utf-8?B?OGtlQVFELzE4dmg1bXBpajdUNWRiQ0dTSkxRZzZtS0ZpUjZkSDlndHZTaGEv?=
 =?utf-8?B?RER5UTVMaVNaWE41U21vWGFuYm5tRElMcVVUR2RLUmtUcUdkNCtOeG5vWDZH?=
 =?utf-8?B?YU9tQnhVSVQwWmdIbS9GblZRODJHbWtJelVvZE1jWnBBcTNtMFVHWnVxSGxk?=
 =?utf-8?B?TVFDci9GTnc5dzhKTmE4SCtOd1BoVnZlN1RucmNVYTZ0Z3oxNTUzUjU4bEtW?=
 =?utf-8?B?WGEyMG11bWhtaW5YMVh2dDFnT1NHVThyUFBCQWZFNWxLa3Buc281Q01qVElD?=
 =?utf-8?B?SHRBdG05VVIxNy8xeElpN1dMVW5ENUplc3ZOR3hyR1VkSmt6U2xpOFJ4UmUz?=
 =?utf-8?B?UThJQ20zNU4wdGpuVXhabHRIT2E4T2l4N01jdGREa3FiRHFRQ1FMay9kMHV4?=
 =?utf-8?B?WGp5WWNyOGYza2svRzQ2M1ZnL0Z3OUxjR0RNbEF2TkFpUXh1RWlyM0M3T1Y0?=
 =?utf-8?B?YXBUZElBYVFxbmVtdWEzbWhUeUc3ek5hLzcvdEJPNVRPczB0RUJWMWpkdERu?=
 =?utf-8?B?eDVGUWxEcFgvSWFMTmxHdGt1ZllhSldjekVkZFdvZGRvcnBtdm5ZWHlKZkJJ?=
 =?utf-8?B?eDhDdWVVbVI0dk5NTlRZNjdFNldHZEpuNWlaV2pXZkVNYXNUNVYvMjlkc3ZI?=
 =?utf-8?Q?A3erXHQXF8O64jtERUbK2Jkzx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f829b0-2a6d-4a19-236f-08db75eb163e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 02:14:35.3641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sIcuLFNDfjSbt1WjRR4tI5bcf+ujIXZtZmkl0rQmn36aLlNCcOdEMWAI0jWbU5KO/pXKghDQnwlbuOBjsF+8pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7868
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2Vu
dDogMjAyM+W5tDbmnIgyNeaXpSAxNzoxNg0KPiBUbzogRy5OLiBaaG91IDxndW9uaXUuemhvdUBu
eHAuY29tPjsgRy5OLiBaaG91IChPU1MpDQo+IDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT47IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhw
LmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb207IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gcm9iaCtkdEBrZXJuZWwu
b3JnOyBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IGNvbm9yK2R0QGtlcm5lbC5v
cmc7DQo+IFhhdmllciBSb3VtZWd1ZSAoT1NTKSA8eGF2aWVyLnJvdW1lZ3VlQG9zcy5ueHAuY29t
PjsNCj4ga2VybmVsQHBlbmd1dHJvbml4LmRlOyBqYWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNv
bTsNCj4gc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDMvNF0gbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogbnhwLGlteC1pc2k6IGkuTVg5MyBzdXBw
b3J0DQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFr
ZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3Igb3BlbmluZw0KPiBhdHRhY2htZW50cy4gV2hl
biBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1h
aWwnDQo+IGJ1dHRvbg0KPiANCj4gDQo+IE9uIDI1LzA2LzIwMjMgMTA6NDcsIEcuTi4gWmhvdSB3
cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEcuTi4gWmhvdSAoT1NTKQ0KPiA+PiBTZW50OiAy
MDIz5bm0NuaciDI15pelIDE2OjI4DQo+ID4+IFRvOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5
c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+OyBHLk4uIFpob3UNCj4gPj4gKE9TUykgPGd1b25p
dS56aG91QG9zcy5ueHAuY29tPjsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBk
bC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcNCj4gPj4gQ2M6IGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbTsgbWNoZWhhYkBr
ZXJuZWwub3JnOw0KPiA+PiByb2JoK2R0QGtlcm5lbC5vcmc7IGtyenlzenRvZi5rb3psb3dza2kr
ZHRAbGluYXJvLm9yZzsNCj4gPj4gcm9iaCtjb25vcitkdEBrZXJuZWwub3JnOw0KPiA+PiBYYXZp
ZXIgUm91bWVndWUgKE9TUykgPHhhdmllci5yb3VtZWd1ZUBvc3MubnhwLmNvbT47DQo+ID4+IGtl
cm5lbEBwZW5ndXRyb25peC5kZTsgamFjb3BvLm1vbmRpQGlkZWFzb25ib2FyZC5jb207DQo+ID4+
IHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20NCj4gPj4gU3ViamVjdDogUkU6IFtQQVRDSCAz
LzRdIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IG54cCxpbXgtaXNpOg0KPiA+PiBpLk1YOTMg
c3VwcG9ydA0KPiA+Pg0KPiA+PiBIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KPiA+Pg0KPiA+PiBH
b3QgaXQsIHdpbGwgdXBkYXRlLiBUaGFua3MgZm9yIHlvdXIgcXVpY2sgcmV2aWV3aW5nLg0KPiA+
Pg0KPiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+IEZyb206IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gPj4+IFNlbnQ6
IDIwMjPlubQ25pyIMjXml6UgMTY6MjINCj4gPj4+IFRvOiBHLk4uIFpob3UgKE9TUykgPGd1b25p
dS56aG91QG9zcy5ueHAuY29tPjsNCj4gPj4+IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsg
ZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47DQo+ID4+PiBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZw0KPiA+Pj4gQ2M6IGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbTsg
bWNoZWhhYkBrZXJuZWwub3JnOw0KPiA+Pj4gcm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0b2Yu
a296bG93c2tpK2R0QGxpbmFyby5vcmc7DQo+ID4+PiByb2JoK2Nvbm9yK2R0QGtlcm5lbC5vcmc7
DQo+ID4+PiBYYXZpZXIgUm91bWVndWUgKE9TUykgPHhhdmllci5yb3VtZWd1ZUBvc3MubnhwLmNv
bT47DQo+ID4+PiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGphY29wby5tb25kaUBpZGVhc29uYm9h
cmQuY29tOw0KPiA+Pj4gc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbQ0KPiA+Pj4gU3ViamVj
dDogUmU6IFtQQVRDSCAzLzRdIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IG54cCxpbXgtaXNp
Og0KPiA+Pj4gaS5NWDkzIHN1cHBvcnQNCj4gPj4+DQo+ID4+PiBDYXV0aW9uOiBUaGlzIGlzIGFu
IGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcNCj4gPj4+IGxp
bmtzIG9yIG9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVz
c2FnZQ0KPiA+Pj4gdXNpbmcgdGhlDQo+ID4+ICdSZXBvcnQgdGhpcyBlbWFpbCcNCj4gPj4+IGJ1
dHRvbg0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBPbiAyNS8wNi8yMDIzIDEwOjA5LCBndW9uaXUuemhv
dUBvc3MubnhwLmNvbSB3cm90ZToNCj4gPj4+PiBGcm9tOiAiR3Vvbml1Lnpob3UiIDxndW9uaXUu
emhvdUBueHAuY29tPg0KPiA+Pj4+DQo+ID4+Pj4gQWRkIGkuTVg5MyBzdXBwb3J0IHNpbmNlIGl0
IHJldXNlIElTSSB3aGljaCB1c2VkIGluIGkuTVg4TSBmYW1pbHkuDQo+ID4+Pj4NCj4gPj4+PiBT
aWduZWQtb2ZmLWJ5OiBHdW9uaXUuemhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPj4+DQo+
ID4+PiBTdWJqZWN0OiBEcm9wIGR1cGxpY2F0ZWQgIm1lZGlhOiINCj4gPj4+DQo+ID4+Pj4gLS0t
DQo+ID4+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9ueHAsaW14
LWlzaS55YW1sIHwgNSArKysrLQ0KPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0DQo+ID4+Pj4gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbnhwLGlteC1pc2kueWFtbA0K
PiA+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254cCxpbXgt
aXNpLnlhbWwNCj4gPj4+PiBpbmRleCAxY2U5NDQwYmRlMzIuLmRkYWQxZDg3NzhmMyAxMDA2NDQN
Cj4gPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbnhw
LGlteC1pc2kueWFtbA0KPiA+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9ueHAsaW14LWlzaS55YW1sDQo+ID4+Pj4gQEAgLTIxLDYgKzIxLDcgQEAgcHJv
cGVydGllczoNCj4gPj4+PiAgICAgIGVudW06DQo+ID4+Pj4gICAgICAgIC0gZnNsLGlteDhtbi1p
c2kNCj4gPj4+PiAgICAgICAgLSBmc2wsaW14OG1wLWlzaQ0KPiA+Pj4+ICsgICAgICAtIGZzbCxp
bXg5My1pc2kNCj4gPj4+DQo+ID4+PiBJbXg5MyBpcyBhIGZhbWlseSBvZiBkZXZpY2VzLCBub3Qg
c3BlY2lmaWMgZGV2aWNlLCBzbyBJIGhvcGUgeW91DQo+ID4+PiB1bmRlcnN0YW5kIHRoYXQgaXQg
aXMgYSBiaXQgYWdhaW5zdCB0aGUgcmVjb21tZW5kYXRpb24gb2Ygc3BlY2lmaWMNCj4gPj4+IGNv
bXBhdGlibGVzIGFuZCB5b3UgZ3VhcmFudGVlIHRoYXQgYWxsIGRldmljZXMgd2l0aGluIGZhbWls
eSB3aWxsIGJlDQo+IGlkZW50aWNhbC4NCj4gPg0KPiA+IEknbSBsaXR0ZXIgY29uZnVzZWQgYWJv
dXQgdGhpcyBzaW5jZSBpTVg5MyBpcyBhIHNwZWNpZmljIGRldmljZSBhbmQgYmVsb25nIHRvDQo+
IGlNWDkgZmFtaWx5LiBDb3VsZCB5b3UgaGVscCB0byBwcm92aWRlIG1vcmUgZGV0YWlscz8NCj4g
DQo+IFdoYXQncyBjb25mdXNpbmcgZXhhY3RseT8gT3BlbiB0aGUgd2Vic2l0ZSBvZiBOWFAgLSBp
dCBjbGVhcmx5IHNheXMgImkuTVggOTMNCj4gQXBwbGljYXRpb25zIFByb2Nlc3NvciBGYW1pbHki
LCBzbyB3aGF0IGRvIHlvdSBtZWFuIGJ5ICJzcGVjaWZpYyBkZXZpY2UiPyBJdCdzDQo+IG5vdC4g
T3BlbiB0aGUgZGF0YXNoZWV0LiBJIGFscmVhZHkgbGlzdGVkIHNldmVyYWwgZGlmZmVyZW5jZXMg
YmV0d2VlbiBkaWZmZXJlbnQNCj4gaW14OTMgU29Dcy4gQmFzaWNhbGx5IC0gdGhlcmUgaXMgbm8g
c3VjaCB0aGluZyBhcyBpbXg5MyBTb0MuIFRoZXJlIGlzIGlteDkzNTUgKG9yDQo+IGlteDkzNXgp
LCBpbXg5MzN4IGV0Yy4NCj4gDQo+IFdoeSBJIG5lZWQgdG8gcHJvdmlkZSBtb3JlIGRldGFpbHMg
YWJvdXQgTlhQIFNvQ3M/IEFyZW4ndCB5b3UgZnJvbSBOWFA/DQoNClllcywgeW91IGFyZSByaWdo
dCBhY2NvcmRpbmcgdG8gTlhQIHdlYnNpdGUgYW5kIGkuTVg5MyBoYXZlIG1hbnkgc3BlY2lmaWMg
ZGV2aWNlcyB3aGljaCBzaG93IGNvcmUgbnVtYmVyLCBOUFUsIHBhY2thZ2UgdHlwZSwgZXRjLiBU
aGUgcmVhc29uIHdoeSBJKE5YUCkgbmFtZSBpdCBpTVg5Mywgbm90IGlNWDkzM3gvOTM1eCwgaXMg
d2UgZG9uJ3QgZGlzdGluZ3Vpc2ggdGhlbSBpbiBrZXJuZWwgc2luY2Ugb3VyIHVib290IHdpbGwg
ZG8gdGhlIHdvcmsgYW5kIGZvciBJU0ksIGFsbCBpLk1YOTMgZmFtaWx5IGRldmljZXMgaW5jbHVk
ZSBzYW1lIElTSSBJUC4NCg0KVGhhbmtzIGFnYWluIGZvciB5b3VyIHZhbHVhYmxlIGNvbW1lbnRz
Lg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=
