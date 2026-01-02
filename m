Return-Path: <linux-media+bounces-49838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF51CEDAB8
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 07:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 166783009824
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 06:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514232C235F;
	Fri,  2 Jan 2026 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="FSnVKo8x"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021122.outbound.protection.outlook.com [40.107.51.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1C2C11F6;
	Fri,  2 Jan 2026 06:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767334217; cv=fail; b=nu5JzvZiIchj9Vv6OdPiGTZ1EJvG58QBwTcy0XcJVvPp0I996uqTA6r0m36OUQEZr8vbeRsnieNseBLvf80PsRclZ6AKL2HiV/2046hwahPouso3nEK8oTPC65Mv0orccM9prmbeO9kMcn7MxjEl1/xjOIEvazrLDJkNA3/PhaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767334217; c=relaxed/simple;
	bh=a3bs3iyLwq7C3HCZXWFc8RaSniXZkmPHgpQ3/2dYk1g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AX/L10W6wYW05JbhFtnYFDlL0dlfRzKuSFrZ7hpHnG0PmR8bdDldR9BHHTR3UWX68wSOvQ3H+V+IRB3hjHjJwz6+IlPAigdl2W6RjHVxOTAQiTydUyhdfJBgLQiV7qhCSkQj1fcydn8pEC63nfvdweHct3SQiIUh8WXUTdIhMPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=FSnVKo8x; arc=fail smtp.client-ip=40.107.51.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHR96RJcjDKp2zKHDNhQYkvqxgRy0btIVSJVIPw+jbc9IyGJRTc/fFKnczFX6xU4Rp4ePnsEnz/1Cs2BLtla1CyLo6jSDmYOJU6vMimKPmFiq9vfe1Bt4Pmum40wrs4Ob6tIqiyhbdh6jF13sEm4s+VdtXZBq9/O2As044ZxxNS8THgOK5AW0jDzKNl4nJaIO8uom93nX17AEGlP9MSQVgurjOcCFuntzrVH28xJqn3bk6AzNCFYOGn3chuRab1SZORfXlgwaCM9QDmSeHHymFeeVFSrUuPX42Hd1wR5aJhhz6JYDE1uL80cZPV6UINs33niB78hxeCQyy33aCeJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3bs3iyLwq7C3HCZXWFc8RaSniXZkmPHgpQ3/2dYk1g=;
 b=PCvkIiPdWhyA+h4ZjnwYJvxtEyEBDQ1kTQ8UIHlVsu+xdZ6ZE578HxyYOzzLl0PXMuYDKit8WqctfwjVnNXcYb9/uM35GpL58rSZBoxFROXrQAxrmGoCFWi2LLdkKCkCzLPaSwOAbbjKrjsjWnC4s87BWFOBpuELSbBgWaxpQCrw7kRSVhfyCcA/vXWfeq6NEDsEsgQXEETJ918vLaAtsUM6bFGQx3OjRjBxB5QrDGtZXr91KWc/7M+1FoYmZQDkhpgIvvlUDFeaN0eP3snQdd2fGoJn3i6xnnwyETmzBw6OUHwk126Ih+drd34rLbmy8X0gZdsjxm4hL8Ypjh3mfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3bs3iyLwq7C3HCZXWFc8RaSniXZkmPHgpQ3/2dYk1g=;
 b=FSnVKo8x+CaKkXjPaJacwWNBMGnqMD0/KLDFHzqvbCLgo2PAYiCPjlRmFXuhYXFmgPQwS+8owJ5mhuVfdmKqZb/Rb83qDbPr5bDJWuau90WhhBolcwRShYT1vxe44zMnXZrU2yTEsc3dWKikv3A2VeI0Idc9Cp4VtDkljcBXMvONjY4WBIdR8a3U/k/mYWc5xiyH7mDX/Tohj0fbIAcLzqEuVfpxwkpGI5HatvQte4OglJEjiKR1nYKKOqexuLbPvJ26hXbfSLqQBK3HOxJqWDASpBQ1mIVD9GQH5NqiUp3SKDzqPjLzWrKdFkjBDZPu5FJ1bexqEONYVpOLebXt+g==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB0680.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Fri, 2 Jan
 2026 06:10:10 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 06:10:10 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Tarang
 Raval <tarang.raval@siliconsignals.io>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Elgin
 Perumbilly <elgin.perumbilly@siliconsignals.io>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hans
 de Goede <hansg@kernel.org>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong
	<jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] media: i2c: add os05b10 image sensor driver
