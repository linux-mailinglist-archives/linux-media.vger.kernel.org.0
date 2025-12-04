Return-Path: <linux-media+bounces-48214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD44FCA30DC
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 10:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A75830281AF
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66869335091;
	Thu,  4 Dec 2025 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="crF7ntTp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5BC3074AA;
	Thu,  4 Dec 2025 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841353; cv=fail; b=TmwmhxYt4E5Y5uhvS5cXDqpn0mMrG3JGQ4YjJtqbDcbS4DUA5ED1sSfRw8ZCCsHSt6Rc5oUgrpteeE46hbKYeEbf5W/zC8ojXI8B58FEtoDKpOVCh6wkoIK7gMaHrJXUovRQ8b1JYCloZk9xYlQ9OeZ/HqYMOFf6Y73wZzVUAQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841353; c=relaxed/simple;
	bh=L0tvxS2kK0671TgiFKXq1jyi7rdGt/6tesWqTDpeoXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jc25nSjFA8H6QeaxGBsDhrzUI36o49wAGkmFMRV6f08zyg9fUKKC5RDPk70sfB528WWkyBZ0w4I8FraYisfuMGFPXuE02obSRdTRPEKZS3p1uo0hPzZpiu46i3DPBPV7sFGB0gaQKgT2oKSolKXVnffAjgDzoIbOcdg+D0gZUMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=crF7ntTp; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4763x5911639;
	Thu, 4 Dec 2025 09:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gPxdZrBVW2OFp+v5QXYvZ8qz8X23iqmcaCUVuYux7iU=; b=
	crF7ntTpJkHzzgD1FpMPp7dmi6NZghfysjoIPfEvUiI6teGn/rJIDzwCgQ2cHQkv
	TSIrNFZMsVhuOgaNWLrK5jF0z4asihfETGYaQFYFgtaAdY+h6JGVgbccqpW8IhEM
	1+InZjxF6l4U8LNIpRjPvYvBD7kIhODDJpkz8DIEaf+nPR4h0tk1YhaysqNsvd+t
	3coKVNzxrPLVcI3p97fLrcYrN4JRheyvd8I73Tt/16MDuHhxnvMALbOzsABIpn0N
	Qp0bQeWE11EchZ+YhlkqBvsg6qL8PjWP5g8ru9m85GH77j26XDhyXAG1Pk3KQVQi
	myk+oP0YLvEXtJ2z/f9buA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010028.outbound.protection.outlook.com [40.93.198.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6e6n6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 09:42:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXhxpry+HpdEPcAkZ2E5PdvrrLKBhCzwtx75HSxOMBg3UQ0KpTvCcjnYIvx+Bia7BKXOsCSQIsP17ArWPba+hl1kyFAe4fIOkUtXIJq2bQbBdXvLZ9l5bNzIhRWIP+svJw1+Y6yn/DF1fqQAJxFdGag4J3yGI752u3Idjx5+UJiFkb43zde68+Cp7/6q7j0ZGKayhRaJCe8x7lEy5juNeEklDobnuP/FOWKubpJQoiMQr8qglNQHHBdQdgSQtfCrnPnFRmx7zjwJrdHzbHLyIkeuCugsiu1tQ2FQWky88bY1n0T5JHqgO5a8hrIyBssZTYfBsF9XTnpLWQRWNU6SyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPxdZrBVW2OFp+v5QXYvZ8qz8X23iqmcaCUVuYux7iU=;
 b=vXEV868EljlfzygURHuUucDVU/qja2TPnC+0WzHVN4Tve1TC9k0cROvI/AvK5+OrBo7m29wngR9Wjot4cD0MTHeAb37015bcO11BtoztfG9TwkrhhcWZmXwDdOXlXvCD305wBWRbL5bkFjw1cBwlUm939PqsbxwyXDAMTHEgIUKRPc44Ita1NsXSGluxklEQpGKimt0AOfbkY3Nm4fVtCVEtGT8BtSBZZ/j89va7SuZAWN49iE0YXVAZSykB5h0Bg1+/9I+T4JsHjW1WF09Pv1/wDCBLw/pmxFMIiCqs6J95GrCzaWhrDeXcHIaIoSM566M7v4z+A6WM/n/KWcCdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) by
 BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 09:42:15 +0000
Received: from DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e]) by DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 09:42:14 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: nas.chung@chipsnmedia.com, jackson.lee@chipsnmedia.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        nicolas.dufresne@collabora.com, hverkuil@kernel.org,
        dafna.hirschfeld@collabora.com, xulin.sun@windriver.com
