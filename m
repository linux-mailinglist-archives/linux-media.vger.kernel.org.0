Return-Path: <linux-media+bounces-65634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPlkLJEXPWqmwwgAu9opvQ
	(envelope-from <linux-media+bounces-65634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:57:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0858D6C54E7
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:57:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=gh7NtpPT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65634-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65634-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B961E30364DD
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 11:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3BD3D9666;
	Thu, 25 Jun 2026 11:55:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A0839B954
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 11:54:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388500; cv=fail; b=VZclwgwUlDJEW4GoAOZRcBvwR8R9DEcDgf9GmsaZZosxyz4ZPOGCTG05kcEjOcp5JuPA5eF2/1sF80jmCAt0GuWI/lSu8gwv4jeBhhygTaEGqSEYTD9+xYBosVRc+h/jISl2UDDuFKWLv82uSTKRZ2ucrgl6V9SG8PQs47wKXfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388500; c=relaxed/simple;
	bh=dJu3D/P70mImJ9i/4mxHgQyppVWvwkrtwI/FcFqjCg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cKLetaaDA9iVpj5qqYoQwWygWRk3NkRcVt/ASZXrTWutDKRPQDdyK2DCM1ivclRKq8NUR+jJ79aipjcLQguLyXw7A1lz2AJ7HK0ZP4ACtIqO/pFHEQxKl1hp11pxu9Oc0H112UKtJVNiMLECkT7NFI00z4g/Zja0XqYJ62u9RXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gh7NtpPT; arc=fail smtp.client-ip=52.101.72.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKHr0VZLEGI03hjx8OkyMa8f3LlBNRXUZGmE3vf/8CGmaTOEfzu0oIFKv1fOhrWDtWWEk+MbfQu/6PmOn9DIhFvFUHYmc40AlySLpGdbOA6QOfrnuYUBd0rM5LN7eMp9bTdlYW/7f3hHaCyaQDz/ej7FPgzc2of3GuNzQ1XkYq28pEBqGuP3HHAbxfK15VI8i0jwjsIF8niJaj2gqbrPTuaCXagRkhP/vZTFiKTqfwFd+/RxhNNqa/RsYvsZrqi8+2EnA9gsOdtwbwiSZDagwOlVPX2hw301lbkNH5rn1vkwlOtGpKVM5wYNdpOcvLl1LJo7sEuRltDsof1x5v7TAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWu7V6yvbcpyCeA/JVErQPwlME+KvziX5eQwrkZO680=;
 b=KFGPpqJ5m11f8c8GtSKnHDwyl8Lv2HuccLiS2n4c3DoxcJInsPtY61I0LY/I/A+F2BRAC7OiVy5lmeuB0iX3lJACOs9knxUipBcnZEGHrBaOyraVgZJAHnRKanZ90a8vJYIRXjor3xmnL/zNanwgkaa4qXdUGytCMa4R5sJArqsA5b8PvxS0SiTmHqaE5tdqgDKxFM81rxS4mtXwa8tnDc3BykFxkbgVroL3oeZQ3FTtk9j/XCUjfuupp1Il3n+BDB10Nsa+lXBEhiyoP4gu7x9Y9Hvt2SGZ/CqqJSDcEFcRxdsW0vnIxt+kgWo98SDaAAfkoN+M6GkoXnDhJMkjPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=chromium.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWu7V6yvbcpyCeA/JVErQPwlME+KvziX5eQwrkZO680=;
 b=gh7NtpPTiRdmkcCFe0UKpft76G9tOiwwUWf3f8ArbsrwaJHV4ydZoGtvugloz2mXadkWFJHiC3Q1rToukR9bwGeY4oDzxW+un/sDvscfXL9Qjcwp90DynQ0tALofS21SwBFJd437zPJLzQDm7RmJM0UcLN+MQwRoa3DET2WNs8u+2mdj9z9t6eQ2OdySv5RNfN1kSdUW2zEt6XqGwZALI4jJjqpV2jy5TXYs1lOtAgk8//9V0EKIokVTNVBOMjahxBKuoKZMNXKL+W2ItZIcvR1P8at9pEFl+BAo3YUN/tPEIQDz/QYLSIM79nH12Gve3ijc+9PnIwRCCptks4ipxw==
Received: from DUZPR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::12) by AS1PR10MB7617.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:4a1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 11:54:53 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::54) by DUZPR01CA0069.outlook.office365.com
 (2603:10a6:10:3c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 11:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 11:54:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 13:59:05 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 13:54:52 +0200
Message-ID: <4abd3cfc-a31e-4994-b299-adf94c77fd67@foss.st.com>
Date: Thu, 25 Jun 2026 13:54:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH dtv-scan-tables] CONTRIBUTE.md: Add new file
To: Ricardo Ribalda <ribalda@chromium.org>, <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
References: <20260624-contribute-v1-1-696f0220c0e7@chromium.org>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260624-contribute-v1-1-696f0220c0e7@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|AS1PR10MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e66905-65b4-4d4e-80b8-08ded2b09174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ec88YLq3Ip5KyMDrqrsRwLTXUkweFc5cnVaIiz8m9RaWgBUE3BtYbnoUkWu3rK6hmSc5oteNz5MV+falV4LCbB3cHgn+QwlDXvMIJXmvgLlqsM5FXPAPEGye5MxY+QMAHnqru4+kJ6J5+hZFsK4xwJr52JWJaTmtHJ1SqUTEbBYyytJvXC7gAHIthTzblm3xqU0fF7KN5O4vg/kQDa83tIq7zd7SUWqHtUiIh+ASQfS0W27BFCwYakZlOzTf3M4ShQKmqi/txHtE0IZ2KPBBCxap4oYmXuwXiLcEcOouMisq9H5FlHnLX55xE3t5Uwv4kUCwsAtTqFPARDljY/VMoJ+nzMYwn0UDMO0ljwJjSAr6puZUi+YUlyjx9CvXQTzYcM5X5QoU4SdF41CIDDBmSB5RmiWh683qqDS1eNGHZdlUEeQ5n94FwUx71O1sRRVQ/N1XmT6CNTeP4petP6zp8eip4gjjH6RthzGJbwjINn5pTXim9JtT2cjOoMJGCy9Z21Wj9FvqdIymmaKZOyAbvXecV36eyCXYWJWd49ZfOryJ8uAnezbNvcoLyDjIGPwYvhH8oK5AjTRC+bIDaewJL+YgKkDFWRJMF1IxcZwWcwM1ApI6rFQ4gQQxuUg4x8C/qsXiIHX2bqlAHPjsNjCo/Q9l4hJV8BqT6nPy4LuEH+GKub84IKxkjEF+6wM0t4krC8J1/1qi2KTAuzYEzmaf9A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P5Eas6eOzkR7EYdArilTrJf6bnSYS3ALs+Saqr/ijeCdy8C+a03hk4Fv9NYew0X/adOb8HzYK9oPxf7XnkB3aVt7WoogdNvt48PsVD9G/G/gPVJqcL0I9tWj/vl6GqrEWXmYqFX6o6CW+ZxOF72ZNEwD3SXTLIbCzDjsUW+skPw65INa1qiiHl3shWtO5DkNUzQVXRsz86YvsvYlPvB8ya/BJjlSzf426EtvrVFWLpzvXA8PZMZPq63bWyxbdgzHf/SEDL8qZ5WCBX/NanAUctOPQCFwmSzXaK2yoCfSpTcdCBoXkaivbNYCFCWkMjfdexklBU+o1cm8Wj71KdNWjpEm7SzJhPjeilconhFA+zi5b5yZEqbAmYeiVLhrndtrchobVxE+iedFsH9PlAt0Qnas24rtsCTOARLPBXg2KL+90453VRp5GEQnIW5z6cvW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 11:54:52.8502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e66905-65b4-4d4e-80b8-08ded2b09174
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB7617
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	URI_HIDDEN_PATH(1.00)[https://github.com/gcc-mirror/gcc/blob/master/.b4-config];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65634-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime,chromium.org:email,contribute.md:url,linuxtv.org:url];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0858D6C54E7

Hi Ricardo,

Le 24/06/2026 à 10:11, Ricardo Ribalda a écrit :
> It helps the user configure its repo. If they do it, it will help
> media-ci.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  CONTRIBUTE.md | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
> new file mode 100644
> index 00000000..b76b108b
> --- /dev/null
> +++ b/CONTRIBUTE.md
> @@ -0,0 +1,23 @@
> +## Repository
> +
> +dtv-scan-tables official repository is hosted at https://git.linuxtv.org/dtv-scan-tables.git
> +
> +## Contributions
> +
> +Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
> +using the prefix `[PATCH dtv-scan-tables]`. E.g:
> +
> +```
> +git config set format.subjectPrefix "PATCH dtv-scan-tables"
> +```
> +
> +## b4 config
> +
> +If you use b4[1] for your contributor workflow you can use these options:
> +
> +```
> +git config set b4.send-series-cc linux-media@vger.kernel.org
> +git config set b4.send-prefixes dtv-scan-tables
> +```
> +
> +[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html
> 

You can also add a '.b4-config' file to the repository to automatically
configure b4 for this project. While the documentation about this
feature is rather small [1], it exists.

This is used in GCC for instance [2].

[1] https://b4.docs.kernel.org/en/latest/config.html#per-project-defaults
[2] https://github.com/gcc-mirror/gcc/blob/master/.b4-config

> ---
> base-commit: be35975ac877ba020aaf1df4e0e352c9d11ffcf1
> change-id: 20260624-contribute-e8c53522088e
> 
> Best regards,

-- 
Regards,
Benjamin


