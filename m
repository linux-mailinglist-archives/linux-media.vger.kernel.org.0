Return-Path: <linux-media+bounces-25509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD5A244D4
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22AD03A8083
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0091F4E47;
	Fri, 31 Jan 2025 21:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lqty5r6q"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9AE1F4E3E;
	Fri, 31 Jan 2025 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359310; cv=fail; b=XC9XkSd0mVcfMvSI/jpv0v843ZSygv3QRhZOMyuhovP5HR9P65L9NFqrG1a1dm8jzDcaTl8hilkWXLZXms3JTWRO7shC8zu39bhoSvCRyxYFHfWJTFQPW47oRu2LlPmfjlLyJRq9sekdDjvQupMPMQyQBFCbl6QUHeKPMJWR1Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359310; c=relaxed/simple;
	bh=QaVEesB5DDNjrLw0SH/IbtAhZ1YlADolV5683h08vTk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pWLN7lmztuPtnIcPzcGWBU5YQBMSxeuY8t2ttkhb5BQo1aqa3HQbS0ZnNLQcx7J/BHdvG86sljiztlns4pZMHIMThx95nRodijDlZpyDIwUH+exEJhCha2xdOsEOcMEE3JRKrMeCfVaqtbNpcaSCxHd2hlIZS+rtbE1KqAEhTZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lqty5r6q; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpNlW73e8opKksFkvpywd8e0ErkEptV/aIGb5NEFov987lnrwIgxwyi+r3YEOGiSTmbbQtD7U2zvtEBsrkmvIhjhr09R2QHjv3zkLXvU0wJayKxf74V4JtNSFI6/EYs8qK1QVtdjinG5+2cVU5nhMyncJ/orldr5Y2Z3A+/212AMeZnTCh5SqwlF2YlS7xVVwMB/RDhNnMX2cP2nby50Q2tehThYRKkNc0cl25wrxp2adfGDwbUGjeRRJS29MGqr523EgotIOHATA4t3+ZZsJFlRLiwoSeSQdEz9QfKkqRkh7HV9mowRmDw/Xa/eC+5guek0alxnW3+HZXpL/i0mBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOYTi5kbcariKAg16FmpYZXGtNoEpFKPoq8wkHMlEdc=;
 b=BRAc5azEYk+jB15xIIHfpfZqqLdxmkORa1r3NHzUOt5deFYG2xsTaI3hMDBWLzyOotmC4C+oKcwbH8PxgOhpuB0u7ECDBZ8N0PrEKgDr19NO99635WLgxqR5Q/XXIVSl4yFy60TINz3f0DoIgR558uhjBUgJJPRgG0sFgam4d1Y48HLNTVlpD76Gc+U9x/7hXDRdKAxDFSQQN/cTdI4SLcAtjvzsuzIIHA2w794hSW8dgATxh8SuXBZnlIeE6ISft5+GMBaVXXs4OiOqrThQvjIlMrQVGbVlPUoLeBGl9JOoDNoH0dzhID7bsu5pu2uERpAf1uyXkH/rV8rJYcRjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOYTi5kbcariKAg16FmpYZXGtNoEpFKPoq8wkHMlEdc=;
 b=Lqty5r6qbfkS6cNjnFV5VM9+zsLdakwnGm5z4yMMhoR27sl3Fgna9pJgD2BlStmcz2yZE3fZR8vKbnQA6ydT1kiPahoXMl7B5d6ipYUGBH7IIeL44ikAbU8BHxwZ9IWv9rEvQGubeg+FiElZrjBoMtyTaIw5Gr6Azb04IVceCENG5IFpcv3MBvV5WfjH4Yjt4RUBlUuSGMKEaTdEDvWQBf2tGO7BdsPrVdQb6CovKrPcG29ClF6cA7JqCDObw+4v8My6/JzDW6CVO9qib7Shcy/waI+RX7RkQIqcDGptDbdMh/BDP/HDxMB7/7buEytpXkixjfWREpfg+YE44Fp7Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:35:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:35:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:56 -0500