Subject: [PATCH v2 2/3] media: wave5: Fix kthread worker destruction in polling mode
Date: Thu,  4 Dec 2025 17:41:52 +0800
Message-Id: <20251204094153.1530331-3-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204094153.1530331-1-xulin.sun@windriver.com>
References: <20251204094153.1530331-1-xulin.sun@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:34::15) To DM4PR11MB6550.namprd11.prod.outlook.com
 (2603:10b6:8:b4::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6550:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0a86cb-0951-4e42-96b4-08de33196821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X3EwgO2loB2qah+heQ9Dy9v/YtL+GBnvJuzM73HUfbqwhKsi1+L6+k/CHY94?=
 =?us-ascii?Q?3XOr/QVBQh/uFmWPZkTfV5hqSkgHKAo5bYESKOg12RNHz990/YxPHwdrJC0R?=
 =?us-ascii?Q?sm/0/4Utmrh9N5Mex9YGQSm04jY0Vw9Qdhj0BNjeSOT/xI4Fzx3cKU7oEsLG?=
 =?us-ascii?Q?QW7JIfPnqYB3O1uG8iXDM+h9pMoxIFOC6svUCxCn0Hk3YPrYBuj1L9J3l3zA?=
 =?us-ascii?Q?mdq1jaXlX4h+bzVuYROjZ2ECgW3pIn0RwC58Luva3r9R4DXGkNVHC38c+oym?=
 =?us-ascii?Q?sXuAhTko05KdmyUvrUw8EOdqmkaOpoc3U7jdbAROCeclvlV4glBQy5DYCbc0?=
 =?us-ascii?Q?MhBzANgl9xWjvFOHuSjPoaPM7bKgRqT9JNog8KdHKYBLDX4DsJ0xePqTtL41?=
 =?us-ascii?Q?WYu2AeWCDnEkIJcFRgIUbbhyMDNKbFuiHhH7RK25xrhFflCedAo0sDT1AIs+?=
 =?us-ascii?Q?eRCzrtw0cgY8a9nb8/9Q92MMApSt0COEwJCthWC9CwVo/Q1LoXkvvEAtLwV3?=
 =?us-ascii?Q?B2idqSV3tL/Z3H1qR4eEW+YEKBCYVZ1lQpbtCEjKTiKTsadMVda4/6E1g7Zb?=
 =?us-ascii?Q?3vYHOMA2k3diAZCJeqxZI+SYNPcS+8EAcWCtusyOg2f6dVFkpjxDfUboZqtg?=
 =?us-ascii?Q?YsZVjA8C3a7uL3DO0l0SWVpebre6He/YEYw0wtrwb7sBsE5OPTdQWmzgKpe/?=
 =?us-ascii?Q?FK6Y6mRVs/QhdbI3kur2jXMDIrCG5RVH+UO/Niv9t6JKWnRJ9kryt3jObPJn?=
 =?us-ascii?Q?O/wlJe81xhALojbSKSvBWACUzr3nUjuoQ4TClu1ViuujcrbjW5fN/0TBuPNj?=
 =?us-ascii?Q?hAllKwHI/BwN5+jju+yHrvBw85dKSg+M8oxyMLz3U48Few/ZrvAAlBb/9LCU?=
 =?us-ascii?Q?MNDxiwyzZyWWWeUr4SH9thRmvk8zAtxL332SJ7uqtqQmzNRFMkFVhYjAIOml?=
 =?us-ascii?Q?B4uGtDwh0qh2GB9vOlbZTHgCP3sSwzyvteI7h+yIR+sbxnH8dXlzjXxjZlht?=
 =?us-ascii?Q?qwweM9knEicosOQ9M7BQ0RvrSdfA/fsQ9Rg/5XzsCFAzTcStpw5p/h4QRilO?=
 =?us-ascii?Q?tA7ZdQUlx7Sz7xTTfedv+L37gIDenbpgTYwrYAzAI5asoTh3fMqdcYKh2DEO?=
 =?us-ascii?Q?TlW+XaG2JownEwjlSz65wYqcjE/0xQjPm0r97LB2yfScls7BKeqtKu0c6ufm?=
 =?us-ascii?Q?2F8A1zyzUsPC4VJQ1h9kjjJ/77M35q2UvjXZSFJ+Ub8Du4W6sNk9IUWNw9A2?=
 =?us-ascii?Q?tXLPLXumS60UQG3K7he7X3/YQSzUbgQGrQxrSbGlZ6HdiHoKk4R4ZVQnDGPn?=
 =?us-ascii?Q?G7L1odlfOWiZhVQw8kgyANjz7FjKq+cqME5DZDws5rKr50Yyqn0QR01NJi9/?=
 =?us-ascii?Q?EawYGBgEXqYK2cUMrrQGb7TMG6id95p0D84IzzUDfjQVjHtuVTdwwAgd6Igy?=
 =?us-ascii?Q?o7IR7W7oHEFpOffl0rdIA9MLCph7lAoy6n7Or9s99OW+T7hkLGq+gMq9kc5c?=
 =?us-ascii?Q?p6drc9W7EGphgn0sOxRiXnj0objJRks38iBY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jjP2wR931Pq+gxl8tVpE1wTBNzuiX/BBwG0mNfIGvCvN89tvGeY7BIVM0e0u?=
 =?us-ascii?Q?PDBK44iUOOAr1iGGL3th1KYyWabI5WrmfwlSU/xlKCSoclbcUoDj8OujYE3e?=
 =?us-ascii?Q?i2S2T2etubpSlxbaTVwqDafX2eIcZTk47AYYsD0/iN2azNq/QDCugRjc8TRq?=
 =?us-ascii?Q?p/saL8xKDaQcEHfEBQ4Y0ZxC8a0D/COFMdYSnEy1UW/TPcsr8LBbyZNBwd/V?=
 =?us-ascii?Q?cg7kHhf2PK1hVC18oEuJc2f3WkXXY+3AT9GNTxolQDPjhV+9hWy1XWZ2PmR0?=
 =?us-ascii?Q?X6eBSZIqTXQ/oTq/umbHEOHjYi/c/2D5mOzRJyyGlK5oEjycf5ZL8OWY1D2L?=
 =?us-ascii?Q?ubOXOOtsOAmY3UcB7trMywgz1y4BTjYy4KXmMf9RCL41DeNUDq4QQy3qK6QD?=
 =?us-ascii?Q?84zvUpb8DQkSI080wWoS6X3pbmjd3672YAKeXS+UdfIF4MbO5QApiFoGMoiT?=
 =?us-ascii?Q?3OtQrHla6e53cfXh+KhWw0HLkjZwS2OPYuqijK6QTLkgyRVcF1D2piPoqe50?=
 =?us-ascii?Q?WGsyIikEbLNY0pqXAzVdGzqgApCbpZMbQ4Ng6030ZH7RYefRFtY94HVDEKTq?=
 =?us-ascii?Q?PhkHGnanZflbnotR8MX9nQz6UJhhKfXijThwMJELX8EUO1QvAeE/u8gKY2kZ?=
 =?us-ascii?Q?pxYnMU1bMx6kdRQSCHjcvLn90a2CAnabPT+mXH2cmyeTiiLBkXybSrWqSYY0?=
 =?us-ascii?Q?ezFHbkCX44eDq5oVT5+GreyH80e7qzIdFC+8SzR9YTJnAsFrTJkAUu2VpCpi?=
 =?us-ascii?Q?Nflh9r3foqaNvbpjyZHPlN9WpIbjZ63zusrn8iNEuzdQMtsFWTpjPTttTT6F?=
 =?us-ascii?Q?RQGlZ2sXzWw5cSZAvBTCQZ+iAhop6lrtU+UzJke4+fr2N6HhFB+0zZGLO361?=
 =?us-ascii?Q?TVbDYRffYhKgLZ/SLfWyjCV+WLUVmhclTcFd3i5vcHHugA3aUw+yYZJ7JaRm?=
 =?us-ascii?Q?a6MsKfCxxrz6b72QS6tPeVTK5b4zv9xD1LNi1D9caec4bPkA7Wwlr/CwwJBi?=
 =?us-ascii?Q?YxVPP8tiPW1fL4o3xae6S56YeSzuIA/9wvBlEPG4LdZuEj8AUiUnjbApqF6J?=
 =?us-ascii?Q?ENuhZatFtcKUXj8o4RYhU6k/YDT/buYdMzo8AQeWaRra2iNXt8z9kywYOKE3?=
 =?us-ascii?Q?GIXmzq7i+u65sda6KOGIFfhTMP3rA28kxtusxHyH5OWgKnQPesHoLIhhcMk7?=
 =?us-ascii?Q?j0qht1cqP4+DIJGZ0k/m7yU+1lY8alRA478Azc90rbnTGkwKpy0dYrVRsplI?=
 =?us-ascii?Q?y1JD08PWMZ2MVrZK7eWkJxWsvLsNVHcRkIK+vMJt23bpTHz9MwymxPY/SL0k?=
 =?us-ascii?Q?TWjZP33Vbrapj/SufhFMC/WiG9ih8gf6AsVe0y8xIU2yLUKEPZCDIFhflM6B?=
 =?us-ascii?Q?4KaOraSF0BrecEkWPDUhOVGAuqOtQXbeBiGgUDYjtCmNMW5oxwySxuQo8FzU?=
 =?us-ascii?Q?KI1MFa70sCe8HOEEJ2Mc1ZsHfLNPzXO3SZlnPVPrDiYr7doxoPBYsmfDddFv?=
 =?us-ascii?Q?K0/eRhWy/eqiPmv6ruu5+fuNNC5TkX54tAjfuZnMMA+PwzZEnVWo6bVMiY8g?=
 =?us-ascii?Q?V+YWkRzybyYhZ7sCsVNGCmcRF9zdIN8xyV2Z+3GBY8i516iWR95wey1W7FNd?=
 =?us-ascii?Q?zg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0a86cb-0951-4e42-96b4-08de33196821
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 09:42:14.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETkxFF9hoOQKrFIMwEl9ahZPQQJXtUtvNwgsIqttckQGN4rWvlT4XmZ4T8YC4AcTeSStf8ls0SCOYOQ1ihax4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OCBTYWx0ZWRfXx17ysSuhqT9C
 cpUvuYZejVZIdNztaiEjRBAR10N/UrH+mQBouI9hdN+wdZMBUTHEftpGz005bmQGYkFOEO9grhr
 DUQ2E/Ik+QZaOBQOkrt3MmIYjy+K655HC5b6P/cQEIsXsh6uhAi17327FXxARoJobXuql/vWVA9
 MAKwaxPZCAgDh96FVig26XkRzBhMeAmNgi3mpt650ZMFnqXhb0iAGGJ87ycMFRABLdmYgsJ0GG/
 mTFjCPPuUqzIQj9dp4e/bJyZ14YqCTREwN3o6yY66T1/AKJ8EMf6+JAr8A1F8yq8um/Eeen8NOE
 aHY+pxZROsnZNioVAlmUDMOBrm1zsTdhkYm+M/2UCLVuHKVg7EW4wcPh7D7l4HbokDdvIBhY/gm
 nQQkeOvq78w2QMbC+mG+5ZOtc3LoGA==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=69315778 cx=c_pps
 a=W+OgQPQm/Pc/5TU0+uq6wA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=QX4gbG5DAAAA:8 a=jr-MYnPyfkfEh3xPMYoA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: M4QgwG7Ilik2aVwiZOyClrtfKLmbVd-g
X-Proofpoint-GUID: M4QgwG7Ilik2aVwiZOyClrtfKLmbVd-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040078

Fix the cleanup order in polling mode (irq < 0) to prevent kernel warnings
during module removal. Cancel the hrtimer before destroying the kthread
worker to ensure work queues are empty.

In polling mode, the driver uses hrtimer to periodically trigger
wave5_vpu_timer_callback() which queues work via kthread_queue_work().
The kthread_destroy_worker() function validates that both work queues
are empty with WARN_ON(!list_empty(&worker->work_list)) and
WARN_ON(!list_empty(&worker->delayed_work_list)).

The original code called kthread_destroy_worker() before hrtimer_cancel(),
creating a race condition where the timer could fire during worker
destruction and queue new work, triggering the WARN_ON.

This causes the following warning on every module unload in polling mode:

  ------------[ cut here ]------------
  WARNING: CPU: 2 PID: 1034 at kernel/kthread.c:1430
    kthread_destroy_worker+0x84/0x98
  Modules linked in: wave5(-) rpmsg_ctrl rpmsg_char ...
  Call trace:
   kthread_destroy_worker+0x84/0x98
   wave5_vpu_remove+0xc8/0xe0 [wave5]
   platform_remove+0x30/0x58
  ...
  ---[ end trace 0000000000000000 ]---

Fixes: ed7276ed2fd0 ("media: chips-media: wave5: Add hrtimer based polling support")
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 23aa3ab51a0e..0bcd48df49d0 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -352,8 +352,9 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
 	if (dev->irq < 0) {
-		kthread_destroy_worker(dev->worker);
 		hrtimer_cancel(&dev->hrtimer);
+		kthread_cancel_work_sync(&dev->work);
+		kthread_destroy_worker(dev->worker);
 	}
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-- 
2.49.1

