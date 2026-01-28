Return-Path: <linux-media+bounces-51739-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKM0BkAKemk82AEAu9opvQ
	(envelope-from <linux-media+bounces-51739-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:08:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87982A1D48
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E8C23017F9F
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9897C35292C;
	Wed, 28 Jan 2026 13:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epitech.eu header.i=@epitech.eu header.b="QemHmqW9"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023082.outbound.protection.outlook.com [52.101.83.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767A350D53;
	Wed, 28 Jan 2026 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605580; cv=fail; b=MacflHvhNHNuc8nnjiwM0F11WxlKq8r5jDYI9AxU5f5NeiBksNBxNfp/8BB8zj7meBR5hhzLUPZmcohjhxReXLKIDFR755RevMVIehHtsArSdQsgoroO2fufYHnlGTDPCkiPxkPxEzYWAsY9hbQqaH1cfz5PAXMGvjj0+A4eeNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605580; c=relaxed/simple;
	bh=VYnqfpcl7Kab3QqIJDuDp2kxTQ1I6S8UXqM3/orCEYI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q8SkvQk16Flpb3gbT0KO6pf4jE5c1jxMJQw9VffQfXfeh5O8lx0PfaT7TXv7qfSZ4om95finHWdV1C6rI9FowpPaYKCJyivrD7VJ7gNTJt3hCumDVVCwX4oQN8SZXOonKDKBzCTdDY+uJnOj17TGsIsaL/lhtR7QIi/+MXOCQ8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epitech.eu; spf=pass smtp.mailfrom=epitech.eu; dkim=pass (2048-bit key) header.d=epitech.eu header.i=@epitech.eu header.b=QemHmqW9; arc=fail smtp.client-ip=52.101.83.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epitech.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epitech.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDzapzWQqiai7HUQWFYDVFeyvu+4Aa1+0bw76tcY2O1zl6QzSzMPHJYS4K35eGB5fBYOzdvDgbVuMnxj2Vd3HhkZ8FsxWoGAD3rkKBSeXWCsNliSy33fVKJJgBBsKlDInSS6zYqWNdE1770EdoTTiIUq9phxyfQRf1foaqQ+s64C13utbuI3Q5B4DDy/QbanLdR1+RTbkTpl8ejU9e85HXw9cm9BGmz6aMHsyvtvy9A+5KyW+b+jC2wupaZcNFVmJ+z7md8HYPajbY5yb8mqv0ilWDGiVVE8h8XQT4gnWkyn/HXlVjP7XTXFvgN/79tpVy+fic3CdRIGh9Sji9Gzxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcw5SQeQB79NmH30/ag54oobx6B0B8fMh26AbAG1d9g=;
 b=IW61Hmc/wOiXL+n1XRndTWtdLAkCWzrFUNBat2cQDfvV8d3yn2CceLf3yesJpFTv5kPqEKuQKKygsuxSw6fEV0niyQYygjGLxSWk9sSzYDXEb3EOY7SeriN3jmZszh8EBE3szkpNc07fgI4Wms4HKSqm6D8GTylzSc+blcbykqpX/xw1JmUVUoVfr/HkjK3QQ/XtlQUQFwQ9gCW04WZ8aCPATjN6km2r8dHaqjXE7YuvpnXUyGAAT5/+xMFM09T0olz0yyAThXq/y0Mbfcmro9X6d0ZD/Bus4ixg2pg913p7wfhLDWj3OLK2QqMiYdc4NtLAnjxd3leaZvNBy9lEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epitech.eu; dmarc=pass action=none header.from=epitech.eu;
 dkim=pass header.d=epitech.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epitech.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcw5SQeQB79NmH30/ag54oobx6B0B8fMh26AbAG1d9g=;
 b=QemHmqW9J/jHli9SQ7vcQ4TIyByimWSw8A4Hc7FHjEjYnmchv4U2LRJYaQ3dr27PA1126v4vaaVT3Jm5Gb7RG/QX4c9efsM83bkVbjHxtJ8PFMC/p2BAShPEjvWMgBnQ2onExY1FbnIYS5d+b4ednLaY+dzKXTAd0PT7RFFFmiqOiMNGrXZMV8mFSQ1IJKod3muhu7/6whuze25BqAUwg/nuCQDY6zw1lJZt38znALqVnRR4S/YySzsc9C2A/YIKe+c/+jxztO4rhIyUEcFnJ1xoZQHfJ3nJijG/W/gVFIcGSAzMd3pqnr5dRYXq58F3WVwNVdn0NmeLbAbf2GOAlQ==
Received: from GV2PR02MB11640.eurprd02.prod.outlook.com
 (2603:10a6:150:30c::17) by DB9PR02MB7890.eurprd02.prod.outlook.com
 (2603:10a6:10:324::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 13:06:15 +0000
Received: from GV2PR02MB11640.eurprd02.prod.outlook.com
 ([fe80::e704:a38b:6af6:68ee]) by GV2PR02MB11640.eurprd02.prod.outlook.com
 ([fe80::e704:a38b:6af6:68ee%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 13:06:15 +0000
From: =?iso-8859-1?Q?Timoth=E9e_Kremer?= <timothee.kremer@epitech.eu>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: [PATCH] staging: media: av7110: refactor sleep timers
Thread-Topic: [PATCH] staging: media: av7110: refactor sleep timers
Thread-Index: AQHckFbinB/068y+IkW9YSbFSor3ng==
Date: Wed, 28 Jan 2026 13:06:14 +0000
Message-ID:
 <GV2PR02MB11640D51CC0CEA2978D83E1638991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
References:
 <GV2PR02MB11640C6AA4BEEE7A1B584411C8991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
 <2026012844-abruptly-fraying-28a3@gregkh>
In-Reply-To: <2026012844-abruptly-fraying-28a3@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epitech.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR02MB11640:EE_|DB9PR02MB7890:EE_
x-ms-office365-filtering-correlation-id: 70395ac2-6285-4caa-38f9-08de5e6e04a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|786006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?eG/B6qtYdr+qSFc4axMdA84bmxAoaXsKCJH1aX1u1t2BCGQP9aX90rIj33?=
 =?iso-8859-1?Q?qCBaRuq7X53kx1X01l2eKOrtehM1pph6+jTfClAlcYzY/IlFPayzr2jSvX?=
 =?iso-8859-1?Q?n5Yiewtwaux3DiecGhwQYdX+E4PKT0XUscnF4sC6f8PmrBxPRUinA2lioR?=
 =?iso-8859-1?Q?WxS3ANUCzJPG1JMcymbreKCqJCpy7oz1lN2QtBI6RWGWP8/cq97fhOhuJ3?=
 =?iso-8859-1?Q?FExrVmT8RVgOkSKFBKWagr3kIHbmuznh9fVl422iIPqq5WcMqhkvHWkZbm?=
 =?iso-8859-1?Q?3auO6TFsKVOT2QEPPqAfkVcXPb6PwFcjtg0sxyApMpg3983uUD1U0dX/5P?=
 =?iso-8859-1?Q?+octnY2j53EFpZY/yfFfJ5QFK742PU9bQ/fxStkLW1sw1Xn4J1nuV44p2o?=
 =?iso-8859-1?Q?W/fF/iOq+h89FHlqMfbTLoWqBE8XHIb1cbj2rlb9wzPryvaLdbOyYGIfPx?=
 =?iso-8859-1?Q?Udk9eBGepMlA3A0IlpmY+e2PN1YehhzlDJBkX/92jxVXRNSia7dzbqfD1/?=
 =?iso-8859-1?Q?0l9WX+WkPfRzCd5iWo2lwGx9TRfsih9Bt3PxSs9TNT+GC2JGHAHZEbDhxf?=
 =?iso-8859-1?Q?oo+tIiaVo8DOM2oFyGNck3mpHG4ImJVL91QWrJehGEPp4Oz1yen5SnxQ/i?=
 =?iso-8859-1?Q?JdXuAJAoaOjbjPzR9WcDhVa/kiCu25idZyaRCO+rQFbADrz4Rg9MF/LxhP?=
 =?iso-8859-1?Q?FlQGS0G5pqkn7d5H2InWmgsuykoN73AiX2Ute8RR8YZXSHVFMMf0fe8KHt?=
 =?iso-8859-1?Q?8XENNtmLxYVIlz0k+1henZVeGg2qTUYz+fkmYTO0aEPdQ+uuLEUwiaVyF1?=
 =?iso-8859-1?Q?2gKjbfAelMt3TjgMm+KjB5K/ESo/plpwmmRZAlfi333DBX2TRVRKyoJNXj?=
 =?iso-8859-1?Q?5K4HtpTGI75AozXAU4NxUFpjcG1SkJYkxO5QE70kn22KGK6BSZiWQj85yY?=
 =?iso-8859-1?Q?HicMvmfJzgMjpJVas8sSmbOaUeCuVhsA4okqVoiS5e+ealzuuk3rzX20i0?=
 =?iso-8859-1?Q?sekU1YTeLbxk+9c0rBorJcZSl5O1arwa93E/gpR/6GIZFa0KRj+SN5jx3R?=
 =?iso-8859-1?Q?glD82Lv42k2opbFxHpY6vnrhX2LtBnRgjqTWPDJbGjXvxcvfky46/GpASS?=
 =?iso-8859-1?Q?dZ4jy6Xs0bBQ+M5gtSe7PCgrwEMU4C9z5S+4kdQFScTdtwIJSY+Cnb61lN?=
 =?iso-8859-1?Q?hxqhR+yLpJN8n6VnKkRPv3NMXNxj1R5t/4pGUVyVttJxmvZ55nMd1AXfnQ?=
 =?iso-8859-1?Q?XDK0aWOj/9WXwUtbgcUDVIWHriXP/rnELC305TMVxDt3yZfnhb3eq0Hlrx?=
 =?iso-8859-1?Q?XVnMawpli1CqmR+PrmU2gcWJuD1WIwHr28oHgeABkr2MAhS7kP99BjAjRo?=
 =?iso-8859-1?Q?EDQIZo7VqMUdrEYUpoQX5CZcRr1JU6onSI+S3TB7bgyzKExhJKE0jbD90a?=
 =?iso-8859-1?Q?G3T/JClQIqH/nj+OH3paQ6NtHSnc/7JXarhgKRxV8EnjQGhjbaUwui9A0u?=
 =?iso-8859-1?Q?WlGt0FVdNVJQVienzP5MpHoklroisOdAZBSToVlZAm4Dk66Wnh9fn/O0Np?=
 =?iso-8859-1?Q?RPdhjxsOSZVqQMfYH/wxJUK69XtnRbRXEy+LhFz4xHrGq9vJnaGUI+fIGo?=
 =?iso-8859-1?Q?5BY/QOauiuEwh9WjRCYMFl6Z7BAZ1YQ/jeiRzGcj6nlVBXMLDcxEBDrjEV?=
 =?iso-8859-1?Q?8I1mSZA/LeHLpDfnYtM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR02MB11640.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(786006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gHSpDZdAjiAKiLG9x+UuGnTCVvBhl54pavht1NMLYu7FpMW1XKk2JdYtRg?=
 =?iso-8859-1?Q?gPSslMgG4tVOFYQ9X1diPQfM9ZRfVzjQx0WC0O3ozZs9QtezW/iASwh0qI?=
 =?iso-8859-1?Q?3Gv9l0SOz2iKS/U6AnaQi70STFHB1xGWopoK7/esnaqWVJ8PBYdGoIxkDL?=
 =?iso-8859-1?Q?qD0jxbLg84/JazCvvTbIAkgxiiBaD1sLxLws5IGZ3h9ijNGLbjnx2PtBjK?=
 =?iso-8859-1?Q?wM+7NLMc6yiG7E03UBljabEK58JYL3AU4konHvgUw2JBM1Rke3iUz5mBOq?=
 =?iso-8859-1?Q?gge2dWoC6i2XFNg6pW6w46CW3BmyDgn5zo5jY+ygYg8Fg9W7JmDV2eypvc?=
 =?iso-8859-1?Q?eTrHRN7ura4DmvdcrGtOtu3cE6iYWN9VoTgc6EG/o3p4mBC5aaf3Ujoyzl?=
 =?iso-8859-1?Q?nC5yko41+jz5bCIIYeHo7KhihONYufER7r+xrIqg+fSS3tGNLHBt0WEBkf?=
 =?iso-8859-1?Q?d9Im+Tgp7f2vXxOV+BeFvITgvlKWqzvhyEC9hZnAIhuEg0HiC48Bv/e0np?=
 =?iso-8859-1?Q?SDd39l2JjDdqRpte+6LUourGMAYJhv68L7nHy8emfnHbR6LydQci+hyfTg?=
 =?iso-8859-1?Q?jEtrwZW3tz+oIrFWe5lG6qmUjgt8giJY//Rgc12QCJznSRBFmZkMdlWEZG?=
 =?iso-8859-1?Q?dWb9Qow4Cees/hELzEBVwlZXCSyxpBUJb9JEjq8rYGMMNPT7Ua4evobXLg?=
 =?iso-8859-1?Q?x19iewmLOWgE/IulTifwRHFqHaJ2kxebGrzh8kdhxLnND+sv0YIQ67NwR1?=
 =?iso-8859-1?Q?uDnOgWrQT+hgz8Qq1SUJTYRqBLib/MI25zwm4AJA0mmPypIU5QPanzdBpb?=
 =?iso-8859-1?Q?7ADHlrstAkKcWW7iXxarPLq0jJM1aNtTP8OfGFxLj6IKMIhedFKlJ8Sijp?=
 =?iso-8859-1?Q?HhfUp8kjOcwDr6Us7LQ8DRQ82CTkEe67FzeweF8HQMkxPipdLTrET8jypQ?=
 =?iso-8859-1?Q?UtIfkMTVxYee9dRh1iU8XfQsLxtbBC3gS5GNHoxk3IQ0et/2vABLFUh1hP?=
 =?iso-8859-1?Q?k1fkIt+H04oDf1DA7JrpKFXi8aKAlGAyk+g4CSXOpELsVeCZUDdWsbSkJ8?=
 =?iso-8859-1?Q?HzGf19ZnQk6l0PcpksQoRVoUqBZ7Y+T871NRN0s1WYdyELpp9nLCSthhaw?=
 =?iso-8859-1?Q?nY0uB7r+WqYnDHVYwhg00tSL2A8J6Lv2ulbreNKezgp4nX+NW/VGxPOTdy?=
 =?iso-8859-1?Q?cITFoNfMx16uclrq/xInSdktg2hajL1vvemN9So2D0VmRTnm1YaCAfNF7d?=
 =?iso-8859-1?Q?5xClQHLcVD1+jmiHPkwIjYv8wBk7g7HuUs+vNQU/VBBH8oUCDd9bHuSDaG?=
 =?iso-8859-1?Q?0VqxVbtWh3YwufDzaQ5TYstslDHjovitljoDrwBcCcuwS9JoBunlTO1sTO?=
 =?iso-8859-1?Q?yi1xUBxf7qIGPJJwe3AldD3lgGP8GZEM8YUrVRPiigdowE+e8So5v3kubK?=
 =?iso-8859-1?Q?OWCaUQCw3E0nAfbWLogecGp+RbWAGPq9W5h0HLbQ/GTtxYnQImFebtt3t8?=
 =?iso-8859-1?Q?Y4l7kBIfz8Kjj2ziOvoqA4IQum2mHpmzqs1m5WjPMUiw0rLpfejFChC+B9?=
 =?iso-8859-1?Q?+E49vX6WCEjLcNK9eEu0B/q8z4+99BH8lQno8mgOhTLvNCtj3+tr2vVx2B?=
 =?iso-8859-1?Q?zJ09sDhmrXdI+5gbHqq9nb7S3VC1KE3iMT1nf/7bp8gsN85w2wzOia+fVL?=
 =?iso-8859-1?Q?La/egHjLxfKCPCE3aXTICyFLiNzzS+q24fFxbW8xnflVk8C2/XsY17EHFV?=
 =?iso-8859-1?Q?0X7iFXvE++PGq2vX1W0gL/zPkJG9SeBIz1EmBHm+uv/IfEzuJh04KVAW7U?=
 =?iso-8859-1?Q?ss10lvXdjA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 70395ac2-6285-4caa-38f9-08de5e6e04a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 13:06:15.0042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 901cb4ca-b862-4029-9306-e5cd0f6d9f86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SyfgD8M9BhlTm1a1SgzzRzRjdt2WH1v/WtSd+4jty4T39/C3QWCWg2vA5VccJa32jDEVo+CQBKlzFy5AZhCALf5F9vwwseqOGtvN0ZtMkZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7890
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[epitech.eu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[epitech.eu:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-51739-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[epitech.eu:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timothee.kremer@epitech.eu,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,GV2PR02MB11640.eurprd02.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 87982A1D48
X-Rspamd-Action: no action

From e910a2c461328eceb168646779065583d88b5582 Mon Sep 17 00:00:00 2001=0A=
From: =3D?UTF-8?q?Timoth=3DC3=3DA9e=3D20KREMER?=3D <timothee.kremer@epitech=
.eu>=0A=
Date: Wed, 28 Jan 2026 13:57:30 +0100=0A=
Subject: [PATCH] staging: media: av7110: refactor sleep timers=0A=
MIME-Version: 1.0=0A=
Content-Type: text/plain; charset=3DUTF-8=0A=
Content-Transfer-Encoding: 8bit=0A=
=0A=
Refactor sleep timers to use usleep_range() for short delays (<20ms)=0A=
while retaining msleep() for longer delays to maintain hardware stability.=
=0A=
=0A=
Signed-off-by: Timoth=E9e KREMER <timothee.kremer@epitech.eu>=0A=
---=0A=
 drivers/staging/media/av7110/av7110_hw.c | 20 ++++++++++----------=0A=
 1 file changed, 10 insertions(+), 10 deletions(-)=0A=
=0A=
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/med=
ia/av7110/av7110_hw.c=0A=
index bf8e6dca40e5..49ce295771e4 100644=0A=
--- a/drivers/staging/media/av7110/av7110_hw.c=0A=
+++ b/drivers/staging/media/av7110/av7110_hw.c=0A=
@@ -312,7 +312,7 @@ int av7110_wait_msgstate(struct av7110 *av7110, u16 fla=
gs)=0A=
 			pr_err("%s(): timeout waiting for MSGSTATE %04x\n", __func__, stat & fl=
ags);=0A=
 			return -ETIMEDOUT;=0A=
 		}=0A=
-		msleep(1);=0A=
+		usleep_range(1000, 2000);=0A=
 	}=0A=
 	return 0;=0A=
 }=0A=
@@ -343,7 +343,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, =
u16 *buf, int length)=0A=
 			av7110->arm_errors++;=0A=
 			return -ETIMEDOUT;=0A=
 		}=0A=
-		msleep(1);=0A=
+		usleep_range(1000, 2000);=0A=
 	}=0A=
 =0A=
 	if (FW_VERSION(av7110->arm_app) <=3D 0x261f)=0A=
@@ -359,7 +359,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, =
u16 *buf, int length)=0A=
 			pr_err("%s(): timeout waiting for HANDSHAKE_REG\n", __func__);=0A=
 			return -ETIMEDOUT;=0A=
 		}=0A=
-		msleep(1);=0A=
+		usleep_range(1000, 2000);=0A=
 	}=0A=
 #endif=0A=
 =0A=
