Return-Path: <linux-media+bounces-49888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581ECF2C6E
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 10:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C533303C9E1
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 09:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C2732C31C;
	Mon,  5 Jan 2026 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="b6dXXBwh"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020087.outbound.protection.outlook.com [52.101.227.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC1E32C939;
	Mon,  5 Jan 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605401; cv=fail; b=pBZImeh6s0tD3MU97M34orAkhd75Jw91/1M9+R8M+iM6bWM8Z9MRb5oP0a5BX1SL2GUhIaWZ92zmEc0KXabgwPq+2xh3Ua/7kl0GM13GF24l5s53T1y00xy1fUBZbeWObRVP4K/uoBG6a6ekfDrVTzUrpI0VeawrimEyq2Bq6LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605401; c=relaxed/simple;
	bh=WBokgG18U/qIzQ5/DuOIu+oVPmgCad3BO02iqE81vNw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ELP9Nm9EJ7KSoGNaJyNnw4iZqWZ27fNK/eONs2jpatB6e5DW7Yg858mLDkqKmCJ1YiWpp7OJLk6mR/hQKmXBO9rPfDzW21QTf21BqD8Xmo/+02R2kUieNf1bwqLRNf9Z3M55WOMkieca9ZhbfoZvNLXDve0xYlMEeVCxjPceLCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=b6dXXBwh; arc=fail smtp.client-ip=52.101.227.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4KYOOPF7zl6ccLAxR5vM/0sRP+8un35+N699OyUDimsQ7XPYFREcKF8hzd0Joj46uMvSAhvrFtslLshW+iZMZqkPJhF3XBykw1xs53BLgRW+8813xmDvuESu5KvSiNOzvHWtvIXFEYlB3PhbctiCdi1zCyrq0xONJvQEYcQOG0L+2ndo+uTpAPcEvlnLe9FXykYDV9I+IgBDqKHTT30lPKRLfpw52faFBZBlSgqOTPcAi+wOehmCg9Mz0YZuDNGTw+ggByYN504Y7E0YIv8/JTx9W+Sq/wEk914hzFJQ3AMbJZPSWcd0+IixOQo9eoR179rsLh9ISVoFn+5YAw4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBokgG18U/qIzQ5/DuOIu+oVPmgCad3BO02iqE81vNw=;
 b=ND9T/EPf9Srm8yVKtqMYwJQRM/aROvDvrL56T8MgxoaWYcszgVw9zyqiUCnsdjTgj6gxNSrS4FtMX6Kh3cJtwsyPr/EaOXVM7DL7TN5WGOPG2SoEaqz2Zw+Vuh+n5ZGBQUBdkjhF1dr+M1kLiamGZ/cfa7OlGEgvRr+c9c8E9d+43disKkPMm2lY//E1j7wY31B0uciMw5DshfWmm2N75bFfm70/gckVL4t4R+MIseBcDPydgUKogLYB2we8cpnzZUW0Cs/LV1+5HaOyROgXM3dAW7DIPzozFd/cxEP8cab5ZOO83UwKK6+1Dnjjlb8LwoZB7k6ZNblfrV5ae8DAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBokgG18U/qIzQ5/DuOIu+oVPmgCad3BO02iqE81vNw=;
 b=b6dXXBwhwYvhISfzOKSsWfMpOAW9/HAIAOf1fiU9G22k0r7ldn37cIkMdHoheIogR1T0vklyYg3t/zePmnw6sYV1zZmTqDF14opGDT0jMIb6R9g5ZI3GTb+SptzJO+aTk0zsyPcmsa/4C0Z/WqBLF5i+j6ZdND7tSWu1pIH56uX554KuHrHHFmrp3srHR6BgAzhpX6rrVN6krcr2AqRgPomziVEfmkAIPdHV/QfwM4WMAP25v87YroIq4cVJ08d+7Qyg97nOPMRHxOC/0kFrDRYaQ7PZWdQNWp32RKtqOfqBcQFvno7RwplCZpoSa5RMdtg7D/nETLPTz+xU9fR1bA==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3P287MB0944.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:29:53 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:29:53 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Hans de
 Goede <hansg@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Dongcheng Yan
	<dongcheng.yan@intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Jingjing Xiong
	<jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 0/2] media: i2c: Add os05b10 camera sensor driver
