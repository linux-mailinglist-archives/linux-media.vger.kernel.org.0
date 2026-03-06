Return-Path: <linux-media+bounces-54819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG6ZAxAJq2k/ZgEAu9opvQ
	(envelope-from <linux-media+bounces-54819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 18:04:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F28225A15
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 18:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4B0F302516D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 17:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF333EFD14;
	Fri,  6 Mar 2026 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KmHgLAA8"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013059.outbound.protection.outlook.com [52.101.83.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375BF3F074E;
	Fri,  6 Mar 2026 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772816607; cv=fail; b=W0vvaMSypE+03NfREYG9K2yLoNfdcFs9n+eFkc5/2z6Z2BmHKb1tAKIO/pgQHdxKqO1LL+dsQxg3PzH8T9qX09rGv3Y8pHsi8kzQScZ3B4ic6yYT3DLIHMVQ99Ms7LhjpTD/KYPLqGMX8P2dIY+8itww1QqMeymD9PEPnFhXy98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772816607; c=relaxed/simple;
	bh=Qu7CPcUUPXbTPuQxnCI/kvkv4jYTT3U0zpXp2Rg85YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ho8PC8RktgDCHZnq1yEwOV4GFsKPVflJYO57FWNh9wkQE3UN9NEWOO5Vk2u/gKzMOc4SlO7elVnhoqbacdnKWgMGUiQkC7z+8wwrzL9oaXs+ZJS9c4mKQ4t568b1fBGbJnKnfX7+9bFZfEmRhwxDtPSJVYNqmf8JXQAtNit3T28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KmHgLAA8; arc=fail smtp.client-ip=52.101.83.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6K+Mq+QBE0a18Em4g3eBKlG8T1G3mdqnv24ir+Z8bzhgiTSN6j854I7bcmEKP0apTT/G/fLbty1/+zsqPm883rg2O5s4hOC+5YL3Ao0iyD4/jZ/B991lYgzXbVgczipknFvFxqcw1qlMkv+gSrzZ/xv6vYeH4pXN7S1+/zMfaH5DXfiAa8X/QKSFvZICNqDgX6xxUTZCgNGIqGmAdE3VDhB82/XGu22IlupWOuNRmDkqiHx5wlYSgkO40Es+ETmKtw9mJ2BJHUT71MH26yIxCC/EGBKMNPXxN7k6EwRZBUaJgnpn13C6btyiyyD8n5DYt8LLbKmJzfyudEZ6SVxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ7Meh4XCw9G2JqvaPFlr07/wOblFIzLeOTAGSaJ6Zc=;
 b=bU4BrmmsZTnj3WJGl6N1SzjwbuvqT+OzQdW9J7Sl5ULHa+qlNnr4cwheeRhz+LDtm884t6MpRYu4BF7W7mnI+XVkHmAFJNHYS13XCiyf4gJBqqKHiCmmHd9oOBbB4Y3JBruz1qWKsLSXlaUcv799JO3iSOpclShpOLlrGGi9UIPDyZ2b8FV4mfkgz68kUeA/Drm883h/aqtLjkG94+mkrqSHJLBHf/FVLRdBUhBpo4z4kbu2RqJbfeyD/fjkW5C65git/+svst3v0Lmiwqo7JjwpPNj18EoCOxLYxRrkzmjS+MLVwpUIkFpnxHszZ6vLjKGuKfEEqZDJETkIk5jvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQ7Meh4XCw9G2JqvaPFlr07/wOblFIzLeOTAGSaJ6Zc=;
 b=KmHgLAA8J3s3Ycq9TNWsWP4u6/ZV4hg9OCJzusRHXvk4aJrz4IYP4OAP/RPeqcJkWbIA5/8b+k3VxeHYGPdud7Ss2+wWMbW9fad4MkX9LQ1cOS0nMaIh4lfNvzHC4XePZR75nAkToNx03JrNNR6TcxE6EFlyqL8L5Nvyb1dr5sdRILCf71D18mBKtTkmCV40IWPDJlAhd7xtppGSIa116gOie3XzJiZ5UtPVechRYO/cx1qCY2KZMccjVj11DeBNkiWeTB8SgTrKK6nVUSVKuszgo/b3qDFth1+Q2vQ42BAPIygM4sljr8Bq2mYkkjddJZBKl5+Zf7FzwFLcCMxy0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB11626.eurprd04.prod.outlook.com (2603:10a6:10:605::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 17:03:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 17:03:23 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Frank Li <frank.li@nxp.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Jiwei Fu <jiwei.fu@nxp.com>,
	Forrest Shi <xuelin.shi@nxp.com>,
	Alexandru Taran <alexandru.taran@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Subject: Re: [PATCH v2 7/9] accel/neutron: Add job submission IOCTL
Date: Fri,  6 Mar 2026 12:02:58 -0500
Message-ID: <20260306170259.296712-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306-neutron-v2-7-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-7-3019bd8c91ef@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0382.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB11626:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9e78f4-3493-4754-1ded-08de7ba2464a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	HtoNGXhwcm2L6n4+1EDtAJAk41zHc+KK8e9wpVWSNeuEUUOiXKI20P1RBaFBmccjXMGYKf5Iwtc0PoZSbmyE6e79PTMWk4bxCaONca+Jn1boW7PT1uGeLVV9RITMHd6yOQftARKOX7SSnx9kQglW/xCcL8LqPIxUlkl1HEmEdr2HriyQHwcol5H2MuKwFAs5eSfBTaXNFga3VbiW68uAZurdmHs+C0qqi9rsPZMZzBRkpivx55o2BrXprVCvA280VtHB/OM225DKZevabVmHGC/c4Q+oIMTmEx3le+e71cpxN1uDQrYvNsed197rSibXin+h9RJseg8HOCpcxmTwCdQa/6IMaBv3vmKrTtdoVoPRXz2e7JtacQsGh4Qo0aCuDlNH3C4PJyQg7py+Ii8lN/R7AzFdmSQel9MNoentfxBpPG+Z3f4GzUgGsMbh8lfDsxAVAsXwp4jw/AmNBbiy+uABMQ4Av4Vm1Q8EmPau9W8dKl38xTpoZhKe3xgIgq8w6v3Wbocwd7yqGCQeD6AORr+a6KVS1PtJi5+I3RGkoNqCP+H7AlhgImO9qDLnfsNJ0MKRN+KGW+bwggEbDXq2N4GKo1ANra0ge+Xwu9AY79gflMT897/gXyhz8i7uO5cSEoFBaCLvWuivKsQT1KzC9AwcMM+Q0VmjYtSVVS7wyTx8Mes7f+bbdLkx35Bzg/0FXeHcA+VUQZVH16qYXidKgHeWxFdVaGQ8VdImzAMV78478yzERvE9/sAaxJuuaqi+lcXweG2b4vqnPUVt4oOqBnOL4NkTF7AXUjxfHmzYizu5nqApOgUcj1T2GB3E9dXh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ticBti0hk91wQ64a+WVU1BDuWHwJIqrIA/KrFi+BgVg5ZXI+ChZAg3VJaphC?=
 =?us-ascii?Q?YiQP9kipf2DbeMwnlhvtkcnz+DYuIz0nzASqZmJN1fZ6tjwGR8cpAEm3Rh/S?=
 =?us-ascii?Q?drNcnTyheITmSogCsWcex2jNEnYPLVqNnVKep3ku10620YZaj3AxLPm0mVqm?=
 =?us-ascii?Q?d31raza6duaM7eTLXfhUCceHp44hC2bY2KalJiwRhx9zP6Qa3TTOmDtJmTIw?=
 =?us-ascii?Q?iIx/23WYlS2RUksc/26ocx3D18MEHNRLypaYp31tqcZ67s5shMxJdaUodAl7?=
 =?us-ascii?Q?C5oQ12zHppXIrMHbD70UgQ2FhcLQctNrcPyl9oBHV6HpZCHZPtT+ty+/Kz2R?=
 =?us-ascii?Q?XW7VBRV66WC7VmV7WfBj50gnMr0HyCB+2ZICOQl/v2L2s6xJlba3RDUlh3ri?=
 =?us-ascii?Q?1VQtu+7OlKTc//VsRqa59Al/i/s/qANFPVB6ovnl+h8j/pZp/C2PohsoP9fW?=
 =?us-ascii?Q?yb9GhjRfBNn6jQUzRaN530AOj5NiKJnUnxAC2zy2F8CAgXKfQfE7fdBmId50?=
 =?us-ascii?Q?AYllL4ZRiEL9HYCdwCppgd1/Yti1fOHQAcROXAEXY8XJimEnha2FPRLeaR4Q?=
 =?us-ascii?Q?9dLF/5Id0VLruDmRsWS79SlVCOo1TX7/5w6SOvut4/ldlhSf913n4ySTdYqt?=
 =?us-ascii?Q?t3Cd6bIsAnpQ4UQfcOyN5sy0C/7GnhCndCAIU4abYpsjPH7shXDVECBy2fA8?=
 =?us-ascii?Q?h7/QHSIMvHW/UPSel5D/J976sD3NtOMDCCztXoN/PGmcAumixfBUROA1ErwW?=
 =?us-ascii?Q?XSLSBAGYpCG5L46KK+6hyx0zWG93VD+S3irfhNMP8tpl+7C9r9IK8+52LS1p?=
 =?us-ascii?Q?z7puHB6eNpAn41GVsAJYAbOtlwpkDAsYE9rWy93ph9VfQ+bK+V/uUWXPNFkw?=
 =?us-ascii?Q?NTH/CQMv51bVfEFC+NZrX8j547KiGWVtM3xdb0J3w0q3AaTOBKvabGbKKw71?=
 =?us-ascii?Q?YB/B3s7hi97zJeEK0L11YdDow0UQ/Qj+iOWvJ3PKi0iY4mnCQUMmYGXwJO5Y?=
 =?us-ascii?Q?4GeCpnSAl1uIkfOJNJId7CSGw+Gh+WtPnxlhs8VIqFvEAichmNC5JvzqDI1q?=
 =?us-ascii?Q?5DurYdKEb/VoFcxkrYVy3qoO876Bt0ERn1rwgpkkMHOA19UFuyQbkvKp2ROW?=
 =?us-ascii?Q?xXHGrylf0a2Kpm4NdiF4eRCV8lOrXVTRgH/bwkxVsNEi7ELKdmOyzGpFrj5w?=
 =?us-ascii?Q?2XC60/MfKoU17qio/Y1hIPOCqxQGFnEjmbFyBEugFIcRVZgQ548RszPUPLUg?=
 =?us-ascii?Q?WKk7Vbo1ayynHsWl5IIyjzmEmISU127i8B/MRBSE606qXN4tMcwfnMxryCIJ?=
 =?us-ascii?Q?II1CpT6SAC39KysrikG/jqWORkOcTlxGhezlmd9T7frIbHzGmaG0Lyb6DluU?=
 =?us-ascii?Q?pSQRR7iImsNzCtbkSvlbycny8sdvQy8TWNxshryzJ3So2GAK845ZLSWIDe3K?=
 =?us-ascii?Q?RWbVDzP6TdQbkSPXanu/hf7Q3zULZpx/wdqLFiIWT7IGEqrMUeGdNyCiczgX?=
 =?us-ascii?Q?dsuJPXXOPiKbLEw5Xn9Y6oHPJL/ZnccdG8WWSetS9W7ko3X/U0fJg3py6yQv?=
 =?us-ascii?Q?2lfNYqvgVz9df8t2Z7EPNfxs3snLG8ONL8ZppSZMh0N3Uzarw/QM+wVQ99ce?=
 =?us-ascii?Q?aVK9W9qHCNpZ41awj+zYTJqc1jFnoH819aqlR/+pOvgZr5oQljdVRMrUuYjI?=
 =?us-ascii?Q?EVlKNshrFXoSmSgpAyc4sXH04u+AseRU0PvC+tw5jn+B9iiq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9e78f4-3493-4754-1ded-08de7ba2464a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:03:23.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4imHobV6+15tabYctUXaVdoN/0Qp/Tt+w6YSWPXZzytip9kSweNhA+Vl2au+cT5SK6KieJK4w5h/e/vVkZLHuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11626
X-Rspamd-Queue-Id: C0F28225A15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54819-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> +	if (appstatus & APPSTATUS_FAULTCAUSE_MASK) {
> +		dev_err(ndev->dev, "Neutron halted due to fault: 0x%lx\n",
> +			FIELD_GET(APPSTATUS_FAULTCAUSE_MASK, appstatus));
> +		return neutron_job_err_handler(ndev);

AI: neutron_job_err_handler() returns void, not int. Remove 'return'.

> +	ret = drm_sched_job_init(&job->base, &npriv->sched_entity, 1, NULL,
> +				 filp->client_id);
> +	if (ret)
> +		goto out_put_syncobj;
> +
> +	ret = neutron_push_job(job, syncobj);
> +	if (ret)
> +		goto out_sched_cleanup;
> +
> +	neutron_put_job(job);
> +	drm_syncobj_put(syncobj);
> +
> +	return 0;
> +
> +out_sched_cleanup:
> +	drm_sched_job_cleanup(&job->base);
> +out_put_syncobj:
> +	drm_syncobj_put(syncobj);
> +out_put_gem:
> +	drm_gem_object_put(job->bo);

AI: In the success path, neutron_put_job(job) is called which decrements
refcnt. But if neutron_push_job() fails and we hit out_sched_cleanup,
the job refcnt is never decremented. This leaks the job structure.
Consider: if neutron_push_job() succeeds, it calls kref_get() inside
sched_lock. If it fails, no kref_get() happens, so don't call

(Need owner do judgment. Not sure if AI said correctly.)

Frank

