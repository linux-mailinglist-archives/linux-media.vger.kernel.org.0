Return-Path: <linux-media+bounces-62216-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL/FJxBoDWquwgUAu9opvQ
	(envelope-from <linux-media+bounces-62216-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:51:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F795892DF
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFF6430185BB
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 07:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F803932DC;
	Wed, 20 May 2026 07:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pMMD4EVS"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A68B31A07B;
	Wed, 20 May 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263467; cv=fail; b=I8Z1oc/iTLoFzsGx6d1q3JXzyefTuGaSPL7bTqPozaOBJbeAouWKWFDDx6MQOj3xHN+3wHfaUuMwY/DudvtbpSyL449ShEoKNdSNwVYEU6Q7ECjdZBDsDJECrag3GxSo0VQzK3IowdzkxjIhmpZge9mQf26X+VhSUK/igRhEtd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263467; c=relaxed/simple;
	bh=DyjqhTBQvbHATVoYfHhLE+wd3xsqAz1TI3wF6q2rKIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=paDd2rLZ2OVHgxO/S1SzgqA1UafPeCFzSVSfCaBpYVvrQ7Ayg0mEPEqzHbO1YR381JH7JIQbBb73bxikGeSM8xt6SiN8uJiLQ/lzSAEV+xKu8tQdywx6pMW3svS8hkJNCtWTLQzAQpPd8C21MgWnitBAmVdG6/Jl6qgspFuDo20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pMMD4EVS; arc=fail smtp.client-ip=40.107.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wB+MzKzav8zrhIuCUaJ6ndep6jWaIkaiys3jPrPnXKj13nYnFzceSJ8RRxr3pvMPzmwbo/v1HU5eqEknnYkaUixLdksfq6jEPGTA+tgYQAOBCUuWhl7I99bOeB3ClHxbYMVa6FzA31MoVse3YnLe92o9FFAZgYRsr1ZL7Xy6+Ry+v4A8cWLkpTLS6qR6hvRdLb+AVg+wk1p9rRP3Bw4nFcd+iCRDrTbn+REPsUbxZhIwfu5Tuv8+mnhRrq7LldmSEwUsiWpZ1lWRRba8GwcvfZBNBokNRMysbgkgjgSRhr/d26R5DmIYlUQAYnBjzAI/s8lAjz5CZxuKg7YGUCVTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyjErDNIV0OHvGrQnLMZxWxE7q+q2qS+1r+wC9UJbYc=;
 b=yh8YPsobUr6d7akjgc1HEX1+qcol6wuNex9SegxZMTYE8AmLqLpFo3M9RbKxqrlTDf0iC/oXAGXmKBjdqMEDxVcjASV8Rs5paN6msgZtaloLpX1se+hQuqynW44g9IcqoFCXL3VGJIxIwmNsOiiKwNOHUu05IQhO8LQhtUcIU/HXF86fFMZjfEuK5pXOQ90BDbsMpsMWX3/5pCV08j/ey8GsuLFbA8mZMjKVxO2mOA1/RQ0/bpu/EIJmkckBGLarkjoE76gKwiuSTMimmg7+efW2w1ZOs1DBsMGXilN9e8ZThGZXQYd8XxZLbdP9SmvRgTfF1SOcGcawCMMi+dAG/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyjErDNIV0OHvGrQnLMZxWxE7q+q2qS+1r+wC9UJbYc=;
 b=pMMD4EVSOByJ02B2/CUjx0Nbtpj+5prr7On9mFNSf0qZ8048TvXDqwfc6QTM4rsUPmtVarAXDzTXBhsrkHxFsH5VueR9C/97hmS4AY+E9KUnVwJLXr9EX6BalFOET5KrylnqDFUOKPzNCCWDexEArc4UXzFnFGCZClFuuKj7gWw=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by CH3PR10MB6858.namprd10.prod.outlook.com (2603:10b6:610:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:51:02 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::3e) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 07:51:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 07:51:02 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 02:51:00 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 02:51:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 02:51:00 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64K7orok1538482;
	Wed, 20 May 2026 02:50:54 -0500
Message-ID: <e50878ac-3aca-4a14-a0a7-3dd05edb0e5a@ti.com>
Date: Wed, 20 May 2026 13:20:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/17] media: cadence: csi2rx: add multistream support
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
 <20260313090701.646534-12-r-donadkar@ti.com>
 <agxSHK-Edk8zoJmx@kekkonen.localdomain>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <agxSHK-Edk8zoJmx@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|CH3PR10MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae7c772-3874-443e-a384-08deb64489fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|82310400026|4143699003|18002099003|22082099003|56012099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	prwzhHXutVdcjRezbUn8iAB6kNZ9gP6oMh3hEmtGIIhPSvyym4BHPGWRfbTFOTry/0EB85FkkOwdJR90P+D0kS7h5wOwRgJC6B6kyjCshPsDKy35mytM4Co7mQKY3RSEJs3cCnYyY3b1V/9hvpOJMxJDRfpgrPRmKxsGIFtM8sWYW0PNZkn8NhSgpK0gWX/5I5b7MZzWLd2z+2iN9P4fGTDXFFu+LOCSSmJ2IGof3Z6Q5hdLp+5nRId/tAgQaxzqEuhMDx+ttgHFid/yABKR5DK2PaG1fZiRh4xfxadFC667bxeB6OVujVud17/eFlpLlIGljb4QFRga1UQ02q9uEvpArVUwkH6zggpkHlzc1H4uGjNshDU4X4bjyX6GVQqmhRjaicAykl7Mt7U4z5KhkAMB+Lmvt6FQUKzZvlVPm+5fR64EsFAfwugI0cs4d/Lfa2DnITpEOPTe6FY/E0pNMbJeK9OCj79EAQ7OQSk+PVAgwP7r2lFoa8xwMj4IFOGYRyEKfMBRyoBAp0ZZwM328fNPGjF8PtFCdBxEZU7lGnykrl3FQRVaG37yUuRc99MGDCni04ThSCuiNg1bPGiHWHkn1LP1PwgqY4q6zGLpd6Dzdt3RVIGFghnP+j87TRi/wFDDYNNatDSfXXP2HxAglf52C8HPD972O084XPYVoSr4B6a3SDDM+bGE1v9hCnkVwqxccxQm4NydSO5qOnQfwhhJUshCwFX0nk3qu0lRmu8=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(82310400026)(4143699003)(18002099003)(22082099003)(56012099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9asV9WFq8knZJlQwD9jlwYxTyW2nqMz6dH3qhljQ7S7e2tr1u4V8x5xZbAr+xfQlYu89mjwpNGN5DObsidJB+CebugG9qpFkdOH7kkrl/oBhDEoRjISpY3WgQMuHaDbpy985Lrjr2mG4Qp+Xz1D1Puja0/fQIAJHHNo5eoDdI7O1Gq1DtV6mXgsiNen8/ih+G/O5kdyuU7nvXLtuzzqmq+6uF4JRe3fJ3r+ZerXC13NDTmjThJaaBzBofgkqaMhjdPZs4cUYuHUrJm7pguUqdDJlRANsVxRI0x5KT9vj0Tn5MLl7wP3Lpso0XnDNBHDbQwGPZ7ez1ke/PCEgoMjbECSn5Y+vGTv9hjTLT3b+Oy9gJLtQqe1frh2mLXyl8+Xh1/DqqPFGPri9cGK0lexrmioOCX7VKPELI8MYn4QAfD4SXypPQn6FmoqQjg8iQuk1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:51:02.1093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae7c772-3874-443e-a384-08deb64489fe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6858
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62216-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ti.com:email,ti.com:mid,ti.com:dkim,ideasonboard.com:email,starfivetech.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 36F795892DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 19/05/26 17:35, Sakari Ailus wrote:
> Hi Rishikesh,


Hi Sakari,

Thank you for the review !

>
> On Fri, Mar 13, 2026 at 02:36:55PM +0530, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
>> of data over the same physical interface using MIPI Virtual Channels.
>>
>> While the hardware IP supports usecases where streams coming in the sink
>> pad can be broadcasted to multiple source pads, the driver will need
>> significant re-architecture to make that possible. The two users of this
>> IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
>> have only integrated the first source pad i.e stream0 of this IP. So for
>> now keep it simple and only allow 1-to-1 mapping of streams from sink to
>> source, without any broadcasting.
>>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 279 +++++++++++++++----
>>   1 file changed, 227 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 52ca940acd7d0..f34df341a2cac 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -135,6 +135,7 @@ struct csi2rx_priv {
>>   	struct phy			*dphy;
>>   
>>   	u8				num_pixels[CSI2RX_STREAMS_MAX];
>> +	u32				vc_select[CSI2RX_STREAMS_MAX];
>>   	u8				lanes[CSI2RX_LANES_MAX];
>>   	u8				num_lanes;
>>   	u8				max_lanes;
>> @@ -273,30 +274,46 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>>   
>>   static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>>   {
>> -	struct media_pad *src_pad =
>> -		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>>   	union phy_configure_opts opts = { };
>>   	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>> -	struct v4l2_subdev_state *state;
>>   	struct v4l2_mbus_framefmt *framefmt;
>> +	struct v4l2_subdev_state *state;
>>   	const struct csi2rx_fmt *fmt;
>> +	struct v4l2_subdev_route *route;
>> +	int source_pad = csi2rx->source_pad;
>> +	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
>>   	s64 link_freq;
>>   	int ret;
>> +	u32 bpp;
>>   
>>   	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
>>   
>> -	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
>> -	if (!framefmt) {
>> -		dev_err(csi2rx->dev, "Did not find active sink format\n");
>> -		return -EINVAL;
>> -	}
>> +	/*
>> +	 * For multi-stream transmitters there is no single pixel rate.
>> +	 *
>> +	 * In multistream usecase pass bpp as 0 so that v4l2_get_link_freq()
>> +	 * returns an error if it falls back to V4L2_CID_PIXEL_RATE.
>> +	 */
>> +	if (state->routing.num_routes > 1) {
>> +		bpp = 0;
>> +	} else {
>> +		route = &state->routing.routes[0];
>> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
>> +							route->sink_stream);
>> +		if (!framefmt) {
>> +			dev_err(csi2rx->dev, "Did not find active sink format\n");
>> +			return -EINVAL;
>> +		}
>>   
>> -	fmt = csi2rx_get_fmt_by_code(framefmt->code);
>> +		fmt = csi2rx_get_fmt_by_code(framefmt->code);
>> +		bpp = fmt->bpp;
>> +	}
>>   
>> -	link_freq = v4l2_get_link_freq(src_pad,
>> -				       fmt->bpp, 2 * csi2rx->num_lanes);
>> -	if (link_freq < 0)
>> +	link_freq = v4l2_get_link_freq(pad, bpp, 2 * csi2rx->num_lanes);
>> +	if (link_freq < 0) {
>> +		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
>>   		return link_freq;
>> +	}
>>   
>>   	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
>>   							 csi2rx->num_lanes, cfg);
>> @@ -394,11 +411,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   					  csi2rx->num_pixels[i]),
>>   		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
>>   
>> -		/*
>> -		 * Enable one virtual channel. When multiple virtual channels
>> -		 * are supported this will have to be changed.
>> -		 */
>> -		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
>> +		writel(csi2rx->vc_select[i],
>>   		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
>>   
>>   		writel(CSI2RX_STREAM_CTRL_START,
>> @@ -486,18 +499,57 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
>>   	return 0;
>>   }
>>   
>> +static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
>> +				    struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_mbus_frame_desc fd = {0};
>> +	struct v4l2_subdev_route *route;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
>> +	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>> +		dev_dbg(csi2rx->dev,
>> +			"Failed to get source frame desc, allowing only VC=0\n");
>> +		for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
>> +			csi2rx->vc_select[i] = CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
>> +		return;
>> +	}
>> +
>> +	/* If source provides per-stream VC info, use it to filter by VC */
>> +	memset(csi2rx->vc_select, 0, sizeof(csi2rx->vc_select));
>> +
>> +	for_each_active_route(&state->routing, route) {
>> +		u32 cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
>> +
>> +		for (i = 0; i < fd.num_entries; i++) {
>> +			if (fd.entry[i].stream != route->sink_stream)
>> +				continue;
>> +
>> +			csi2rx->vc_select[cdns_stream] |=
>> +				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry[i].bus.csi2.vc);
>> +		}
>> +	}
>> +}
>> +
>>   static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>>   				 struct v4l2_subdev_state *state, u32 pad,
>>   				 u64 streams_mask)
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +	u64 sink_streams;
>>   	int ret;
>>   
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>> +
>>   	/*
>>   	 * If we're not the first users, there's no need to
>>   	 * enable the whole controller.
>>   	 */
>>   	if (!csi2rx->count) {
>> +		csi2rx_update_vc_select(csi2rx, state);
>>   		ret = csi2rx_start(csi2rx);
>>   		if (ret)
>>   			return ret;
>> @@ -505,10 +557,11 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>>   
>>   	/* Start streaming on the source */
>>   	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
>> -					 BIT_U64(0));
>> +					 sink_streams);
>>   	if (ret) {
>>   		dev_err(csi2rx->dev,
>> -			"Failed to start streams %d on subdev\n", 0);
>> +			"Failed to start streams %#llx on subdev\n",
>> +			sink_streams);
>>   		if (!csi2rx->count)
>>   			csi2rx_stop(csi2rx);
>>   		return ret;
>> @@ -523,9 +576,14 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>>   				  u64 streams_mask)
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +	u64 sink_streams;
>> +
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>>   
>>   	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
>> -					csi2rx->source_pad, BIT_U64(0))) {
>> +						 csi2rx->source_pad, sink_streams)) {
>>   		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
>>   	}
>>   
>> @@ -550,12 +608,56 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
>>   	return 0;
>>   }
>>   
>> +static int _csi2rx_set_routing(struct v4l2_subdev *subdev,
>> +			       struct v4l2_subdev_state *state,
>> +			       struct v4l2_subdev_krouting *routing)
>> +{
>> +	static const struct v4l2_mbus_framefmt format = {
>> +		.width = 640,
>> +		.height = 480,
>> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> +		.field = V4L2_FIELD_NONE,
>> +		.colorspace = V4L2_COLORSPACE_SRGB,
>> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +	};
>> +	int ret;
>> +
>> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
>> +		return -EINVAL;
> Is there a need for this check? The framework already checks the number of
> active routes isn't larger than V4L2_FRAME_DESC_ENTRY_MAX.


Thank you for pointing out, will remove this check.


>
>> +
>> +	ret = v4l2_subdev_routing_validate(subdev, routing,
>> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_subdev_set_routing_with_fmt(subdev, state, routing, &format);
>> +}
>> +
>> +static int csi2rx_set_routing(struct v4l2_subdev *subdev,
>> +			      struct v4l2_subdev_state *state,
>> +			      enum v4l2_subdev_format_whence which,
>> +			      struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +	int ret;
>> +
>> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csi2rx->count)
>> +		return -EBUSY;
>> +
>> +	ret = _csi2rx_set_routing(subdev, state, routing);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>>   static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
>>   			  struct v4l2_subdev_state *state,
>>   			  struct v4l2_subdev_format *format)
>>   {
>>   	struct v4l2_mbus_framefmt *fmt;
>> -	unsigned int i;
>>   
>>   	/* No transcoding, source and sink formats must match. */
>>   	if (format->pad != CSI2RX_PAD_SINK)
>> @@ -567,14 +669,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
>>   	format->format.field = V4L2_FIELD_NONE;
>>   
>>   	/* Set sink format */
>> -	fmt = v4l2_subdev_state_get_format(state, format->pad);
>> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>>   	*fmt = format->format;
>>   
>> -	/* Propagate to source formats */
>> -	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
>> -		fmt = v4l2_subdev_state_get_format(state, i);
>> -		*fmt = format->format;
>> -	}
>> +	/* Propagate to source format */
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	*fmt = format->format;
>>   
>>   	return 0;
>>   }
>> @@ -582,21 +686,22 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
>>   static int csi2rx_init_state(struct v4l2_subdev *subdev,
>>   			     struct v4l2_subdev_state *state)
>>   {
>> -	struct v4l2_subdev_format format = {
>> -		.pad = CSI2RX_PAD_SINK,
>> -		.format = {
>> -			.width = 640,
>> -			.height = 480,
>> -			.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> -			.field = V4L2_FIELD_NONE,
>> -			.colorspace = V4L2_COLORSPACE_SRGB,
>> -			.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> -			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> -			.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +	struct v4l2_subdev_route routes[] = {
>> +		{
>> +			.sink_pad = CSI2RX_PAD_SINK,
>> +			.sink_stream = 0,
>> +			.source_pad = CSI2RX_PAD_SOURCE_STREAM0,
>> +			.source_stream = 0,
>> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>>   		},
>>   	};
>>   
>> -	return csi2rx_set_fmt(subdev, state, &format);
>> +	struct v4l2_subdev_krouting routing = {
>> +		.num_routes = ARRAY_SIZE(routes),
>> +		.routes = routes,
>> +	};
>> +
>> +	return _csi2rx_set_routing(subdev, state, &routing);
>>   }
>>   
>>   int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>> @@ -604,25 +709,44 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>>   	const struct csi2rx_fmt *csi_fmt;
>> +	struct v4l2_subdev_route *route;
>>   	struct v4l2_subdev_state *state;
>>   	struct v4l2_mbus_framefmt *fmt;
>> +	int ret = 0;
>>   
>>   	if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >= CSI2RX_PAD_MAX)
>>   		return -EINVAL;
>>   
>>   	state = v4l2_subdev_lock_and_get_active_state(subdev);
>> -	fmt = v4l2_subdev_state_get_format(state, pad);
>> -	csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
>> +	/* Check all streams on requested pad */
>> +	for_each_active_route(&state->routing, route) {
>> +		if (route->source_pad != pad)
>> +			continue;
>> +
>> +		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
>> +						   route->source_stream);
>> +		if (!fmt) {
>> +			ret = -EPIPE;
>> +			*ppc = 1;
>> +			break;
>> +		}
>>   
>> -	/* Reduce requested PPC if it is too high */
>> -	*ppc = min(*ppc, csi_fmt->max_pixels);
>> +		csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
>> +		if (!csi_fmt) {
>> +			ret = -EINVAL;
>> +			*ppc = 1;
>> +			break;
>> +		}
>>   
>> +		/* Reduce requested PPC if it is too high for this stream */
>> +		*ppc = min(*ppc, csi_fmt->max_pixels);
>> +	}
>>   	v4l2_subdev_unlock_state(state);
>>   
>>   	csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =
>>   		CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
>>   
>> -	return 0;
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
>>   
>> @@ -630,17 +754,66 @@ static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
>>   				 struct v4l2_mbus_frame_desc *fd)
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +	struct v4l2_mbus_frame_desc source_fd = {0};
>> +	struct v4l2_subdev_route *route;
>> +	struct v4l2_subdev_state *state;
>> +	int ret;
>> +
>> +	ret = csi2rx_get_frame_desc_from_source(csi2rx, &source_fd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(subdev);
>> +
>> +	for_each_active_route(&state->routing, route) {
>> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
>> +		unsigned int i;
>> +
>> +		if (route->source_pad != pad)
>> +			continue;
>> +
>> +		for (i = 0; i < source_fd.num_entries; i++) {
>> +			if (source_fd.entry[i].stream == route->sink_stream) {
>> +				source_entry = &source_fd.entry[i];
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!source_entry) {
>> +			dev_err(csi2rx->dev,
>> +				"Failed to find stream from source frame desc\n");
>> +			ret = -EPIPE;
>> +			goto err_missing_stream;
>> +		}
>> +
>> +		fd->entry[fd->num_entries].stream = route->source_stream;
>> +		fd->entry[fd->num_entries].flags = source_entry->flags;
>> +		fd->entry[fd->num_entries].length = source_entry->length;
>> +		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
>> +		fd->entry[fd->num_entries].bus.csi2.vc =
>> +			source_entry->bus.csi2.vc;
>> +		fd->entry[fd->num_entries].bus.csi2.dt =
>> +			source_entry->bus.csi2.dt;
>>   
>> -	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
>> +		fd->num_entries++;
> Would v4l2_subdev_get_frame_desc_passthrough() be useful here?


Yes, will use v4l2_subdev_get_frame_desc_passthrough() helper instead of 
this.


Rishikesh

>
>> +	}
>> +
>> +err_missing_stream:
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	return ret;
>>   }
>>   
>>   static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>> -	.enum_mbus_code	= csi2rx_enum_mbus_code,
>> -	.get_fmt	= v4l2_subdev_get_fmt,
>> -	.set_fmt	= csi2rx_set_fmt,
>> -	.enable_streams         = csi2rx_enable_streams,
>> -	.disable_streams        = csi2rx_disable_streams,
>> -	.get_frame_desc	= csi2rx_get_frame_desc,
>> +	.enum_mbus_code		= csi2rx_enum_mbus_code,
>> +	.get_fmt		= v4l2_subdev_get_fmt,
>> +	.set_fmt		= csi2rx_set_fmt,
>> +	.get_frame_desc		= csi2rx_get_frame_desc,
>> +	.set_routing		= csi2rx_set_routing,
>> +	.enable_streams		= csi2rx_enable_streams,
>> +	.disable_streams	= csi2rx_disable_streams,
>>   };
>>   
>>   static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
>> @@ -659,6 +832,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
>>   static const struct media_entity_operations csi2rx_media_ops = {
>>   	.link_validate = v4l2_subdev_link_validate,
>>   	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
>> +	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
>>   };
>>   
>>   static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
>> @@ -876,7 +1050,8 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>>   	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
>>   		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>> -	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	csi2rx->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
>> +		V4L2_SUBDEV_FL_STREAMS;
>>   	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
>>   
>>   	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,

