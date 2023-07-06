Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B07C7749904
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 12:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbjGFKIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 06:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjGFKIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 06:08:49 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB5A19AE;
        Thu,  6 Jul 2023 03:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cN+1Y32CUXzmNA92mEPSfElQYzHp0NGUsesN8MubSGJGH5ou84wExPPMZG9YqpamAVDK4Xah0+K41Dd04BWEz8yVp0Rhxr9O04xQRr+Fc3C3T2pVy6d8lC+9ncohHQUwQLzPxSLjmOhHDldzmA92jOJbZNNmuLkl4XOtt4g1LCo4qRn6yrZ9W8sZQIgA7mG3GicdWGwqpPxLT93mrL0OPXhVzuIikwKJ1Q2npu1MN6yEFl83tjw4pSM2uR4VvU0zehMpWEwYKP85lfLxhvHaEFW4vVFmCEzVxWQJ7yspzYlcqxvUDb35BXRUlNz+j6FqIUkRD1OpiVmdLgyY7z6iKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+PtbkFydkAGPp3XZmr5ooA1PDt5bM/R8tbfrHEN7Yw=;
 b=Em103hF5C/9LiutFkATw/2MdfXVXQQ7/KH1BjlMMyk5dvC6qwW9w1rQH6924K54lk7bBcJbUas6etyz6ZYmPxB2fE6RjLg36AfHVezoVF5ieRgPYG6vaLdmRIKXfvEQ1yFyfxO+Upvzsf+rYTGwDL25okQr6BNLt0CK/1PInAMHU19PRJgEwxj88D5SLdZhKVN1/OznH1/6JypGRpyrZNRdqMBvfKl8hGJc+yk5JU5lcfu5KRMqOxhVocIlR+EeQP3OYwg3Qi3y0aC0qQxbDlbeW5WtRKwglaE5K4e8nkiIv/JyL4nFj1oh7gzLkng91zf9Ip8+ezAYLBL3n68OIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+PtbkFydkAGPp3XZmr5ooA1PDt5bM/R8tbfrHEN7Yw=;
 b=k5ZgUTFaYb3RJDX6G/LClDakpiHntlDOwlXsbatSbRwYB91ja0agNHrlYHASgstPnxqG7YhoQtEOd0wC2gTVmUdGuQl8lGGOpRk553lHAKwFz2dAaGho90VzryKgWuqi3vDKuUeLAuOVbHoIQBf4rKiJcRHEwE1OAnj0x8krkhI=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS1PR04MB9584.eurprd04.prod.outlook.com (2603:10a6:20b:473::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 10:08:44 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 10:08:44 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>
Subject: RE: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI
 CSI-2
Thread-Topic: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI
 CSI-2
Thread-Index: AQHZraIh2RFb/SSXAk2t6mby6BkWCK+pSqOAgAEcagCAAUurgIAA1VUQ
Date:   Thu, 6 Jul 2023 10:08:44 +0000
Message-ID: <AS8PR04MB9080D9BB2E9BDD1C0873C981FA2CA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com>
 <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
 <2292421.ElGaqSPkdT@steina-w>
 <AS8PR04MB90805B1F91BCDB7FDC058392FA2FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <20230705212351.GC11949@pendragon.ideasonboard.com>
In-Reply-To: <20230705212351.GC11949@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AS1PR04MB9584:EE_
x-ms-office365-filtering-correlation-id: 762ac0e5-aeec-401e-5428-08db7e08fb8e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t/nPn1EHfmQv03to+H1zPrvQ8iHJwCm5AVyXIb4FNEIlcaC+2hcvRKdIeZD6fAU68VR/A3uC4bjYyYIjvXzmbCEaqFYKOW/JG/4IqrZf2aEiWYkqHsK/nZTeTZJYK2wZ1Jpan2F8OA0KkJmF5qBBsjFJtSp5wZ1EA8cKSTm469iVW9OKhtFsw6zQPCo33niZGg2FYM01hhdzrn7QQEgnQGl+rCX2C7iVvcQw/kyLoEHZSJAmhEMsPOx7gdYuLAZg08d2BKwoMfY3A6zJol9Xe7+wIFeMiYZPnVYm27wdZDsZ9izCr4468kw7DhvOFZgjSu2wVIdNppn1V3t/m6iZMkpVaZqrZ+NTDOfOE0nJ6LfVDHE18jIObx9epeShUXWAbI74/JGkSp+AWu6AUOIHdrr1ax0glwG+4dXLed75p20fgTsVCevVqr5rxGVD2YpsGhthz+09VgvyPFUE5PlfUdaMw3DlMJ386k48EFJHDRyIv55oYbwFV7Cm9w3EissLrv+DmPhmGeS+4FndvUyh48u3eGdW/a7vjXa/zRvtgn5utPY07pniZvt+LG+TZheJmTra3a7uw7mu7MDpBHSM85WRSaCPNgYiI84aiwoXjzU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(66556008)(66946007)(8936002)(64756008)(5660300002)(53546011)(8676002)(55016003)(86362001)(122000001)(38100700002)(110136005)(83380400001)(38070700005)(316002)(41300700001)(66476007)(66446008)(4326008)(76116006)(33656002)(9686003)(966005)(186003)(7696005)(478600001)(54906003)(71200400001)(26005)(6506007)(2906002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0JuTEdGVThOUEpYa2pja1d0T0QvVFZ1WUVtNE40TzNhK3NMQ3AzeXcyS01h?=
 =?utf-8?B?Y1FyMENMbnFMUVppbFJRU3pRaStjNXJnUFo2WHREaWdQV1ZBcEpjKzRSWXVM?=
 =?utf-8?B?T1JaaitBWmx5d3FlLzg0cTV6NFZXVzYzc0FTSVZiL1NiYUkzL0h3Y2RQQ1Vk?=
 =?utf-8?B?Q096dG1iWENiOER6dnYvbEUrOURSQXRzaThabDZya3o2N1pvbXZZNExvUHF0?=
 =?utf-8?B?a0VGMGQrckNpUVNxZndjOHZKR2J0Y3N6Sk5SNmJwaTUvUWoxY2M4TjZGRjFr?=
 =?utf-8?B?Q21wV2pQbk0vWmhaRXg4eUVmRHkrU2NoQk13d2NmTFpGekRpTGI5aE1pazVp?=
 =?utf-8?B?eVdMR3dobHlISUlxZHU5QkRhcnZLT21CK0FQVmZqOUNHOWpOa3lTN3E1Nlpx?=
 =?utf-8?B?bWFTQjFrbCtpNGZldnljUlFieC94dHIvbS9Pdy9wUm44NThzZ1RVUDdaNDl4?=
 =?utf-8?B?U3VQcy81YktmMnphRWVNckV2ZXBTUEVHMDYydkZZQk9hbFduQ1JBT054TVRw?=
 =?utf-8?B?Qkg0VWJUNnhRaTBpWk1rdkFyRzdoRDEyNERwNkpITUdNQmRpcVoxZTVpTGUr?=
 =?utf-8?B?WDZIak5xMFAvRDdtYmppWTlrYTBxWkYyeVdrQ0RIdU5tREpEVFhMQ3hiRFRx?=
 =?utf-8?B?ZEsxMHdCbW5JZjZVV3o5NkFidzlkVk9jc0I1R1RCT2xKdlZNenVXdDZjYnor?=
 =?utf-8?B?eEg4enF3cU5XcXpTU0M5czRFSTBRT1hvUzF1Z2E0VHcxVGNFN0FrTWFVMElX?=
 =?utf-8?B?cHJYZ2xyUUxIUjRzNnlmVHk3YmdMNTJwK1NFdW85ckkrUVYyTG0zUVprYWZu?=
 =?utf-8?B?UGoxV2hqb1FxMUNnRlgxT3d1MzBLMlQ5Z0dHYTlMeWlCdFoyZUlBMjVjbDdq?=
 =?utf-8?B?a29mRlVsa2lOSnpBQ1RUSzc2SXltM201L1ovbmRiVnp0MjNvN0lrQlpjOFlO?=
 =?utf-8?B?cUtaY2pYak9SUk5KL2czWENrTUcrdWdGdjl0Y3UyVUNvWHZSSjNnMEVndlJC?=
 =?utf-8?B?eW11UjgxN2pWUkQ1ZzROMitxQ3B2MXpSVWs1SkNhaFhuNFpOTGgwbkZIdHc5?=
 =?utf-8?B?NndTN1BiaksvUGlSbUZRNjRhYkh0V3MwREJYaS95Y2NzODRMWXVUdUFVbGIz?=
 =?utf-8?B?ZmROTzRhSm9VNzBLb1Azd2tQbXJOcEF3L2M0VTl1ZUtKeHVhRk1pZmN5cW93?=
 =?utf-8?B?bTh4V2lQS2N1ZUcvTnF3UU5qQ2pTUTN1NnFuM29kNmRqK25VMDRyUDYydXNm?=
 =?utf-8?B?eGZ0aVlIaHJ5bWh2K25EOEgzZUpvYjcvUEpmeTY5ZE5sTCtMQVZ3OUNGQkpo?=
 =?utf-8?B?YktSTUVMLzFub3pNUjNLc3BTZjRRVitYNUR1L2dGcm5IZjIvTHQxTUVYU3Vv?=
 =?utf-8?B?d1hMRnNWRVFzTFNNYW1LSHlmRzZwcmxHaFlsMWp5WDJNTzFyWXYxZHdIcllW?=
 =?utf-8?B?R0czam5DbnB4K2VzZUxwYnZMUTdzVXM1WnJPOENjRTBWcS9PNjU2ZnVsTTk5?=
 =?utf-8?B?WHV5ZGhtcGRhbnhpMzVTUU9raGp3MVVQNDFzWE9QejRJRlUxT0xMMm5hNU1r?=
 =?utf-8?B?MGxVSDhiS1I0REdnQ0NMREs4SHV6Q0VLR2doWFc2VzFzMGFVUTV3ZExLWVI5?=
 =?utf-8?B?aFFRbzZnTjA0T0FLd0wydktxQWJiRW5wYi80Wmh1ODlhZ2JoT0ovS1NmQTBm?=
 =?utf-8?B?b2hzbEFsM0VtcVA4T0JrWXNVUiswb3VnOHp2ZjIyWHZzMjE1L2JVNDBuL2Zk?=
 =?utf-8?B?L2hiK2s3TjM2NTUzN0RLdVRRUlI0VCtJUWVMbjg5WDRhM3JCdnNpWDRTOXR1?=
 =?utf-8?B?ZU42bVB0L28wSXFaL0I0NGY3VmFEcERRbEEvZTMwQUFWb2xlQTJZTE1BblBt?=
 =?utf-8?B?RThPalJGV3RvdGJrTVdOSnZtVWdmTy9Sd2l1TWo4VTk3M1JMeDdVQVJseklJ?=
 =?utf-8?B?SXRUMGsydmtsdzhOVlE3bit6ZHljQkxIUkMvVFBadVpxbWFQa0pKOUJkak9r?=
 =?utf-8?B?QldJOXUyR1VqYmpvazIzS2s2a29TeU1WVHJkSG9ObXgyWTdjMkMvOENlNkVI?=
 =?utf-8?B?NTRaOVBtQ0hXYzg5bXh3MXlwL09Tc0xxbWc4eno0T0d5dXpra3NmRERUb2Yy?=
 =?utf-8?Q?ePrOGQIVFNFiF6OFXDQemBjVC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762ac0e5-aeec-401e-5428-08db7e08fb8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 10:08:44.8020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vf7+dBPKpJwil2lvNh3uI1uyGT4oSb+bX6tgdHaJMA89vAoVo8DuYFmHreJYdJoPCG5eLymNr6LHUdw2FAulOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9584
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogMjAyM+W5tDfmnIg25pelIDU6MjQNCj4gVG86
IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+DQo+IENjOiBBbGV4YW5k
ZXIgU3RlaW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+Ow0KPiBsaW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1p
bXgNCj4gPGxpbnV4LWlteEBueHAuY29tPjsgbWNoZWhhYkBrZXJuZWwub3JnOyByb2JoK2R0QGtl
cm5lbC5vcmc7DQo+IGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsgY29ub3IrZHRA
a2VybmVsLm9yZzsNCj4gamFjb3BvLm1vbmRpQGlkZWFzb25ib2FyZC5jb20NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAxLzJdIG1lZGlhOiBkdC1iaW5kaW5nczogQWRkIGJpbmRpbmcgZG9jIGZvciBp
Lk1YOTMgTUlQSQ0KPiBDU0ktMg0KPiANCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBl
bWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yIG9wZW5pbmcNCj4g
YXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUg
J1JlcG9ydCB0aGlzIGVtYWlsJw0KPiBidXR0b24NCj4gDQo+IA0KPiBPbiBXZWQsIEp1bCAwNSwg
MjAyMyBhdCAwMTozNjo0NkFNICswMDAwLCBHLk4uIFpob3UgKE9TUykgd3JvdGU6DQo+ID4gSGkg
QWxleGFuZGVyLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3UgY29tbWVudC4NCj4gPg0KPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEFsZXhhbmRlciBTdGVpbiA8
YWxleGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4NCj4gPiA+IFNlbnQ6IDIwMjPlubQ35pyI
NOaXpSAxNjozOQ0KPiA+ID4gVG86IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAu
Y29tPjsgRy5OLiBaaG91IChPU1MpDQo+ID4gPiA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+DQo+
ID4gPiBDYzogbWNoZWhhYkBrZXJuZWwub3JnOyBsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb207DQo+ID4gPiByb2JoK2R0QGtlcm5lbC5vcmc7IGtyenlzenRvZi5rb3psb3dza2krZHRA
bGluYXJvLm9yZzsNCj4gPiA+IHJvYmgrY29ub3IrZHRAa2VybmVsLm9yZzsNCj4gPiA+IGphY29w
by5tb25kaUBpZGVhc29uYm9hcmQuY29tDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0g
bWVkaWE6IGR0LWJpbmRpbmdzOiBBZGQgYmluZGluZyBkb2MgZm9yDQo+ID4gPiBpLk1YOTMgTUlQ
SQ0KPiA+ID4gQ1NJLTINCj4gPiA+DQo+ID4gPiBIaSBHdW9uaXUsDQo+ID4gPg0KPiA+ID4gdGhh
bmtzIGZvciBwb3N0aW5nIHRoaXMgZHJpdmVyLg0KPiA+ID4NCj4gPiA+IEFtIE1vbnRhZywgMy4g
SnVsaSAyMDIzLCAxMzozNzozMyBDRVNUIHNjaHJpZWIgZ3Vvbml1Lnpob3VAb3NzLm54cC5jb206
DQo+ID4gPiA+DQo+ID4gPiA+IEZyb206ICJHdW9uaXUuemhvdSIgPGd1b25pdS56aG91QG54cC5j
b20+DQo+ID4gPiA+DQo+ID4gPiA+IEFkZCBuZXcgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBE
ZXNpZ25XYXJlIENvcmUgTUlQSSBDU0ktMg0KPiA+ID4gPiByZWNlaXZlciBhbmQgRFBIWSBmb3Vu
ZCBvbiBOWFAgaS5NWDkzLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUu
emhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAuLi4vYmlu
ZGluZ3MvbWVkaWEvbnhwLGR3Yy1taXBpLWNzaTIueWFtbCAgICAgfCAxNDANCj4gKysrKysrKysr
KysrKysrKysrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQwIGluc2VydGlvbnMoKykNCj4g
PiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9ueHAsZHdjLW1pcGktY3NpMi55YW1sDQo+ID4gPiA+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254cCxkd2MtbWlwaS1jc2kyLnlh
bWwNCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwMDAwLi5lY2U2
ZmI4OTkxZDQNCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbnhwLGR3Yy1taXBpLWNzaTIueWENCj4gPiA+
ID4gKysrIG1sDQo+ID4gPiA+IEBAIC0wLDAgKzEsMTQwIEBADQo+ID4gPiA+ICsjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwNCj4g
PiA+ID4gKzEuMg0KPiA+ID4gPiArLS0tDQo+ID4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL21lZGlhL254cCxkd2MtbWlwaS1jc2kyLnlhbWwjDQo+ID4gPiA+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiA+
ID4gKw0KPiA+ID4gPiArdGl0bGU6IE5YUCBpLk1YOTMgTUlQSSBDU0ktMiBIb3N0IENvbnRyb2xs
ZXIgcmVjZWl2ZXINCj4gPiA+ID4gKw0KPiA+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiA+ICsg
IC0gRy5OLiBaaG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+ID4gPiArDQo+ID4gPiA+ICtk
ZXNjcmlwdGlvbjogfC0NCj4gPiA+ID4gKyAgVGhlIE1JUEkgQ1NJLTIgcmVjZWl2ZXIgZm91bmQg
b24gaS5NWDkzIG9yaWdpbmF0ZXMgZnJvbQ0KPiA+ID4gPiArU3lub3BzeXMNCj4gPiA+ID4gKyAg
RGVzaWduV2FyZSBDb3JlIGFuZCBpdCBpbXBsZW1lbnRzIHRoZSBDU0ktMiBwcm90b2NvbCBvbiB0
aGUNCj4gPiA+ID4gK2hvc3QNCj4gPiA+ID4gKyAgc2lkZSBhbmQgYSBEUEhZIGNvbmZpZ3VyZWQg
YXMgYSBTbGF2ZSBhY3RzIGFzIHRoZSBwaHlzaWNhbCBsYXllci4NCj4gPiA+ID4gKyAgVHdvIGRh
dGEgbGFuZXMgYXJlIHN1cHBvcnRlZCBvbiBpLk1YOTMgZmFtaWx5IGRldmljZXMgYW5kIHRoZQ0K
PiA+ID4gPiArZGF0YQ0KPiA+ID4gPiArICByYXRlIG9mIGVhY2ggbGFuZSBzdXBwb3J0IHVwIHRv
IDEuNUdicHMuDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgV2hpbGUgdGhlIENTSS0yIHJlY2VpdmVy
IGlzIHNlcGFyYXRlIGZyb20gdGhlIE1JUEkgRC1QSFkgSVANCj4gPiA+ID4gKyBjb3JlLCB0aGUg
UEhZIGlzIGNvbXBsZXRlbHkgd3JhcHBlZCBieSB0aGUgQ1NJLTIgY29udHJvbGxlciBhbmQNCj4g
PiA+ID4gKyBleHBvc2UgIGEgY29udHJvbCBpbnRlcmZhY2Ugd2hpY2ggb25seSBjYW4gY29tbXVu
aWNhdGUgd2l0aA0KPiA+ID4gPiArIENTSS0yIGNvbnRyb2xsZXIgVGhpcyBiaW5kaW5nIHRodXMg
Y292ZXJzIGJvdGggSVAgY29yZXMuDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3Byb3BlcnRpZXM6DQo+
ID4gPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gPiA+ICsgICAgZW51bToNCj4gPiA+ID4gKyAgICAg
IC0gZnNsLGlteDkzLW1pcGktY3NpMg0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIHJlZzoNCj4gPiA+
ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIGludGVycnVwdHM6DQo+
ID4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ID4gKw0KPiA+ID4gPiArICBjbG9ja3M6DQo+
ID4gPiA+ICsgICAgaXRlbXM6DQo+ID4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgcGVy
aXBoZXJhbCBjbG9jayAoYS5rLmEuIEFQQiBjbG9jaykNCj4gPiA+ID4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IFRoZSBwaXhlbCBjbG9jaw0KPiA+ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogVGhl
IE1JUEkgRC1QSFkgY2xvY2sNCj4gPiA+ID4gKw0KPiA+ID4gPiArICBjbG9jay1uYW1lczoNCj4g
PiA+ID4gKyAgICBpdGVtczoNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHBlcg0KPiA+ID4gPiAr
ICAgICAgLSBjb25zdDogcGl4ZWwNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHBoeV9jZmcNCj4g
PiA+ID4gKw0KPiA+ID4gPiArICBwb3dlci1kb21haW5zOg0KPiA+ID4gPiArICAgIG1heEl0ZW1z
OiAxDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgcG9ydHM6DQo+ID4gPiA+ICsgICAgJHJlZjogL3Nj
aGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cw0KPiA+ID4gPiArDQo+ID4gPiA+ICsg
ICAgcHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgIHBvcnRAMDoNCj4gPiA+ID4gKyAgICAgICAg
JHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvJGRlZnMvcG9ydC1iYXNlDQo+ID4gPiA+ICsgICAg
ICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiA+ID4gKyAgICAgICAgZGVzY3Jp
cHRpb246DQo+ID4gPiA+ICsgICAgICAgICAgSW5wdXQgcG9ydCBub2RlLCBzaW5nbGUgZW5kcG9p
bnQgZGVzY3JpYmluZyB0aGUgQ1NJLTINCj4gdHJhbnNtaXR0ZXIuDQo+ID4gPiA+ICsNCj4gPiA+
ID4gKyAgICAgICAgcHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgICAgICBlbmRwb2ludDoNCj4g
PiA+ID4gKyAgICAgICAgICAgICRyZWY6IHZpZGVvLWludGVyZmFjZXMueWFtbCMNCj4gPiA+ID4g
KyAgICAgICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiA+ID4gKw0KPiA+
ID4gPiArICAgICAgICAgICAgcHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgICAgICAgICAgZGF0
YS1sYW5lczoNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICBtaW5JdGVtczogMQ0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgIGl0ZW1zOg0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgLSBjb25z
dDogMQ0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgLSBjb25zdDogMg0KPiA+ID4gPiArDQo+
ID4gPiA+ICsgICAgICAgICAgICAgIGZzbCxoc2ZyZXFyYW5nZToNCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgIFVzZWQgdG8gc2VsZWN0IHRoZSBkZXNpcmVkIGhpZ2ggc3BlZWQgZnJlcXVlbmN5DQo+
IHJhbmdlDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICBhY2NvcmRpbmcgdG8gZGF0YSBsYW5l
IGJpdCByYXRlLiBQbGVhc2UgcmVmZXIgdG8NCj4gaS5NWDkzDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICByZWZlcmVuY2UgbWFudWFsIE1JUEkgQ1NJLTIgRFBIWSBjaGFwdGVyIHRvIGdldCBh
DQo+IHZhbGlkDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICB2YWx1ZS4NCj4gPiA+DQo+ID4g
PiBJZiB0aGlzIGlzIGRhdGEgbGFuZSBiaXQgcmF0ZSBzcGVjaWZpYywgc2hvdWxkbid0IGl0IGJl
IHNldCBpbg0KPiA+ID4gc19zdHJlYW0gY2FsbGJhY2sgb3Igc2ltaWxhcj8NCj4gPg0KPiA+IFRo
YXQncyBjb3JyZWN0IGlmIHdlIGhhdmUgYSBmb3JtdWxhIHRvIGNhbGN1bGF0ZSBpdCBhbmQgZ2V0
IGRhdGEgcmF0ZQ0KPiA+IGZyb20gc2Vuc29yLiBCdXQgU3lub3BzeXMgb25seSBwcm92aWRlIGEg
dGFibGUgdG8gc2VhcmNoIHRoZSB2YWxpZA0KPiA+IGhzZnJlcXJhbmdlIGFjY29yZGluZyB0byBk
YXRhIHJhdGUgYW5kIHRoZSB2YWx1ZXMgYXJlIG5vbmxpbmVhciBzbyBJIGV4cG9ydCBhDQo+IHBy
b3BlcnR5IHRvIGhhbmRsZSB0aGlzIGlzc3VlLg0KPiANCj4gV2UgaGF2ZSBtdWx0aXBsZSBkcml2
ZXJzIGluIG1haW5saW5lIHRoYXQgZG8gdGhlIHNhbWUsIHNvIGl0J3Mgbm90IGEgcHJvYmxlbSwg
eW91DQo+IGNhbiBoYXZlIGEgdGFibGUgb2YgdmFsdWVzIGluIHRoZSBkcml2ZXIgYW5kIHNlYXJj
aCBmb3IgdGhlIHJpZ2h0IGVudHJ5IGF0IHJ1bnRpbWUuDQo+IFNlZSBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3JlbmVzYXMvcmNhci12aW4vcmNhci1jc2kyLmMgZm9yIGluc3RhbmNlLg0KDQpPa2F5
LCBJIHdpbGwgdXBkYXRlIGluIG5leHQgdmVyc2lvbi4gVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rp
b24uIA0KDQo+IA0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICByZXF1aXJlZDoNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgLSBkYXRhLWxhbmVzDQo+ID4gPiA+ICsgICAgICAgICAgICAg
IC0gZnNsLGhzZnJlcXJhbmdlDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgIHBvcnRAMToNCj4g
PiA+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0
DQo+ID4gPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gPiArICAgICAgICAgIE91dHB1
dCBwb3J0IG5vZGUNCj4gPiA+ID4gKw0KPiA+ID4gPiArcmVxdWlyZWQ6DQo+ID4gPiA+ICsgIC0g
Y29tcGF0aWJsZQ0KPiA+ID4gPiArICAtIHJlZw0KPiA+ID4gPiArICAtIGludGVycnVwdHMNCj4g
PiA+ID4gKyAgLSBjbG9ja3MNCj4gPiA+ID4gKyAgLSBjbG9jay1uYW1lcw0KPiA+ID4gPiArICAt
IHBvd2VyLWRvbWFpbnMNCj4gPiA+ID4gKyAgLSBwb3J0cw0KPiA+ID4gPiArDQo+ID4gPiA+ICth
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiA+ID4gKw0KPiA+ID4gPiArZXhhbXBsZXM6
DQo+ID4gPiA+ICsgIC0gfA0KPiA+ID4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9j
ay9pbXg5My1jbG9jay5oPg0KPiA+ID4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRl
cnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4gPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPiA+ID4gPiArICAgICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9wb3dlci9mc2wsaW14OTMtcG93ZXIuaD4NCj4gPiA+ID4gKw0KPiA+ID4g
PiArICAgIG1pcGktY3NpQDRhZTAwMDAwIHsNCj4gPiA+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9
ICJmc2wsaW14OTMtbWlwaS1jc2kyIjsNCj4gPiA+ID4gKyAgICAgICAgcmVnID0gPDB4NGFlMDAw
MDAgMHgxMDAwMD47DQo+ID4gPiA+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNzUg
SVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gPiA+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrcyBJ
TVg5M19DTEtfTUlQSV9DU0lfR0FURT4sDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIDwmY2xr
cyBJTVg5M19DTEtfQ0FNX1BJWD4sDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIDwmY2xrcyBJ
TVg5M19DTEtfTUlQSV9QSFlfQ0ZHPjsNCj4gPiA+ID4gKyAgICAgICAgY2xvY2stbmFtZXMgPSAi
cGVyIiwgInBpeGVsIiwgInBoeV9jZmciOw0KPiA+ID4gPiArICAgICAgICBwb3dlci1kb21haW5z
ID0gPCZtZWRpYV9ibGtfY3RybA0KPiA+ID4gPiArIElNWDkzX01FRElBQkxLX1BEX01JUElfQ1NJ
PjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICBwb3J0cyB7DQo+ID4gPiA+ICsgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICNzaXplLWNl
bGxzID0gPDA+Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICBwb3J0QDAgew0KPiA+
ID4gPiArICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgIG1pcGlfZnJvbV9zZW5zb3I6IGVuZHBvaW50IHsNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZhcDEzMDJfdG9fbWlwaT47DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgIGRhdGEtbGFuZXMgPSA8MSAyPjsNCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgZnNsLGhzZnJlcXJhbmdlID0gPDB4MmM+Ow0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgIH07DQo+ID4gPiA+ICsgICAgICAgICAgICB9Ow0KPiA+ID4gPiArDQo+ID4g
PiA+ICsgICAgICAgICAgICBwb3J0QDEgew0KPiA+ID4gPiArICAgICAgICAgICAgICAgIHJlZyA9
IDwxPjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAgIG1pcGlfdG9faXNpOiBl
bmRwb2ludCB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9
IDwmaXNpX2luPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICB9Ow0KPiA+ID4gPiArICAgICAg
ICAgICAgfTsNCj4gPiA+ID4gKyAgICAgICAgfTsNCj4gPiA+ID4gKyAgICB9Ow0KPiA+ID4gPiAr
Li4uDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
