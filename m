Return-Path: <linux-media+bounces-51746-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH96OI4memlk3QEAu9opvQ
	(envelope-from <linux-media+bounces-51746-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 16:09:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D40A38A3
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 16:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95DC3300825D
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 15:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536CA3644DF;
	Wed, 28 Jan 2026 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epitech.eu header.i=@epitech.eu header.b="sF/wrh81"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023103.outbound.protection.outlook.com [40.107.159.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C747E2797AC;
	Wed, 28 Jan 2026 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612937; cv=fail; b=j+MizJQfSHRyPsn8/XrxacHVDwxuOl+dwYcgDv6Q2h4HDSOMgwFTxK1nbbK+fCKqghwcBdu65M6CV8/SDe+sO/J5laERnFwubb9y22gIztpO+IlUJdUKJTe1giMWjkDxZkOEw4xhC8i/H/31AgteZP70STgJdmgp6FUEfmgqlm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612937; c=relaxed/simple;
	bh=H6IPE6LsAa3Y4Q0hcrnuwl5ZT+44R0NYTZ7ehbyC1rg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AdIUxIGI3aEUtV9hykr1pG+UolyI+291M2FoP8+ZzfK6zDcd4m1YjUJobci+ZPRLMgJmz4H8MDqD05HS99FnkRsASM4ZL1B6t0b0TUO4rc1zjB6U9hbRg7HCgS/cqPsaBl9m7DP2xOPGMF5RnKQgitjCKXgbODJ8G+0t7P5nvoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epitech.eu; spf=pass smtp.mailfrom=epitech.eu; dkim=pass (2048-bit key) header.d=epitech.eu header.i=@epitech.eu header.b=sF/wrh81; arc=fail smtp.client-ip=40.107.159.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epitech.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epitech.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNgUzI4T9M57YYDWAK6PS9d74D3cyaaesWyBe7Ag4XD3EIjwztHmw70LKW8+4RN0gncX4Ktrkj7P2dsMJT2IC5Gk/ryBxNbxT81q9Aiq3NKi4Wn+ws3e6JxSbAIWKD2g0TFPNEzL+m7FTkjgnUbrbVHWZsK/i5qMIyHvKox5OU6TjVa3kMNl+XLUlLoKbuoUw8mk5LV5cGj6Zei1ALMsn7iIBnkJPY8GajX1smJ1v36oKBqNpBI4TXTEBWNxxr+gEijOx3GSrXtGC0ZisPlxkCRSNymknej6Tk1vwlerWh78V2TKrpSFioZLH/3dQYtiDIZ3MyTQCk3Ot+bSNPUqFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vst4vLWlPiAk16Bw589OSCX+65p5RpPpQ/Zv2IISK48=;
 b=utoW1+KWBagJIa/7Bk4QZu1sHTjeVxgw5/vr9lXHwpZKWTGuzf3qlATjspHPnG3bbC7znIQ+rEZjUzcRr7r6q6zU8uMmLoM7V5qf41rsjAdBACacFmGM5491NN5RrZp36dNkc3RvgWKddtliDm53gdLMz/Y/zFfjqiQdrJ04l9tF8bbnnlT4VTx2hIFHORHXSM4L3XzN8Pg1dUr+MXQDzQ30zRq1z618rqzh7U7gIvtGDnzsl6lQnPdiYZy5A5lsOcIsdmDtGP3aOP5FwzWqKcUIoQPoKHKUsiLfKKlcPt94SNLYTJ0ueyWyGj2yg0dFRB2Q+kO26vj7PL5NoDIowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epitech.eu; dmarc=pass action=none header.from=epitech.eu;
 dkim=pass header.d=epitech.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epitech.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vst4vLWlPiAk16Bw589OSCX+65p5RpPpQ/Zv2IISK48=;
 b=sF/wrh81bpTRyOwdxoyPa5mbjSo11Rw/5qef2eReUdJfIlR7KI5ZG/qn8m3vYWT1JW+nsIWxZdgOEOLs2wJR0+q4tOcyrvQbSYBJl4uS+DrQxNLFxTb5+Jtp+JWj2euPxqj0pdOS4WPMK6po4mWCO8jqUueDRfw5G6ZIliun05HHOm08Di1B+G80Hm8UFEQs9yQ3J5EGThoSMitikYD1ciKAZe+9v+gigfqZsgA3BgsqLq3yOCWhbNplAgtIyKJK9o9zSBbACupjVtl/hYXEekh2wWzw+FCgTI3eXB8cqYufllERva3WuKqDKC2c7YmQsEYFgAKAtXY6ONk35B/3+A==
Received: from GV2PR02MB11640.eurprd02.prod.outlook.com
 (2603:10a6:150:30c::17) by GVXPR02MB10519.eurprd02.prod.outlook.com
 (2603:10a6:150:14f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 15:08:49 +0000
Received: from GV2PR02MB11640.eurprd02.prod.outlook.com
 ([fe80::e704:a38b:6af6:68ee]) by GV2PR02MB11640.eurprd02.prod.outlook.com
 ([fe80::e704:a38b:6af6:68ee%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 15:08:49 +0000
From: =?iso-8859-1?Q?Timoth=E9e_Kremer?= <timothee.kremer@epitech.eu>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH] staging: media: av7110: refactor sleep timers
Thread-Topic: [PATCH] staging: media: av7110: refactor sleep timers
Thread-Index: AQHckFbinB/068y+IkW9YSbFSor3nrVnrtSw
Date: Wed, 28 Jan 2026 15:08:49 +0000
Message-ID:
 <GV2PR02MB116404A030FFE770E324158D68991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
References:
 <GV2PR02MB11640C6AA4BEEE7A1B584411C8991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
 <2026012844-abruptly-fraying-28a3@gregkh>
 <GV2PR02MB11640D51CC0CEA2978D83E1638991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
In-Reply-To:
 <GV2PR02MB11640D51CC0CEA2978D83E1638991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epitech.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR02MB11640:EE_|GVXPR02MB10519:EE_
x-ms-office365-filtering-correlation-id: 5202a6d1-67a1-4768-62a0-08de5e7f2464
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|786006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oz/Z2FxsTNN9YPIfC8b6SmpiikclcLKIZ9a5lZc+oZMtapCSFWh9D5R7w/?=
 =?iso-8859-1?Q?SquNUN3amisq/CPOEkBwV+UWf9m9PB6Sdk9lW3MGWQbLeMOh5whXgG4Hfs?=
 =?iso-8859-1?Q?PeJDrgWt6UnARjBZtylAXdMUx9NAKTvh8j/NcZ45Hx78kM2F7Moh9EvIoZ?=
 =?iso-8859-1?Q?5WkBpuTIYrHIkq5dOL2V8dnFFt2aMcdFgGH7FZCBq9BU6qDjG5hELaOHr8?=
 =?iso-8859-1?Q?6sNykQDA0WLV+Z7DRZKBxrr5ed4gGpWS2+t2EyLHAE71MHWBoWTtVTc7PZ?=
 =?iso-8859-1?Q?2ECZaiueDJd97aRPQcAplGReKuhDlg2JTWP8xzhcB5225DtdJsvAOn9wWt?=
 =?iso-8859-1?Q?ZZF4wRY9szckD6WkaJtkMyUQGhVMbM3kYogVSabkIHiY2hoyKHpJiAzyig?=
 =?iso-8859-1?Q?1phKfxh3zy9bUVvUfj9LIZUj6mYXSSuoxAxM8esz9DVvbMXRyo63DV99x1?=
 =?iso-8859-1?Q?mjB+v2eZoHQuE0eROXc1KufsPO7rmy6m6ZKbYWgS5X3V7TfcKKau2bRfkp?=
 =?iso-8859-1?Q?VM7oBtmedoDO58lwdW8r0W/aQTYIzP9zd64hmu9tiiD9Bzzhn5ClVYd7kn?=
 =?iso-8859-1?Q?U5frhfvPsLEECf50LqklNx2toamRZ1M1CzOlhYNy7aXmIPDofH6sejXxMv?=
 =?iso-8859-1?Q?oA8kg2XbNOsiomt6c8J4BRCebswhYcdrCsOEjvCOAYDOhdgu/ldPgHFJtA?=
 =?iso-8859-1?Q?epOWF2TVpDdrSiDxTlGFky5KMTsGqbGEF5vRp57X14rV6wPBhkjR+s3H5V?=
 =?iso-8859-1?Q?b+h6Edfxeu8CX+WYGaf8v3c+PnoDQywiNH+aECuIZ5onjpd4cYhzLLc/bW?=
 =?iso-8859-1?Q?DpB/DbqAvKvDrUyHXwvtYOKiSZtYbjsEaNITT3YHZKVdzdKMLSPheZw9hb?=
 =?iso-8859-1?Q?TxATHuXKs8KTts04IJZUf/j6rXGOcVI/6U/ZKGIBg3bZf92kgyHDcSynLU?=
 =?iso-8859-1?Q?nWAacGDM+8tBN8iRY9lv2x/4k+AywvDxCzuuWFWwbVfyy56bih4xZ5npfw?=
 =?iso-8859-1?Q?d967PYYy6k3J7tHB1Bn1k7m9Z3zMy+vSpqoG1F2JOzJeNaoqM7NIGWilYL?=
 =?iso-8859-1?Q?aVkhJM36r4/IlbKmOI8SA73ss3B9HIep4RConMhhyXXg//H8GPE5uwCXWP?=
 =?iso-8859-1?Q?9VRczxPRHvwkgH2z7/F/W68DTHU7vT2gROf0hlSVi1bSconqiTf+kZNsNt?=
 =?iso-8859-1?Q?M2BfkcyXGB8rYNWEUKltjO5lAJYXEGB5T+n5NLVTDB8rTPmT2Q7vUH4PYI?=
 =?iso-8859-1?Q?1Qj5ZeykxGD1InZ5KGccjv1SOw0D1bptLx/JHsH2tb7uuc4G18Fki8zn/T?=
 =?iso-8859-1?Q?zYCZ7Pmzb7lOeCdrSGTiDAJfJuAVMTx8FIw1On6AUfluQdWsPPVyusBYAf?=
 =?iso-8859-1?Q?NKyiX5h4R7fMAgrqyElNja/O0mk2K+jzO9DvBid0YNYdu9y/ohF9wFXCpY?=
 =?iso-8859-1?Q?2gC87eF3ljTAOD92GLtVufQUOjDFa4aSG6mUpcg+ocushwEeSmNDKN/PA/?=
 =?iso-8859-1?Q?KzU9uOsIfCaQdvhsxXHS03L2Q9KJxclGPgsKQv5O85DXL0RkUXaJYauOvk?=
 =?iso-8859-1?Q?2ZL4TsGjk6vZDNoc3kW6iN8TFhi4YIQ0wwSoLt+95F9P1IOOSkcBciTH34?=
 =?iso-8859-1?Q?Hc9nFVZCIS8BBLmQ1ro8s3mfiiZugTgg1O/f9qBGcnlAw9IX//L8DLG+J+?=
 =?iso-8859-1?Q?uvNGFvBCKxBRi+5Ws0g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR02MB11640.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(786006)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZRDw0W9+CY7NUGjSecfGwR6v7lmREsiqpR72pg0cn6bTEAZKWXnPm1hhXW?=
 =?iso-8859-1?Q?DTrLEfqVfrGJK3ljlY4/QcQupCRz44C7yrrBetQjVScTZEAor4fT5dLnu+?=
 =?iso-8859-1?Q?pbwt3vxrOcGQoOrTSZpdE5IKyp4CrbWD5Gg6zKzc+QI9llmKY0BNbsfH7e?=
 =?iso-8859-1?Q?CVP6k3a2YIifYABxijaVHds7+9sXXFP0+vHMsKG9ibAc27nQ0Gs9lk6v+p?=
 =?iso-8859-1?Q?FAEED5vV9TVSqd7MRvbmJLCxmNCXFxSpMV2Z/mRs/yIpK5oPGdIjbvfcQB?=
 =?iso-8859-1?Q?VECQ6I2Yivq0Xj8wy0B+tRAIKOrsrOoRKnTwXxnTUEqeXIEqM6KaMgw9Sm?=
 =?iso-8859-1?Q?q1dntsDzUVfGrgfYq/4u0xxDPnArSal+VQToqoGAArwBraV08Qnio55ehh?=
 =?iso-8859-1?Q?z4gMNFcTc9bFKSEOcaEVqYZ7Z4mM2l483zGH8OVeH2JVXKBAnF7dZb/npj?=
 =?iso-8859-1?Q?Qyo/aI42W5dV9zCBfRT9ob3uURZiltHpPK+2OeWWa1Q1sBil0JlGyr+Sc/?=
 =?iso-8859-1?Q?u5btDsOecZJsyfPduFh7UUppBOMxUYeLGKofg/x+xd0pT3iuXb7q4QNAhl?=
 =?iso-8859-1?Q?TGey8Y9Fp7Uv8WwwGpvo9fi5L3iTXxw8hcNF7yGUgLh7NABwk8MDr3Wd9f?=
 =?iso-8859-1?Q?G4OfQ702qK4GdR94XoleZn/Fc2OA2vWUMnlpc9hEKzOiwbqEkuDIXNeXqV?=
 =?iso-8859-1?Q?mX22M9aTMTcSbNYPmQ6wBbq2gF1pLyq67PfA7I6qdhroiMlW3QgzluBqv3?=
 =?iso-8859-1?Q?PTmRT/O7PfI/P9jfkukUn4aFMNCtqWZccUi94Qw8MXU8PqNCDIZ7uIE3GF?=
 =?iso-8859-1?Q?iQu8M3nMjt4KvpytllVdlVGokCrUWFQeCs4pfHvm2TgZLyq7Pw5lN+L/KN?=
 =?iso-8859-1?Q?K7vFHCUnaETN0WPB6F/JdjJOTFIsVD5my+Fc7KF1mwrJgn7NeO9npUi0uJ?=
 =?iso-8859-1?Q?AKLhpe5DWE9QKy5bBvIuiTcnwg83pGPIdx9TcuEChvr1vZp7bjnSolCuRd?=
 =?iso-8859-1?Q?mSMoYGLGlwtu2JWoVxNPbPjLYvBRQO1T1AaqsykVKy7EM+yp1v6Q5uXILf?=
 =?iso-8859-1?Q?hJ5ZEyf7i6KBoFtxfXR5DB9WQVRqEXdtX2fqQUCYeKukwtzoDcuV49ylai?=
 =?iso-8859-1?Q?phAgL85hzvmfYkVNQ0zF99lL5W7GFuKacEWNcTsCnyE4Krk44Ls37Wxxkg?=
 =?iso-8859-1?Q?p+O3YYTi9HRJ0yd31a0Tvj7QM0qps3IRglxKvqsmNWla2jB5Ki3fDEHzh0?=
 =?iso-8859-1?Q?SHyXUzwTwlsKfglUpdFEgy6YQHLEMqgT+PWpDJriNeXCv/q3TtFsdpcJXe?=
 =?iso-8859-1?Q?OXRC5yrF5udNZy8ctDedJPDpb5vwfswwdxxCGdmoxX5su2BEgPHd+WGhDP?=
 =?iso-8859-1?Q?/Qalo5E0jeMslKvgqTK4dbsssVIBumfhf7blyU66N4ENGY90ZBuTboakQV?=
 =?iso-8859-1?Q?g+GESwV0bO5uJPvFcqBf2o+4C2fom+gOH5yFG4E5oWJWuxtP3/zOItVD8x?=
 =?iso-8859-1?Q?FNr8m3K4pzitxgDP7ERtP3GQ1JXCsEYxIl8wx6bV7V+BljrFyx2Ejtjyu3?=
 =?iso-8859-1?Q?m9aakfqtuM+PeRNpOw1J2+GQrghpk6i6V2Sbo81aeK/zwZPUQ76gO2S5IG?=
 =?iso-8859-1?Q?tgcsbnHJrbd8Habog+hpqkQo95oHMV49gheDgtD8riWd1cV0kuRNpw4kVS?=
 =?iso-8859-1?Q?4PidUUgaDAGhmQAci6Nw5vMMpxdzylxXkgFyyk7Hyd89YosZh7GO95wF7H?=
 =?iso-8859-1?Q?ErGVR+Lsuf1jFZo1hEWrpQ3n5wxvV277LHYEUFMLTITrW3zkQ/sXF3qL1K?=
 =?iso-8859-1?Q?27iMrZDgtw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epitech.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR02MB11640.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5202a6d1-67a1-4768-62a0-08de5e7f2464
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 15:08:49.7579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 901cb4ca-b862-4029-9306-e5cd0f6d9f86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /7N9y9Y6vKgJMIdz3W8sJnrw03dLHgzcraO3bPZ2RXbBqZy/ehelVyCTGlTzjoKqXC7nCdm6EntK/nD4L27SDqlCM0DIYh5CZGtWuWWpB6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10519
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[epitech.eu,none];
	R_DKIM_ALLOW(-0.20)[epitech.eu:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,epitech.eu:email,epitech.eu:dkim];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timothee.kremer@epitech.eu,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-51746-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[epitech.eu:+]
X-Rspamd-Queue-Id: 72D40A38A3
X-Rspamd-Action: no action

From 5169a8c4cf139011f2a4928ae2205d9f9e055675 Mon Sep 17 00:00:00 2001=0A=
From: =3D?UTF-8?q?Timoth=3DC3=3DA9e=3D20KREMER?=3D <timothee.kremer@epitech=
.eu>=0A=
Date: Wed, 28 Jan 2026 15:57:34 +0100=0A=
Subject: [PATCH] staging: media: av7110: remove dead code=0A=
MIME-Version: 1.0=0A=
Content-Type: text/plain; charset=3DUTF-8=0A=
Content-Transfer-Encoding: 8bit=0A=
=0A=
Remove two blocks of unused code wrapped in #if 0 to clean up the driver.=
=0A=
=0A=
Signed-off-by: Timoth=E9e KREMER <timothee.kremer@epitech.eu>=0A=
---=0A=
 drivers/staging/media/av7110/av7110_hw.c | 46 ------------------------=0A=
 1 file changed, 46 deletions(-)=0A=
=0A=
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/med=
ia/av7110/av7110_hw.c=0A=
index bf8e6dca40e5..b407446c69de 100644=0A=
--- a/drivers/staging/media/av7110/av7110_hw.c=0A=
+++ b/drivers/staging/media/av7110/av7110_hw.c=0A=
@@ -95,29 +95,6 @@ u32 av7110_debiread(struct av7110 *av7110, u32 config, i=
nt addr, unsigned int co=0A=
 	return result;=0A=
 }=0A=
 =0A=
-/* av7110 ARM core boot stuff */=0A=
-#if 0=0A=
-void av7110_reset_arm(struct av7110 *av7110)=0A=
-{=0A=
-	saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTLO);=0A=
-=0A=
-	/* Disable DEBI and GPIO irq */=0A=
-	SAA7146_IER_DISABLE(av7110->dev, MASK_19 | MASK_03);=0A=
-	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);=0A=
-=0A=
-	saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTHI);=0A=
-	msleep(30);	/* the firmware needs some time to initialize */=0A=
-=0A=
-	ARM_ResetMailBox(av7110);=0A=
-=0A=
-	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);=0A=
-	SAA7146_IER_ENABLE(av7110->dev, MASK_03);=0A=
-=0A=
-	av7110->arm_ready =3D 1;=0A=
-	dprintk(1, "reset ARM\n");=0A=
-}=0A=
-#endif  /*  0  */=0A=
-=0A=
 static int waitdebi(struct av7110 *av7110, int adr, int state)=0A=
 {=0A=
 	int k;=0A=
@@ -498,29 +475,6 @@ int av7110_fw_cmd(struct av7110 *av7110, int type, int=
 com, int num, ...)=0A=
 	return ret;=0A=
 }=0A=
 =0A=
