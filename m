Return-Path: <linux-media+bounces-62217-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EHXIO9sDWrgxAUAu9opvQ
	(envelope-from <linux-media+bounces-62217-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:12:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA35D589789
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A996830F8F46
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02717376465;
	Wed, 20 May 2026 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WwuujswO"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865C22425B;
	Wed, 20 May 2026 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264341; cv=fail; b=HaqNK0NPb0ZDI8aFaQn7nH4BFNfDWt1Oc/WGNQoKqCXrBMg+Y3dOJn67n/MAAqNWXq1jaGAob9GbPejHbij5CsIvubKXygf2Yl6BnvKZBf4+Eje3QUF0ft6cS76NQ7u55PhY/4ec1Zya2fcchklkb6Vwab45asuxbKfqO7MGpek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264341; c=relaxed/simple;
	bh=SijWe56oA3wNI80HVkc3nDGYqMr0FlOutnESmP1VGBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LT/6PYwVkxMlbEOQlsE9zlTTHEIpqStEHkBpPnSejp1tRkGF3EKpgQyWBhiXDcobHB2JP25O4R2Sd9WAi6ywS1+cSNtfySoqvuWeqbGsW91QnPDuCUY/Ol5OEi6dTVKGhY/QtNA7vnlZjRwEDM7en032W5tFUaOvXYm4YOiShH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WwuujswO; arc=fail smtp.client-ip=52.101.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9g4ltW6GecI7wTnpFCn8v79byzfG0Fl5pUE7J/96K4MGpA3TjRls3KrSg25/zRmZvl/5W842SmQ/6wih56fy8ivsx6j+mewZ38x5cpQQmxFHfiqaqze+NCRSpm1589pSBVYvI5p6PvNbd/g8xNWGWbT6pDDAiJ7JBmyUxGeACqXnrRwj6V0ygFTZkbZqtRGSOzG1hHbhUnKFtO2LKFCKOWFh3/TVrwZZ6iSE76D/QQE5l1ix1y+QsykDiwVJ5QCkk4Dyc7o2e/HX9aPupe8Gy0+ytlNPiTVf+DCsz5hfsj/e9OZxoRPO10Or9YrzxUQkJvwlEqCrTjsRj4D+iW/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mkqAyBPrj4Z/KLO2qKqbOPXxTmOrxZtTTwt5AsX518=;
 b=qdarI+QUhjxd4TZ7AdFuIaKuMnvOoyWER9+CP8o+5pXAIYsgZ9ZNRhZkbE7IhdsQbz+LL15TVR/Sc3PBY3NGcehfPbgCdOnxUxUIboh33ub8lKjBsue6k59Rg2aoQzoU7adoU0A/HW29Hf/Q4RR50xUrVDx0KOuBDx9qvmnMt2dmQWx8KQbeo4iX8k346a/wJJhB9YpmlTvp6XR4HcFRF1cMULR8IyAjjVcgOs89cPCVOb9Vfp0D/Cw9tYFo1fhK6QRYcy91X7BOg+bY4hSKCUqXPD9PSjPzFJzwBK+QvWVyUoT3IbGcarBmD5GFfCvIWxm/Mm4svrxos8SOwfEJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mkqAyBPrj4Z/KLO2qKqbOPXxTmOrxZtTTwt5AsX518=;
 b=WwuujswOwYEq78SwfR5bkQ337MH7OvWR2OW3eQ7SY5NSBIoFnJCbfmcfDcryjgEaPCKm6OPUrXYD28Shx7Fsx/8kSQ9Yd7IRqycjm8GBzyPOzLAl9IdYwQVMtraoC+ahNMhXqBHo9KHT7Mndi1wDX4sAE9vJSd9XYBCpojczz/c=
Received: from PH7PR10CA0011.namprd10.prod.outlook.com (2603:10b6:510:23d::12)
 by MW4PR10MB6653.namprd10.prod.outlook.com (2603:10b6:303:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 08:05:31 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::4a) by PH7PR10CA0011.outlook.office365.com
 (2603:10b6:510:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 08:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Wed, 20 May 2026 08:05:28 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 03:04:56 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 03:04:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 03:04:56 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64K84nIm1560973;
	Wed, 20 May 2026 03:04:50 -0500
Message-ID: <f0fe6742-77e8-4a4f-b206-42f28a3560c9@ti.com>
Date: Wed, 20 May 2026 13:34:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 15/17] media: cadence: csi2rx: Support runtime PM
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-16-r-donadkar@ti.com>
 <agxXs3irq0pZkg5O@kekkonen.localdomain>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <agxXs3irq0pZkg5O@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|MW4PR10MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: fffb3430-f6da-42a8-7640-08deb6468e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|56012099003|4143699003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NbvE4wSBdG53dLrRlNgemZ81lDn8TUMQ/EDgvoFfArTpc1U57/G1rOuaIBO8MT407thDa6RLIqAQWpqtxlSbfKZjujq247CmJomqDzI0J4dHg9FncSqrgZYDkkGWpX9kX4TRxSGxN35k4SpdV2pkOK39QjgWYRaMrszZ7mi6EHSOWWLtkEzZvbZeh78sQa7CaSAbDeIZ399uy8c8ZWuLAxlFdijCgOoIAo+k+SsXnIDIn7NQ1hHZwNk5Mf8wyZnt8V2/++0f7sLOIRzRAmbETK4AaYFaQpO/u1/3maNozi881uPJCty8Ps3voqS0z9HdBFnG6vHkc8+iId63Ykprd1jn2Bdg02y2KsKk5vnWGaC0q6qlXQFgum+lMbwhBbswSCgx1gO/VTlYF4KDl2J3r4JL2E0+VX77VZ+HVzRSkD3iCA4nWXQGm/68pLW+qT/JfXXKxJghTIQvRS9AglChpNXi95eGJBYjp7+IdGYU/bYEbBJBDQ97ACYYXjpQ/KFjwZukO44+7/KwuKkfgKC8/6Hi2r5Lo8gnkz1RtJWjAZiwOI1S33loNLx0Noxvnlafbk909mRJ/yOXCS2OgjRyOG3SDKtCZFcTPBC4Tt+PAFrl3OlUThn9lFsaNoFIO1KV4JJZxZLeZIL7d6Difgck+OWBw9ocyxqoZvB+3FIDI3GcKZoQFUDU4Ok0tZo8eyrQRC/ngqUqVRvC4/yK+9e12rlBtw9olGfA4/ffYw+6s/A=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(56012099003)(4143699003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gZYHpEAQBie6vPFyuenZnBwh7aDKagoRM/g+qBhtRcq82DRkhsclPsDjSlEOxNVO49H+r7zWIU4a5I95xmAhkuwm/TYyV3GkNTzOZ8JL6qGjfaa4bfSv8JbygwmpaZznV/2pZ9bHrqWHoo0g2X0/AoTJvZ/n6rn1nfSXMW9i3sBWQlb0FCnbg2QiHpHmxBk8+jfGzz2uXNqt4nvzQeDlGfQ9E32JqbSh//ArDlMusTcrP/n8MSevSWKBwLvpB5vroc9KUaXtALPqLnI+zLsjxwS1Vk0ojMW6jc1v0IprHJ2/llKYN0kGF8OQPXYBXuFsRQE49RSlblHE+bKHdgxpM8LGYqridWFkrWvN3BNELRuIxu3wdsP2fmUzjABeuZaLWXZnll4B6YhE/Zq94Q4tYeBALdFLJLZsQerblQkynv55qvLXbPLcdEsna2WwhruT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:05:28.5762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fffb3430-f6da-42a8-7640-08deb6468e68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6653
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62217-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DA35D589789
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 19/05/26 17:59, Sakari Ailus wrote:
> Hi Rishikes,

Hi Sakari,

Thank you for the review !

>
> On Fri, Mar 13, 2026 at 02:36:59PM +0530, Rishikesh Donadkar wrote:
>> From: Changhuang Liang <changhuang.liang@starfivetech.com>
>>
>> Use runtime power management hooks to save power when CSI-RX is not in
>> use. Also, shift to goto based error handling in
>> csi2rx_enable_streams() function
>>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/Kconfig       |   1 +
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 136 ++++++++++++-------
>>   2 files changed, 88 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
>> index 1aa608c00dbce..ea85ef82760e6 100644
>> --- a/drivers/media/platform/cadence/Kconfig
>> +++ b/drivers/media/platform/cadence/Kconfig
>> @@ -5,6 +5,7 @@ comment "Cadence media platform drivers"
>>   config VIDEO_CADENCE_CSI2RX
>>   	tristate "Cadence MIPI-CSI2 RX Controller"
>>   	depends on VIDEO_DEV
>> +	depends on PM
>>   	select MEDIA_CONTROLLER
>>   	select VIDEO_V4L2_SUBDEV_API
>>   	select V4L2_FWNODE
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index f34df341a2cac..18737d00a7d7a 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -340,11 +340,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   	u32 reg;
>>   	int ret;
>>   
>> -	ret = clk_prepare_enable(csi2rx->p_clk);
>> -	if (ret)
>> -		return ret;
>> -
>> -	reset_control_deassert(csi2rx->p_rst);
>>   	csi2rx_reset(csi2rx);
>>   
>>   	if (csi2rx->error_irq >= 0)
>> @@ -385,7 +380,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   		if (ret) {
>>   			dev_err(csi2rx->dev,
>>   				"Failed to configure external DPHY: %d\n", ret);
>> -			goto err_disable_pclk;
>> +			return ret;
>>   		}
>>   	}
>>   
>> @@ -400,12 +395,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   	 * hence the reference counting.
>>   	 */
>>   	for (i = 0; i < csi2rx->max_streams; i++) {
>> -		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
>> -		if (ret)
>> -			goto err_disable_pixclk;
>> -
>> -		reset_control_deassert(csi2rx->pixel_rst[i]);
>> -
>>   		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
>>   			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
>>   					  csi2rx->num_pixels[i]),
>> @@ -418,30 +407,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
>>   	}
>>   
>> -	ret = clk_prepare_enable(csi2rx->sys_clk);
>> -	if (ret)
>> -		goto err_disable_pixclk;
>> -
>> -	reset_control_deassert(csi2rx->sys_rst);
>> -
>> -	clk_disable_unprepare(csi2rx->p_clk);
>>   
>>   	return 0;
>> -
>> -err_disable_pixclk:
>> -	for (; i > 0; i--) {
>> -		reset_control_assert(csi2rx->pixel_rst[i - 1]);
>> -		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
>> -	}
>> -
>> -	if (csi2rx->dphy) {
>> -		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>> -		phy_power_off(csi2rx->dphy);
>> -	}
>> -err_disable_pclk:
>> -	clk_disable_unprepare(csi2rx->p_clk);
>> -
>> -	return ret;
>>   }
>>   
>>   static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>> @@ -450,10 +417,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>>   	u32 val;
>>   	int ret;
>>   
>> -	clk_prepare_enable(csi2rx->p_clk);
>> -	reset_control_assert(csi2rx->sys_rst);
>> -	clk_disable_unprepare(csi2rx->sys_clk);
>> -
>>   	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
>>   
>>   	for (i = 0; i < csi2rx->max_streams; i++) {
>> @@ -468,14 +431,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>>   		if (ret)
>>   			dev_warn(csi2rx->dev,
>>   				 "Failed to stop streaming on pad%u\n", i);
>> -
>> -		reset_control_assert(csi2rx->pixel_rst[i]);
>> -		clk_disable_unprepare(csi2rx->pixel_clk[i]);
>>   	}
>>   
>> -	reset_control_assert(csi2rx->p_rst);
>> -	clk_disable_unprepare(csi2rx->p_clk);
>> -
>>   	if (csi2rx->dphy) {
>>   		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>>   
>> @@ -549,10 +506,15 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>>   	 * enable the whole controller.
>>   	 */
>>   	if (!csi2rx->count) {
>> +		ret = pm_runtime_resume_and_get(csi2rx->dev);
>> +		if (ret < 0)
>> +			goto err;
>> +
>>   		csi2rx_update_vc_select(csi2rx, state);
>> +
>>   		ret = csi2rx_start(csi2rx);
>>   		if (ret)
>> -			return ret;
>> +			goto err_put_pm;
>>   	}
>>   
>>   	/* Start streaming on the source */
>> @@ -562,13 +524,20 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>>   		dev_err(csi2rx->dev,
>>   			"Failed to start streams %#llx on subdev\n",
>>   			sink_streams);
>> -		if (!csi2rx->count)
>> -			csi2rx_stop(csi2rx);
>> -		return ret;
>> +		goto err_stop_csi;
>>   	}
>>   
>>   	csi2rx->count++;
>>   	return 0;
>> +
>> +err_stop_csi:
>> +	if (!csi2rx->count)
>> +		csi2rx_stop(csi2rx);
>> +err_put_pm:
>> +	if (!csi2rx->count)
>> +		pm_runtime_put(csi2rx->dev);
>> +err:
>> +	return ret;
>>   }
>>   
>>   static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>> @@ -590,8 +559,10 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>>   	csi2rx->count--;
>>   
>>   	/* Let the last user turn off the lights. */
>> -	if (!csi2rx->count)
>> +	if (!csi2rx->count) {
>>   		csi2rx_stop(csi2rx);
>> +		pm_runtime_put(csi2rx->dev);
>> +	}
>>   
>>   	return 0;
>>   }
>> @@ -1078,6 +1049,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_cleanup;
>>   
>> +	pm_runtime_enable(csi2rx->dev);
>>   	ret = v4l2_async_register_subdev(&csi2rx->subdev);
>>   	if (ret < 0)
>>   		goto err_free_state;
>> @@ -1092,6 +1064,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   
>>   err_free_state:
>>   	v4l2_subdev_cleanup(&csi2rx->subdev);
>> +	pm_runtime_disable(csi2rx->dev);
>>   err_cleanup:
>>   	v4l2_async_nf_unregister(&csi2rx->notifier);
>>   	v4l2_async_nf_cleanup(&csi2rx->notifier);
>> @@ -1110,9 +1083,73 @@ static void csi2rx_remove(struct platform_device *pdev)
>>   	v4l2_async_unregister_subdev(&csi2rx->subdev);
>>   	v4l2_subdev_cleanup(&csi2rx->subdev);
>>   	media_entity_cleanup(&csi2rx->subdev.entity);
>> +	pm_runtime_disable(csi2rx->dev);
>>   	kfree(csi2rx);
>>   }
>>   
>> +static int csi2rx_runtime_suspend(struct device *dev)
>> +{
>> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
>> +	unsigned int i;
>> +
>> +	reset_control_assert(csi2rx->sys_rst);
>> +	clk_disable_unprepare(csi2rx->sys_clk);
>> +
>> +	for (i = 0; i < csi2rx->max_streams; i++) {
> You could declare i here.
>
>> +		reset_control_assert(csi2rx->pixel_rst[i]);
>> +		clk_disable_unprepare(csi2rx->pixel_clk[i]);
>> +	}
>> +
>> +	reset_control_assert(csi2rx->p_rst);
>> +	clk_disable_unprepare(csi2rx->p_clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int csi2rx_runtime_resume(struct device *dev)
>> +{
>> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(csi2rx->p_clk);
>> +	if (ret)
>> +		return ret;
>> +
>> +	reset_control_deassert(csi2rx->p_rst);
>> +
>> +	for (i = 0; i < csi2rx->max_streams; i++) {
>> +		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
>> +		if (ret)
>> +			goto err_disable_pixclk;
>> +
>> +		reset_control_deassert(csi2rx->pixel_rst[i]);
>> +	}
>> +
>> +	ret = clk_prepare_enable(csi2rx->sys_clk);
>> +	if (ret)
>> +		goto err_disable_pixclk;
>> +
>> +	reset_control_deassert(csi2rx->sys_rst);
>> +
>> +	return 0;
>> +
>> +err_disable_pixclk:
>> +	for (; i > 0; i--) {
> 	while (i--) {
>
> ?


Yes, will do this


Rishikesh

>
>> +		reset_control_assert(csi2rx->pixel_rst[i - 1]);
>> +		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
> Then you can refer to i here instead instead of i - 1.
>
>> +	}
>> +
>> +	reset_control_assert(csi2rx->p_rst);
>> +	clk_disable_unprepare(csi2rx->p_clk);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct dev_pm_ops csi2rx_pm_ops = {
>> +	RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
>> +};
>> +
>>   static const struct of_device_id csi2rx_of_table[] = {
>>   	{ .compatible = "starfive,jh7110-csi2rx" },
>>   	{ .compatible = "cdns,csi2rx" },
>> @@ -1127,6 +1164,7 @@ static struct platform_driver csi2rx_driver = {
>>   	.driver	= {
>>   		.name		= "cdns-csi2rx",
>>   		.of_match_table	= csi2rx_of_table,
>> +		.pm		= &csi2rx_pm_ops,
>>   	},
>>   };
>>   module_platform_driver(csi2rx_driver);

