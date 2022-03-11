Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77EA94D5F20
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 11:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343641AbiCKKIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 05:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347774AbiCKKIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 05:08:00 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45351BE4E9;
        Fri, 11 Mar 2022 02:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+0VWKdAztiYaQXIhnnBnL4QYY1wp0ObUZzf/7/xOs52Aa0wWDOjuUoKXSzaN/RMMkN83SZkARAg0XLAYEB8e7wNNVJUq6JtEzM+YzJfy2DF1SKkox3j+3JOXt/kN57S1UP5PL/3g0O2RuVvKWACwD/FGmCEPvR22NPWwdjd8LdZG9wIhFflb1KhhcihwvdNxWg6hsnGB423XE9vRPTY8o8Qz6Xk73T0OAmcqjTGD/3DeoNKSl8jeaah1GgE/erqmWkkthRExIn0LG5xCwmrBDHF6sXQdknfjffoJOTf2DBey06ANNOHYTsqHND3fSe96Co7g1wei4V9TiadCJwbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf378O2pWKKzU0qMjxKQHTXzxCeqg7z9J530C4I171Y=;
 b=WxANf5aI+3n+QJlVhX+k9i9CqEY5EIvm2Nte+CpXj7blgnRsGlWgrSefM/XnDcKdfgvroH8BKE9bV0k6z0qwI6OE2kEqFdtdtaygwulBgWlDfJRIx1EGcgCYT/pPTn55R/lZamunpQu5CDLRwqvUv+fdrPhtNQ/W3PruR1b3Xqu6nVMHj8scAbQxSsvGLCPAeM+OwxwVW97PqdP14ZwHu86NHGEtYfOjSO9eh484ZUgIITUGOLbpc5xhb9NmlZxbPiY0m2dldfIkYB+xHsZycoLz89hDcmGjEhfF9JNMDGkSn/oLq5RdoPYSO4BjXuqW2t/T3Ucia8c0cBTlNnLR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf378O2pWKKzU0qMjxKQHTXzxCeqg7z9J530C4I171Y=;
 b=Okmp7Yef17ZOd2zuOPz7cvPlGmzSvcIp5996Q0ouN/GSCXsLjUEGhGedgeiMc2SEs+DxjcPpnCUlxFInm0zBs24mgZcNryX0NxIty1wEoTOThHCsK9AXFOPeF9Z0DFr+9NzvdrbEOps29HXWNY8upno7ktzYH627QPt+y6GBNhA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3733.jpnprd01.prod.outlook.com (2603:1096:604:4b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 11 Mar
 2022 10:06:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.029; Fri, 11 Mar 2022
 10:06:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH v2 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYNJvgdtUhxWezu0qyvkM9qR6kyay589WAgAACI9A=
Date:   Fri, 11 Mar 2022 10:06:54 +0000
Message-ID: <OS0PR01MB5922ADB94F32296B2F224214860C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220310162814.22234-1-biju.das.jz@bp.renesas.com>
 <20220310162814.22234-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdU4K3xJE=q4-yS+UOefvP4FT6U1uQQ1ig1S8QnwDYr_HQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU4K3xJE=q4-yS+UOefvP4FT6U1uQQ1ig1S8QnwDYr_HQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9aae1de5-aede-48c8-46b4-08da0346de74
x-ms-traffictypediagnostic: OSBPR01MB3733:EE_
x-microsoft-antispam-prvs: <OSBPR01MB3733C6A170FD28156D1F494E860C9@OSBPR01MB3733.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iNKHyqXjHpcNU+UV3I0W+pGuBnUQBOGiUV8wO0p2RbsWOqgagANl8pr8VWqGxEAATkaMZCgvlnsrfqiN7Hz/45wmGhyP/bROCF4Np4xd2Mlg8yx0tYBE8QhDQrWXWcb1V3oXvq7fifyfki0hxB0NR655F97NiQXZabxj6zGNqvYYMyEZ1hlQ19b/YW4ZyGPIyANvMFPS1+8rCYxszoeoZUwUdN2njpzJY3l1KAmWpIwfvSbEMfYLMEdEeUi/yrcJT539Pufxn9Ggh3F92/4Wk4rkoYCLTsWKo7YsAxaJQ5AH03e131ccndCRTBgMUsjN80Oc3FQfoGV17sIEAW1oATalId20v+HbuO/l4jooGcRN7FugPc+shaaS9/lCfmrRPCzW+p6KENqvQHM3CQaAwKqufRLm7/Txm+pA/il/c7FFXQRTpJurjf1VcDv+OQbRGea5lCOLCbE79XzDY+8SqNwhVYWLJbKhely2og5PfHs8bC22lkc22e9BFvgpwm7EvU1LfdaXIsLB9ZJit1LzZK+NZbtR+gts620yjlrykfmN6V2y74Nc9ULDEQ3UvVwTolYuIUFvnWlsHANeqiQz76JDuAbflIQe++bkCbuQI7WTHEPHSNf3zal6FjSRvBY5JnQwEmecZPTmO1UA51U4ZkqLF3iq1kRtAzoOY5JaJdwfIle7hl4VC8DKgpQArDW9IFjfqPgUw+Z8hY7lZbH4vQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(508600001)(64756008)(9686003)(66476007)(107886003)(6506007)(83380400001)(66556008)(66946007)(66446008)(38100700002)(316002)(53546011)(26005)(6916009)(33656002)(76116006)(122000001)(5660300002)(186003)(86362001)(55016003)(8676002)(54906003)(7696005)(8936002)(52536014)(71200400001)(4326008)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUd2M2hRMmtTaVlmSXl0WkwyKzdoYUxNVlVEcXVra1NCT1B5V1JlZERMd2xw?=
 =?utf-8?B?MjVvMmNYdTFFWEZ6dFlyV01RdnZTRFZzWnIwQUxDNFRhUUhoc2diYUlHZUZr?=
 =?utf-8?B?MFdRM2tsVFNNclNsd0xLaXRhRFVrM0hYS1hDK0swSU5nejJTZElCWDh3cE1N?=
 =?utf-8?B?dDZXTnVsRlRRYkgxTEF1VXRxQlFyVlp4Z3VsNkpMMXhaNW9FdjJ5WnBLbWZn?=
 =?utf-8?B?K3BvYTlrNGd2WHdCRzhGUHh3UWJHbVNueVhEUWxVazU2WEE3SSt6N2dYdXEr?=
 =?utf-8?B?WkZsUUV5UDI2S0k4amVCRDVzMWdGd2ZBb0VadUJQVlB3d1pIN0lRK09OcHo0?=
 =?utf-8?B?bm4wT1NoL1NXL2NXSTQ5U1FuYWFxYlVicHpVUGd2WFJ3SWJ4ZlF0ZENsMmJq?=
 =?utf-8?B?SHloRi9lQ20xRWJaOTNpbHFpZGEzZ0Z2TzRMSVYveFpTVHFKa3BLeEZPZktl?=
 =?utf-8?B?bVlNV0kzaWtLWEp6NUlhSDhlNG1kczg5eGo1dHREellsVmF1Z3N4ZHpJZU8z?=
 =?utf-8?B?T00yRzliNWRoaFZGR0RCUzNPKzhpWVZUdUJkL2ZTRTZRMW5wN1daclB0MGhY?=
 =?utf-8?B?QlBhTUFZUFdhYVloVmVHQmR3bXh1b1ZmdFFkQmQrQVpUeTFSS293aFBIWTM3?=
 =?utf-8?B?alNpQUdqZmlHYjdObVdyQW0vVmdjRHBIMDZEM0Q4dzQzc0VHQ1NxL1BrTWtw?=
 =?utf-8?B?YWpUSXlpZExodDFxSVJ6bTN2cGRUY1lvYzI5NmJ3cEgrcmQrL2xBRW55aDZo?=
 =?utf-8?B?dGtLdlZJK3o3K25HUEVlcE13QlNwcmwxYUwxNzFYWjlOY1ovMkt0RkRhaGE2?=
 =?utf-8?B?aWc2N2tWeWlLMHVma3BlYUEySmo3NnY2RVhid3VxSytVSTFDUFBIOHVJdkVt?=
 =?utf-8?B?VC9XVVVrbTdzejh4Z3orS3QvSDRDNmtHbDlaQkpJeGpYbmRXZnFkUXE2RU9m?=
 =?utf-8?B?d0VsYmk2dE54SDEvOWtqc0k4anl4b0xmZVhRYVdtaXVudlhoUXNmN1ZlS05N?=
 =?utf-8?B?d2lMdVpMQkdHVk1JV0JIUXluQms1SjRDMngreEgwNVRhbUJUM092SWdwSEk3?=
 =?utf-8?B?ZEJkVUVOKy8rc0FzUmIxMllTdk5qbVVGQzU3UzJXa3UvNG8wbHp4dFV6QnA3?=
 =?utf-8?B?ZmMzNXZMcjVDWWd6Y2xvM0ZycTJ4UUlxa0JpZDNOUkhhVHdxS3I3WWFNcmEx?=
 =?utf-8?B?TVNSQkpUNXJjVkFzWFZSRVBGci9kZURGREJTRkV0NTJ0Z3lIb3M5NmtQS09a?=
 =?utf-8?B?VUI4VkxaaUNPc2FBRGgzNG9yQjFhYnVyMmwzRG5FQzBkL29FTXVVOVNhcDhR?=
 =?utf-8?B?c1czQ2phL1FldGRSKzVpclpmQWF0aTB6TzlIOS9UMFh5UjliL3J1dnVnSG1t?=
 =?utf-8?B?ZEtDWUVxTlF4VEdtbjVyNzd0dW5NOENEZWRnOGVzT0RPeW1McGEyWWZNS0dB?=
 =?utf-8?B?RXNsZitreDhkT2lEVHh6QVUwcHdiVTRBTUNOMU5YbElGUmMvclgvM3dvUWho?=
 =?utf-8?B?cmV1K0hSS3FpM2ZIOU5kbHpOaEhPL3JHR29iTnlvV3c0U1V5WkozWXkyaHQ5?=
 =?utf-8?B?R081VGo3eTlBSU5BQ0lPclpGb3g5aE15VythU0E0bHB3cXd3MjJBMnVGYjRS?=
 =?utf-8?B?WkJSOTRQN3JmTjU1aVR1MGRONmh3YmZYZCsxLzcwK1RmNlJqYk1PNGh0ampF?=
 =?utf-8?B?NC9Kdk1wSURjOU9GdlRjUGxuMk90RFIzN3gxaWk2Ni9JZlV3RkkyVDM0QkdT?=
 =?utf-8?B?VDY1YWhGcmdRYjFOVUloQlFSNURmbmJUZ1RaYUtzb3pKckFTSkJYNm5BS0N5?=
 =?utf-8?B?cEs4U1RybnUwcW5mZ0hhblBVcUM3TzRrZnVJNDVVSDUrMlJMQURCd3lHWDc4?=
 =?utf-8?B?VFFBQ0JhRU5uc2FwdCtjaWRMVEN4aHYzWmZ1UXIxUUFwbXd5ei82NVA0UGlC?=
 =?utf-8?B?ZHIyZE9Oa1oxWndnTnpRd1N2L0Y4UzJTaWR5YUZhZ2lzVExDYVRxTCtSMGx5?=
 =?utf-8?B?eHlrUUg4OWZiK094TEJQM3Fla25LRW04aHQ4RHpDR2ZOOHdXL3dPZ1dMSWx0?=
 =?utf-8?B?UXl1eDIwSWFYdWVtQVhDZDNRcmpOTTBSQmNXLytBdHU3dWp6REZyelFlK3VY?=
 =?utf-8?B?RTdDeW9pSXhzRmMreTUxcm5OZUN1azZhZDVDcEUvUnd6ZGdMUW9Pb1RxVCtn?=
 =?utf-8?B?UE5WbCtkTzE0eDlVcjFXdldnZDFPN2M4dGVNRml6UE9jVGVHYlJwVXBzM2Vq?=
 =?utf-8?B?SVhEdTcvMG85SGhQM2NyOUhseUZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aae1de5-aede-48c8-46b4-08da0346de74
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 10:06:54.0477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lh3HvJWHGEoB1TtlL2W4SFrwcJ2lhT4ou/Il07l3Fx9FCW0PL7sxIgYL3aKctoA6V5brH7XWgYrYIQ39HKxfLbkJ4rVqt+QzMC+B9Cf2ZyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3733
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy8zXSBtZWRpYTogdnNwMTogQWRkIHN1cHBvcnQgZm9yIFJaL0cyTCBWU1BEDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXIgMTAsIDIwMjIgYXQgNToyOCBQTSBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBSWi9H
MkwgVlNQRCBwcm92aWRlcyBhIHNpbmdsZSBWU1BEIGluc3RhbmNlLiBJdCBoYXMgdGhlIGZvbGxv
d2luZw0KPiA+IHN1YiBtb2R1bGVzIE1BVSwgQ1RVLCBSUEYsIERQUiwgTFVULCBCUlMsIFdQRiBh
bmQgTElGLg0KPiA+DQo+ID4gVGhlIFZTUEQgYmxvY2sgb24gUlovRzJMIGRvZXMgbm90IGhhdmUg
YSB2ZXJzaW9uIHJlZ2lzdGVyLCBzbyBhZGRlZCBhDQo+ID4gbmV3IGNvbXBhdGlibGUgc3RyaW5n
ICJyZW5lc2FzLHJ6ZzJsLXZzcDIiIHdpdGggYSBkYXRhIHBvaW50ZXINCj4gPiBjb250YWluaW5n
IHRoZSBpbmZvIHN0cnVjdHVyZS4gQWxzbyB0aGUgcmVzZXQgbGluZSBpcyBzaGFyZWQgd2l0aCB0
aGUgRFUNCj4gbW9kdWxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxw
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjEt
PnYyOg0KPiA+ICAqIENoYW5nZWQgdGhlIGNvbXBhdGlibGUgZnJvbSB2c3AyLXJ6ZzJsLT5yemcy
bC12c3AyDQo+ID4gICogQWRkZWQgc3RhbmRhbG9uZSBkZXZpY2UgaW5mbyBmb3IgcnpnMmwtdnNw
Mi4NCj4gPiAgKiBBZGRlZCB2c3AxX2xvb2t1cCBoZWxwZXIgZnVuY3Rpb24uDQo+ID4gICogVXBk
YXRlZCBjb21tZW50cyBmb3IgTElGMCBidWZmZXIgYXR0cmlidXRlIHJlZ2lzdGVyDQo+ID4gICog
VXNlZCBsYXN0IElEIGZvciByemcybC12c3AyLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRl
IQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNwMV9kcnYuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2Rydi5jDQo+ID4gQEAg
LTgxNCwxMSArODE0LDM2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdnNwMV9kZXZpY2VfaW5mbw0K
PiB2c3AxX2RldmljZV9pbmZvc1tdID0gew0KPiA+ICAgICAgICAgfSwNCj4gPiAgfTsNCj4gPg0K
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZzcDFfZGV2aWNlX2luZm8gcnpnMmxfdnNwMl9kZXZp
Y2VfaW5mbyA9IHsNCj4gPiArICAgICAgICAgICAgICAgLnZlcnNpb24gPSBWSTZfSVBfVkVSU0lP
Tl9NT0RFTF9WU1BEX1JaRzJMLA0KPiA+ICsgICAgICAgICAgICAgICAubW9kZWwgPSAiVlNQMi1E
IiwNCj4gPiArICAgICAgICAgICAgICAgLmdlbiA9IDMsDQo+ID4gKyAgICAgICAgICAgICAgIC5m
ZWF0dXJlcyA9IFZTUDFfSEFTX0JSUyB8IFZTUDFfSEFTX1dQRl9WRkxJUCB8DQo+IFZTUDFfSEFT
X0VYVF9ETCwNCj4gPiArICAgICAgICAgICAgICAgLmxpZl9jb3VudCA9IDEsDQo+ID4gKyAgICAg
ICAgICAgICAgIC5ycGZfY291bnQgPSAyLA0KPiA+ICsgICAgICAgICAgICAgICAud3BmX2NvdW50
ID0gMSwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdnNwMV9kZXZp
Y2VfaW5mbyAqdnNwMV9sb29rdXAoc3RydWN0IHZzcDFfZGV2aWNlDQo+ICp2c3AxLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHZlcnNp
b24pIHsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+ICsNCj4gPiArICAgICAgIGZv
ciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZzcDFfZGV2aWNlX2luZm9zKTsgKytpKSB7DQo+ID4g
KyAgICAgICAgICAgICAgIGlmICgodnNwMS0+dmVyc2lvbiAmIFZJNl9JUF9WRVJTSU9OX01PREVM
X01BU0spID09DQo+ID4gKyB2ZXJzaW9uKSB7DQo+IA0KPiBXaGlsZSBtb3ZpbmcgdGhpcyBibG9j
aywgeW91IHJlcGxhY2VkIHRoZSB3cm9uZyBzaWRlIG9mIHRoZSBjb21wYXJpc29uIGJ5DQo+ICJ2
ZXJzaW9uIi4NCg0KT29wcy4gT0sgd2lsbCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCkNo
ZWVycywNCkJpanUNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB2c3AxLT5pbmZv
ID0gJnZzcDFfZGV2aWNlX2luZm9zW2ldOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOw0KPiA+ICsgICAgICAgICAgICAgICB9DQo+IA0KPiA+IEBAIC04NzQsMjQgKzg5OSwyMSBA
QCBzdGF0aWMgaW50IHZzcDFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikN
Cj4gPiAgICAgICAgIGlmIChyZXQgPCAwKQ0KPiA+ICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7
DQo+ID4NCj4gPiAtICAgICAgIHZzcDEtPnZlcnNpb24gPSB2c3AxX3JlYWQodnNwMSwgVkk2X0lQ
X1ZFUlNJT04pOw0KPiA+IC0NCj4gPiAtICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KHZzcDFfZGV2aWNlX2luZm9zKTsgKytpKSB7DQo+ID4gLSAgICAgICAgICAgICAgIGlmICgodnNw
MS0+dmVyc2lvbiAmIFZJNl9JUF9WRVJTSU9OX01PREVMX01BU0spID09DQo+ID4gLSAgICAgICAg
ICAgICAgICAgICB2c3AxX2RldmljZV9pbmZvc1tpXS52ZXJzaW9uKSB7DQo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgdnNwMS0+aW5mbyA9ICZ2c3AxX2RldmljZV9pbmZvc1tpXTsNCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiAtICAgICAgICAgICAgICAgfQ0KPiA+
ICsgICAgICAgdnNwMS0+aW5mbyA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2
KTsNCj4gPiArICAgICAgIGlmICghdnNwMS0+aW5mbykgew0KPiA+ICsgICAgICAgICAgICAgICB2
ZXJzaW9uID0gdnNwMV9yZWFkKHZzcDEsIFZJNl9JUF9WRVJTSU9OKTsNCj4gPiArICAgICAgICAg
ICAgICAgdnNwMS0+aW5mbyA9IHZzcDFfbG9va3VwKHZzcDEsIHZlcnNpb24pOw0KPiA+ICAgICAg
ICAgfQ0KPiANCj4gVGhlIHJlc3QgTEdUTS4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiAN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
DQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcw0K
