Return-Path: <linux-media+bounces-50909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA555D33713
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56FD03044232
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDCB3939AE;
	Fri, 16 Jan 2026 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lPWPLu1v"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471434403E;
	Fri, 16 Jan 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580331; cv=fail; b=nGj3lX1uI+MDaAEqdep1q30ypLVJ7jiU1mghTL7s3wF8e4i200/d8ZKBmCpskESrBZAPOPU5t7tIym3ohGyErQP+0MzfcuH4G6d2SD9AU+rN0vgx5EqfBp/n65mWUVfEBYpzKTQHZp2+Ve0d0DUCsuXg3V1Qfz9i1goyHy+J2Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580331; c=relaxed/simple;
	bh=CGjDzRXz+eQXEoJENI8tLIYhP+g0jZuTr4Gv8ve0irI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oqrjj6vQww4Nv0xCRMMBMlauYmKNGiZB9nwlWYyZaCWREq2luV/iCiEMc67rNOwliNDDnR+Xg/Os5b6Wt4FhZGlkLNJxge9nPpcIc14yKOkUe78NJ/Cb/mXVHW3Bt78qjJrJo8rPmDf2kyLY2dKe8TLeaeato0okQQ+En/uF6wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lPWPLu1v; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2Ego9lnK+di4W0JsiOI/CVhiTL6GLo6vMLxCDkm/oZ7DtEETpvxAzzVbriNfhm8sw/A+Ea10UJkiTU369/boTkqih9qjuhJNJZesw+x2wnNJrP6i/F9Q627ZG67eBRRWe+talX8ssC/+PJCzmUSlpDcig1FSGu/IGmGUkotqIB1AXaXJG6XYFPIbQNT9EeEqXQBdk7zQEelDdoP1UXI3iWnKEJlmvGa1OakjSLQu7fsRenxUDQ1Rs//IQPfVkcRVKqQZF2sR2VT6pXstjL8ciTTVHstocADCWM0xhsMLPZN5gk3QCWsQ48AIHBAqmvKCu4wu+0Y8RJ9oZXtKk2k5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KIAOBMOSnd4359GMBHbIy2cPl2H25yHCjXiRW3frPk=;
 b=E/NJf+OTPDWbCVpz+ryoqhaXkS3XFh94wwolvict6Rq6LDPqMyph/VY/tS5pcBRTBFku8lAAA37e2IK9It2KFM9Z7Q8DPVSoLTOMkK+so018NDKG4egkkXATYnaZ8RIIyVQHXwVql8zVcqiSMkXIQouKveT8GZgt8VZPQawyyCLuZeIDkimLbUjzpIJSrqOaUsJhYc50IbC4zQDzi1d/7KeNFttAPfM4sDukxmUg8ZrqUAosaa18txXzWRnUxtggb9IV5KZkjTwKPyDhXAJxeBk0H+I6+TJ7L02zCbFkIZWyyZq7TFeyo2NJT19d86pzGqiyjLecRoWptwFygptqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KIAOBMOSnd4359GMBHbIy2cPl2H25yHCjXiRW3frPk=;
 b=lPWPLu1vR6Gq25ykXVGklmVeb994788pxGJBgvny5BBAUq4y/AVNqFosbKmNn3skx7pwcHfGR4zYJLqd06HiZ4TdL9dVMsLVJfRnLlm72FGhdgGOwyvqbtyn9U0oUzV6ktxBxfdo61Eqa/zMUxxxFfAnazo4fLBJgyyp3BQwsKAzCoL0kVcM8/9tXHYBQ0bjOYijHuk0UgZyhaSTP4fTL0COsCYPS4lLpRXRKPgFkopJrk/TN1wo4V9sDZVgRY+7+3iM/mjmYRcyRSyAej84j57GsGuUet8Iwk6KjOMWYpCKOMHgPntCTanZSwpY76MCK0qHQU6y1/jZtNN6S74JqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB9733.eurprd04.prod.outlook.com (2603:10a6:150:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:18:36 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:18:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 16 Jan 2026 11:17:57 -0500
Subject: [PATCH RESEND v2 2/5] media: staging: media: imx6-mipi-csi2: use
 devm_mutex_init() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-stage-csi2-cleanup-v2-2-a56e9cb25196@nxp.com>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
In-Reply-To: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580309; l=1541;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=CGjDzRXz+eQXEoJENI8tLIYhP+g0jZuTr4Gv8ve0irI=;
 b=3VHGDEloZZQjLrXxrr43LErU4i48aYzKjB4wHqqPFp3bLWL7Yil1xO2VhjTb30MPuYSCSmvk/
 jjAeSScF/YvDEyPfJLotnZIdd61ewMynP0/jwL12yjUrJsr58zSSavg
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: dc887704-019a-4585-8b23-08de551ae6f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1ovOGt3V3B3V2owRmFrTGJwVWVUV0ZCK0FqbXFreHY5MjZhYjNtbGdJN044?=
 =?utf-8?B?dU1rY0NaeENDYlloTm9SUXB6V0Jta0wyMm1weGVEU0Y1djI2QUd6RDJHK3Ux?=
 =?utf-8?B?dythK0Y2VGdlTy92WnV1MjRMRmo4V01lQnZGV1VyYndpVndUMnVaR2MzVHRP?=
 =?utf-8?B?elNVUWRBQWlraldaUlUrUUNOVUdIQjIrbHNTZS9WeUYveWRySG1yc1JVa01K?=
 =?utf-8?B?eDRwMDZmZlYyVy9zUlhTcEJYTGpFV24rRy80bE90WjZEeTRFMlpheStaOUJq?=
 =?utf-8?B?aysxTFYvUEJmVXQ5cG1yZlZtajBCSFRERVlPbERONXBJZXNBenBCOFAyaXJS?=
 =?utf-8?B?NEltZFoxamVtdEhpblZlVkpEQzM2VzNQSFBJeXZPSCtySWJhWTVDQnloK3ZP?=
 =?utf-8?B?ZlRlcEYxOXFCMTRuTDFVR01XNkpxbENNNDhUVFVZYXNUMzIvTUxUSXkyOVlR?=
 =?utf-8?B?WkQyOEdlRE05dXpyOUMxa1A0SjFUclByOXBkTXZkYUhKNXVOeXlYTCtjMUdI?=
 =?utf-8?B?ZTM4dmtUSWp6QUpXckwranFzamRZWTFjbGU5aVhFcnZPYWh3R0s3RTVCV05r?=
 =?utf-8?B?dEtURGVBQ0xLSm9KZFdMMUZ0bDltWjdWdlBSWGczQmJLcVZzQzF5WSs5YXBx?=
 =?utf-8?B?OUdSNWxmODVUNEdHWW5IK2pwa0JHYnJFcEpDczA0OHBGMEhBbTgycWxNZWl5?=
 =?utf-8?B?MkdiNEdGYnZOTXk2RXpWdnZ2a0RmU3NLU2hHaDJJbDhrWWJNZU1LVlJURWVE?=
 =?utf-8?B?ZTNjZ2Uzc01NNFdPcHRQdWwrS3Z6TU9EUnBOMTBSQzExbDZPUU41d04vbXFY?=
 =?utf-8?B?UWczZ0s5WXdjb2dXODVMT2lyK1RFUTAwTHhhTHl0TnlKMGJkY0QyK1JQVU1x?=
 =?utf-8?B?bUU3MlVUanZpb25PdGFNMVlZYkg1Q3RmQllldWorSElqN0NPVjNpQ1J0Y0cy?=
 =?utf-8?B?TzFiZTUxc0Uyd2VDZXBPYUlEenl2R1VhT2N2aVduZ1FjS3MxcDJyNUJsc3VN?=
 =?utf-8?B?TlV3aHdLUFFDOXJTTldKZ3pTS2pKbGxmLzBEM1N0UUd4Qlp2bjE4US9WeFJw?=
 =?utf-8?B?eC9VczdLSXRzaUFhbDIzODlpWGRSQk9MRXJCSzJOdy8xbjR4V3R4REFnWXlx?=
 =?utf-8?B?MnJqSGxWdHBkcVZlUDJ4aHMwdXZib1FWb1I5VnhLZUZZZ3BxMkRTdEI5T3V1?=
 =?utf-8?B?cFBlQkZ0MG1XODFSczVleW5odTJENVY2aGNoakEzZUpKSVZnZGdvdDFNUE4z?=
 =?utf-8?B?ZEdlNG1JeUNDMU9EYzZ0eHFzT2RnVXdvQ2xXaDdCdEJqL0tBdWxXNGhEQlNl?=
 =?utf-8?B?WDVSdzhOWXFza1o3UHlQaVZtWjVNNmpRckxWYW4rdzJ2dnhMMGI3VzJ1ODlk?=
 =?utf-8?B?SWIvZXhDTlJJL20zMG1xbGg5d3NVRVExKzBkU2pHampwdWN4aWR6aG10YnAy?=
 =?utf-8?B?ZEVYUmplZUE1cFFUUGh1cXNnMHBiem1uNGFLdHdBZmpIVlp0TW9Mam5jaFp6?=
 =?utf-8?B?ZUJoSDY1L2M0Z1hsTk1MR3h4ZVdmWCsxLzFRYTVqbmdjTDJyRGJNOGxvbVZO?=
 =?utf-8?B?a3RWblRGaGJUL2YvWWI5VmtFSDdKNVRIUXAwU1RVQmhpVTNmaUxXbHBLaElS?=
 =?utf-8?B?V3RzdS9TLys3OXRrL0RxUGRaSWdNcVE3cVI1SWl3NG1jZUZvTWJBM0pKTEov?=
 =?utf-8?B?UGpZcEYzZUdDNXZDTHVDQ1dCSkhuT0ZSWEhQY0N0bkJXaVJVbnkxSkhpZlB2?=
 =?utf-8?B?TkxyRnREY3p2Q3RocW1lOWpJQ0Q4SDU2SUVQUUdnc3FYY2ZqYW9RckxiVjNY?=
 =?utf-8?B?cmcwRElITlZnb2cxQlkxYzhyU2krNlBDbmc1T29idGlERXZWTlRNa2NHdUda?=
 =?utf-8?B?MmRyQTBiZVNzTFBZUk9PeEdyY0tudnN0T0g5ams4TW53SkNLTUUveldIV3BE?=
 =?utf-8?B?cFZ0Q2VEZFJRcW5SRDRoMTVFWlVRbndiWFRva1JXOEE2dkh4UVJhUlFXSTFu?=
 =?utf-8?B?YlVrOEFxNnZPN3lyUmIxUE1naFl2RUtpV2xBU3ZxWkYySmo5aENMOUYvb2VH?=
 =?utf-8?B?eWhDL29pck1NejJUWm1MUzdubU01Sk5mRlVlK1B2azF0NUd4YWQyT1N0SFVm?=
 =?utf-8?B?NXFNdWlURE9OeXpsUFVoR3Fvbi9hRXV4QnJTT0xUa0pOSzllQU10V0o5MXVX?=
 =?utf-8?Q?/2eSElqOqAI1urfV9rvkIvI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhaZTNselFGVDRObEpmVzlkMFJ1VFh2WnJKN0xSZXR3OWlHc2lsckZCMXNV?=
 =?utf-8?B?a2ZzWjF3Tm9ZYUo5WGtXdHlRQmpyZjRvRE1CWng2WlVsQk1tblJQWG52UXZs?=
 =?utf-8?B?bDJMR3hpTzhvWFdsbmVDMkgyaGdRWHNkYytPRnF5aENHUUxaajlzNE10WTlH?=
 =?utf-8?B?dUd0eWo1TFFhK05aVXgrRkJNc29vWnR0a0Jjb013ZFVWNFVIM0ZEbTJNME1P?=
 =?utf-8?B?VEJwY0JHYWJ2SVNKOFNXR2JVVjNqTGxnUmZackNwY0k1VkJJUmMvaXY5NmR3?=
 =?utf-8?B?MHZXY3F2SnZqZVIweXRBOWNHYzNxbDAyTHBSY3dRTHdWSThzMXFadjlVc3dl?=
 =?utf-8?B?L1lyVFRQb0lHQkpoQUEzYjAxd3M1Tk9EZlluN3lpS1lDUXFURlVSeERMUVpD?=
 =?utf-8?B?UE01bUhCZ29UUXpwbFluTHNQTVNKUi82blRDY29CNlQ2QmpVNGJWSmliajg5?=
 =?utf-8?B?ZUVEZGZNdHh3NHREbmlaRXYxdUhQTStPaFFDa0oxQ0pzcW15ZlRXT2RtYWtu?=
 =?utf-8?B?dlcybzBmdExoSUhDaS9TN0tIU1I2RzN3TElWblZhalYwMy9OTUxoaVpxQmhN?=
 =?utf-8?B?M0R2c2dPSjRQQzhTazQzU3RObkliY2d6QlRVZ2RJbm8yQ1pmTzFmNHFJWTds?=
 =?utf-8?B?SGhjYW8zZ3hndjk5QkJESE9ScEdJeXJVUlRzZ1RZSGJReFhDQWs4OVhFMis4?=
 =?utf-8?B?ZGsxYm01bTIrbDMycFRZYm90OXZET05jQXNMQXpuMjdxOXBpeDVVYjkxRDNn?=
 =?utf-8?B?RTBrRWw1NStnLytQNVBHU0dqejhOK1MzMS81V0hyRmxxMGIrSkN6K0Q1WmNv?=
 =?utf-8?B?eDJ3TmtzL3NGZ2xvMHR0NkFhbTRLY0hFWmc4dUxBSW83MGoxTUtPdUdNZ08z?=
 =?utf-8?B?NnJ4bEVnYVU1VVRab2xHR3ZyVHNheXJEaURQeW9zODQ0WkdKYkw2M3dWR2w4?=
 =?utf-8?B?OWYxTGpleUxuY3poYjhLaytkMExhVTFLNmt3SXlOeTZNZ0ZhQUQ0RVNHdWQ2?=
 =?utf-8?B?TDNVTTZaa012UzVZZS8wenhCOWRMcWo3N2l5b2hMNGt4MnpLaEhmSkx6S1Zk?=
 =?utf-8?B?K3UxMDA1dkVic0hvcFh4THV4OEZ2VlBjWkhkT20xU3h3Q1ZPYW5VVUMydDZl?=
 =?utf-8?B?SGpXd0UzSkY3QjB1eWVHU3FYRVlVSllTMEF1SmFBaWRRVXBPa2pGWDRzZ2NX?=
 =?utf-8?B?emFBQTQyeHRxSUVFZHBxN0tnU1JaWTBqY2NiQ0FaRjB2ZWNNR2lETXlUcDk0?=
 =?utf-8?B?ZGdYc0llTTE5MmhEaW1Yc012amFxSnI1ZlR0QW04UFo1QTZzYlZRUHBnOHhY?=
 =?utf-8?B?dXM3Q3B6ekNLaG9uOCtxWUUvcllUREx1anM2dE1BKzhGSDRPY2FzL3FMVFFh?=
 =?utf-8?B?clZZTENBdzRmbWc2ZWlxdll1Q2N3K0JpZVR2RmNOS25UY3hGQ0h6bE93a3Vl?=
 =?utf-8?B?a2pWeDNQUm0vOElERk9rSHVWcUJHK3JXclNTMjJmL1RUMGZLQmVRWXR0WnZo?=
 =?utf-8?B?UjR0YVUwS3NTdzhCTmF6aTkxZmY4UGFpWTNQeUtQNU9TRmNmdVR3Vi85c2I2?=
 =?utf-8?B?QTR2bEVHUkkwUUdZT085bGVXYTlsd3lHKzNxQU1VVFFuV29vOGZmTm5ham00?=
 =?utf-8?B?MFJpZmovb2hYMllTMGdLMmpZTThjTSsvZEZSRzNlQ1lxOGhsRkMzeGw4bThI?=
 =?utf-8?B?bzdhcVlKaEdKZU4ySDdDUC9yVnpWRWJrRjdpREZtT01od04yMHd1b1RaanRn?=
 =?utf-8?B?OFRuaERvOTJKc2xXVU9Gd3RqSy96K2RCaWoxcnVxQjM4S0U3YlVKd3ZFUDRL?=
 =?utf-8?B?WE9icUFRSmhWSmJ4MVRhbGE1ZmV1SzVIcGlDc1kvRnZNcVpsR2JsQ0JyQ1pB?=
 =?utf-8?B?UFVwUlE0QTEwY29BVUJDRXE4UG1ob00vblczV3FQWk8vcmFsZDFTMUpDQm0r?=
 =?utf-8?B?cGpBZWd3R1p4Z2F0NXNNL2JLYmNSWGF3My84Snk3SkpDNDZCQjhsR1JuTGlr?=
 =?utf-8?B?dnd4VkFZenpUUldXT0tNVGZvMmRocW1JYWJ5Y0p0NDZQeTZBYzZuellHa0Z2?=
 =?utf-8?B?UzFyemhvWVZac2hvMDI5SDBuR2JnMXd5ZWU4NGpIUGJDeVpmVlRYcXcrK0d1?=
 =?utf-8?B?bjRLN012QTlLVGx2aXNpYnlyK2ltZmdWODdvQjdzallEa04rRmJqQXpWQytu?=
 =?utf-8?B?clFHd1hBSkFvWDVpTHJybTd0RytiQ2g4Q2VqVmEwODIxSEF5L3pJdDZOWjhN?=
 =?utf-8?B?UnVpTDcyMURRZjA1RjV3NkR0UGk0MUxlazhGRDJrNWgzMXZMRlc5Ris4aVVi?=
 =?utf-8?Q?KC+HgPZygDwmWyWRxC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc887704-019a-4585-8b23-08de551ae6f5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:18:36.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH7AiBHBc6V3Au+haJ17B3n5tUxNAzSahm9uSDsLxhfnX3zusmB7cdRmV3qKRjiGafxAam/hOzmq81a9U3y9cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9733

Use devm_mutex_init() to simplify the code. No functional change.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 1113ea2a37f03753423164069b95c049968cc0af..4f740170d2bbf586ac0a58b5d25f8f8432e9e6a3 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -777,12 +777,14 @@ static int csi2_probe(struct platform_device *pdev)
 	if (!csi2->base)
 		return -ENOMEM;
 
-	mutex_init(&csi2->lock);
+	ret = devm_mutex_init(&pdev->dev, &csi2->lock);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(csi2->pllref_clk);
 	if (ret) {
 		v4l2_err(&csi2->sd, "failed to enable pllref_clk\n");
-		goto rmmutex;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(csi2->dphy_clk);
@@ -805,8 +807,6 @@ static int csi2_probe(struct platform_device *pdev)
 	clk_disable_unprepare(csi2->dphy_clk);
 pllref_off:
 	clk_disable_unprepare(csi2->pllref_clk);
-rmmutex:
-	mutex_destroy(&csi2->lock);
 	return ret;
 }
 
@@ -820,7 +820,6 @@ static void csi2_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(sd);
 	clk_disable_unprepare(csi2->dphy_clk);
 	clk_disable_unprepare(csi2->pllref_clk);
-	mutex_destroy(&csi2->lock);
 	media_entity_cleanup(&sd->entity);
 }
 

-- 
2.34.1


