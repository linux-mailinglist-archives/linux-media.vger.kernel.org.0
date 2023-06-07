Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B28A7258E9
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 10:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235293AbjFGI5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 04:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239762AbjFGI4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 04:56:54 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D26B2693
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 01:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGULGQE2UADglaCZEi/j8+OSpMVoCU6vNx69UwCfQsAUcFqnoDz1dUhfgvDjbjg2cet4l4DdrNqh/kcOYbt1C7idVTwHby4PryITU7tJPr3rOyUKU+sryC/4YJVgQW4llp56B9rmhMPxvTUucf2lX6bPGx4op16TFxcvsk/UBOYD6J5og39Y7c9SVFtCYwVu+7H1RCswjIBKsg8zrd7gWklxE/ZTgONiCBLE8hRc6/7cCW96CjuCp/HKGYUElz23MXLPLTkgVNZ4LmJIHLq5M00d9Fw9/i4KDDD+pts9WI+Byra2/AacJmzTJW36TTBooY5jnIFHtYLNUTbYbo+qDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adQ9gm5GBGZS4Wkl0prt3x2GmPTmf6qi9clc+BNrleI=;
 b=G/uiXpciP0ZNRDVywHJYiKun7e+fnGQRyvXoztsSta4MS4mgXlUPmn9vqsShj0khkO5gj4GKCac2SK3tfWoKmm8yLyG/XC4jf9YsDv7lCEvBsut/3QQSjGEpncFOtQu3cUCiiyLf5NDZBLg2MSMaRQvEesMdQxLbZd3b7vf7ZkGb815/60cbbpjXuHSGqm4ZYQzZ/ulGDHJLPZub3d+RjEecwmTtykDw7M2Fop/6CieBuamVkBzK62HyN2hoiyvRoX/2+pg/hA+TpstEdihpTRs5NjOEXmlvdvYIoror6UFLHTK/n/NqPLFv9YUynest7uWbKotdn2CCmPEB8mIF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adQ9gm5GBGZS4Wkl0prt3x2GmPTmf6qi9clc+BNrleI=;
 b=Jn7ZXg6fUOWrzC3VCy5SKZhO/b7qRCUDCOnhrtFAQGVvScfry+N+anOviyYTzSSXhq3+5xYuuGQJOynxL4oW9iylFUh60jKjT9FGwezB6z3CmYOJlAVL3BAEBFQWH/NYgapW0u1ZJ6syq4A1YlSaVuzjzelbyZjnlyHWjMsxNlQ=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 08:55:44 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:55:44 +0000
From:   "G.N. Zhou" <guoniu.zhou@nxp.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [EXT] Re: [PATCH] media: ov5640: fix low resolution image
 abnormal issue
Thread-Topic: [EXT] Re: [PATCH] media: ov5640: fix low resolution image
 abnormal issue
Thread-Index: AQHZiW+ro2GReV8sVUeNP/ppo3BIq69+/r/QgAAZ3QCAAAzFQA==
Date:   Wed, 7 Jun 2023 08:55:44 +0000
Message-ID: <AS8PR04MB908039F150FADACFAECD7F7BFA53A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230518100557.2495843-1-guoniu.zhou@oss.nxp.com>
 <AS8PR04MB9080182A18EB8A338087F419FA53A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <edcjyd3k35h5mbk2t3pqxpj5blrcmxiytce7v5at4u6pntiyoz@3utgqjdbmr3m>
