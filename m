Return-Path: <linux-media+bounces-52984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKohJDqOlGn6FQIAu9opvQ
	(envelope-from <linux-media+bounces-52984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 16:50:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F97214DB2F
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 16:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60F7F3031016
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 15:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D2936CDE9;
	Tue, 17 Feb 2026 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PER5VHup"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DABC36923F;
	Tue, 17 Feb 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343407; cv=fail; b=HX2rwvcSUQAospABOYMxHGNexMIHX6ncwUqlarX7WiESQPuJ8bbZOqwsVrX84KXjOg5WdXZmtz8I9nAiBqzG41uMqa/H8CHJim6goeZM0cElkolcwdhWIbLGlTEfGBdqCxaZLa8DIFy4ZoqomN95MzYdfXRjFaVARzFpjl287Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343407; c=relaxed/simple;
	bh=2CWSN18JPLELq4PuX3xR1qZnlAARAk2fVI3H9XgsyA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ORjnxasvAiVOiyTeBGWWh/A+PkOCd8tsZ3dG8/0IC42ZeTHc6gmu391+Zem9oqo4Jgezwj2jRLfrkZJ7Avz4BX6zi4vPrF5ipLFkfubFJuiREydHVe1Tmm972rDp6R9F7eJI0+zLOlealxBUAI6KZgivABW7by7QTpVXMzZm0iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PER5VHup; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJluOOPCfg8tGdK1P72jje1VBcsGgnWZqpwPknqyXwp2CDOi58YbjEC0kL21d3lusSNksoRPz3IhVUaAr8fy/7a4Vi8SfS/TUOWKjbX9d6J6LC4P2JojVGyKOa84Fi9N5+55IehDBFnnYDIrNMH2XASTMmSrKE/Eq3XON6pBJCmycRCNxsbtyLBkHezdXtPnQummq/W9/YxgLYPtF8LgR4BNMBfLl35nDSl6rfxw+do2hdoAENmNOW0h0FGraVxm/PRYK9YmuCA+JRz35f0LXQQcECoEdfacQjLwQO9P7IePtpCJeVWnOMaE4+7JcWsO46jF54rB5Z8Pwez5+nRo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiU3oJW8oIdNaVovZkUR57UX/2Lk7PHTjNz3TWWAFGA=;
 b=gcVmOBQ+gm5KoO+ctXqKGkuRO9rItHkGryZ/Qm9iD5kKz0NMUwXFkDcgepjZIK1e/dMPwKQ/Sg7w7fujGmYZpRapYqLQ1kpsQBvARgdyztL8F3Ptp3wA5MIlwWMB3qJlWWHde/p0Xgafc3/zFcaBdx1ShzPFkYubENRzxPhai/HNsHI5sJ9UGRDREHkv1dZ+mzwuzphHTZno75l1fXvrg3/CcjnHaOya06k5i5BDF8yDV3Iwt/X91v7dT5KYst7x7tMphVSQ9T2FCs/7vRoSSHy9dK6wqWczmeR3WMxnPxnNaAHVjxSDV6Gcx3CckqNHmQ4uOZSngWlEj66rqfB6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiU3oJW8oIdNaVovZkUR57UX/2Lk7PHTjNz3TWWAFGA=;
 b=PER5VHupNLj3RqBBLTzUM7QDc0Mdy7wD1ivQIXcogAMlGlasUTMVKEsUiLMf/zGZK+jYUFgq7oTSjp40SpNezo1ydsRRsDeA8n9NxnJvd9L4KeZREo7v0y4drZfuC6FYIPnQ+1+rZOeXergnhCbRhpL2WP6W1qK6Ay/4HCG2VmF4zUURC1WP8DUMeL+H15ZxRruL3QyvCq/3id/V4Mv6INuC8n4DauuylXFUf2RTDT2PQbD4+2iGpUA27PT+EF4J4pJnbmMFCzj176WCsV1gcf+Loj5Li8sCelTlIlhAda0EKdDVeXbzeQQUG2qKAGfg9LZMTKvgMr4Hk5OEPYuVeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 15:50:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 15:50:00 +0000
Date: Tue, 17 Feb 2026 10:49:51 -0500
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
	stable@kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] media: synopsys: csi2rx: add missing kconfig
 dependencyy
