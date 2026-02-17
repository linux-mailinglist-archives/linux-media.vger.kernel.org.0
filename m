Return-Path: <linux-media+bounces-52983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wN9zBTKOlGn6FQIAu9opvQ
	(envelope-from <linux-media+bounces-52983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 16:50:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC314DB21
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 16:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E19830470CE
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 15:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04EE36C5B7;
	Tue, 17 Feb 2026 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gHxN7+rm"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF630261B9B;
	Tue, 17 Feb 2026 15:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343371; cv=fail; b=HhrAInp/3DpcueZ7KaGIGiNWRaCwbnSO0tSb9rywKmPzrdcJCug1wyoCziiPVXMr8ZD8cRurTd7mPmjrJ1Aq7J+UdZj0qdj1uL4mEaVLlZZfISI0hYEn4LPalTCU7SwONgS5Juq8mbxJwaGRlC8waAQzPfqM3XAIe0hn0gWAY3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343371; c=relaxed/simple;
	bh=muptBiOdYIb2iW6vjZ+5BgwdH6WEPdyblrm7nYSY+3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UVb7GmIRspLnPvV81v2yO4yQ8XyoHMxdF4aU9vtp0bb91MxRj/H6vEy1pO41bzvE9RyXjwfRAZZf+lFiY8lyLwea/0mGgLFJc2SR/1Jzz945YqY0QkTWN8QSqghrDDyW32ckKpEMHaZ9K7vFMy+VJsJnP6K3IXq+4of797+qzgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gHxN7+rm; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=el87UVnT2iu/1+oAdLQw4JUT4368VQQEuSa56tpYUibo3nXb2CbX4L/48raZYephIuQikPCfPHO9lkjuANSXtuShVhozDrDenCru4MygDOwkPGdT0N2XKi7TB/D82rAXOSGIMHnC+so7xlN0Mytgeo9h/Cn+5/pPJmLAO0XdhDwmVHK/e4j9JR5Ik+1ltRGTQNhL6PHUWpPzd0OjvHl7dQdCZAT1xXSwMAqKNfYSzinjEFVZmWb03/C4fomRGy/o3PhtRavKDNDIC2ODqNfXW532o/WduvZE/Q7e6JW5F3ZmMoQAqCHzYO2A7IhuNKo/DgrFlFtMC1pOPS9kEkakKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sytAlhEE1J+qAxoNrvS31nRcSgAuVIhIikoMy2x3K0U=;
 b=FA8jkvUxv5yF/ZvyCD/Sa3JsL/u1Mej548a3JWO+kH9ouMmtyTIbHTIKjO0LdxgmM60ZOY8mgY+UPqNgxMpddXXchMz1GO6xRv/omXSc+EmrDHE1m3Wrq5r3kiMJcR0LjfglgrxC2RU2ovC7cvmLGsHuHijIxR2BLoB4DV8A/X8GZQvzgCjJqvfpvQtFbdRHd6vmPMSeXX+IxKxKZ2GrjaSXPGczE0otkp/WfUbwahpszaSRU2Qg2tcCVKs3Xam6Xixe26Nk3HS4fH1nTHRDnl11pyohMQYCk90rzv3r0YLmwXDfFsYqIwt1DrIY/Jjf3bppRz31qkz4mrFU8Q4mjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sytAlhEE1J+qAxoNrvS31nRcSgAuVIhIikoMy2x3K0U=;
 b=gHxN7+rmo/QQHmRxcfLDmMJufIgs3A/77sx6oOcw/s9+T1jn91znY2GH2z377kiN9+xYzqyKRNgcoMHXS7LN5cy1+JtKCBnGbT1vhI3XH9WQOKMe/a5wLIx3ETGg8h6CPnMGgEVQ/3jRJlzxeHIWDYsjU0i85TJA5QAwr+rEnBbqugALO0YgnrdGwpY/DSTvjyLqGeaxRjnLQ+Y8dyrcsUj7aAzb8Z/nCdcyfcit7XLVAti6gJkDSghS4s9ayWv+hbOdbJuAbBDEhJe1prfzd1/KRIVEMi4eePYwJRYIVy8Qamkvt+A9slNdElAbfe913a5fctD3w2Eg28bZdJ2viA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 15:49:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 15:49:25 +0000
Date: Tue, 17 Feb 2026 10:49:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: michael.riesch@collabora.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH 1/2] media: synopsys: csi2rx: fix out-of-bounds check for
 formats array