Subject: [PATCH 11/14] arm64: dts: imx8: add capture controller for i.MX8's
 img subsystem
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-11-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=16238;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=QaVEesB5DDNjrLw0SH/IbtAhZ1YlADolV5683h08vTk=;
 b=djUhKCYWxYLscUdIf8acS97qNqZZU8f3cAuqBgRfctsCcbp0WDukI3CaLXDijDxAzM0F8mbLZ
 PG16VWysBTXChT2sb1kgSXv+NKClFgZVddCJTH90lyFYkvo6laN568p
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: 774c28ac-aa69-4928-0f2c-08dd423f2059
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TU9jMWlrTjNPY0d1Q3dsSERMYXlVN1BXMHBtRjRSdSt4b1puWWtVUU9oM0JL?=
 =?utf-8?B?MjBueGVNc2o0TE9iOXRKemYzZE1rbFcySnBOMG9ubWlGbUNiSEpRb2x2T2Zj?=
 =?utf-8?B?L2tOa3dPbkVCeklxRnVPaEFTbXZRdHo3REdCR3N6dUZpa25QaThuemIvZngr?=
 =?utf-8?B?UEY3UWl5U2NZeld0SENPNDl0VUJhbksybk5JODcxVStPam5JYTFkdWEzWmUv?=
 =?utf-8?B?VFJnWk02R2tkV3VIU2Q2Wkp4NVlMd1UvMmNncXN2SXFRd2I2MFJGamRMOStu?=
 =?utf-8?B?NDBacTJ3d1BzNE92WGVsUXVHVU53dWluUVhiRFo1dlRWekcvQWpnbUNJQU1B?=
 =?utf-8?B?WVJ5cW1HYkJLcGQ2b3BWVEloYnE4cVBHYmdyVExxU2VxZlkzTmEwVjB4YUZ3?=
 =?utf-8?B?MUJQRW5maHovdzU2ZlJEUEEyN3lCVmx4NmlQdU9FT0pjdzVrYmdSWXhyNFM0?=
 =?utf-8?B?ZVJSQ05LRHJLalhxT1d1SVNxcVZzRnNIMFRFRzhZSjZVMEF5a284ZUdzdnUz?=
 =?utf-8?B?V0tMaVpYaUpiZkFkanNtRFZJRmo4VWlHaFU1Y01lc0swR3dDcDdRSkJZb0ZE?=
 =?utf-8?B?V1pWaWFWWW5KNlFkaFlVWWVEWCtXbkE2bkNIZEI5SXpYcUQvZzZBUE1YTk5G?=
 =?utf-8?B?M3d2c045aFNNb2NPWEU3TDEwMExBVzVEOWkvZmdLZTlRSEI4Y0dyaldoTHc3?=
 =?utf-8?B?OENqUXdLTnppQ1JhazgvUmZxSHRreHRTWDM2VW9RZENjWllMRWowM1I2VzJZ?=
 =?utf-8?B?bGhoalBsd2dOQXNabXU0ZXZJcURCdG5FV1ZCK3FtVFEzVGdWd1hDQ1k5NmNx?=
 =?utf-8?B?UHBhWjB3bk93REd0dzYvQjJVVUpQekxzUWJBUHNMN3hqTFVrb2I2dHFQNW93?=
 =?utf-8?B?QktaOUdKZUduSDA4UmFLN2hqem94dWJ6SDdZNmdvNS80em5aMTdlUlRvb2Zj?=
 =?utf-8?B?OWoycXZEYi9YdVJiZmt2ZDUzMU02WTVUS2xqZjYyMHZ2L1AyVkdDRXFCaFBI?=
 =?utf-8?B?bWlZVjBkZS95Q2xZS0pDNGNqQmYxdUVCSlFnVTR2NVRPeU5ETzdiZHNDTzJE?=
 =?utf-8?B?aVZFQXppaUlMeXZIWk9GNjkwUVJKQlhheTZUdFlmRkVFS0ZZK0RuUVZrRVU1?=
 =?utf-8?B?NkpwcHpLL21kY2ppcnNUV2NlYWtXTzRMajc1bUlacUc5RExHUTJJVEdvWE9M?=
 =?utf-8?B?UGdQUWxDK0JDZjF0cG4xeEU0MXlOOHgzeVJiMFR0SXlFVVd5cmFOeGhlRjFp?=
 =?utf-8?B?eDNveXYwaVh2M2NYbURWYjlUWXpobFYrWDZjbi9jUEJhZCt5SCtPNElHL243?=
 =?utf-8?B?REFEcVg4RjRUVUhKUm1kUjFpcUlLUzNtSGszRG5QZmI3VThJWFhORE0xdlls?=
 =?utf-8?B?RmkwVzM1TjdkMG9oaGFwL3RudUFpajk2SkZOUFhBMDFkMWswa2o0dmtXYm1H?=
 =?utf-8?B?V0xtblZqZElkYm84Wld0Qlh5aThDdE01SnFSZkxxQ2RCcjIyVHJaelN6dkNi?=
 =?utf-8?B?WXpWZEdIN0h5Z0Y5cTRMY0p2ZjdnNTViQ0tQYUFSL0Q5aEVpWkEzK3hxZTh0?=
 =?utf-8?B?TjZUeDFqQXgrQUo3bytrRCtDRU55VUhVM0JIbDhZY1ZXQktTTG9hTWViMnlB?=
 =?utf-8?B?M3ZYalVsaEFFV0Exb1Zmd3FJQXpFTm0yT09aVGdEZDNVazR1V2FHVFFCemVI?=
 =?utf-8?B?YmZ4VDZWby9XajcvVVBIb3lKcXFtTmQwQmRrNTJYK1FEazZMRVh3dlFXN3Ix?=
 =?utf-8?B?eGREMnVwYXVURmNlYzV4VStZYms3Rk9Xa3Y5VzdWVGdqYnEzNnBaM2VKcjJG?=
 =?utf-8?B?M3JnWHpRaC9WYTR1L2FuWVVwa2RNNUI2RnBuYStUa203Umd4bW1idWRzR1RK?=
 =?utf-8?B?QmhqUXVCS3haUGw0S0VXOHZhVDQ3MzR6eXNQSWlXTis2ajZwQ3ZkandEVUE0?=
 =?utf-8?B?V3lJTEU0QTFyVVRFRzNiVU1SL29nU1J2ZGhoU1l6VnBmNDVSS3AxUjVKbFNz?=
 =?utf-8?B?V2xzc0xsaFNBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M0cra0NUcDBTZUc1em9nN0hGSEFnNTRmcnpkU0p2QzRZbnBDbGpBbmo3aFFx?=
 =?utf-8?B?bTdtbTI5Y0Z0NnY1VG11TEdkSzFRVHArZWVKNEo2WHBiZWY2VmpncE9GemVX?=
 =?utf-8?B?UTZTam5acmx0Z0J4UnVnVWNvWVoySWNEeWFRMEJ6ZTU1bkJnMFpLZ2hxR0Uv?=
 =?utf-8?B?cUZoZWF0NEdIVURZb0NXclViVHl2N3N4NlNCUlc2QmFodVZuODZGSFJkVENj?=
 =?utf-8?B?bTc2Ukt6am5LSTBQaUV5ZTgxTi82YnhTenh0SHhXakg0SDRGbUluVHlsTkxw?=
 =?utf-8?B?V2RpZ29kVmFZMEFUTHhpdjI2b0xmZ1dlaEVXVUFRcTRtaHhkQUlNT1c2OVBM?=
 =?utf-8?B?aVBpS1F2U3M4cVY0RmVicGlFR2JHb2U3MkNIL1ZMaW1ZeUJ6NHRqQzZNYk1J?=
 =?utf-8?B?b3NnRDhIbjcvMEdKUmJzS0k5NmJVMjRqbHlJQjhlNjRFQ2h6SC9yc0FDWUxs?=
 =?utf-8?B?OWc3L2pVSFgxMjNHL0tyNy9NbGR2c1FyWUZlZDNndEJtSW5uNkptbDRBVXV6?=
 =?utf-8?B?K21lY2hxSjh5UEh2RlpaWHNkT2ZnV2dKRUtvZGpBejIwTlIxbEo3T0Q2dGlU?=
 =?utf-8?B?NlhOdHd2a3EyNGM4S2U2V1NEVWttOCtlbm15d1RudUxiemFCa0RVOVJoRUYr?=
 =?utf-8?B?THdDVnNURW9YWjNkUVpwby91VDlHVmpFWlF1SVMrMTE4SjhNcTM5cTMxZXUv?=
 =?utf-8?B?aDM1RFhBK2taam5qS20rOEFicDZvN3BPN3BXRysyZ1dlYy9QMUFOZHFybDlV?=
 =?utf-8?B?dzR0RmtFY1AwRVc5MWRLNFEvajUwU3Uva2VyQXl4NndORlZEYkJHSzRLckxL?=
 =?utf-8?B?d1hodVBLVjFyeThEcXZMV2FRcDhUU2o2Uk1Vb3IyYXZiQkV6bE1IMVowYTlG?=
 =?utf-8?B?cytMdGdwa3FWNHR4cE44WkRDcGNWYjZhcWZ6a2hMUlYxYlJ6dm5jY0xkbWpL?=
 =?utf-8?B?cmFWWGdLNTEvZVhTaUJmaUlFUlltTGt4RTZjZllxZSswTzdmeGJtQkVBRTVT?=
 =?utf-8?B?NFE2T1NOWnl6RjVoazJrOVFYeGYwZ21nWnlGMTNNVXJFYXhtTGpCWTZObFh3?=
 =?utf-8?B?QVJNZEdwcWRZZEpCVTg1OVltK3haY3VRbndscTBwS1lLdDQxbTFqalg2Z2NQ?=
 =?utf-8?B?MVdQN2ZtM0JHSHIrTVZwT1dWWHhUbm5TUS9EdXdYazFZQllmcHN0dDloZnVD?=
 =?utf-8?B?NWRCRWdkSTZjOUxPNkVuU1ljRTZNT3VpTitqdGlBaXJOMzFoMXZrK1dZVEln?=
 =?utf-8?B?Vkh0ZDYwQi9MVG1ZdVI1Ylp5YUduY2toNkYyVlNFanJqdlZqUGdiWVVqV2hU?=
 =?utf-8?B?b0hZa0VGL3pzREY0dGs1M25uU2drZk9NKzVtUHArbUtIQU4zZnUxb1dpRmhN?=
 =?utf-8?B?RVIwd1ZmeVA4Z29KNStpeEhRRmNUVG1wc0lrbHM4cmtWTUoxVzRFRVFWVlZ0?=
 =?utf-8?B?Q1RwRmh3REZCZ2ZYY2l6ck1TNVNCQ1p1bGdSMFlxL1hxc2lZQ1IxMFFvSHh0?=
 =?utf-8?B?VTY3dlM2ZmRSY1Y4bnpzeWQwNXI5VWtrN1BlTVNSQWFvM01MNEVPOFJPVkpq?=
 =?utf-8?B?Uy8wR2pPNkYyMmxUV3VIaSt2MEY3SisrY2hpT2tHTDZ6TFhhYWVKVDBUbXFW?=
 =?utf-8?B?NllwTFNNVUdFV1kybDhRbUR4ZFFVOEp4UzhHb3VCeWNCcGZHYXJlblQvS3J0?=
 =?utf-8?B?eEM3LzVlMGpTYlVNYmpUL2lrWGs4ZkJDa0M4TmpSQnpXN2FxNEd0RlZzazFk?=
 =?utf-8?B?Y01rWXRtMStDSEFaeGx0SWttRXkxbU94bk50blVFNlNYV1hxSnF4b0J1NG5m?=
 =?utf-8?B?YTNUalg0YUNZY0xPRllpcjZBaWNrQ09nTlgyN3FGdDJBVkVXWHEzZVN6Rzd2?=
 =?utf-8?B?cmJZcWpIVkpyb0lWVWc5MHkxVmI1aC9reTBwUjFSMCtBbEk5VkwvYWpiQTJK?=
 =?utf-8?B?bllmVDBnTWd3ZTNsUEM0NkVhYWt1WUFKWVhGRFJ4TTdJcWhwaGUzVXozV2NI?=
 =?utf-8?B?MmJqWmdDSXdqUnhTdUJBa3hkMlB3WkVtVXhDcmRhb3B3OVdGMEorMUtUY2ht?=
 =?utf-8?B?aitrQXVac1IvYzViUW1ELzkwWmViWkt6Nk5pTnZYeXQ0S08yMTVQOUphZGlB?=
 =?utf-8?Q?uEFI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774c28ac-aa69-4928-0f2c-08dd423f2059
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:35:05.0664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCqrlFKJTac+3se9DZPQFopg5/vfWQ1FN1Z5BDbU+yX6PDAVCWrpXgcg/YUq5UTI7HYssdqE1rZ8eP3noT/gWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Add CSI related nodes (i2c, irqsteer, csi, lpcg) for i.MX8 img subsystem.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 396 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi  |  37 ++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi |  60 ++++
 3 files changed, 493 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index d39242c1b9f79..edcf7976892aa 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -3,6 +3,14 @@
  * Copyright 2019-2021 NXP
  * Zhou Guoniu <guoniu.zhou@nxp.com>
  */
