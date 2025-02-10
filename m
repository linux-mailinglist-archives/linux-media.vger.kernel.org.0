Return-Path: <linux-media+bounces-25967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE6A2FB4A
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EE221887031
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8402512EA;
	Mon, 10 Feb 2025 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kF1ynyFk"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E932512C7;
	Mon, 10 Feb 2025 21:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221244; cv=fail; b=MizP1YaMGrAMKlDlx0/2GCEYfiFrvBScLqZ2+kalDLjCs2mbbItYi3Wn49uMJtFB9gwSinidvFu5/fH1G1FR5vidzcqU1BAhLbFlrnwWN27kmN83kBh35kRI3tWOKv0EunoExncWsO0WZBQBm5GEsmQIxp4UVePBszLkL3fLmSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221244; c=relaxed/simple;
	bh=V/jMpa/7SRBpANG3WwS/YHmbt91+dHAfNmrPG9mZKaU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DpGJHvtgR1+HiypHYttCRBmXalpwqbCD60JoqoqLbugtts4wAM9wWBkcl/5WBkDuuEOt3fiAzQchwlbLKkxHnfLsxWECOsk5p+ufDA4i3VY78YI9CWkLv7nBErLG1aH6v+10tS8+AdmLMLJ3komTRqWJhZwZbxBop49k21c/guQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kF1ynyFk; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry6LXJdtZWocc6hpdm6kTvmWVu7zzeqDSjhWhQfDwOj4RJHz39Wt9UwukP++LamhkpfnzQ5s9rBXnyZce9Kklts785Qa4fJqslB6j8t39NR7GghfIvweSTF3x6r8Q/xJ9ZBkNdwD7Ah/rJBHu1O2sQow3iQzxLzaNXg2lxICVrXOVkGGGOCVWQ2Yn9nEGa2ZGIzXWjiH+QtcDBIT3RmyR7T+An8hXU3rRCVi69nVpUF2JpzC3ojShzDg4Cum3FYUAMMxwSbncV9sscatwAPlXiv3D/PtkE/5IcKrwD15ZpHuuvobQh/Tnnv0oZ9GxOypL1cZbmnVZwFxobjcmR4yoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KF+9ks1TpPtfh5Io14neNqsw2uCopTQ35irpmxxnSU=;
 b=ofqHhATOHzHLvb6mD8VHM/eRTGD46++A1jhEaytudgiE11ovVG1P9gcwj6Ps+6yoqnBw+haw3j98/qk+ItuOoJMVtO+V1XrBgSAEui5SDjxvfz2MaZPriI2ODl7xb6+mCfCWD0aESmsBWjjUYJK/EmT8Ylzb36gqV/A4A8pPqMdoUdyNXDyNVN84GPFoXxtiUWZiCx6DJFpgwgtgjCguJqPJQI9FaLdM4yXtrdf9VlPF7jGvlkeLVl0QyPIfTgPRVMn5F17YcP6TUZUBhVxNciaykV6KJ966MjmRc5rhQkenVqnEZUkNgLg3LBmiDjfQWK/8wg2TgHc12nF2qXM2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KF+9ks1TpPtfh5Io14neNqsw2uCopTQ35irpmxxnSU=;
 b=kF1ynyFkv3pgUfiNFWSCJsAmJjRZCY/P0v7WOtXcQfHJPKIf2JheqR7AWtCFYcWLBPL/lv6ATwsxDxKQoMpPGF3hD2QL3GyNFKLhWvQQnY6Wbvj5dA2cjufMAT4YZMz0W1WIOfOmE/CS4zIwpa48iGr1Wd+U76wl6zt1AePcsZDSqay7vVp8cqQC2QyTybY4lGSvv0PLAWyntPLQwhnI050ILv1uZtEgTIUjWFibLlErxafJ1lb2i6dbpz5uWL9xc98GjpIZ+quZ1FvPDIhBQ7apz7yJ8FswqKKrkGdKuf9YoLjzFi690nruojzZOL2yVDF7oSG4tvGhp95qZtVkQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10238.eurprd04.prod.outlook.com (2603:10a6:102:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 21:00:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:40 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:29 -0500
Subject: [PATCH v3 10/12] arm64: dts: imx8qm: add 24MHz clock-xtal24m
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-10-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=890;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=V/jMpa/7SRBpANG3WwS/YHmbt91+dHAfNmrPG9mZKaU=;
 b=eK+cKFPOOxDiRVcuKw/KWv5aBt/0EVqOe4kCIlJxXUjmUAiu6bVLYmH0Jzgr6AMyZ7OUzWM0t
 7jgwhPdTkGQCi5IAr5P8ZJ8lmXAzsDhnNhFiBSjAbj9Tc74fYIwVUTv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10238:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d95ded5-f978-46d1-875c-08dd4a15f9a4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bFl3K3VnVU5PNmQzK0VrdjdqNS9jajcrM2d4S0JQUVZMNG40aXZBUktRWWNM?=
 =?utf-8?B?MkFqdHJZSGdFMlk1a0pWSkk4SGwydXY2NTljMXVCbUVsWmxNLzBQbVZvQmw2?=
 =?utf-8?B?SUwwY1cvanUzQWZ2Q2tMQ1ozM01tU3AzaHpBdXZxYTRFdSsxdHY4cnY5M3Vr?=
 =?utf-8?B?OXdxNkZrMUtlQ1BXaEVIYTl3N3MzSlg5K0NZNStDUktMbXhSWkQveFNERVIz?=
 =?utf-8?B?WENHOHIxWmozMmQrU1dnTXo5K0h5RGEwcWtpejExbWx6ajFUTlV4UzNOZEgx?=
 =?utf-8?B?UHR1ZnRGc1R4TWpERUIvZWJMd0x4MmY3cG1xRHFwUWpibm1ycmNFVHY5V2JQ?=
 =?utf-8?B?V1Zac1dlOXdVdEc3cmh3M091SmE0Mk9EeksrUDBYa0ZqUVRkSXpwbzNaVTJt?=
 =?utf-8?B?eWpYVkxkYmlpSVZIcXpZdDJGOTBHTGpnb253L2FmMS9RSkRuamlVV2N2bHdJ?=
 =?utf-8?B?NW1BT3F2Umx5dlpnYW56YlE1NWtKTUt3Y1FxcnljRGE3bDVZZXhCSFFUSVNH?=
 =?utf-8?B?T1FYYlUreTg0eFR4T1FIU3ZhK1NNUGE1SzJsNjlIb09CYU9EUnFRUm1PZTlK?=
 =?utf-8?B?ZjNydkx6RGQ2WW5pU09aNmtTWk45eE4reXRGV3pNcXJlaktXL1g5WVlFTWFZ?=
 =?utf-8?B?RUFhR2NtUFNFS084T0IyUmhqVlF3UUR2TWE0NjJIZENqRkpnSXpsQ3Q0aFp3?=
 =?utf-8?B?NHFSeGRSWEtRaURnQjRzSHBJZ01wa3hYcXpVQUF5WkpxbHlSRlQ1blk5WWRy?=
 =?utf-8?B?K0w5WWN4UWc1STUwVFBTU2tqYU9qOU5UQi90UlZuZGJSWDhZYWM3cms3YSti?=
 =?utf-8?B?NWx3Rzl6VCtnSmYzeXVKT0ZGQVVRZ0I4aDFCSXFxUm9zYUJlNFJPUU5vblNq?=
 =?utf-8?B?OUJqdGp4cVpZOG42Uzd4eGsvZDFLRytVQy9GOEJWdE4xSkF3M3NwdnFzZExU?=
 =?utf-8?B?aTFuLys1VDh3WXRNM1ErREQ5eFAxZVpZRk5BaXpvYWFBZFdHWUNENDNuMzEx?=
 =?utf-8?B?b3VpT1hYZFFIbmJBclNIYVVqTm5xbWUvaTh4SmpjY0dZa1UzakNSb1ozYTRs?=
 =?utf-8?B?UVQ0aC9SRmdFQmM3enZnWmdWcTF2aDRmajdtaUpsMWNYaE80OGUxTzF6dWpO?=
 =?utf-8?B?aU9pMkozdmFYbVU3MjkwWXdCOWJKcE91MDF3ZWh1ZU5NMzFLaWZxSU1DRWs1?=
 =?utf-8?B?Y1gyd3RhWDZDN2NCbmtqMkJnb0dEV2REUjAvSUN0a0V2TXpyYXhiK0JyeXpW?=
 =?utf-8?B?MTdYWGtDcStxQ0dJU0NNOWFOWlhNWjdEM3NVUThXK1ZtUy95azlRL0w1a1k4?=
 =?utf-8?B?ektDeUlLbVBDTXQ0V2F0VTR1bzhJY1BYN1FhZXVXTFhHcklEVWhQY244UEZs?=
 =?utf-8?B?Q1NJZkNQaGsvQ0pTc0hFNGlVSmlFUXcyQ1ZMSkJlVFBNejlVU3VhS1dCSzFL?=
 =?utf-8?B?M1lQT3Z5Q3VhWExqU0ltWVg5M29yNmJBOC9oYWtzOG9MeTJGUzN1N1V4Y2RP?=
 =?utf-8?B?bFJacHZsem9yazl2Ly9jdFNyWTU1SUZFZUJRSldnb0ZVU1I0c0JBK2NZN1ZW?=
 =?utf-8?B?cmc4d0tQRWNmQlo0ZmsyY2Z6ZTI3dUpvN3lIa0FpT2NlSXJYNGNmTWlTVUp6?=
 =?utf-8?B?aE9ncUdxVmUycnBVQVBMeUlqYW9ycmdXTUF5aEZqOW1qQnZ2THJSSFhxTnZa?=
 =?utf-8?B?djNMbVdMMHk1VWhrRHQrWXhpR21rbmVCdFgyN3F5SG82dE84MTdjZGNnTEtr?=
 =?utf-8?B?N25hSkdBWTcxNjJwS3VBcGRhQndBS1Bock1SWk5LWFpSMnFhQ2F5ZFBHL3VV?=
 =?utf-8?B?bHk4RVhpZXZadU5FWHI5WWlDTnNEZDljemxRNytFN2oxRXRsNWdNZU1EV1RR?=
 =?utf-8?B?amtpdTlEam5BNnBBeFcrVWVTZE5oY3p3TUdEQWdSZVM1cUtGTFUzR0owWHRq?=
 =?utf-8?B?VXZWU1paVS9pTXNRQ2ZDUzlLQUFoa0RJSVhDdmFYODlQMXIxd1I0b1NkV08w?=
 =?utf-8?B?bUx1aTN1ZlNBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dVJpUVg1MUd4dm1BVjNxRnhuSktXUkxhMUMyN3BLdUpRZC9ERW5iaVlQek44?=
 =?utf-8?B?a3Y3YmlXeHpsd084dnIwTmZMcUZkVitMVUtrSU5PMk9uNGxmRlFiSVZtaUNR?=
 =?utf-8?B?NVQ1NmZ0ZmZiY1VyZ3cxaFgxVm5ZaTNaWXNOSzBMeXJMS0FqNEd0RTFNcUJm?=
 =?utf-8?B?bnhTazdNdTRBeHJoSGZQdXRFOEtXOUF6QURUUnZ0NG1VUEJDNFk5UHFNZ0RU?=
 =?utf-8?B?RHFhbVQwWTM0Zm54djA3eklSRWtFYzBEMzZBMzB3bCtSak4xSWZnNFllRGJr?=
 =?utf-8?B?Z2VEb1lOa0FFVlV1My83cElzS3plZ05DQWVvbFlZNWxGVWhFZmpuMkdNUGlX?=
 =?utf-8?B?ZmhBZFowUTFHM2s2SEF1cGI2VzdNeVR6NnBhbEdhOGwwa3V5cDcybmdDV1FY?=
 =?utf-8?B?dCtqNHkySlRYbmF4bU95TVY1UWcvU1h2VHhNNHJPT2t1cFh5cjVqTnJTdFRw?=
 =?utf-8?B?a2cvbEhtZkpmQUs1WGJnQkNtNlZuTEhxdllmbm1rR0ZVK3dqZjZjUWZFU3p2?=
 =?utf-8?B?c1ZGSW1ZN1pNbUh1d2U0cWttRm9kQ3lrV1Z4L0hxZ3NQTFFmRnVLVVRRS3lO?=
 =?utf-8?B?N3NPc1AzWjNSK3lNT2NyYmJKcis4ZEw3eUVFcGFBWUZPekdFYlJpeXZnKzI3?=
 =?utf-8?B?MmsyRlBvZ21uNXYvTHBmSmc0UWlNb0pOa0dRVk81U0c3SmJQV1p1a3lyT2NJ?=
 =?utf-8?B?dU44YVRFWlliaVB6Y0lVOEhvRkFTY3ZUakl1YXlsaW9nWVdmemwveEs5dkNG?=
 =?utf-8?B?SFZyeDA0cEYxY09UQjdUK0puZ1hmUTlsazBtTVVtMzI2QU9zWCs2c2VXR1Rm?=
 =?utf-8?B?aUZkWVh0TzV2OGR1cDBlWWdzT2s2VjArQVNKUEdQajdwN2h1ZlZ1d212NTNk?=
 =?utf-8?B?dXVocUxlUkc2bG1vdDQ3L0hDS1NmbzYyd3N1blZsbFNkNEt3M3VBbEhTSnBV?=
 =?utf-8?B?ZjlrMUhRbDVkUnMvclVoV1pKa3MxR0hTbzc2WERIejM3T2tLNEZFWWQ0a3lW?=
 =?utf-8?B?UGNVeXVBZ2ZnazIwQkd4c0VFWFVRaTEvZmZ5eS9OeURYYWRqZDZmYXNoeFBZ?=
 =?utf-8?B?cUFvN1JPdFZsUk45VWI3OEYvUWtGcUZOZ01JM0pMQmJTbmZQRjJwKy9KRTEx?=
 =?utf-8?B?Q09VOHJkY1dwUEs0ZVpZZDhsRERDdnRkSG5qblhzc3RiRWlkUnIwRS9nUkNT?=
 =?utf-8?B?NlZhUVBDTmxKV2M4VXIvRytRUDJ4UHg1d1I4TCs5YXJ3emg1Tkh5Q0dobTdu?=
 =?utf-8?B?WW9ZejVXZCtQZkhnSW44blhGUGlwa2VCdzV6dVVqQ2RsRHVjN1lSVUZXb1V1?=
 =?utf-8?B?ZG5xSXZKMFZRbWd6WkVhbVk0ZzN0WUZlUE5yWFBiYXNydjNpSUFkMG84R0Zx?=
 =?utf-8?B?dlRNTXI4bWxBeEc5SkxTdUliNHBtM241enBoVldmRzhIaElYc2l0NlByeVRa?=
 =?utf-8?B?a3RFUU5mR2RHM2lnaXFieXgyQVJZQ1ZGakRyczR1cmhPeHVkWlJVamtRKzlx?=
 =?utf-8?B?NEprVWpvVkczZXRJc0Y4ckVJMTRPQmhzWW1YRUZjdXNpMzNJV3Y1RzJqRVRu?=
 =?utf-8?B?enp0NU5uZnZmWW1OVS9yMm1YeUpKeGV1NVJ0YVJQc0tnNmNTNjBKQmt4bnlT?=
 =?utf-8?B?U3VmRTREN3ltYlMzY1l1WXl2R0pYL1pjNFBDM2NXYjlGUFRRMVg4dVFmSmdC?=
 =?utf-8?B?NjFDQkt5cVVFZmh6NDJWcUp0YXpDa0NUSUJERHlaNTlNRlFCaWYxZHBHWldM?=
 =?utf-8?B?TmpmbDR6MVh2ZzJsdW9IWll6UG02dEdqdVpOcktQeXRCZFovZ2pORzRJWmVW?=
 =?utf-8?B?OEwvaEl4UlBWZythZGVFdkRXZHRWdUppU2hhc0QwL24xL2ZUQnpNTGVOZXV6?=
 =?utf-8?B?My9DYVFJbGpLTUk2VDhYV1k5dUc3eVB3eDlENURpWFoyUHN3V1J1UGRpemxs?=
 =?utf-8?B?ZWtIY1dXWDZSTDhGY2M3Sk1JbHQyV0wzKzRmcXZiMWtoNm9KRXg5ZEljZGk2?=
 =?utf-8?B?NWtxSG1qY3dmKzFMdmtDcFhpMUc2Y1ZQSmdrRzJrczd0SDYrWUFaK2VqcXB4?=
 =?utf-8?B?ZDc4cnRnOTE3S3UxOGdOVmMwR2hhZ1VmcmRRY0laUDhxc2hoWGlSVTc4N0c3?=
 =?utf-8?Q?uHkE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d95ded5-f978-46d1-875c-08dd4a15f9a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:40.0768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsyF+9S7zZelhZlPgcPPlR5cxYRSxMXyCRgaOzJ2kxRz3jUHFgjwxFGtzfr2km3iiVIgOC1NnHOG690criDnWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10238

Add fixed clock node clock-xtal24m to prepare to add camera support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v3
- none
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index c6a17a0d739c5..40cd45cd9f88f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -590,6 +590,13 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 		clock-output-names = "mipi_pll_div2_clk";
 	};
 
+	xtal24m: clock-xtal24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal_24MHz";
+	};
+
 	vpu_subsys_dsp: bus@55000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.34.1


