Return-Path: <linux-media+bounces-65014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x2ZAEohGMWqwfwUAu9opvQ
	(envelope-from <linux-media+bounces-65014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:50:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A57868F988
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:50:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=UjkwBFCH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65014-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65014-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0ABD3007AE0
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 12:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB32C36A004;
	Tue, 16 Jun 2026 12:50:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522A5369234;
	Tue, 16 Jun 2026 12:50:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614201; cv=fail; b=p7ZH14iOd/jIsWeLpcQbDGPykPY6s+xKj0jzJmCMpusBZnnsOxEXFHLoLMIu3KBG3+Gd03NMUjyftpRJtktj/YrElKCDP6JKTGVxB7KQ+SEACfd8OO2Lpjaz/IfwY30y11dv0LHCga55ooQ4L7YJHvu6ycqUsr1p0StxpQg/H/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614201; c=relaxed/simple;
	bh=bTwQNugrjDaGkIbXPzwnSQfZ431yF4tX8xt3x+x1ZkE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=VzPIf3+4a942Vlnq2A4dGOMog3qMeJVpKDwpfpS5lVQ9I8PNHKpnQ6P+Csl2ODOX1PEeUJu5B6tkn8ZY8GvZw+S6vMMfEKA1ottRcj35fR2PF6BaYqIRaKRRgKkuL/U6Suqw2aGLkIj+MS/QwRVMRDBpNKQneRYwvAf/Tu72/mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UjkwBFCH; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwKEcAc7DCW2td/Wu9rpolhValdSztw59g9LinVe6jDq9PpLyF+f2P/RB8FWEHoClMLdpudcmTB7P6Vvz4B8lhO0s06X8KRCX5xGRJgu8u4fLmg3cLdy7i/zhyu9I4wNDDm+eJywkk/dFJLnvrI/3WBa1vSs4A/enqTDAiOd3eM0rhopgjzAE5Oq3aUJ00BEXULt5GW7klY9V+EXvtimXxjHszkvSIX1ko/YsTjWXqWBBteUQvEG1hO9FuR83RGIO/RcTVGZ7pUcCjh24Z5jAQi22PH8cGpZVOCrXIyr9ZJ+b6CCdM9fLdyI5Ggmauj2UAy383v7OHT5d8TCYrIZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARtL5GpDZXCklftGcgPhCYMNfTRiey75pCZCu9BB028=;
 b=f1TGN7IC8FGqfvPAWeeavPyb3KSD26irCdSWt2iWg9yKWZMTkygw7Nw5F5G3bJvW1CoiFxGmLLUpIEK7VlyX8V6iUJ/BD/0OK4KhoV6wNNvdbdkwwIuQcBjnvFWYvK6kFqIDuH5B3ePeGK60pGPfeq+7mYt34TaB2W63iCtYTeRKbM8VZVBscvxQ7mPefMBQDzlxMUb/XQJE74qEr2NlrBnmeblF86rRrGSudmNqcwfqzworfO6SpZZJ42NYgh+Xg7DqytenGWjvTtrcnNaMAXSPeagyC6rZLlTWSgJ90fsx324hsx/o1xZWMnA7E/d/RfUEBtdNhuBHwiwhBJ6KTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARtL5GpDZXCklftGcgPhCYMNfTRiey75pCZCu9BB028=;
 b=UjkwBFCHBLb8sOpvjFfmormSEHkMfaKrgoD6I17hiavCGsDwzsyZJ7Tdgfa/7ZLnppHf4eji5DVFAo8dN0WYuUvoPiW1HhlPVAWmhuUXbMMNh9JMcwr+H/On37vPIHtrgkRIGVIqa3tgXo3Vr2ipkc7eqxW8Nv6KXvd0LqJ/8OqlRGEhsIpbc4yXuEhR2ehDY2F9JKlsPJB7qxW7+o1bKl/dTbdB4gImq51a9Caa9Q1FNAWTRBFdH++GrHnTTEU6CF1gfBmz+ydUhJnZmaQSgA4mN93QwTwkSwjSsvJK9dM9iXni76aID06m/IrLKxx8DWlwfrcnLX1GWtRDMDctIg==
Received: from DU7P250CA0023.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::11)
 by MI3PR10MB9922.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:74::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Tue, 16 Jun
 2026 12:49:55 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::82) by DU7P250CA0023.outlook.office365.com
 (2603:10a6:10:54f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 12:49:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 16 Jun 2026 12:49:55 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 16 Jun
 2026 14:54:09 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 16 Jun
 2026 14:49:51 +0200
Message-ID: <c9c20bce-a1bb-4932-bfa0-c87f7156ff82@foss.st.com>
Date: Tue, 16 Jun 2026 14:49:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v2] media: i2c: vd56g3: clean up subdev state on probe
 failure
