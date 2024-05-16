Return-Path: <linux-media+bounces-11498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8E18C70B5
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 05:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAAB41F2361B
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 03:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7702A46A4;
	Thu, 16 May 2024 03:38:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6741829A9;
	Thu, 16 May 2024 03:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715830687; cv=fail; b=sHyjIwieXrRx886KIQAgsxmK5K1Krp+WQ/zRmFH8e8By+OAagU4WWbBFJfQc7SE4UzzyUuKpAZFlRtE+ayEvRdCbuOgJqiWEMAbKpXNeofKtEh0Mt/kVBKHAN2Utr82XltUL4cqAy59t5t8PP8wC1WjYnRV6yB1kf5iNFBDmIlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715830687; c=relaxed/simple;
	bh=BkJ14CMcQphkmscFSi2q/oB6SeIh/XJSEUOIVquAWOc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uE26IlXgQ+iPW2yKLd+m5GidkZ2ZmD9qCs+KWan3EK96TvBmJq24zhJBJaj1o7+FpD5sqo1v4vdkkf7somTYUe7P7EvVPNT9Xpb+QRXKJcvF+NskTrYQaSxzgTYdojF0XNzHvDS/WG9K+YnEZi2mf02tBpa6T5X9QYPw9UDqHe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVz1+YfmXuKRYlQuh2Kf6AoWkRdltjsZahtqdGiDxEsOfPy5lnBfgS0j177CeSiWi7Op7FDreL7XljLd7B24EzOokUuq37vmoazUj8iFReyYgvVkRbzB41rEqfA4wrVGvG/yhemUhyEjjc/YP9CoaVlshFXJfvvfs3t/Ia4aSr43LaUdNIA4gDMeSPFeVyLYG2q1eStG9pbNxmUbS9ydKn1UwpbMQomiZtJYkNqbvntVvPQJQNINo+dwWFpQWmkbgidsCzMb2Yitm0EE6BHJ5gNaPEn1oDp/CgBAqhxJEgAl2tUKrcIY53fxdQBpd57caAqY2k+SqqANUKWVl//WjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkJ14CMcQphkmscFSi2q/oB6SeIh/XJSEUOIVquAWOc=;
 b=QkQ33pmTxjp7YcsoaZSJikrbx1hv9qtpReKAanOcj/ZLNZWDMFILDOV4oY4pMNfU1yC+buoWnFHDmWVizDrMjHjB+vabUk++iP+hbAkkowPX2b7MTXZ+qsqyvaGzU7pdNGT4AQb/rwDFwJDUmXyCAjc0GGgrH4l2E1sdKadZzLgWTANDsisa4ptOHZ32WIbUYDX4/8cYnvDPtO5Tqhx4m47I8JDvjXyGE46AGEZSrjrzuGw+92eLvJdEKrxuNDY1RvMOdn5qzhkdtdPWePjBQjNz4lr+FcXoc713t2X0zHykwhkVYBWhyOpoln0nd4x2T42HgHJj2UAn+iCzOfGcyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::10) by SHXPR01MB0861.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 16 May
 2024 03:22:55 +0000
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 ([fe80::418f:9f1c:7cfc:d62]) by SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 ([fe80::418f:9f1c:7cfc:d62%4]) with mapi id 15.20.7472.044; Thu, 16 May 2024
 03:22:54 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Ming Qian <ming.qian@nxp.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Marvin Lin <milkfafa@gmail.com>
CC: Jack Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIHY0IDAwLzEzXSBBZGQgSVNQIDNBIGZvciBTdGFyRml2?=
 =?gb2312?Q?e?=
Thread-Topic: [PATCH v4 00/13] Add ISP 3A for StarFive
Thread-Index: AQHahOSSW1bbawER3UK5wWwrskCi3LGZc20g
Date: Thu, 16 May 2024 03:22:54 +0000
Message-ID:
 <SHXPR01MB0671B72EA791E1F66DB03310F2ED2@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