+
+img_axi_clk: clock-img-axi {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <400000000>;
+	clock-output-names = "img_axi_clk";
+};
+
 img_ipg_clk: clock-img-ipg {
 	compatible = "fixed-clock";
 	#clock-cells = <0>;
@@ -10,12 +18,290 @@ img_ipg_clk: clock-img-ipg {
 	clock-output-names = "img_ipg_clk";
 };
 
+img_pxl_clk: clock-img-pxl {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <600000000>;
+	clock-output-names = "img_pxl_clk";
+};
+
+scu_reset: reset-controller {
+	compatible = "fsl,imx-scu-reset";
+	#reset-cells = <1>;
+};
+
 img_subsys: bus@58000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
 
+	isi: isi@58100000 {
+		reg = <0x58100000 0x90000>;
+		interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "per0",
+			      "per1",
+			      "per2",
+			      "per3",
+			      "per4",
+			      "per5",
+			      "per6",
+			      "per7";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>,
+				<&pd IMX_SC_R_ISI_CH1>,
+				<&pd IMX_SC_R_ISI_CH2>,
+				<&pd IMX_SC_R_ISI_CH3>,
+				<&pd IMX_SC_R_ISI_CH4>,
+				<&pd IMX_SC_R_ISI_CH5>,
+				<&pd IMX_SC_R_ISI_CH6>,
+				<&pd IMX_SC_R_ISI_CH7>;
+		status = "disabled";
+	};
+
+	irqsteer_csi0: irqsteer@58220000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58220000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	mipi_csi_0_phy: phy@58221000 {
+		compatible = "fsl,imx8qxp-mipi-cphy";
+		reg = <0x58221000 0x1000>;
+		#phy-cells = <0>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	gpio0_mipi_csi0: gpio@58222000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58222000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi0_core_lpcg: clock-controller@58223018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58223018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi0_esc_lpcg: clock-controller@5822301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5822301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi0: i2c@58226000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58226000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_0: csi@58227000 {
+		compatible = "fsl,imx8qm-mipi-csi2";
+		reg = <0x58227000 0x1000>;
+		clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi0_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		phys = <&mipi_csi_0_phy>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_0>;
+		status = "disabled";
+	};
+
+	irqsteer_csi1: irqsteer@58240000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58240000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	mipi_csi_1_phy: phy@58241000 {
+		compatible ="fsl,imx8qxp-mipi-cphy";
+		reg = <0x58241000 0x1000>;
+		#phy-cells = <0>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+		status = "disabled";
+	};
+
+	gpio0_mipi_csi1: gpio@58242000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58242000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	csi1_core_lpcg: clock-controller@58243018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58243018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi1_esc_lpcg: clock-controller@5824301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5824301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi1: i2c@58246000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58246000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_1: csi@58247000 {
+		compatible = "fsl,imx8qm-mipi-csi2";
+		reg = <0x58247000 0x1000>;
+		clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi1_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		phys = <&mipi_csi_1_phy>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_1>;
+		status = "disabled";
+	};
+
+	irqsteer_parallel: irqsteer@58260000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58260000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_dummy>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	pi0_ipg_lpcg: clock-controller@58263004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263004 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "pi0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_pxl_lpcg: clock-controller@58263018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263018 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_misc_lpcg: clock-controller@5826301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5826301c 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_MISC0>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_misc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c0_parallel: i2c@58266000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58266000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_parallel>;
+		power-domains = <&pd IMX_SC_R_PI_0_I2C_0>;
+		status = "disabled";
+	};
+
 	jpegdec: jpegdec@58400000 {
 		reg = <0x58400000 0x00050000>;
 		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
@@ -40,6 +326,116 @@ jpegenc: jpegenc@58450000 {
 				<&pd IMX_SC_R_MJPEG_ENC_S0>;
 	};
 
+	pdma0_lpcg: clock-controller@58500000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58500000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma0_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pdma1_lpcg: clock-controller@58510000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58510000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma1_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH1>;
+	};
+
+	pdma2_lpcg: clock-controller@58520000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58520000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma2_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH2>;
+	};
+
+	pdma3_lpcg: clock-controller@58530000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58530000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma3_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH3>;
+	};
+
+	pdma4_lpcg: clock-controller@58540000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58540000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma4_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH4>;
+	};
+
+	pdma5_lpcg: clock-controller@58550000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58550000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma5_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH5>;
+	};
+
+	pdma6_lpcg: clock-controller@58560000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58560000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma6_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH6>;
+	};
+
+	pdma7_lpcg: clock-controller@58570000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58570000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma7_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH7>;
+	};
+
+	csi0_pxl_lpcg: clock-controller@58580000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58580000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi1_pxl_lpcg: clock-controller@58590000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58590000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi1_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	hdmi_rx_pxl_link_lpcg: clock-controller@585a0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x585a0000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "hdmi_rx_lpcg_pxl_link_clk";
+		power-domains = <&pd IMX_SC_R_HDMI_RX>;
+	};
+
 	img_jpeg_dec_lpcg: clock-controller@585d0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x585d0000 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
