Return-Path: <linux-media+bounces-45620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0BCC0BD53
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 06:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF4803BA216
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57FE2D6401;
	Mon, 27 Oct 2025 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="UC3cfHhi"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020107.outbound.protection.outlook.com [52.101.156.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E294221A421;
	Mon, 27 Oct 2025 05:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761543509; cv=fail; b=h2W2MbJp1ourS+1abxGkzJIjBSPs7jSoipdYR0QIeHuxaJsHltfGqogfqea/9GW67R5bCeBAVgvN7UPt+x7x8xAWnO72c7xFLOHSphC4NZ8ezBeO8K1dJ3DO6VQ+Ahbc1L7YzkzGlxRy+w6ny3lbGtJTFIKI1cLX5amTZTGONHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761543509; c=relaxed/simple;
	bh=gxR8c7kCZ6bsUIxFHih92B0WALxfM4e6KC2Ps8piIkU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=caoetr24Ul2zyI+ua/sXP7f4Qh199XJAPKYeraNnc/0DzUihkUbBCJjKCN9PJzWFagH11P5D/5Tgs2xM2DN5NulZtfa7YBvaklQhF73QPObxINOD9VNLPja83bv78Fr1CYGgnoFCQ9qfr8BggnlWAlK17datnhskRnNWErL7ikI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=UC3cfHhi; arc=fail smtp.client-ip=52.101.156.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6oCzT/BHMm1qHwW86Ic81dVKMmAbSl7GnAba5PeYGPRapfhe1+pZ1e/WxHkBTGD2za9VyNJqzGYLIvqrEJg5uuFHrvQmBzgE+OXTXLPXgzxNBLDOTd5tgl17eLkmYwcaFlFPkm81CD3KxffqX9ik1qXffCPGqRN833zlpYbE9kR7tptoNYTeY6B3a25JBgMgLZ4ydvObHjyPrlDJ2CmfasZ5JhmFj3wMHvpbBxHDgovE3WvvEEyug3Q/lm4AfOdYAMGrJZveHq7Pm9WiHe4BmhYNn82DIA1AGWGsDc4bWW5QPDUPkDWEvWkiTJ7b6RfhTfnqecmhdiyDfUCaVy9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQWBEGKKsy41kdmYoXVap89dHR0T0ZAjHi+0jx7+JZs=;
 b=RT9I7DTAlEqdhwyJIVQiuAu2ptf6Woe42WxGvZAYNIpGcrM1HQX8/sS4OIyMY+iiAetb1rObKVkNuHqA4jFpLjamMkT3iNCu6n9AwV79bjgB9zab6MM03jpcrpQHLk1DOmg0LRAMCnJPnWSUyRd6nzxugGZa2nTIZkdrst+vwPzG9y0NCSkQTjVMHm7byYsMN6h0qmZp0gek0Lwd6nXoVdRpP7seflyoodcMDVEZKx7hM4FljBrmbaH/W8e/HvUCPEipWTGbQfQ/HMyoZB3m3lYxpA+HHDEjc7WyBcMU+o4dut844mbYe1DR9x+0ZwH6JjBxRQnuP8rj059KauhKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQWBEGKKsy41kdmYoXVap89dHR0T0ZAjHi+0jx7+JZs=;
 b=UC3cfHhiNSc7TiBfVmfrmppsQJpjxVgisi4EAOdxkE7wWv4IpE4Jt2MZkM37VK2ot/cnU8Jd/QoYu4GVAnONQxHOPksrzTqVf62y/r5LiVCjm7Zg4oOchoELw6mYDGmNGzmuM47AqfDkbdNu87v9fZzvJhxP7ZZDTYIf8/8krf0=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SL2P216MB1564.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 05:38:22 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 05:38:22 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "bob.beckett@collabora.com"
	<bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v5 0/4] Performance improvement of decoder
Thread-Topic: [PATCH v5 0/4] Performance improvement of decoder
Thread-Index: AQHcK4Uq5Adj45JGQkK/LL36ZY6Fr7TVsJOw
Date: Mon, 27 Oct 2025 05:38:22 +0000
Message-ID:
 <SLXP216MB1148585540E13A1886964E37EDFCA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
