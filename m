Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B5B73CF7B
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbjFYIry (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbjFYIrr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:47:47 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC20CE7C;
        Sun, 25 Jun 2023 01:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsNhRmrso4h+tt2XdW/dGpRLo7i7wBEExUau7jvCgYqcxhUhvUJd7rLT16fIAkLZsVnpqid1ROPXb5b+crWVOf4/jPMp6PaPnFBtuU434tJWEN2dEhpiGkBpZZiXQy4hQnpCoqStr9OaD2XTuu20CvI9LXOP3Xb4vegHCfrpIbbnb7H0R5kpyyaBYv/TSnchFsvw4gGH8ua6FMXmg6DJWEz1cIFUYOOE5sugPhR6WijaGKZvQbJANruH2fcHh5TJA4NRWD7q0DiTkFUboHSyx+s0LVWbrx0NYS8bcJMitKzH3dfshcXb/vo20AbJ1M+GD1maPPu8s8+OtWS2a53rTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCWsSbrc522j1Zw5bur5CFbtUJks3jO3SmGLx3kLdS8=;
 b=hor/wrT18UdcaTius6RjpFJ72hADsyeQyVoF+O534NraAhbqFNsJIHXZ2z+uyYqgHT09kdAWMbAhomm0ycRvxS2TsUoSGs07TkDZnBtQhQkt4E9N/Fx7dmCpw9BrC+5fHb4aF2E6k9wDWwwIKFT0NBKSmVPtcvtAl7iIoP+vtLvBL4NB7vqdNfS0QnpYEiag4lDyiVDp9ek9jywYat0YIOLZ5ALHHsTwI+KY0EQtgLUapLv1xsLn5XRrYwC6wgJPVho3/zRBsRFGzCFgXE5J0NkbG3BuW5zqjXAvjyUI5D/rlkJ9czq++yRZD8QrpU1WmLYfpfUSjljObuRRtrVMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCWsSbrc522j1Zw5bur5CFbtUJks3jO3SmGLx3kLdS8=;
 b=iwHe1pecb73wDbK1I4rTU1sNrVrVcVa4gTOCVK6gg+BTGfgB/l+Ia5Gt9mLYO1lupD3zALpP0DLMKk2Y5gkT7FwUuAb/5TVNYs5+qkdOce56wImCu4yN67kNKujnkQ8GuoSGh1ayiqTjUyqmzuRpGRhIbUYYO40xBvO+/IaYnLU=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB8PR04MB7115.eurprd04.prod.outlook.com (2603:10a6:10:128::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 08:47:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Sun, 25 Jun 2023
 08:47:41 +0000
From:   "G.N. Zhou" <guoniu.zhou@nxp.com>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Thread-Index: AQHZpzvJIIlu+ok45Uqi/UfPz8GrR6+bLcsAgAABQMCAAATzAA==
Date:   Sun, 25 Jun 2023 08:47:41 +0000
Message-ID: <AS8PR04MB90805AAA11EBA29F4EA20632FA21A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
 <20230625080916.3553621-4-guoniu.zhou@oss.nxp.com>
 <63eb8605-fa23-fe13-e635-1cfdbcafb5c7@linaro.org>
 <AS8PR04MB90809D01798D2B11D7CB9681FA21A@AS8PR04MB9080.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB90809D01798D2B11D7CB9681FA21A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DB8PR04MB7115:EE_
x-ms-office365-filtering-correlation-id: aa8c4d6b-bd68-4c8c-3e26-08db7558d672
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OsV+VePECZC0kJdMCIydptYWwv1RzhLdHtjqdUfY8tdMpqC+Pt8liY4N/U89TeyqslgNK5qXTVRfxx1+I2FlpgFBhJyV8HAdCZDQeIfhqHgG8Tzrk5Gd7XewrdlkntSlMZy6YG8svNLnMg+WBADPy3lW5DGyoSRDAfNUEV1P9NWwl0smeKuolfrjg19x6qUv1iuAtKJdA62GeqdzeyyVGRoxAPFQU1IRHbzJFk+xaAl57LI6pfJZEOuIwzr/kRbz0UsG2e9dFFYVP5WDN+5ZFRnwcP1EB4esTFtO0Pca7ex13ror/H0KhtrSVetTdEeYMg5ddiNsAB0Gjwi1hyCRGOj4NZIVOf4pjZjkX3Ad7u9P3Zcy2NFLJtE8spjwK5AOBZ56OF4bsUa2PaS0NuUgLMy+SLAe2uDV0PRRXI6fIdiL8TjTXbipjLQYjUP9FLGjMsdkB833qNd1zbSHwIRPQblEKMuGQxV8h4wbNpFhfQLql7xSLn0H2wAhRiwPq8lgBAW/HGqIb/cISCdvGwhj5TvzpXrmRcEPFJ5kzJIHYO6aYBH9c4QzRWf1jxGyjtW47NkbQmfytxdr9ApnhLvvsb4irJmfsPSMzYvljyBP0Q0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(966005)(7696005)(478600001)(110136005)(54906003)(2940100002)(53546011)(71200400001)(9686003)(6506007)(186003)(26005)(2906002)(66476007)(66446008)(64756008)(4326008)(316002)(66556008)(66946007)(76116006)(8936002)(8676002)(7416002)(52536014)(41300700001)(5660300002)(38100700002)(122000001)(33656002)(86362001)(55016003)(38070700005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnlLRkRvQzFVWm9NdnBwSUtnSndRekVoTHVSa0k4dEU0K2dVSnFGZGRheTdC?=
 =?utf-8?B?WUQyZk9YanIyZE5zOWQ0MDBmZmV0aHpQeFlVOHJIbG90dVBLdzR0MVcvU2FX?=
 =?utf-8?B?WjFVS2JOZURzOU50cHFQQ2VUSUVxcDdLNjFIV0VHNS9wdHE4RXJlb3hZZkxn?=
 =?utf-8?B?UGN0eVgwakRDOTJibjJlVXdQeWNIaHMrZ2g0ckF3c2ROZmsxekpMRjFRTDVm?=
 =?utf-8?B?SGVNdmxlZzJjRFRZSFFqZGsxVFFEVkJ4TENGYTJ4cUFqOGVicDNSbE9VSDlI?=
 =?utf-8?B?ZGlrOWxrZmUyeDJ1THJuOFFOajg0ZW1hKzRkdFBtbjVUcEJLWmRhOXpGTWRt?=
 =?utf-8?B?Tkt1WmdINkowanNtNTRNUjQxcWppdXdLeHN0cXJrSW9VQ0EwWHVYdk03Wnpl?=
 =?utf-8?B?a2xyRkVZTWlPYzRUc014UUYvYnZHaEt5anZ2aGdWNlFYMGpsc1VBMjhTU0dI?=
 =?utf-8?B?anpNT3ZhSWljUXBMK3ZYWndURDlqbDd4RGF6MjlvOC8vbjlsK0NNOGxsZ01w?=
 =?utf-8?B?K09JUDVYRFExejNQNmw1ZTA5Y3lLeXBhVWFlT0lIczI4d2pNLzJRNnpPSGxD?=
 =?utf-8?B?ZGZVemJ0amVndVVNUzRrVThWUUl3c1ZkVGpvaEo1K3NWQ0daaXU0a3dpdGJu?=
 =?utf-8?B?bXpId2wySXNlR1k0M0s3WmJsN3U2ekZETVRmbFJOOFd3Y3JBcUhad2svRkZY?=
 =?utf-8?B?QXkrQTJFWE9OM2VHcnYxc3VtMU1BVkR2L3RHTjkrdkE2V0dML2tSbnBpSkgy?=
 =?utf-8?B?Q1hWalluT0I1bk5RUnZqNHdYRTJyOXF6NThJMllRUlZaQ3o5SlFjTGRockhH?=
 =?utf-8?B?WTFLSUJxbEM5Qk4rQUFUL3FhT3pZcm1NNzl5SExXY0dIUGpMcEltU2R2YTZG?=
 =?utf-8?B?L0lPR1BtTjJiVTBvcXQrRnY1cnB0ZE5ZaC9oN0p3c3JmTENRNlFyYnV2VndF?=
 =?utf-8?B?OHZJQVMzdnBlUDN1M1VlVmsyaVUvSWRxUUJJRE5Yclk3NHpRVkJZTWdWczNN?=
 =?utf-8?B?YVFsV245aW5LZHBJR1FqbWNpaWJqalZzQVVHMWkzczFhb0N6N3JvSTVvaktw?=
 =?utf-8?B?eldLa3RXVWRuVjZiWGNHOVdoT3JsaUx0MUlWSXg3K2pqVUlmU01MeWQrQjBr?=
 =?utf-8?B?d2VDQ09EeS9MRFBnVFZMYW1tVDcwVldpTXZUN29zMXRqTnBMNmQ2RVRnbk84?=
 =?utf-8?B?dGxhcTNEaHgxclJ2Mi9uNW5ua2xUZ2NHeE5pbDlJMk80UkRkOXdMZGdRd2hV?=
 =?utf-8?B?cDA3MkhuK2RVRXhnL01WVGFvbWZMUW5uNlhwdFJkNWROR1ZlUkhzeU9IRlU5?=
 =?utf-8?B?ODREc0l1V0FXTVVpMFpTRitpOFk1TWVDaTJFc0JNeCt5V0Q2OWpOeVVnekJS?=
 =?utf-8?B?dFZ1ZWdzNzk1Rk5aT0h1NVNBTVZIZFh3aTM4cGs1aDAwVHRHdmlVV0ZUNnhY?=
 =?utf-8?B?cjNFaFZIb1RNUm44RnNydnFqckloK05PZmFTRUlvN2ptWFA1Z3VXeitqM1E4?=
 =?utf-8?B?MWtFWDExd2RpV2RJTXo1bXFDUUJaVkRZWU4wVy81QkNwNTBPRUNaWmI2VndV?=
 =?utf-8?B?RGxtZ3VoUUl0MldNZ0krSnE5VzA1N1RZNEpqaGEvWmJXazR0R09GVTQwaVN1?=
 =?utf-8?B?VSs4emRPbHgvanMzMnJRbEZxTnhwN0s3WW05NWNpaGs1UXNlVWFLaStKZEhI?=
 =?utf-8?B?aUx3cGRrTVAyaDJUdEdSOVY3T2p3bDhGQmF1dmJ2Y3JzWVlmTHhJRXNSSGJV?=
 =?utf-8?B?TFp5QjR3enBha2V1eDU0VnJjR1p0NTdFV1NoczVTcXJHb0kydnp1WkxLSmVK?=
 =?utf-8?B?VnpzMXl5MndLZkVoR2xWT2FuaVM4ZXhjOEtIa0ZRaklnVFFZNC8vWUFqREdB?=
 =?utf-8?B?RkZ5Y3FUWnFhR3l3UHo1Z0dYRExTUVE2R3ZnbE9ZVUhpS2dCK2FJUlo2TEU4?=
 =?utf-8?B?amNsWWpqdGJrVXBUek5LVFF3aE9Vb1liUmVpWTRmakUwVWQ0NkgraVZWU3p2?=
 =?utf-8?B?L3V1VnNzUWJsVVljR1RyNytXY2tBdWoyMlNMdlJKdnB5ZHcvalpYMXZ4TjVM?=
 =?utf-8?B?cTgyWEtiNXNYMGJaWHByTDcrU1prQzBnZC9yMlh0WXZ2S2dQVjVDRkFZQ0d0?=
 =?utf-8?Q?b41TEPgopNco36R7hnUgeMfpm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8c4d6b-bd68-4c8c-3e26-08db7558d672
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2023 08:47:41.8368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bMBKetyy16GDcGKsxKzJCp26RXSd/2zWOWRir9Ndx7KrKif1TUyZdPGEJVSxxBIelnYKscADHU50bx2TTQwUJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7115
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBHLk4uIFpob3UgKE9TUykNCj4gU2VudDogMjAyM+W5tDbmnIgyNeaXpSAxNjoyOA0K
PiBUbzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
PjsgRy5OLiBaaG91IChPU1MpDQo+IDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT47IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT47
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb207IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gcm9iaCtkdEBrZXJuZWwub3JnOyBr
cnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+
IFhhdmllciBSb3VtZWd1ZSAoT1NTKSA8eGF2aWVyLnJvdW1lZ3VlQG9zcy5ueHAuY29tPjsNCj4g
a2VybmVsQHBlbmd1dHJvbml4LmRlOyBqYWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNvbTsNCj4g
c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDMvNF0g
bWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogbnhwLGlteC1pc2k6IGkuTVg5MyBzdXBwb3J0DQo+
IA0KPiBIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KPiANCj4gR290IGl0LCB3aWxsIHVwZGF0ZS4g
VGhhbmtzIGZvciB5b3VyIHF1aWNrIHJldmlld2luZy4NCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+DQo+ID4gU2VudDogMjAyM+W5tDbmnIgyNeaXpSAxNjoyMg0KPiA+
IFRvOiBHLk4uIFpob3UgKE9TUykgPGd1b25pdS56aG91QG9zcy5ueHAuY29tPjsNCj4gPiBsaW51
eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+
Ow0KPiA+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+ID4gQ2M6IGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbTsgbWNoZWhhYkBrZXJuZWwub3JnOw0KPiA+IHJvYmgrZHRAa2Vy
bmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOw0KPiA+IHJvYmgrY29u
b3IrZHRAa2VybmVsLm9yZzsNCj4gPiBYYXZpZXIgUm91bWVndWUgKE9TUykgPHhhdmllci5yb3Vt
ZWd1ZUBvc3MubnhwLmNvbT47DQo+ID4ga2VybmVsQHBlbmd1dHJvbml4LmRlOyBqYWNvcG8ubW9u
ZGlAaWRlYXNvbmJvYXJkLmNvbTsNCj4gPiBzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tDQo+
ID4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzRdIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IG54
cCxpbXgtaXNpOg0KPiA+IGkuTVg5MyBzdXBwb3J0DQo+ID4NCj4gPiBDYXV0aW9uOiBUaGlzIGlz
IGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcNCj4gPiBs
aW5rcyBvciBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1l
c3NhZ2UgdXNpbmcgdGhlDQo+ICdSZXBvcnQgdGhpcyBlbWFpbCcNCj4gPiBidXR0b24NCj4gPg0K
PiA+DQo+ID4gT24gMjUvMDYvMjAyMyAxMDowOSwgZ3Vvbml1Lnpob3VAb3NzLm54cC5jb20gd3Jv
dGU6DQo+ID4gPiBGcm9tOiAiR3Vvbml1Lnpob3UiIDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+
ID4NCj4gPiA+IEFkZCBpLk1YOTMgc3VwcG9ydCBzaW5jZSBpdCByZXVzZSBJU0kgd2hpY2ggdXNl
ZCBpbiBpLk1YOE0gZmFtaWx5Lg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25pdS56
aG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+DQo+ID4gU3ViamVjdDogRHJvcCBkdXBsaWNh
dGVkICJtZWRpYToiDQo+ID4NCj4gPiA+IC0tLQ0KPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9ueHAsaW14LWlzaS55YW1sIHwgNSArKysrLQ0KPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4g
PiBkaWZmIC0tZ2l0DQo+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9ueHAsaW14LWlzaS55YW1sDQo+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZWRpYS9ueHAsaW14LWlzaS55YW1sDQo+ID4gPiBpbmRleCAxY2U5NDQwYmRlMzIu
LmRkYWQxZDg3NzhmMyAxMDA2NDQNCj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9ueHAsaW14LWlzaS55YW1sDQo+ID4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbnhwLGlteC1pc2kueWFtbA0KPiA+ID4gQEAg
LTIxLDYgKzIxLDcgQEAgcHJvcGVydGllczoNCj4gPiA+ICAgICAgZW51bToNCj4gPiA+ICAgICAg
ICAtIGZzbCxpbXg4bW4taXNpDQo+ID4gPiAgICAgICAgLSBmc2wsaW14OG1wLWlzaQ0KPiA+ID4g
KyAgICAgIC0gZnNsLGlteDkzLWlzaQ0KPiA+DQo+ID4gSW14OTMgaXMgYSBmYW1pbHkgb2YgZGV2
aWNlcywgbm90IHNwZWNpZmljIGRldmljZSwgc28gSSBob3BlIHlvdQ0KPiA+IHVuZGVyc3RhbmQg
dGhhdCBpdCBpcyBhIGJpdCBhZ2FpbnN0IHRoZSByZWNvbW1lbmRhdGlvbiBvZiBzcGVjaWZpYw0K
PiA+IGNvbXBhdGlibGVzIGFuZCB5b3UgZ3VhcmFudGVlIHRoYXQgYWxsIGRldmljZXMgd2l0aGlu
IGZhbWlseSB3aWxsIGJlIGlkZW50aWNhbC4NCg0KSSdtIGxpdHRlciBjb25mdXNlZCBhYm91dCB0
aGlzIHNpbmNlIGlNWDkzIGlzIGEgc3BlY2lmaWMgZGV2aWNlIGFuZCBiZWxvbmcgdG8gaU1YOSBm
YW1pbHkuIENvdWxkIHlvdSBoZWxwIHRvIHByb3ZpZGUgbW9yZSBkZXRhaWxzPw0KDQo+ID4NCj4g
Pg0KPiA+DQo+ID4gQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4NCj4gPg0KPiA+DQo+ID4gLS0tDQo+ID4NCj4gPiBUaGlzIGlzIGFu
IGF1dG9tYXRlZCBpbnN0cnVjdGlvbiwganVzdCBpbiBjYXNlLCBiZWNhdXNlIG1hbnkgcmV2aWV3
DQo+ID4gdGFncyBhcmUgYmVpbmcgaWdub3JlZC4gSWYgeW91IGRvIG5vdCBrbm93IHRoZSBwcm9j
ZXNzLCBoZXJlIGlzIGENCj4gPiBzaG9ydA0KPiA+IGV4cGxhbmF0aW9uOg0KPiA+DQo+ID4gUGxl
YXNlIGFkZCBBY2tlZC1ieS9SZXZpZXdlZC1ieS9UZXN0ZWQtYnkgdGFncyB3aGVuIHBvc3Rpbmcg
bmV3DQo+ID4gdmVyc2lvbnMsIHVuZGVyIG9yIGFib3ZlIHlvdXIgU2lnbmVkLW9mZi1ieSB0YWcu
IFRvb2xzIGxpa2UgYjQgY2FuDQo+ID4gaGVscCBoZXJlLiBIb3dldmVyLCB0aGVyZSdzIG5vIG5l
ZWQgdG8gcmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRvIGFkZCB0aGUgdGFncy4NCj4gPiBUaGUgdXBz
dHJlYW0gbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIGFja3MgcmVjZWl2ZWQgb24gdGhlIHZl
cnNpb24gdGhleQ0KPiBhcHBseS4NCj4gPg0KPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y1LjE3L3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3UNCj4gPiBibWl0dGlu
DQo+ID4gZy1wYXRjaGVzLnJzdCNMNTQwDQoNClRoYW5rcyBmb3IgeW91IHJlbWluZGluZy4NCg0K
PiA+DQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IEtyenlzenRvZg0KDQo=
