Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC47F747B15
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 03:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjGEBgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 21:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjGEBgv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 21:36:51 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6479ADD;
        Tue,  4 Jul 2023 18:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDr10bluDZYfL4hZ5eB0RNnehVQ/RMDqf5NxZYv5OwAo6/xm1kQ1R9mEVgynMUEjGpKKpg05/jWenEcQZTtqKtlzRru/8SPXDWFzCs51Z499MW+wdm+aDRVfqgFqCQpOb4Ev6Tzw1mBmbznjnsB1JKWJShReyHlNi807mkm8MFqiiLHTJbhJf6WbGNNvukG36P2UyRp0jrkAv0uUIkh5SLX7/vpUX5L8w+1ds9r6Qtm+qgZ08qwQdCLVPE3i03ewNxgOfRa2Xv4J1DSnF6n4p+9N5Pjo/znIL595XcEsfCjKOTMhIL5BDyhHG0P+LwH5zpgsPzZEvlGS1pJiiQJjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtZXgO4DqNrE4DchoUrkl+QXlIB8LeKR8hqkz3zgUhg=;
 b=VV/LYZWWt78AJQsFKWKM8WtR0TXiqhh1WCp5b9sLyl/uHAiEIOvZjuHDb3ZBanKv+A/jQiQcpiZKdMRELeT85Z1NJGQRcZfhQ2E6EzMnRCuxAxIm24ZqoYHAUwmRZZ140LM0yau3GmZ2T6p8u27C5HBa7jqyyM9cM8cYdI+UelRn3gKLjLa6BhJDHT3jokxBJFzudeFoJ15niv2d15sKCig5PZGLG7d0KKKu3zB9OugFa0T52TQDA579xUjEdDFAPhHnHBYeYIlZo7BJQO4FnWVsq6hZzP4Ul1nBXyF1ElOAOtKE9pl0kSrNNC5Z8eGOYnUpJMNB9+G86pnWHeyW9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtZXgO4DqNrE4DchoUrkl+QXlIB8LeKR8hqkz3zgUhg=;
 b=AsEd/bb0mxr0zuuJxlgKrmNUltzbiacU4Z3le4kztlWAyGAcigSDALg4BSxyRAGGOY3xRBZ81mK8qo41xcRgylhkEKQkLLYtCC6OSlLUpHyfN19aLf+5NXbSkZGktYlAuNkLoS+AFRHpnl28dgqTrcj5G4qEFDZjr2eY3HoYhcI=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8734.eurprd04.prod.outlook.com (2603:10a6:102:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 01:36:46 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 01:36:46 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
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
Thread-Index: AQHZraIh2RFb/SSXAk2t6mby6BkWCK+pSqOAgAEa8TA=
Date:   Wed, 5 Jul 2023 01:36:46 +0000
Message-ID: <AS8PR04MB90805B1F91BCDB7FDC058392FA2FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
 <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
 <2292421.ElGaqSPkdT@steina-w>
In-Reply-To: <2292421.ElGaqSPkdT@steina-w>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8734:EE_
x-ms-office365-filtering-correlation-id: 409c8cb1-32e8-4d48-1029-08db7cf84b58
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zndqJG8wim39mMrDgGgFnHsAsZqdkft9l4Yzm2rlZMEuv6LivRxpkGRpQMrJ1Q2WyMEAKrjYJewun8oRm/Mg/HsO0PRKoB5GIwUpP2aHKms6n6gwPPfuIoj7divRokJTtrN3C3NK5o/NOY30dGCYCSA5fynAsjrTPmb/ObaRA4Te8AXPevXrTRvJUS8xws1swdl4vB9UWHNkRgdXviMuetLqLCHi5nlmVNHc1HwdhHr4yy/9SQO29vXSIw9mkwtrs7Cw3nY+EBcTibd2Hb+noh9bf9eDqnE7EKlBFDs3uZGdeJEmWAV4mgyGqCuyd7LtrwufzZJ+HXlsGVjvrnl6+ysKqAss7wpkjDLKk44DjdaU9Ohghf/FrV9O9mgoCeLZOV3wScY3FTk4L8FKxJ7F5vNjwpcuJhx61JlPZ7l/8iHd12JUNE2fgGspqxt6COWKKohYhhdtBy91EnpoxP6brN45Y3XLJ3oSNj6uj2ydsIQC3/KO7VWT98FSH1ibA+7LKoN1lBygp77UfNYUckazgukW84j+VVbOo/yfjfigzWdtkY8oL/Ksh+NOwzIU3TKRJKYE6WpB8pP417qIorEM9wxgCW/X69yo9TAYRZwV5mE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(71200400001)(478600001)(83380400001)(966005)(86362001)(66574015)(7696005)(66946007)(76116006)(6506007)(316002)(38100700002)(26005)(186003)(9686003)(53546011)(4326008)(122000001)(64756008)(66556008)(66446008)(54906003)(66476007)(110136005)(8936002)(8676002)(38070700005)(2906002)(41300700001)(55016003)(52536014)(5660300002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SW5maWc5VFZVMWlTVnE4a2NIaTdoM3hZWVJKVmZhSzZMMk9EVHpxc3FTcVFD?=
 =?utf-8?B?Q2tuS1MrL29oMFk3dGZVS0hwZ0VyQ3V6QmdaRzVVRDFQdEFIUU0zZXJYZWlG?=
 =?utf-8?B?UEpJYTZ3Z0RHQnVncDQ3d0FsQzhSaXpvYnpXaGVSYzRYdUtGQzdRcEgxWWxo?=
 =?utf-8?B?a2Z4Vy9vSVVuZG5zL2IxaGo1L0prN3RucC8xN2RnY3E4R3R5MXU2L3I1RURu?=
 =?utf-8?B?VXJONmluK2lOd0JldXl3QUhDd252MmM1cHBKY2VxaUdVek9aQU9WUjFyQnNl?=
 =?utf-8?B?MU1TMHdqcUhtVW5BbEhncHZTMEc4U080YmcvNVdoekVzcWY0c2FYK1dxbE5Q?=
 =?utf-8?B?RWhqQUhqTkxIR3ZUQkpDVDJWOWNBdkt4cElPdGFWVjhOQ3BXN0g3TUJ2VkpW?=
 =?utf-8?B?anFxMDFaVXNLVTA4RnR0b2FhNUpSYUcweTJhN3h4eCtqY2pmYWFBdU42T0k0?=
 =?utf-8?B?V1RyMkZqZktuNEVLQzV3MjJGK3YrcWVieWlINkFaa3kyc0dpNk15TlJrcWoz?=
 =?utf-8?B?c3ZacXBIZTVDNndzamNCMno5SVR6RlFjVlJ6UU01OUxqbE9oeDg1cmxHUXY3?=
 =?utf-8?B?VmlzaDNUTnA4bG9EQ0JyN2t2TG40akI4VmhuaFFKbmFJbTJiT3FEZ0s5RDRs?=
 =?utf-8?B?WGRtdkNzVVlnNzNuQjQxUUhJdlQya21scHlhNGk5aWhyd2xLWTRWOTl4ejg4?=
 =?utf-8?B?V3h3Nkpmb2ZFWEluZG1iaVpRMEI5OW03NXByMVV6b2hMQld5VlJ4TlAybzQz?=
 =?utf-8?B?ZzJWaVF0VXpJeGI1QXphVGx0cS9idFhTbEtWWTRXUDRhUExxWUpESnBBS2E0?=
 =?utf-8?B?eFFRbEhCM2d6SkpMK1hadTYyLzhoRFUySlQzSzcyUCtWRFJUL3F6NTY4NmFT?=
 =?utf-8?B?S2JkWHA3NzdvMHB2TEZoMStJRDFQbFA0S0JzUWVCdXdwLzh1VWk3K1hQOGVF?=
 =?utf-8?B?dmg1alhzWHMwS1R6bll5LzFOdStDZWVQODJ3VnFydU1RTmtITFl4M1V4UmJC?=
 =?utf-8?B?V2NvNEhwZTYyN2VjamF2NlpnbklNMWJLNFMzMzVVeXh2K3RESG9DTHlOMTZ4?=
 =?utf-8?B?MmdJQmo5UUdoNk1XeW1ISkFrWHNxUW5jc0VsRWI3VFpidU1rV3JKQmhXNm8v?=
 =?utf-8?B?cnhDZC8rbXV2QmxzenNpbWw5K203MW9od3Z5VkJRb3M0cnVPWnRCOG1iRElw?=
 =?utf-8?B?QlFsdVFxZ3VHc05UeTIyclNWRVVILzlqT3hCUlZBS21xczdGRTBvTVBnRWhP?=
 =?utf-8?B?SlVzQzA2QjZXYW5Jb2RkL0ZzL2laa3JWNkp4WXhBeGxqa1p6MVJ4ZzJJRGNW?=
 =?utf-8?B?QmIwQ1p4TWYvcDRhTVZpZmxtWklvc2lqcG9BTWs3UW1ITnBZRlI3Qm1uNWNH?=
 =?utf-8?B?MzJEams5Z2VvdTE3L3VycTVteTdqc0ZRSXIyWE90bVJ6YjgyYUl1VVRzZUl1?=
 =?utf-8?B?VnRDekg5ZUEwSUhMbTdHaGlpQjl5TlNQSW5LSmw3UHJMOTVadWg0QW11TFBL?=
 =?utf-8?B?V2pMQkVCL29hZ0xYcEpHb291Y0pyd3BLN0RlVW5VN1lnMFhrak9jdFpLcm9X?=
 =?utf-8?B?V21tTHQ0SXBGTGVyVkd2WnVaQXJielB2dlpybSswYzRuM2dDYWZBVllWRkMr?=
 =?utf-8?B?RGFCZzJhSWl1Z3JTRnlUU0NCMHBHcE1CWDZVbUNJSDVBREFTWXdMSUtVbUN2?=
 =?utf-8?B?WVg0MGs4TzNoSGlTUkpBT2JZeFRZcWF6Mk9GbEQ2OXBqZGdVdGFjSVpkMDUx?=
 =?utf-8?B?T29Ra2U2NTBtb2lEUW5WYU02eVdTaEVMcGFML25XTGpESCsxU0VhaGdVaHJv?=
 =?utf-8?B?SDVKbjRrUml2R1FFYVhGZWV1a0crTzhCVDBWdjNDODZlZmJvY0E5c0F6QkUv?=
 =?utf-8?B?TUZETFVNdWd1OGh5NzB1WDJOWFI5ZUFaMytwdWplVlYzN2VWUXhqTjNnbmRK?=
 =?utf-8?B?RkdoTjk5RVdNNm9BTHFWRU5YaSsrV2Q2WFlIK3lRZlFzY0JMM1E0U0hwTnhj?=
 =?utf-8?B?YlhPaFlGUUFKdXB3SmJXN2ZjdUJXczV4N2dnT3RzMGFQNmZRWWk5UnU5ZHc5?=
 =?utf-8?B?M2FKcC9zQnMxMm9ZeEpyM3B1MmwwMU15V25sTWZJaEp5VU9RTVNhUUpDMFdx?=
 =?utf-8?Q?MWXYfauNJ/QuQBkEFEGUFKqip?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409c8cb1-32e8-4d48-1029-08db7cf84b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 01:36:46.0808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VH42g4AVjBKyGlFOhLpEcM1qSRvLt8hWndnwNzXYjU4qIxxCNp4leg9LzhWd2grXzTK2VceP5fD701WcnEsTlg==
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

SGkgQWxleGFuZGVyLA0KDQpUaGFua3MgZm9yIHlvdSBjb21tZW50Lg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBTdGVpbiA8YWxleGFuZGVyLnN0ZWlu
QGV3LnRxLWdyb3VwLmNvbT4NCj4gU2VudDogMjAyM+W5tDfmnIg05pelIDE2OjM5DQo+IFRvOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBk
bC1saW51eC1pbXgNCj4gPGxpbnV4LWlteEBueHAuY29tPjsgRy5OLiBaaG91IChPU1MpIDxndW9u
aXUuemhvdUBvc3MubnhwLmNvbT4NCj4gQ2M6IG1jaGVoYWJAa2VybmVsLm9yZzsgbGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tOw0KPiByb2JoK2R0QGtlcm5lbC5vcmc7IGtyenlzenRv
Zi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsNCj4gamFjb3Bv
Lm1vbmRpQGlkZWFzb25ib2FyZC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIG1lZGlh
OiBkdC1iaW5kaW5nczogQWRkIGJpbmRpbmcgZG9jIGZvciBpLk1YOTMgTUlQSQ0KPiBDU0ktMg0K
PiANCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2Fy
ZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yIG9wZW5pbmcNCj4gYXR0YWNobWVudHMuIFdoZW4gaW4g
ZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzIGVtYWlsJw0K
PiBidXR0b24NCj4gDQo+IA0KPiBIaSBHdW9uaXUsDQo+IA0KPiB0aGFua3MgZm9yIHBvc3Rpbmcg
dGhpcyBkcml2ZXIuDQo+IA0KPiBBbSBNb250YWcsIDMuIEp1bGkgMjAyMywgMTM6Mzc6MzMgQ0VT
VCBzY2hyaWViIGd1b25pdS56aG91QG9zcy5ueHAuY29tOg0KPiA+ICoqKioqKioqKioqKioqKioq
KioqDQo+ID4gQWNodHVuZyBleHRlcm5lIEUtTWFpbDogw5ZmZm5lbiBTaWUgQW5ow6RuZ2UgdW5k
IExpbmtzIG51ciwgd2VubiBTaWUNCj4gPiB3aXNzZW4sIGRhc3MgZGllc2UgYXVzIGVpbmVyIHNp
Y2hlcmVuIFF1ZWxsZSBzdGFtbWVuIHVuZCBzaWNoZXIgc2luZC4NCj4gPiBMZWl0ZW4gU2llIGRp
ZSBFLU1haWwgaW0gWndlaWZlbHNmYWxsIHp1ciBQcsO8ZnVuZyBhbiBkZW4gSVQtSGVscGRlc2sg
d2VpdGVyLg0KPiA+IEF0dGVudGlvbiBleHRlcm5hbCBlbWFpbDogT3BlbiBhdHRhY2htZW50cyBh
bmQgbGlua3Mgb25seSBpZiB5b3Uga25vdw0KPiA+IHRoYXQgdGhleSBhcmUgZnJvbSBhIHNlY3Vy
ZSBzb3VyY2UgYW5kIGFyZSBzYWZlLiBJbiBkb3VidCBmb3J3YXJkIHRoZQ0KPiA+IGVtYWlsIHRv
IHRoZSBJVC1IZWxwZGVzayB0byBjaGVjayBpdC4gKioqKioqKioqKioqKioqKioqKioNCj4gPg0K
PiA+IEZyb206ICJHdW9uaXUuemhvdSIgPGd1b25pdS56aG91QG54cC5jb20+DQo+ID4NCj4gPiBB
ZGQgbmV3IGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgRGVzaWduV2FyZSBDb3JlIE1JUEkgQ1NJ
LTIgcmVjZWl2ZXINCj4gPiBhbmQgRFBIWSBmb3VuZCBvbiBOWFAgaS5NWDkzLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogR3Vvbml1Lnpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+ID4gLS0t
DQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9ueHAsZHdjLW1pcGktY3NpMi55YW1sICAgICB8IDE0
MA0KPiArKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0MCBpbnNlcnRp
b25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvbnhwLGR3Yy1taXBpLWNzaTIueWFtbA0KPiA+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254cCxkd2MtbWlwaS1jc2kyLnlhbWwgbmV3
DQo+ID4gZmlsZSBtb2RlIDEwMDY0NCBpbmRleCAwMDAwMDAwMDAwMDAuLmVjZTZmYjg5OTFkNA0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvbnhwLGR3Yy1taXBpLWNzaTIueWFtbA0KPiA+IEBAIC0wLDAgKzEsMTQwIEBA
DQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvbWVkaWEvbnhwLGR3Yy1taXBpLWNzaTIueWFtbCMNCj4gPiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+
ICt0aXRsZTogTlhQIGkuTVg5MyBNSVBJIENTSS0yIEhvc3QgQ29udHJvbGxlciByZWNlaXZlcg0K
PiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBHLk4uIFpob3UgPGd1b25pdS56aG91
QG54cC5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfC0NCj4gPiArICBUaGUgTUlQSSBD
U0ktMiByZWNlaXZlciBmb3VuZCBvbiBpLk1YOTMgb3JpZ2luYXRlcyBmcm9tIFN5bm9wc3lzDQo+
ID4gKyAgRGVzaWduV2FyZSBDb3JlIGFuZCBpdCBpbXBsZW1lbnRzIHRoZSBDU0ktMiBwcm90b2Nv
bCBvbiB0aGUgaG9zdA0KPiA+ICsgIHNpZGUgYW5kIGEgRFBIWSBjb25maWd1cmVkIGFzIGEgU2xh
dmUgYWN0cyBhcyB0aGUgcGh5c2ljYWwgbGF5ZXIuDQo+ID4gKyAgVHdvIGRhdGEgbGFuZXMgYXJl
IHN1cHBvcnRlZCBvbiBpLk1YOTMgZmFtaWx5IGRldmljZXMgYW5kIHRoZSBkYXRhDQo+ID4gKyAg
cmF0ZSBvZiBlYWNoIGxhbmUgc3VwcG9ydCB1cCB0byAxLjVHYnBzLg0KPiA+ICsNCj4gPiArICBX
aGlsZSB0aGUgQ1NJLTIgcmVjZWl2ZXIgaXMgc2VwYXJhdGUgZnJvbSB0aGUgTUlQSSBELVBIWSBJ
UCBjb3JlLA0KPiA+ICsgdGhlIFBIWSBpcyBjb21wbGV0ZWx5IHdyYXBwZWQgYnkgdGhlIENTSS0y
IGNvbnRyb2xsZXIgYW5kIGV4cG9zZSAgYQ0KPiA+ICsgY29udHJvbCBpbnRlcmZhY2Ugd2hpY2gg
b25seSBjYW4gY29tbXVuaWNhdGUgd2l0aCBDU0ktMiBjb250cm9sbGVyDQo+ID4gKyBUaGlzIGJp
bmRpbmcgdGh1cyBjb3ZlcnMgYm90aCBJUCBjb3Jlcy4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6
DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gZnNsLGlt
eDkzLW1pcGktY3NpMg0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0K
PiA+ICsNCj4gPiArICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+
ID4gKyAgY2xvY2tzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IFRoZSBwZXJpcGhlcmFsIGNsb2NrIChhLmsuYS4gQVBCIGNsb2NrKQ0KPiA+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBUaGUgcGl4ZWwgY2xvY2sNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogVGhl
IE1JUEkgRC1QSFkgY2xvY2sNCj4gPiArDQo+ID4gKyAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICBp
dGVtczoNCj4gPiArICAgICAgLSBjb25zdDogcGVyDQo+ID4gKyAgICAgIC0gY29uc3Q6IHBpeGVs
DQo+ID4gKyAgICAgIC0gY29uc3Q6IHBoeV9jZmcNCj4gPiArDQo+ID4gKyAgcG93ZXItZG9tYWlu
czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIHBvcnRzOg0KPiA+ICsgICAg
JHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cw0KPiA+ICsNCj4gPiAr
ICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgIHBvcnRAMDoNCj4gPiArICAgICAgICAkcmVmOiAv
c2NoZW1hcy9ncmFwaC55YW1sIy8kZGVmcy9wb3J0LWJhc2UNCj4gPiArICAgICAgICB1bmV2YWx1
YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gKyAg
ICAgICAgICBJbnB1dCBwb3J0IG5vZGUsIHNpbmdsZSBlbmRwb2ludCBkZXNjcmliaW5nIHRoZSBD
U0ktMg0KPiA+IHRyYW5zbWl0dGVyLiArDQo+ID4gKyAgICAgICAgcHJvcGVydGllczoNCj4gPiAr
ICAgICAgICAgIGVuZHBvaW50Og0KPiA+ICsgICAgICAgICAgICAkcmVmOiB2aWRlby1pbnRlcmZh
Y2VzLnlhbWwjDQo+ID4gKyAgICAgICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UN
Cj4gPiArDQo+ID4gKyAgICAgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgICAgICAg
ZGF0YS1sYW5lczoNCj4gPiArICAgICAgICAgICAgICAgIG1pbkl0ZW1zOiAxDQo+ID4gKyAgICAg
ICAgICAgICAgICBpdGVtczoNCj4gPiArICAgICAgICAgICAgICAgICAgLSBjb25zdDogMQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAtIGNvbnN0OiAyDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
IGZzbCxoc2ZyZXFyYW5nZToNCj4gPiArICAgICAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICsgICAgICAgICAgICAgICAgZGVzY3Jp
cHRpb246DQo+ID4gKyAgICAgICAgICAgICAgICAgIFVzZWQgdG8gc2VsZWN0IHRoZSBkZXNpcmVk
IGhpZ2ggc3BlZWQgZnJlcXVlbmN5IHJhbmdlDQo+ID4gKyAgICAgICAgICAgICAgICAgIGFjY29y
ZGluZyB0byBkYXRhIGxhbmUgYml0IHJhdGUuIFBsZWFzZSByZWZlciB0byBpLk1YOTMNCj4gPiAr
ICAgICAgICAgICAgICAgICAgcmVmZXJlbmNlIG1hbnVhbCBNSVBJIENTSS0yIERQSFkgY2hhcHRl
ciB0byBnZXQgYSB2YWxpZA0KPiA+ICsgICAgICAgICAgICAgICAgICB2YWx1ZS4NCj4gDQo+IElm
IHRoaXMgaXMgZGF0YSBsYW5lIGJpdCByYXRlIHNwZWNpZmljLCBzaG91bGRuJ3QgaXQgYmUgc2V0
IGluIHNfc3RyZWFtIGNhbGxiYWNrIG9yDQo+IHNpbWlsYXI/DQoNClRoYXQncyBjb3JyZWN0IGlm
IHdlIGhhdmUgYSBmb3JtdWxhIHRvIGNhbGN1bGF0ZSBpdCBhbmQgZ2V0IGRhdGEgcmF0ZSBmcm9t
IHNlbnNvci4gQnV0IFN5bm9wc3lzIG9ubHkNCnByb3ZpZGUgYSB0YWJsZSB0byBzZWFyY2ggdGhl
IHZhbGlkIGhzZnJlcXJhbmdlIGFjY29yZGluZyB0byBkYXRhIHJhdGUgYW5kIHRoZSB2YWx1ZXMg
YXJlIG5vbmxpbmVhcg0Kc28gSSBleHBvcnQgYSBwcm9wZXJ0eSB0byBoYW5kbGUgdGhpcyBpc3N1
ZS4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBBbGV4YW5kZXINCj4gDQo+ID4gKw0KPiA+ICsg
ICAgICAgICAgICByZXF1aXJlZDoNCj4gPiArICAgICAgICAgICAgICAtIGRhdGEtbGFuZXMNCj4g
PiArICAgICAgICAgICAgICAtIGZzbCxoc2ZyZXFyYW5nZQ0KPiA+ICsNCj4gPiArICAgICAgcG9y
dEAxOg0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMv
cG9ydA0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICAgICAgT3V0cHV0IHBv
cnQgbm9kZQ0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4g
KyAgLSByZWcNCj4gPiArICAtIGludGVycnVwdHMNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsgIC0g
Y2xvY2stbmFtZXMNCj4gPiArICAtIHBvd2VyLWRvbWFpbnMNCj4gPiArICAtIHBvcnRzDQo+ID4g
Kw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVz
Og0KPiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2lteDkz
LWNsb2NrLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2lycS5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2Vy
L2ZzbCxpbXg5My1wb3dlci5oPg0KPiA+ICsNCj4gPiArICAgIG1pcGktY3NpQDRhZTAwMDAwIHsN
Cj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg5My1taXBpLWNzaTIiOw0KPiA+ICsg
ICAgICAgIHJlZyA9IDwweDRhZTAwMDAwIDB4MTAwMDA+Ow0KPiA+ICsgICAgICAgIGludGVycnVw
dHMgPSA8R0lDX1NQSSAxNzUgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKyAgICAgICAgY2xv
Y2tzID0gPCZjbGtzIElNWDkzX0NMS19NSVBJX0NTSV9HQVRFPiwNCj4gPiArICAgICAgICAgICAg
ICAgICA8JmNsa3MgSU1YOTNfQ0xLX0NBTV9QSVg+LA0KPiA+ICsgICAgICAgICAgICAgICAgIDwm
Y2xrcyBJTVg5M19DTEtfTUlQSV9QSFlfQ0ZHPjsNCj4gPiArICAgICAgICBjbG9jay1uYW1lcyA9
ICJwZXIiLCAicGl4ZWwiLCAicGh5X2NmZyI7DQo+ID4gKyAgICAgICAgcG93ZXItZG9tYWlucyA9
IDwmbWVkaWFfYmxrX2N0cmwNCj4gSU1YOTNfTUVESUFCTEtfUERfTUlQSV9DU0k+Ow0KPiA+ICsN
Cj4gPiArICAgICAgICBwb3J0cyB7DQo+ID4gKyAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Ow0KPiA+ICsgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgIHBvcnRAMCB7DQo+ID4gKyAgICAgICAgICAgICAgICByZWcgPSA8MD47DQo+ID4g
Kw0KPiA+ICsgICAgICAgICAgICAgICAgbWlwaV9mcm9tX3NlbnNvcjogZW5kcG9pbnQgew0KPiA+
ICsgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmYXAxMzAyX3RvX21pcGk+
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGRhdGEtbGFuZXMgPSA8MSAyPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICBmc2wsaHNmcmVxcmFuZ2UgPSA8MHgyYz47DQo+ID4gKyAgICAgICAg
ICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
cG9ydEAxIHsNCj4gPiArICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICAgICBtaXBpX3RvX2lzaTogZW5kcG9pbnQgew0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmaXNpX2luPjsNCj4gPiArICAgICAgICAgICAgICAg
IH07DQo+ID4gKyAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07DQo+
ID4gKy4uLg0KPiANCj4gDQo+IC0tDQo+IFRRLVN5c3RlbXMgR21iSCB8IE3DvGhsc3RyYcOfZSAy
LCBHdXQgRGVsbGluZyB8IDgyMjI5IFNlZWZlbGQsIEdlcm1hbnkNCj4gQW10c2dlcmljaHQgTcO8
bmNoZW4sIEhSQiAxMDUwMTgNCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IERldGxlZiBTY2huZWlkZXIs
IFLDvGRpZ2VyIFN0YWhsLCBTdGVmYW4gU2NobmVpZGVyDQo+IGh0dHA6Ly93d3cudHEtZ3JvdXAu
Y29tLw0KPiANCg0K
