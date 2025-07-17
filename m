Return-Path: <linux-media+bounces-38029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217EEB090D9
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 17:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC4897BBE9D
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 15:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40342F94B7;
	Thu, 17 Jul 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZuAjBQEU"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0492F9495;
	Thu, 17 Jul 2025 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752767125; cv=fail; b=HzQXhPvSjR8JP9xbdkSqN3RFR14334XLG6SusgiqGaqUwfM1U3S7LX00Sxuptm2B6jBffndcsb9cnXmtqxITQZBkozOjqddZRCexnsh8SOv+vVIqARXu0mkgkCX+XVLJhGki/cmbjfXqf6jTuuspdSIC1kRsoaULkbW9ArSsgeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752767125; c=relaxed/simple;
	bh=4JpWfQWMpHmLra/3wUwWP9JgziTepEd+UWllIsWiCnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZeK7MqIjrccVpRIlHK9bbSUNnwSavtnhumMTewb4j9PRykE1wNbD7UkLS2SglK3GM3eMOL9sZ9NZisFH6AuEDltmQUcyX6JdL4u+j6kbTQDmD6Bpxpr7ZAaNNA8x3nVg1QdNKZySS6VZLQ/fQxZnvhq4oLdVc0BNRv5kEy6z6yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZuAjBQEU; arc=fail smtp.client-ip=52.101.65.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hv0M8zorki5HYWr/ObNd1RN4ltV147ifB8/dfUJubEGs3eYxrkykSt/+bF4MF9Id8YOfOzITOObKmA+K/jbwssFlvyjCj8BVfdGjo4FVZeH98VdtgfDlcAt7iQb2Lap0GDyS2voAVA6vzyh2/JMXBnY7x2CVppzTQFrGjOTOI7Na6QweEUKq4V+vXWFLJ/TowhOsKdPcQILNYcEe09u0lKy0MevPP3Ppu6owVnuFj7j6gcCQ4ppVVq+hU6wRo3FBbaWyX+wY+94yL8Wx5i+dXe6SUSA0mP7J4ZTuHUmAweXWqC4RFMAeTvyrJvMYUY9/sDXmgUixCDf8rUCUN2BcBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01t/Q5EEAf+mYeSSRj7Eddyqvq+tatmkK7o/fY+CgT8=;
 b=hDfUeQIYIZjL9mUFkVVQZpIoyx5yh/a+/GM75sXtC23jQcDNGOFPGjjZAyabYzm7MGJCHHF5N95s2YC+clmC3wSKc/oeiKXEjnSiJnEpkJXWmTXTuO+E0nKRy3UtOBHJra59W9CRiz31U0DuhQZHct9knn6rhL/9pTsagqvpXE2Dv26lfAH1v7nKMbFyQHV7aGFHURhMuVKnBHR29r+R2/5sil3e2VEbcslrsl+IXODocGea2IB+Je/qtYiXQ1JKXInqS1CvWQIZRn7B1vK+hWqQip4df+GM8/qg2A5F727JmfOXxIsoiL4vDg8oZlXiOsRKf5D6S6kAGq1zqSsgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01t/Q5EEAf+mYeSSRj7Eddyqvq+tatmkK7o/fY+CgT8=;
 b=ZuAjBQEUJM2eenoDZgiPals3rW1tmGO7UZpaU2kTmc3K8mg7DBmgqhWhjGaDZIGWaX06cXovoXA0CSt3sF2gLnro4o0XKapmzccA/YZ+ubCQgFBETuolPNCvD66OZRY/i7wU0XmldSiNekOhfWUcyi628VE7a3L2bAoB9xm5itvGrYAEh598zbOhUZLoKf2WdhVgOByPJy2WetTIG5se+07gJGbxluQOLnDw+ZQSDdn8fTzgJsHUSUkDD0QwOzAYuOiMtrQjwYSDOQ6PttrCvrGMcDdRmnKT2bk6sEa4AlLq+5PIHy4pJigZxLQBUbkkmyHvkvGytgnx7nAtiO3VRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7809.eurprd04.prod.outlook.com (2603:10a6:20b:242::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 15:45:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 15:45:20 +0000
Date: Thu, 17 Jul 2025 11:45:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Add suspend/resume support for ISI
 mem2memy
Message-ID: <aHkai3+d25+PnuZT@lizhi-Precision-Tower-5810>
References: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>
X-ClientProxiedBy: AS4P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc61a1d-2b2e-403f-6efe-08ddc548ef2d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Z6Y5/tLeIr6RUkPRCUxytByqcewlxX2/pWiTjww/93c5RxarHfHuFUFqKQDO?=
 =?us-ascii?Q?Pv4ApiNBrtTLoXfDSaOaD7ctxvRvT7tYLbCJNjUsO4pN/YbbY0RO+APFcmck?=
 =?us-ascii?Q?UTOrjzob+nAgFm3bLihywaiXdCVevlUXT4uuHd/6ZPkWhTdVKGsIwmcvHoxu?=
 =?us-ascii?Q?BvmjfkDaaeDfmMaRRzi6NZs1fRU9NHOFGzdhrKZxToarRzq3vdq70oakXvHP?=
 =?us-ascii?Q?ei6uKZAMcWVcoIaHq66RDxTMX0Pq66lNu19HUZ5awHe/dpaH4VDXoGusZsxE?=
 =?us-ascii?Q?PnJVQwggweH7C6kF0IzgT7TaUZi2UWI46hcwfLDGudCqa0nQzFpf9ZMfmQCm?=
 =?us-ascii?Q?SSG5exv97oUxZqCzvBGtlXgmdn6ZVWR0X25nR+HrFnQr5FvRwx0I7EES/BwT?=
 =?us-ascii?Q?JZxADC2Oavcgv2oaDA19qrfJmkhXa2wiQaev2RbT/6iXeiN826Wk23Dgo8n1?=
 =?us-ascii?Q?BIKW7DkXmXe1yXRkF7uaBWbpmQ08G1XrNYONW3+mFB4efIexBGfAQfPe2sU7?=
 =?us-ascii?Q?LOctyXy2NkNm/ZZ14B+XhUJXcrYznqZbp8sRntuhNWyLyqb3SN4J7qpl2QjQ?=
 =?us-ascii?Q?8ORjKdoASDPR/ZvGqgr7Ya/0R+10Ub5vSVRealG9SstulKEYZwCDNY0SvonE?=
 =?us-ascii?Q?iyYHoloW5qr+7s8UISaSTLhqgLtO1Mc8igweARhcC9SjJaHml4T67tYvlvBh?=
 =?us-ascii?Q?EPrgV+bZuUUhzNiRjgLnsnbMfesmvhpTqrO3JgEyIbuBhsEfggmTR87QlLU5?=
 =?us-ascii?Q?XohZlmLiwfB0kKHGlBBh9wB7KUicBFE0xcpTbRknzWNJNBJFV4Hc6LH0xurZ?=
 =?us-ascii?Q?KMTT9X9fr69Y2wXCNkrJcR5oeDIWLkbcktY82x2dAVtimVsZBodT5FvYTuTL?=
 =?us-ascii?Q?RKCTkK6s5KcUW2uxL4y16kPjtCVgCA+waz+rZjAgp0JEJ2qGdrSV4QxsOK1b?=
 =?us-ascii?Q?S43/BUdX4M4Nb7MB1mcn1ZQPQgqQxYunV8zZzSKQWgfMyCr+LfefUKtTGXxs?=
 =?us-ascii?Q?v7Q36QQ//XX01lZYiLTyQZKUEAKNL3GiYye3mqFF8xPRBO/0OHuz1UR22Kw9?=
 =?us-ascii?Q?oPl7BSanUW0PXIcZb0dMvfxgFRKmz7vrQVfCds6uEza24mhF4utaunPpvmvD?=
 =?us-ascii?Q?OFofbl1WpsffkLRELwp0wtzDa3z7d3aicHIdBwI5hk8zFbMf353kEM8qwyaL?=
 =?us-ascii?Q?svGyDzbflYM+fZ/Qv3ja6TdfNqHuwf4WzEFmkUJlDbtVl2LAe+q95EvR43jH?=
 =?us-ascii?Q?3hOoaqpwVMicZ69VITKHxlSBaXkJQDrqR/6cMSULSNlY3ItXFW5O2BQnXkeH?=
 =?us-ascii?Q?N6m8CFzfCxJq71Fp/og7ZuLZpYUMAOHmulO1P8ju7A7HOYq769Ejp7cjvYB+?=
 =?us-ascii?Q?pTpMD7D0Puixcoa02zeXoeIzWMa5Ga6jYMQOft42NvGlFFr++9TxKOIXvZkp?=
 =?us-ascii?Q?oNZCOECejyvTrX3MjDjOnC18mV5qiV35Vx/5Kv5A0UO+vBV1UQB0ZA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?XYfK0GP3P+1KTdD17w8TmYzfR14U3voXydHOG8jBAFsvwFcI70y3obreI7vw?=
 =?us-ascii?Q?gLQHVqCefz3WIqd2SJzJAklRYlTGUsvoT2C7lraj1X/Itx42iYrhq8tw5XOI?=
 =?us-ascii?Q?5YnR/v2ru6h4i2NfzYpPyvBu5FQe3EbcI4OTrym5FWfhEl50Ahp6aORWqoc4?=
 =?us-ascii?Q?TykjuUllgGu0WClKtNh5HpzgvGSnSx7JOdHUGRlA56SdJ49ylNtqculd5iT3?=
 =?us-ascii?Q?aiqNmCiikacrRwnsNQn8nk+quTizTIDb2r9x78Dswuu8rg0/idkYOC/LBXcO?=
 =?us-ascii?Q?5A+edn4RXNJMsOWSTR1xz82oFctXcayP9zSJP6mAKm25WkeqbickCdZdiYw2?=
 =?us-ascii?Q?qzoYnAiFnZTdsYLdMeEWh7aTkxxkm6qlZbxyjzDeNHQ1StmMsDRHMRhYL+bc?=
 =?us-ascii?Q?+tGP2R+gw2eWz9VbliHdCKLQTqST0hSf/txlV+ZCjALolCERePG1vXscrAjc?=
 =?us-ascii?Q?rRasOVsMt4P7eoqPDjy4+tSC47joPX6LDgdrabgOCJbxCw3W5erwx3+MDAqP?=
 =?us-ascii?Q?9JfhRtSGpLwxwW745wRw1B9GZP8Lp0fTUApLekY7Y4MRbzhVr4qmD4YVUmsS?=
 =?us-ascii?Q?+GX9ii/AO6E/F2hY70SLdaXTQeskTz4Vp4X2i/KrXv6sPAzqumlVqdr6rqws?=
 =?us-ascii?Q?mNfhRqnX1P7heFZ76NwrHTRvaFx/JDdcALg8RvI/mfQ3kQn21xlVB6CSWszu?=
 =?us-ascii?Q?mma+hxvEEexleBDlRE8Me/XPgr17BMlwFw3gSK85SDTNlLAgKu2akpSJ1F7e?=
 =?us-ascii?Q?VedkpWFHQpQyNw2OgG+c4v0/+MGeopqkMaOPYZmm+sxUVqURbzFzfKguOb2O?=
 =?us-ascii?Q?lLnukVY96JhCNZRTM+YdLxBRWOU39L1WICG49T3lglC5btORyxFp8TDLuuPY?=
 =?us-ascii?Q?7ImcuiG8KHG9unUFSi41cyJSFKcRuZI8NP+5BvAfpVF2YGR/DUaJmdPxavFl?=
 =?us-ascii?Q?twjFdsqW3CYrrJ46y6rpfqsjzkNRFvcZriARCdubCfM/4copKJh7pdHQiUc6?=
 =?us-ascii?Q?7ViwBkQHkPPqUuVZCHyYMjeKaz6p0k6v9oCCeEIlP5Odn91l1CAS3h0wH3l7?=
 =?us-ascii?Q?5jkd2ztooMye6OtwxKZR5X5FwyPO2rCHaj26MgdHUVodkpNpsckU1KM6MO/Y?=
 =?us-ascii?Q?QGI8Sf6f8v63Ar7WCQKzZAxqdmbWljHk9UNV59Ph89gPcx6Tox0RzxeOGHAR?=
 =?us-ascii?Q?L0zTw5yizQwrMgKZdDSWvGAj1gKXoAzbsWSYVQ3P/bMGy8wRaz234jdpQjfk?=
 =?us-ascii?Q?hMheVhFhNQHvEVJ7fwEqr5lJfOHlAZYPfO3BFssKbfSNZVacctuxQKyp3IGJ?=
 =?us-ascii?Q?AXJ2riHOVj1X/i7pkXDXeEF4rCIiGeA2fvT6rF95qQm6HXrDfdelp46W0T06?=
 =?us-ascii?Q?4RZrY7Kl7r3qxG+tDe807qzMCM2Q1yLXWWE+UWshYyG20ia0dNaR3thpxl/j?=
 =?us-ascii?Q?IEorRs8LQtuYIHW5iHi/BhzVf0cVRVsEpd7zHsCSaH5859cZ3Mav7SOyGGMZ?=
 =?us-ascii?Q?TsG99enlZR7t4V4JSi2uTxysc03m9JEU+xCJ1NiFjMrLrssZsXg4YZoFUMN8?=
 =?us-ascii?Q?2fJU6a8QVNSDGvoHHzkNUb9FXsd8+HOJl6xx1F/p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc61a1d-2b2e-403f-6efe-08ddc548ef2d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 15:45:20.1370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gykmINVeZyWROqVCh0mIcXxru9svX5a3S7/Tcw52XCGHsdEd7pSJbH9tdRfGmzxlvDJIFlzwTjgsHKNc1R0mAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7809

On Thu, Jul 17, 2025 at 10:43:54AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Add suspend/resume support for ISI when work at memory to memory mode.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  8 ++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     | 11 +++++
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 48 +++++++++++++++++++
>  3 files changed, 67 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 981648a03113..6eef45302e6c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -372,6 +372,7 @@ static int mxc_isi_pm_suspend(struct device *dev)
>  		struct mxc_isi_pipe *pipe = &isi->pipes[i];
>
>  		mxc_isi_video_suspend(pipe);
> +		mxc_isi_m2m_suspend(pipe);
>  	}
>
>  	return pm_runtime_force_suspend(dev);
> @@ -401,6 +402,13 @@ static int mxc_isi_pm_resume(struct device *dev)
>  			 */
>  			err = ret;
>  		}
> +
> +		ret = mxc_isi_m2m_resume(pipe);
> +		if (ret) {
> +			dev_err(dev, "Failed to resume ISI%u (%d) for m2m\n", i,
> +				ret);
> +			err = ret;
> +		}
>  	}
>
>  	return err;
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 206995bedca4..b979b79b5525 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -343,6 +343,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
>  #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
>  int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
>  int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
> +void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe);
> +int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe);
>  #else
>  static inline int mxc_isi_m2m_register(struct mxc_isi_dev *isi,
>  				       struct v4l2_device *v4l2_dev)
> @@ -353,6 +355,15 @@ static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
>  {
>  	return 0;
>  }
> +
> +static inline void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
> +{
> +}
> +
> +static inline int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
> +{
> +	return 0;
> +}
>  #endif
>
>  int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 22e49d3a1287..fe9d85335b6c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -732,6 +732,54 @@ static const struct v4l2_file_operations mxc_isi_m2m_fops = {
>  	.mmap		= v4l2_m2m_fop_mmap,
>  };
>
> +/* -----------------------------------------------------------------------------
> + * Suspend & resume
> + */
> +
> +void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
> +	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
> +
> +	/*
> +	 * Check pipe for ISI memory to memory since only
> +	 * channel 0 support this feature.
> +	 */
> +	if (m2m->pipe != pipe || m2m->usage_count == 0)
> +		return;
> +
> +	v4l2_m2m_suspend(m2m->m2m_dev);
> +
> +	if (ctx->chained)
> +		mxc_isi_channel_unchain(pipe);
> +
> +	mxc_isi_channel_disable(pipe);
> +	mxc_isi_channel_put(pipe);
> +}
> +
> +int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
> +	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
> +
> +	/*
> +	 * Check pipe for ISI memory to memory since only
> +	 * channel 0 support this feature.
> +	 */
> +	if (m2m->pipe != pipe || m2m->usage_count == 0)
> +		return 0;
> +
> +	mxc_isi_channel_get(pipe);
> +
> +	if (ctx->chained)
> +		mxc_isi_channel_chain(pipe, false);
> +
> +	m2m->last_ctx = NULL;
> +	v4l2_m2m_resume(m2m->m2m_dev);
> +
> +	return 0;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Registration
>   */
> --
> 2.34.1
>

