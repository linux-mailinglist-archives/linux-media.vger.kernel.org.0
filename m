Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C2C75C2B7
	for <lists+linux-media@lfdr.de>; Fri, 21 Jul 2023 11:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbjGUJOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jul 2023 05:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjGUJOo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jul 2023 05:14:44 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::627])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E8030DF
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 02:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANCKZMJMdhdze7u2amZ211hT79t/O+y+teKW6m4pusKx4j/XrqW4aw61ZWJ6i2oReCOUoPIhKLqkb7Ou5nLao286/irp/XQbwz+KFPmlq9iVgZHfneUkkZ49fYcXvX/XiLW1v056y1KN6oQ2+39+0ALFjnPpDuxmjxTTaMd1SwdeDmFetBbSnLAHV7CbBCI4q+Oey8FM8emPI6tRwHAfs2u3H/y91kRwBMDH7LNghEZBn/H4EGDVLZTH6vBIrmKbDc4x8FpOiiNZr3UF3FuAh8s56U4lrdlGpczgj21fpeE0ZFDmU7IZqzqCJ/Fjvgea9mCUSetZ66Kv0xkEsUr3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/q/zV6+m8y/8m4muRylehGIfImL0r0/MPf1iy9UMt4=;
 b=no8xtSBkQtwTKMxz/HqXmMejw6ir0EczOwVmofQX/RKYRZbtvIusCE4dhzM7+HNgyF3gLZ2ZzvnKq9wpIpOquIP2UTGg2pv3VJSkQOwqOfh3u47cbVV6UBH+sCgaInrwquO2eCNLFZ4AdPahq/5OLRNJRJTPtu01o707tEys3ZxO6hyU/6jsAULgBwS/AsjN8A8+vc6CK3sNKC1Awsb4eqLbHT2DXQwwVJMrV1y2T4PV7sXRShMlzXoGQHPqYoDBAnGgOZLey616gKPvOe8ZB8+DVm8DIWinZC4ZKOGZ2hhmx6mKI0PqZ7DaSLU8sd0MUqEobhTUBpSl+F3WNsmqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/q/zV6+m8y/8m4muRylehGIfImL0r0/MPf1iy9UMt4=;
 b=Zv9FKztmhBr9pr4a5+EzCQeHg9dmPYdyRvyKny1QAJHJinh3EqWocfrLmP2onjP950c/cOMxrTuj7tX/teBE1lQy+szwMVNg0XULAUUpbDhBmvJkR8JYDgkBYpd/B2+XpBzfI1BouDbzE7ujfwNlHgpb0lhZengVyWXa8moz4e4=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 09:14:21 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d253:6cce:4b4d:ec08]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d253:6cce:4b4d:ec08%3]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 09:14:21 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Alain Volmat <alain.volmat@foss.st.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] media: ov5640: fix vblank unchange issue when work at dvp
 mode
Thread-Topic: [PATCH] media: ov5640: fix vblank unchange issue when work at
 dvp mode
Thread-Index: AQHZuhIxvDEI3x3mF06RFpgwkNLpS6/A+OQAgAEHJgCAAEzggIABol1g
Date:   Fri, 21 Jul 2023 09:14:21 +0000
Message-ID: <AS8PR04MB9080CED7745C8BE1E72944ABFA3FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230719073012.3739998-1-guoniu.zhou@oss.nxp.com>
 <20230719114530.GA1066391@gnbcxd0016.gnb.st.com>
 <AS8PR04MB9080C023F628B0C2A1AB40B1FA3EA@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <20230720080229.GA1077263@gnbcxd0016.gnb.st.com>