Thread-Topic: [PATCH v7 2/2] media: i2c: add os05b10 image sensor driver
Thread-Index: AQHceiQl+WEzRulge0qviSo23SPS6rU7YjqAgAFzx7uAAOmpAIAApuJx
Date: Fri, 2 Jan 2026 06:10:09 +0000
Message-ID:
 <PN0P287MB2019BC24EA2955911FA4AC6F9ABBA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20251231070645.16434-1-himanshu.bhavani@siliconsignals.io>
 <20251231070645.16434-3-himanshu.bhavani@siliconsignals.io>
 <8838a2f3-4eec-42ee-88ee-55a71f789037@linaro.org>
 <PN0P287MB2019969BACCD6EF1325BE3069ABAA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
 <aVbTiM35Z_64mwFA@kekkonen.localdomain>
In-Reply-To: <aVbTiM35Z_64mwFA@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MA0P287MB0680:EE_
x-ms-office365-filtering-correlation-id: 11357933-0ddf-4a1e-c2e3-08de49c5958e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?x3J82qx+dtD2bnlKq3BcoBEafbaEf6jQb3K63NC5uep3F5MhR5v8UaxbQK?=
 =?iso-8859-1?Q?pK57LA7UdvvpGQ7xMCDmSN/U/uYWe5KfiY39aGRK7XXuYfthU+VyZt4GSY?=
 =?iso-8859-1?Q?8fi2/TmxJUSS3y+fJF0bWKETDTGXap8fBm7LNFuIe5JkR6tdLmE9iOyDBv?=
 =?iso-8859-1?Q?E/Pgc8LS33ub6iCvojA2B3kzcn9AiXQvUQbfDh5tupDOuzmutRBAoW+EKs?=
 =?iso-8859-1?Q?FTCKJCAiA+f5MCFZdc09EZErpd+I91fbyZmJiys23sDdsk6xpeT5LIABu0?=
 =?iso-8859-1?Q?aohdF4camkRZMQnT6i04Mb+kqn7P19qLwZ6Bw6hmDPvFZPA/DT695B83Mm?=
 =?iso-8859-1?Q?tvLefh97C+WtsmPPhwBfls7F9wUCLmBizuxZlM68KKRpeQ0YEeVVLrivJZ?=
 =?iso-8859-1?Q?UPqMzCwMskZWhbsXfTYAzSWFV02IUtBwEp5N/otMzVgJiKxAC8umv00KhZ?=
 =?iso-8859-1?Q?98CQ1J+kAxhEcJYvbFAtERVbJR8W/zLUJ0xyk+SyPT2WUV1GxqWL9tYWD8?=
 =?iso-8859-1?Q?2T4jZiIgJYynh15XD4m2ibnRfi5hApcn1zvHmJbaBZT8g0ap0G9aKEFbXo?=
 =?iso-8859-1?Q?cd0McW0SDxigv6s3GIccrZuRW+GJKSHQ38Y5UAOsNO4ftCiwE6fU1nVTVN?=
 =?iso-8859-1?Q?Trf1f6MI03vWbEdML3MXREM2pKBY+zOoRhybRJXwtvfB5Lpqxm7j+OIbYh?=
 =?iso-8859-1?Q?n8lZV2/hLDn5Buw36O1tU/avf73CkpeZahiSYg7uokScKUEfqMYhiM4OsQ?=
 =?iso-8859-1?Q?LU9RrjNtdcsRs+lRCyirp4OBA8EhaXnjolewqqDbohpcuf5JU+4BP6kawv?=
 =?iso-8859-1?Q?g41XMi5SoKZvivbDacEQeZuSgBk+iY4HHKTs8kBR7Dg1fbzst/aW1j+ulw?=
 =?iso-8859-1?Q?XosR3pZVgWLL4v/hvappPeeCMEdqPxCEjni8saJ9NEoM9OLVsLvMWy+vn1?=
 =?iso-8859-1?Q?zRnzEjfYNyOdyBzUdmS+OuFHiqawsx/jAOfxxPZkYatKq4y4n402vyJ788?=
 =?iso-8859-1?Q?jMoKXDLWtpabAV19QsMaKFQ3NHnLCgGBz3e/rS11oY+Axun/fgjcpso+jg?=
 =?iso-8859-1?Q?WlC6jRrF++coqH9lQ0pulZE5MSsk7dXa9EwCVQjn0c2tFeyxfaGbPAjks4?=
 =?iso-8859-1?Q?4aneI2ff7L7N6zpu4WMq6ZkRVKf7G7qAK0lBn3KophbeTrsKKuto9ia/+r?=
 =?iso-8859-1?Q?eJOkQwZfOE+WBPUyT9q0pomHssUtTD2Mx3KS913mI93a1kafxMYVAjOotO?=
 =?iso-8859-1?Q?nnB2UBL6dmgO/pcaQrfKMTyAFG3vxreRJombF0GvbFnHl6sPA02nWiB1n6?=
 =?iso-8859-1?Q?S0wNYWuoI4yjzHmMxz+OFy+1gaC8t9JVogPSjg4jtQtJ0KUKkL9CMaCVJN?=
 =?iso-8859-1?Q?ywYFQRIIIarKuVxTVp3zWRYYNf9vyUZ7OgldA2XDv5nMyuAItHSHFVqM5J?=
 =?iso-8859-1?Q?1uAIbeQA9SUqHMoCOIBg8AP5+AVTISQrwBnT3bjfl5uI9nwb/EYiwMHbfl?=
 =?iso-8859-1?Q?uZhoCkHLfbm/XLjh0X5u3Po+WekhhKtqFNvJsQoZhRWZCBF5um3fqo/PRz?=
 =?iso-8859-1?Q?/ZCDnrSc8nd4Qud2If1l5/ZJtoFk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ugZsIYCpa4yYlOPZJREVCR90n7XT5Yru7adOVzapLLTpDSdbcNArM6r5G8?=
 =?iso-8859-1?Q?H85FQljnceE0O4D/Or/o4vymfBgj+mIGJRXRbaXBX5mVnbcq//gQ32hazF?=
 =?iso-8859-1?Q?vACvneVXARrup5724bNfZekLOzZ8DeGFbOCKFC/gyMTBQvN2BnU5zBhOuW?=
 =?iso-8859-1?Q?dE6dYnxSBCH+6emWQzqUM5JnelCDBDZBGVv1DsSG37cLcP0Qhbxb54LtIw?=
 =?iso-8859-1?Q?ybLUdYYqhUSrDUrqPJSGl18/6UvD6mQV0GNJvX9sf2e0AABK9/zcPV8z2s?=
 =?iso-8859-1?Q?W9c7K2uYKkVOpISdXi152vI5+Erk2GGC6mPkevH/ak5b3JsYUX873XuuSo?=
 =?iso-8859-1?Q?gR4CLINWquc1YA6C+uI8m7WhfLBBQ4xM8jmm8VTiodfQo5kJPkK6R1jp1D?=
 =?iso-8859-1?Q?AUHjbjWfW1kGSc2l0xoCPm5c2vkRjOSaNl8g1XzMzMtgU1QcB8dkJNkBUE?=
 =?iso-8859-1?Q?e+JC7Bdp7hcYTEO1yoHPapmB+LlHowSP98vTlaHfPUvESOqPcsBzpWW+qn?=
 =?iso-8859-1?Q?j1Oosdx78JyP/3y6jHnvPOTZLQIjPhYEGwahIgmYhktDRlqIqaCAkE5/Va?=
 =?iso-8859-1?Q?5Y/lGtAIPM41JWXvzTx9hFZ3wpTVtoIXwifJE4Fvsifz1EqKct8fBri2+q?=
 =?iso-8859-1?Q?4QR8zW9vWzqRNK98ha+wlyxerU7Tx9izHWCem9OYGHDb3GvxfhzbWj2ASA?=
 =?iso-8859-1?Q?7Y6lw1V5apJAHd+jAlSYNn4Ce0U92YS3k7+OJzJdjtq3pz44OAC812tMoH?=
 =?iso-8859-1?Q?C4YRAXdjS8tGd8NpU5Nh+fK+pX2gMQaIwnHoAdbwbi4IttUN8qby99Ip+f?=
 =?iso-8859-1?Q?Q3uYfjSX+TI4O9jxuHfI5z2TK6Zm/FyOwOwrBT6dcyDlWA3Ym0Jp2gaXtI?=
 =?iso-8859-1?Q?xqOZQM7xcYtkKFvGcWK7J5ED1QB91cR8S9cv7eYRG42uUNr2RSRvJ4lcFm?=
 =?iso-8859-1?Q?A3iJtGQi+zkBTVQ3GjrJp7jcQ0ygkbTi3/JRS/ueUWrJrEGOyIfVkJVkXU?=
 =?iso-8859-1?Q?eJJ+rbbZ7aUYI45YICDKDbpHkGxIC2W2xRxHtqYUydfi3Ht31XRdEmuYlr?=
 =?iso-8859-1?Q?fyUU+KysFkI1seYFCrxqufc+GN6uo62ndwexZuS+5KQi7XCtAvFfdXERtp?=
 =?iso-8859-1?Q?gyHV9phZiUUZ24HNlarTr9YQtWg3MrhSitEjSAE1wsHncjpqFaukHfkTJR?=
 =?iso-8859-1?Q?9DAWkk6Fmk5Srbz6dDGcY8AZ3/aftK7cEtA/Y2cyHo//s6Z8sNnQouM8G3?=
 =?iso-8859-1?Q?XKzyWT+dZjTB10huEhcXfNJNHJJtDJAxqlB5yLPQRzHY4FIIYg6Z0SzyBK?=
 =?iso-8859-1?Q?jkNemoiSo7w8K2UnLOobdxNYr0C1Y4DN8D6UcKlP9SRyiE/A5PGXG8IaXl?=
 =?iso-8859-1?Q?c29Ogg3wWoNynyGbjfoh91Sdc7TTbRlGjey3KzIfQwRZc1Kdasw0UN+LHl?=
 =?iso-8859-1?Q?M5WIYNcgnoyUR7t4BlkvBQBD+L6ExyBc5//bO1I+uUEv8f5usPanG3DcLE?=
 =?iso-8859-1?Q?y02BIMRWkRX9BMxubXkhGHX9nl5n8+s8JRLzvvegrW1iAE//tF4CsHVuFz?=
 =?iso-8859-1?Q?qk6MlT5znKNULZWHSbn1vtcupVBTlG/yqU0awHS9JSdI3+xv/DEbPlGOKW?=
 =?iso-8859-1?Q?cYSwfcKU0mXl05okmDp6Sm2/AeIjzeMt7QnwPMpnyS75jX1nED3m6Pt3pW?=
 =?iso-8859-1?Q?wsxjVfX2hkNmn51kzYkfKlmUFvUFLSA6m+LbD8umeNHPBNSI7eKDdZjh45?=
 =?iso-8859-1?Q?imBPCqN/HCmNu2+PVB/9DAIZMxXtXmo06aniSMtiJQnjrdWlbU8rxn22z4?=
 =?iso-8859-1?Q?0ddBNsl/2SnIkXHG3iGbIZZI5T0xAiM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 11357933-0ddf-4a1e-c2e3-08de49c5958e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2026 06:10:09.9590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/ScViO5jFJzEr5QIKC7ZqD4y8NMs8F9Yd/ayIaHdb/YuR+3EH86+bv72oAFlmgtJ6RW7eSR+mAQOFtCqG7dIuUNA8Y93k1WFxqFWJ7mtW2j9AggkRClnltRCOzfRSSD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0680

