Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97FF46385E8
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 10:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiKYJLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 04:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiKYJLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 04:11:38 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659AA31F93
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 01:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcS23b973zgoTP0qP8N6eq8X1EakLJoYMTtSvAncOQ/Pfld6LZYGLFvLMuv0C39/WqPw0YUjbNdeuVHxf+wotMnS3DA2Z8pRsM9UjqIaMqp4u5cOBEI5Cb2wpcu6feq6GVxHsAZrYPin+BoWMLTIab8Cskde+z/TL1OYWh2+fHM98Bh7ZUk1hNhe0hP52Ij18fOMrjrl+TJ/ZYOsyaPoG5h+W57ne+Qq0Kx7osCJRDNGdhIisHggD1Kbbz5y3RMVAZQxiBtEX2KaaPwbX4oXSg22+W1EkXvcjfa6inS1nVEtwH34/2FtH6ZRjSKoAO+ILW6Atm9bix1PHeyUSBYqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLul3j4Q5ivHsHWEuK4asWxokSHUadCH/k73hY1MG9Q=;
 b=ZwrGgVyoJHOlRVgL4NSmBr5UpkatO/lpvgmAB1GXqa6ZwMU4P4s8K/cOU3w8hHOkR3jorToOSHXI/7N1G6qrwcYbVvk5bDNK2NgJc9j9rS4NG0uJUC2evbOQJ6ba/e/f/+Ecbz9R9Mdo34LuwAJcPYAVHeh65Su5sKdmbc/Y3jHf/nKlvO/65eHoFxUQyWMyCAKQ4O6BuRlIL4Rzw3RteZ38cqu27X6AtyWVBokFUSyaZdnFYR1Qtev1Gxdpbt+SmO3q64vn/+Je1jvNhuN+4qzMA7/7UkGY32yBrMhymjC/AlYWNMzGPhonUI8pYBNnMTfQ6FFuUwRV3H8uqzpsMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLul3j4Q5ivHsHWEuK4asWxokSHUadCH/k73hY1MG9Q=;
 b=R0jFezE7M48UJD3BWhn/GaJVXY4P3sLv+29pPPKOjV9IGmfU9Ttzduli7MM4eNYaP2gs+20f9BO77qsP8y9liQ6PxiULGkvBkBzkg8JgRQM9DXih67/PNP9NmL+0VoRunNNXkSGQVV9NnWpyyz2zyCPU/jamOGVzkFBbVV+I3Ug=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8526.eurprd04.prod.outlook.com (2603:10a6:102:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 25 Nov
 2022 09:11:35 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857%3]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 09:11:35 +0000
From:   "G.N. Zhou" <guoniu.zhou@nxp.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "hugues.fruchet@st.com" <hugues.fruchet@st.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [EXT] Re: [PATCH v2] media: ov5640: set correct default link
 frequency
Thread-Topic: [EXT] Re: [PATCH v2] media: ov5640: set correct default link
 frequency
Thread-Index: AQHZAKqAzETQ9BtfG06vOaP9vU80j65PV+UAgAACdJA=
Date:   Fri, 25 Nov 2022 09:11:35 +0000
Message-ID: <AS8PR04MB90805C3DEDAB618F5F790869FA0E9@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20221125084832.2857820-1-guoniu.zhou@nxp.com>
 <20221125090216.ailzadkbnziywzhd@uno.localdomain>