References: <20240402100011.13480-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20240402100011.13480-1-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0671:EE_|SHXPR01MB0861:EE_
x-ms-office365-filtering-correlation-id: 5f497bae-854c-4a3f-f7f3-08dc755779f5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1SOlv072WBOZkpzYvx+AObzW7CE161zJcn8AsvE5hrGWoqAYyG/3T7tMRrHVsXKLLtGFleQq1z7+69+uh+8ziSeUR9yfBGnlDpCvKKdzO4r34RJOcudXN7ZMGt6/OjK97b6pjDlndHQhguJKCqRdjrPGVz4LyVXpP1XFHB9PsdJTt0W9DnH67YXNs0JdiTnQRzdVBUnfOCqxfw4qai+7e0B9Qa+fTmXimMVvZIycPAYFOmNxbqG36+q3WjcDfhkj+ivlC6PiPqo33WGw7aUNjLm9bJIB8lsBb8JdwRJsQZSufJ3lIhqyTO40q6mOQM7SM01bHv7Y+d0rhm68myauc83rcDZ0pEgOba7WAfzTEq0MLMVoFuy6jOsePJwTV5KothgeWmxvYjUrvn6JpOorr28+Fg5A6B/ePznS/C8hEqHcaBNV7thi1WTAiGVf2yH+ikRDiHFEI9D0wROw/3VMyjPe0AG8IALik/NVzbpVfgCt0Wt4jO93N6fogNr2nr+/NWU9P47WxCowIM2E54Yb4zOM2H+pFJ9S6zX+hfW+7GKOEK17HlCe9LlR7vv507cqv4jQfzFfune+h75cCiuOKOKLQJliV10a0KFX+skJqpFJFEn6b5O0teR+B2AaHEACIokQV1QkeAAjxgnKBG8WsQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(41320700004)(1800799015)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?TncvU2NoUnZYYkkvMFQ5NktWV1o2RjJlaTcwR1VwMEN1ek1nRjBJUHUvR1JT?=
 =?gb2312?B?eXN5NzBlQmUxbGdkd3hqcVVMUmJzK3RPQURFelVKeWlucHliNEVPemU2R28z?=
 =?gb2312?B?SWpPQlErOVVKUXFHdHYrMlpZckVsWWk2Ny85d1l6dGs4ZEx2K3VnakpRQXQ3?=
 =?gb2312?B?ZE55SU41aXVoTGJKMFF1a2dSZHlLVFRtYmNCcDIwaFlFcVczU0U3NzF0VlA4?=
 =?gb2312?B?NXExeTlUVGdreHlqTFN4ODlvbUlCNzdLTmNGNnRhSVhpNmxtM0s0c3FndnpE?=
 =?gb2312?B?ZXljMVk2d3pkTUw0SWRXczVyN255ZEdkMU0rVm03MHp2S0ZsQ2w0VitJQmMr?=
 =?gb2312?B?U3hBZUd1cDJ0THJ4WTZMb2FFeDFxME5rTHBVMXdkVHk3STBTUVNzZ2tjTFkz?=
 =?gb2312?B?aXZiczZITHpYTDVDL0c4RkNaNWNjRE5tV3BCTW1YcE1DM1lVK2hzWHpjNE1B?=
 =?gb2312?B?MStzSmJ4dXhzSk90VUZYQjNhZXhlcDNKbmZ5WFUzVzhneUJzdmZHKzJ5T1lK?=
 =?gb2312?B?V1JlYmVPV3didVVkUVZxa1BpZDhrTXVDVlR3N3hhWnhZNVRNRG90bEg2SE5o?=
 =?gb2312?B?clJ4dDRTZm1yZzI3WTd6T0l3Uk1vK1N5NElGWUQwTFFYWGNLRHVNYTdEczlL?=
 =?gb2312?B?VXVWTUttb3IvUkhuUGYyNWxsYnNTQzhOSTZQemJwaUcwSXVUQjA5ZnFURmdC?=
 =?gb2312?B?ZGFsRkdVdWF6MzI3bnNRNzRNSEtZeDFLbnpnMXA4WXhUVjdtQUZNbUVHYzlX?=
 =?gb2312?B?ZStWM1NCOUpvMHp6YjZrQ0U3MzhRdzVHdmxCUjA2NmhITDVKd0FrT2g1NUh4?=
 =?gb2312?B?Sk9WaFhVb0lPOGhEM2VYVFJNbjBrVFNsV1pMdUd4Z3NPRXRrb0huVVNUcUMv?=
 =?gb2312?B?ckZnL1IxVmxtVkhHQlpqSitNR3R1WmI0QlByMEQ2NTBPZFoxb1Nadzl6QU9h?=
 =?gb2312?B?emtJcE15L3p0OFJidGpUR3NsdGYxNmNnVlpXOWlyd3pSbm8vdzE3S2U4anNR?=
 =?gb2312?B?c1RxdlRMcnFZd0E4WTdYdW12SlRKUnkra0ZiU3lXMXBiZ01QZFY0bHEvbzZ5?=
 =?gb2312?B?V21BT2x1WlZibUZVN0ovTEVBcU9HOUNGQmpTM012alhIdFhiZUlWTis1TnFZ?=
 =?gb2312?B?M3RKVC8vUm1pa0Q4WGhGR0N3U0NuRHltT283YUx6TzhOckhRR3NxOWszU3di?=
 =?gb2312?B?Y1Nkay9JNE1XeFVCTGhQcXJPYWNNNjRraGgxTHUzZXE2ZW9mZlhSNG9qZ1hY?=
 =?gb2312?B?R2xuUE9OTHpaWmhRNFB4UmVQak04ekxzdklYWVRSR0lqdHFBdmFjY3liZVRM?=
 =?gb2312?B?ZEpsMU11U3VnOUMvWWlPelI4a3hZVVVrVFAzamNwQndrMjliS2lWenBzdXVH?=
 =?gb2312?B?b2V4cDRaOXptN09pOVlhMnRKTFVEckMwbmlhNlpYLzFWR1U4bGY0elM5ZDE3?=
 =?gb2312?B?YW1zQ1JPMExSMUhCQzA5N3BSbnp5Wk9HVVR3bjZ6bElQU1VMQ2FZK0RPTWxB?=
 =?gb2312?B?WTBvQzB6SGFid0k2bDdValk3VzUrc0wvbks2OG0wSldBWWpFQXk4YSszSWtu?=
 =?gb2312?B?eU9NWUx5NDdSbWFPVFA2U1pwMm9WQzZpMmtpaDFpbm9WemMxSHVOVG5VdkEy?=
 =?gb2312?B?ZFYwYmVPNTM4R2dQdEdsSFg4WWpsZjI5dlkwTmp4L2FZOUxqeTlPd0NKbXBl?=
 =?gb2312?B?ZEg5OFN4NFZ1MU9kWWI1QW9MZVVhOWVpWGdnRmk1M0pLZmJRbUF5cDlmVDNW?=
 =?gb2312?B?Rnk4WXZJTWpFSTl5ZWcrVU9oRUo4NFFDSGdYOHA3WkcxcUcrbWQ1bjg2Wk01?=
 =?gb2312?B?OEtNMG5xcEJGUzVpWGxHV3ZMMHQ2U3B0VzdOZmZySlFuc1ArVzFpa0NWeGxS?=
 =?gb2312?B?anI4QVloY0djdnNYWGFKemF3cFdxcXJmRmtDOExja0locWhhWWJubjhFNnh3?=
 =?gb2312?B?SXlKK1EyQ3NQZnIxRGh0eUJ3RjRNVUdvVGpSR3hMQ1FWR2tPckcxbGJDK01H?=
 =?gb2312?B?NmR6b2lQRERjcldvUFpoazJZamVkWi9OczA4VFY2ZDUzQWhjVkpVZm93YlU0?=
 =?gb2312?B?YllWczhXSTJnUkY4M2Rhd3k2QmZjZmdmTVVwSFQ3NnZ1VVMydUdhU3RLMklv?=
 =?gb2312?B?LzN6dGRPRUxmQzRiUVJrelpzeXY0SmtBVm5IOUk3QVNVU25Lc1FlVEp5Sml0?=
 =?gb2312?B?Mmc9PQ==?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f497bae-854c-4a3f-f7f3-08dc755779f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 03:22:54.8075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lesRa7K2STu64pl6ThFrxO6HDt2NVF+ZscbhEPlPJUC+zr/QpVihwNYus/PT9eC7AcV5Kato9/e+NadJBHruvhLAl+69mG5oduz2DzuAwSUxLFgGI3NxuPv25mqZ/Foc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0861