Thread-Topic: [PATCH v9 0/2] media: i2c: Add os05b10 camera sensor driver
Thread-Index: AQHcfiJNQkoKcKqDkky+THVji2vLMLVDTpwU
Date: Mon, 5 Jan 2026 09:29:53 +0000
Message-ID:
 <PN0P287MB2019BE365118D5D80461F8F29A86A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260105090410.108479-1-himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20260105090410.108479-1-himanshu.bhavani@siliconsignals.io>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN3P287MB0944:EE_
x-ms-office365-filtering-correlation-id: ba2bbf17-61b6-4586-411b-08de4c3cfb5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZrMmU7m+vAlvTZ3Ob+wCdP7imew0912Mc7RP6qEVnMbkyk+YRSLXcebPdE?=
 =?iso-8859-1?Q?Z51j5xN0eBMF3nNDPJEHZfromPr3Rv5FvJ6cSFSk11Nc0g3P8pxY8ewDpr?=
 =?iso-8859-1?Q?rEvUx6/DSQ6pinvW1AVzHeRjrU+pQtiyX31A8WUGdTerYZsMhQYCPnFKlJ?=
 =?iso-8859-1?Q?Fri3jK/NVbmwWc+FAXKjhT5v195JuiA7xo+xGKVOMJSniyfCrgfET7ccPh?=
 =?iso-8859-1?Q?s/OUxnjt0V34kPbXng6KK66HxHYN1jNXtPZShx1ziUXGOPRSamLVNCWws1?=
 =?iso-8859-1?Q?XJfWBbU+GKwKz37+sgWBow/LbdZww9lmUPt9C/2QG/trmVRigHR8DRe9p1?=
 =?iso-8859-1?Q?QXjb2bOLcLvRufvvoMK7J+qK9fhuzBhdVZL9rbs+VrkUM+BfbchCG836pR?=
 =?iso-8859-1?Q?vpo0yDIipqNCzn369EXEFsCKYNjq7PVJfMLIZPmQrtWCqi1YrEw5QJIwDe?=
 =?iso-8859-1?Q?b721mSgWfXpDAMD6NxW9dMNNp7dDNQWX6dQkB1DczNkCWUk+qodCqfN8tP?=
 =?iso-8859-1?Q?fbcMYxrjA0KAE8+nVrstwdELcKHtc7GIzWWol5K7n9jtfmGDdSEWgj/6Dh?=
 =?iso-8859-1?Q?7MiykhFPWVqD5OApcefFJsFFiOkvrjgWUVeX9OufzoBkEFpZrR2vFNYI5a?=
 =?iso-8859-1?Q?lc1oqpOvV5jRiAdlOt8OJXFvl/CFOqXMLW0lTCTLCHBsmdfw2ix/p8yhsa?=
 =?iso-8859-1?Q?APwTL6QSvDetX/Iady1XiagxtW/Zheigcgjntn0uVYei3JzHmOzwywvNmc?=
 =?iso-8859-1?Q?G5n5z5BCRB3tb2gRte+WjiKk/fm8o+iPSB8CtLbVSpT/i3wqGR1dybVDmD?=
 =?iso-8859-1?Q?bRUkJ9eFYscW78E2b3nB0O+YuARs4YIbifbheDTZvkW9kyc3PptfDGA5D6?=
 =?iso-8859-1?Q?uIwa94HFvDd+ZGr4E7gqSEjyt8vlGzw8YcLyOVS5e/zaSuH2NNQHGHocFX?=
 =?iso-8859-1?Q?56Eibdcn0JApOVoxIOv8W+IErWJSILG1nzp5hJ/U8nBl04ERRh12gHbHB4?=
 =?iso-8859-1?Q?qVhGFxMy77al7RiQPUaNfH29wMuRHMy2QdF5W2eKu6UcZ+boxwE4mgRxmB?=
 =?iso-8859-1?Q?w1yKJHmoCLdHctwBGQbPJeCY7RdolqHIMAyjv1wdVdsPgkGem2Q7jTvTK8?=
 =?iso-8859-1?Q?DJzZ4YPObK4rBQ7/HcTFFejt3MIjE7j4vMwm3hWLkMwS3h50jSZHAYHn74?=
 =?iso-8859-1?Q?i/b/ROFZ5DPuqcVrqq6l2NygSot3MGhwru/nVMILLTavLAsjWnV8SoUPKO?=
 =?iso-8859-1?Q?L+u4w4hiII+lgSb0mLprYayJ3eW4U5V4eE/wEKy/4xbQEW94FmwFQHEmhp?=
 =?iso-8859-1?Q?QPHlLM/fhT2CHc9ul+mY6Br4qWcq+Z2zvIDRD1p5kg1+ayN8z48MDU6bSF?=
 =?iso-8859-1?Q?WiEvAFdltnNd2OyjSGfkbYV9G1ZtdCecDvA7cBonFgiI5AUUmVNeBoSCV0?=
 =?iso-8859-1?Q?X096Cuwg9g5mSnP1kFFY0Hh1K6ZSOR9A4vpTNpKtqFG6gmRpet36NZA9Z/?=
 =?iso-8859-1?Q?bgsEtAf3HXTiS7MwAheB+J9j1F2j6sF324ABth6vsQz0IZmFzLh/fd6JdI?=
 =?iso-8859-1?Q?oJizI5qaiF100PC8Sf1su5L/KNPh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lvcRRckWvc/ybvWYkxfVBNlOoxPPwl38fOJR9Sve1GIMxFJpY7lRlUyAqL?=
 =?iso-8859-1?Q?gQwiY6cCBXS1IO5+dWWnwaXvWr7KbWHV53wuN7Rrpye2RH7j1gr6Eb0gd+?=
 =?iso-8859-1?Q?zTfVGsFFp2YIaNkH2T2KJS35c+9c6Jz3QoTp0tRJCR9koRYC3Ps2ck4mcu?=
 =?iso-8859-1?Q?gQjTRS2M/43FpaCzFfSUGs+WTbWE8yjrR3CjyTjNKKKy+jCbkBXygwefSH?=
 =?iso-8859-1?Q?GpWN1swpyZztKXRkoO2xTM3YR5a33V9pjyjLmIdBH87F9UNeimnw8xfXmf?=
 =?iso-8859-1?Q?ivIVy0+wdDAS9Yqnv8k0ZTMYiT2e72PSgR6EG0R+Z5pvk/0uwlYupyySjo?=
 =?iso-8859-1?Q?p9yJYqeICGEvreo30o9qzueD4bZ54V+hbIjJjlLGddGll/wqkv7on5Wph5?=
 =?iso-8859-1?Q?SgSUr1A5yUG8q8H6PoJ9OThxN1nFAD9Kj+vcmrw1SdHDc2qf6Js7dhQokm?=
 =?iso-8859-1?Q?y/x+Rwr87+SrBeBhpNBJhagFFV054tbzjpFsOPgMxrnRsa7UMs5Pqp59GM?=
 =?iso-8859-1?Q?Mh91dSQBhf5HItWwPMrsjAcwBTZvaTWHrC5A1HNwi1fTjDkq2Et/QgvZMx?=
 =?iso-8859-1?Q?kBhd610zGiztSyrmp8WT6o7tRtoylxcqmaw893cpMoSkep+k6SzMJUxT0+?=
 =?iso-8859-1?Q?kNE6pluCLlwxqhoH1eSaVTRwxOYpKDDqqy5BxmJzXFWIdJ8C263zzRUFLB?=
 =?iso-8859-1?Q?MfyLCLXx7Vu3G2o7WMgElDs4qzc8LMyRVzMq0xaEYTASdfR1LXhbsNN+CO?=
 =?iso-8859-1?Q?ONf8Ye9G2J5cvCCH2I7wczcQ9PKBXLYC3Htxh9XnlkH1Vg4pzy0bs/PCeM?=
 =?iso-8859-1?Q?U0TUDKJDjja7F3nIMn+9JG60xY/JMUys5V7Rot1LJWVbANLFRA1UJ3GQpC?=
 =?iso-8859-1?Q?E3ma7wOfeaNu6pF/bacjUDp1zJsAz9O2gGIWZ0Wj7GQ0lkHqdDpLS7h1Yn?=
 =?iso-8859-1?Q?6NJcoS0J+rSd5gR0WY08zvaDx56Q8DDifPC9dHKGGbm6s7zESBMZ59H49D?=
 =?iso-8859-1?Q?1B2bzuA8A+Ljv/FmcoRlTJCfzOu+YuUR6a13gbNcMuYuCRR7w9HDgaHxNA?=
 =?iso-8859-1?Q?GDichhD4XKU+8fyFOXng9IGc/w9jb7VmAVfXQ1eJmJI78DQyIAtIfBBD1G?=
 =?iso-8859-1?Q?wQ2sImlTznrx/MHri2VGSP5hGd2LG2ohAiWBiyAdvVFXWB/ydI+TMW7z0z?=
 =?iso-8859-1?Q?yf74xEmSmTNeqaDZwWnMurZWbNjlPg48uBa20LgFDZPv3N9xNJ2iVEP5rh?=
 =?iso-8859-1?Q?RY50L9Dmk2x9OWynv4fTgLlCEra57fz3YFyeGCgKf/6uhEygm7bsIyPEAu?=
 =?iso-8859-1?Q?8tEaCj8zLpNUJTeOOSbFhHsjxegCerqMmawE7C32+51a8rk6M3OeMiyANt?=
 =?iso-8859-1?Q?qCMndW5ov8DXHDHUwYx2isBxD+8R/820miIYbIvKL59Jbjkkmn8IB/IufE?=
 =?iso-8859-1?Q?D6SNpTI8zdunbk3JkNQIKtyrmpQKdyI/cd8DXy1a2Ny7cCglJj16SYOMuQ?=
 =?iso-8859-1?Q?OTZl078Rom1QWNGG4kA5x3rcgBEPWpmj04khF47cLHbU0BKSb+PcpbA5/Y?=
 =?iso-8859-1?Q?GKNlrJEPYK6QIQC5E61qszxSDf7qLg9JPFdnXp0abZgZTRGK+Iy65NqqoD?=
 =?iso-8859-1?Q?T5vZiOqOi+QbNVCPzzs85jawKnSs3Rc8THztec3KxNFMd5I/s+Zqex6Av3?=
 =?iso-8859-1?Q?JHQK5I8EyycvvRjrh4FyVAmHa7vogDEZW/dCuVEV0xfDQTutKYv2n95J5t?=
 =?iso-8859-1?Q?UCwLWSBh+7MbOSiAs/TugPPHSfjR3XCeU4KnNShv+34uF2CyYZI/QZnyqt?=
 =?iso-8859-1?Q?rSBp/qba07AuBHd6nBy4W25Xo0Bi5k4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2bbf17-61b6-4586-411b-08de4c3cfb5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:29:53.1371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2MwiHdZdB4YTxC7YTMGa35ZtYuulshVu1o/SCNpgE5iz8dkUXT0ENlfw5KPbLl2sICMU8c5kvob0jAGf1j40mFMp/sf3BnTFCDYknMT7PVTQCQe15/hQ9BKRUqQNxGU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0944

Hi all,=0A=
=0A=
>The Omnivision OS05B10 is a 1/2.78-Inch CMOS image sensor with an=0A=
>active array size of 2592 x 1944.=0A=
>=0A=
>The following features are supported:=0A=
>- Manual exposure an gain control support.=0A=
>- vblank/hblank control support.=0A=
>- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10).=0A=
>=0A=
>The driver is tested on mainline branch v6.17 on IMX8MP Verdin Toradex.=0A=
=0A=
Sorry for the noise, something is bad with second patch of the series. I wi=
ll resend this series.=0A=
=0A=
Best Regards,=0A=
Himanshu Bhavani=