In-Reply-To: <20221125090216.ailzadkbnziywzhd@uno.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8526:EE_
x-ms-office365-filtering-correlation-id: e1a47532-9c02-44df-0565-08dacec50d2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qCpGHxpGorwX5EKIZWDD5FwriC2gY7txeybYS2QJFJNewdkQXuRnOi5ZBYyF24v07jvg5EJqsPr2lquNj/Nj3xMgTLn0RLElEeHfpHybp0lE9ZW6riZL3Wzt2huQ9Up28ZGxHpy6ppaWqY6Gcpm2S1HAC9T4Jf4Q6x/DPsFUq28qp+midBmtQeTWdcjI/B6KjPhA7Vwa6yAWOM6jsn4/GP6ZeZ1sNREPqIJKsQ4I/Z+mc0adTECYxAnaqdNym3lVyCwUgDxKu3YxSyxzdDjsMkWpp8LHZ2PA8VjT3ii46DNb1SgpIZor8qhhdyo8BOTuj7kstEMgPuF5vdeUVBYyIWm6vvL7W/KX0UafE8+7ZSfdI/yT1GPS9exBUnlVfLssi8OIKSKQFIzQhvfYxTB/urvBIareSGqT5SS2qRtOIjqCllg6/Dyk1BRvwk+gfFOnZ/gJuWPOBczgA7M12gw5oY5xE+UuQq+mek3K2CjyIn/AzrfGID7Z0BY7OTjzVPY7hD1p+yoT7XB2bPKg+y4GsNbRpiaPHL/+WVm/5XohkvyRfZznBerYjt8amEu4xaDdMZZs1CmPJIYgflwRFgSgFkTBzqsfiEu0yt1TbEK9aCFWwL5WGQMKabtrj6YR5NoAq77hlw/QMsq4krbgectxYMJb8VKOn9YI7OYQX5DBbVzsQXrwE7oniwqmZ+xeTlDDNwDkVCk2CvjiFXws6nTjdQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199015)(86362001)(38100700002)(122000001)(6506007)(53546011)(83380400001)(38070700005)(7696005)(33656002)(316002)(76116006)(66946007)(186003)(9686003)(2906002)(5660300002)(66446008)(64756008)(54906003)(6916009)(478600001)(4326008)(66476007)(52536014)(26005)(8676002)(66556008)(8936002)(55016003)(41300700001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWx5alFCR29QSFdLMk5EdGtLTnBrUVNudEpUNEdvdmNMd3piUzRybmVla1hU?=
 =?utf-8?B?eEFoSVRSNmRzMVNIYjdNcEdiblFMdVZDSHBlL3l5d1o5enVoZWJiQXNoQ2hR?=
 =?utf-8?B?TzVrczlDQW4zRE5tQWJOd2d3THpUbzVtVHVUKzJqTUpUY0JEVkhFcEo3RFpB?=
 =?utf-8?B?Z2FGSlZpZnRLbzZQNUE1MFJ5cFMrV0RXald4Sk9YazdBRjM0dStEcnJ0ZjNJ?=
 =?utf-8?B?TVdnZk12RWE3OWZPZlZlTWE1Sm1nQjkvWmx0ay9pRDBKVFRyb25JdU5helk2?=
 =?utf-8?B?YmVaL2ZnZ2k0dkFRUkpGdHhlN0NQTDM0R01NcEp2NVlhR2RNNERDOWtOV3FC?=
 =?utf-8?B?L3Y0VVdKK3g5OTdDd3puUDVOdjk0d1lzN0JKYmdJOGNEOFlQRWdBaUp2ZE8r?=
 =?utf-8?B?S0NvdHgvTytESjdwTXpGdVFDT2xsY3UvU1FCTmcwaGt1Z1pIeVFQUDFGUEha?=
 =?utf-8?B?RTJiK1p1bnEwci9KOGFtTUpUVWZtUmowSUlOTEVxSmJTUHFsUnhJZDFXTmhu?=
 =?utf-8?B?cW84Tm5QZVFQVzkxei9sMmFiL3RyaEwwaVIvdkh5S25zNERsZDZQMEgvc214?=
 =?utf-8?B?K0ZBQnB6OXJIN0RWVmxmTHJhTXIzbitXM2VySVc0M1B3NGZUaHQ3RFZwM0Ju?=
 =?utf-8?B?cFJ2SWhaZnl1WUhUdWlQMU0yVGx4aXJHMzVzQldqVG44VlAzMzVlQjhzQ0o5?=
 =?utf-8?B?dVQyN1Jyb2hCMFFaZ3B0V0JWVUZSTDRlemEvWkNwZ0tHSWZGYWNkMzdsdjNn?=
 =?utf-8?B?NVZqN0pMeEZTZEk5cUVLb0pFSHNqOU9iR2NyT3JzczNmTE9uZEhOcmZURGJN?=
 =?utf-8?B?WXJMaURhRTNvQUsrMjFmVTMyaGZxQ0Z4VDVYR3YyU0ZKdHRoZ2dVTys1cEla?=
 =?utf-8?B?ZWR2TWlnODlZa0RSMzBZcTZlZzBFMCtQNk1DQlBmZ2ltbzZ2ekFBaXdhQjBW?=
 =?utf-8?B?b3ZldSsrVUJ1TkVESDFhK2NMZFkyaldVak1vRVk1RDlDY1J4cFZkS1BIYlFS?=
 =?utf-8?B?VndBeDVJKzFtSjJmQjhTN0JxYm9ISGU4YUxVVTRSNUI5Sjgxa0ZIcGxCT3lS?=
 =?utf-8?B?STRnOElROTBZQ3F6VG4wNEZKRkJsdVpzWmNLV2JrdWJJcWZhWjFFOVEzSm5w?=
 =?utf-8?B?YThOcVVjSGZwMnQrT0cvMFJvQmZaSHZnV3RySTlSczE1by83d3puaVo2dEdr?=
 =?utf-8?B?MTV1Y08rRFhMb29QN05pdlFZaUxEck04MURmOUxpQzdMcnFBNE95S0ZSMmdI?=
 =?utf-8?B?L2I3dTAzbEorcGY5WDZSb3hjUGMycWc0NmhDRUJsdGZKUGZJemlGaUNYSWZa?=
 =?utf-8?B?NVM1aTlvZTJtQ2t2ZllwK2Z1ZFZyVVRFZnNxelNMaTBCSGVEOXFjcG1pYXhL?=
 =?utf-8?B?UUE2K29kR0lrNWd0c3orNlR5alZ6L3NhNUNXWXRHdTRGYW5IdVordkd6bU5Q?=
 =?utf-8?B?ZEJZangxeG1BRU9kdWg2alIyTjBqbFRqbWwrd3JtVmRVNnRZS2Y0allucXdM?=
 =?utf-8?B?OFNMR3BIZk1wNjFTWG9EUUw2ejFwdmpLbFBQRzBVd29DODcxYTRaOHZtY1lT?=
 =?utf-8?B?eFd2cW5aNHVMNWg0QVR2RXBMVVNRZGlINHhLRng5aUQreUZuY2xLSnRvVndZ?=
 =?utf-8?B?elJHMy9LazM4Z040a1V4N2NFb3ltTlRxbHRrTS9PS0srT2RGUjRGL1JnUDRh?=
 =?utf-8?B?YWw1QVVXbzFUUzNISmVucjF6LzFsQnJUZkFybFhGSlJLQ2ZlQnh1UUpjaUZG?=
 =?utf-8?B?K0tBRWxpZzBLYTRLSE11Q1NNQ2tiNGJDYTBTeFlpT0xNRkNSdGIyUlAzSXVy?=
 =?utf-8?B?bzh3bjAwYzltejBPbHlDU2dJZU03VWRwN1hseEh1SCs5Q0haZkFFMGVLbGJn?=
 =?utf-8?B?ZGZzTjZQSm1oQ0luVHlIcE5UbU0vdklhRStMOTlhbFNIbjMrVExzcDhJV3FH?=
 =?utf-8?B?VGZScERwdmRVWTdYWjNQdzYwdWpNaFRjZCtvT2lLQzFnUzRmS0JiSW5CczVD?=
 =?utf-8?B?bE9WQjZ1Ti9wanB0SXV4S0NyNjR4dEFtNmtJRmNkWlB3ZDRFTHJQWFloRGJv?=
 =?utf-8?B?MnpaS0szdUlxaUVxTVR4dFVCajEzYnBQN0ZvZjNQQjBibytPLzFNQjRYU2tm?=
 =?utf-8?Q?DugVZY7O1wZPpVr7AqPaIQ9f+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a47532-9c02-44df-0565-08dacec50d2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 09:11:35.0524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZXqIVH5kmorIxTPNsEjgkLdz/5T6fnHnFwIjV4zhYI5bmbjvUMfdZ42/ktm/PORFMEbNTWpsNDS01TSG0fV8kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8526
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T2theSwgdGhhbmtzIGFnYWluLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEphY29wbyBNb25kaSA8amFjb3BvQGptb25kaS5vcmc+DQo+IFNlbnQ6IDIwMjLlubQxMeac
iDI15pelIDE3OjAyDQo+IFRvOiBHLk4uIFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+IENj
OiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IHNsb25nZXJiZWFtQGdtYWlsLmNvbTsNCj4g
bWNoZWhhYkBrZXJuZWwub3JnOyBzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOyBodWd1ZXMu
ZnJ1Y2hldEBzdC5jb207DQo+IGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbQ0KPiBT
dWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHYyXSBtZWRpYTogb3Y1NjQwOiBzZXQgY29ycmVjdCBk
ZWZhdWx0IGxpbmsgZnJlcXVlbmN5DQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IEhl
bGxvIGFnYWluDQo+IA0KPiBPbiBGcmksIE5vdiAyNSwgMjAyMiBhdCAwNDo0ODozMlBNICswODAw
LCBHdW9uaXUuemhvdSB3cm90ZToNCj4gPiBjdXJyZW50X2xpbmtfZnJlcSBmaWVsZCBpbiBvdjU2
NDBfZGV2IHN0cnVjdHVyZSBpcyBsaW5rIGZyZXF1ZW5jeSwgbm90DQo+ID4gbGluayBmcmVxdWVu
Y3kgYXJyYXkgaW5kZXgsIHNvIGNvcnJlY3QgaXQuDQo+ID4NCj4gPiBGaXhlczogM2MyODU4OGYz
NWQzICgibWVkaWE6IG92NTY0MDogVXBkYXRlIHBpeGVsX3JhdGUgYW5kIGxpbmtfZnJlcSIpDQo+
ID4NCj4gDQo+IFRoZSBlbXB0eSBsaW5lIG1pZ2h0IGJlIGRyb3BwZWQgd2hlbiBhcHBseWluZyB0
aGUgcGF0Y2ggPw0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUuemhvdSA8Z3Vvbml1Lnpo
b3VAbnhwLmNvbT4NCj4gDQo+IFBsZWFzZSByZXRhaW4gdGhlIHRhZ3MgeW91IHJlY2VpdmUgaW4g
dGhlIG5leHQgdmVyc2lvbiB5b3Ugc2VuZC4NCj4gDQo+IFJlLWFkZGluZyBpdCBoZXJlOg0KPiBB
Y2tlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG9Aam1vbmRpLm9yZz4NCj4gDQo+IFRoYW5rcw0K
PiAgIGoNCj4gDQo+ID4gLS0tDQo+ID4gdjI6DQo+ID4gICAtIENvcnJlY3QgdHlwbyBpc3N1ZShz
L3N0cnVjdHJ1ZS9zdHJ1Y3R1cmUpDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL292
NTY0MC5jIHwgMyArKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0
MC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4gPiBpbmRleCAyZDc0MDM5N2E1ZDQu
LjNmNmQ3MTVlZmE4MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jDQo+ID4gQEAgLTM4MTcsNyAr
MzgxNyw4IEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGll
bnQpDQo+ID4gICAgICAgc2Vuc29yLT5jdXJyZW50X21vZGUgPQ0KPiA+ICAgICAgICAgICAgICAg
Jm92NTY0MF9tb2RlX2RhdGFbT1Y1NjQwX01PREVfVkdBXzY0MF80ODBdOw0KPiA+ICAgICAgIHNl
bnNvci0+bGFzdF9tb2RlID0gc2Vuc29yLT5jdXJyZW50X21vZGU7DQo+ID4gLSAgICAgc2Vuc29y
LT5jdXJyZW50X2xpbmtfZnJlcSA9IE9WNTY0MF9ERUZBVUxUX0xJTktfRlJFUTsNCj4gPiArICAg
ICBzZW5zb3ItPmN1cnJlbnRfbGlua19mcmVxID0NCj4gPiArICAgICAgICAgICAgIG92NTY0MF9j
c2kyX2xpbmtfZnJlcXNbT1Y1NjQwX0RFRkFVTFRfTElOS19GUkVRXTsNCj4gPg0KPiA+ICAgICAg
IHNlbnNvci0+YWVfdGFyZ2V0ID0gNTI7DQo+ID4NCj4gPiAtLQ0KPiA+IDIuMzcuMQ0KPiA+DQo=