In-Reply-To: <edcjyd3k35h5mbk2t3pqxpj5blrcmxiytce7v5at4u6pntiyoz@3utgqjdbmr3m>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DU2PR04MB9145:EE_
x-ms-office365-filtering-correlation-id: 1590e0a3-cf6f-494a-d7a0-08db6734fac2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2npSLvQU37TrPEAnuN3v5yng6f9rfcoingXmQDJMityrjj6uVKjmqV19KttGGVxhey12QZgbbVuLQtqxZFoeqbYI+dEu9rrLqaUWszLp3uzM6SoU9SWpDK4LEwPSrWjls/fYMwQY0Sqy8xMqG6Vkue7tz3dRxJH+Xv8kk+OsScqmZAIor81Jgkrx0WWbVrGDbQ3M3I41nF8+8zXX5641a7B25cPwf2+6LM7+3yUF+U0EYeaPVmpxiaaZHIqSi/tnSlwi0h+viQmD+k3PNapWJnw6SfyRlNXBwXSo67YyH3gUBPHp7WWo1pP0vRMrHA71x+Wes8rV/CNk6o+551CKjb4gtyUIbViJJmkEjHn/s1GZ63nPnaV4SgIXQUJEnYUz8wyALLJlr3ufE/Av0n8Tf5sGMgVyQaLpPCERBYxBMN6gHSFpUG0yYFHJEuvWkb9gTqKNaeKrPgKHLmZP5hRDX4Jb/E/6wFVE1cxb3LysZyxrqiqsFLynumEPHzHNEZeufVv+2leSaxEAmROn74xV6dJPhSNFaizodeddYmxWyKsL8IOIt5w/U5to3zR7S5pZ4an6f/if0EPM61gX0EnJ3wb5Xr0hG0olxK/1xKd4f/8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(83380400001)(966005)(478600001)(33656002)(55016003)(8676002)(8936002)(41300700001)(66476007)(64756008)(76116006)(66556008)(66946007)(122000001)(316002)(6916009)(38070700005)(5660300002)(66446008)(52536014)(4326008)(38100700002)(86362001)(71200400001)(2906002)(7696005)(54906003)(26005)(186003)(6506007)(9686003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWdxeTMwcGtRdmNPU20xVVlWc0UyUmt2MlhXVzlGR0k4STd2M3BlOEE3UDRh?=
 =?utf-8?B?T2VYd2h3L0VpYkh3MXE1UVJuWTQ4aUNoM1FjSDN3TmFoSDllQWhIOU52NFBI?=
 =?utf-8?B?aFZ2QmFVUFVtVEN2QWF0a0NjTEhkdEovcFhZak5SaHF2T1FBT0kzMFRHRDFz?=
 =?utf-8?B?MzFZb1JXbVJyMW0vUnBpbXRsdTRrZXVhT2lmRnRCS2xuejdDd3g1aHVFWGc1?=
 =?utf-8?B?YnlwcE9zWUI2bXcxWHI4dTlTZzZFeHdRYUxXSjBkWjFLRkcrME1LK0V3MGVS?=
 =?utf-8?B?aWdIQnZ2QkE4QmhUZi9MTU9DakMyenNIQTFzSHgrNW13MWZVZWxGZnFOTDZo?=
 =?utf-8?B?REQrMjdLTm1IQ3VJcnMvUkFSQmJYZkxGMHpHVmdvV1F1VnBiTGRpcXJYSlRu?=
 =?utf-8?B?a0xtb3dYWmJKWTFRVUZNVzRDN2FmbmIybGtRQTRSZjUvaWduOWZzN1U4bG1N?=
 =?utf-8?B?SWptTE1ubm9nNnJLTVZJYklwZGJYRWVERyt4bi9qT3J3VkpNWG9wZEJoeUR4?=
 =?utf-8?B?YjNXSHpkNFd2WjFIdXB1L1k5RnBhUWlEQmZkemZVTDFHeUJ6eFhzenBwWlZI?=
 =?utf-8?B?MGtWb1l5ZDJETW5FN1ZkSi9scVJib3RsNkF2Zm1nYlJ5dmV3cjVucFpGeG1E?=
 =?utf-8?B?WmJEK0w2TlhibFJHM0ZrMnAwV0ExOEFQTlcvWm12bXgzbE93WkNia2NLM1Z2?=
 =?utf-8?B?YlpUbDZvUXAySEZtVmhuQzZqR2dWT01aQUwweDhLK2ZYSFR5bDkrL0hUSk9S?=
 =?utf-8?B?cURVT0tqNzlycWxRalAzd3NINmlsYXl0RnRMREtqcnR5bC96dzlicS9CYjJZ?=
 =?utf-8?B?elRZRGNFekdMK1grSlF1dVk3Um1ZZmtrSmxFNktFaTIwazRwZ2pvbFdGaE1D?=
 =?utf-8?B?YjFINERUK1A0THBmaTAxS1Z6NlFzSnZLS2tVckM0b2VpUDRlc0xua09FUWY2?=
 =?utf-8?B?Tit6QXkyS0ZnNUJNVFhMN05qMGNSWnk4K1hZKzY5VzlUS2w5czBaSmY4UXJp?=
 =?utf-8?B?WHRzMzNpLzJ6c3dwYTFyNzVxZk9RbHBjSTZ4M1RyZzIvc1prVDY4VzJTbzZt?=
 =?utf-8?B?anZZbEE4ZVJHT0pPcDV5YWNVcnlTOVE5dzNWZ2MrZk5jTm1mNXQxdEcyRHp6?=
 =?utf-8?B?MC8zQjV3aVpRWmpqSUc1Z1cyY1Fiam1lTnV6VVB1YXZwd21yQksxRmdsbERV?=
 =?utf-8?B?TWp3aHZ6WERTeDhaZURFZ3JJSXJSbW9ON1c4Nk9Jb1AzcWU4ZkpwVGRndWps?=
 =?utf-8?B?aWd6aElzNzRaVHA2U2VuUndQYzBrL21tY3lERDI1UHYrVFNxNHovV3A0Vndt?=
 =?utf-8?B?OVh6K25xS2dUL0ZKVzlMTlA3ZGs5eVAybFNZRFFWZ1VPYnJFcnhJMmV5M1BO?=
 =?utf-8?B?YTVtbnVyOGRLZ3FIZVhCRVZIQS80RUtWcjlwRTliYXNhOE5Rd09XMDZ2WjUr?=
 =?utf-8?B?cmJYcU81dys4NzJwZTB6amJjWGd0VlR6Y1NBcWZwMFlRNWpXUG00ZUtYcFIv?=
 =?utf-8?B?UlFIUHRFYWdVY2JxdUV3cG5xRkdhTE1yakU5Rm9EdFQxMm1zdE10S2VkY0tD?=
 =?utf-8?B?SUV2RUduVFQrK296Y0xTa1MyRUFhRFd0TzdiZGcvNjMxK2NlRUJ2TjJhdEc1?=
 =?utf-8?B?am0wcms2eDlRQ0JIL2srL2FKY3BaYWQ2VG1pWi90VkhLRDhGd2hwcWhsNDVa?=
 =?utf-8?B?b2NwclVzWkYrQWZQRlMyekdLNndueGorQ1Qxd2lzOFB3NlkzSjkxaXlyS0NH?=
 =?utf-8?B?KzFHdUk4RzFNMkx5S3pRQnlHeEVTS3Y5MG4vZXhPWHA4TjFNYWpvTXNhVDZC?=
 =?utf-8?B?QU5XeE5Ld1VrM3BwemgyWDJoUFdsK2FOQkI5NDBsWXdKMWNNUnp3aW5USkVa?=
 =?utf-8?B?YWVHVGdKMTI1OHcrYUdQVXVTcWF6RXpOUjh2Rk5pbkF2ZUVMSDJFSlRCV0RR?=
 =?utf-8?B?a3ZaMjhsRk9qR3FrdUNqd2RYTFJibWJnUXE4UTFtd2g5UUl2U1laMUpQek1y?=
 =?utf-8?B?UTJkL3NWV2hMTWJ0WmlqQjRudzFXczZoQlpmVllqWnZVSWFkank0anRpYW1V?=
 =?utf-8?B?ZTFrWmVMSm45RUFSUVZxRExNaU1jQWk2VzNDT0Vvc21GSG4xVmY4M3V1STJF?=
 =?utf-8?Q?wfT3079fY6yi8vLzADxWzlLah?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1590e0a3-cf6f-494a-d7a0-08db6734fac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 08:55:44.4774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9UJr9nC0YvZzCUgSQyIp3DLX4Fkxy1aNnxfqHX9VdFwpg6QClQNbhB1aZvYZ7btUSZesEBo82ziY71/eJ8oRQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9145
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvLA0KDQpUaGFua3MgZm9yIHlvdSByZXBseWluZy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYWNvcG8gTW9uZGkgPGphY29wby5tb25kaUBpZGVhc29u
Ym9hcmQuY29tPg0KPiBTZW50OiAyMDIz5bm0NuaciDfml6UgMTU6NTgNCj4gVG86IEcuTi4gWmhv
dSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gQ2M6IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpo
b3VAb3NzLm54cC5jb20+OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7DQo+IG1jaGVoYWJA
a2VybmVsLm9yZzsgc2xvbmdlcmJlYW1AZ21haWwuY29tOyBqYWNvcG9Aam1vbmRpLm9yZzsNCj4g
c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbTsgbGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tDQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0hdIG1lZGlhOiBvdjU2NDA6IGZpeCBs
b3cgcmVzb2x1dGlvbiBpbWFnZSBhYm5vcm1hbA0KPiBpc3N1ZQ0KPiANCj4gQ2F1dGlvbjogVGhp
cyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxp
bmtzIG9yIG9wZW5pbmcNCj4gYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUg
bWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzIGVtYWlsJw0KPiBidXR0b24NCj4gDQo+IA0K
PiBIZWxsbyBHdW9uaXUgWmhvdQ0KPiANCj4gT24gV2VkLCBKdW4gMDcsIDIwMjMgYXQgMDY6MjY6
MjJBTSArMDAwMCwgRy5OLiBaaG91IHdyb3RlOg0KPiA+IEhpIEFMTCwNCj4gPg0KPiA+IElzIHRo
ZXJlIGFueSBjb21tZW50cyBvciB1cGRhdGU/IEkgd2lsbCBhcHByZWNpYXRlIHRoYXQgaWYgdGhl
cmUgYXJlIGFueS4NCj4gDQo+IFlvdSdyZSB2ZXJ5IHJpZ2h0LCBzb3JyeSBhYm91dCB0aGUgZGVs
YXkNCj4gDQo+ID4NCj4gPiBCZXN0IFJlZ2FyZHMNCj4gPiBHLk4gWmhvdQ0KPiA+DQo+ID4NCj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBHLk4uIFpob3UgKE9T
UykNCj4gPiA+IFNlbnQ6IDIwMjPlubQ15pyIMTjml6UgMTg6MDENCj4gPiA+IFRvOiBsaW51eC1t
ZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gPiA+IHNsb25nZXJi
ZWFtQGdtYWlsLmNvbTsgamFjb3BvQGptb25kaS5vcmc7DQo+ID4gPiBzYWthcmkuYWlsdXNAbGlu
dXguaW50ZWwuY29tDQo+ID4gPiBDYzogbGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
DQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0hdIG1lZGlhOiBvdjU2NDA6IGZpeCBsb3cgcmVzb2x1dGlv
biBpbWFnZSBhYm5vcm1hbA0KPiA+ID4gaXNzdWUNCj4gPiA+DQo+ID4gPiBGcm9tOiAiR3Vvbml1
Lnpob3UiIDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+ID4NCj4gPiA+IE9WNTY0MCB3aWxsIG91
dHB1dCBhYm5vcm1hbCBpbWFnZSBkYXRhIHdoZW4gd29yayBhdCBsb3cgcmVzb2x1dGlvbg0KPiA+
ID4gKDMyMHgyNDAsDQo+ID4gPiAxNzZ4MTQ0IGFuZCAxNjB4MTIwKSBhZnRlciBzd2l0Y2hpbmcg
ZnJvbSBoaWdoIHJlc29sdXRpb24sIHN1Y2ggYXMNCj4gPiA+IDEwODBQLCB0aGUgdGltZSBpbnRl
cnZhbCBiZXR3ZWVuIGhpZ2ggYW5kIGxvdyBzd2l0Y2hpbmcgbXVzdCBiZSBsZXNzDQo+ID4gPiB0
aGFuIDEwMDBtcyBpbiBvcmRlciB0byBPVjU2NDAgZG9uJ3QgZW50ZXIgc3VzcGVuZCBzdGF0ZSBk
dXJpbmcgdGhlIHRpbWUuDQo+ID4gPg0KPiANCj4gVGhhbmtzIGZvciBmaW5kaW5nIHRoaXMgb3V0
LCBJIHByZXN1bWUgaXQgdG9vayBxdWl0ZSBzb21lIGVmZm9ydCB0byBkaWcgdGhhdCByZWdpc3Rl
cg0KPiBvdXQuDQo+IA0KPiBIb3dldmVyIEkgZG9uJ3QgaGF2ZSB0aGUgcmVnaXN0ZXIgZG9jdW1l
bnRlZCBhbnl3aGVyZS4gRG8geW91ID8NCg0KSSBvbmx5IGZpbmQgYSBtZW50aW9uIGFib3V0IDB4
MzgyNCBpbiB0YWJsZSA3LTE3ICgiIERWUCBQQ0xLIGRpdmlkZXIgY29udHJvbCBieSAweDM4MjRb
NDowXSAiKSBpbiBkYXRhc2hlZXQgYXMgYmVsbG93Og0KaHR0cHM6Ly9jZG4uc3BhcmtmdW4uY29t
L2RhdGFzaGVldHMvU2Vuc29ycy9MaWdodEltYWdpbmcvT1Y1NjQwX2RhdGFzaGVldC5wZGYNCg0K
PiANCj4gPiA+IFRoZSByZWFzb24gaXMgYnkgMHgzODI0IHZhbHVlIGRvbid0IHJlc3RvcmUgdG8g
aW5pdGlhbGl6ZSB2YWx1ZSB3aGVuDQo+ID4gPiBkbyByZXNvbHV0aW9uIHN3aXRjaGluZy4gSW4g
aGlnaCByZXNvbHV0aW9uIHNldHRpbmcgYXJyYXksIDB4MzgyNCBpcw0KPiA+ID4gc2V0IHRvIDB4
MDQsIGJ1dCBsb3cNCj4gDQo+IFdoeSBJIGRvIHNlZToNCj4gb3Y1NjQwX3NldHRpbmdfUVNYR0Ff
MjU5Ml8xOTQ0W10gPSB7IC4uLiB7MHgzODI0LCAweDAyLCAwLCAwfSwuLiB9Ow0KPiANCj4gSGF2
ZSB5b3UgdGVzdGVkIHN3aXRjaGluZyB0byBmdWxsLXJlc29sdXRpb24gbW9kZSB0byBhIGxvd2Vy
IHJlc29sdXRpb24gPw0KDQpTb3JyeSBJIHRlc3RlZCBhbGwgcmVzb2x1dGlvbnMgZXhjZXB0IDI1
OTJ4MTk0NCwgYnV0IEkgY2FuIGRvIHRoYXQgbGF0ZXIuDQoNCj4gDQo+ID4gPiByZXNvbHV0aW9u
IHNldHRpbmcgYXJyYXkgcmVtb3ZlIDB4MzgyNCBpbiBjb21taXQgZGIxNWMxOTU3YTJkICgibWVk
aWE6DQo+ID4gPiBvdjU2NDA6IFJlbW92ZSBkdXBsaWNhdGVkIG1vZGUgc2V0dGluZ3MiKS4gU28g
d2hlbiBkbyByZXNvbHV0aW9uDQo+ID4gPiBzd2l0Y2hpbmcgZnJvbSBoaWdoIHRvIGxvdywgc3Vj
aCBhcyAxMDgwUCB0byAzMjB4MjQwLCBhbmQgdGhlIHRpbWUNCj4gPiA+IGludGVydmFsIGlzIGxl
c3MgdGhhbiBhdXRvIHN1c3BlbmQgZGVsYXkgdGltZSB3aGljaCBtZWFucyBnbG9iYWwNCj4gPiA+
IGluaXRpYWxpemUgc2V0dGluZyBhcnJheSB3aWxsIG5vdCBiZSBsb2FkZWQsIHRoZSBvdXRwdXQg
aW1hZ2UgZGF0YSBhcmUNCj4gYWJub3JtYWwuDQo+ID4gPg0KPiANCj4gT2ssIHRoaXMgd2FzIHBv
c3NpYmlseSBlaXRoZXIgYSBtaWNyby1vcHRpbWl6YXRpb24gb3IgYSBwbGFpbiBtaXN0YWtlIGFz
IEkgZG8gc2VlIGluDQo+IGNvbW1pdCBkYjE1YzE5NTdhMmQgdGhlIG92NTY0MF9zZXR0aW5nX2xv
d19yZXNbXSBhcnJheSBiZWluZyBpbnRyb2R1Y2VkLA0KPiBidXQgY29tcGFyZWQgdG8gdGhlIHJl
Z2lzdGVyIHRhYmxlcyBpdCByZXBsYWNlcyBpdCBpcyBtaXNzaW5nOg0KPiANCj4gICAgICAgICB7
MHg0NDA3LCAweDA0LCAwLCAwfSwgezB4NDYwYiwgMHgzNSwgMCwgMH0sIHsweDQ2MGMsIDB4MjIs
IDAsIDB9LA0KPiAgICAgICAgIHsweDM4MjQsIDB4MDIsIDAsIDB9DQo+IA0KPiBUaGVzZSByZWdp
c3RlcnMgYXJlIGFscmVhZHkgcHJvZ3JhbW1lZCB3aXRoIHRoZXNlIHZhbHVlcyBieQ0KPiBvdjU2
NDBfaW5pdF9zZXR0aW5nW10sIHRoYXQgbWlnaHQgYmUgdGhlIHJlYXNvbiBJIGxlZnQgdGhlbSBv
dXQgZnJvbQ0KPiBvdjU2NDBfc2V0dGluZ19sb3dfcmVzW10uDQo+IA0KPiBCdXQgYXMgeW91IGhh
dmUgY29ycmVjdGx5IG5vdGljZWQsIHN3aXRjaGluZyBiZXR3ZWVuIG1vZGVzIGRvZXNuJ3QgZ28g
dGhyb3VnaA0KPiBvdjU2NDBfaW5pdF9zZXR0aW5nW10gKG9mIGNvdXJzZSkgc28gSSBjYW4gb25s
eSBjb25jbHVkZSB0aGUgYWJvdmUgcmVnaXN0ZXINCj4gc2hvdWxkIGFsbCBiZSByZS1pbnRyb2R1
Y2VkIGluIG92NTY0MF9zZXR0aW5nX2xvd19yZXNbXS4gV2hhdCBkbyB5b3UgdGhpbmsgPw0KDQpT
dXJlLCBpZiBzbywgaXQgY2FuIHNhdmUgc29tZSB0aW1lLiBMZXQgbWUgaGF2ZSBhIGNoZWNrIGFu
ZCBpZiBpdCB3b3JrIGZpbmUsIEkgd2lsbCBzZW5kIHYyIHBhdGNoIHRvIHVwZGF0ZSB0aGVtLiBU
aGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCg0KPiANCj4gVGhhbmtzIGFnYWluIQ0KPiANCj4g
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUuemhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4N
Cj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIHwgMiArLQ0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4N
Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYyBiL2RyaXZlcnMv
bWVkaWEvaTJjL292NTY0MC5jDQo+ID4gPiBpbmRleCAxNTM2NjQ5YjllOTAuLmIxYTQ1NjVmZGMw
ZiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jDQo+ID4gPiAr
KysgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiA+ID4gQEAgLTYzNCw3ICs2MzQsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ192YWx1ZQ0KPiA+ID4gb3Y1NjQwX3NldHRpbmdfbG93
X3Jlc1tdID0gew0KPiA+ID4gICAgIHsweDNhMGEsIDB4MDAsIDAsIDB9LCB7MHgzYTBiLCAweGY2
LCAwLCAwfSwgezB4M2EwZSwgMHgwMywgMCwgMH0sDQo+ID4gPiAgICAgezB4M2EwZCwgMHgwNCwg
MCwgMH0sIHsweDNhMTQsIDB4MDMsIDAsIDB9LCB7MHgzYTE1LCAweGQ4LCAwLCAwfSwNCj4gPiA+
ICAgICB7MHg0MDAxLCAweDAyLCAwLCAwfSwgezB4NDAwNCwgMHgwMiwgMCwgMH0sDQo+ID4gPiAt
ICAgezB4NDQwNywgMHgwNCwgMCwgMH0sIHsweDUwMDEsIDB4YTMsIDAsIDB9LA0KPiA+ID4gKyAg
IHsweDQ0MDcsIDB4MDQsIDAsIDB9LCB7MHgzODI0LCAweDAyLCAwLCAwfSwgezB4NTAwMSwgMHhh
MywgMCwNCj4gPiA+ICsgMH0sDQo+ID4gPiAgfTsNCj4gPiA+DQo+ID4gPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCByZWdfdmFsdWUgb3Y1NjQwX3NldHRpbmdfNzIwUF8xMjgwXzcyMFtdID0gew0KPiA+
ID4gLS0NCj4gPiA+IDIuMzcuMQ0KPiA+DQo=