index 2bbdacb1313f9..e14a5d86853f1 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
@@ -3,6 +3,31 @@
  * Copyright 2021 NXP
  */
 
+&isi {
+	compatible = "fsl,imx8qm-isi";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+		};
+
+		port@2 {
+			reg = <2>;
+		};
+
+		port@3 {
+			reg = <3>;
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
 };
@@ -10,3 +35,15 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qm-jpgenc", "nxp,imx8qxp-jpgenc";
 };
+
+&pi0_ipg_lpcg {
+	status = "disabled";
+};
+
+&pi0_misc_lpcg {
+	status = "disabled";
+};
+
+&pi0_pxl_lpcg {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 3a087317591d8..4c15e4569a51a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -4,6 +4,62 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&csi1_pxl_lpcg {
+	status = "disabled";
+};
+
+&csi1_core_lpcg {
+	status = "disabled";
+};
+
+&csi1_esc_lpcg {
+	status = "disabled";
+};
+
+&gpio0_mipi_csi1 {
+	status = "disabled";
+};
+
+&i2c_mipi_csi1 {
+	status = "disabled";
+};
+
+&irqsteer_csi1 {
+	status = "disabled";
+};
+
+&isi {
+	compatible = "fsl,imx8qxp-isi";
+	interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>, <&pdma4_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma5_lpcg IMX_LPCG_CLK_0>, <&pdma6_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+	clock-names = "per0", "per4", "per5", "per6", "per7";
+	power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
+			<&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+		};
+
+		port@2 {
+			reg = <2>;
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qxp-jpgdec";
 };
@@ -11,3 +67,7 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qxp-jpgenc";
 };
+
+&mipi_csi_1 {
+	status = "disabled";
+};

-- 
2.34.1