Message-ID: <aZSN_N8dmPHgczRF@lizhi-Precision-Tower-5810>
References: <20260216-snps-csi2rx-v1-0-747bc7408f87@collabora.com>
 <20260216-snps-csi2rx-v1-1-747bc7408f87@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216-snps-csi2rx-v1-1-747bc7408f87@collabora.com>
X-ClientProxiedBy: PH8PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a03319b-9082-4ce9-57b4-08de6e3c201e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OGEBOHN2yzz7gP5z5VxxwN6VqE4coDmHNGpZhYc7YfPxMi31gEoLWQ+oK1PT?=
 =?us-ascii?Q?v/YX0x6fgH8JlrWXaGjhGI+QyQRs7I4pzOG3anjAPq3se2NOUAAHpHMJoyXb?=
 =?us-ascii?Q?fEhRhArGSwD7MYxqMLztH+hNPHoS0dfEFpaNfGvzk5M+ayGaroFAcy0f7M18?=
 =?us-ascii?Q?67Q1M3siKsunZLBnmIWLJQUWC21t/JQW+2uTjFfd0dPmgc9NGBCQhgFEXYtT?=
 =?us-ascii?Q?5C0CRKsICxi6cnvNBaaI2ILFp8yfmOn0Aa64nFm699cDSXD8lHH/0LksgT0o?=
 =?us-ascii?Q?Mzq8V/Js+xu1JqNb9YNI8WIKOGqJ34xJdq3SWcmgg0vAF9mEvFurTacHM3ub?=
 =?us-ascii?Q?Lp+2mWw7UgqziJKbBax5WpaIbBYYq0EQAiMVnnefz3JV0sukG24EyTP9rDkB?=
 =?us-ascii?Q?TnfjZtIs6r1WwQbcpPCpQlB/gbDALHiCUs2Zg92KKUSBcXioMYElw8Da2xpA?=
 =?us-ascii?Q?2DrslT2aCKCDJ2sKvueJL9lxrQ32bR4ey9iM5uZ0hqzA8m1F0xZispc1rQaD?=
 =?us-ascii?Q?ubcBAcXEdDbY2CylN5oKyjtVabD2TL98x+WuFehgWVkVtF7aUXylp6uAMe0W?=
 =?us-ascii?Q?JJmivVj56+ZDvkiHskS9sHUvL3KsRABrVjtaz5Vb42cNrUyfQxG0JzJZnC/a?=
 =?us-ascii?Q?Eg7PZBospc3hWxYIduWX9EqmvNsYPAyH5/NxJ7xjdmQGH/QxreVJ4BqTXQNr?=
 =?us-ascii?Q?nzd66a8xPeK4kZ1Gs1e7v5vFI/jH9oopB12Tkvi1+JtUhEeeOrBBNi+POPni?=
 =?us-ascii?Q?IsPdlbx0eCIkYaon023/nJq4zGW17i0OxzmkjucgSB4F3wNaZa+VdwZeHY3O?=
 =?us-ascii?Q?ouUb2Q+yf3Rf3l4NI0sUQxZubCQbmTe0evlmDmM5UGIEtbTTLnuhDQ+giOpu?=
 =?us-ascii?Q?xletdJDZjv2ZC5zmbh7mgjNbQgA5zxf1ZB57JLZxRtrVIODsOpsC0RN/jhye?=
 =?us-ascii?Q?NzNe6K1PbAmlBlc5lWdNxY+Wk5q7+7va/aghYk5h7byetNlFVU0me+l6iDLk?=
 =?us-ascii?Q?/UEfnsRiGhiLbbx5niuxN//VczEJP9vAY0cYrOlEVyP8GxnTtIUCjutOl0hr?=
 =?us-ascii?Q?/PjNDFvY3jWYan/tcw9XWKWvr9zwwryy7V8Y3OC1/Wv866U6v5toaOxYOyPW?=
 =?us-ascii?Q?SIZG6mkPg3F90k08olE3nkGBkHtOWSLoQUADchD+46FsDNsc1ihduOdhnJPW?=
 =?us-ascii?Q?uSxiYRe2dzPEeK2wtZM1v4fh9tXCWk/S6ZoqgeTOL8a+fwRlQgYZNGFVSD65?=
 =?us-ascii?Q?ls4GlaoUh4Cz7ELVn4+sLDleP06J0l6yHg3E9c8xls7qYeA6XPFF45VWtJcy?=
 =?us-ascii?Q?dsMVUgDivWBpWnl8wAPmTllRI4jUn6yZ983tO+7R7Ci7FIMMSI/ruwVWGL3i?=
 =?us-ascii?Q?Me+S88PC26IdrJwNiOHwXoqWJsOy60Qp0a1+KkOIwyuTqzuDLiOJHN0CYgQi?=
 =?us-ascii?Q?GimVqu+D7AkQrhXmfJjPCO+SJMaQzdTTtij9tbMB/rvyodzXd0OtdptPReKs?=
 =?us-ascii?Q?xMGncuJRHvsniMbBXfYaRs5b1DjTyO0pxhscNzltiYfKsqAtBQZcpp6khq+n?=
 =?us-ascii?Q?AjDcWrt5LVB+9Q6Q8BGGb96XhQGkpkGbxK7jRxkxG7tC257GmRGtonJvcW8N?=
 =?us-ascii?Q?qWHumakOfLIqKYQkMCw1S7A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9AQSfAi4r08g1WADaX/VcL4vOWyOB7QeWy0GHTWYrgcx6XGkEXz8HELFWAT8?=
 =?us-ascii?Q?cVNGxaVoNz9adtnPWvEW0yowVb1zW0MJHXkKjI76EjIXjfdwd52IVICQZv6H?=
 =?us-ascii?Q?J+RYiqSzUwfrwHOD81Zh09xrkuVi6IJUtY5BeAXeLIeHVxWVWBnkJKCFbVNJ?=
 =?us-ascii?Q?UmBtECsds7TLtBT1ApdCjTe4Gl8iUvCTXqfJH0PeLtK53Uf2x9mAJ6k5DyMt?=
 =?us-ascii?Q?72/Q5vV6EQTzKgPfahXhlhyd4GtfpXvHKPeT35X4qWCnVDJIZsqmFl/i/5bl?=
 =?us-ascii?Q?Zu4mPka0tsvReTA5fuVNvBGzep4uSkRiUlK4qsA2pWhY8flnxz86g4TSTW+4?=
 =?us-ascii?Q?0PmoMsOhJdhmBcX4gfqNf1+39xJHcyidKjDoYGZtwDwIZ2Mc6huubGXdwFim?=
 =?us-ascii?Q?Qaph5TuoffI1F6lWDrR0L0bOu4kPIDyPeB5mypEkUYQrnBmG9iNGNGdrgHx5?=
 =?us-ascii?Q?w1VEBETISDMx5BpHhCoM/6h7z6lVj9ix+tOR+5hR8iXKFN6ig4VNI5wkKOco?=
 =?us-ascii?Q?1HXfLVTDtC3gIVws0ZL7YLtYjzCvmB7tbc8i4Ksm3p4HjyYbLwIDHxw12Jj6?=
 =?us-ascii?Q?fzgIwaEqIvt1e7KlrGXP/FBR7NGZ0bjBeLYgel7LNkimhFyva5x4FyqydtLz?=
 =?us-ascii?Q?hBM2IBaWu5tsIyAnSVN04l3e2VPLj44vCmZZIbkMFFwxo67ABGVqT2GoMyzi?=
 =?us-ascii?Q?AdkvbCIDGT4IZeWDGzYrxia5CBSHfv0bOcaZsWqdf+1ou4bx4gD0khE069Yd?=
 =?us-ascii?Q?DJWEPPB1lO+IUGZlWEYjcIRxAHIqQU5Sf6s54QRc3qvPgqG718UJiizOUxdK?=
 =?us-ascii?Q?wtjXPDsHCZle/W4FQ4+2d5bU2SrXwvh9UEkGtoD3+BWl/qTuTUiYvxD/BHP7?=
 =?us-ascii?Q?5MIHyiKbLCdllX8XJw6gbYtrWGBUPf9G2u3hfnayTzCmLUzDGh8F+KS2/f0J?=
 =?us-ascii?Q?sM8Bh6s8lrs2UMDab7g09WAFvFdTRCrGtMYof+1Zphu3I+HDav1ce3etRNss?=
 =?us-ascii?Q?rgsFk3aLigpeGNm9IG4kMmuT6/lF30sDZFrJsXE9XYRX6JmEC09goLQx/2pO?=
 =?us-ascii?Q?7KM9aW2GADhynqnBZ7Q/AjQLzG1/5ha+mSxoRSEtS+p3tUAVAwf23iPYiK7+?=
 =?us-ascii?Q?muZx1Svb+CG1zYcyHt11XlyER3T0CBuquTuwzpLvbjNszNJa3gv3elFGE1NQ?=
 =?us-ascii?Q?+0KKYVmY5c9+X6Esc0QlOC+WFKtqpVV2hz6MtdXGCyO9LKhzBhqyTCedHWTX?=
 =?us-ascii?Q?ZvnhiQP8Ylh1VuI/j0OhzeBVcncWaVdlQpymiSyz43+6n7xry7iupGd00gUm?=
 =?us-ascii?Q?2Fy6TSvl8tOcVYWugk1lgn+Snn/oBTFLauoj00xMMGTjy0jrN7ZXsA+tHnmv?=
 =?us-ascii?Q?oGxxYytnCjswiksVDzdcHxYGPnbDntIOzMtvQMLh2Ea2dOjBmFzScbz1PSX4?=
 =?us-ascii?Q?XpC5wtJ4+VqvEkQ1FXam17LRIoKeCmCRVj7L9Mx4uVNDr+LWyZYfKu38Ieqk?=
 =?us-ascii?Q?GUK/fCW5fFHo8biS+02zioEH2Qg550xQJ61eF/bWurQ4DG4aJKqUvSR0Skhf?=
 =?us-ascii?Q?qwKWbyrHu6DYQ+xIOt7m+pRU9KMHn242solNYc1VviXU5u/IRJl8o5wxcQDg?=
 =?us-ascii?Q?4+SNzGY5EBNIwFEF8nwomHkZWw9NDHtVtzYBYe2w3teBLWYAAHk+JU9sJ3IW?=
 =?us-ascii?Q?ehUXHxEURch43ENkiQZGpmejyyftN9hlDvIY63ngi0NwfKB6DZnSBNbOFnmk?=
 =?us-ascii?Q?cAoIOtc8kg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a03319b-9082-4ce9-57b4-08de6e3c201e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:49:25.4580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gup6DnYzAf/yfKw7ocr16nVCUVIVQHNuWx51XhKa14US9FR8rpfZ6elRgc0xtVbEm1h+YKnzC+blzIUCePD5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52983-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 67BC314DB21
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 01:28:47PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>
> The out-of-bounds check for the format array is off by one. Fix the
> check.
>
> Fixes: 355a11004066 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
> Cc: stable@kernel.org
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 170346ae1a59..4d96171a650b 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -301,7 +301,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
>
>  		return 0;
>  	case DW_MIPI_CSI2RX_PAD_SINK:
> -		if (code->index > csi2->formats_num)
> +		if (code->index >= csi2->formats_num)
>  			return -EINVAL;
>
>  		code->code = csi2->formats[code->index].code;
>
> --
> 2.39.5
>
>

