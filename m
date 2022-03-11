Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA44C4D611A
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 12:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348444AbiCKMAq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 07:00:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239962AbiCKMAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 07:00:45 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54EE51AA042;
        Fri, 11 Mar 2022 03:59:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0NMBgyoQIQsY6tly4oS+3Pc+sRLzAgrgc336mhVitIJQS9PY1oyVuo6XfhNIs4UM3KjLhmOeuvOgqs76cJ9g6GjUpvpvPnK57m8qn/mbRtsyzFbwK+wDZrGE0NBh8BVUs+8w/Y17qzWFmsYwlI9xglO4Tk1mFCuKEMH/JS/S9oV0GwETLrsU9rUizRQ6C4lQwATtzWknQk5KXwGSNZHmTwdroiIB7glKFxEXXiy5ZCaZdHRiLMQlsIbyO1tpqHB/yHcxSKK3sAb3SjiCx52BrO6Mk/umnzkrDGtkx/LD5Annir2sl5TCcljQAt5tfSkeE495YsRdcmZmXgwIHw/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVVGwk0KSKxAskyNPyZH46mO5tQKwhun0IeIs3EloWc=;
 b=LwoTYuk88gj/dDEqZlDXrykCvYRecYCKGjqtgP3gzLesSNU9QVaFc6KVy7bQe2zY2m6KryImvE+d35GM3Qw5U1l4qxWi5mAFm6UPRUI2ylNZtw5OLE9lZMOmGugbtMiz1oNb9MTWFa7KZF+4gn603UYGGmnvw96l4f6ZzKkRCMyQZzgYMyk5CFS4wYVbdnF7KhG/ECNzPm5825HCUpWccCloVp9D+JvToh1ysKgzmKdcWeWI1o5MPHu8EgpuJC8Mqc7RO0Q3OB+3FMu4pv6tITJaCCXaWUfDjRhyIkuNKvB8H5tpz/KeKyLTsTC7PoXI2eHIgxReRW+J2IzCkzlW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVVGwk0KSKxAskyNPyZH46mO5tQKwhun0IeIs3EloWc=;
 b=YLx+BsxURlqFNAJFDIVbQZzKvJl/CEus8kcwvYsNpCsJfrq9AtD3nGYl8nWm48TVcttNDFOvWaIpiyCAPMX90CvShGghbXehPCl5RylI4vl3i5YQH+r004Wx/O8xyqD/WG507a8In8xNqZf1b3uE1rDZH4Jiq6t9U+hsjIYGohk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3697.jpnprd01.prod.outlook.com (2603:1096:604:5e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Fri, 11 Mar
 2022 11:59:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.029; Fri, 11 Mar 2022
 11:59:39 +0000
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
Subject: RE: [PATCH v3 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH v3 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYNTQfEiYofw8zsUmHn0fkdRi3u6y6BKCAgAAO9bA=
Date:   Fri, 11 Mar 2022 11:59:39 +0000
Message-ID: <OS0PR01MB5922CA9A089C035AFBE2AB19860C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220311103803.25239-1-biju.das.jz@bp.renesas.com>
 <20220311103803.25239-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdXR_8LzzK+S4S3WAbHbDTBcGj3T9U5jPUv84RifQCqC-A@mail.gmail.com>
In-Reply-To: <CAMuHMdXR_8LzzK+S4S3WAbHbDTBcGj3T9U5jPUv84RifQCqC-A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70afee53-42bc-4ccb-2ec2-08da03569f2e
x-ms-traffictypediagnostic: OSAPR01MB3697:EE_
x-microsoft-antispam-prvs: <OSAPR01MB369767F9671D3CB2C8D0873B860C9@OSAPR01MB3697.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aBKCtozKi8wysu7wLzuTcPgV18EjI2wEmfbqgEU+w/VP6/V9idWRhEY20kohBFld4DoYn0JLX6379yfFtHhm0r9k+5A+zkZWz6RHouOtnntPBamnVZEuhO/qhRE4wzKz8NyqsdTa/SdjuRoXfVhZg5+ubzisHtYt6K9Zuu0KAI+TbIJDZOYZtvZdTGVm9C0gLAR0dUNfK7FXeQqCpEJ3RqcUABH9WXPxqlE51dRJ+C2yNCDLqSGb2c1AIkz17ymjYjQUgEIZlSYtpGMZccjg/kNZmi8zDQKIMS9M61tBOsr5Ayg1JklFuJE7VfX5wcEozZDd71si7knlwL/rqLqLBR04JYe0rzJ6G/af5eIDwWVM5atXBCBQ8TpYnef4YZj8Vd9BrdfDwa0CweMO+nyGGb4GOKRYtLFSy+LyK9nOF/jPFlImL6sL2djwv+3WjXYxjLJEgsbp+uSNyLlb7xL4UNHOml00+on4kPgrpBt/WL3HeIDJqA2OkgEStO4xlV7ASamP6J+joeDbbK3RK4Aj/gOFO8HFpsz6fcWzvFIG+a1zjojeO4Vof6OuyuyqxjrMiwHEsDerAf8K9s7opsl01hhlYF/tKw4jawAanFK82g2JntCJcHNOvbfp2SRvBI/IACzm/PAnLAFvIms3FpT4XYGSkwadOdpDhCC5hSXwYNlmsgPB0J148ua/yH5u3D1iFtSBTZWhYoLDsGCMXLzb+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(52536014)(122000001)(6506007)(9686003)(7696005)(38070700005)(86362001)(38100700002)(2906002)(83380400001)(71200400001)(316002)(186003)(26005)(6916009)(54906003)(107886003)(64756008)(4326008)(53546011)(66446008)(66476007)(66556008)(76116006)(66946007)(8676002)(33656002)(508600001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tzh1eUJ2blpmMkorZ2didVptbFlLRGN2TFJ5VFlEamxvS2JEREVmNmJadzV2?=
 =?utf-8?B?a3BkZk5NSlhmcmVUOXZIR2hjRjQyZFhWeTdZbmFzTmVKRzA0T0d2aStmMmh5?=
 =?utf-8?B?NHVpOFdBUGdtaElWd3ExTlE4d2dwWXFOQkZhUTZBdEZ5eDZuM3lnbDRXSUZk?=
 =?utf-8?B?NUJFYXBFbnRRdWtUVUZCOVNPTWRGWmFBMWtjN3hrcmgzbmJDdjZDUlNteFVv?=
 =?utf-8?B?Rmp2SUVQdUdDclV2OWtFK1BNSElRQUhPeEJubEZJR09kaStvUE5pL0JjM04x?=
 =?utf-8?B?UDdJVHNXVTBaL0J3RTNHOWJQaHd3QVo5dWc3ZHBSQis3QU1xcWErekxUalBz?=
 =?utf-8?B?RklSZ1Y1SDRTSnkvbzN3Rm1SSnhkS2xVNE9IQ2hZQjltRVZhNnVDSVQvMDl5?=
 =?utf-8?B?RnlCSUMvUW1PZ3JLTjM1RkJUR21mQlNQZ0JXUDRwWmdzMUEwUVRPTDdDZW5n?=
 =?utf-8?B?NDl0bVZqck5WNTNGODVCYUlMcy9yQzFuM3Ftb0tEaFVXUVpSMWRERjU0WW9G?=
 =?utf-8?B?OXlyUWd0a3dhT2FEUWN1RmNoZ3ZpTDZjb2o1YVpKdVFzeGI2YStBeDRYTFNs?=
 =?utf-8?B?djB6aU1laENraXZBNHJTNVZyNzk0U2IyeTdSdXgxdnBidGExdVlnNXUwaXhu?=
 =?utf-8?B?Nkw5OVNXazdlbER6RHY0TU1STWNlYVpqMzlmL2wzZkNsVUE4YTN3dlAzTmwv?=
 =?utf-8?B?UFpGclBTNkRDQ1RsK2xPVXJPQUduaStpS0djWUxQbUEvK1dQVE5LUUdOQmJW?=
 =?utf-8?B?MFp1cXh2L2JvV2Q3YjNONWpmVktqVjJtVWw3dHBIbHY4OXpCRTk1MXYycThP?=
 =?utf-8?B?SWg1ZzRreVNPRElpclYvbE5TSUowUkVDWUlYcGw1dzFyUklyRnJ3NDFocGs5?=
 =?utf-8?B?VTFSdEhDNW1JLzM1U2lsaTZEYzNsWGhJOW95cTUyK2lxWmhwR25jYnVCQ0Rh?=
 =?utf-8?B?aFFUUTNXVlFld0tCUmh2RHFFWTFVOFdDZHIvd3RpalZoNDBjeE1UUlJGZ2tU?=
 =?utf-8?B?RXhQL1hZbFFxRVlDNDhrTENHM0xiSkk4YjZrZHcxckEwQXNiZGNGT1VOcnBt?=
 =?utf-8?B?YTNQR3JNOUpCOVRtUTlLSlF0dytJUlhhQjExWkIwbzBGZUUzSHdtbi9rMm1X?=
 =?utf-8?B?eFJBaWg0S09uN2pxQTc4Y1djcTREWFVwejZISytyQnlNN3Q3WVlUaFF5ZURT?=
 =?utf-8?B?YWJxbmV6amdVeUZJcHd6Q3Y5d0pJNkJZNXFQRWFVNStNWmxNRUZLZkNLdk05?=
 =?utf-8?B?MmRmRjRPaUFsNWgzSmovNVZNMm5oK3VlWGsydEJDdDdLeEFXbHZ6WW9sUXBq?=
 =?utf-8?B?OW9jcHJZdGtLOGNmamY5SjA1S2d4UG9XcDlPc3gyZGxzTitNVG1JQTBqTWw3?=
 =?utf-8?B?bUJnaHR3eXBra1gxdTVxd2tyNG5mVTVkdmxaeEtjUVpsS2sxaExHeFNZcjlL?=
 =?utf-8?B?VzZsbms3NEJteHp6d0dpSVdYeEFMSkJwNDVMNzM5ZnFMbDJVVUZPWG5qdFFv?=
 =?utf-8?B?THhIZVlDbnVKbkl2MnA1WE8wUXFzNnVRYnl2eVJxMElaamhieVllUTl2SEFx?=
 =?utf-8?B?WWJoeDFxQ2NKQmRjc2FYdTNRZVgyMWJHTXpxZGYraFpoT28xWUxjR2VWYlNL?=
 =?utf-8?B?UU1HbUUwZjNIeTB1NTJYVGZiUElOV2VUZDZ2dnorUTN3YmNyaFFNOGtNdnNx?=
 =?utf-8?B?ZktXaXlhOWhlMzU2ZmY5NExsc2FsN1Nvd0JaLzdRQjZ6MTAwSkhZNEVHTWVq?=
 =?utf-8?B?V0toRHhaSmp3NWU1OGdLRGlZS0JvTXluQlpZRndvbHVPU0xFd2RzZlhNV3pq?=
 =?utf-8?B?elRTY1ZVQlR1aVZuK1Y4WGcxZGNCelR1TkdLd3RnUWdMSWxsR2NpbElvZnF4?=
 =?utf-8?B?ZUZUQ3Z2Q003aE5QbkNEWGltMzJzN1RFeG5WU3lPeDlaWTFRcW5tbXdwTlFW?=
 =?utf-8?B?ejhob01sVUx6bk1mcGg5cy9ENXYvaTN2b1ZmVzBTT1pzMVhKRjh0MEhQUkh1?=
 =?utf-8?B?aHRuSTlOUnFBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70afee53-42bc-4ccb-2ec2-08da03569f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 11:59:39.8521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: atGgC5fy39be9Ny/Rhtftq81gR6DQqcv5/tT9EbIQE/e6KA5aB2eDH/+rpOpeQOQIYelvr9NUzLbPJliyMstFJYU22zvId+W3PycmXkeKw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3697
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
UEFUQ0ggdjMgMy8zXSBtZWRpYTogdnNwMTogQWRkIHN1cHBvcnQgZm9yIFJaL0cyTCBWU1BEDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBNYXIgMTEsIDIwMjIgYXQgMTE6MzggQU0gQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBUaGUgUlov
RzJMIFZTUEQgcHJvdmlkZXMgYSBzaW5nbGUgVlNQRCBpbnN0YW5jZS4gSXQgaGFzIHRoZSBmb2xs
b3dpbmcNCj4gPiBzdWIgbW9kdWxlcyBNQVUsIENUVSwgUlBGLCBEUFIsIExVVCwgQlJTLCBXUEYg
YW5kIExJRi4NCj4gPg0KPiA+IFRoZSBWU1BEIGJsb2NrIG9uIFJaL0cyTCBkb2VzIG5vdCBoYXZl
IGEgdmVyc2lvbiByZWdpc3Rlciwgc28gYWRkZWQgYQ0KPiA+IG5ldyBjb21wYXRpYmxlIHN0cmlu
ZyAicmVuZXNhcyxyemcybC12c3AyIiB3aXRoIGEgZGF0YSBwb2ludGVyDQo+ID4gY29udGFpbmlu
ZyB0aGUgaW5mbyBzdHJ1Y3R1cmUuIEFsc28gdGhlIHJlc2V0IGxpbmUgaXMgc2hhcmVkIHdpdGgg
dGhlIERVDQo+IG1vZHVsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYy
LT52MzoNCj4gPiAgKiBGaXhlZCB2ZXJzaW9uIGNvbXBhcmlzb24gaW4gdnNwMV9sb29rdXAoKQ0K
PiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3ZzcDEvdnNwMV9saWYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vdnNwMS92c3AxX2xpZi5jDQo+ID4gQEAgLTEzMCwxMyArMTMxLDE1IEBAIHN0YXRpYyB2b2lk
IGxpZl9jb25maWd1cmVfc3RyZWFtKHN0cnVjdA0KPiB2c3AxX2VudGl0eSAqZW50aXR5LA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIFZJNl9MSUZfQ1RSTF9SRVFTRUwgfCBWSTZfTElGX0NU
UkxfTElGX0VOKTsNCj4gPg0KPiA+ICAgICAgICAgLyoNCj4gPiAtICAgICAgICAqIE9uIFItQ2Fy
IFYzTSB0aGUgTElGMCBidWZmZXIgYXR0cmlidXRlIHJlZ2lzdGVyIGhhcyB0byBiZSBzZXQNCj4g
dG8gYQ0KPiA+IC0gICAgICAgICogbm9uLWRlZmF1bHQgdmFsdWUgdG8gZ3VhcmFudGVlIHByb3Bl
ciBvcGVyYXRpb24gKG90aGVyd2lzZQ0KPiBhcnRpZmFjdHMNCj4gPiAtICAgICAgICAqIG1heSBh
cHBlYXIgb24gdGhlIG91dHB1dCkuIFRoZSB2YWx1ZSByZXF1aXJlZCBieSB0aGUgbWFudWFsDQo+
IGlzIG5vdA0KPiA+IC0gICAgICAgICogZXhwbGFpbmVkIGJ1dCBpcyBsaWtlbHkgYSBidWZmZXIg
c2l6ZSBvciB0aHJlc2hvbGQuDQo+ID4gKyAgICAgICAgKiBPbiBSLUNhciBWM00gYW5kIFJaL0cy
TCB0aGUgTElGMCBidWZmZXIgYXR0cmlidXRlIHJlZ2lzdGVyDQo+IGhhcyB0byBiZQ0KPiA+ICsg
ICAgICAgICogc2V0IHRvIGEgbm9uLWRlZmF1bHQgdmFsdWUgdG8gZ3VhcmFudGVlIHByb3BlciBv
cGVyYXRpb24NCj4gKG90aGVyd2lzZQ0KPiA+ICsgICAgICAgICogYXJ0aWZhY3RzIG1heSBhcHBl
YXIgb24gdGhlIG91dHB1dCkuIFRoZSB2YWx1ZSByZXF1aXJlZCBieQ0KPiB0aGUNCj4gPiArICAg
ICAgICAqIG1hbnVhbCBpcyBub3QgZXhwbGFpbmVkIGJ1dCBpcyBsaWtlbHkgYSBidWZmZXIgc2l6
ZSBvcg0KPiB0aHJlc2hvbGQuDQo+ID4gICAgICAgICAgKi8NCj4gPiAtICAgICAgIGlmICgoZW50
aXR5LT52c3AxLT52ZXJzaW9uICYgVkk2X0lQX1ZFUlNJT05fTUFTSykgPT0NCj4gPiAtICAgICAg
ICAgICAoVkk2X0lQX1ZFUlNJT05fTU9ERUxfVlNQRF9WMyB8IFZJNl9JUF9WRVJTSU9OX1NPQ19W
M00pKQ0KPiA+ICsgICAgICAgaWYgKCgoZW50aXR5LT52c3AxLT52ZXJzaW9uICYgVkk2X0lQX1ZF
UlNJT05fTUFTSykgPT0NCj4gPiArICAgICAgICAgICAoVkk2X0lQX1ZFUlNJT05fTU9ERUxfVlNQ
RF9WMyB8IFZJNl9JUF9WRVJTSU9OX1NPQ19WM00pKSB8fA0KPiA+ICsgICAgICAgICAgICgoZW50
aXR5LT52c3AxLT52ZXJzaW9uICYgVkk2X0lQX1ZFUlNJT05fTUFTSykgPT0NCj4gPiArICAgICAg
ICAgICAgVkk2X0lQX1ZFUlNJT05fTU9ERUxfVlNQRF9SWkcyTCkpDQo+ID4gICAgICAgICAgICAg
ICAgIHZzcDFfbGlmX3dyaXRlKGxpZiwgZGxiLCBWSTZfTElGX0xCQSwNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVkk2X0xJRl9MQkFfTEJBMCB8DQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICgxNTM2IDw8IFZJNl9MSUZfTEJBX0xCQTFfU0hJRlQpKTsNCj4g
DQo+IExHVE0sIGFsdGhvdWdoIHVzaW5nIGEgZmVhdHVyZSBiaXQgaW4gdnNwMV9kZXZpY2VfaW5m
bywgb3IganVzdCBhDQo+IHN3aXRjaCgpIHN0YXRlbWVudCBoZXJlLCB3b3VsZCBwcm9iYWJseSBi
ZSBiZXR0ZXIuDQoNCkkgd2lsbCBnbyB3aXRoIHN3aXRjaCBzdGF0ZW1lbnQsIGFzIFYzTSgweDE4
MDEpIGFuZCBWM0goMHgxODAyKSBzaGFyZXMgc2FtZSBpbmZvDQphbmQgU29DIHNlcGFyYXRpb24g
dG8gYmUgZG9uZSBoZXJlIHRvIGlkZW50aWZ5IHRoZSBWM00uDQoNCkNoZWVycywNCkJpanUNCg0K
DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+
IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