Message-ID: <aZSOH6dwiIiW0qmy@lizhi-Precision-Tower-5810>
References: <20260216-snps-csi2rx-v1-0-747bc7408f87@collabora.com>
 <20260216-snps-csi2rx-v1-2-747bc7408f87@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216-snps-csi2rx-v1-2-747bc7408f87@collabora.com>
X-ClientProxiedBy: PH7P220CA0125.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8114be-befb-4366-e60a-08de6e3c34e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q1h4VViOqQGEP/bVIJDJKZI05HdV5oKZx4o2VMEW8qLS/zoYvqFfE/sGpqhP?=
 =?us-ascii?Q?X6N8R8CKpKANuuWUi68b/FEwLDXlxGbuhPmYFcrv+nTk0ITGiyiwDf0nZm62?=
 =?us-ascii?Q?VqnEHSvXqx5Ld2i2PhqAy1FshtEze7qfvQ6IsL7r4AqlBzYKofPFL44Vycng?=
 =?us-ascii?Q?P+VpFNczmc670T2a8OZUr1JkjZwJ2RAESBzLxiCKdp+TwaTLjRZZbMgIaLxC?=
 =?us-ascii?Q?UnMrxN/qQeB6xc2S4IjK8MwP+BN0021evfb0WMKFW2wnVsjgiHwTT8rY/YIc?=
 =?us-ascii?Q?M/SHKOsGWrNajo03hwg0xXDBYDHKbMcSFMvX+vXjUTnrn/9nzEIisKwY2fQl?=
 =?us-ascii?Q?IEui5u9OZUzFg2d6BFxUfjLxrXfwdDnQcCt8mxXSO6CGMqSHxQcMZwGLX1GX?=
 =?us-ascii?Q?jKFCGNUHxlvSMpXGwKg1Ic0iqR/rnBMK0FXxwTNaGsHLtm4C/oBxhZ1qVs0I?=
 =?us-ascii?Q?56kF1VzQmcQP6GTphQLPztpEZomfQStJxJjaPw5x1jXMFQUJQWJ85IL3zt1N?=
 =?us-ascii?Q?tL0OdIBADwi5kTIK8ae8rwOO8N7pE/qt3AnBnyeqsMUnFgEetxID/V5TpT+k?=
 =?us-ascii?Q?wgr0eMlpG6D0sPPSUSWGSjKBOUE3WwKoZwDJeWUCtT4wJ9/IbRLdbgJJqUhr?=
 =?us-ascii?Q?iZ0uh1ZHv3MaCJt4tanO2nz6jamFnkqKGfLGHDE6J0tO+nO/JP1Bax2bNppK?=
 =?us-ascii?Q?qQoUuzceNUNrIvZGxmNoFDCPgmXxBzDrGS+wuK0YaXeNFq7dGvWJEkPLP4yn?=
 =?us-ascii?Q?gK+Vw+LdZ5ONU13iJjrhBV5/HY4XZ6n+wjepOqxtopmpzvOARKcJnTReBrth?=
 =?us-ascii?Q?cgPDeQQ/NkYZg9ArvIBP4WLmryHKIiP0UKTzR4rCs28emlcabcELn2RBeNux?=
 =?us-ascii?Q?Dap5rzFJxg6m6OHnmDXvdIP8poLT4+SknyDxeci7GKttte5cMkx6k65qwVha?=
 =?us-ascii?Q?FiPburQqpNoWCHsSX2y+O2quOwF35E3fGddRWilJESAjt4tWV2d0mGPTnf0Y?=
 =?us-ascii?Q?8gzyD308EJxfpNo+MGvASsmtOTCnXMAGFF/ygafPXGycwHR9r0en/0vD73tH?=
 =?us-ascii?Q?1fbbCJE5xYWtXItJbbDrypg2dr5rdhIubh9lZPYcdoPGJAJiq/Ohhy5ga/ZH?=
 =?us-ascii?Q?vhPEsJwJxffKYfKMSTzSxhFihZGH8qJNO0ZsDvPLEl8RSxlTVByU7mSXt+Kc?=
 =?us-ascii?Q?qKouZfNlFCfjCrZSxxDr9kOlIBAQ3VN9ost0fMJC8R6sOkjQUbRx/sSOipZ+?=
 =?us-ascii?Q?MNoRT87C0Q4x5Vt+Wyj7w5Xqij8Y/67ONL/oP5EigymSUsM15EKG1HK27K7s?=
 =?us-ascii?Q?900aESYeWXuOBXcliE/dz0I5iYMfJ/POtXt+WYgkVmqnfvDkSiuKAkCcY5ew?=
 =?us-ascii?Q?f6bMdS9uGEvPZ9dKij9e+jIbNkl56+j7OFDrOy8IPBqvv8z7Sso0Fm429bAF?=
 =?us-ascii?Q?lM/gqubm11sKwrdsau4g3AY28ZY1w0d4YIeEFwct4GNrEWIgIcAvAMan1kmU?=
 =?us-ascii?Q?qYXPmD9n4ePzPNRjfNjprWrA94XP5kSDkSmY6lLKDiFNhHreIjCca63vBFjC?=
 =?us-ascii?Q?xgMcjWTs9LFy12X7G2WvEXdwwi5lgw8pn1sTV2SRNhKh3Z5qJxZWBu2CYlJV?=
 =?us-ascii?Q?v+WvBOBghLRv+QlDKbtHrIo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3QU7sT9vIxDjTfqpvckYHIJgNMaSZLB9iJO275B8nI2YhMP7DnXNiXJy9Kmx?=
 =?us-ascii?Q?7bYxl9B+BBZ9bSmshpfcjpUdlvMuFeqA3oY4tqqnGYyWKjbtZjU4xhR3tUlD?=
 =?us-ascii?Q?6nSl2B+FQSrTBAYfjQ61P1/AdcMV4wIcKuX+u6L+u8a7lIZVHfkfRVmpy9rz?=
 =?us-ascii?Q?/MjEzqGNlLjnoycmA/+P5b0QLKQu8p9f2BE23NVtQYtm/6zoN6IOOfJ2FLVW?=
 =?us-ascii?Q?PIeESzx3hGLfuZ27YCiglbRUL3yvVzqb2YreLv2m6qYBpChIA/LYKiVm4SbD?=
 =?us-ascii?Q?BZUJBaokXl++HC+fBx0rcAJ+Qbo8CtMt/q3alEkYVC7ijAPVmHG1e4E9GbNZ?=
 =?us-ascii?Q?K/VORqn2d6d/djoW2QWxj5ougUzYqWOX5k/6rSy4qu98qB3PhhIgVbCWaM6q?=
 =?us-ascii?Q?Sqok0spwKGfS4rxVHZFRAJ04s91iOwOG+MYT3Gent5QRDfH+HwAhpeptzoeU?=
 =?us-ascii?Q?y9DrBF3jLP28sHg1j1Bsd/SgP9EsNgiPWDLqodp6Gv09GuinhYLM3QWeLha+?=
 =?us-ascii?Q?iy6g740wSx4Sl4U3dq29pGpa9h0pdOC9+Ih+Wqv6RCB7rshz6mAj/Qmz8LmV?=
 =?us-ascii?Q?VYf9lT9H4/KSvqvuPyk6qkwJ1CKLCz2GzkujHLZXk7kWq1qTm7rB/rf14AaK?=
 =?us-ascii?Q?CsoXp3SNxixcxPsrdJOQ1K0skvTTp1fkirMUXHBIMjZz5JPVMj/QcY3zmJfF?=
 =?us-ascii?Q?21x8ZiRFPEccxMq4POzp5R1HKNggJPfUwIWJs+Dn2BP8VU+XbZvYmVxTIqZI?=
 =?us-ascii?Q?5Gu5/zIEYKWryuIz8nT6dXfp9Wl9iwToE2YcmWZB6kZwFAywSJSx+CsJ+AYS?=
 =?us-ascii?Q?FQCBSKzdXvucR7YVbeab9SDLZlfYJbQLAHh15gS4Dw+NMAYqKB/f+zkIGHvH?=
 =?us-ascii?Q?52WMyzzn6xUy16MOiwdpJNtFHwG/1u5jRNbJZ1mJzkq6I+DgKXeAfVf+8jRJ?=
 =?us-ascii?Q?W8C4GW4KFsS8bqTSSqZt97h5kmU9luSsNO5v5DCK+UtUbPrz9gcOs1uhMsJB?=
 =?us-ascii?Q?juVNo7KCaBRnVOJNWCdwsSjFPPRlXEuTHlqj6XIoIAUSSev+JrLw/A5BW1PV?=
 =?us-ascii?Q?ahkyTFFalO1377yatTvpdrl0S7YMVqFk2jgmZHf49ONfyYI3Uaqlv5/LMOyZ?=
 =?us-ascii?Q?bjL/FBkbr/kmoHSNf4JK5YN1vjDsxVtypguyzxDUMI6hSrqiikiDK136LOTP?=
 =?us-ascii?Q?LL5bfTmHSUS8D9wYgBjShpEwyvWH/+BsGgUjYr5F6UtI313GwAyr51bhrDuI?=
 =?us-ascii?Q?P1iUFFMD6Gvkj19tpEr8Mc69Iai4D8zdaagKMcntvnQKMqrOAS3wDmN+pJws?=
 =?us-ascii?Q?YcDxoZRRuT6saZy6ELpYTRkc5JPuP915fuMqCkS6qaswvwTI0vElEBfutpBO?=
 =?us-ascii?Q?+0v9nx12/RAJIPXLjXsYutM/j9StA46XtS/ehAff8OG1j6BKAZRDGOCpLTBk?=
 =?us-ascii?Q?233rkMq227NP3g8a9JzjWL4nrHeJLkFF2KV12kndXWM6TnHIuAwZQrld5imu?=
 =?us-ascii?Q?IUSI0szLif1H/DD2tnhZ2LxMevRggjhrEduIukcBkjaWa72onFJWo4NQz/8R?=
 =?us-ascii?Q?hQbnicthmIaAWBoJ8FM7UsMjVliO1DMO96tTTF+Ayw7qPuhT9ngEWa16mC/1?=
 =?us-ascii?Q?Z1zuKlr4Ep3SwKD0f6MMg+hbDauRc93YYWw7s1eIlpyAXtZSgm7MShO0JQTO?=
 =?us-ascii?Q?P4nJHsDpKWFwCbbAWCKFnUqVCOy/l5saBd1Da9JFqNyLWLne?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8114be-befb-4366-e60a-08de6e3c34e5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:50:00.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGx6AXn4p02fesNj9GR4uwpdxAmpwUQrDBbYspL/RPoTLXwPefCom5WAjLn41lDv9nV2U/zuEFLf1qgnQdbI/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52984-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,nxp.com:email,nxp.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 2F97214DB2F
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 01:28:48PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>
> Fix "ERROR: modpost: "phy_mipi_dphy_get_default_config_for_hsclk"
> [drivers/media/platform/synopsys/dw-mipi-csi2rx.ko] undefined!" by
> selecting GENERIC_PHY_MIPI_DPHY in the Kconfig entry.
>
> Fixes: 355a11004066 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
> Cc: stable@kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602130253.BZnVd4jh-lkp@intel.com/
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/synopsys/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> index e798ec00b189..bf2ac092fbb3 100644
> --- a/drivers/media/platform/synopsys/Kconfig
> +++ b/drivers/media/platform/synopsys/Kconfig
> @@ -7,6 +7,7 @@ config VIDEO_DW_MIPI_CSI2RX
>  	depends on VIDEO_DEV
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on PM && COMMON_CLK
> +	select GENERIC_PHY_MIPI_DPHY
>  	select MEDIA_CONTROLLER
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
>
> --
> 2.39.5
>
>

