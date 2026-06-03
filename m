Return-Path: <linux-media+bounces-63679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9FSsCvqgIGr15wAAu9opvQ
	(envelope-from <linux-media+bounces-63679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:47:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BC763B745
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:47:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=m2juDcPj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63679-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63679-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13DC33055839
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2903E4A33F8;
	Wed,  3 Jun 2026 21:42:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013028.outbound.protection.outlook.com [52.101.83.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40C312807;
	Wed,  3 Jun 2026 21:42:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522969; cv=fail; b=EKsL0b1R+XfPTxUXX44+hlBlSi1E4uSFGhKV4VwV/tBBt732hxvzY/1zmyR8/61IkrRtq4S7djMiuG83hvig8zVf+JtOJFGhX9ILzSCENAK+fibblLciQgoWhqZqu5pQZnABOxTRsD15d2ML6GdSrGn9Jgc3puBC0XC5zj9imeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522969; c=relaxed/simple;
	bh=djvUBPZJKMTKoqUDveLeQRfTCVJYWjuBSkQrmG+Mf9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CeEoIZXvQvNortrt7uwzezYcacOVNVWsISTzUUfOC/2fTP9Hhx3dEjPi79bq8BrNNaB5G4gI/Lg9EQyoFQdn96PdXRJZwELEbr3GcON8nb/OSPF1oKRxK6zEOgK2d6cv1UW7ivNIMRJ3+SyOGKkuvwNV01oqPr+5ml/We7e20zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m2juDcPj; arc=fail smtp.client-ip=52.101.83.28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/eRDSWrtRQhW0md40+SvKQjFBgUihzl1jhNiA3vCJt9pqXqhtp+CmjS5JOjJUB4D5UZ/LUkVLraT4Qpg40FM3MtlWokFyCBFmywvc0g4bzghp2kMxvlzAbkUCmEOanPW9rSbHIXiO+7rP7jey4Fo0SIPZgESGDqmAYfrd9jk+A4quqlgPpoqv9JQLOY7CyUhX+jgjrdaAt86lq+x2GKV8ahST6gVFbtuTGH5zZdMKwtl2/MhkYQhWiOfNCKLTNqPFVjAwWF8VyLxzdE05RYub8zySHkqq5qXMz5xnJjQx940wmcaXdg/G7qAGcfKNQqzXxeR4j5zxBv86+vzAk42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjWE6lVwB2uqUm+lW4h3CJHXHzBKhXR01s0k3qysJBU=;
 b=OtV/xuEZdOji7KVOZzLnIjuDiP8zLTiDtrf9w0Rm+eghYjCmkM/lbAaYRulBt87EDC18Ii6m399AVmvNCzMGpJxzvS2n7MLoCJRwYstr22tkRA6GvvnFKpWdxFIdBPem/LKgg+QdqmPXtua2dBuGLsw6mauNvDS4ctE27VLPIC0/CKjOai0WIGjSdlzYmbDSPHVrD0lRCpCdDxYKU3EL7zSV1Ho/gZC9FR5V4yFcQpgAHRf+wJOjQLjtI/Br3cRk0qo7LmwX9gWcLgfW1XsdWAlSF0tG7IW6VCGUyAwTQacZARAkPh3UPu6L/k0ZwsXTMfnRzFtkBHCBqr6j+KAiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjWE6lVwB2uqUm+lW4h3CJHXHzBKhXR01s0k3qysJBU=;
 b=m2juDcPjEE19zvyGvIkJt9WdXCoNPP/QT0F3kDitSQgJbE3calzTVEmsIG1Ic/LfBACKf5DiaVIvjinxz4HlhuVWwaPCmQqK6EOcONP9Zu7t2TAqOSIQEXxV1w+fBpZuB8Rfu86+yI/bgdICUTo5FLAAi0rt2mGfHS2/IdqXvAM+66FDroyd4qA/R3IetT1ziHk/doECDeRq/R0gmcVnQGKbf0lXHfW+Dmi/6yX29QHUzPZqZ9xFb5zuXXU4FluBF1fhbo/hbWFlwAM6nCbxiNaJa7pMBo1evyHXOgT04eYbkdr2NHu07JMHtmyWFlhzUaIAEsCqpg+WshhCYLbxcA==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8347.eurprd04.prod.outlook.com (2603:10a6:10:245::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 3 Jun 2026
 21:42:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 21:42:44 +0000
Date: Wed, 3 Jun 2026 17:42:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
Message-ID: <aiCfzBAbEg27S85_@lizhi-Precision-Tower-5810>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-2-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-qcom-cphy-v6-2-e50de0b557a8@ixit.cz>
X-ClientProxiedBy: PH3PEPF000040A9.namprd05.prod.outlook.com
 (2603:10b6:518:1::4b) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 236d8075-bb3e-4f9d-c7fc-08dec1b90bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|6133799003|18002099003|4143699003|56012099006|11063799006|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	YMRWQSQKS7PFfM0smpA4GnVOeFyipqXUpnorcreliqpM5zKvPYL1E9/1w0tVQTOeHM3AQi8DHk1B6rQIRf2fk5UjNvlQpuePN4ZapZNEr4dntli/ZbwZLvT+bBlwVoaWsQ/U3lb0Ee+mK2AMqf7wRUj8BgBZyOOgdemoL8jgk5PXTnpTR771DR1g5V7JORxZZyevUxCCMXIaWTkCGQbl9KWDSX3+zjPQJAdbu+tlWFFyNxRHYnOlARIhXVxYN/lduch4qfkZ5a1RPAELODRl6pu2uQEVDqod1L/fLTx/qlHF/lVCTmxmRd+s7C88f2mcwWbp6EAXtcntNeTG6yoB/WD3QwVKLo/DJP37c19LLS60Up0H+yFO5hhURyYLVv1SbZ800j8H0UCyPBE4LIDjqLIIXDo75WRbhLfK9OPmqUaDXDS/HRaUD+3yRwVTtq9rPjI8lzE4yM34CsNLpsnj0cu6KxO+P5r8pe2cPNplqkJI7hylqWzH8V8x5eRpZXuTQ02HXHcEj0Pja428e1U9TWPnfPVDbmPLKTz4G091TCC1T5rXjmgLZAoP1DWf03Zx7n5lXaYso10yCbQPTpjW+DAPrhDqJ6Mo/uizJX4Czd87y1Ruy0dT73h+FsKLn0i/7R0TuUs+4hlZU95CAzppth18Tno+T3zSigT3boSGxca7bhznErrdUozgsc6yLLqurYAM6qx8xZ4tDC4gmG+UOm+ByYK+gREa79lvB+4cC8llY9Uw6wuxkg8Cpku+CMQT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(6133799003)(18002099003)(4143699003)(56012099006)(11063799006)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WohRzO2nnFnv5lORd84x+gGUAzm0RjegsWsS6IrHQII2DoDyKf65RyysmiSD?=
 =?us-ascii?Q?tBeyURbOAncI3EFALKMbBjNTWSh63s+mwDj+cbcAOR5qZBe2aH0Lbc4FDoNF?=
 =?us-ascii?Q?Jgin/2MJgivOWQzrcFNKUPQTBeJ4XChpLQsX5DTyFPL2moHkpyrKedJcNqS5?=
 =?us-ascii?Q?NjbvCEYVTj33QSatgawRbr/8fPhPJbFP7W6Coh1H1IJEOvd/58rBrG87cS5E?=
 =?us-ascii?Q?/MZZ16uV42dOdbMtz/+1ToLjlgAuR5qI3jD3nnE3E5kUqg1ui2wt100+rMiL?=
 =?us-ascii?Q?locegmzNgT4hL/gFW2L6GmfNKhqOYKKcGRpBRZ+n1I/PHllPT3o3lgTI4leo?=
 =?us-ascii?Q?WDu7TE684vsCI57+2o593KzJcm8GOW8lrbpjgbSfVPXebcInOaeuWKsnStWT?=
 =?us-ascii?Q?28DXDv1h9YRCPJSrGuZvv2eTRw8B7EjIblWTfTrAI83a6QuhaMbL5bYUXkZM?=
 =?us-ascii?Q?H88aent5j4GAvfLfhviavWmyxCF+pDBUPDlDHcS3QisPuJVdWcrBx4H81pJV?=
 =?us-ascii?Q?WK+GD8OyfSNzRPmbioT9BHz6VxKffKNJ5GEJRgsW0HKG5uCLt6pa8G+OFsLF?=
 =?us-ascii?Q?T/E/YdxeQqSY8FIsuroFaFLnRmrC+aloGEApsXOMtad9oj3yMru69preVtQt?=
 =?us-ascii?Q?zgbmUSPHtVSwnM6RCuo2Q36sAH3DQU87C6Yd7RMAGjZPd5od+PULZJSVS5jm?=
 =?us-ascii?Q?u8bLfJL2F62nixy5u3LfUinO4P+du4xHkJrWVFCm961tFlovrkgownvifyaL?=
 =?us-ascii?Q?Tn4zAQmlRDrn+DprmQEGThJ0fGYM/0MOwgAU0AXMkjyH9sH5LEI9wktmUhuD?=
 =?us-ascii?Q?8OHDVdrNP0p/O+ZW73iwMJOGq3ZJoUAaboo57Pzke2Oj0UYDJFa5poWhuIMz?=
 =?us-ascii?Q?9mxcf3j+l66t8OPq0ZEqbibNP2v7qG12KWsYaY6RlCFlusGr3D8cTnOCxb7t?=
 =?us-ascii?Q?0VhTNlhAKYm3BMyOoicv/Uxz3jxordSXjWYqWi5otdrRQbxb8UaJV4I9sPda?=
 =?us-ascii?Q?bzUzxjws/VZ9+L1x38fC3UTWOFH/Q3XY08L7cMKKfZeq1ZOmfbPUMVuxd8vB?=
 =?us-ascii?Q?ZiXkEy8jeIYOvitKMR0Cfvh8V7ei3LWPjZl6FVLmwHOy+gfCDKGc5vkysnBm?=
 =?us-ascii?Q?ri7BRecI4mJq38HPDj+tMtmrzOW2wXt5hiKfULPtqtbjsJIduqSWujIV5Plq?=
 =?us-ascii?Q?V4FpOyxsXpHxIvccLoCK6z3ki6hZCIFaTMON5mClrRx60XPMkwhKxMHitrbf?=
 =?us-ascii?Q?yvZyMLh8Y+uyRTGnJSHA2ousdK7gxibSzFsrWbwHbOrWBEguKWnbLa2KA2p4?=
 =?us-ascii?Q?iJbA3ucv2tEDEK2vgnUM5h1AI+DJiyo4Ux+KhMMjzyB+IohcB/UkTnIOG1FN?=
 =?us-ascii?Q?1AmlIbKz4ni+4Ivg/AKIWSnuca71kFeArc8cHZqAb+S2GeYvfcv6gg5Qhe4k?=
 =?us-ascii?Q?XjS/V9oJPDBY93dqX1TcYNPs7yrtJkVMQ4ImaofbqtaDxu5YdyDYt7AgvvRX?=
 =?us-ascii?Q?7uy04g6+XZUX2xFh+jF1SohywZdiu/dMvBMGYU2UW+dZCvzhYejIPMcw0/rW?=
 =?us-ascii?Q?4cUwZqmkeILd6iUrCuOAg/Neejy6/pQwCqDRmlaBt334RDQAWge9mI5EvS/H?=
 =?us-ascii?Q?bC5nrLMB2gVI/RyZOIiGHxlM1OFOuw7SUkHzBLxLyeYWZiTq9NmA/1uHfa+m?=
 =?us-ascii?Q?92M3xUuC1t+X7qiYDM0iQVET6WmR9uEcyA3aC2xnrsw6u/Cu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236d8075-bb3e-4f9d-c7fc-08dec1b90bd9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:42:44.6363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaQ3md/OyyYU0WdvUHI+nEiH0IWvSE1rL5k1dIv6H2iRke/BChSqwf4k6DheIXuSz6XonphbAt5twK+ynS/EGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8347
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63679-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:from_mime,nxp.com:dkim,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lizhi-Precision-Tower-5810:mid,vger.kernel.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83BC763B745

On Wed, Jun 03, 2026 at 01:30:40AM +0200, David Heidelberg wrote:
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
>
> Since there can be unrecognized configuration allow returning failure.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

Suppose two Bryan is the same person?

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 39 +++++++++++++++++-----
>  1 file changed, 31 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..15876eb973718 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -9,16 +9,17 @@
>   */
>
>  #include "camss.h"
>  #include "camss-csiphy.h"
>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>
>  #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
>  #define CSIPHY_3PH_LNn_CFG2(n)			(0x004 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT	BIT(3)
>  #define CSIPHY_3PH_LNn_CFG3(n)			(0x008 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4(n)			(0x00c + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS	0xa4
> @@ -1108,23 +1109,32 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>  		writel_relaxed(val, csiphy->base + r->reg_addr);
>  		if (r->delay_us)
>  			udelay(r->delay_us);
>  	}
>  }
>
>  static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>  {
> -	u8 lane_mask;
> -	int i;
> +	u8 lane_mask = 0;
>
> -	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= BIT(lane_cfg->data[i].pos + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= BIT(lane_cfg->data[i].pos);

suggest small tuning to move common logic out of switch

switch (lane_cfg->phy_cfg) {
case V4L2_MBUS_CSI2_CPHY:
	off = 1;
	lane_mask = 0;
case V4L2_MBUS_CSI2_DPHY:
	off = 0;
	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
}

for (int i = 0; i < lane_cfg->num_data; i++)
	lane_mask |= BIT(lane_cfg->data[i].pos+ off);

the same as below block

Frank
> +		break;
> +	default:
> +		break;
> +	}
>
>  	return lane_mask;
>  }
>
>  static bool csiphy_is_gen2(u32 version)
>  {
>  	bool ret = false;
>
> @@ -1155,19 +1165,32 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  	u8 settle_cnt;
>  	u8 val;
>  	int i;
>
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		WARN_ONCE(1, "Unsupported bus type %d!\n", c->phy_cfg);
> +	}
>
>  	writel_relaxed(val, csiphy->base +
>  		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>
>  	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>  	writel_relaxed(val, csiphy->base +
>  		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>
>
> --
> 2.53.0
>