@@ -405,7 +405,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, =
u16 *buf, int length)=0A=
 				av7110->arm_errors++;=0A=
 				return -ETIMEDOUT;=0A=
 			}=0A=
-			msleep(1);=0A=
+			usleep_range(1000, 2000);=0A=
 		}=0A=
 	}=0A=
 =0A=
@@ -433,7 +433,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, =
u16 *buf, int length)=0A=
 			       __func__, (buf[0] >> 8) & 0xff);=0A=
 			return -ETIMEDOUT;=0A=
 		}=0A=
-		msleep(1);=0A=
+		usleep_range(1000, 2000);=0A=
 	}=0A=
 =0A=
 	stat =3D rdebi(av7110, DEBINOSWAP, MSGSTATE, 0, 2);=0A=
@@ -559,7 +559,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *reque=
st_buf,=0A=
 			return -ETIMEDOUT;=0A=
 		}=0A=
 #ifdef _NOHANDSHAKE=0A=
-		msleep(1);=0A=
+		usleep_range(1000, 2000);=0A=
 #endif=0A=
 	}=0A=
 =0A=
@@ -574,7 +574,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *reque=
st_buf,=0A=
 			mutex_unlock(&av7110->dcomlock);=0A=
 			return -ETIMEDOUT;=0A=
 		}=0A=