-#if 0=0A=
-int av7110_send_ci_cmd(struct av7110 *av7110, u8 subcom, u8 *buf, u8 len)=
=0A=
-{=0A=
-	int i, ret;=0A=
-	u16 cmd[18] =3D { ((COMTYPE_COMMON_IF << 8) + subcom),=0A=
-		16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };=0A=
-=0A=
-	dprintk(4, "%p\n", av7110);=0A=
-=0A=
-	for (i =3D 0; i < len && i < 32; i++) {=0A=
-		if (i % 2 =3D=3D 0)=0A=
-			cmd[(i / 2) + 2] =3D (u16)(buf[i]) << 8;=0A=
-		else=0A=
-			cmd[(i / 2) + 2] |=3D buf[i];=0A=
-	}=0A=
-=0A=
-	ret =3D av7110_send_fw_cmd(av7110, cmd, 18);=0A=
-	if (ret && ret !=3D -ERESTARTSYS)=0A=
-		pr_err("%s(): error %d\n", __func__, ret);=0A=
-	return ret;=0A=
-}=0A=
-#endif  /*  0  */=0A=
-=0A=
 int av7110_fw_request(struct av7110 *av7110, u16 *request_buf,=0A=
 		     int request_buf_len, u16 *reply_buf, int reply_buf_len)=0A=
 {=0A=
-- =0A=
2.52.0=