In-Reply-To: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SL2P216MB1564:EE_
x-ms-office365-filtering-correlation-id: 377ce592-a233-4a8a-6dce-08de151b0b13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zqmlDw1c/jdTJgnxR4w8WQ1mYKjLHFAPxM0QRg2XnsGBXQLun/MIcYX6rEb4?=
 =?us-ascii?Q?N+DKxHK2qSeWV+/+o5/S7F20/pQ1BZ4qVrOaUGKzKFBCoSm0Xop9wruCxjL4?=
 =?us-ascii?Q?izASdLWWBRxCIrTKqImG6W/lyE49+wbPo9XJk1NnmM/H83eMbYR1cerGgJLZ?=
 =?us-ascii?Q?2NSsmSR3DEkYBBAgIebTGhUqj2hvAwveUk5XO3Jpu/MZNhV3CoubfYSPPe6p?=
 =?us-ascii?Q?UVfMyDV7Bu8FX5gC1PY0p5M3BiJi8rxwIxFIasxhN4CP7TKJOr3rTyra1pbr?=
 =?us-ascii?Q?iwHXOs4LxFCdJOa0CGYu2yF/5U9yGc2NbhPsW6xBIlQIJKjfS2gCDRlwuUg8?=
 =?us-ascii?Q?u+OlaGYEQhLZoqTb0EpMESmbAKh6y00Lpnqys/oVNt7bENHhnyjA401Emn9D?=
 =?us-ascii?Q?+PTYj+deHUj9b09VadhjrIaBGEClR9Fch//CIEqTXBS0iBdbmUXyHMOv0Q7g?=
 =?us-ascii?Q?DmuI/tD+tMHU8gmtqe+CDGPff0rPfOR4tAhWan1SP70YCCgxbqjXmM8luBtp?=
 =?us-ascii?Q?/t9fJdm12ldrUmFHqOXF22FF2g1MADDM+aYUd4KKBksr/eAOstsxo4JapCsU?=
 =?us-ascii?Q?zXFfQZueCGp/2fgMzKbpGR9huOD8s953N+3JyRqO070SwbX7XH9MNok1QCuM?=
 =?us-ascii?Q?lsnItWGYRcH3jLMdZogxSfUMGT8eVHWd47TkkctRgb3Ya8g1nnBU5x1md7ib?=
 =?us-ascii?Q?mX+KOhPGJqo3i6UnT5Jhb9yHeWJCFntuEyjxF+Xh8wCb4iFgjN/LUAyUeMbH?=
 =?us-ascii?Q?nbCFQRF+E71HfCCVwPFUVkn9mUNa5C8Z11TI87wP2HdtWIl2pbMhJ01b4I5c?=
 =?us-ascii?Q?T+Gy8iTmsravnUawONGN+vh+DnVhS5cNjOI2BEgSQeU/iCsArGZv25nqjMUS?=
 =?us-ascii?Q?36Sy9H+NNdblBIDO49OURPV6/oZri5g1lT4GMpUKK1q4EC0kul3p44koJLmW?=
 =?us-ascii?Q?Rgv/WdpaLLmrOinSU7gqPaIKe+q708xjd7RElWAOX0Gg8YeC04/lXUIsBnhV?=
 =?us-ascii?Q?L4kEsGjnS+OR0PnAk3UgGqvK0TCQZhrCAHu5OJTauTr7imI4S5aWJcj0Xyxc?=
 =?us-ascii?Q?7Pb7QYOWuLzMM2M1+ABQYYs22qVwpWiou+Jay6hDickATzK3pikFfmCNJ9Zf?=
 =?us-ascii?Q?3ZJAJ6jihqSzUKzqwufW7qR8mjOccVSl6eRHa+XCbrTopaYL5b6VJtcGjK4b?=
 =?us-ascii?Q?bTzbGY8wfX8P2fWXlYrRUtsIrJ8dJSp1+q/q+KzzGqciaYA/VNFeW0mRAQLz?=
 =?us-ascii?Q?nkbkgciT0lJVIjg/LkCM6Hjv7xzruGiAhurGD0iRSxWk1LwCWOTnYTuNv55H?=
 =?us-ascii?Q?v9kHBfF+Rc+kEh47HxH6ljuzkNjDqRLW4YMzONi/z+QgWLdGR0ycnrte6sjM?=
 =?us-ascii?Q?tdqbh7e7/Pb+Xr+hLVMz4MmMgkW2nQ5o4tiLWrXAebNFy+sKv93Rnn8H4jsI?=
 =?us-ascii?Q?p9WSa9j8O7d1NbkG/PGBBbtbdwXMeE9cjcugHafz0IVjZbt5IIYhFkvzaFsp?=
 =?us-ascii?Q?7p43tk1ciwj8VWL/vegcPbU8EyLsedh3s/pA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?z0iYXgkUVHIKHrAtpnuWfqUyL0ytgoGGO9UYoj7OBWU2qCDrqFOMaAvn6BFE?=
 =?us-ascii?Q?9hHBtBHvEZkaoKoh/aPoOOkDBdFDGxm/20FZ+IjmDRkpvlsPhuhha+sB5Ik5?=
 =?us-ascii?Q?OUU6XUtEAAGPPwF7UhNMI15Og/j2SSlV9kZ7yTnBt0x4S6CV6ByXi7esysy+?=
 =?us-ascii?Q?KsewWk5LYROMR4trnVkSfhZ64N7sDTN46sZR/v7r+s1vboHFeDxX0ALeypKI?=
 =?us-ascii?Q?+6tAYeaJiGY2ecn30FBIFRBTB8pQNKbdEeDdu0YdZgQh8wxU8dmfD8UyCqba?=
 =?us-ascii?Q?NeRZAmTrbbx0nWzgMDaC+HpGSYz6pP/xEfM1bPwdzj+7BgAseFGZ2e0UEwy7?=
 =?us-ascii?Q?XevXdx0U8JTz2CWNMsQQ8Ea9KqsgIHED0Hcq2LNwi6IUvhN9cDQWCLpKvjHN?=
 =?us-ascii?Q?yw5c8ZsfNYskSGXlYm7zQk+n5BnGtVmnLBGaVQCfb8sWch8orXxc21Fi7qg1?=
 =?us-ascii?Q?/hHWVoWc/8nlTPniE7rWbRKX0DyWbsmyQAy+k7e0AkEheY8K9jbN7Pqp2b62?=
 =?us-ascii?Q?YHuAH+vNAuJ1tD9uVR2cUug8UVWq+GgUVVsgdjZyyfTW1A/UJ7iPMplcBhlt?=
 =?us-ascii?Q?+2FJIsElNL7Ma9CYefc61g0uQNS/CAko3Hi0yMwu0cI8l+0CRKGiq4ZuA/e8?=
 =?us-ascii?Q?A/3HcQrk2GNVI9V4x634o+eWvm5JwAW9uzzoUJs3CqD4NBzUALjI2UcfUYrO?=
 =?us-ascii?Q?fpMRSOkEu89K6hY0yHkqhq1pF5Aq9dQeoa0zKEKpXYHpTLe4h6JXfbtyNpBk?=
 =?us-ascii?Q?BUhzr5IDEep0JzsjDy0AANFdSnEF6LYlwxeq3DG8H2ZnPSL5V40P/8ap4fP/?=
 =?us-ascii?Q?gbLlCAYVLva9JNT+b2BKfMiLic81Y306733Ai8Pw9BvENphwrY4CXpXu2aqV?=
 =?us-ascii?Q?JQJr52ghTRqmhV6SKHvJa+StYUsLzxRyePIGDWh4mjjAjmtshegSVfeMZ1BH?=
 =?us-ascii?Q?xfGY/EKEr6YO1v77ZlaT+444hER6yX6uXNjKMb05ycJPSjB43ziFUq2WxTIC?=
 =?us-ascii?Q?8fs+y5Uq74sw88c49mpsD/CMqlOJosz5V+FtRko+axUfgjZ2K/d+Nf9sz3LI?=
 =?us-ascii?Q?ZNLiJoabBI6zs9Pp5pxLQyyl2KISFCGFVflqoBVMyE7VN+/G3US4CsxalTQ3?=
 =?us-ascii?Q?7UM5RP+JbGrMMWZ0QPMZZ4G2Qk3XC4UA+7AC2d24Mg88xRhUO/NuMNiN3dmc?=
 =?us-ascii?Q?qu+ZGfGZLDZ1bqID/PPpOXVF87Y5I0bf3qu0B7/6mE5TjyD5a5VKJrzo52NL?=
 =?us-ascii?Q?wl48VOatveoV8ONpKyaQG81V81SaSxM7ouJ5j0boEf837To6PSyoXFZ3j1r3?=
 =?us-ascii?Q?hU98aUgSTMehpMP5OuFGYKlGLl1gFXgZl27qtgWYc2F3ChmpDdxLlD7q/PNR?=
 =?us-ascii?Q?GHL2PMUJarbeR1Cln2ukYUQd2ZgKsjjrDDzHJrG6iP7oTXvQVrlUU5as6RMC?=
 =?us-ascii?Q?7IiMEHctOPjqeDXIuXhNkyEyxWc3Y/V6s7EgWjMNnJHoyCqL/lASlIoHcLqP?=
 =?us-ascii?Q?xVgoMFXgzqnw5ZUUondzv0qEP6Qhy/ygpCnAZ7/UepZ/vJHJHFHwysVScLOr?=
 =?us-ascii?Q?coI+m5vwh5ScviFdjsaXeqs1elh5prROpaZfgWLQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 377ce592-a233-4a8a-6dce-08de151b0b13
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 05:38:22.7152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EARPrMIIf5GXmrmTrCZS6A6sjJ2XYC247UzgDlWAkWQuo/+9FUO4WQHz1RkWUDyHfXoEW3v+kZVkr2cb1mf24hQYcJWQcyWIu9/fPgLqYE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1564