-		msleep(1);=0A=
+		usleep_range(1000, 2000);=0A=
 	}=0A=
 #endif=0A=
 =0A=
@@ -719,7 +719,7 @@ static int FlushText(struct av7110 *av7110)=0A=
 			mutex_unlock(&av7110->dcomlock);=0A=
 			return -ETIMEDOUT;=0A=
 		}=0A=
-		msleep(1);=0A=
+		usleep_range(1000, 2000);=0A=
 	}=0A=
 	mutex_unlock(&av7110->dcomlock);=0A=
 	return 0;=0A=
@@ -745,7 +745,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u16=
 x, u16 y, char *buf)=0A=
 			mutex_unlock(&av7110->dcomlock);=0A=
 			return -ETIMEDOUT;=0A=
 		}=0A=
-		msleep(1);=0A=
+		usleep_range(1000, 2000);=0A=
 	}=0A=
 #ifndef _NOHANDSHAKE=0A=
 	start =3D jiffies;=0A=
@@ -758,7 +758,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u16=
 x, u16 y, char *buf)=0A=
 			mutex_unlock(&av7110->dcomlock);=0A=
 			return -ETIMEDOUT;=0A=
 		}=0A=
-		msleep(1);=0A=
+		usleep_range(1000, 2000);=0A=
 	}=0A=
 #endif=0A=
 	for (i =3D 0; i < length / 2; i++)=0A=
-- =0A=
2.52.0=

