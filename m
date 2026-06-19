Return-Path: <linux-media+bounces-65256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IQDMNP8ENWpkmAYAu9opvQ
	(envelope-from <linux-media+bounces-65256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:59:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C64486A4CD4
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:59:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=PvWx2caz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65256-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65256-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF095300BCAC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 08:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDDA35EDA4;
	Fri, 19 Jun 2026 08:59:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA7D2D8378;
	Fri, 19 Jun 2026 08:59:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859577; cv=fail; b=pPMjoLjChXxs81bSKnzzK2/UHsnmGMvUB3YcVQJXPoqFAvRNze5/NccPN3PxwrbOyRxfSgiHp24Uw9DnFvwjbYvIl09mHLElVELshWk8mfAcSFtDl15l7POIvaFo0WB7oFMDjHUeEIAYjIxOR6mgf3ppnTXu7BnX5osLOpicZIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859577; c=relaxed/simple;
	bh=XpT/wHU7eGeMoBMzpY/esttXjifyrVBb2e9Sq3/xPmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d5e54Er+tCKQGhi3f5/zTHFdwm8iJ4LmqCn4R99ufCynXOnLgyCePOyM009HKQfyC44QuemSISPoqWdUV+G8OcNXUQwPwRXgt4O+yD5hiC1K9WZqKmRNvFmWeyVvFNNL2ifQoDfgzTJmWYzj/bOtgkWgzgRRmWscRlZPeXnyDmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PvWx2caz; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFS7Uj8p9qWNAz6XfAFFu7TB+bjYomS4imCZGK9Ac2tyWUlzTUiZO6VQhkS3F9qGQINnVRHf7lWzHu9Rzp+8xryWbi50lfaDbJMbLw+MkMcN0s664GrHs86v/Gd8V1Ya4PlTatb4cSqeLo/yhj9zDMSj5vszzaYaQYzWJBo/K81gqL/i88Q+x16iUGDsb+OJOVXvrRkNbry5ErD1r4HqfEhKlmb+jCKDilvI350yH53WY69d3+fKIw2BhfgwY0y9JeSWJgzSUqNNc/SimMOGNrKpuu00gYw885g83YYi23JKwtdGFsBHguhlzJq1h5FPimD+yLh1cVpqqLAoesNROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/qS9A2zDvCffBOiDKoEhMlmGi0iWtCKmOfeMrXQ+aQ=;
 b=w6MoBlAMPg0g/fWHNvU+xhxpZJv13/CtJOO31UkSZjZZuxnroLa05XvKUbJ3/VRkaOnBTpLZqY3Q1w0dxTiC7tt3XCuH10JzUOKxw/mXd24CbQd0L2Kt5kGeCV5WlPMP7R95ZGX2rD84/YxQlEGohW+8KKCwTlHRa6NUoocq4qeTyccNxxvITVXkBeqplP3VjWuYKAc5IHENBcOAATea+9G9EzjFjHW80E/y3b9ohn5ukb/N8o1hgMvB6MOKX4QMPLiRCEstlpdc/WpRyjY9Kl4Np4ujDJhy7EnjuZw0J+TLy7pF8oXKYEAJIS76jaaUOUHDpfBch3ZP3Fb+ORU3Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/qS9A2zDvCffBOiDKoEhMlmGi0iWtCKmOfeMrXQ+aQ=;
 b=PvWx2cazsQDpGDHsbG6dL7sg2AwrZJIDVyLSqt19G7GKIxAEjcTryBZ7WhnbbpLBQaHnKd1TFGjlEOH240/LWapL7+thTLIDuK6H1EM9xQg4WwQi+7nW6eO3acfItNwwtlyRV4sS8JyOzmJR8wkKEyaaXOAoVV2b+n/hzyeVJue/pTT8ixXBem3Ujcgueg+qanAKnUWzgTs4FHWvIcOgbBcW2BWJJyYT3OofofmbBIL0zjrag2DOsCOw70c3sbBz0xdqOEIV6j5KHHbLgqDuogiJ18lU4JnmNuj0eTlDaY+/is9g8qaXKIOcdRvR62d9RCWrlXZ6ccoDrRJM6OI+Og==
Received: from DB9PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:10:1da::32)
 by PA4PR10MB5610.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 08:59:28 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::34) by DB9PR05CA0027.outlook.office365.com
 (2603:10a6:10:1da::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Fri,
 19 Jun 2026 08:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 08:59:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 19 Jun
 2026 11:03:29 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 19 Jun
 2026 10:59:24 +0200
Message-ID: <02b07f43-3c90-4e89-8747-7fd424d87dd1@foss.st.com>
Date: Fri, 19 Jun 2026 10:59:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: vd56g3: clean up subdev state on probe
 failure
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Myeonghun Pak <mhun512@gmail.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20260424165238.31333-1-mhun512@gmail.com>
 <c9c20bce-a1bb-4932-bfa0-c87f7156ff82@foss.st.com>
 <ajPcKcJfbIdPKI8-@kekkonen.localdomain>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <ajPcKcJfbIdPKI8-@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|PA4PR10MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb4c36d-95cf-42c6-e238-08decde10ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|13003099007|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rgyYKgF7iSs/dlZ7ZDYddmjt4qXOe3UuBPVMFMDqH0JV1Rny0GqY5Z/U3JHTnZEBuBWmH82aZE74gKduiGRxWj7gU6Y7/hUIc//X6vyrKplfV511dDRIq3ac6UV1chJNCW8E3xZqEekh1ooUv/HLHZhnyqH4V4FINnjId4tk2MIqiOX0JfOCNsq7LVHBTGLeUDGWi575BINHzXD1UPJAjv5zippPmhMvI/iWZ2aLFyCMewVToj+GS06wOZbLbeHCrwJawjtKrqWubqfjFOLMi3zIpKNNiKaPl59v49cJQaPQTKNlTwZPU34XfyTTY4cY/QzcQoAysJVAQnlwguG9jDKduMvZHoSEZdjXW6Y/5PmFNXMltyi/afOmQHTvnO4nKygnxI3ziFpTqaktA3N06rV9qa9U7fR1CRsOVE8z9B3PGBOcHx+/DFZd+L4GXgLXO54/f3GdRW29c6a3ZhsyWRo7U9pTqd11ZIjrY09BgccMhcewzMMrptgo78KYDPJ5ho1smLfQ9ym8Zc1FAXMxR2WV/W/L97wSmoSnqVfBrObx5NTI/7VE3URjM9StAdF7JGaJoC53+iVCQG5CVC30Pu97i/+b5Cl9ZdvJlIG+IeP6XcfdrjKgldfko9WE6oFXMOrpZnysRpqAr0EN3QDlt6F6znIJl8xkTw9GlzNsUm/E9gJtJVLikWWV9VG9nfFBwRfAnvywD9cD5rEmPAEzig==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(13003099007)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mG4u6ihd/e3SqwOEfl3gFn6GsLs7JVIFqpEQvwPiI9vEXtsX//1+7D64qBI2RRR+xE/p9lm4NRU9EcLL6bQ2IzxogntAeEcYET/OzKxaq2JvpD6ojl/0IeB7YLbd/2Gbp0NwB7NCHUMkIbGreROTn/8czqIMN2OhumZZsnTXkvd7JLJu7UyBStJY6MqIEfTVkolaCcEKibZT6OVbHj3e2Y9aiK1t8mEro+Bc/0jarsoiGoZOHIi9Lr8dOwOfGDFn1hFju0TYxQAGuJMNchsTYphzQyVUrAq/YWoTUPfyCQEJYj5QH0NoOFtSM6urAO7KlqPC5FHRKip0IZ8zYOMFvm1WZj+dDcbgSYqP8zF492fs7PLA9KVvTuFyDkCPHmXE4TgA6cnaM33T+9SeANxtlMu+XuyyDlQh8e91tuUZwFP8RD6Rt6RCo4LGHyul6gqa
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 08:59:25.1647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb4c36d-95cf-42c6-e238-08decde10ffe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5610
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65256-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[foss.st.com:server fail,vger.kernel.org:server fail,sin.lore.kernel.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mhun512@gmail.com,m:sylvain.petinot@foss.st.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C64486A4CD4

Hi Sakari,

Le 18/06/2026 à 13:53, Sakari Ailus a écrit :
> Hi Benjamin,
> 
> On Tue, Jun 16, 2026 at 02:49:54PM +0200, Benjamin Mugnier wrote:
>> Hi,
>>
>> Thank you for your patch, and apologies for the delay.
>>
>> Le 24/04/2026 à 18:52, Myeonghun Pak a écrit :
>>> vd56g3_subdev_init() calls v4l2_subdev_init_finalize(), which allocates
>>> the subdev active state and requires v4l2_subdev_cleanup() to release it.
>>>
>>> If vd56g3_update_controls() fails after finalize succeeds, the probe error
>>> path currently skips v4l2_subdev_cleanup() and returns an error. The driver
>>> .remove() callback is not called after a failed probe, so the active state
>>> is leaked.
>>>
>>> Route this error through a subdev cleanup label before freeing the control
>>> handler and media entity.
>>>
>>> Fixes: 87aa97fc3157 ("media: i2c: Add driver for ST VD56G3 camera sensor")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Use a lowercase subject summary.
>>
>> Please keep the first character uppercase, just like other commits on
>> this module.
>>
>>>
>>>  drivers/media/i2c/vd56g3.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
>>> index 157acea9e2..43f792288a 100644
>>> --- a/drivers/media/i2c/vd56g3.c
>>> +++ b/drivers/media/i2c/vd56g3.c
>>> @@ -1427,11 +1427,14 @@ static int vd56g3_subdev_init(struct vd56g3 *sensor)
>>>  	v4l2_subdev_unlock_state(state);
>>>  	if (ret) {
>>>  		dev_err(sensor->dev, "Controls update failed: %d\n", ret);
>>> -		goto err_ctrls;
>>> +		goto err_subdev;
>>>  	}
>>>  
>>>  	return 0;
>>>  
>>> +err_subdev:
>>> +	v4l2_subdev_cleanup(&sensor->sd);
>>
>> v4l2_subdev_cleanup() is already performed in the caller (i.e.
>> vd56g3_probe()), but as you noticed it is not called from this path. I'd
>> rather have the return value route correctly through
>> v4l2_subdev_cleanup() in  vd56g3_probe(), allowing to keep a unique call
>> to v4l2_subdev_cleanup() instead.
> 
> Is it?
> 
> If vd56g3_update_controls() in vd56g3_subdev_init() fails, it'll jump to
> err_power_off in vd56g3_probe() which does PM related cleanup only.
> 

Exactly, I realize my sentence was poorly written, but if I understand
correctly we're on the same page. The problem being
v4l2_subdev_cleanup() not being called in any path if
vd56g3_update_controls() fails.

Now if vd56g3_update_controls() fails, instead of performing
v4l2_subdev_cleanup() in vd56g3_subdev_init() as this patch does, I'd
rather have it done in vd56g3_probe()'s jump back so we can keep it all
at the same place, instead of having 2 v4l2_subdev_cleanup() in 2
different places.

Tell me if this is still unclear.

>>
>> This patch looks like is LLM generated and sparks my curiosity. If so
>> you must disclaim it using an Assisted-by tag [1]. Sorry if I’m mistaken.
>>
>> [1] https://docs.kernel.org/process/coding-assistants.html
>>
>>> +
>>>  err_ctrls:
>>>  	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
>>>  
>>
>> -- 
>> Regards,
>> Benjamin
>>
> 

-- 
Regards,
Benjamin