In-Reply-To: <20230720080229.GA1077263@gnbcxd0016.gnb.st.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DBBPR04MB7756:EE_
x-ms-office365-filtering-correlation-id: 42e0eee7-a55f-4ec4-b56f-08db89cade7d
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2KPN+IU6IkNCfMDqXdm07o9Qx5BlFz+GS42gQyBRWX/DVSSWiP1at0XWYjN0jZspf3nZDz0e4D7d0g8Af+dpcaNhjcH1nZ5etnqqIQ6iPNBTmppZ6mls5d2dRftyu70RPZLu3aETwemGqmpHCh3/tykIbz2idHWPtDWYNipc/pRIS/TsagWXq2j0Oh/GuPXhyrwusH1u7rJEHZXi7IhLhRGQrVbyc9n2k6VT4cvXVEJGk9XDtlJ/RMAz1+9kFUxe9xzQs6TRFnVONxT0urZKVgs05pNjI7UawFt2KEi33oXxZx8Iu3lNuSULMqQDQSx6nO0Wn/6RDAqnFDLQ1WuoDEYZAozOhMbHb/7Hkc3r8WcaV/3OvbdZVg7NG/iwubXk9jUOavlOjpa9hWokEr7lHzAxfjQHQ9FKEx1k/Z+gr7X2vinA9xP/KetH7pywjoLSJ6XmBvGVNQpLFyTtgs+3/R0Yka+WPs/h7evyQJJy/EpBA3bEDbrcZ30Go815f/jSdC+kV9PrC+XtKZBhaxnjXwGQ26QbRJLjF7J/2dohPaBcidUOCwDWF3jqn/ZTCywLhtkK/cbDqZELNu3mMnjfFlImeopAv0CHgyZDC7Vi+Gus+52leunOaUjtYZmQio2b
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199021)(76116006)(66446008)(66476007)(26005)(186003)(66556008)(316002)(71200400001)(4326008)(66946007)(7696005)(64756008)(41300700001)(53546011)(6506007)(9686003)(5660300002)(54906003)(52536014)(110136005)(8936002)(8676002)(478600001)(83380400001)(2906002)(55016003)(38100700002)(38070700005)(122000001)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzJsT1AwMDVEMU9mYWMzaDQ2S3cyVTMrWjdnQngyeEMyYlByZ2lDbk1tRWxX?=
 =?utf-8?B?VklwUStMOFVaNVJnL0RTbUlYZUg4OWlZbnN0cVlEUHI3NmRmOXR6MXlmL1hI?=
 =?utf-8?B?em5OMGRZSDVsbjBsc2xJSitFTVU0TkZmRkxOK2lpUkw4TlIzRGt0QzRHaWxL?=
 =?utf-8?B?bEVsdEtlV0xwc01rTHZrQU40UmFUMGtSWFVzYUhqN3V5UWtIbmcxeWpIZ01u?=
 =?utf-8?B?UzN5YmUwODZ2dnJVQ21DampFNnFnNUxib2QrMmtNSWhqSVN6V3pteDcrYUY5?=
 =?utf-8?B?enBMMjJrRmFtdExYUUZlWlZJNU9pS0xRODBpelBzd3Rtc3FlYm1GQkhZUC93?=
 =?utf-8?B?eEtGLy9TM3AramUwY0Nwbzhnc01MR0VNVkFIeEs3V0t4TDJpMGZpWEdhY25F?=
 =?utf-8?B?dkgrVXBsejhvUHFQQnpvbUc4ZXY2VnNqTDdsdUNXdU9HRWpXSk4zaFVWNXNa?=
 =?utf-8?B?YUw3dXVUK3BkeFcwamZUZmQzTjl2N1VkdjM0MVBMNFc1SXVud0oxaVZGcU1U?=
 =?utf-8?B?ODEzcGFtTncrVUhzNDBLSFRLSjNJbnB6RmJKei9XL3A5U2k0aVNKZGhWMnZ5?=
 =?utf-8?B?dlo0RUtkc2hsS0JvMVRQVUNtU1hBMCs0V0t5RmdrdFZvTUhwZjFKR1J5bVJk?=
 =?utf-8?B?YjFoS21sVG1XZFVMSEtldHpadmgzek0ySWpWTkZoM21aOWZQczNqR29qV3lz?=
 =?utf-8?B?RnhyaEtIVG1VNlB5dm5oa0dNRzh5eGh6QVMxdlRtaWRmK0k1WHF4RlJ3Zkxk?=
 =?utf-8?B?eEp4M2NFd2FUNHg4Sjd5NFJtdzlteFNQejIyVzVHbzNxdHdISDJuWXJpbTNr?=
 =?utf-8?B?d21kNG5qWlRpM00yOUtTZlV6ZHlCSm9DWkY0Mm1mcStvZmVFbmY3Qms3QUJ6?=
 =?utf-8?B?RkxYRTlWVzdUSytrRUszeEhvanNnd0RWZ283MXZIMGNYWGM0S3kxamhzUlFS?=
 =?utf-8?B?NVpXVkFicVJEYVdoV1JpTDU2QkdaZFhaSEJmUUx4cVJHWUo0SDdTODNlbEJI?=
 =?utf-8?B?dVgybEdINExtcExnZUx1MDhrTWNZaC9yRUVRdXJEZHpuTlB0OXkzcWNhbFdI?=
 =?utf-8?B?TVlsMklMd0Y4ekh6QmRnZCtwK05Jb1phK1I4MTUrYXR0WTNXOXAxTWsvRjAz?=
 =?utf-8?B?QnlCT1ZDYStEdTEyREVUZkxPUnRVOUFwUnBZbERtbXJIUzBrYXgydFBFQmxD?=
 =?utf-8?B?c3MzMnUwWS9LdUwzcUVCM21lbW1Zell1L1dnRXhja0M0aEJGYXlHT3dBTjh4?=
 =?utf-8?B?SzVBZGo2ZE1tUlJ2b09ZVkFuTk9OMWNraTQ2UXJYNmJYT0NJQWdMTVMrbFRT?=
 =?utf-8?B?eTJpS1JueW1rTDB6bU9sS2lrYWg5Z1JhNWxlUjFRRjVqMVJ1aDJIMXNGeG1p?=
 =?utf-8?B?T1d2a3lUSVJtcW40VjY4Tkk1R3hSVjNYWEQ2TmllSm8wL1lIL05vUlAvUTVa?=
 =?utf-8?B?ZTNhWWphckMyS3dwUjNNd0VaQ0ZmT2ZDNTZ0TVJEOXRvMFNFeVFTOHhUY2Ji?=
 =?utf-8?B?aVNOWmd2TjltRW1PVWt2ak1wOFdRUVFXZVAzazBSWHp5aVN6dlhBWm1vV1dS?=
 =?utf-8?B?U0ZYdWJKaUZhanMzNEMzR0pweXdXL1pVdGxsMWJ1RXg4MlY2dUE4YmJXMkRR?=
 =?utf-8?B?UkQwZFpNcG9Qck93SDBuSkRtWDZtUndGTWt5TEZkYXZzZmxZMzl1NWlxck1i?=
 =?utf-8?B?RitSbHpCUDYwMEdwTlU4b0NCYmFZUWxBVUN4RUxWUHFENWlxeTNnTElSOUQx?=
 =?utf-8?B?WXRKVU5RL1Z5WmVHSzZ2dW1lZm5UNUsxUDVDbUU0ZlBib1p4S3NsWVlvRnRW?=
 =?utf-8?B?YXMyUmkvZnhFKzR2TWJhWTEwS3pIQ0Rsa1hsMXB5cDlEa2p1TzQ0NU9hKzIr?=
 =?utf-8?B?dmtKRjVaT3Y4ZE1iZWNKNUoxNlZtUlNzYjd1RjQrZ0oyeklZZWZMYTBxbEJs?=
 =?utf-8?B?dlFzYVdabFpyUFdLMUhndU5RYzFyTWlxSXRnVVRPa0xpMmlrOFFvUlJ6YW1W?=
 =?utf-8?B?b3JBUnJyMjIraWUySkVwWGFHM0lZamVneEh0cXZ5TGZEaDdrQUJJMldQMWli?=
 =?utf-8?B?RUV3UXZWekt4K1VKWVF2cWJHYTBxQXI3K0hHbWErR3BGdXFkYTA4cWxwK0pa?=
 =?utf-8?Q?RLP2mRMmnDwsIgCTq6PQh/9Wx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e0eee7-a55f-4ec4-b56f-08db89cade7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 09:14:21.2237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uma1O0esJpoS74gjhMIfI4s78JcAuPfUhkM2ruBaXvfczs6YpS5HLSr6o63OfWp0Ot1SPHjsUfJNxzlbpAAHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQWxhaW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxhaW4g
