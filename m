Return-Path: <linux-media+bounces-52785-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIcoKaKJj2nURQEAu9opvQ
	(envelope-from <linux-media+bounces-52785-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:29:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A01396A1
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A419C318AACC
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 20:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79171E47CC;
	Fri, 13 Feb 2026 20:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oHCPtBib"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959792773E5;
	Fri, 13 Feb 2026 20:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771014369; cv=fail; b=M7J/tiGAJdVJtJtfkj52ufqlkIVkNQgsUK+y8Wl/Rxh78aebuhvfK6X1VR6nUsmuPnstkW71OE805e+Hrhuo1QOZn83q6lf8ZEn93vuKJNsfeFLmW1bSzIoR7IauAcUMj3ehiaqIRSxNBMbVEMDKSKHwbGqax9YmHLZdMwNrjFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771014369; c=relaxed/simple;
	bh=NbaYH/aak25blekApIvd7b81IIubCJYfwWTfzVjCeKw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NXyFTj77Nq72i/ymSH6dKIQuVR/yAGpffEvnW2tTTu2Wu3mOb80GwUMqL3/Uiqg3tX+7JXky0GifTzYtGv8Xpy2ez0ClDPo3UvcaWRBCSYccCvRQPBuNSrAMIyAH9uml9Jnp6CcqFwIlM8sgFwb2zepb8B9B1vgC2mk52qDn//w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oHCPtBib; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVl8H2vBal4T1nmnFXjEpMAIhRI+kpFO5Bnm400QmkinPB8c2piCxPFP4zR+/V6RmmUZrKn9eFk5QQXH4Nvy6Apud68p1DCBG1PYEgNM/G+FEOok9Cg1rb5DWllJvX607/H41Df1vV313OCcuyg5YPlmUR9tLEO5VlN7F5pkNsLaq6yncNjoJ2fdVxg23lcQC52rQ8gttzHaIafwA3hpjBOWHN3pw9N9izW6Q+BztdkmHm/+mn0t4hF7tfgVJp8ulTlJZb6TizYX6As3Q2OQqZcVUqdvz39opqbGdDLCScVQXJShdhdJsbNcc3nIKpeuxERDFEeTYJ4TWUpmZfq6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlzxesWjgM+rJJf9/VMI4+rs8HGWp3lTdOc9i1H4ljo=;
 b=vzdnyDr+/8xMB9xkhHCfY51I3quphro/SrvJew1TGTdTB25RIgNZYgGgfE0Yaw5VWVM3DDgoA0fe9DK/BzYVmCLXeOimfKXcmE+IvVMtJCdPfX7WmVJ6VJA+RY9iJ/idiZHx13VHYCs4vGXOsoTLYqguELrm0yc4DSvpStGZl6o0nJtHxb1lVBweCWh3kz3LvAVtfsvuCQWMmrP+WnIP4zRSiH//ph0U5NoeU95qF/fU+qOVpavJWhb8aqXa/ATgshLAMMoxNC0wtAo8JKzRe+JGV5D0IbH/nk4pB4v8E8ll/LP1Ss6CTiqmQia0GnmQ0xnANZeAnjezlBKiQcNaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlzxesWjgM+rJJf9/VMI4+rs8HGWp3lTdOc9i1H4ljo=;
 b=oHCPtBibH98WSlkFfAo3nSo55ORzOBDwK0xhFDfl62omEe6j3J9jbRVX2EjsTJ5zhXrCGFQLUls3OeMCamzdk77egmzO+tgx6HkX718yTXP7+8nqwOPQbLVC5CB4ozicUlxO+tRUrPkQsbNdUAfpKGKJmZk65JKnWaMStWaO/VHMo1BqtDdBCh5KiC4Hx93nlcqETMQ7RH7Zse2MH+dBd3RVat4xuheB1/f7OgYC0Z6R+5VZwu9f/MtDRdfe+8vy9tTsZgAAp7DLs/WikSR11bLlhXn6Cq4LCtcrxoPQZyYdjpVL4CHAfWMNstG4xqggHC5ccpp9v+cQnY9bzwlh0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 20:26:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 20:26:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 13 Feb 2026 15:25:14 -0500
Subject: [PATCH v2 5/6] media: dt-bindings: add NXP i.MX93 compatible
 string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-imx93-dw-csi2-v2-5-8be6039f44c6@nxp.com>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771014335; l=2496;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=NbaYH/aak25blekApIvd7b81IIubCJYfwWTfzVjCeKw=;
 b=um27Zxb8jn2QsnheJIHcePI8vs7O/kKR/4cHOUzj5RpSN6/dF9SBqAGKeOIQJhl5mFaZBJgqj
 kr7WVk46BGYCe/LcjE/oVbtDb4lz92+pvJcEKFu1iJihXdQVNh5zmDD
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf5667a-90cd-4a5d-6dea-08de6b3e1a83
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Z1ZsVXJ4WmFLZWVTYlJBQ2xNdWhyMlBQZjVYek9VeWZNQmVYVGxWd0o2N05F?=
 =?utf-8?B?bERnZU5VVEtZVm1SaStneDE5UldhTmQvR0I1ZEJrRWNYa3dtWi9TQzlzRzVo?=
 =?utf-8?B?ZUsycGU3TGdkWlh3dDl4QnNodmR5blhITEV3eWxtaGx6RlNWMlp3YVpYYXVM?=
 =?utf-8?B?M1BhdG9UMk5IaFN3NkJOelhlVXlFOHBMWXBJZDFWQUNQTlRxTG5FcGdOMC9q?=
 =?utf-8?B?ME8wTDlxZ1kzdkZnaU9LTHEyQ3lPN281RWxCZWVySjZNQnZkZjNkYjM5enNW?=
 =?utf-8?B?NWVFQTFLdVpwSng2aE90Zm1EQXAzZTRsanRpcW9PcnZ1WkFPWVJzV3orM09Z?=
 =?utf-8?B?VjJSZjJwT2pjZjFUR2tuUG1BbkZvUHFta25ybGZ3VE5mYU9SSUc2bVlId2k4?=
 =?utf-8?B?UnR2cmRDZ1JjRVBCcHY2b2M4TFpOZmIrd3FhVHlrS2xzUkJWNDM5dXpwV1Vh?=
 =?utf-8?B?bjIzTk9DWjJBNUU3MGVuU0VheW1pTG9mWGlIdzYzVk5hOFdDS2EzaTVjcWox?=
 =?utf-8?B?SGE4YUhleS9LN252bFdwZzJzckszSHA3QitiUzdoMDE0OXArUmR1dDJqUTEw?=
 =?utf-8?B?SFNSeTUvY3FiVnhxVDNBa2dLTVhhQWl4dGpsbkp1WEU5UnNXdTZoOTlESDJv?=
 =?utf-8?B?d1ErajFOSm1JQ0dkN0RlNHZTS1VURFNpYUZEd25lYWdURXpoc2NrcFY2N3Jy?=
 =?utf-8?B?dVhIeHg5MHN0Ump6L3A2bDhmZFFkL2RBSlNoakk4amo1dEJ3TStOR3luNlVi?=
 =?utf-8?B?Nm43N0c1bXdWZU8xTzNTaE00dmQ0azZWeHFUN3dYMWRMMWNaNVkvazY2M01Z?=
 =?utf-8?B?ZEZBenhjWEdHeWEwUmttLzZIa1FvcldoNkVqcFJHVkkzQm81ZjJUelpmcjd5?=
 =?utf-8?B?eldVazhPbG0waVF4R1M3ZGVmWk9NVWxZYTR3b2k1SDMwL0IzOEoxSFJGTFNq?=
 =?utf-8?B?eFd1UFpDL3VjVnY4VXJNbmhNaEpmdVVSMGdudTdxaEFYQjhZWUIyNEZ3ditx?=
 =?utf-8?B?T2ZBaDR2NUdNY0tyVFZPZWVXS2NzdWdOdWRHcEZjTE9xa0hZWWZZSGRQbFRY?=
 =?utf-8?B?SHUrL1lPZU1WTE1veE5pbEtDalBwUmM2MitqQ1QwS0NBekhIOEZqdzRpN1Jj?=
 =?utf-8?B?S0owZ1drQ1UrR2hWMnowUzhCenBmcHVYYmYrRnhSSkl4US92djJ1bGFVOUhv?=
 =?utf-8?B?S2poYWxSVjRYcUlSNzBWcy9SUjNWT0VpeXVHdWdFbS82K3JZc3ZpU0RQUG1v?=
 =?utf-8?B?T2w2bEdHdmROMThvTEJjTWJraDdhM1BzZ2xKNzR4d1FsQStLYTN5UG5MMWw0?=
 =?utf-8?B?WTlvL3hJdm1iVEsyRU1UNTMvcDRTWStyOXJqMER6a3ZxQmoxRW1zLzczOFMy?=
 =?utf-8?B?a1pnMVNsV1pGS2hXOW5wOExoNjN2aEtjVEpNaDNxSzBUUVR3U3lXK0RxaG1Y?=
 =?utf-8?B?S2dBYThmbVdZMnk5Y0dQUmMza1VCdmJnNThQV3UxMStDbjRsVVhtQVE4RVRv?=
 =?utf-8?B?RStlQS9QU1ZsRUdmZFFVTU45LzhxOGJUK3VJWlhHaEFyK1BXQlVBenl4aWtx?=
 =?utf-8?B?UEJhb1RVSGVzVW0vN0lmRmYyRFl5bEpnVFRicjRaNVVxdkE5eERacUhTL1Jq?=
 =?utf-8?B?Y2sxbjFYSkJ6Tkl3a2hxOXF1S0hETkFBMHgrNE1BM0dNN2FzSld3QURVMXVQ?=
 =?utf-8?B?c1lQa0Q3b2FudkVlMmI2dWxlMkN1WXRraFExdUt6di9vZFFwU21qbjhmV2Er?=
 =?utf-8?B?TXEwa2J5VHByUEtmMkg4TE1vY1FxRVJlczhvSXgvUklmL1Rqbjl4NkhTcmZr?=
 =?utf-8?B?RkM1TTFJMnY5OWNTcnNSL2V5NFFjYkVIV08vRHZSUnhPMmdwa0pYaUJjenFv?=
 =?utf-8?B?YjNzNi83STlYTEVFK3MrYkxVZVN5M1I0ZjVoY0EyeGp2Qm4yZzFCMjVaMnJY?=
 =?utf-8?B?eU5QOEYvOThqdXlka2dIZUlyVERMRkNyWlEwa3BnNlBrZlNDOVkwd2JTQlgz?=
 =?utf-8?B?YmtTUjZac1pObUpWRDZXeDZyMjloZ3lsZVNVSW52ZlJNazlKUHE4eVI2cGp4?=
 =?utf-8?B?dWJZOEJWemVYLzZSZndHNzkzb2FJMVR6WFdGT2U4cXRlZjFCTERJODRSV0tz?=
 =?utf-8?B?WTZUaDVyS3d6NExXZXVFSExkZFg3SmNTUHFjYzdpMC9Ldm9GYnMzSlpyT2Js?=
 =?utf-8?Q?k20iHIvjaznaPi7vBukDC0U=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UU1jczRER0IzTWlGTVRhdXdTVm1uSDFMUTl6Nzd6TVhyOVdUb3dZSnFiMnRh?=
 =?utf-8?B?KzM0ZUxlRWVqRVk1V1pFV2FiTlNtT1I2NExrMnJNUWxFQWh2T3dhbDMwYjdF?=
 =?utf-8?B?SVcrNVQ1cG5Bb29WZ2JTY0xWWTlzK3VXSFd3Q05Sa0RHRyszVmlCbk1WdEFl?=
 =?utf-8?B?bzFQNHVKNHpxYUFRazFoWitYNkMxcmdEYzY5MCthTTBYQy9ZSWNJNXVEckhp?=
 =?utf-8?B?YTRleFhjNjZYYjVHWUorWkxDVUJsTUJ2NFlDRU9lN0FtYjVDMEd1bXNRdmRh?=
 =?utf-8?B?MDVXcnVNZ0g5Z0hJZ3hFeU9waitHdkhoYlpLU0MvNTlQbVdMZ0RkdEN5aDNL?=
 =?utf-8?B?aklsckF3dzdtMU9Ec0FNWG4wVDJZUTFFRDIvRjhLdTEyZll5T1ZyZkw3RS8v?=
 =?utf-8?B?L2JGNUJabEw5dWhGVElZeDVpSmpYTWVXOS80a2pzM1ZzQm1EWGx2bXRrR2Qw?=
 =?utf-8?B?cUtMczRscUhhTXZuNDU4US9oZDk2enVua05jMkRuNjBKSkg2VVpkcGdXeEtL?=
 =?utf-8?B?WEtJY2puenU2dFpZYXVjRDZ3Ukg2UGF0L1N5YzFxY0x1YnY1dDlndE9McVd4?=
 =?utf-8?B?RndpdU1SMXB2L2VrOFFjbE9zSzhBS2FBWnVudDdaTFdncmt3SzU3aFRtZm54?=
 =?utf-8?B?QjZsb2Z6NFdJSXJraW5QR2h0Q2pmV0tRVmcxb3YwTldPV2xpSUFaWTdQU3dY?=
 =?utf-8?B?SzhLRVJia0U1M3NkbDJ2V0dpL01PMnUyWERQVFZYYlNKZ3FFSU11ZEhQQWlj?=
 =?utf-8?B?RUgwcitPU0NpTnNRZGdMMHRhM3FISng0N0FsYk12RGtDMmJ5WklicGRuN3U4?=
 =?utf-8?B?N2JNSUc3MUtKUUhPVWM2eUl1NU9BbjZGLysvZmUrTitvZlZRYnkzYkdpdHpM?=
 =?utf-8?B?cXhwWGwwQTlvYW5qTXJ3dmx3a2duZitEWmFlKzZiMUtRazZReTQwK1VrYkdn?=
 =?utf-8?B?ZWZHVVdWQ25XNlJmVHBEdWkvMXNsYUl2QnhoRHFqSXlMckJrKzBwamtyVzN4?=
 =?utf-8?B?TDdJd21aVHVzZ0Z5cFFlMnQwazZqTVdOQWUxNE5SYncwa3RVMmhNZmFTdXZF?=
 =?utf-8?B?aldnUXRJb1pMKytRMi8wakVWZEtsVVFnR090RllOR0llbDVmeGY5MDVnTTlS?=
 =?utf-8?B?M2p1SnBPVXV0aks2dmFwbkIwQWdNSkRIanMwOEI5cmtrTWR1WS9Fbm91UGtH?=
 =?utf-8?B?SlFjM0Zoa1ArMlRJT1NkclpmaUI5RmJVYVNyMHRvblRmckdDdHFHdGVCY2cr?=
 =?utf-8?B?QStEV0dRRU1jREVrUVRyT1FNOGVPV052L0xFRTVMN1EvMklEQTM3aFFMNTUw?=
 =?utf-8?B?OTYxNHJWZlU5eFlrVkVWVDlYaDBEbWJOMGdsRXZ3Ly8rMTdxRVFBUmZ0Qkpm?=
 =?utf-8?B?dEo4NHhWN3YwWEJ4eEg4clN1UlhTY1FpV3N0K0RKK25vU215b3c2aEppU1Jy?=
 =?utf-8?B?U0h6a29nbGtzNVR2RzFzNGpDSHg5c0xmeGkzRlNsVFM1MXFKQ1BPTThHMHRl?=
 =?utf-8?B?UUdKZGsvTmg0MmsrajBaUktubE9MT2lJZE1jdHlWNzhFcER3TnhyY3g2OHB1?=
 =?utf-8?B?RktvaXcvdGVVQjcySFhJVDdUR2VaaUFBSU14SmtFaGZmcVZnL29nczhlejhM?=
 =?utf-8?B?YkFwOUVpakxkdXdVY2dXNVFCNXF5VEtOMUIxVnVxUXY3NnYvd2lCNVhtZGxB?=
 =?utf-8?B?cFdpVTNXbzREYUU2cnBkMlRtNU5HWkFuZFh0bktDZlNpM2RHaGVxUTE5YnZa?=
 =?utf-8?B?UFllZUNwRXBtRGFaTytxbmNFVUhnYmYvazBMNGZhVnhVV2hDMk5qODZMUXNj?=
 =?utf-8?B?K3pFK3RtN09VSHdCckZDSFAzQmNIT29TaEF4NG1aZllOUUZ6a3ZUOGdHUEl4?=
 =?utf-8?B?amQxaXJDMFM4WHUyakVFU0t5Y09iQmZndHFHYUVmYUFNMjljYlFQc3ZrcFRh?=
 =?utf-8?B?ZmRxemRzMGROTmwrbVJqVjZESXZpWlBKUnVrbTE5ZUs0Y1J3bGJxZ1hWOE9w?=
 =?utf-8?B?NkoySUg2alJ0dGN4NmdhNmg4YW15TlFvN2Y4QUZKVFhHZFR1SUpuV0JxREww?=
 =?utf-8?B?TDYraDAyUVZmWHZ6dDJ4NHhHOGw5aW04VDcrMVRyWnc1MGRUa1c2MUNFejdP?=
 =?utf-8?B?cGVlS3BjL29MMDYwTm1jNXFNMDNIMkVVekNCclJvQThUbkRmQUhWQ3oxYjNQ?=
 =?utf-8?B?c1hldzIvT2ZsYVBsam9Od040Q3RJdktOaTlsM2xtSWpPNHpEQ2U4cnlyUXRS?=
 =?utf-8?B?YkJCUjhadno4YmhGS0dYSFpiNU9vdHlPOURsZ2lLN3h6RUxxSEpaQ21CSW9D?=
 =?utf-8?Q?OTOUQ8maoCK6nk4vkG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf5667a-90cd-4a5d-6dea-08de6b3e1a83
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:26:01.1831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyU4xqohjpFRkiIlng1bEy2MEsxMMiWlbiVgcNSaecttVlF3DQ01u/sAQiaWHMiZSL2zrP7F7fp5C7M3tn3SrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52785-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: 1F8A01396A1
X-Rspamd-Action: no action

The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
Rockchip RK3568 implementation.

The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
"fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
rk3568.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 2c2bd87582eb8bfdd13720edd62a5f00dda958ba..4ac4a3b6f406408b9524c795e6cdeb117d3353da 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - fsl,imx93-mipi-csi2
       - rockchip,rk3568-mipi-csi2
 
   reg:
@@ -26,14 +27,23 @@ properties:
     items:
       - description: Interrupt that signals changes in CSI2HOST_ERR1.
       - description: Interrupt that signals changes in CSI2HOST_ERR2.
+    minItems: 1
 
   interrupt-names:
     items:
       - const: err1
       - const: err2
+    minItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: per
+      - const: pixel
+    minItems: 1
 
   phys:
     maxItems: 1
@@ -88,10 +98,43 @@ required:
   - phys
   - ports
   - power-domains
-  - resets
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/rk3568-cru.h>

-- 
2.43.0


