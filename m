Return-Path: <linux-media+bounces-60705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAFQCKIR/GkjLAAAu9opvQ
	(envelope-from <linux-media+bounces-60705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:14:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBC4E2D03
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFB4F3009F13
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 04:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D5031F98D;
	Thu,  7 May 2026 04:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="PAD9j0ng"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C0C31AF3B;
	Thu,  7 May 2026 04:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778127258; cv=fail; b=m6sEZTHU2MbxHqOE29tgcOifguJT0He7OJXWRgiRPoBFgQGyLqIlbyH+91MNpc79DV0AXhnw+MJpMtKDpAaVYCs5uHvJxEI53DAnF//J3SuNdVBDKxjvcJkz7GG00MAglVC7lMBE82xAfKgGECuI4lOc55RBQ54+IXSY03w4BRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778127258; c=relaxed/simple;
	bh=cuYwx916blXHCN34Cyhk3HyLwcUb40xcXLtujwQ8hhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t14AfrIGt/kW0CJH6VRDTvgQc4466HV5SSvM24NU5JW720WmXHF3Ce8PvaMsBW0BGu4viedmUm/aVNKEP+X4GJeKeZiMa1Mv4kyD/P1w6rbcMD+alNA0oE49k0HJh8ndmDs7ebedc5cYy1mt8dKZf+N3JT+NwqdNtrXvne2cWiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=PAD9j0ng; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473aVj53638607;
	Wed, 6 May 2026 21:13:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tUNdMa6QUSZMrWdZuwM7/fOdUiEUiV184V/ZaaKnZWk=; b=
	PAD9j0ng6bghraWm+zE2duGWX6nCAvqkwBv+wknK5BcOIIagIruLwta8Diy3aE3u
	GdwM/7yTZQjIHG1fUElXOiCKGIguF/ScQWj+BescqkTLYJBJaObXRNdoDK1s6u44
	+xdosP39F62pKe1pRNm70UM6uV9kJHhLNR8OFcVas2Xqsl0qZHt7K4al4Ke73uBp
	YEzGq3qKMKcsRYnhVr7vveK+drML7ISNQPubCC3jNiz1tuyoQDto2QEtAUb6XQ1M
	aYnfLPAApEg4GELwCKQbJmbIGx8RTvpkzohA/jtDw/TAe7G8iYTvE3OHRWa4T0VE
	mhcvs10iZZ9/SksVahezrg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsddpst-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 21:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Devm0y14GIva7KKnaolqRNCEILopKYWwYz0JwHVOCBgE39/uuI5TL4xlPigDlRhckkZYEWyDj70u6Zm11wk469FSqmW8zsAn+tcjt9lG7G+h7GwiN2vhrOzQH9ZY0VCf7uAAoeglvezHlfikTxt0DrSz3mtohRlp2F/uJt/QqrF7cZmyK3HmTG752iXjjPzqt8+GmaToxqAGyCJSmq+R03J35Z0pZ2hbh7fAItWK4InPb9SgjdiekL9MtddtRFJzy/V9Bfq/ANruXCACd9azRFYybo5jHcIq8u07oMVTgBSNqDpkNXjGFcQyp0ggaB7G7t6I2hRou6qjsxTrLMUlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUNdMa6QUSZMrWdZuwM7/fOdUiEUiV184V/ZaaKnZWk=;
 b=nrgXQhKXYoVztNuTokszLIOzzxhFOo1+8sdB6az8k2xJ3NmbfcfErNxXJl+dQSNw1TyftiU73/RTdRQUWPRbdUdfYffo4q2O9LSuY8nHDONhlqITTtp5mmUr5pE7g30++GtnSqf58vEFBFzMoEXGhvYMbru/rr+SzNyk4U0dw/AJ89d/P9N1IonDPmtfQYG1J2XF+GrWFdNiFl6LkMA6Z6AeNfWbNzFgsVGrgii0Kqd7FZOiR2CJEKJ8epBVo9DEeoURU4QVv/s9l7wBz7QV60urI6okUvgC0Ku31dgHN/I023f0WeeljtPXcooiUmeOsnjw/xNW58wMjwSwXx3EVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 04:13:46 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9891.015; Thu, 7 May 2026
 04:13:46 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v3 1/4] media: imx8-isi: fix use-after-free on remove