To: Myeonghun Pak <mhun512@gmail.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20260424165238.31333-1-mhun512@gmail.com>
Content-Language: fr
In-Reply-To: <20260424165238.31333-1-mhun512@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|MI3PR10MB9922:EE_
X-MS-Office365-Filtering-Correlation-Id: d29e93a7-c982-4edd-bd43-08decba5c44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RMuIDFrbNpBBuY0GfpVAiFOTd0GJt7S5T0EDWyJppdrHZEK+PPiK4ZQ49uxczW2FKMy6QAfmf6lF1n4Ut1gQhODsHQrBv1B3cGM1ezNW6daV/zRvSlDS7kj7wtdmcdorh/n5g5F/AlQypVGDi0aBc9HWankgLxP5PLjrshsC+flh81x7OPAW2XnmM8PBlhV5e9lYT2iisNx6EUdjck8ccIGAjl2pdrGiD3dqDE+NMTAOktI+Zb3GJURz/Tt4sEQbF0wqt8rcWhwRUiZV04Pw23aWAET4ptj/lY27xD2sr0sgdmsVp2XOo0unMHcOuJIv4njdno+GpXNM24G2lCriY3JjvbxIlb43tS8bbke08U3u6ZIhMRMP3ctUjUWoNBEL49dweNRIoDHPkIEpOABVRKqqtpR3ZbdLY+6H+doW5BBlMMnhzGm1YELE3WEs6lQrR2GzRzjJLiJM/WqAW5zRR4WInebTVu1qM49Mqry0Xejc4mdiZfE2KOROeko0/gCaKjSuAN+EBuD9sFT+C9mrQI7cPdhkiof1EKKCmIvg1nwaX9YEQHNTCsFcuiB97biAHjRJjpVi2hYdNbslEib78i8N7biybYzlXnEd/CbSkIM3GyI13HDLfl1kG0kc2TG8rbk9548AhVJcWGU+upIGZUJr55Z47pD7ayOdYb/GNA7b1Q4qazuySVOvuk78uORvlHx+wA8Q0gLJhQSMOMLFffEYK6CMgNCAXp6EYF5Xnug=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zZk0RT6Ksol+ruMo3fb+5wz3iYomibOPikqoCisMaA1FI7Ncpi6ioXfFdjrTAtkddUGvy2CRNIcrm/vZ94zWStIK4JDKyBP9GHCMspqW1x4qWNAa2omvL81oV5huHQUsvyX4lBQdUSiF+Cvgs57dAUKE2CQ33Ew83dUKpYlo+zU2wO2Oz0bOW3UuumrTsJDlUS9EK/s+9LlQOTGPeAWFrP05cHP+uFKMu9eH4ACC8ulZxWg0zpXgAND97NA3+T2lcCzjZBUUpXh3enF8mMWZAFmF7Ac97qowD+QdwMChJrmN5xOEz60B0Km3dFHCI92EbULrFI70tEtOJ7V6sh6DcqAXllXXnrQL2n98b81es60te5JLYL2DCI+VR2ibRuxwp4z6W4Cl5AdEz0TOGYPLhYkDroFpiTeO3hzQYeIxBYB7eNXKfQVLz5+/WGfo4RA5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 12:49:55.5539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29e93a7-c982-4edd-bd43-08decba5c44e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR10MB9922
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65014-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mhun512@gmail.com,m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,linux.intel.com,kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A57868F988

Hi,

Thank you for your patch, and apologies for the delay.

Le 24/04/2026 à 18:52, Myeonghun Pak a écrit :
> vd56g3_subdev_init() calls v4l2_subdev_init_finalize(), which allocates
> the subdev active state and requires v4l2_subdev_cleanup() to release it.
> 
> If vd56g3_update_controls() fails after finalize succeeds, the probe error
> path currently skips v4l2_subdev_cleanup() and returns an error. The driver
> .remove() callback is not called after a failed probe, so the active state
> is leaked.
> 
> Route this error through a subdev cleanup label before freeing the control
> handler and media entity.
> 
> Fixes: 87aa97fc3157 ("media: i2c: Add driver for ST VD56G3 camera sensor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v2:
> - Use a lowercase subject summary.

Please keep the first character uppercase, just like other commits on
this module.

> 
>  drivers/media/i2c/vd56g3.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
> index 157acea9e2..43f792288a 100644
> --- a/drivers/media/i2c/vd56g3.c
> +++ b/drivers/media/i2c/vd56g3.c
> @@ -1427,11 +1427,14 @@ static int vd56g3_subdev_init(struct vd56g3 *sensor)
>  	v4l2_subdev_unlock_state(state);
>  	if (ret) {
>  		dev_err(sensor->dev, "Controls update failed: %d\n", ret);
> -		goto err_ctrls;
> +		goto err_subdev;
>  	}
>  
>  	return 0;
>  
> +err_subdev:
> +	v4l2_subdev_cleanup(&sensor->sd);

v4l2_subdev_cleanup() is already performed in the caller (i.e.
vd56g3_probe()), but as you noticed it is not called from this path. I'd
rather have the return value route correctly through
v4l2_subdev_cleanup() in  vd56g3_probe(), allowing to keep a unique call
to v4l2_subdev_cleanup() instead.

This patch looks like is LLM generated and sparks my curiosity. If so
you must disclaim it using an Assisted-by tag [1]. Sorry if I’m mistaken.

[1] https://docs.kernel.org/process/coding-assistants.html

> +
>  err_ctrls:
>  	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
>  

-- 
Regards,
Benjamin