Hi Sakari,=0A=
>=0A=
>On Thu, Jan 01, 2026 at 06:19:02AM +0000, Himanshu Bhavani wrote:=0A=
>> >> +#define OS05B10_PIXEL_RATE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (480 * HZ_P=
ER_MHZ)=0A=
>> >=0A=
>> >Here pixel rate should not be hardcoded, it'd be computed in runtime=0A=
>> >as 600MHz * 2 * 4 lanes / 10 bpp =3D 480MHz.=0A=
>> >=0A=
>> >The sensor may be wired over 2 lanes or (presumably) it can stream 8 bp=
p data.=0A=
>>=0A=
>> We are not supporting 2 lanes right now, driver supports only for 4 lane=
s and=0A=
>> 10 bpp data. So technically OS05B10_PIXEL_RATE will never change.=0A=
>> For reference I will add OS05B10_PIXEL_RATE calculation in comments.=0A=
>> I would prefer the hardcoded at the moment. Other than this comment=0A=
>> I will resolve and send new version.=0A=
>=0A=
>The pixel rate on the pixel array may be disconnected from the link=0A=
>frequency (and throughput) -- it may be more (with e.g. binning) or less,=
=0A=
>depending on the sensor of course. Calculating it, if possible, is always=
=0A=
>better than using a fixed value; experience has shown these are often=0A=
>simply incorrect and sometimes not updated when other changes are made (an=
d=0A=
>same goes for the link frequency).=0A=
=0A=
Okay, I just want to know if this is non-blocking comment and we can go ahe=
ad=0A=
with current version of driver.=0A=
=0A=
Meanwhile my colleague Tarang is working on some features and he is plannin=
g=0A=
to send a series on top of this driver. If he takes up this comment in that=
=0A=
series will it be okay with you?=0A=
=0A=
And also I have already sent next revision v8.=0A=
Please let me know.=0A=
=0A=
--=0A=
Best Regards,=0A=
Himanshu Bhavani=