Date: Thu,  7 May 2026 12:13:15 +0800
Message-ID: <20260507041318.491594-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507041318.491594-1-xiaolei.wang@windriver.com>
References: <20260507041318.491594-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0026.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::10) To SN7PR11MB7017.namprd11.prod.outlook.com
 (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 4361b1af-965c-4d57-bf79-08deabef088d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|56012099003|38350700014|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wwS/ONKxMV601N/WirZ+Od2J1MLYpNPS9gWVA+VTA6M3DBBVifvNWqiOTR8RO8+SZBeznIs9P+GJAIaYOYYNNfQlUDSHw5NeI+N/I7jennu3x2/QTMDtAicNRulDWYn7FK6YN1b0lVlY4x6VxR7Fi/RzH6KttxamK1vtjmjrRXPInDfMTbuVoAYraz9RdWzPNnI6i1B4lREYmWILgEL+BAOpv8CuAgHWpdMiZtH5hUnbS+Fb06bnP0Rec0duQOO6FM1vi0oH1tP6RxqcBw+aM1r5OEnd2qG/Fj4Tal1x5/FLn1szkcHL6LPHxnpRoUg8RMKZSJL4pL61uLWnxAVte7sYSEPLRtzO2ggHVo7NlPjLay5iyfGUeOWzRKENAHNVqjaLeSLP6r9186m157vh0XWsM+m1ey531JdV61HZ8eHXSbnZQh0VYgaItiVEmZExpW7xgnGVLTCfDiiQZ2dv75C9zPhD5qA1uAnmukGrJT0eDm95VT37YHHp6nNwtiS+ypqmbDOBZUshTCASZbPr6qRqbSv+XY8i2Vfka3AAle2A53DyKiPYWwobGu35MYuo3LUFbZpxsxELB1AyHj1iWjF2NoLG4p1cMajFJU0YP8HXGYsMrJA9cM88riIweQhSFmenji1weyijI1EEy2MGa/QoLixowf0tjQCu6otJGX64DIWJ6ARbT2RuawQJZJyOmGCWKeiGzwjAy8zZExI0TdjNvt5hOLckOoe2HXGUPCykVK0tJKdF5igtkFVKzIdbXGZIyt24omr6UwdyvThsBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(56012099003)(38350700014)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t1ND49axxz7iDbAah0rkj1MRcsmvPNo+QXD2GMtqqpJ7/wwRqWCvAUT8mu13?=
 =?us-ascii?Q?dLoMSgZSs9bUlM/SxgF4L0AA22US+Qo1jPHJbe65IeXzQvwS7hujC4BAp+g2?=
 =?us-ascii?Q?j3hWsfrhGcizuaebzewNKPNpkR6oqvzXYabm1tMrFTRK0cbabDRCJm1D99BS?=
 =?us-ascii?Q?oKLf0Sd/CgfEs2fqQ1B0CEmpNpGzL9nenT4NhgaRpArbx4p3GY6FF6XXIHJK?=
 =?us-ascii?Q?JW1w0Uuz/8JC8JZZvMEPNPnzLNdotKo3QpbnpcJ44GUO3gtAspAGMms59rkB?=
 =?us-ascii?Q?etGLsCJuTO9cFwr7X9t0s6iyJcJME6NcHUtPQGvDUE6vzb8EyeYqf23xItsS?=
 =?us-ascii?Q?r0BcmYkh3JDmQBUiWjdAOtVzdOS5w0evGrvlLKbJ7ioRHrG8MgTsUVHIqgo6?=
 =?us-ascii?Q?U5cTOAiYttXQTajWYFHX3kdAyu5ScKg8LpsocFgrX5CE+IocJaEcMpXtwPdJ?=
 =?us-ascii?Q?OD7iifdAq7X8PZ6BFs4ih1otgCDNUMKzlWUYlBRJGSz9aRAQ4P0EQzXGv5aS?=
 =?us-ascii?Q?Bukzftxo+8p5rmMAANjS1JNf8NniZ6PdDgvogche+rQgyslGR0xEGQAd1ISl?=
 =?us-ascii?Q?lTkhxoK9oKrnA/PHDCBQLMcwFBruJtvWqHVq5K6JJu1W4DGhVb3/46Pw8i7Y?=
 =?us-ascii?Q?WaufvG3SFqwdFPDRCMQjXCcPR94UX1zwRb5o4ShlTsWWQfsSK4xoQ19dTTX3?=
 =?us-ascii?Q?3kF5CC4zND7Cn02ZyYECRbKIIMA0m/AhNBSfWbejfeNTnfo6wLNfC0UMs2NM?=
 =?us-ascii?Q?lcCLa+NkslZkkI2IPGpxMN5Sh7Ha5kUH8SR5SAsHetDtZ+xrCy8rpwX6uq7Z?=
 =?us-ascii?Q?VFfhd3/QBVXtc9dyrWos6ikzy/OuNjs9lt2BVHjmk3MI6CbxoDhqRoi1ujt8?=
 =?us-ascii?Q?2QeYVEX76OFpp4O/6RdKWkNCEXuNxtdfp22Ry7upbPMhSfEw1PxuM0oWW0E0?=
 =?us-ascii?Q?5CDRb/Y8p/pLqhdS3vwdNzMvm2sw4Z2aQ/i6wmI7+a4QP5wRSNHJWdfjoLy+?=
 =?us-ascii?Q?EJvfNmH1RRpEVkJ9wLIH+Hb67RfF2fgYRYKxS33Ple/xDh+hElZg+B7aQnx7?=
 =?us-ascii?Q?+SpJmdi3CY9rPBIQt8+49R7z0jpLm8gPLafnV6Gph1xEvtWXSQ3xNYNeHVVs?=
 =?us-ascii?Q?103jdtkBA1dlt7TK+4gixRWxczAdTl1IKrnH1jHamDEska2o8vnjgZRMo5Te?=
 =?us-ascii?Q?LOMEESHlrWjO4E3oyrxd4ZBWupILcWY2HU+4m8484g/X/c2RvGYKCrMTlApp?=
 =?us-ascii?Q?xNDKtWKlh/5BHzl1pY6vDDttyHuMy64q1m/wYTpotT9j/gDrWxzD81HPhOYl?=
 =?us-ascii?Q?DA4sPzjv3+5OXFz5YpaY7vA+NC6M39m5Cw6V2TQcTm67TLpMVpeilsx9eb58?=
 =?us-ascii?Q?xG8MZTaxx72NXn2DQogXqqNJlD7LpwwY+zVWFOdTKJ9V0AQ2MOV6xhaimzoe?=
 =?us-ascii?Q?XxSHRF3lcDTlDNzGY/gHuKdnnK1/cXoVH5enMZtJsDfv5gc6K8GxPRKMWltC?=
 =?us-ascii?Q?JL+PT4eoHncbaHuhMHbp9v7YXcAPO3w1vFN+vOo2miMzIC9FyZW31WZcoxzy?=
 =?us-ascii?Q?yUZ+NhFlnzM14gForjko0ixuA1VyX+UoByEKmfM/FPA4hZc1PgnkkHYNsrn1?=
 =?us-ascii?Q?USKoV19n5ZQxFT+5BFdLaBb+HWtFSt//wzBr02XVROHbjLxq0D8ISWXX6IvP?=
 =?us-ascii?Q?HlP8U7m7r4Xs/7zrRyOscmJ1m4YMIYGq66tQ6YWPKOtFJKjc2lK7hHFC9rsm?=
 =?us-ascii?Q?SyhFv2I3nQSXhuEFscMSntcwegfRboU=3D?=
X-Exchange-RoutingPolicyChecked:
	Fb6HS3agmn+Kcu7SigfHDWXrRCJtwnnunKvP8otquGQ07+j21CCLq5TMl39iGuGPaR+9cx3wWxSrm3mJuOiNrcL9wGYJu0jB84eYAtSzkGBlsy4ptlwpCcNWrM1EuqoswHhA+cWb+BNirjgW5TBZs9zJ1EP+eKcMktJ6uEkgfOjs843FJqSWcqqIaYM93elYukBNiFf7nXCXyXjswMb4PuglkVNiA08D3WWNpr9BHF4zrymcczyuO2zu7NM/OhMqCpgDbo1vbY6wC94V30v8cNn+FKqu3FpRdVTw/yor+KlOBFhbPsYAyJ0PNdzSUpg0/crYSkqiXWrtqq5FeYsVjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4361b1af-965c-4d57-bf79-08deabef088d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 04:13:46.4620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRCc/YrJa4vh5/k1X+so8/eEfXvIk3jaM4+srZUQXomiLciCxVkEYahDACZFTlH94mrKrzGoxB1vDNFdBljAlwGayG4F+KExEDDQXlQOK5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
X-Proofpoint-GUID: YyfgIvKtFa6AzJ4DUG51LxY-ZQS8IZJV
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fc117c cx=c_pps
 a=DkeX3LL2/Oc4yJO52xFMkw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=8AirrxEcAAAA:8 a=P1BnusSwAAAA:8 a=UgOjM9SW4ZuDxLeMq3wA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ST-jHhOKWsTCqRlWije3:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: YyfgIvKtFa6AzJ4DUG51LxY-ZQS8IZJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzOCBTYWx0ZWRfXy2QBW+bDPkkM
 a3LkduMmB2oWJwTORyxQZpJEoxJd8NdDuRhFoRdmNw0Yy5gSYmkTyadKv9kjJAqDRInWe6kCfTl
 qTunPpknOGKD6lffog9nEKMWoVtZHe34PFeHEv1g8lnN9cVTvUS2l90dYp6OZlW3VtdU6oaHbBq
 TV7WtGhlWi/10RiCKXQZaa7mn9M4PLK0fgmP4OsL+n05X6/o2M/HvDdqWzfbQlfclTB1fURl0uu
 BQfp6+Ho4ur36WIfKl5L61DMdnb/K14DzRd4xfK2Xn3FEntqNyIbBs9WgfnRA/+ubNDx95Nojxl
 I30LiNUPwOVAtOYzjz2YnbLP7fheZg91r4btWzry3gv3IGZYwyFaPMOZcrPJsBTsCxqjM0nz7PN
 1SM5gKLfb4YFsjBaGOMAaTYpyT8owvnaDbFxmQtKcZcrjnUh8Q1r0ePM5clMXYZVA3jZ8faXhT7
 /KxnqBii80rv0MMwGYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070038
X-Rspamd-Queue-Id: 0AEBC4E2D03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	TAGGED_FROM(0.00)[bounces-60705-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

KASAN reports a slab-use-after-free in __media_entity_remove_link()
during rmmod of imx8_isi:

  BUG: KASAN: slab-use-after-free in __media_entity_remove_link+0x608/0x650
  Read of size 2 at addr ffff0000d47cb02a by task rmmod/724

  Call trace:
   __media_entity_remove_link+0x608/0x650
   __media_entity_remove_links+0x78/0x144
   __media_device_unregister_entity+0x150/0x280
   media_device_unregister_entity+0x48/0x68
   v4l2_device_unregister_subdev+0x158/0x300
   v4l2_async_unbind_subdev_one+0x22c/0x358
   v4l2_async_nf_unbind_all_subdevs+0xfc/0x1c0
   v4l2_async_nf_unregister+0x5c/0x14c
   mxc_isi_remove+0x124/0x2a0 [imx8_isi]

  Allocated by task 249:
   __kmalloc_noprof+0x27c/0x690
   mxc_isi_crossbar_init+0x22c/0x560 [imx8_isi]

  Freed by task 724:
   kfree+0x1e4/0x5b0
   mxc_isi_crossbar_cleanup+0x34/0x80 [imx8_isi]
   mxc_isi_remove+0x11c/0x2a0 [imx8_isi]

The problem is that mxc_isi_remove() calls mxc_isi_crossbar_cleanup()
before mxc_isi_v4l2_cleanup(). The crossbar cleanup frees the media
entity pads, but the subsequent v4l2 cleanup still tries to remove
media links that reference those pads.

Fix this by calling mxc_isi_v4l2_cleanup() before
mxc_isi_crossbar_cleanup() to ensure all media entities are properly
unregistered while the pads are still valid.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..2d639b789910 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -556,8 +556,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
 		mxc_isi_pipe_cleanup(pipe);
 	}
 
-	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
+	mxc_isi_crossbar_cleanup(&isi->crossbar);
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {
-- 
2.43.0