Vm9sbWF0IDxhbGFpbi52b2xtYXRAZm9zcy5zdC5jb20+DQo+IFNlbnQ6IDIwMjPlubQ35pyIMjDm
l6UgMTY6MDINCj4gVG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+
DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IG1jaGVoYWJAa2VybmVsLm9yZzsN
Cj4gc2xvbmdlcmJlYW1AZ21haWwuY29tOyBzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOw0K
PiBqYWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNvbTsgbGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIG1lZGlhOiBvdjU2NDA6IGZpeCB2Ymxh
bmsgdW5jaGFuZ2UgaXNzdWUgd2hlbiB3b3JrIGF0DQo+IGR2cCBtb2RlDQo+IA0KPiBDYXV0aW9u
OiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tp
bmcgbGlua3Mgb3Igb3BlbmluZw0KPiBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0
IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1haWwnDQo+IGJ1dHRvbg0KPiAN
Cj4gDQo+IEhpIEd1b25pdSwNCj4gDQo+IE9uIFRodSwgSnVsIDIwLCAyMDIzIGF0IDAzOjI3OjIw
QU0gKzAwMDAsIEcuTi4gWmhvdSAoT1NTKSB3cm90ZToNCj4gPiBIaSBBbGFpbiwNCj4gPg0KPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEFsYWluIFZvbG1hdCA8
YWxhaW4udm9sbWF0QGZvc3Muc3QuY29tPg0KPiA+ID4gU2VudDogMjAyM+W5tDfmnIgxOeaXpSAx
OTo0Ng0KPiA+ID4gVG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+
DQo+ID4gPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBtY2hlaGFiQGtlcm5lbC5v
cmc7DQo+ID4gPiBzbG9uZ2VyYmVhbUBnbWFpbC5jb207IHNha2FyaS5haWx1c0BsaW51eC5pbnRl
bC5jb207DQo+ID4gPiBqYWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNvbTsgbGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBtZWRpYTog
b3Y1NjQwOiBmaXggdmJsYW5rIHVuY2hhbmdlIGlzc3VlIHdoZW4NCj4gPiA+IHdvcmsgYXQgZHZw
IG1vZGUNCj4gPiA+DQo+ID4gPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQ
bGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcNCj4gPiA+IGxpbmtzIG9yIG9wZW5pbmcgYXR0
YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUNCj4g
J1JlcG9ydCB0aGlzIGVtYWlsJw0KPiA+ID4gYnV0dG9uDQo+ID4gPg0KPiA+ID4NCj4gPiA+IEhp
IEd1b25pdSwNCj4gPiA+DQo+ID4gPiBJIGNhbWUgdXAgdG8gdGhlIHNhbWUgY29uY2x1c2lvbiBh
Ym91dCB3cm9uZyB2Ymxhbmsgd2hlbiB0cnlpbmcgdG8NCj4gPiA+IG1ha2UgdGhlDQo+ID4gPiBP
VjU2NDAgd29yayBpbiBEVlAgbW9kZSBzbyBJIGFncmVlIGFib3V0IHRoaXMgbW9kaWZpY2F0aW9u
Lg0KPiA+ID4NCj4gPiA+IEhvd2V2ZXIgSSB0aGluayBvdGhlciBjdHJscyBhbHNvIGhhdmUgdGhl
IHNhbWUgaXNzdWUsIGF0IGxlYXN0DQo+ID4gPiBleHBvc3VyZS4gIEkgYW0gd29uZGVyaW5nIGlm
IHdlIHNob3VsZCBrZWVwIHRoZSBzcGxpdHRlZCBjb2RlIGFzDQo+ID4gPiBjdXJyZW50bHkgYW5k
IGFkZCBiYWNrIHRoZSBtaXNzaW5nIGN0cmwgaW4gdGhlIERWUCBtb2RlIHBhdGggb3IgcmV3b3Jr
IGNvZGUNCj4gdG8gYXBwbHkgY3RybCBpbiBib3RoIG1vZGVzID8NCj4gPiA+IEJhc2ljYWxseSBs
aW5rX2ZyZXEgLyBwaXhlbHJhdGUgaGFuZGxpbmcgZGlmZmVyIGJldHdlZW4gRFZQIGFuZCBNSVBJ
DQo+ID4gPiBidXQgaXQgc2hvdWxkIGJlIHNhbWUgaGFuZGxpbmcgZm9yIG90aGVyIGN0cmxzIEkg
dGhpbmsuDQo+ID4NCj4gPiBBcyB5b3Uga25vdywgdGhlIHBhdGNoIGlzIGZvciBWQkxBTksgY29u
dHJvbCBhZGRlZCBpbiAiIGJjZTkzYjgyN2RlNg0KPiAoIm1lZGlhOiBvdjU2NDA6IEFkZCBWQkxB
TksgY29udHJvbCIpIiBhbmQgSSBwcmVmZXIgYW5kIGZvbGxvdyAib25lIHBhdGNoIGRvDQo+IG9u
ZSB0aGluZyIgcnVsZS4NCj4gDQo+IFRoZSBleHBvc3VyZSBjb250cm9sIGhhcyB0byBiZSB1cGRh
dGVkIGZvbGxvd2luZyBhIFZCTEFOSyB1cGRhdGUuDQo+IFRoaXMgaXMgZXhwbGFpbmVkIGluIHRo
ZSBjb21taXQgeW91IGFyZSBmaXhpbmcuICBTbyBJIHRoaW5rIHRoYXQgeW91ciBmaXggc2hvdWxk
IG5vdA0KPiBvbmx5IGFkZCB0aGUgdXBkYXRlIG9mIHRoZSB2YmxhbmsgYnV0IGFsc28gdXBkYXRl
IHRoZSBleHBvc3VyZSB2YWx1ZS4gIFlvdSBjYW4NCj4gaGF2ZSBhIGxvb2sgYXQgdGhlIGNvbW1p
dCBiY2U5M2I4MjdkZTYgKCJtZWRpYTogb3Y1NjQwOiBBZGQgVkJMQU5LDQo+IGNvbnRyb2wiKSBl
c3BlY2lhbGx5IHRoZSB1cGRhdGUgcGFydCBpbiB0aGUgb3Y1NjQwX3VwZGF0ZV9waXhlbF9yYXRl
IGZ1bmN0aW9uLg0KPiANCj4gV2hpbGUgaXQgbWlnaHQgbm90IGJlIHRoZSBtb3N0IGJlYXV0aWZ1
bCB3YXkgdG8gZG8gaXQsIHByb2JhYmx5IGEgc2ltcGxlIGdvdG8gYW5kDQo+IGEgbGFiZWwgY291
bGQgYWxzbyBkbyB0aGUgdHJpY2suDQoNCldoZW4gdXBkYXRlIFZCTEFOSyBjb250cm9sIHZhbHVl
LCBhY3R1YWxseSwgaXQgZG9lcy4NCg0KX192NGwyX2N0cmxfc19jdHJsKHNlbnNvci0+Y3RybHMu
dmJsYW5rLCB2YmxhbmspOw0KICAgQ2FsbCBvdjU2NDBfc19jdHJsKCkNCiAgICAgIGNhc2UgVjRM
Ml9DSURfVkJMQU5LOg0KICAgICAgICAgIC8qIFVwZGF0ZSB0aGUgZXhwb3N1cmUgcmFuZ2UgdG8g
dGhlIG5ld2x5IHByb2dyYW1tZWQgdmJsYW5rLiAqLw0KCQkgIHRpbWluZ3MgPSBvdjU2NDBfdGlt
aW5ncyhzZW5zb3IsIG1vZGUpOw0KCQkgIGV4cF9tYXggPSBtb2RlLT5oZWlnaHQgKyBjdHJsLT52
YWwgLSA0Ow0KCQkgIF9fdjRsMl9jdHJsX21vZGlmeV9yYW5nZShzZW5zb3ItPmN0cmxzLmV4cG9z
dXJlLA0KICAgICAgICAgICAgICAgICAgICAgICAgIAkJc2Vuc29yLT5jdHJscy5leHBvc3VyZS0+
bWluaW11bSwNCiAgICAgICAgICAgICAgICAgICAgICAgIAkJCWV4cF9tYXgsIHNlbnNvci0+Y3Ry
bHMuZXhwb3N1cmUtPnN0ZXAsDQogICAgICAgICAgICAgICAgICAgICAgICAgCQl0aW1pbmdzLT52
YmxhbmtfZGVmKTsNCg0KPiANCj4gICAgICAgICBpZiAoIW92NTY0MF9pc19jc2kyKHNlbnNvcikp
IHsNCj4gICAgICAgICAgICAgICAgIF9fdjRsMl9jdHJsX3NfY3RybF9pbnQ2NChzZW5zb3ItPmN0
cmxzLnBpeGVsX3JhdGUsDQo+IA0KPiBvdjU2NDBfY2FsY19waXhlbF9yYXRlKHNlbnNvcikpOw0K
PiANCj4gICAgICAgICAgICAgICAgIGdvdG8gdXBkYXRlX2N0cmxzOw0KPiAgICAgICAgIH0NCj4g
DQo+ICguLi4pDQo+IA0KPiB1cGRhdGVfY3RybHM6DQo+ICAgICAgICAgdmJsYW5rID0gdGltaW5n
cy0+dmJsYW5rX2RlZjsNCj4gICAgICAgICBfX3Y0bDJfY3RybF9tb2RpZnlfcmFuZ2Uoc2Vuc29y
LT5jdHJscy52YmxhbmssDQo+IE9WNTY0MF9NSU5fVkJMQU5LLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBPVjU2NDBfTUFYX1ZUUyAtIG1vZGUtPmhlaWdodCwgMSwNCj4gdmJs
YW5rKTsNCj4gICAgICAgICBfX3Y0bDJfY3RybF9zX2N0cmwoc2Vuc29yLT5jdHJscy52Ymxhbmss
IHZibGFuayk7DQo+IA0KPiAgICAgICAgIGV4cG9zdXJlX21heCA9IHRpbWluZ3MtPmNyb3AuaGVp
Z2h0ICsgdmJsYW5rIC0gNDsNCj4gICAgICAgICBleHBvc3VyZV92YWwgPSBjbGFtcF90KHMzMiwg
c2Vuc29yLT5jdHJscy5leHBvc3VyZS0+dmFsLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2Vuc29yLT5jdHJscy5leHBvc3VyZS0+bWluaW11bSwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGV4cG9zdXJlX21heCk7DQo+IA0KPiAoLi4uKQ0KPiANCj4gUmVnYXJk
cywNCj4gQWxhaW4NCj4gDQo+ID4NCj4gPiA+DQo+ID4gPiBSZWdhcmRzLA0KPiA+ID4gQWxhaW4N
Cj4gPiA+DQo+ID4gPiBPbiBXZWQsIEp1bCAxOSwgMjAyMyBhdCAwMzozMDoxMlBNICswODAwLCBn
dW9uaXUuemhvdUBvc3MubnhwLmNvbQ0KPiB3cm90ZToNCj4gPiA+ID4gRnJvbTogIkd1b25pdS56
aG91IiA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIHZhbHVlIG9m
IFY0TDJfQ0lEX1ZCTEFOSyBjb250cm9sIGlzIGluaXRpYWxpemVkIHRvIGRlZmF1bHQNCj4gPiA+
ID4gdmJsYW5rIHZhbHVlIG9mIDY0MHg0ODAgd2hlbiBkcml2ZXIgcHJvYmUuIFdoZW4gT1Y1NjQw
IHdvcmsgYXQgRFZQDQo+ID4gPiA+IG1vZGUsIHRoZSBjb250cm9sIHZhbHVlIHdvbid0IHVwZGF0
ZSBhbmQgbGVhZCB0byBzZW5zb3IgY2FuJ3QNCj4gPiA+ID4gb3V0cHV0IGRhdGEgaWYgdGhlIHJl
c29sdXRpb24gcmVtYWluIHRoZSBzYW1lIGFzIGxhc3QgdGltZSBzaW5jZQ0KPiA+ID4gPiBpbmNv
cnJlY3QgdG90YWwgdmVydGljYWwgc2l6ZS4gU28gdXBkYXRlIGl0IHdoZW4gdGhlcmUgaXMgYSBu
ZXcgdmFsdWUgYXBwbGllZC4NCj4gPiA+ID4NCj4gPiA+ID4gRml4ZXM6IGJjZTkzYjgyN2RlNiAo
Im1lZGlhOiBvdjU2NDA6IEFkZCBWQkxBTksgY29udHJvbCIpDQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEd1b25pdS56aG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+
ID4gIGRyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIHwgMTkgKysrKysrKysrKysrKystLS0tLQ0K
PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAu
Yw0KPiA+ID4gPiBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIGluZGV4IDM2YjUwOTcxNGM4
Yy4uMmY3NDJmNWY5NWZkDQo+ID4gPiA+IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21l
ZGlhL2kyYy9vdjU2NDAuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAu
Yw0KPiA+ID4gPiBAQCAtMjg1NCwxMiArMjg1NCwyMiBAQCBzdGF0aWMgaW50IG92NTY0MF90cnlf
Zm10X2ludGVybmFsKHN0cnVjdA0KPiA+ID4gdjRsMl9zdWJkZXYgKnNkLA0KPiA+ID4gPiAgICAg
ICByZXR1cm4gMDsNCj4gPiA+ID4gIH0NCj4gPiA+ID4NCj4gPiA+ID4gK3N0YXRpYyB2b2lkIF9f
djRsMl9jdHJsX3ZibGFua191cGRhdGUoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwNCj4gPiA+
ID4gK3UzMg0KPiA+ID4gPiArdmJsYW5rKSB7DQo+ID4gPiA+ICsgICAgIGNvbnN0IHN0cnVjdCBv
djU2NDBfbW9kZV9pbmZvICptb2RlID0gc2Vuc29yLT5jdXJyZW50X21vZGU7DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gKyAgICAgX192NGwyX2N0cmxfbW9kaWZ5X3JhbmdlKHNlbnNvci0+Y3RybHMudmJs
YW5rLA0KPiA+ID4gT1Y1NjQwX01JTl9WQkxBTkssDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBPVjU2NDBfTUFYX1ZUUyAtIG1vZGUtPmhlaWdodCwNCj4gMSwNCj4gPiA+
ID4gKyB2YmxhbmspOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgIF9fdjRsMl9jdHJsX3NfY3Ry
bChzZW5zb3ItPmN0cmxzLnZibGFuaywgdmJsYW5rKTsgfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICBz
dGF0aWMgaW50IG92NTY0MF91cGRhdGVfcGl4ZWxfcmF0ZShzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vu
c29yKSAgew0KPiA+ID4gPiAgICAgICBjb25zdCBzdHJ1Y3Qgb3Y1NjQwX21vZGVfaW5mbyAqbW9k
ZSA9IHNlbnNvci0+Y3VycmVudF9tb2RlOw0KPiA+ID4gPiAgICAgICBlbnVtIG92NTY0MF9waXhl
bF9yYXRlX2lkIHBpeGVsX3JhdGVfaWQgPSBtb2RlLT5waXhlbF9yYXRlOw0KPiA+ID4gPiAgICAg
ICBzdHJ1Y3QgdjRsMl9tYnVzX2ZyYW1lZm10ICpmbXQgPSAmc2Vuc29yLT5mbXQ7DQo+ID4gPiA+
IC0gICAgIGNvbnN0IHN0cnVjdCBvdjU2NDBfdGltaW5ncyAqdGltaW5nczsNCj4gPiA+ID4gKyAg
ICAgY29uc3Qgc3RydWN0IG92NTY0MF90aW1pbmdzICp0aW1pbmdzID0NCj4gPiA+ID4gKyBvdjU2
NDBfdGltaW5ncyhzZW5zb3IsIG1vZGUpOw0KPiA+ID4gPiAgICAgICBzMzIgZXhwb3N1cmVfdmFs
LCBleHBvc3VyZV9tYXg7DQo+ID4gPiA+ICAgICAgIHVuc2lnbmVkIGludCBoYmxhbms7DQo+ID4g
PiA+ICAgICAgIHVuc2lnbmVkIGludCBpID0gMDsNCj4gPiA+ID4gQEAgLTI4NzgsNiArMjg4OCw4
IEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3VwZGF0ZV9waXhlbF9yYXRlKHN0cnVjdA0KPiA+ID4gb3Y1
NjQwX2RldiAqc2Vuc29yKQ0KPiA+ID4gPiAgICAgICAgICAgICAgIF9fdjRsMl9jdHJsX3NfY3Ry
bF9pbnQ2NChzZW5zb3ItPmN0cmxzLnBpeGVsX3JhdGUsDQo+ID4gPiA+DQo+ID4gPiA+IG92NTY0
MF9jYWxjX3BpeGVsX3JhdGUoc2Vuc29yKSk7DQo+ID4gPiA+DQo+ID4gPiA+ICsgICAgICAgICAg
ICAgX192NGwyX2N0cmxfdmJsYW5rX3VwZGF0ZShzZW5zb3IsDQo+ID4gPiA+ICsgdGltaW5ncy0+
dmJsYW5rX2RlZik7DQo+ID4gPiA+ICsNCj4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gMDsN
Cj4gPiA+ID4gICAgICAgfQ0KPiA+ID4gPg0KPiA+ID4gPiBAQCAtMjkyMCwxNSArMjkzMiwxMiBA
QCBzdGF0aWMgaW50IG92NTY0MF91cGRhdGVfcGl4ZWxfcmF0ZShzdHJ1Y3QNCj4gPiA+IG92NTY0
MF9kZXYgKnNlbnNvcikNCj4gPiA+ID4gICAgICAgX192NGwyX2N0cmxfc19jdHJsX2ludDY0KHNl
bnNvci0+Y3RybHMucGl4ZWxfcmF0ZSwgcGl4ZWxfcmF0ZSk7DQo+ID4gPiA+ICAgICAgIF9fdjRs
Ml9jdHJsX3NfY3RybChzZW5zb3ItPmN0cmxzLmxpbmtfZnJlcSwgaSk7DQo+ID4gPiA+DQo+ID4g
PiA+IC0gICAgIHRpbWluZ3MgPSBvdjU2NDBfdGltaW5ncyhzZW5zb3IsIG1vZGUpOw0KPiA+ID4g
PiAgICAgICBoYmxhbmsgPSB0aW1pbmdzLT5odG90IC0gbW9kZS0+d2lkdGg7DQo+ID4gPiA+ICAg
ICAgIF9fdjRsMl9jdHJsX21vZGlmeV9yYW5nZShzZW5zb3ItPmN0cmxzLmhibGFuaywNCj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhibGFuaywgaGJsYW5rLCAxLCBoYmxh
bmspOw0KPiA+ID4gPg0KPiA+ID4gPiAgICAgICB2YmxhbmsgPSB0aW1pbmdzLT52YmxhbmtfZGVm
Ow0KPiA+ID4gPiAtICAgICBfX3Y0bDJfY3RybF9tb2RpZnlfcmFuZ2Uoc2Vuc29yLT5jdHJscy52
YmxhbmssDQo+ID4gPiBPVjU2NDBfTUlOX1ZCTEFOSywNCj4gPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIE9WNTY0MF9NQVhfVlRTIC0gbW9kZS0+aGVpZ2h0LCAxLA0KPiA+ID4g
dmJsYW5rKTsNCj4gPiA+ID4gLSAgICAgX192NGwyX2N0cmxfc19jdHJsKHNlbnNvci0+Y3RybHMu
dmJsYW5rLCB2YmxhbmspOw0KPiA+ID4gPiArICAgICBfX3Y0bDJfY3RybF92YmxhbmtfdXBkYXRl
KHNlbnNvciwgdmJsYW5rKTsNCj4gPiA+ID4NCj4gPiA+ID4gICAgICAgZXhwb3N1cmVfbWF4ID0g
dGltaW5ncy0+Y3JvcC5oZWlnaHQgKyB2YmxhbmsgLSA0Ow0KPiA+ID4gPiAgICAgICBleHBvc3Vy
ZV92YWwgPSBjbGFtcF90KHMzMiwgc2Vuc29yLT5jdHJscy5leHBvc3VyZS0+dmFsLA0KPiA+ID4g
PiAtLQ0KPiA+ID4gPiAyLjM3LjENCj4gPiA+ID4NCg==