Hi Nicolas

Can you review these patch series ?

Thanks
Jackson Lee

> -----Original Message-----
> From: jackson.lee <jackson.lee@chipsnmedia.com>
> Sent: Monday, September 22, 2025 2:53 PM
> To: mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
> nicolas.dufresne@collabora.com; bob.beckett@collabora.com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; jackson.le=
e
> <jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>; b=
-
> brnich@ti.com; hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>
> Subject: [PATCH v5 0/4] Performance improvement of decoder
>=20
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> v4l2-compliance results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
>=20
> Buffer ioctls:
>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
> supported
>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
> supported
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>=20
> Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0,
> Warnings: 2 Total for wave5-enc device /dev/video1: 46, Succeeded: 46,
> Failed: 0, Warnings: 0
>=20
> Fluster test results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.=
0
> Using 3 parallel job(s)
> Ran 133/147 tests successfully               in 40.122 secs
>=20
> (1 test fails because of not supporting to parse multi frames, 1 test
> fails because of a missing frame and slight corruption,
>  2 tests fail because of sizes which are incompatible with the IP, 11
> tests fail because of unsupported 10 bit format)
>=20
>=20
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
> Using 3 parallel job(s)
> Ran 78/135 tests successfully               in 43.354 secs
>=20
> (57 fail because the hardware is unable to decode  MBAFF / FMO / Field /
> Extended profile streams.)
>=20
> Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0
> Using 3 parallel job(s)
> Ran 25/69 tests successfully               in 40.413 secs
>=20
> (44 fail because the hardware does not support field encoded and 422
> encoded stream)
>=20
> Seek test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. gst-play-1.0 seek.264
> 2. this will use waylandsink since gst-play-1.0 uses playbin.
>    if you don't want to hook up display,
>    you can run gst-play-1.0 seek.264 --videosink=3Dfakevideosink instead =
3.
> Let pipeline run for 2-3 seconds 4. press SPACE key to pause 5. press 0 t=
o
> reset press SPACE to start again
>=20
> gst-play-1.0 seek.264 --videosink=3Dfakevideosink Press 'k' to see a list=
 of