SGksIE1hdXJvLCBIYW5zIGFuZCBMYXVyZW50DQoNCj4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cyB0
aGUgSVNQIDNBIGZ1bmN0aW9uIHRvIHRoZSBDYW1lcmEgU3Vic3lzdGVtIG9uDQo+IFN0YXJGaXZl
DQo+IEpINzExMCBTb0MuIFRoZSBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIG9uIHRoZSBWaXNpb25G
aXZlIDIgYm9hcmQuIEl0IHNob3VsZA0KPiBiZSBhcHBsaWVkIGFmdGVyIHRoZSBwYXRjaCBbMV1b
Ml06DQo+IFsxXToNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMzExMTIwMzA5
LjUzODktMS1jaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaQ0KPiB2ZXRlY2guY29tLw0KPiBbMl06DQo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMxMjAyNDUyMC4xMTAyMi0xLWNoYW5n
aHVhbmcubGlhbmdAc3Rhcg0KPiBmaXZldGVjaC5jb20vDQo+IA0KDQpDdXJyZW50bHkgdGhlIHBh
dGNoIFsxXVsyXSBoYWQgYmVlbiBhcHBsaWVkLiBJZiB5b3UgaGF2ZSBmcmVlIHRpbWUsIHlvdSBj
YW4gc3RhcnQNCnRvIHJldmlldyB0aGlzIHNlcmllcy4gSSBhbSBsb29raW5nIGZvcndhcmQgdG8g
eW91ciByZXNwb25zZS4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0KDQo=

