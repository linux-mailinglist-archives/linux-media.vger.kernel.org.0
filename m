Return-Path: <linux-media+bounces-65633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yytUNzoUPWriwggAu9opvQ
	(envelope-from <linux-media+bounces-65633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:42:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D026C5384
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:42:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=RetEWo6l;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65633-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65633-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F141304972E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 11:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988693DC4DC;
	Thu, 25 Jun 2026 11:42:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3E63DCD94;
	Thu, 25 Jun 2026 11:41:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387721; cv=fail; b=eOEfuqa9qIOoi/hhvCc/BGjeBnrVou8cCTxIlM43eik7Wms5GdotNrY18DdDL+hq21Ev2wtclkWx4ZvBnY/sPRNlKBT1OqyBQWk2x234rL18pwIjcbVv2MrSjlFOtv2LsnlLWIp0IvEWRHkRw90dDgSj6XzKVTK+m9AB8LF/bzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387721; c=relaxed/simple;
	bh=2o0ogw+nZrtLEQ2oOrSgEcOxjIrNj1+hDWcpZ57QUhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BfDpHQxmKzmJ1o1c6y6P1cJ4zPa39+HF0n7ITNTXGwm5b7cysFNE0jdO9YR0Ma+hIhD2lyp/pB6whg6ulzsQ1DhwynksvgLz8vQNAg01qQfebIXcLK0n8Of7qB+Icy9FYrOiMDDI+jDi6QwqVe9NqI0GI/Cut7aaoK0elle3CZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RetEWo6l; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJxe8ZCXn9iG/DAGGG2a1HVLczeMe5bbTIFe2KJrp0I9rWuM9+UXQZkNx+iyIG/lyYSRDHHqABXkJJuTkqgREdFLtcxqdX+VqroefXCA1Npa0Y9oQCfp0ZMoBe2qZA9VNTFdpYT0YN3Lr1TFJ2SkyZIrgMt7Tn2ylhr1CYzBrgj6wgOTsQzt27OI6JvdcJvbb7RbsO8MHZLBU43BJq4Lqj8ol1gB/tJmF1nqjIc16tmcKrZx6wz2iptUy29zwu6max6KLUNR0fm9dJDiK8/lmx8kbBt7YBaNjquD8dU3JcviVp1QNorSkiGKdi3VYUILqtU0pAR3225yffdvASfEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ee8LylDR5clcxTSkxhWV1yKQIMRkliircbhPLv5q8I=;
 b=i5H9TyxJkD36+gkahXyIMgdogoBOSkiWR3VFvopJKa2XQobZqO3viFH6kpx+e9XJb6vXBLSy18amaOMgQEHumNCrWlp8P9U18GWyC1uFEei+aTF+7gENe+Vx3qrLapRpjnDwU4s37cEgrX2gtXnlJ3k2RQpUKp56VkHcyf7MQ0DU5nftfpvoPJIXXdd90qhaL4pT7lV8t2XsnCPnzZOKrea328zpaxLEIDe9fThOTnn4DLH0yn3XSwylP/iGxgRw08350icZXrGK50jJIVUGyqFv6vqFK4Nr79UFp8Igjjj1iP33ZDO87jKXr0HgupVR6Q2ntGADCH0wWGyPxzuJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ee8LylDR5clcxTSkxhWV1yKQIMRkliircbhPLv5q8I=;
 b=RetEWo6lItrB/cvCKLz3Ow3y+1VjPwYA90ataawPr5jDKznw0N5ifngIv1Kx8vpM16rt+HxqE95nC5aEn3sA07tYZK5X8wrBinn2dArVuBf/ZRt84NEtK7QgE21EQR7ReA34ldkPxjqb8Q7Y7I8dkMAV6LQyccztebFIa6jweK/Y0R9pNj0mHZ4b89FWx2xAbusnbLlDc8XhbDuJksbbMc/ym4MNh44y2ZN0LzclojmLKf4H3FW2nB49HoNt7SUhQVwD7kJCjttiY5Xcej8aJAujk1TOd+Ambkn5IHoGzY9jiHNbgk1ZaBOqoRm+3JR91B0rO64Sa0IxXMTI/yGz0g==
Received: from DU7P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::25)
 by DU4PR10MB9808.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:632::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 11:41:55 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::99) by DU7P189CA0011.outlook.office365.com
 (2603:10a6:10:552::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 11:41:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 11:41:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 13:46:35 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 13:41:53 +0200
Message-ID: <68d276f9-e688-4736-a296-f56c5aaa4b77@foss.st.com>
Date: Thu, 25 Jun 2026 13:41:56 +0200
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
 <ajkKkSeDNoijIsub@zed>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <ajkKkSeDNoijIsub@zed>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9D:EE_|DU4PR10MB9808:EE_
X-MS-Office365-Filtering-Correlation-Id: ad973326-af1b-4d0d-f96b-08ded2aec1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|18002099003|22082099003|11063799006|4143699003|5023799004|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	ogFm7IOsl0y9zdZYJQZ1Lu0MsLQgLy8QFEi3M8AgczEW699wpf9/sWvimV2YtX3b+jjK8nYrHZrqbhI9q3thd7GFXiL/4Ohq7Ujz2vnZ4ghB4lMGZS5hatHks3NYvJEf5sqR2L+aixQjowo9wyUms2Px295xy34JKfiHysajHrK+tat5IH0cv1cFGQ7g8P3zcqftUKK2XA1TX+HXyIq4CFrNEA0AFQFCsdaLj1NexyaI2jzTlQ9MCyMxklRK+DtNFBSp/zq7fpYu6efijIWrybD15U3vLSKsbqDt4cpMXyiKY1j3420e1ErG2Ichgbf9nmulsW4MkZvlYq36OX+YDtp1AAdJXUvFM1qLEt0FAWiWjWWSXMwkuHXlN/lFrKmAhW2F0RLblEuoimu5VeeKljtQ6gJmMmGefdm9QmH6GoTT8X+OmCo4/GV+OzIKfoFR0m0pPpDRBwOObrlJ/VHiEN3qIXHzd2yPUeka/xPE5ICWRZQV8CVaHRw86tGuL9+VpsNHiJ3U/8cqrpi0DfL5Li/QzHjVEZXdxLQ/yDMnDsJwlOcrAHdj6C5loC+7HTIPYkQ0j5hh5Asi0q6sCC03ilr7IPp55Ks70s9Q/rSNImpknn5qGTPbuch66bLpvOY5wB/IrgQwpcwH1kb98loYdlC+b4bzJS34NxjuSo+8p7JF7kg4Isg15NArx9FtN+P/esPLCoPKbRje/7qzRDs4OQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(5023799004)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UN4Lr/2rS4GgUvtuiwpBe4NG+Q6CsZU9jaRQB96GcAv8KsY6ylcmOx/fItO6zSWC3WodMzgEQ+34OcU+HXBkEJXCuWPH2XaKZS9O+MhZzt95duTX0etxYwYppXZkHgDVQSMWNwbSSMF3ptX7ORFQPSb+auz5rvby74PJjxxIU8deCdMv1cwuSos53CFefewK3Ma2trZFsWrqAxK5GCClMecOqrBQB+tyv+gGyzc/9V5lsxOqojV8cE3fpBS4OPr6iKmugLFRQorcbHO9OwNm43SlAP3YE093XEhDpsFbZziL4Cv0+QRUtBAgmWIqWsCenrK2UWRamKC2JRQTgGu60bDdQY/l7jJ4mwJBCMXISgyjYXMPFwZTYPq0dXVJ/TJuQYIv9ORyOr3l8NQNTR+0O4P9uTBUx+5nRtB1vLoT4NuBOku0CLRc8fTOF4K3ZmaG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 11:41:54.9085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad973326-af1b-4d0d-f96b-08ded2aec1c4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9808
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65633-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime,st.com:email];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72D026C5384

