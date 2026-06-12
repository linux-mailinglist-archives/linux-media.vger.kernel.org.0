Return-Path: <linux-media+bounces-64686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WiYvNN7xK2oZIQQAu9opvQ
	(envelope-from <linux-media+bounces-64686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:47:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8F667914F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:47:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b="SOr9/11t";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64686-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64686-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 425FE30405AE
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12EC3EEAEB;
	Fri, 12 Jun 2026 11:41:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021130.outbound.protection.outlook.com [40.107.57.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8828B3EAC8F;
	Fri, 12 Jun 2026 11:41:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264486; cv=fail; b=RxJJW3PGszLcwDBEb8tEqNLMQKM/6bBC95chJWWpT7eyN7mEEmwsQWM0TGFXWuDY3yNCq2rGvi5+5/b5hpw50lyRfFTBLpSuA9q8KJSQVCWf9su4/nl9Q71Ab+OuY1zwtqgZkPNcMMwmYXVZ7J+jOtcFeuUlmgL3qdLl6g/WbVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264486; c=relaxed/simple;
	bh=HAfM50OQF/Rdn5+C+X5vmjG68C3+lUoXLRv/JAkbojI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Us0w2To8jUCXDC+xtSihZw05y9zPF6w+T+Xc6u+sSYTs1YCJN5K2vTs2p7ahtYRxbWELPOju6pg+9HKP2ct9oTCfmRvq4lZ9koBJL1GntBqhHBNwaUnuy3dfxeiseXxmzn76KZEdVPy2CtTVlmSuemLDr+UxgTSkp0v/oMbfyTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=SOr9/11t reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.130
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/0rfzw5gF5qfDs3UVrsIIDrG5q50tsZlgOvNkBIvopK+CdQXsgFvFWTRaG/34teSwnqjFDPmd0+ueEvqgpGxIYrc7fn76IZ/+ZcciNRy297MP4taGGG+3KDM/bXatT30jyt0QgefArGIniSHZfStebs6xRMOrgpLtgSdUy1Icmb8L+dzth8XUNzFyWOhrKcfvg4jwykzXzouycgUGWMzyJVvWYl1JlPn73hms7ZGZuel22hUUQ4Ae6VUw0dD3PBINq3sMEemnEl7GHPgfd1DS8kg7QZOMoqTttC82/koDbr7W3Yx2K3Fi39wgysNDvZcCmYG8vzEL8GE7ln9UmKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYPqJeYmG+vTx2pTgjk5TcTJbuC02E5VUiNcWW3gZfM=;
 b=rVUW7VmGUTo6uexDtrjPL1G+UkYkkYPFfgxoQAHLZNdO4Zka0+lAR/8R3ofCTJ3UnnwMJ/ts/P8qm8O10wCsj09/VH8ca8r3kvXWPBcsyLo/yfpwNfOv9/LUZsn2+xAuKmWv1U1agFgiSs0eNKVXifBfjNrljCflomR2QK/tyqHDktbkO3Tjr4kNyceEGJihhfKJBO9UUM4PBE5ETw12zeXTqFxWsrgXkPPSMepc+5c+JqVxclGwa54S743PvEwhnx/2EkxIlO5CHTUg0T39ysN0+QljGLPveyt3aFWGoMICsEXER4lEh2a2xydbBBXkYDK6MNbBIzUFx+b98tPuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYPqJeYmG+vTx2pTgjk5TcTJbuC02E5VUiNcWW3gZfM=;
 b=SOr9/11t/ZBYrshCY1G5qHX/4SrfjV0WQVlASrPuTJiHCIrS28yhWMr182AM3yrG3lSY7W+OMkuA6BvXcWeH/TMaF+t4jd7kCYqRYGqX2Jy0VvNUutqqkGhGlKxfPceaAjEOPTpXj3joQX3BDvtUNPjIydVQ9ADq4t34Rduc8hnff6nfjdzfZvvm2kEqLkH/uUiPbqs7yYCWGPAVe0NVGhMsih+W8dIdHdirlwGOy26Jspwjk1Eky7aGeB7PHHa5wDzBCWJ+tL0Knj7ilVtGCPc7K+MbmxWNumKiqicIHGj1n34XFFp7hKtd4YdtkFo5dZSOZR705ARTMMKrVMUrNQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4776.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 11:41:16 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 11:41:16 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans
 Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Thread-Topic: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Thread-Index: AQHc08yAQSLYRatbrUS/Khm2VQ9CG7Y7BoMAgAAClOY=
Date: Fri, 12 Jun 2026 11:41:16 +0000
Message-ID:
 <PN3P287MB1829A38F1D7D1098CBDEC8F88B182@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
 <0f4bfe08-0504-48ff-83ce-c84600e6f38d@linaro.org>
In-Reply-To: <0f4bfe08-0504-48ff-83ce-c84600e6f38d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA5P287MB4776:EE_
x-ms-office365-filtering-correlation-id: 411eeefd-37d3-47f4-d769-08dec8778345
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|56012099006|3023799007|4143699003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 royI2xM2RHktUssGc6N5hFAuiBS1KyRvUaglF4tBrCTf/GFs3YX8beUKZfIDRvoEfrOp22oZymD8rtqIcgF7FuGpDwBYDHhPiiUnBepitAVcK6JBbxoKslI9KBeSYD/2uGgzyFnNLUpaxIMWUaq3FtP7toETa1ryK6fm1wOx4elu3OGdVPfpHdQRibtUSDDwPgFnblV/r3AA2bUTg1M3q2d5Q6uIfTqpGb7NB4FWzKqiRBgwJaeaAfomM6TskD3105f6RNRMVxiqza+I9Jborlh8q8TWUbj/2QHp+pp+IJFLHfAN8pvGFKFGpIZL8fZUxVVkHRzzI6g/7W4LdlfMXrcJQfJ3Au9+Ai7TSlqWUztX1ZoujRRg7KAbCa8ORPpPMmRqwx2dSjBKFXDAwZefWsbOLmFfAB6LzpsMr2d1oslWIvmOuBksLlEB3tECuQh4Pn6jUVR5raQJhqv1KxYALGE/ju5xkIlBzgxKG7b2WyLtwiJr46sgGBMjVZQuCPc+zCV9Z+2mM9oyRfJ+5RRwlG5zaUzsv4omBHsWybVmcBxk4R44/aDfEo6bzsjL5Z2uqauZimS+w5OGDE1jaG3QpBYlZYQUfh91YJ6vw9ICh+2fCVDukzT+KmGUCz2qfFcHSGw7UXJCbdk4Td7+1W63GVFo8svV1A62AQWuVrcmfVHTTHXEMjNi/PDPuFauijnJ8ijuXJSTRo9n0qqIwsXbVw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(56012099006)(3023799007)(4143699003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5rpeRYnh8OXAh5N1CtAkP3iRNHJ4H5E96Ptm2S5PcS/ImgonaXpuXGeYGc?=
 =?iso-8859-1?Q?gZQwIIGpRKe8Sb/EphneCxD4w71L050NteYx2SpXT9m11YJA8r5CVYqWUl?=
 =?iso-8859-1?Q?ju5B/+wrjKznRzT8Debf8qHmknnSu2z72kvVkgy+O1uQfcXBErd/7tzcvv?=
 =?iso-8859-1?Q?W7cg2vUJ9JKXmR+XR8sqM1IJGayPWq84c/H2dXG64zW7NG8tO2EOVqmRW1?=
 =?iso-8859-1?Q?4OzRA+8hmu34HMiwzMsT4iQnnddjHSbaQxcbK3OLVnz0xp4HB9jLvVZY12?=
 =?iso-8859-1?Q?dQve/ONPdZcXEOoVOh+wpodGIND49DSwpRaR9vHlGs7nYX6RkezEEdHtX+?=
 =?iso-8859-1?Q?LHqWJSmaKkNBwOPI54K/svB7XD4491+DbnnnaB9HHoH7N9RmtxHhSYoZrr?=
 =?iso-8859-1?Q?/srSnt5qPB1YSUvxtYoXZKwATYvaMV8mx8EdoxWLdXnqTvbsa9dKNAqUyC?=
 =?iso-8859-1?Q?vLZXUtY+Ph2uKBnPgCW2Fgxd3jRw9Jf2jq/3Ts6Vkzc04JFoMplsS7nkLW?=
 =?iso-8859-1?Q?dNpMBhIgzXJlAbNNQb39LSlLeDbeVrQkdXSItuajrIb5c5w6xZYb0rCyMx?=
 =?iso-8859-1?Q?zQtsnpjH+Hhe5oU1IZG+KkNBKxO+uJ44A7B9Sae9Uvi1s7+M/3CoBEcx3I?=
 =?iso-8859-1?Q?HWDiDk6JdDQ19Px7Zqm6eeq3TYI5VRBi+v6sTKZctnP+u0UTpirEWtNItf?=
 =?iso-8859-1?Q?meiB/IriU7i5AZwhasELqWtovsMEEnyYkv8kOAeuyxzB9owIx4JxJCVJOP?=
 =?iso-8859-1?Q?eIkmbnUDyZfhakST3QB9qvCe0OqWbZPoJa3+vTP7C6u0WiiN4ixEk3J6PK?=
 =?iso-8859-1?Q?LIeLNPaTu49Y08Jdzd5HWYyykCO+IVDB2fp4kEbmbYyLLZAvtAgm+bPfTD?=
 =?iso-8859-1?Q?L2DePqA/Mr6WCwY8YIwmd42iPOG+pasxSiQuLOel+Eora6ALhEmBvOZFuA?=
 =?iso-8859-1?Q?3xp7p6tR2Wz9Sk3/aWFAFB18Vj4TcjRBQ8LCiVE6SMviiIILKq0Q41yA6B?=
 =?iso-8859-1?Q?0uJH7nJAXSEwpG91ICpZIgLEDRbIGDdq0X5uwkKuJCqoW0kgfTwJIVlwY0?=
 =?iso-8859-1?Q?n5rKODxvtrLhApjcc/YXgOt4NA9jMq2iCNhwMCs78yAYnyJiYl7AvIGHFw?=
 =?iso-8859-1?Q?2vvQa9+f1PwOwznVKaKuAr+Vv4v4uNsweZu5p7k8IhlQtZiATh3HhNDQ7h?=
 =?iso-8859-1?Q?AbDcpFDRRxu3mSOSr9QhL5RhoLg8+57sRWx8U17ZgDvD3NgUcuz6zvRJFT?=
 =?iso-8859-1?Q?PuZ5oJHxuJs5PYa0nUnnCnOrvizMh4GBVBZ0rw2zjIHXO7CNQbeZQijT7n?=
 =?iso-8859-1?Q?YHaVNMUC8KDy2y0Cl2G6GKrYaDfgm2PXOtQm9asSb/JbM2JaDpa2XR3cYQ?=
 =?iso-8859-1?Q?rACGMGi0FUjFnADuQm3IJKtBM7x+zjps7S+b6P5iXuVZJAzy1bsg/sbOlp?=
 =?iso-8859-1?Q?TjfABmeIfi3HW7lYGZkBNJLMt2w4jAK49k46bcMw6mhhsJkFSUIDRhTnmI?=
 =?iso-8859-1?Q?0uJwf+GpYOH4yHiCUyxY4+s5WxxtB1Dpj2AXFD3kmVw2ooyKmdO10hiiFV?=
 =?iso-8859-1?Q?sta+ouMnti5UG7T+P2AkNgNC8dxge/uY0gkXeGYEcz/aS1rfwHPkvGvf46?=
 =?iso-8859-1?Q?dNxU7gLwvNqgIHLYETRlXMS4ZEdweeQZ82aIa0yYRJ55AyVq9RCH+PvixI?=
 =?iso-8859-1?Q?hW+XeJi/UiA+8eUq2qVEJDuTcybQmzqrjR6K5pYjJfVDLJDAOMgDhToYmo?=
 =?iso-8859-1?Q?h+bFR888f+T87kTNYfIhlfFutUPIEzVr+vfeO0SGyxNDEkl0M1iVzmcj2G?=
 =?iso-8859-1?Q?yXueXRwufg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 411eeefd-37d3-47f4-d769-08dec8778345
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 11:41:16.2032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbF+cseWDvOcXEmgrWBOMFg+zcbdBK1n63zFNSlUHvblL+r/iGNpibwsYaKw9NcnKN4xh2M/a3LzElK7ZK5qg4E/f9ySzFnVShCrz4zSAvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4776
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64686-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:heimir.sverrisson@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[siliconsignals.io,ideasonboard.com,linux.intel.com,kernel.org,oss.qualcomm.com,foss.st.com,linaro.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,siliconsignals.io:from_mime,siliconsignals.io:email,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE8F667914F

Hi Vladimir,=0A=
=0A=
Thank you for the review.=0A=
=0A=
Since I authored this patch, I will try to address the comments below.=0A=
=0A=
> On 4/24/26 12:25, Elgin Perumbilly wrote:=0A=
> > From: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> >=0A=
> > Add crop support to os02g10 by implementing .set_selection() and=0A=
> > storing the crop rectangle in subdev state.=0A=
> >=0A=
> > Initialize the default crop to the active area, make set_fmt() use the=
=0A=
> > current crop, and update the output format when the crop size changes.=
=0A=
> > Also program the sensor window from the active crop/format state instea=
d=0A=
> > of using the fixed supported_modes entry.=0A=
> >=0A=
> > This allows userspace to configure the sensor crop window explicitly.=
=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
> > ---=0A=
> >   drivers/media/i2c/os02g10.c | 166 ++++++++++++++++++++++-------------=
-=0A=
> >   1 file changed, 103 insertions(+), 63 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c=
=0A=
> > index fad2dd0ad7aa..9bf8f5d1caea 100644=0A=
> > --- a/drivers/media/i2c/os02g10.c=0A=
> > +++ b/drivers/media/i2c/os02g10.c=0A=
> > @@ -112,6 +112,11 @@=0A=
> >   #define OS02G10_ORIENTATION_BAYER_FIX               0x32=0A=
> >=0A=
> >   #define OS02G10_LINK_FREQ_720MHZ            (720 * HZ_PER_MHZ)=0A=
> > +#define OS02G10_WINDOW_WIDTH_MIN             2=0A=
> > +#define OS02G10_WINDOW_HEIGHT_MIN            2=0A=
>=0A=
> Add a blank line before the new group of macro.=0A=
>=0A=
> > +#define OS02G10_VBLANK_DEF                   166=0A=
>=0A=
> This one is computable, and it can be dropped.=0A=
=0A=
=0A=
Can you explain how this value can be computed ?=0A=
=0A=
=0A=
> > +#define OS02G10_VBLANK_MIN                   25=0A=
>=0A=
> This macro shall be added to the group of OS02G10_REG_FRAME_LENGTH=0A=
> register, and it should be included into the previous change.=0A=
>=0A=
> > +#define OS02G10_EXPOSURE_DEF                 1100=0A=
>=0A=
> This macro shall be added to the group of OS02G10_REG_LONG_EXPOSURE=0A=
> register, and it should be included into the previous change.=0A=
=0A=
=0A=
I would prefer to introduce these macros here only, as they are related to=
=0A=
this patch. There is no use of these macros in the previous patch, so movin=
g=0A=
them there would not provide any benefit.=0A=
=0A=
I will group them in the appropriate place within this patch as per your=0A=
suggestion.=0A=
=0A=
=0A=
> >=0A=
> >   /* OS02G10 native and active pixel array size */=0A=
> >   static const struct v4l2_rect os02g10_native_area =3D {=0A=
> > @@ -152,15 +157,6 @@ struct os02g10 {=0A=
> >       struct v4l2_ctrl *hflip;=0A=
> >   };=0A=
> >=0A=
> > -struct os02g10_mode {=0A=
> > -     u32 width;=0A=
> > -     u32 height;=0A=
> > -     u32 vts_def;=0A=
> > -     u32 exp_def;=0A=
> > -     u32 x_start;=0A=
> > -     u32 y_start;=0A=
> > -};=0A=
> > -=0A=
> >   static const struct cci_reg_sequence os02g10_common_regs[] =3D {=0A=
> >       { OS02G10_REG_PLL_DIV_CTRL,             0x0a},=0A=
> >       { OS02G10_REG_PLL_DCTL_BIAS_CTRL,       0x04},=0A=
=0A=
...=0A=
=0A=
> >   static const struct v4l2_subdev_video_ops os02g10_video_ops =3D {=0A=
> > @@ -645,6 +684,7 @@ static const struct v4l2_subdev_pad_ops os02g10_pad=
_ops =3D {=0A=
> >       .get_fmt =3D v4l2_subdev_get_fmt,=0A=
> >       .set_fmt =3D os02g10_set_pad_format,=0A=
> >       .get_selection =3D os02g10_get_selection,=0A=
> > +     .set_selection =3D os02g10_set_selection,=0A=
> >       .enum_frame_size =3D os02g10_enum_frame_size,=0A=
> >       .enable_streams =3D os02g10_enable_streams,=0A=
> >       .disable_streams =3D os02g10_disable_streams,=0A=
>=0A=
> I understand that this change is written by another person, and likely=0A=
> it is not squashed with the previous one to preserve authorship, however=
=0A=
> it significantly rewrites the change already found in the series.=0A=
=0A=
I don't think this patch significantly rewrites the previous changes. Its=
=0A=
main purpose is to introduce a crop rectangle and implement set_selection()=
,=0A=
allowing userspace to stream arbitrary resolutions within the sensor limits=
=0A=
instead of being restricted to 1920x1080.=0A=
=0A=
> I don't see information about the maximum supported frame height/width=0A=
> or default VTS setting etc. anymore, for me it's hard to say, if=0A=
> this kind of information can be dropped with no consequences in runtime.=
=0A=
=0A=
The maximum supported width and height are still defined and enforced in=0A=
os02g10_set_selection(). The default VTS handling is implemented in=0A=
os02g10_set_pad_format(), where VBLANK is adjusted to maintain 30 fps for=
=0A=
the selected resolution. So I don't believe any information has been droppe=
d.=0A=
=0A=
> Probably this 3/3 change will break a quick inclusion of the sensor=0A=
> driver, you may consider to exlcude it from the series now, and publish=
=0A=
> it afterwards.=0A=
=0A=
Regarding whether patch 3/3 should be included in the current series, I am=
=0A=
happy to leave that decision to Sakari. If needed, this patch can be merged=
=0A=
separately once the new raw sensor model is finalized.=0A=
=0A=
This patch was created based on Laurent's suggestion.=0A=
=0A=
Link: https://lore.kernel.org/linux-media/20260414084952.217215-1-elgin.per=
umbilly@siliconsignals.io/T/#t=0A=
=0A=
Best Regards,=0A=
Tarang=

