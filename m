Return-Path: <linux-media+bounces-65902-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v0tfC2hSQmoW4wkAu9opvQ
	(envelope-from <linux-media+bounces-65902-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:09:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC46D9348
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:09:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=mzFw5iGg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65902-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65902-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39A0D30292DB
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70E536C581;
	Mon, 29 Jun 2026 11:09:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012038.outbound.protection.outlook.com [52.101.66.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E536C9DF;
	Mon, 29 Jun 2026 11:09:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731346; cv=fail; b=dPIUfZfCdMVZEobss0Wtg35WPDRA+lXjwmXM9Xj0fmNk7kmgoVBkzE/AKBaxH5bYYV9ys6vgXt0cvZZS6tUHUaWXmIpXL3Aen8Lobu8Pnybe9vEoApctcaKc3E5sLJFnV5KRXs7YinCTmZklg6M44ns4gm4B+rjCJPOgPNQzqmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731346; c=relaxed/simple;
	bh=zoMbyNkH0VN2qIuO/KFHryNDB6/w6KCPivP9PhvRPkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F+dtljAHuGB1K9WtjPbvY1LriVbI79CvlqSbWOtCVk2uSDMqIW64+IorigrawFntScCncNNlPMtvPRhf23o0p0B8TTx6cTXLoaw6z5RUHnndEiVEV/zG4yf6IPqSElVxzyO1mRHj8iPxA2ZVk4nts4vXf54Px68+St+nLq7FBs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=mzFw5iGg; arc=fail smtp.client-ip=52.101.66.38
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiyIghVck3L+99HE2tZ11C9tNHVWlrF2GiwZKdzwZ8lrAhrHtfk9KNrIu7hm/0o9w+9yxmZ1AAjLNLgZE9oMUKjBMpFUk4e6VeRHW4TPJd+ZMdPE1YOgEDrjwx5yhUo6iizKzI0zVstnjkVDA7iFw84tHf0Mh4VM/tMgkxb6YF4PrDwLF8whNOSMIj0AvEWA7wjEj4Sz+jkhPEfwCTm4ggHXvjzanTZ56cSsvKsrAExFOFJ3Wza6wpnoR6lY4q/NjtryN3WcGopx5zAy69H2kIk4IVcdypmaKLBM0MrxG8qQYTbsinZZcfuQamPmBCDTDZAuf5CK6+s4GkylGyvSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdYmzlinQrOTdqaXFcBZMTxHGZG54UUEXBcCcFY64eo=;
 b=P62jiVnVnmsyfUQTgJHvw/Bkx8+cjaypQMSa5hgS74gjMlc+m6NiftRAeKM08Ea8dL9pT2UPLxQTIpH/MHDj/CqSiC0+2uXZpsnsawOjHJKQ0W8yMuzx4c0P6PtuhNh9EvCpz8O/7nlGgygWeV3i2bK5ZkUgxGZn5tMclx7phdVIAkmdXxr4Vgp3VLFrvVUJcO0WTPGghhd5Tf9Rk5aW5PTcku2rcKOxl5YtGR0TxWosAyPv1swHYMvbZdDyqBd59Klr8d+Se30oKLsgjQzabrE9caxVKU4gSfiYhNrdGaE+jaE/qa9L4IJfy+qWXr+HMbz6zjPmWwmROa9qINts6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdYmzlinQrOTdqaXFcBZMTxHGZG54UUEXBcCcFY64eo=;
 b=mzFw5iGg/j4eguGMxPV1HxAChkGLp7COImodjkNjwHEW3fVwn7olohPJ+1JA31SmDTgg2bLnEuBvW6Cxi5NWCvk8p7kHhww0L/of0WvtdRaR/rv3TTaPDtSEzUBsNQ6CcBbims+QLhTt+PlZOcAqIR0zMkl8CKYNDt1jv4Ja6JaQWcUdAb83OIh6MdORsPHdw9QXjenKTfkzsL4jrGSsVCuPyns4TVkLipEnegYlwWPQk7MsEs6AKIJQuZFr9Scmpvb9P/fW29Os7Tawqpo4KO/ZBlGp3Aq/dcwrvGnhQ1bSc7qrEvQFev1Bm8628OvYSqW1jxGUo6kE5rGwtSJNpg==
Received: from CWLP265CA0462.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::8)
 by DB9PR10MB8194.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 11:08:57 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::27) by CWLP265CA0462.outlook.office365.com
 (2603:10a6:400:1d4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 11:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 11:08:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 13:13:40 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 13:08:55 +0200
Message-ID: <591573d0-587a-4a27-9bef-c707de177a15@foss.st.com>
Date: Mon, 29 Jun 2026 13:09:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dt-bindings: media: i2c: Utilise
 video-interface-devices enums
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi
	<jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su
	<jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, "Mikhail
 Rudenko" <mike.rudenko@gmail.com>, Daniel Scally
	<dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Paul Elder
	<paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, "Richard
 Acayan" <mailingradian@gmail.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Frank Li
	<Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@ew.tq-group.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
 <20260628-kbingham-orientation-v3-3-4ed92968aff8@ideasonboard.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260628-kbingham-orientation-v3-3-4ed92968aff8@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|DB9PR10MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 151b6c1d-2265-4ada-cf64-08ded5ced0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|36860700016|1800799024|921020|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	fzwuTA/hR0qRVwMHz/Mt4DJWaMSwl9xyQyKjQ83QwfOzMJdrmZVO12UZoa3kXtEmsAOwz45PeB0j+rEygWWzlj3/aMbxgwKf4jXa4iptkCksBLHNwCNFtQQTDv9KOp4jhoY7qQBxCtI81TfQejiGkoUjFINoJpGOn2YFOFGparvL9UcOaU195pfszB+C+obt1GgCTrDYtxInhG7xuwpuJfnyhsDWCXaCGQRiN+Fm+8eQ9fF0H4FfX7ZXcEd0N9dZ4EyfQHH5jt9WeyZEVsD3ASJad1SUrmwUesbOqDFbrsLwdaUh9jCMAT1/ZLsBDDrpwjKWIKzUkbKO4Bs+TC+9XLpx+bgKk4XJertj8NMCKhX/UIj0oqcL2HCP7RiPzjpqFXv2xqVJwrtX+f7Ktm66r5WZjTOUlGVqHLujgM2KjYFb5Q6LBYP8Tn8T8xKeEWICtZ8Hx6kxxxsnXE4pXiiVQEWfhre5kiPxrbzS9sXm6+juUx4BZUr85vYvSEtAKcsIN36OpL880pOdnKumFaNTbdKGriPn0w3K1gIHTUqus1c2Ods2dQMK66SHkn/sj19Wm+Higm5GSHUOqynDuFE0KG916t9TM5GD/ziaAX1CJqo2zUZh/hZDhpDBWClxWAdMGrgPrITbHqYE1eJKtXS9CPbyCsGi5Z4F2fgYkvzLEWIE/7KSmDWykChyjyETvol7YcURutr1GEV/1orUrAtUpq+tZwgKjyHieWyQfG3hBZ1kKqO95K4JBnC70RrPoCft
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(36860700016)(1800799024)(921020)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mDPCMtK46muHjsK9RAN5F/4rQoBTq0fV/q7IlGIM118FfKAKpHsPmYgz6gyA5IRZCl14glTL1qqIF6T1a0Y0zk+CRedZPNgdPc4uUSJnkJa4Moqt2LYOSr4ocEv5X4U6k3cg8h5F/srN7EcPywlF+i/GVKn77vw66vKVCu/VC16IdCL9d4NdBqcmH4Ghsh/YEE9fhWS3c8EdmvhruiyV6TbXZlF4cWVugTvh65gAECR6gwBgBVUi0fZjkE5tP1nSrCZyRAbFZ56VCodBimMVMOpAu7Q0cOpA4p9Ft8a6mEqLmussni9I4ax7kBr6lQx4xcnLHB0NxYqGvdGsIZgG9UAP+23r8Y99jf6ZpuazfytB3TfPPAtQLwh7kI2b84Lp5v3TmwdLRjNtFpyd/XLpnz8BYnuokyAEfsTUBrmSTxvRtWZEnDiEIzyYR7aZw+kl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 11:08:57.3892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 151b6c1d-2265-4ada-cf64-08ded5ced0b0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65902-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux@ew.tq-group.com,m:imx@
 lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:vladimir.zapolskiy@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime,st.com:email,vger.kernel.org:from_smtp,linaro.org:email,ideasonboard.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CBC46D9348

Hi Kieran,

Thank you for this patch.

Le 28/06/2026 à 12:22, Kieran Bingham a écrit :
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the existing examples throughout the bindings documentation for
> camera sensors.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml  | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml  | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml     | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml     | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml | 3 ++-
>  12 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> index 1a57f2aa1982..b7bc6ba26e6e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -86,6 +86,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -102,7 +103,7 @@ examples:
>              vddio-supply = <&reg_camera_vddio>;
>              reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
>              shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>              rotation = <0>;
>  
>              port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> index 6f2017c75125..b9c61395b24f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> @@ -69,6 +69,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -84,7 +85,7 @@ examples:
>              avdd-supply = <&ov08d10_vdda_2v8>;
>              dvdd-supply = <&ov08d10_vddd_1v2>;
>  
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              rotation = <0>;
>  
>              reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> index d96199031b66..fcd617848ce3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> @@ -96,6 +96,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -114,7 +115,7 @@ examples:
>              powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
>              reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
>  
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              rotation = <0>;
>  
>              port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> index ad07204057f9..6df62fd0c0c0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> @@ -85,6 +85,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/px30-cru.h>
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>      #include <dt-bindings/pinctrl/rockchip.h>
>  
>      i2c {
> @@ -108,7 +109,7 @@ examples:
>              dovdd-supply = <&vcc_2v8>;
>  
>              rotation = <90>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>              port {
>                  ucam_out: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> index 3368b3bd8ef2..5732657e1484 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> @@ -103,6 +103,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/px30-cru.h>
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>      #include <dt-bindings/pinctrl/rockchip.h>
>  
>      i2c {
> @@ -126,7 +127,7 @@ examples:
>              dovdd-supply = <&vcc_2v8>;
>  
>              rotation = <90>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>              port {
>                  ucam_out: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> index 2b6143aff391..24787c9aa155 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> @@ -72,6 +72,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>        #include <dt-bindings/gpio/gpio.h>
> +      #include <dt-bindings/media/video-interface-devices.h>
>  
>        i2c {
>            #address-cells = <1>;
> @@ -87,7 +88,7 @@ examples:
>                powerdown-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
>                reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>                rotation = <180>;
> -              orientation = <2>;
> +              orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  
>                port {
>                    endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> index 20f48d5e9b2d..56fb5f18f07b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> @@ -69,6 +69,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -84,7 +85,7 @@ examples:
>              dvdd-supply = <&camera_vddd_1v2>;
>              avdd-supply = <&camera_vdda_2v7>;
>  
> -            orientation = <1>;
> +            orientation = <MEDIA_ORIENTATION_BACK>;
>              rotation = <90>;
>  
>              nvmem = <&eeprom>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> index 6050d7e7dcfe..b4a88eaa7ef2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> @@ -74,6 +74,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/qcom,camcc-sdm845.h>
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -98,7 +99,7 @@ examples:
>              pinctrl-0 = <&cam_front_default>;
>  
>              rotation = <270>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>              port {
>                  cam_front_endpoint: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> index 7c11e871dca6..69a37ff68db3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> @@ -86,6 +86,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -98,7 +99,7 @@ examples:
>              clocks = <&clock_cam>;
>              dvdd-supply = <&vcc1v1_cam>;
>              lens-focus = <&vcm>;
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              ovdd-supply = <&vcc1v8_cam>;
>              reset-gpios = <&gpio_expander 14 GPIO_ACTIVE_LOW>;
>              rotation = <180>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> index 060ac6829b66..db9f0c15576c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> @@ -105,6 +105,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -123,7 +124,7 @@ examples:
>              reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>              st,leds = <2>;
>  
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              rotation = <0>;
>  
>              port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> index c6673b8539db..48db22ca4a7e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> @@ -107,6 +107,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -125,7 +126,7 @@ examples:
>              reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>              st,leds = <6>;
>  
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              rotation = <0>;
>  
>              port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> index bc339a7374b2..4a66cb711372 100644
> --- a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> @@ -173,6 +173,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -196,7 +197,7 @@ examples:
>              vddgpio-0-supply = <&vsys_v4p2>;
>              vddgpio-1-supply = <&vsys_v4p2>;
>  
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>              rotation = <0>;
>  
>              sensors {
> 

-- 
Regards,
Benjamin