Hi Jacopo,

Le 22/06/2026 à 12:16, Jacopo Mondi a écrit :
> Hi Benjamin
> 
> On Tue, Apr 28, 2026 at 10:40:58AM +0200, Benjamin Mugnier wrote:
>> vd55g4 is the same device as vd65g4 but outputs in monochrome instead of
>> RGB. Adapt the driver structure according to this new variant, and add
>> its support.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  drivers/media/i2c/vd55g1.c | 110 ++++++++++++++++++++++++++++++---------------
>>  1 file changed, 74 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
>> index 2c962fcb41d2..9f62fc0428a1 100644
>> --- a/drivers/media/i2c/vd55g1.c
>> +++ b/drivers/media/i2c/vd55g1.c
>> @@ -29,11 +29,7 @@
>>
>>  /* Register Map */
>>  #define VD55G1_REG_MODEL_ID				CCI_REG32_LE(0x0000)
>> -#define VD55G1_MODEL_ID_VD55G1				0x53354731 /* Mono */
>> -#define VD55G1_MODEL_ID_VD65G4				0x53354733 /* RGB */
>> -#define VD55G1_REG_REVISION				CCI_REG16_LE(0x0004)
>> -#define VD55G1_REVISION_CCB				0x2020
>> -#define VD55G1_REVISION_BAYER				0x3030
>> +#define VD55G1_REG_COLOR_VERSION			CCI_REG32_LE(0x0670)
>>  #define VD55G1_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0012)
>>  #define VD55G1_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
>>  #define VD55G1_REG_SYSTEM_FSM				CCI_REG8(0x001c)
>> @@ -138,8 +134,39 @@
>>  #define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
>>  #define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
>>
>> -#define VD55G1_MODEL_ID_NAME(id) \
>> -	((id) == VD55G1_MODEL_ID_VD55G1 ? "vd55g1" : "vd65g4")
>> +enum vd55g1_model_id {
>> +	VD55G1_MODEL_ID_2 = 0x53354731,
>> +	VD55G1_MODEL_ID_3 = 0x53354733,
>> +};
>> +
>> +enum vd55g1_color_version {
>> +	VD55G1_COLOR_VERSION_MONO = 0x0,
>> +	VD55G1_COLOR_VERSION_BAYER = 0x1,
> 
> nit: you don't need to initialize the enum members here

Thank you, will do.

> 
>> +};
>> +
>> +struct vd55g1_version {
>> +	char *name;
>> +	enum vd55g1_model_id id;
>> +	enum vd55g1_color_version color;
>> +};
>> +
>> +static const struct vd55g1_version vd55g1_versions[] = {
>> +	{
>> +		.name  = "vd55g1",
>> +		.id    = VD55G1_MODEL_ID_2,
>> +		.color = VD55G1_COLOR_VERSION_MONO,
>> +	},
>> +	{
>> +		.name  = "vd55g4",
>> +		.id    = VD55G1_MODEL_ID_3,
>> +		.color = VD55G1_COLOR_VERSION_MONO,
>> +	},
>> +	{
>> +		.name  = "vd65g4",
>> +		.id    = VD55G1_MODEL_ID_3,
>> +		.color = VD55G1_COLOR_VERSION_BAYER,
>> +	},
>> +};
>>
>>  static const u8 vd55g1_patch_array[] = {
>>  	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
>> @@ -535,7 +562,7 @@ struct vd55g1_vblank_limits {
>>
>>  struct vd55g1 {
>>  	struct device *dev;
>> -	unsigned int id;
>> +	const struct vd55g1_version *version;
>>  	struct v4l2_subdev sd;
>>  	struct media_pad pad;
>>  	struct regulator_bulk_data supplies[ARRAY_SIZE(vd55g1_supply_name)];
>> @@ -628,7 +655,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
>>  {
>>  	unsigned int i, j;
>>
>> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
>> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
>>  		return code;
> 
> As pointed out in the previous patch, you seem to have 2 mono formats.
> Is this still ok ?
> 
>>
>>  	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_bayer); i++) {
>> @@ -1183,8 +1210,8 @@ static int vd55g1_patch(struct vd55g1 *sensor)
>>  	u64 patch;
>>  	int ret = 0;
>>
>> -	/* vd55g1 needs a patch while vd65g4 does not */
>> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
>> +	/* Version 2 needs a patch while version 3 does not */
>> +	if (sensor->version->id == VD55G1_MODEL_ID_2) {
>>  		vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
>>  				   sizeof(vd55g1_patch_array),
>>  				   vd55g1_patch_array, &ret);
> 
> You might want to consider renaming vd55g1_patch_array ?

It doesn't really patch an array, it writes an array of values into
continuous i2c registers. Just like before converting to cci_write() I
used to have a vd55g1_write() function to write a register, I derived a
vd55g1_write_array() function. Here it happens to be a firmware patch,
but it could be anything you want ;)

> 
>> @@ -1256,7 +1283,7 @@ static int vd55g1_enum_mbus_code(struct v4l2_subdev *sd,
>>  	struct vd55g1 *sensor = to_vd55g1(sd);
>>  	u32 base_code;
>>
>> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
>> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER) {
>>  		if (code->index >= ARRAY_SIZE(vd55g1_mbus_formats_mono))
>>  			return -EINVAL;
>>  		base_code = vd55g1_mbus_formats_mono[code->index];
>> @@ -1372,7 +1399,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>>  	if (ret)
>>  		return ret;
>>
>> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
>> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
>>  		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
>>  	else
>>  		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
>> @@ -1659,38 +1686,48 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
>>  	return ret;
>>  }
>>
>> +static const struct vd55g1_version *
>> +	vd55g1_get_version(enum vd55g1_model_id id,
>> +			   enum vd55g1_color_version color)
> 
> Should you indent one tab left ?
> 

checkpatch.pl is fine with both. I can indent left, it looks cleaner.

>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(vd55g1_versions); i++) {
> 
> You can declare i inside the for loop
> 

Yes, thank you.

>> +		if (vd55g1_versions[i].id == id &&
>> +		    vd55g1_versions[i].color == color)
>> +			return &vd55g1_versions[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>>  static int vd55g1_detect(struct vd55g1 *sensor)
>>  {
>> -	unsigned int dt_id = (uintptr_t)device_get_match_data(sensor->dev);
>> -	u64 rev, id;
>> -	int ret;
>> +	const struct vd55g1_version *dt_version =
>> +		device_get_match_data(sensor->dev);
>> +	const struct vd55g1_version *version;
>> +	u64 color, id;
>> +	int ret = 0;
>>
>> -	ret = vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, NULL);
>> +	vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, &ret);
>> +	vd55g1_read(sensor, VD55G1_REG_COLOR_VERSION, &color, &ret);
>>  	if (ret)
>>  		return ret;
>>
>> -	if (id != VD55G1_MODEL_ID_VD55G1 && id != VD55G1_MODEL_ID_VD65G4) {
>> -		dev_warn(sensor->dev, "Unsupported sensor id 0x%x\n",
>> -			 (u32)id);
>> +	version = vd55g1_get_version(id, color);
>> +	if (!version) {
>> +		dev_warn(sensor->dev, "Unsupported sensor version, expected %s\n",
>> +			 dt_version->name);
>>  		return -ENODEV;
>>  	}
>> -	if (id != dt_id) {
>> -		dev_err(sensor->dev, "Probed sensor %s and device tree definition (%s) mismatch",
>> -			VD55G1_MODEL_ID_NAME(id), VD55G1_MODEL_ID_NAME(dt_id));
>> +	if (version->id != dt_version->id ||
>> +	    version->color != dt_version->color) {
>> +		dev_err(sensor->dev, "Probed sensor version %s and device tree definition %s mismatch",
>> +			version->name, dt_version->name);
>>  		return -ENODEV;
>>  	}
>> -	sensor->id = id;
>>
>> -	ret = vd55g1_read(sensor, VD55G1_REG_REVISION, &rev, NULL);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if ((id == VD55G1_MODEL_ID_VD55G1 && rev != VD55G1_REVISION_CCB) &&
>> -	    (id == VD55G1_MODEL_ID_VD65G4 && rev != VD55G1_REVISION_BAYER)) {
>> -		dev_err(sensor->dev, "Unsupported sensor revision 0x%x for sensor %s\n",
>> -			(u16)rev, VD55G1_MODEL_ID_NAME(id));
>> -		return -ENODEV;
>> -	}
>> +	sensor->version = version;
>>
>>  	return 0;
>>  }
>> @@ -2048,8 +2085,9 @@ static void vd55g1_remove(struct i2c_client *client)
>>  }
>>
>>  static const struct of_device_id vd55g1_dt_ids[] = {
>> -	{ .compatible = "st,vd55g1", .data = (void *)VD55G1_MODEL_ID_VD55G1 },
>> -	{ .compatible = "st,vd65g4", .data = (void *)VD55G1_MODEL_ID_VD65G4 },
>> +	{ .compatible = "st,vd55g1", .data = (void *)&vd55g1_versions[0] },
>> +	{ .compatible = "st,vd55g4", .data = (void *)&vd55g1_versions[1] },
>> +	{ .compatible = "st,vd65g4", .data = (void *)&vd55g1_versions[2] },
>>  	{ /* sentinel */ }
>>  };
> 
> All minors
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
>>  MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
>>
>> --
>> 2.43.0
>>
>>

-- 
Regards,
Benjamin