> keyboard shortcuts.
> Now playing /root/seek.264
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...aused
> 0:00:09.9 / 0:00:09.7
> Reached end of play list.
>=20
> Sequence Change test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> gst-launch-1.0 filesrc location=3D./drc.h264 ! h264parse ! v4l2h264dec !
> filesink location=3D./h264_output_420.yuv Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> Redistribute latency...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> Redistribute latency...
> Got EOS from element "pipeline0".
> Execution ended after 0:00:00.113620590
> Setting pipeline to NULL ...
> Freeing pipeline ...
>=20
> Change since v4:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v5 4/4] media: chips-media: wave5: Improve performance of
> decoder
>  - fix the error which the Media CI rebot reported
>=20
> * For [PATCH v5 2/4] media: chips-media: wave5: Fix Null reference while
> testing fluster
>  - fix the error which the Media CI rebot reported
>=20
> Change since v3:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v4 4/4] media: chips-media: wave5: Improve performance of
> decoder
>  - fix crash and dead lock while testing seek
>=20
> * For [PATCH v4 3/4] media: chips-media: wave5: Add WARN_ON to check if
> dec_output_info is NULL
>  - update commit message
>=20
> * For [PATCH v4 2/4] media: chips-media: wave5: Fix Null reference while
> testing fluster
>  - add thread irq logic
>=20
> * For [PATCH v4 1/4] media: chips-media: wave5: Fix SError of kernel pani=
c
> when closed
>  - add Reviewed-by tag
>=20
> Change since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v3 4/4] media: chips-media: wave5: Improve performance of
> decoder
>  - squash v2's #3~#6 to #4 patch of v3
>=20
> Change since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v2 2/7] media: chips-media: wave5: Improve performance of
> decoder
>  - change log to dbg level
>=20
> Change since v0:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v1 2/7] media: chips-media: wave5: Improve performance of
> decoder
>  - separates the previous patch to a few patches
>=20
> * For [PATCH v1 3/7] media: chips-media: wave5: Fix not to be closed
>  - separated from the previous patch of performance improvement of
>    decoder
>=20
> * For [PATCH v1 4/7] media: chips-media: wave5: Use spinlock whenever
> state is changed
>  - separated from the previous patch of performance improvement of
>    decoder
>=20
> * For [PATCH v1 5/7] media: chips-media: wave5: Fix not to free resources
> normally when
>     instance was destroyed
>  - separated from the previous patch of performance improvement of
>    decoder
>=20
> * For [PATCH v1 7/7] media: chips-media: wave5: Fix SError of kernel pani=
c
> when closed
>  - separated from the previous patch of performance improvement of
>    decoder
>=20
>=20
>=20
> Jackson Lee (4):
>   media: chips-media: wave5: Fix SError of kernel panic when closed
>   media: chips-media: wave5: Fix Null reference while testing fluster
>   media: chips-media: wave5: Add WARN_ON to check if dec_output_info is
>     NULL
>   media: chips-media: wave5: Improve performance of decoder
>=20
>  .../platform/chips-media/wave5/wave5-helper.c |  28 ++-
>  .../platform/chips-media/wave5/wave5-helper.h |   1 +
>  .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
>  .../chips-media/wave5/wave5-vpu-dec.c         | 174 ++++++++++++------
>  .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
>  .../platform/chips-media/wave5/wave5-vpu.c    |  98 ++++++++--
>  .../platform/chips-media/wave5/wave5-vpu.h    |   2 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.c |  61 +++---
>   .../platform/chips-media/wave5/wave5-vpuapi.h |  12 ++
>  .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
>  10 files changed, 285 insertions(+), 102 deletions(-)
>=20
> --
> 2.43.0


