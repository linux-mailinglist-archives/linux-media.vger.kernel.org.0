Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8606E4CD84A
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 16:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237323AbiCDPwI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 10:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiCDPwH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 10:52:07 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EEAE339D
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 07:51:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8sGpD3h5L5r8lG3/BH2pM1xg3BwTxmYieSl/j1zwbHRoPKFOnqHtmGQjOCI7Voonrw5QfPyaYsksSulQIvIs0RoNkpPsu7NnB702BAZpFRTw6QLpRv4cDWwPEEwYhMNhxFPI9ENBRI+fe3gxbpyVCQ7QMvBrgXGVZJjqGEsxpIlCTC0xx5FyiGD6gwwF6OiXkyT6HtPZOZdqZ4W1rVTPgsf4WhrAWULlKQfAZCzSqExdWHcip+vcacQJn7Tvzr1K21jdz8cMnrWc7C6tfsb2BFzjeYTysXrma782W6HE/HYRkp3/YTipXpKjmtyhHYMWOITy/sjCAe9o+iF2eZ/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9CzP3W2FPkfJu7K/ByCbRvqQ6sXp3kgMltVAKQUZCc=;
 b=hzhkDK3kssv6QJnbqr338j6CLH0QI2IXreZEsPBZ49ejHef6Ej53GNUp/u545Ys8o+7rMu6SrRZI4rjMaXFWjxbQTVXSnJlYO3o+9Go+fZwjg/HiHIw0frtcaZO/sXbaueXOavU3Yl/0guey3XfzKEiFliX/i1NksPE8Dd9BX6IOx4OLvSXn5rCVqaWTz6CDNBJxkbWKs9+9DCPBz8dJjLpqUByUvz6onaoCdmtSShsT8xvpSi6c/8VfXthV+DPjlMbqEj5CZiPzN+4l8j2m7WPzJX1fOHXSHL++ixm4PmfStMJqnAboT9bCe+satbdXvi5DynM7vvbHdlh1kPLf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9CzP3W2FPkfJu7K/ByCbRvqQ6sXp3kgMltVAKQUZCc=;
 b=P85hpXKIYq6wGA1KUpfTfru8IJFAMn3kOGrY8tmEpQcYd+GX7Y6H3zLa4Wvxz3wNiJkdjSYvdSwIR03Jgkuz+7epDrkMQOKRNp3HE3IkilrJ2yNHq+aWAYaT/LLwNFPdn25GavO6gyUoIy8I7jUrJiUtxmWUxUGn0GqjA7KdZXk=
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15) by PA4PR04MB7517.eurprd04.prod.outlook.com
 (2603:10a6:102:e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 15:51:16 +0000
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::a1ae:e74c:cadb:efb8]) by VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::a1ae:e74c:cadb:efb8%12]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 15:51:16 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [bug report] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Topic: [bug report] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Index: AQHYL9+uUOewrpnC1UyjV1LU41+xwg==
Date:   Fri, 4 Mar 2022 15:51:16 +0000
Message-ID: <922460bc6047e1c033ccff1af77cc07c49af2585.camel@nxp.com>
References: <20220301124208.GA27743@kili>
In-Reply-To: <20220301124208.GA27743@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d3d4de1-dfc4-4e63-0256-08d9fdf6d13b
x-ms-traffictypediagnostic: PA4PR04MB7517:EE_
x-microsoft-antispam-prvs: <PA4PR04MB7517F26A093DE8EE3B5FFAD48F059@PA4PR04MB7517.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HAeQ2WEt5ufm3VEBgQNQP2i5iJ1EMRR1QgrdDTk8l1QjJy6HYvkyqnY+XwrXNaHI8q1vg74XmdA4qzSwadQAqn9wQ8STpkYqcBkadOWCEnwfJRSZyBMLg6TYuvSL64k5xTWvdWltLoM8xMWsdieouWDsdX9fjxJ3+yDAJF4IIBSHSE3SLwg8I8V1vTatcefDUcPs1Z4s8QPF2NcFKVNkBRwEZv2tEJfMD7W7hhgcU/5AB2SQiihLn9mz1J0HuCd6MkyZLlcp54J36GASYlqfD9ODsLCnq5ILBVtDCYzVkHoNjEiYIdji74ECAyXQSZscFFZNAbg0twsQ9ABCFV87hUadPMr2v8jQPifmgY0F6kxzj/IrU5kzS0pn4ibDqd/yXt+SqDnOUBB4cSCEwBl1xDaRjLozd45i/MlQIWZ9dMbwa0Jx2xpG0+L6M5xCphA9+fzG7T9lchhbHyfHcD/9tkIGChrKCGfIjpqiN3m1YwyRLmwCYOVXi/4bi1KfrKWdO4Ep4ghfXRbmiaD8StSqa8AP+dEVDLeGcXlmDTXPgzr+FJdCgxh7JxkdQMuW00953KnE1echp54DgJPpbUulaDhjo5B0N5ZhF0/wHYEfVa8YZPfap6z/FXE9dZKAVYiGrwj0EDTsC0XHD3+nz3FA0Cj+MGziRGKAK03Y2oacKQ0Kq+2faRei4dd8LJefXUEPPmkOkvT+bXd6ScCPg2MaDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2495.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(6506007)(38070700005)(6512007)(2906002)(186003)(2616005)(86362001)(76116006)(38100700002)(83380400001)(122000001)(6916009)(71200400001)(44832011)(5660300002)(4326008)(8936002)(64756008)(508600001)(66446008)(66946007)(6486002)(66476007)(316002)(66556008)(36756003)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk0va2pOeUQxK1dxc0FSeFcvTGFybU81NTdJc1NFK0lTREJiZ0NzRHdvTHpG?=
 =?utf-8?B?aGdYZWR4T1pQeVVMZkVZSWtsWWFnaWFsTWpPK29sR1JZcHdPcUdVZ3lZeFVL?=
 =?utf-8?B?ZlNSVWN2MU5scWpDMDdTdzNaMHdJRVEwQnlVTGhWb1QvVENBV1dOaytzMUUw?=
 =?utf-8?B?L1FBcXh4Tjg0bGlwYVY2VzBqMzZER2ZtNklyNkxvTzVZcWJIa2RsNDJKWGxp?=
 =?utf-8?B?THV6UnRhZWZEWS9KSFBEVXl4NTRJcVlYc2l3VThZZ3hndWxhZjFEODF0a2dm?=
 =?utf-8?B?VGVRYk9jYWRHRWxta0RGM0toKy9GOVg0QUtIeGo1dGJJU0tyUW44bzR0VlVX?=
 =?utf-8?B?eGlBaVE0UFI4U0lRNHNOT2plWHhJSWNFbXpXWUN6dURqczdwa0xFajhxUDFM?=
 =?utf-8?B?b2VLdUZJWnZyZzN2Njh6d2J4WDBVa08zSFFPdFNMaW9KK0ordU1VVjlFa0ZR?=
 =?utf-8?B?TWU3YWM5WEVtN3F2ZDFGRDhxVmNOZGZ1dTgxQkI4RlBpZWYzOElhcVRudUFj?=
 =?utf-8?B?bmdBR2htMEgyQXNrT3dSNWFVdkpFcDY1ZTA3SlJ4VG5Hemg0cnY5RG44cmQ2?=
 =?utf-8?B?eDZjRjN2bzlrVGMyZ2JzVXA3OEVsZ1kzbTBQaDhzOUN3TGNLRG5CRW5pdEI4?=
 =?utf-8?B?M3RSTVorSDB2K2VYaDFLcFk0QXhxSDdQUTRid3l2Q0doeUxheTdubmltb05Q?=
 =?utf-8?B?MVJYcWZsOU1GRWVmL1dpd1dFU1dVbk1SWnp2azFVQWZsTWhwcmgxNjMvWWZp?=
 =?utf-8?B?T0pvSUhYQ3RXNWtKMEpzUUZuQW5BemRWWitHRURBTUs0NCs3a05VZ1h5UFdD?=
 =?utf-8?B?Z09QbnFuQ25jRDJNV0pPYmJ1Z0t3bk5xZHl4eElqdmxQSGZwaFFhOUNzeFBN?=
 =?utf-8?B?ZzV1NFRtbWQxY2FwSnFINFlpK2ljMU5FeHllNWltWW53N05sTVR4UWFYMEVn?=
 =?utf-8?B?K0FJSS8wY2xFSU5sMmFKeE9kVjNXVHNPTjNBRU5jcWZTTTFlMjl0Vm1YcDhl?=
 =?utf-8?B?VzR0Y1Fkc0VMQUFpVERKVzE4VHBIZDhqbERmbEthbDNUbHJnaG9XTDFDc1Zn?=
 =?utf-8?B?UlcxcTBkcWhWUVd4UUVzTVBSVC9OS0RxNjZFdmV0eXJQVlJKTnNCZUZDZ1pC?=
 =?utf-8?B?eE9iWmpJa1FNbXE4NFliSkJZWnpYamZRSWgwcUJNYkJpYXhZUlZDbElRV2sw?=
 =?utf-8?B?VzFhWE5qM2ZxWi91a3VVNDlzblM2QkkvbzF1TzRxWWFtUEdIMlB1NFJSQWJB?=
 =?utf-8?B?QzFCLzhxVmdaRit4ZDlkMXZSdWFDT1NnelBUZFZPVTBIRlJiV01DK1VrenQw?=
 =?utf-8?B?Qmp6eE9FcVFYS0lmUWpsVWkyUml1TzArYlZPSmVlcjE0dFBlMWlmb0lldEpB?=
 =?utf-8?B?REQ0R1lyYXp3TFp4R3kzak80enozdlcyU2pBaWdQeFgza3JwUkRxTjhvaEJx?=
 =?utf-8?B?NVR3UGw5dnRnZlp5VWtwL3Ztb2M5VkdaWlVNbW5ESW5BUHBqRVJ5N1U0aWtF?=
 =?utf-8?B?Q2lQRmhQd1JoTDErcStGdjM0Ulo0SXVNRk1uYkN2VW5NMm4zdmhGSWZRVlhz?=
 =?utf-8?B?elkwaXpYckdFd01nVGg1QmJjaHk0bHdZb1h3TnRFd1kwTGlNa2o2T1F5UVBa?=
 =?utf-8?B?OGJDamlKclZGRjgvak54RzdjYlhUS01JNVlOdDlVU1JxRFU1UVNEV0dIeXIv?=
 =?utf-8?B?Qngrd2ZFUEUyS04yWGZSMzN1bUJNSXNRZmgyYnhBdCtWTW1CbStPQys0TkRp?=
 =?utf-8?B?UW5XQzBzamt2cDB6ak1CdDFjT3JlVHhEbWJzQU12OG03dnNrZjlETGdZTVhs?=
 =?utf-8?B?eVBVTTB5TVdPWnFPbjMyQWRJdmVpMythVkZMelZ1YTJmenBQYVBGRFNjZjhx?=
 =?utf-8?B?eFhma3dmYTJUanR4NHNOSDl1QU1sbXR1YmkrS2hXNmtrdUI4bE5xZTRIQU01?=
 =?utf-8?B?aVRmcEhPbDlTbTd2VHJ0bXIxVmZ3Zm9SZmxBRGpQcWFQdy9kaVhZSHIxYzB0?=
 =?utf-8?B?TzhncHQ1dkRjdUFGd0U0eXU4Znd3b0pYRWc2aXB4QmtwMTluZGJRQlNiMmVT?=
 =?utf-8?B?ekVnbUFoVS93RkFsT2Y2SkVtUmpPMGRlRy9FNjBMSFBObkp5MGxVNytvb0tD?=
 =?utf-8?B?ZWdaQzg0VFNROUpFZ0tMb1BTL0I3endnWXR4bVlmS3RTWWtKaXFlWmFWTUpC?=
 =?utf-8?Q?l0CcmGPyuBD7O4pmQlQbZgk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EA9AF25E03338448FDF78BDB865C9E1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2495.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3d4de1-dfc4-4e63-0256-08d9fdf6d13b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 15:51:16.1692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PID9JuVkM/hGbrdN7sY/gX9jr82r1mEgIaMn3QVTPvS418bnh8A/s8nBdx7hOfTsw2RDMQd/qMR492zMeZw4/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7517
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQoNCk9uIFR1ZSwgMjAyMi0wMy0wMSBhdCAxNTo0MiArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToNCj4gDQo+IEhlbGxvIE1pcmVsYSBSYWJ1bGVhLA0KPiANCj4gVGhlIHBhdGNoIDJkYjE2
YzZlZDcyYzogIm1lZGlhOiBpbXgtanBlZzogQWRkIFY0TDIgZHJpdmVyIGZvciBpLk1YOA0KPiBK
UEVHIEVuY29kZXIvRGVjb2RlciIgZnJvbSBNYXIgMTEsIDIwMjEsIGxlYWRzIHRvIHRoZSBmb2xs
b3dpbmcNCj4gU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6DQo+IA0KPiAgICAgICAgIGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWcuYzoxMDcwDQo+IG14Y19qcGVn
X3F1ZXVlX3NldHVwKCkNCj4gICAgICAgICB3YXJuOiBwb3RlbnRpYWwgdXNlciBjb250cm9sbGVk
IGl0ZXJhdG9yICdpJyAoYXJyYXkgc2l6ZSAyIHZzDQo+IDcpDQo+IA0KPiBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL2lteC1qcGVnL214Yy1qcGVnLmMNCj4gICAgIDEwNTMgc3RhdGljIGludCBteGNf
anBlZ19xdWV1ZV9zZXR1cChzdHJ1Y3QgdmIyX3F1ZXVlICpxLA0KPiAgICAgMTA1NCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqbmJ1ZmZlcnMsDQo+ICAgICAx
MDU1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpucGxhbmVz
LA0KPiAgICAgMTA1NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBzaXplc1tdLA0KPiAgICAgMTA1NyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBkZXZpY2UgKmFsbG9jX2N0eHNbXSkNCj4gICAgIDEwNTggew0KPiAgICAgMTA1OSAgICAg
ICAgIHN0cnVjdCBteGNfanBlZ19jdHggKmN0eCA9IHZiMl9nZXRfZHJ2X3ByaXYocSk7DQo+ICAg
ICAxMDYwICAgICAgICAgc3RydWN0IG14Y19qcGVnX3FfZGF0YSAqcV9kYXRhID0gTlVMTDsNCj4g
ICAgIDEwNjEgICAgICAgICBpbnQgaTsNCj4gICAgIDEwNjINCj4gICAgIDEwNjMgICAgICAgICBx
X2RhdGEgPSBteGNfanBlZ19nZXRfcV9kYXRhKGN0eCwgcS0+dHlwZSk7DQo+ICAgICAxMDY0ICAg
ICAgICAgaWYgKCFxX2RhdGEpDQo+ICAgICAxMDY1ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gICAgIDEwNjYNCj4gICAgIDEwNjcgICAgICAgICAvKiBIYW5kbGUgQ1JFQVRFX0JV
RlMgc2l0dWF0aW9uIC0gKm5wbGFuZXMgIT0gMCAqLw0KPiAgICAgMTA2OCAgICAgICAgIGlmICgq
bnBsYW5lcykgew0KPiAgICAgMTA2OSAgICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8ICpu
cGxhbmVzOyBpKyspIHsNCj4gLS0+IDEwNzAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNp
emVzW2ldIDwgcV9kYXRhLT5zaXplaW1hZ2VbaV0pDQo+IA0KPiBTbWF0Y2ggdGhpbmtzICIqbnBs
YW5lcyIgaXMgY29udHJvbGxlZCBieSB0aGUgdXNlciBpbg0KPiB2YjJfY3JlYXRlX2J1ZnMoKQ0K
PiBhbmQgaXQgY2FuIGJlIHVwIHRvIFZJREVPX01BWF9QTEFORVMoOCkuICBNZWFud2hpbGUgdGhl
IHFfZGF0YS0NCj4gPnNpemVpbWFnZVtdDQo+IGFycmF5IG9ubHkgaGFzIE1YQ19KUEVHX01BWF9Q
TEFORVMoMikgZWxlbWVudHMgc28gdGhpcyBsb29rcyB0byBiZSBhbg0KPiBvdXQgb2YgYm91bmRz
IGFjY2Vzcy4NCg0KVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4gSSB0cmllZCB0byBydW4g
c21hdGNoIChmb3IgdGhlIGZpcnN0DQp0aW1lKSwgYW5kIEkgZG8gbm90IGdldCB0aGlzIHdhcm5p
bmcgcmVwb3J0ZWQuIEknbSB3b25kZXJpbmcgd2hhdCBhbSBJDQptaXNzaW5nPw0KDQptaXJlbGFA
ZnNyLXViMTY2NC0xMzQ6L3dvcmtzc2QvbGludXgtbmV4dCQNCi93b3Jrc3NkL3NtYXRjaC9zbWF0
Y2hfc2NyaXB0cy9rY2hlY2tlciBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2lteC0NCmpwZWcvDQog
IENIRUNLICAgc2NyaXB0cy9tb2QvZW1wdHkuYw0KICBDQUxMICAgIHNjcmlwdHMvY2hlY2tzeXNj
YWxscy5zaA0KICBDQUxMICAgIHNjcmlwdHMvYXRvbWljL2NoZWNrLWF0b21pY3Muc2gNCiAgQ0hF
Q0sgICBhcmNoL2FybTY0L2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXkuYw0KICBDSEVDSyAgIGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWctaHcuYw0KICBDQyBbTV0gIGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWcubw0KICBDSEVDSyAgIGRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWcuYw0KICBMRCBbTV0gIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWctZW5jZGVjLm8NCm1pcmVsYUBmc3ItdWIx
NjY0LTEzNDovd29ya3NzZC9saW51eC1uZXh0JCANCg0KSSBjYW4gaW5kdWNlIHNvbWUgZXJyb3Jz
IGluIHRoZSBzb3VyY2UgY29kZSwgYW5kIHRoZW4gSSBhbHNvIHNlZSBDSEVDSw0KZXJyb3JzLg0K
DQpJIGhhdmUgYnVpbHQgdGhlIGtlcm5lbCBkYXRhYmFzZSB3aXRoDQpzbWF0Y2gvc21hdGNoX3Nj
cmlwdHMvYnVpbGRfa2VybmVsX2RhdGEuc2ggYmVmb3JlIHJ1bmluZyBrY2hlY2tlci4NCg0KVGhh
bmtzLA0KTWlyZWxhDQoNCj4gDQo+ICAgICAxMDcxICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAxMDcyICAgICAgICAgICAgICAgICB9DQo+ICAg
ICAxMDczICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gICAgIDEwNzQgICAgICAgICB9DQo+
ICAgICAxMDc1DQo+ICAgICAxMDc2ICAgICAgICAgLyogSGFuZGxlIFJFUUJVRlMgc2l0dWF0aW9u
ICovDQo+ICAgICAxMDc3ICAgICAgICAgKm5wbGFuZXMgPSBxX2RhdGEtPmZtdC0+Y29scGxhbmVz
Ow0KPiAgICAgMTA3OCAgICAgICAgIGZvciAoaSA9IDA7IGkgPCAqbnBsYW5lczsgaSsrKQ0KPiAg
ICAgMTA3OSAgICAgICAgICAgICAgICAgc2l6ZXNbaV0gPSBxX2RhdGEtPnNpemVpbWFnZVtpXTsN
Cj4gICAgIDEwODANCj4gICAgIDEwODEgICAgICAgICByZXR1cm4gMDsNCj4gICAgIDEwODIgfQ0K
PiANCj4gcmVnYXJkcywNCj4gZGFuIGNhcnBlbnRlcg0K
