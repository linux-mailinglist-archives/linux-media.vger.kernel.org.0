Return-Path: <linux-media+bounces-56895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMDLAOO/wmmjlQQAu9opvQ
	(envelope-from <linux-media+bounces-56895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:46:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F301F3194DB
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1FF530383A0
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 16:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF97F3EFD3C;
	Tue, 24 Mar 2026 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="B3BW0Plf"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021077.outbound.protection.outlook.com [40.107.51.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B35E24BBF0;
	Tue, 24 Mar 2026 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369868; cv=fail; b=Bpu5YmZvoWf9x0VB+V3PKDfu0x0Mu4/7gQ6qsfSZEJUeqjBcFNg9MmQmvJIx4nrTOT/j/X3EBPy9J6w/AlXjfs/6d6dEeryi1rzXvsmSUPYidKfHJtd4UHdrOPGE3j2yCbCUnhmgGUZUAeg7qfDD5SvqFOFinerFM7CMlCdFnOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369868; c=relaxed/simple;
	bh=wN0ptxER254kSH8TKzHCOEKEy8z803TwVejWQGXP4T0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XvZGLjspwj0YY238IAxX2MQ3PCISjCpdkiAyQqOTrXtfQrsfsDcu1ull0geGQwPFYYEdw0KLafoiSd0VKS7I+5JlNBjH/rTIwEvcqeYQE/19GIxaT9knIR21T2mc4gpTCelXnBPPEVtFyWvggNkievv9Pqnf86KkGdCaNZYlc2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=B3BW0Plf; arc=fail smtp.client-ip=40.107.51.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc9WVqaF70AM1Ii5q53dwDgZoOKWUpxDrzTCPYX03wWUc3le8fzMll6HIgPkARpCYOuSFAC7A8pEmwkIA8BHGoJrF6rgGNkM8nQUr1A9bfKW6msvQNx6GlThEQsXYXxSo3UC76KhM4wdXhJvIlJmXNd2qRlj5YdeiRAuYIFm2skC7YONiqL3+RYB0CyfFSJgUAo5Td/n6i3m3/bUOLkBsvoMy3m0wH2r7sq45TE7b2jxlIZ72ISkhxZCEF3vlJB3ViO+AC6/rUBZu1l2YwqCmS8T+IbJwFKh7EcsLdq/UB8lVAhPj6suqaCTI91zZhOFP84vwyxmYsWGQAgGCSyf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taT1rYJOC60gOwmnow8JzUkwmld7fSeDwJPBU/OXtvo=;
 b=wVJkzoNxiI0y2tWm2G0Hz9zyvnuDFPyVMcYq/g2QtjPyyZ7vSKmwjiL5aFgLWrA4pdhbPsZflpVO2e6qJ20kCP6hOXaYPzwejj+51Jfhqviv0GYhJBSpy6B40NTjOYqrdl5IJqyMB+MIncOLSMLkA6LTkDQeuXdaqs5KNPcqP2bB8gnzlOzFKy9B3U3igBMmPOS50NevKsYvj95kI7hfsef3Ize8O79vQPNjg1T1C/I7gFIdl0cHmwLEw6Kei36HM57hMOwPQouPB7brLxGDimuNapEq+MbiSSPjGUSkPMDUqe4Tlx/REZCEgbnVSOkQ/uJi7ky5tk01VynxDj5Gtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taT1rYJOC60gOwmnow8JzUkwmld7fSeDwJPBU/OXtvo=;
 b=B3BW0Plfaiuxt0U699iiSvs+mSEurx7EmabOrqgEHCxdvyLWYLdIG796HJUOJ/7ifGV2wTtamXzYW+gjUZPZM6XgNo8UJ6L4KFTp6gyyzFHNosyE1N6MQ0tBi6ptm3QaND8ZeepDUDeHPSADGwfqbRKDMyt+oVIgq3BjMIu8vjzLBqXU6ut+MreoXYn/R+kdN5NnctR2vGuJkXx4MUr1XznjsuGw3bv55vPE6XFTM49rRgCFNYbnUlSxd5RoYsydzcSXcUTJuyEGTdK9/C10VpjYp/ONUPpNDtTT6gJQz9uCMiiscoE+4+Qv7LiEhK8P8kA4QSppZLk/lUPNI9CvAw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0497.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 16:31:02 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 16:31:02 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/13] media: i2c: os05b10: Update active format before
 adjusting framing controls
Thread-Topic: [PATCH 11/13] media: i2c: os05b10: Update active format before
 adjusting framing controls
Thread-Index: AQHcrWWbBCA5F4vFtEy8NDemy3uU2rW9+iaE
Date: Tue, 24 Mar 2026 16:31:02 +0000
Message-ID:
 <PN3P287MB1829E89506AAA47318D694EB8B48A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
 <20260306123304.76722-12-tarang.raval@siliconsignals.io>
In-Reply-To: <20260306123304.76722-12-tarang.raval@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0497:EE_
x-ms-office365-filtering-correlation-id: 005ee8cc-3e7e-453b-8db8-08de89c2bd3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|6049299003|22082099003|56012099003|18002099003|38070700021|4053099003;
x-microsoft-antispam-message-info:
 1gdeIZ8Ns/l464+jmDQ3z7R8m7bGN6RSHrpDSCfNUfK4yqo6Fj8O/fEeYjC8QRprhm6taN5LVwVQ8Fob/RE/Ze4P42BBO5jbd6PnGcVDyXFLY4fv9uPl/icJV/U2pUsbfO8NX4/7vZbXqo9R7wITsUeejFkZ+cTt4LGyW4AF+lG0qFdRDFU1nbJf2gN+5Oo9xoFDKDLdNgcLyuq4sWcYyo8GlnmgGT5iuM2v6mI/xu6XAkIDnL1Iq9H/nSOl77fbBK3ZRD8zbg1O8vb0KDmHqF/kHjw5gadCYYEegtxXjw27igyVa3FjQNPEky3tEWhR8uQ2hiB+M87xqcMdtZdzGedMlXONuDKN8QvhWE2EOeH0SvN3kL7a0Dcl2lS4MsskYIfZfN0YOcCmMQXmv8IVXgCLTYXZGEm7CB7aDBKc3FcvxyDdwHgLSfyWKrHippZwwluZaLpNYHNawzElRuj3cLPb4/rb19X5Hylgt36UyXY9TX32l5LyNOqnUf71kkGbkUclyjzWN8UoVtxYfJ93a/uz1l8UYowQOsgnvaZhgANcdFgAzpkfZa6ixwG4PiFl5yk/F52uF5irPFk/P+V2yldWhE8tAN3K+nDeGQQ7dIzPJcdeZHaZrbbIIb0WVGKfmlH1t62ILv5PgdkkjL1gYKsRpBAPcd4RdbIfUv9+pw8CCUPLaRVbISGOmHLqz4u7+M7Ez7qqpaktxncIG3q+cq6op+oDxIT6cLWzPqcU5ok8jHd7Anw8b84/yRG3kz0bfcBqP80VanJiLv0E8eLkuVi9dCEy6Ci4B2YZ6XMCwu4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(6049299003)(22082099003)(56012099003)(18002099003)(38070700021)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BGjCPs9unmxewiEXYIx6j2/ooiMjjqNOwMzPAnPqdN3kylztItFo3IcgCq?=
 =?iso-8859-1?Q?uaPSgNTwOm/SwdTcnaSl2DO+ccIMDUXPIQEFNJy5u4zPdiMWPIQKNgqcVz?=
 =?iso-8859-1?Q?UFyicYXPXaWNayjScAQm2iGSx0kqjfUGgEPcWAtZ7sKApsDjN2vltTQcPu?=
 =?iso-8859-1?Q?Bb4FutdB08dZ9W/ThQADAYSx3ti9qlm1KoQ2T2TRDVM/2L2uSJEq93/Jdd?=
 =?iso-8859-1?Q?VFQlqmysRUl7Rn5R0v2Eyjx/SiaoVQtCsVFJM3c4XOcX3rgiYxQabZog58?=
 =?iso-8859-1?Q?/sh8lvDTvTbg0sTsWz2ivpw4Iz9+wJjM7A1Vlcry3iR/lRB8h8zqeMhJxr?=
 =?iso-8859-1?Q?zKUogJLIWoF7X3m504eKFcUk1chtMDgagSmq1oE0ibeUCzF0K55WnnCzjV?=
 =?iso-8859-1?Q?D0Rkqh15BGvKUv82nBJi5o0DE6QubMtI+y125tHr/JqCKCrNN/55euvCsj?=
 =?iso-8859-1?Q?EyvaiKhVP10rN5f1fbvawkt5mbsAC3e5o78GncYUsx9OI8y3rXA1Qdf3+1?=
 =?iso-8859-1?Q?Neg2d217ntu6oe3rrR+lijWCXtNHhc1TLIhovjsuRuNZ2pl1N+fJLVrm53?=
 =?iso-8859-1?Q?dkFXmwWcVxzvcLhU0WP6oEL0BYNuYCsNddHMl+pbDN4ClR5SZgmWdJ7CC9?=
 =?iso-8859-1?Q?+/NodesJjFNbD8143hH/b9JlOle5aLLlcVn7NwLEvYV/lCdak/weCHmnvx?=
 =?iso-8859-1?Q?MdQbIjrwWEAHnihRx6vNlfpAbmxHpEsE/olOEi5wfilHcIBbYHfT/lkElj?=
 =?iso-8859-1?Q?wugokfzYAFQr8tMHaXiE4MEv0+EPAWGyp/UMxC3TKVMDBinW2tYZOjozPl?=
 =?iso-8859-1?Q?s0Oh9H+jp4P/SugvJuH1lV1fLKcGj3047lOLnscj05h+NgLExn0am8xJ/n?=
 =?iso-8859-1?Q?oj/GYO3YzkZA/ZlVd+Lpa3Bz9wW5B0GeBaM/7eRnc2YNmloTMh9/9OBNOf?=
 =?iso-8859-1?Q?FlQPsEg0JpwZrM2WfdzN2pryNOIATDG+yvK6DZ6U0dYQMQAboMVDb1EIsy?=
 =?iso-8859-1?Q?Omb1prNawS/Bwma3aJKNw5d0VPwv4a1+vv/UMg38iPONRy8eMtVNpsOiIg?=
 =?iso-8859-1?Q?7IgQa1GKlu0Tw086VCreXXGKZIe/SoBNJxvOtRAp66i/0GPKujZoyJoZFX?=
 =?iso-8859-1?Q?RPe73pN56+Va1rofPBl/OqO/Sw3CWFC7QtpImB4/j+GBr+XFqL5mzEw2Pw?=
 =?iso-8859-1?Q?1BP2cSlf2XcZhoGMffP0OQW5IAqPwcueTYQgLXvXA9ya/ufKkHaiTG+nZM?=
 =?iso-8859-1?Q?Tq5u8jIsrigRJl7ZnmJ5HLJsfy4piA8J+xfK3fWeqEKqlrzfI44Jn19rdM?=
 =?iso-8859-1?Q?8bg5yByk9wZmM+WUkHa5YLZvtTXRlyHIt6wZseuZOho1vQX+gsbG3cA3bS?=
 =?iso-8859-1?Q?1OqW1H+D+yZ8FXCl2N04TxUf/bLJFyq+jsqQxls2rxaiQx3PLGKuEJKs3D?=
 =?iso-8859-1?Q?7SUHsxmhmOhuuJl+1GtwSmuj2pYt1nGPtFrh1xTlIPMAvQIxANtFlfsRHg?=
 =?iso-8859-1?Q?1vARdWGluf7WltxHKs/yhOJpQ96QsRpPkyFg5QHmaYKkHZVgVVoMRuqmY9?=
 =?iso-8859-1?Q?83te7Wpu9cKPqhCScokI/5EY2CWR0reK/YC01331GK50amT8r5xTjB20/S?=
 =?iso-8859-1?Q?lw1J1B2EjpF4P7h76C5Jx1/zhuZ68n5NSxCLHQrGWGkWfldXV483AVD0t+?=
 =?iso-8859-1?Q?pVDZhK3beeB2+/lqQpqAE6bLlAjidVMGs/VKcMSbB1JrG7hELDOEutuOCs?=
 =?iso-8859-1?Q?bziYxffWTN7x/J0/mw/dR/4VSp8WjjxekvdwjiINHSy2bwrwR1pCAhMb4M?=
 =?iso-8859-1?Q?5/k30FIa/0KRkKrIoyQs39wviK3xA0Th4xW1Aqeya1P+gInSvvHkV3xKcM?=
 =?iso-8859-1?Q?Gm?=
x-ms-exchange-antispam-messagedata-1: D3AtMfUA8xUvLu/7Z/RVOrojIv/qGB4nEDs=
Content-Type: multipart/mixed;
	boundary="_002_PN3P287MB1829E89506AAA47318D694EB8B48APN3P287MB1829INDP_"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 005ee8cc-3e7e-453b-8db8-08de89c2bd3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 16:31:02.4266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MebSl6kSO1wFu0F5nSxVwFEpXWyN1qb8lUOyeGgWT1vsks+sff7e1DC18prazPAHG0jAbncPyJbstefbcGGjXsmvwVftfYh3U10kBsMV1Ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0497
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56895-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email]
X-Rspamd-Queue-Id: F301F3194DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--_002_PN3P287MB1829E89506AAA47318D694EB8B48APN3P287MB1829INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=A0=0A=
Hi Sakari,=0A=
=0A=
> os05b10_set_pad_format() calls os05b10_set_framing_limits() before updati=
ng=0A=
> the ACTIVE format. As a result, the VBLANK control handler uses the old=
=0A=
> height when recalculating exposure limits, causing -ERANGE when switching=
=0A=
> to a larger resolution.=0A=
>=0A=
> Update the ACTIVE format before adjusting framing controls so control=0A=
> callbacks use the correct dimensions.=0A=
>=0A=
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> ---=0A=
> =A0drivers/media/i2c/os05b10.c | 4 ++--=0A=
> =A01 file changed, 2 insertions(+), 2 deletions(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=0A=
> index 4601e33b7e8f..476dbcb49351 100644=0A=
> --- a/drivers/media/i2c/os05b10.c=0A=
> +++ b/drivers/media/i2c/os05b10.c=0A=
> @@ -902,14 +902,14 @@ static int os05b10_set_pad_format(struct v4l2_subde=
v *sd,=0A=
> =A0=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(sd_state=
, 0);=0A=
> =A0=0A=
> +=A0=A0=A0=A0=A0=A0 *format =3D fmt->format;=0A=
> +=0A=
=0A=
This is the final analysis without this patch.=0A=
=0A=
Please check the logs in the attached file.=0A=
=0A=
When switching the resolution from 1280x720 to 2592x1944, the logs show tha=
t=0A=
while configuring the 1280 mode from the 2592 mode, the maximum exposure va=
lue=0A=
is calculated as 2219 (fmt->height + ctrl->val - exposure margin).=0A=
=0A=
However, after switching to the 2592 mode, the maximum exposure value is 77=
4.=0A=
=0A=
From both cases, it is evident that fmt->height is being calculated incorre=
ctly=0A=
It is still using the previous height instead of updating to the new resolu=
tion.=0A=
=0A=
Please share your thoughts. Am I heading in the right direction?=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=

--_002_PN3P287MB1829E89506AAA47318D694EB8B48APN3P287MB1829INDP_
Content-Type: text/plain; name="active_format_logs.txt"
Content-Description: active_format_logs.txt
Content-Disposition: attachment; filename="active_format_logs.txt"; size=3659;
	creation-date="Tue, 24 Mar 2026 16:28:53 GMT";
	modification-date="Tue, 24 Mar 2026 16:28:53 GMT"
Content-Transfer-Encoding: base64

IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjICAyNTkyeDE5NDQgLS0+IDEyODB4NzIwICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwoKZGViaXhAaW14OG1wLWRlYml4On4kCi0+J2NzaXMtMzJlNDAwMDAu
Y3NpJzowWzFdIi1jdGwgLS1kZXZpY2UgL2Rldi9tZWRpYTAgLS1saW5rcyAiJ29zMDViMTAgMS0w
MDM2JzowCnI6bm9uZSB5Y2Jjcjo2MDEgcXVhbnRpemF0aW9uOmZ1bGwtcmFuZ2VdIgptZWRpYS1j
dGwgLXYgLWQgL2Rldi9tZWRpYTAgLVYgIidjc2lzLTMyZTQwMDAwLmNzaSc6MSBbZm10OlNCR0dS
MTJfMVgxMi8xMjgweDcyMCBmaWVsZDpub25lIGNvbG9yc3BhY2U6cmVjNzA5IHhmZXI6bm9uZSB5
Y2Jjcjo2MDEgcXVhbnRpemF0aW9uOmZ1bGwtcmFuZ2VdIgptZWRpYS1jdGwgLWQgL2Rldi9tZWRp
YTAgLVYgJyJya2lzcDFfaXNwIjowIFtjcm9wOigwLDApLzEyODB4NzIwXScKbWVkaWEtY3RsIC1k
IC9kZXYvbWVkaWEwIC1WICcicmtpc3AxX2lzcCI6MiBbY3JvcDooMCwwKS8xMjgweDcyMF0nCm1l
ZGlhLWN0bCAtZCAvZGV2L21lZGlhMCAtViAnInJraXNwMV9pc3AiOjIgW2ZtdDpZVVlWOF8yWDgv
MTI4MHg3MjBdJwptZWRpYS1jdGwgLWQgL2Rldi9tZWRpYTAgLVYgJyJya2lzcDFfcmVzaXplcl9t
YWlucGF0aCI6MCBbY3JvcDooMCwwKS8xMjgweDcyMF0nZGViaXhAaW14OG1wLWRlYml4On4kIG1l
ZGlhLWN0bCAtdiAtZCAvZGV2L21lZGlhMCAtViAiJ29zMDViMTAgMS0wMDM2JzowIFtmbXQ6U0JH
R1IxMl8xWDEyLzEyIgpPcGVuaW5nIG1lZGlhIGRldmljZSAvZGV2L21lZGlhMApFbnVtZXJhdGlu
ZyBlbnRpdGllcwpsWyAgMTQ2LjY2NjA2NV0gVERFQlVHIG1heDogMjIxOSwgZXhwOiAxOTQ0Cm9v
a2luZyB1cCBkZXZpY2U6IDgxOjMKbG9va2luZyB1cCBkZXZpY2U6IDgxOjQKbG9va2luZyB1cCBk
ZXZpY2U6IDgxOjAKbG9va2luZyB1cCBkZXZpY2U6IDgxOjEKbG9va2luZyB1cCBkZXZpY2U6IDgx
OjIKbG9va2luZyB1cCBkZXZpY2U6IDgxOjUKbG9va2luZyB1cCBkZXZpY2U6IDgxOjYKRm91bmQg
NyBlbnRpdGllcwpFbnVtZXJhdGluZyBwYWRzIGFuZCBsaW5rcwpTZXR0aW5nIHVwIGZvcm1hdCBT
QkdHUjEyXzFYMTIgMTI4MHg3MjAgb24gcGFkIG9zMDViMTAgMS0wMDM2LzAvMApGb3JtYXQgc2V0
OiBTQkdHUjEyXzFYMTIgMTI4MHg3MjAKU2V0dGluZyB1cCBmb3JtYXQgU0JHR1IxMl8xWDEyIDEy
ODB4NzIwIG9uIHBhZCBjc2lzLTMyZTQwMDAwLmNzaS8wLzAKRm9ybWF0IHNldDogU0JHR1IxMl8x
WDEyIDEyODB4NzIwCmRlYml4QGlteDhtcC1kZWJpeDp+JCBtZWRpYS1jdGwgLXYgLWQgL2Rldi9t
ZWRpYTAgLVYgIidjc2lzLTMyZTQwMDAwLmNzaSc6MSBbZm10OlNCR0dSMTJfMVgxMi8xMjgweDcy
MCBmaWVsZDpub25lIGNvbG9yc3BhY2U6cmVjNzA5IHhmZXI6bm9uZSB5Y2Jjcjo2MDEgcXVhbnRp
emF0aW9uOmZ1bGwtcmEiCk9wZW5pbmcgbWVkaWEgZGV2aWNlIC9kZXYvbWVkaWEwCkVudW1lcmF0
aW5nIGVudGl0aWVzCmxvb2tpbmcgdXAgZGV2aWNlOiA4MTozCmxvb2tpbmcgdXAgZGV2aWNlOiA4
MTo0Cmxvb2tpbmcgdXAgZGV2aWNlOiA4MTowCmxvb2tpbmcgdXAgZGV2aWNlOiA4MToxCmxvb2tp
bmcgdXAgZGV2aWNlOiA4MToyCmxvb2tpbmcgdXAgZGV2aWNlOiA4MTo1Cmxvb2tpbmcgdXAgZGV2
aWNlOiA4MTo2CkZvdW5kIDcgZW50aXRpZXMKRW51bWVyYXRpbmcgcGFkcyBhbmQgbGlua3MKU2V0
dGluZyB1cCBmb3JtYXQgU0JHR1IxMl8xWDEyIDEyODB4NzIwIG9uIHBhZCBjc2lzLTMyZTQwMDAw
LmNzaS8xLzAKRm9ybWF0IHNldDogU0JHR1IxMl8xWDEyIDEyODB4NzIwClNldHRpbmcgdXAgZm9y
bWF0IFNCR0dSMTJfMVgxMiAxMjgweDcyMCBvbiBwYWQgcmtpc3AxX2lzcC8wLzAKRm9ybWF0IHNl
dDogU0JHR1IxMl8xWDEyIDEyODB4NzIwCmRlYml4QGlteDhtcC1kZWJpeDp+JCBtZWRpYS1jdGwg
LWQgL2Rldi9tZWRpYTAgLVYgJyJya2lzcDFfaXNwIjowIFtjcm9wOigwLDApLzEyODB4NzIwXScK
ZGViaXhAaW14OG1wLWRlYml4On4kIG1lZGlhLWN0bCAtZCAvZGV2L21lZGlhMCAtViAnInJraXNw
MV9pc3AiOjIgW2Nyb3A6KDAsMCkvMTI4MHg3MjBdJwpkZWJpeEBpbXg4bXAtZGViaXg6fiQgbWVk
aWEtY3RsIC1kIC9kZXYvbWVkaWEwIC1WICcicmtpc3AxX2lzcCI6MiBbZm10OllVWVY4XzJYOC8x
MjgweDcyMF0nCmRlYml4QGlteDhtcC1kZWJpeDp+JCBtZWRpYS1jdGwgLWQgL2Rldi9tZWRpYTAg
LVYgJyJya2lzcDFfcmVzaXplcl9tYWlucGF0aCI6MCBbY3JvcDooMCwwKS8xMjgweDcyMF0nCmRl
Yml4QGlteDhtcC1kZWJpeDp+JApkZWJpeEBpbXg4bXAtZGViaXg6fiQKZGViaXhAaW14OG1wLWRl
Yml4On4kCmRlYml4QGlteDhtcC1kZWJpeDp+JAoKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyAx
MjgweDcyMCAtLT4gMjU5MngxOTQ0ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKZGViaXhAaW14
OG1wLWRlYml4On4kCi0+J2NzaXMtMzJlNDAwMDAuY3NpJzowWzFdIi1jdGwgLS1kZXZpY2UgL2Rl
di9tZWRpYTAgLS1saW5rcyAiJ29zMDViMTAgMS0wMDM2JzowCjpub25lIGNvbG9yc3BhY2U6cmF3
IHhmZXI6bm9uZSB5Y2Jjcjo2MDEgcXVhbnRpemF0aW9uOmZ1bGwtcmFuZ2VdIgptZWRpYS1jdGwg
LXYgLWQgL2Rldi9tZWRpYTAgLVYgIidjc2lzLTMyZTQwMDAwLmNzaSc6MSBbZm10OlNCR0dSMTBf
MVgxMC8yNTkyeDE5NDQgZmllbGQ6bm9uZSBjb2xvcnNwYWNlOnJhdyB4ZmVyOm5vbmUgeWNiY3I6
NjAxIHF1YW50aXphdGlvbjpmdWxsLXJhbmdlXSIKbWVkaWEtY3RsIC1kIC9kZXYvbWVkaWEwIC1W
ICcicmtpc3AxX2lzcCI6MCBbY3JvcDooMCwwKS8yNTkyeDE5NDRdJwptZWRpYS1jdGwgLWQgL2Rl
di9tZWRpYTAgLVYgJyJya2lzcDFfaXNwIjoyIFtjcm9wOigwLDApLzI1OTJ4MTk0NF0nCm1lZGlh
LWN0bCAtZCAvZGV2L21lZGlhMCAtViAnInJraXNwMV9pc3AiOjIgW2ZtdDpZVVlWOF8yWDgvMjU5
MngxOTQ0XScKbWVkaWEtY3RsIC1kIC9kZXYvbWVkaWEwIC1WICcicmtpc3AxX3Jlc2l6ZXJfbWFp
bnBhdGgiOjAgW2Nyb3A6KDAsMCkvMjU5MngxOTQ0XSdkZWJpeEBpbXg4bXAtZGViaXg6fiQgbWVk
aWEtY3RsIC12IC1kIC9kZXYvbWVkaWEwIC1WICInb3MwNWIxMCAxLTAwMzYnOjAgW2ZtdDpTQkdH
UjEwXzFYMTAvMiIKWyAgMTcyLjcxNDU2Ml0gVERFQlVHIG1heDogNzc0LCBleHA6IDk3MAoKRW51
bWVyYXRpbmcgZW50aXRpZXMKbG9va2luZyB1cFsgIDE3Mi43MTQ1OTBdIFRERUJVRyB2Ymxhbms6
IDYyLCB2YmxhbmtfbWF4OiAzMDgyMwogZGV2aWNlOiA4MTozCmxvb2tpbmcgdXAgZGV2aWNlOiA4
MTo0Cmxvb2tpbmcgdXAgZGV2aWNlOiA4MTowCmxvb2tpbmcgdXAgZGV2aWNlOiA4MToxCmxvb2tp
bmcgdXAgZGV2aWNlOiA4MToyCmxvb2tpbmcgdXAgZGV2aWNlOiA4MTo1Cmxvb2tpbmcgdXAgZGV2
aWNlOiA4MTo2CkZvdW5kIDcgZW50aXRpZXMKRW51bWVyYXRpbmcgcGFkcyBhbmQgbGlua3MKU2V0
dGluZyB1cCBmb3JtYXQgU0JHR1IxMF8xWDEwIDI1OTJ4MTk0NCBvbiBwYWQgb3MwNWIxMCAxLTAw
MzYvMC8wClVuYWJsZSB0byBzZXQgZm9ybWF0OiBOdW1lcmljYWwgcmVzdWx0IG91dCBvZiByYW5n
ZSAoLTM0KQpVbmFibGUgdG8gc2V0dXAgZm9ybWF0czogTnVtZXJpY2FsIHJlc3VsdCBvdXQgb2Yg
cmFuZ2UgKDM0KQo=

--_002_PN3P287MB1829E89506AAA47318D694EB8B48APN3P287MB1829INDP_--

