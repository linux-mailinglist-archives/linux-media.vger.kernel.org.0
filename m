Return-Path: <linux-media+bounces-65697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WCIjKTZLPmo5CwkAu9opvQ
	(envelope-from <linux-media+bounces-65697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 11:49:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5DC6CBD31
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 11:49:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=KxqYUvof;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65697-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65697-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 725073037DCF
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 09:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028223E5A01;
	Fri, 26 Jun 2026 09:49:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2118C3DCD97;
	Fri, 26 Jun 2026 09:49:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467349; cv=fail; b=Q5SqXBr+beBLVYmZNH3rrVtwP7LpLa73xmYiOxTcLKvLj/Um0cjNjNhlueHXdvrsFrfTunwT5RIG1kXTDCBuYDq9vOxZun/ccU+7HS41B/TXBCnOqdrHW2NSkV20xMlsNR+x26G2IAniM3+wRsqDh+gr84m0KONtgmnoSa+S3bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467349; c=relaxed/simple;
	bh=Hy6snx12XvWox3b/krxD4cHwhSRZxujpcabHQch6AT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sUnVCckck4szbM/e39QZwaydVk2ecGnqqaOxNllkAkNWsm8g5G2zRwCCmQP8zGFsydOZjpw7SA5F8oi+jWhpfz+Xa1B7xs7FPGQ1TVGoLWbTHXu/QIK8Ov//rDl2AnRmjwp5Eab0PpO3krP54ti38B3NXffKKWmwsL6Wz+Yqu7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KxqYUvof; arc=fail smtp.client-ip=52.101.69.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIq2hdDp4FxfTwxT2yD9DIA+0SLHAyQ+bQGxWoUe1lZKO3IPNQZfoqrfTEMuTPrrm2l8DdVWCFa6XFrhml52OZ7FlakHHfbZKwJxwaCaKk+YUgvMWupnBtqqGAILvdJ966cJBlrrs6zL40KFWaNl5oZtnwIxO+14tz689ndi3UC58NShUZHxQEU/N/dbucQukelD1iTcl4JwoIREZgN9dVIAPL2EXLrt85j2oThapb+ZolemzyxHq0vXOnqsPsF3orV8BL1+GdwgnGZGoXtrnr0UTsOfOWG8AyWT5VmXUgQ//0b5OEW6oi2NkOiXT6xF20MU5Ogl9w+ZX4hFXeFrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe1w7B7bTJ0gvi6jTtu62v+Z2gwkGO/K2TkJOS7u59o=;
 b=tZurAgJ4/T4NayehkzBCWPm7uyF9iuGMUji3c4DrFhpby7pT5wgNl4pJ02cbtVJ2Mr0ABFZpg1nBkoLf0QrzO7mlKIZ9qfKSiPi4i1juggPEZeUUoQoapxJJD1ww9VKTyLOHR1BaW0SS5vgf3x5fti6l/N3tRyHl0ed9n5BuRdBsyjPM845QA1VKAOzTj5mrKSRhKhhRdEaZmIbCIWTQZEQLC4syMjYwuUGdcSy7mJPPKjT86+My2h9y0Hq7qnq9PbRW7us5vPXbemdDK1RJNRUUzhQRBXkVX1FmT+qd38piQOUApIU0pFKmKKwWMNkOed38wJjpGDbe/DlchrTKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe1w7B7bTJ0gvi6jTtu62v+Z2gwkGO/K2TkJOS7u59o=;
 b=KxqYUvofPXfA01xEESipjsKJibmOuwcw3dG0cIOXkf5CjGlfcT07QdFXu2j3zk7XMcXWQidnqTmKYjSlcSmr8pXgIZBobpPI1jDLY4orVUT/XxWqsqrQFz6p0IIJmUNCMgzFDaqzdvMdhae/I42f1QbyaiDm3/v0Q9/4Nj5N9Vs28SvQ7batUSxmr2vgaEoMS7iVzSJEQfZ0Yz2KreZistjCkDqOGJPdNFPTfmggEGCrvbVbiUKJkDK5wm2U0mPyvkqsRWkpyJpshOFiaTqBHI0FZeunKibsKvPdIYSHgrvK8/5IbUfWAbSXrtoDAV21xrzAz+guOR1dNwyv1CHefA==
Received: from CWLP123CA0193.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::18)
 by AS2PR10MB6445.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:558::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Fri, 26 Jun
 2026 09:49:01 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:400:19c:cafe::38) by CWLP123CA0193.outlook.office365.com
 (2603:10a6:400:19c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 09:49:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 09:49:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 26 Jun
 2026 11:53:42 +0200
Received: from [10.252.24.187] (10.252.24.187) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 26 Jun
 2026 11:49:00 +0200
Message-ID: <b2649f69-6182-4530-97cc-5619cd9f3ccc@foss.st.com>
Date: Fri, 26 Jun 2026 11:49:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: i2c: vd55g1: Add support for vd55g4
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-4-4f745a83b87e@foss.st.com>
 <ajkKkSeDNoijIsub@zed> <68d276f9-e688-4736-a296-f56c5aaa4b77@foss.st.com>
 <aj4xDDy0UubUzCVx@zed>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aj4xDDy0UubUzCVx@zed>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79A:EE_|AS2PR10MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: e50969e5-d030-45c4-577d-08ded36826dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|7416014|18002099003|11063799006|56012099006|5023799004|3023799007|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NeKkhDnK7NkqgNkoHhuboMJTkY1S83Ty9aKDzQE4sKHVFeA66ysL0czFRw06NLwv6WuCS5a7UFwJuL6M6uCnO0Cjchpbw2UM7wGG+PZJZkPoRhTxZpe2tmaAU8OCl3QI4EpRWo2COpuAKnCz3wD9sGdhNKLJf4S55THH6FKLcJkw4nhIkE4L07w23DIrYnJP51PKo5wBck4wgqoQRe8Qcg5RymrN6pnxJ7I+5PdO8CgYb0BxiywFRYc4m7AvYp9lphbVKED/yflg/6rLwKI2FrKtZBr+j/Of3D7HtXaXb4Dy/gHbzHz6zL4QM8IJh0+a6Gm5A7cB3gMgItZnGOzwnA0z6g8W4n/VDczMBHT6uorLkugAxdfjsd5o6RloGhWksakokVjhWvnwLAFJWAiEFFiVabSiy6fRUv7rzTetoDLBeME6EMVSB/G/RxF4sT4VQBOrCm9g2rkjio1Rw21s9PT6TVwBVQ9ahpt998gfUbHKzFRTeZyQzScb7uiV5OCT+5fnqROelvBERZ65VpLVBkjMQrEx8n3F0JJw8+HI2pqyFirAubehzMkpZkESMkvKkF+PWGZKtb6b5Dcu90QDQFJurSSlE+p8Tj1wlvN8Tm6hwcCZxYaYf/E0KyTX3trvOgyVlF9zfdZ6Ip8xlHC38NlD6+Lv2LnJhrajH4/BXBBaCFKn1I0m13C8clTndW7ocH8kgcBoNpC4w4Tmp4k23Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(7416014)(18002099003)(11063799006)(56012099006)(5023799004)(3023799007)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X8bWjWRO2nRWmrT0NA2E6SXnzSVjR7KkuJUhRkVGzg7I+3VQG8gbNGZ9Egt5tVXM0kD7XcMR/j7Q3rHlqO+UFquXSsf8enJD8Okl0xQKwgt1kkIo+AgvOcLzLHikHEA9e9B0XhA8yvJd9OLQ0GbC9PnGrKd/Zr+lDZpDncxM09Z4Q++y6yr91ul4D4mUhz0Fe2B9BCpKLUiTAmKVjh1J3YaJNRR2qt1npKEGke+xjRc/cx2nvA4njrF7pq//Ddh0xivOUxUuySjFdwXHkkKNhQjqb0bn8u5GHUw8N2rSJBISqF53diV4ujQcQpOYU/+jif2UdNJ6BDcg3xHawrwHl8wLv3pZ/konZ4NMwn6A4/0d1AIYtauaC6F7aqPlbPpDcIlubWAXQaasaNBKKjvecjaoIKjeRBoVzgD/Y2Zxb/FDqfKjALsKq67Ox/1r6usr
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:49:01.4429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e50969e5-d030-45c4-577d-08ded36826dd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6445
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65697-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[foss.st.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A5DC6CBD31

Hi Jacopo,

Le 26/06/2026 à 09:58, Jacopo Mondi a écrit :
> Hi Benjamin
> 
> On Thu, Jun 25, 2026 at 01:41:56PM +0200, Benjamin Mugnier wrote:
>> Hi Jacopo,
>>
>> Le 22/06/2026 à 12:16, Jacopo Mondi a écrit :
>>> Hi Benjamin
>>>
>>> On Tue, Apr 28, 2026 at 10:40:58AM +0200, Benjamin Mugnier wrote:
>>>> vd55g4 is the same device as vd65g4 but outputs in monochrome instead of
>>>> RGB. Adapt the driver structure according to this new variant, and add
>>>> its support.
>>>>
>>>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>> ---
>>>>  drivers/media/i2c/vd55g1.c | 110 ++++++++++++++++++++++++++++++---------------
>>>>  1 file changed, 74 insertions(+), 36 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
>>>> index 2c962fcb41d2..9f62fc0428a1 100644
>>>> --- a/drivers/media/i2c/vd55g1.c
>>>> +++ b/drivers/media/i2c/vd55g1.c
>>>> @@ -29,11 +29,7 @@
>>>>
>>>>  /* Register Map */
>>>>  #define VD55G1_REG_MODEL_ID				CCI_REG32_LE(0x0000)
>>>> -#define VD55G1_MODEL_ID_VD55G1				0x53354731 /* Mono */
>>>> -#define VD55G1_MODEL_ID_VD65G4				0x53354733 /* RGB */
>>>> -#define VD55G1_REG_REVISION				CCI_REG16_LE(0x0004)
>>>> -#define VD55G1_REVISION_CCB				0x2020
>>>> -#define VD55G1_REVISION_BAYER				0x3030
>>>> +#define VD55G1_REG_COLOR_VERSION			CCI_REG32_LE(0x0670)
>>>>  #define VD55G1_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0012)
>>>>  #define VD55G1_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
>>>>  #define VD55G1_REG_SYSTEM_FSM				CCI_REG8(0x001c)
>>>> @@ -138,8 +134,39 @@
>>>>  #define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
>>>>  #define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
>>>>
>>>> -#define VD55G1_MODEL_ID_NAME(id) \
>>>> -	((id) == VD55G1_MODEL_ID_VD55G1 ? "vd55g1" : "vd65g4")
>>>> +enum vd55g1_model_id {
>>>> +	VD55G1_MODEL_ID_2 = 0x53354731,
>>>> +	VD55G1_MODEL_ID_3 = 0x53354733,
>>>> +};
>>>> +
>>>> +enum vd55g1_color_version {
>>>> +	VD55G1_COLOR_VERSION_MONO = 0x0,
>>>> +	VD55G1_COLOR_VERSION_BAYER = 0x1,
>>>
>>> nit: you don't need to initialize the enum members here
>>
>> Thank you, will do.
>>
>>>
>>>> +};
>>>> +
>>>> +struct vd55g1_version {
>>>> +	char *name;
>>>> +	enum vd55g1_model_id id;
>>>> +	enum vd55g1_color_version color;
>>>> +};
>>>> +
>>>> +static const struct vd55g1_version vd55g1_versions[] = {
>>>> +	{
>>>> +		.name  = "vd55g1",
>>>> +		.id    = VD55G1_MODEL_ID_2,
>>>> +		.color = VD55G1_COLOR_VERSION_MONO,
>>>> +	},
>>>> +	{
>>>> +		.name  = "vd55g4",
>>>> +		.id    = VD55G1_MODEL_ID_3,
>>>> +		.color = VD55G1_COLOR_VERSION_MONO,
>>>> +	},
>>>> +	{
>>>> +		.name  = "vd65g4",
>>>> +		.id    = VD55G1_MODEL_ID_3,
>>>> +		.color = VD55G1_COLOR_VERSION_BAYER,
>>>> +	},
>>>> +};
>>>>
>>>>  static const u8 vd55g1_patch_array[] = {
>>>>  	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
>>>> @@ -535,7 +562,7 @@ struct vd55g1_vblank_limits {
>>>>
>>>>  struct vd55g1 {
>>>>  	struct device *dev;
>>>> -	unsigned int id;
>>>> +	const struct vd55g1_version *version;
>>>>  	struct v4l2_subdev sd;
>>>>  	struct media_pad pad;
>>>>  	struct regulator_bulk_data supplies[ARRAY_SIZE(vd55g1_supply_name)];
>>>> @@ -628,7 +655,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
>>>>  {
>>>>  	unsigned int i, j;
>>>>
>>>> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
>>>> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
>>>>  		return code;
>>>
>>> As pointed out in the previous patch, you seem to have 2 mono formats.
>>> Is this still ok ?
>>>
>>>>
>>>>  	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_bayer); i++) {
>>>> @@ -1183,8 +1210,8 @@ static int vd55g1_patch(struct vd55g1 *sensor)
>>>>  	u64 patch;
>>>>  	int ret = 0;
>>>>
>>>> -	/* vd55g1 needs a patch while vd65g4 does not */
>>>> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
>>>> +	/* Version 2 needs a patch while version 3 does not */
>>>> +	if (sensor->version->id == VD55G1_MODEL_ID_2) {
>>>>  		vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
>>>>  				   sizeof(vd55g1_patch_array),
>>>>  				   vd55g1_patch_array, &ret);
>>>
>>> You might want to consider renaming vd55g1_patch_array ?
>>
>> It doesn't really patch an array, it writes an array of values into
> 
> My only point here was that it has 'vd55g1' in the name.

Sorry I thought you were talking about vd55g1_write_array() and not
vd55g1_patch_array for some reason.

My rule of thumb is that a static global variable must always be
prefixed by the driver name to avoid collisions. What rename are you
thinking about ?

> 
>> continuous i2c registers. Just like before converting to cci_write() I
>> used to have a vd55g1_write() function to write a register, I derived a
>> vd55g1_write_array() function. Here it happens to be a firmware patch,
>> but it could be anything you want ;)
>>
>>>
>>>> @@ -1256,7 +1283,7 @@ static int vd55g1_enum_mbus_code(struct v4l2_subdev *sd,
>>>>  	struct vd55g1 *sensor = to_vd55g1(sd);
>>>>  	u32 base_code;
>>>>
>>>> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
>>>> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER) {
>>>>  		if (code->index >= ARRAY_SIZE(vd55g1_mbus_formats_mono))
>>>>  			return -EINVAL;
>>>>  		base_code = vd55g1_mbus_formats_mono[code->index];
>>>> @@ -1372,7 +1399,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>>>>  	if (ret)
>>>>  		return ret;
>>>>
>>>> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
>>>> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
>>>>  		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
>>>>  	else
>>>>  		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
>>>> @@ -1659,38 +1686,48 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
>>>>  	return ret;
>>>>  }
>>>>
>>>> +static const struct vd55g1_version *
>>>> +	vd55g1_get_version(enum vd55g1_model_id id,
>>>> +			   enum vd55g1_color_version color)
>>>
>>> Should you indent one tab left ?
>>>
>>
>> checkpatch.pl is fine with both. I can indent left, it looks cleaner.
>>
>>>> +{
>>>> +	unsigned int i;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(vd55g1_versions); i++) {
>>>
>>> You can declare i inside the for loop
>>>
>>
>> Yes, thank you.
>>
>>>> +		if (vd55g1_versions[i].id == id &&
>>>> +		    vd55g1_versions[i].color == color)
>>>> +			return &vd55g1_versions[i];
>>>> +	}
>>>> +
>>>> +	return NULL;
>>>> +}
>>>> +
>>>>  static int vd55g1_detect(struct vd55g1 *sensor)
>>>>  {
>>>> -	unsigned int dt_id = (uintptr_t)device_get_match_data(sensor->dev);
>>>> -	u64 rev, id;
>>>> -	int ret;
>>>> +	const struct vd55g1_version *dt_version =
>>>> +		device_get_match_data(sensor->dev);
>>>> +	const struct vd55g1_version *version;
>>>> +	u64 color, id;
>>>> +	int ret = 0;
>>>>
>>>> -	ret = vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, NULL);
>>>> +	vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, &ret);
>>>> +	vd55g1_read(sensor, VD55G1_REG_COLOR_VERSION, &color, &ret);
>>>>  	if (ret)
>>>>  		return ret;
>>>>
>>>> -	if (id != VD55G1_MODEL_ID_VD55G1 && id != VD55G1_MODEL_ID_VD65G4) {
>>>> -		dev_warn(sensor->dev, "Unsupported sensor id 0x%x\n",
>>>> -			 (u32)id);
>>>> +	version = vd55g1_get_version(id, color);
>>>> +	if (!version) {
>>>> +		dev_warn(sensor->dev, "Unsupported sensor version, expected %s\n",
>>>> +			 dt_version->name);
>>>>  		return -ENODEV;
>>>>  	}
>>>> -	if (id != dt_id) {
>>>> -		dev_err(sensor->dev, "Probed sensor %s and device tree definition (%s) mismatch",
>>>> -			VD55G1_MODEL_ID_NAME(id), VD55G1_MODEL_ID_NAME(dt_id));
>>>> +	if (version->id != dt_version->id ||
>>>> +	    version->color != dt_version->color) {
>>>> +		dev_err(sensor->dev, "Probed sensor version %s and device tree definition %s mismatch",
>>>> +			version->name, dt_version->name);
>>>>  		return -ENODEV;
>>>>  	}
>>>> -	sensor->id = id;
>>>>
>>>> -	ret = vd55g1_read(sensor, VD55G1_REG_REVISION, &rev, NULL);
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>> -	if ((id == VD55G1_MODEL_ID_VD55G1 && rev != VD55G1_REVISION_CCB) &&
>>>> -	    (id == VD55G1_MODEL_ID_VD65G4 && rev != VD55G1_REVISION_BAYER)) {
>>>> -		dev_err(sensor->dev, "Unsupported sensor revision 0x%x for sensor %s\n",
>>>> -			(u16)rev, VD55G1_MODEL_ID_NAME(id));
>>>> -		return -ENODEV;
>>>> -	}
>>>> +	sensor->version = version;
>>>>
>>>>  	return 0;
>>>>  }
>>>> @@ -2048,8 +2085,9 @@ static void vd55g1_remove(struct i2c_client *client)
>>>>  }
>>>>
>>>>  static const struct of_device_id vd55g1_dt_ids[] = {
>>>> -	{ .compatible = "st,vd55g1", .data = (void *)VD55G1_MODEL_ID_VD55G1 },
>>>> -	{ .compatible = "st,vd65g4", .data = (void *)VD55G1_MODEL_ID_VD65G4 },
>>>> +	{ .compatible = "st,vd55g1", .data = (void *)&vd55g1_versions[0] },
>>>> +	{ .compatible = "st,vd55g4", .data = (void *)&vd55g1_versions[1] },
>>>> +	{ .compatible = "st,vd65g4", .data = (void *)&vd55g1_versions[2] },
>>>>  	{ /* sentinel */ }
>>>>  };
>>>
>>> All minors
>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>
>>> Thanks
>>>   j
>>>
>>>>  MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
>>>>
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>
>> --
>> Regards,
>> Benjamin
>>

-- 
Regards,
Benjamin


