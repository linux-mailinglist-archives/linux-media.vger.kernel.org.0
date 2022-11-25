Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB1C638553
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 09:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiKYIg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 03:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiKYIgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 03:36:46 -0500
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2069.outbound.protection.outlook.com [40.107.105.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6DB317CA
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 00:36:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tn1IqClgO6n5aob4eQ8QWRQoLJBZFqyIJtRmQXw2NtsR0SwaAHAo4g/LuqvrS2deBR41sf7im011Ib5rHtQYt5sE5l8Cuda7LqBiP5eGo/Pdwhz9MJZjhh91INuI6usadPvz8oxcr9c4B5ayxF5NxMfcmV4NZZI9LEAwSvZN4klXopNxjw8P2h7poEyEUuaPeyf1rcmB5VnQEh2T4YgnO75+y641U2sKbTGeNmCd/uF3pST0+PraOwO0No1bsFuR+ZTlIchtI4QniSfSNRqbIZpvpjxD/zEHR1JZLLhwFtotKekfUqYiPNjZkwUnaal8aGdCK+HhpoCjSydCnI0CIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljOREuix2Z6jr9VONANWok/NlZyEL1E0VJ1ACJBPJIc=;
 b=W99368SXNnuLbLcgP8CXwwNJmrIU3fmX/ytwe4DVExDyjn6r9KZeUXHPrhl2Warq15ihl2AbcvOtXXbELlanaWSIN7cjhur+Fb1KKit5EWRrP+KRk8B3/Ii3chl/T/4gJjI/05Hxi4ySwk2Hho7SXrYI8mj2xr9MsakDf1z1Q8JSlZBpzmFmfPXI/7mgM+EbfSkPtpQURKG0Fe8aR2bcpPQsLNNKDrw6FAflbrb9nJ/lpfGjsYC+jW+7URC28jaOvAaxI5iPjdDEaIiwFJfbrMYiPBAlciYKt4Opw7CemJ4CInqkhmau7EOEfDvA/OjzKIMZ4fNI1HXlK4QFQvZ/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljOREuix2Z6jr9VONANWok/NlZyEL1E0VJ1ACJBPJIc=;
 b=WHdG9opFqOZotDvXdiQV60oZiAE8oR8OYwjdN1DDkcu6yIEZ5tQeqO4Fo4GJ5V2g5mf7HmVgQPZsuMRWBMBjE/9PW/KJXjir9pqPww3ValOxPz2XMa1KBenNpg8ozv+Ic53nXlMkOifNxIoleP/2ALAyhpJ58IA99OuubWJcQoY=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9282.eurprd04.prod.outlook.com (2603:10a6:10:36e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 08:36:38 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857%3]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 08:36:38 +0000
From:   "G.N. Zhou" <guoniu.zhou@nxp.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "hugues.fruchet@st.com" <hugues.fruchet@st.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [EXT] Re: [PATCH 1/1] media: ov5640: set correct default link
 frequency
Thread-Topic: [EXT] Re: [PATCH 1/1] media: ov5640: set correct default link
 frequency
Thread-Index: AQHZAJhPqF/lQ/uqTEu9SDKjuazKya5PTSQAgAADGLA=
Date:   Fri, 25 Nov 2022 08:36:37 +0000
Message-ID: <AS8PR04MB9080660E62BC84E89DD88D1AFA0E9@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20221125063816.2728786-1-guoniu.zhou@nxp.com>
 <20221125082316.omprnhehasqaaytv@uno.localdomain>
In-Reply-To: <20221125082316.omprnhehasqaaytv@uno.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DB9PR04MB9282:EE_
x-ms-office365-filtering-correlation-id: 2f51c23f-06ad-434a-0e24-08dacec02b35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JigC3RS0aMCRTsDNumBVJL7DcPKo0lhleBbfOmvtLRcqd8QxXSyBrTryuhsTn0ec1R0c1ubX7NqvJNPe4lWmUSsiX7IqXD41uOmuxiLw0yv+WJ61QmqmcB5SkdbCr2LS3FreUChtC8D716QkJl7J/+VKYyT9ft2wDSNO8N2dafJgzOH25DyrRbzhV7njFq5rc+pEwZmZxx0o0j14KJ0jn/mO2PI7Pj70CXmsf05uEEwJ87C+lwKTFv8Jhbc9tZvZ9Eekg6iyWLNsiVI3AOEexl9GDa6nXQSKahOt28dzJqmlMi+eMGRot50mPQb0Bz/mFtNl4OceciohTyrACwuHz+CNMFafWvAbIJEeOHo/MTKz9d+37uo8rBeDhQwV+wYEAMpSM0h4lW6r4tU6lulzzf5vjJ/sbuGkyM5F/ZGERokpuDDCQZwMrUGCKTx1OYV9S1DJxoOyyavWbxuVyo//Nls+LNzGIIz7Y7G0YWatzZ4e65B+6J9+o7M6JP9TA5eQ9PJpl7ojbIkMoy+6d9JTrPHPv6vouHVHafvfCjfoCC340BDHqshAyph8+cGHBmFaDO0embeT2xxi/gCX5QYkYIQobB8qTpcOslqmuE320ePMmnUB54ago3c25xlv9WTmv8qeWrkEB2oiszE0LOPgswuZI6JCHUQ10zpdJ7LLDgMAbZH99aj0D3o30m8/zY9S
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(52536014)(55016003)(41300700001)(5660300002)(76116006)(2906002)(8936002)(66476007)(66556008)(66446008)(8676002)(4326008)(64756008)(66946007)(478600001)(316002)(186003)(38100700002)(33656002)(83380400001)(71200400001)(122000001)(54906003)(6916009)(38070700005)(7696005)(53546011)(9686003)(26005)(6506007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXFacWV5b1FxNXhHMEFYTk9MVFNMNDJxNWw1TEVrdGUwbUxtR1hYUTg0RUp3?=
 =?utf-8?B?RVVuUTNnZTYwOHlXeVdWejlnRHZkeWtHTEVkWXIwN2pVQ0NhR2dIek0rUmlk?=
 =?utf-8?B?WHIyUFU4SjlyTHdKN0lkTElqaXFKdEFiaTZVQ0YvOHg2R0hQeEo1T2VYTlJj?=
 =?utf-8?B?Mkd3VlpidjBZVUxwVlBNd1YraUVtaDVWTlpKQUQvQyt4MFJtZ2kwbFdJaFpm?=
 =?utf-8?B?d3V3aG9FdHRtb2p1VjlkWTd3OThnSDhwRG5GYjhkSkh5UTliWUhZbDdBbkIz?=
 =?utf-8?B?MllSSTcwZzZJWXBGUlRTVFdlckh0eHZEekhGdjRGMnVZbHBwRzliYXo5dFdw?=
 =?utf-8?B?V3JRSGdKbzgwUTBTN2YrSXBPcWJnQWdBSVgxc2crQU5QaU1aTko1dEptY1Nj?=
 =?utf-8?B?UXNJcmhkRDlURUpZaWtrVkRBS3llKy9oOTk3QjZOS0o2QXVIMUpRRFVBaHhE?=
 =?utf-8?B?UHZWWEozckNBMkJ2TmpOb3ZWZGZsS3dyWDc4elZwS2JpNGlYdGJWU3ZJWDVP?=
 =?utf-8?B?bW5vYXVUbkoxOVBpRzdZb3h6ZnNmN1NwWkoxaGpkTy8xNFdOckZKejhTRm5u?=
 =?utf-8?B?ZTBwbVJNK1dLWGZvM3JzY2lURjVreEtYRm1UU2RxS1FnajIrN0xRSy9PdjhX?=
 =?utf-8?B?WnJVeTZjSEdmSUZ2ckdZSzZ4dUhJZ2MrS013RU1MVWtHa0lVYnpGc0dacWI5?=
 =?utf-8?B?OXZHZ1dwNnF5SUNGdG9LdndVbmJJZjJxN2ZWcFJRRWQrSmFMcUhvdXBiUlFJ?=
 =?utf-8?B?aldiVTAyOWloZ0lsVEpKT2ZhMnpkd1NmWU1mOXlvU3pOdDk1d2Q5Z2ZwbVY0?=
 =?utf-8?B?UDQ3OXRkMGhnVURqWWtBYmE4Ynd3WnJTYk1nU1QzalJVVkdEbTg3djdqVm45?=
 =?utf-8?B?aG9pTzc4OHlJNlliMDIxMUVpWXFlRDJZdG11MUdnUWF5YVF0T3h2cW80dDVh?=
 =?utf-8?B?Y0NyTUhhR0loR0ZUc2d2dldOK2ZZNFpMcUgwckxxSGx0WFFqSUU1TzZnOGVv?=
 =?utf-8?B?MFRZOWNpT1Rwb2tsYmJtVlFLcllYc2lDaWpodFRzRDl3VjJhS0poUkZWc2JZ?=
 =?utf-8?B?UWdmYXRjWElrL2thVTNzNFdwZ3pDS2prTkwxd1RnOUlMZ1ZHdXcxNTR0eWpY?=
 =?utf-8?B?dXdVUmV3Wlo2SEFUZHZMOGFLYk9FY0FlTG02REZBd2k1S1V3SmNsK2lMTWVp?=
 =?utf-8?B?aGNkQzlic2prTDF2ZE5IWHh1S0lzYk5PcFYzbHA3NCtmK1ZIV2wzaUovVEV5?=
 =?utf-8?B?V09veUxyRktNZGk0OGhsTkVCc09YdGhXRjJQWWZFRXkwQ0FOdThZSzBWSHIy?=
 =?utf-8?B?VW93RlV4M0ZXNGE0aWpDOFhtZUxzMUVZb1FzUVQ3amFkTlRYaXhhY0g2TGcx?=
 =?utf-8?B?cCs4WlFkSTg1Q2VmTnRkRTgzTlJXcFJqemNUU2FvM3ZsTlRuUzlMQ1pJdU5a?=
 =?utf-8?B?MXRoS1E4eTBDY3JpNmt2eG9FcEJGT2xVWlhQYUhuQVBHdHdGREtOS0lROElm?=
 =?utf-8?B?WHJTTzZRQnBkZ1pUeUExRzF1YjdSbFBITjN0ZXVoRTJwSTZSemxLMUYvTmFJ?=
 =?utf-8?B?RWtaUVUzZ2FUb3pYZC9HaFlLMTNGMnB4K21OTG1YR3dzdWJsbTV4UjJmU3li?=
 =?utf-8?B?RHNucHQveXQzUFg5RTdEQnFEdDZ5bzh4MFFqOFNHR2plMnpoS3c5TjRtRVZv?=
 =?utf-8?B?TFF0L0VFMUsrTUxIWnp1N2NCckJJekx3R2VPWEZUK1U4alhXcG5BUnJESGZi?=
 =?utf-8?B?aXhLNDh6VG8yNVhiNFBvVXVPdDdLUlh1NXFWQ3FpbEFacHV6MEM2bzdrNGhZ?=
 =?utf-8?B?SXFTRWtzTnVHRWpuL21ySHZXOTJtSWFLMmpraDhCdUtCTkZXMzc3WU1KN2lT?=
 =?utf-8?B?MHdZNDFROEZCcGF5WWhDeHVod2p2MXE5Zm9qa2IxUkpheVNvTmZWVy9qUDRI?=
 =?utf-8?B?bHRNMVBQUjcxS0NqcVJTRTkvNEwxcWNjMG1RUEtDMjhzbytCczNBcTR4K28r?=
 =?utf-8?B?dThadStDWU5MMEJ6VU1XSCtFSENrajNSaGpFV0xQbWIya0Z4bzhaWkFGZnY4?=
 =?utf-8?B?elFFTTlKUW9MVm1LdUx3WFkzRjlZeFBFdGtSbEdvZVppWHBINTJzaVNPdk9K?=
 =?utf-8?Q?egfw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f51c23f-06ad-434a-0e24-08dacec02b35
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 08:36:37.9661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FHN/J7KExmpkJ7qjTKrLYTdnceC/rKyFhsT5vFu7g48ioKeQUSaijd6y3FitVcjTPaW9paatLseF+jHiKls3uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9282
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvIE1vbmRpLA0KDQpUaGFua3MgeW91ciByZXBseWluZyBhbmQgSSB3aWxsIGNvcnJl
Y3QgdGhlIHR5cG8uDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFj
b3BvIE1vbmRpIDxqYWNvcG9Aam1vbmRpLm9yZz4NCj4gU2VudDogMjAyMuW5tDEx5pyIMjXml6Ug
MTY6MjMNCj4gVG86IEcuTi4gWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgc2xvbmdlcmJlYW1AZ21haWwuY29tOw0KPiBtY2hlaGFi
QGtlcm5lbC5vcmc7IHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb207IGh1Z3Vlcy5mcnVjaGV0
QHN0LmNvbTsNCj4gbGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tDQo+IFN1YmplY3Q6
IFtFWFRdIFJlOiBbUEFUQ0ggMS8xXSBtZWRpYTogb3Y1NjQwOiBzZXQgY29ycmVjdCBkZWZhdWx0
IGxpbmsgZnJlcXVlbmN5DQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IEhlbGxvIEd1
b25pdSwNCj4gDQo+IE9uIEZyaSwgTm92IDI1LCAyMDIyIGF0IDAyOjM4OjE2UE0gKzA4MDAsIEd1
b25pdS56aG91IHdyb3RlOg0KPiA+IGN1cnJlbnRfbGlua19mcmVxIGZpZWxkIGluIG92NTY0MF9k
ZXYgc3RydWN0cnVlIGlzIGxpbmsgZnJlcXVlbmN5LA0KPiANCj4gcy9zdHJ1Y3RydWUvc3RydWN0
dXJlDQo+IA0KPiA+IG5vdCBsaW5rIGZyZXF1ZW5jeSBhcnJheSBpbmRleCwgc28gY29ycmVjdCBp
dC4NCj4gPg0KPiA+IEZpeGVzOiAzYzI4NTg4ZjM1ZDMgKCJtZWRpYTogb3Y1NjQwOiBVcGRhdGUg
cGl4ZWxfcmF0ZSBhbmQgbGlua19mcmVxIikNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25p
dS56aG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiANCj4gQWgsIHJpZ2h0ISBpdCdzIHRoZSBm
cmVxdWVjeSBub3QgdGhlIGluZGV4DQo+IA0KPiBUaGlzIC1zaG91bGQtIGJlIGhhcm1sZXNzIGFz
IGN1cnJlbnRfbGlua19mcmVxIGlzIHJlLWNhbGN1bGF0ZWQgYW55d2F5IGF0IHRoZSBmaXJzdA0K
PiBzX2ZtdCgpIGJ1dCBpdCdzIGluZGVlZCB3b3J0aCBmaXhpbmcuDQo+IA0KPiBBY2tlZC1ieTog
SmFjb3BvIE1vbmRpIDxqYWNvcG9Aam1vbmRpLm9yZz4NCj4gDQo+IFRoYW5rcw0KPiAgICBqDQo+
IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYyB8IDMgKystDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYyBiL2RyaXZlcnMvbWVkaWEv
aTJjL292NTY0MC5jDQo+ID4gaW5kZXggMmQ3NDAzOTdhNWQ0Li4zZjZkNzE1ZWZhODIgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4gPiArKysgYi9kcml2ZXJz
L21lZGlhL2kyYy9vdjU2NDAuYw0KPiA+IEBAIC0zODE3LDcgKzM4MTcsOCBAQCBzdGF0aWMgaW50
IG92NTY0MF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+ICAgICAgIHNlbnNv
ci0+Y3VycmVudF9tb2RlID0NCj4gPiAgICAgICAgICAgICAgICZvdjU2NDBfbW9kZV9kYXRhW09W
NTY0MF9NT0RFX1ZHQV82NDBfNDgwXTsNCj4gPiAgICAgICBzZW5zb3ItPmxhc3RfbW9kZSA9IHNl
bnNvci0+Y3VycmVudF9tb2RlOw0KPiA+IC0gICAgIHNlbnNvci0+Y3VycmVudF9saW5rX2ZyZXEg
PSBPVjU2NDBfREVGQVVMVF9MSU5LX0ZSRVE7DQo+ID4gKyAgICAgc2Vuc29yLT5jdXJyZW50X2xp
bmtfZnJlcSA9DQo+ID4gKyAgICAgICAgICAgICBvdjU2NDBfY3NpMl9saW5rX2ZyZXFzW09WNTY0
MF9ERUZBVUxUX0xJTktfRlJFUV07DQo+ID4NCj4gPiAgICAgICBzZW5zb3ItPmFlX3RhcmdldCA9
IDUyOw0KPiA+DQo+ID4gLS0NCj4gPiAyLjM3LjENCj4gPg0K
