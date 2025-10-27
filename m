Return-Path: <linux-media+bounces-45671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9A9C0E771
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 15:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43D0C19A6ED0
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 14:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452472C15B6;
	Mon, 27 Oct 2025 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ogNlgJAh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8FB5695;
	Mon, 27 Oct 2025 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575661; cv=fail; b=FgpKI4Qbr78pcQgAR4oXqmuq8LErStt2IpJRwAKsIVFFQj6YHCHS44feOrXi2IXW3kX3LyXjbrXh8ytByQF2M5BYudFjM1/avN6ykxHvQeNuK2NCFDKe7ZpGHV/pE850tNmNJH9QhtEvGp/YVAXERZNK8w00/JezaUgk0Ex8QSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575661; c=relaxed/simple;
	bh=VuJZtzlRkSwkco0JE2Fbm3fOZJvWfoj9o68ENBYMHl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NOB+RN84GJbUcFRynkwWoMBlXQ0i3aQ3/uh3/vjnCCg7cuGxa2D4su1jDouU/pYuCauSyay49AjesikKiJSj0IBXDkKRnaykLpt1eu7jRQXcsq75Y2O2qPSgByYGRoroSjtfeTWufs4Su0/VSLZIHz7KzExkSs8qyXW1kBXmdrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ogNlgJAh; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RDKVQ11936683;
	Mon, 27 Oct 2025 15:34:01 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a29hmg911-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:34:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSvidq+w/DZI6BNkewW8avca0pklqBwlvyW3Ddv0t3pBYflgZo7bLJ1EN6QYANiIaryvafLcrDfpixfZ12XKpeTP3TC5lGBoe5vt/WZ2Aa8aQi/bDZrxyv9uLuhdGd8Ab3u92Eywf+Mk0rBQJO5s/dq84kAHE848YYTxDWgrQekHcUqmzZIAiku5JpmHnnGwDEA9n2Ar0Deq6bC41FW306unp54g42obl8j5HO2UsPkv+8WuNhp7Ow0SbMz5a2wUOhkJix5Z4kbfQe2gm5ZMxyvhmpONUor5LnL+q9nqEMc+bNicA2GC4sbNIVM/zuj/d1u54qA3TgfY7mQy5FQizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uPVo4RMTGJeNde5RZYC6GfokB8vj9ajCj35D/UKaqc=;
 b=k1xkf7F+olc+2GWAFt7fMGEbtpk+qtsKLCGiihKJ+ZqDApAqQuVIiQXWD6axOj1w4uqwrWWzyYCrPHIFyZiRUoetrRan+L1VSNfKyPJwUauF1fjPeVewvFDFr5okpWLGHGP+aV++uLXzgNcbPskco5osgIx2tfcxRlsxadcqcZ8/Yv4WIrb9pTjhSCNwqYDFnrj9jS/aGi7RjSwvFpf/AncDJbrQOEobLlGmrPZriYHzSntObj7NoM2YsCqJFJSo0nnYM/QDJYchnbeP0iGvtbVEqIH4I4ebB/aCP9HJkRonT5DsA8vYXmgCGmgC9hM7pul/XOVbyojbHJevOBe00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uPVo4RMTGJeNde5RZYC6GfokB8vj9ajCj35D/UKaqc=;
 b=ogNlgJAh/CRU7o1jIwS7/XF9kPArVozvlrcj3bEzD5HrAeGOiq9DQSgw9qv94EKbpO/O2ss4FFS2gWS23PpjWR+198q33tShOyWbgPdAISrGzucwFj9Df1xB69ZS21fBbgBnHEJzTCEcWmxmtdGcawa4Zatn9Wqe4GjKVJtu7x98NRgwBhoL3Mfh6evTmnCFxOKuekXvkLPk7rN5u0yoanG0PcKNjMc01iC5WTY2oSuMClwlVaygz2lOuOPsHak7VGoAHr5+TolUB/MH9yLA/ZFFAaTQsPWKBlXWQZQFXAd4QQFKqwPiS8BWNs1Fb/GFwmDZ+amYhdDAaG4CmJadEA==
Received: from AM8P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::28)
 by DU4PR10MB8513.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:561::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 14:34:00 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::27) by AM8P190CA0023.outlook.office365.com
 (2603:10a6:20b:219::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 14:34:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 14:33:59 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 15:26:44 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 15:28:57 +0100
Message-ID: <8487acd9-3c8f-4eba-99e4-6a937618aa55@foss.st.com>
Date: Mon, 27 Oct 2025 15:28:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: c8sectpfe: fix probe device leaks
To: Johan Hovold <johan@kernel.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, Peter Griffin <peter.griffin@linaro.org>
References: <20250923151605.17689-1-johan@kernel.org>
 <aP91OoGkrSxxpsf1@hovoldconsulting.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <aP91OoGkrSxxpsf1@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019D:EE_|DU4PR10MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e71669b-a1e5-47bf-1501-08de1565de40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHIyM3BoSEE5bG5UY2V1NU5lZ0luZFpQU1ZkNTVVWmJkUmFpa2dMUHRmZXJ2?=
 =?utf-8?B?eTVEbEFZVTRZTlpWd25vT0Q1QWFTZitFWlpUWDgxeW5VNytua2xiSzltWHpX?=
 =?utf-8?B?QXYyaXJEeEVTSE1iUGpsSTQ1bXIrZHJWQldFU0RVYUozUnF6OFlCQVVzUUJ0?=
 =?utf-8?B?RjI0K1J2M2ZDaVlyS2lwdFMzQ3V3Y1NhWTBETkpELzduVzlDdmFyTDRxSlNG?=
 =?utf-8?B?eXdtTDg3bk11SnRtZlo2dVpUNEc2SWZuODNNbTZnZE16ZkpIYlhGWnQvNGZo?=
 =?utf-8?B?RTFaemEvaWJnVHBUL295Qm9wdHRHc0lYMjBGRFduVE5Mb0lWbit4QzZTUGZJ?=
 =?utf-8?B?M2Q3blhrZ0dvSWwxSk9NYTdiYlRDYjdKQmxEM3VNZ1Fxcmh5MEdGWlhCRkdV?=
 =?utf-8?B?bkpQMVo1WjdaUFk1YnVsaVFQMjJqSTNoQTBxSFFqbk4raThsdGU0Uzh0eDJV?=
 =?utf-8?B?OHV0aytYUVpNN29ONUdldmJTNXo2SUtYWTJBU0YvUjVUb2dwMDUyaWhORHVT?=
 =?utf-8?B?WTdCZ3BLQkZSdGhmNzNNeFZuRklzUjZ4NXlPNHpJZmlDb25ZZHViVy9DY1Ji?=
 =?utf-8?B?Q0pkVUxEdmlEbUo5R2tYQWZ5NHZ4VzBFM2s2RzB2UXFwZFhMblBTMFJqRnUx?=
 =?utf-8?B?S2xldUVHVm5pNmsvS2E0d3FoUFNXNERUNHQ5Q1lWcE5WTGgvajlWTzVFcGVq?=
 =?utf-8?B?d01NNUJnbndZYVYrVTJsN21uNjlhclk4blZYNEZOSmdsWEJCY1ZINTVrRGtK?=
 =?utf-8?B?aDNvekt4c2h5QmRYN1cvUWxKWXEycTdPU04xWXp2LzFTTUpZb0Q3TFF1QnlX?=
 =?utf-8?B?OW5Ta285WW1rR202RGlLZ2hXMUVjQVBKdURJMFo1cG9oZEtPTE9pS3JkNFJQ?=
 =?utf-8?B?bDFlUXhxSGE3WWs4VjY1c1RSSUZLUFJCNjN4bUpLQy8xYk5IcmdhcGJvcEdL?=
 =?utf-8?B?SUJwQkFLaDBwajJSa29rYWNlamlmazIybkxmNVV6WnhmYUJLOUxjYWN3cGhk?=
 =?utf-8?B?UVpYZmtsb3B2QWRpYnhGMGpsZTdHWXQ3Y01hMVExb1BPcC9CNWljSkg0WmNh?=
 =?utf-8?B?cDZKZ1pKSlpwSUd6ajllUkRpck16d0J5WHRmY0xJUFZaVUJ6Tk1wbkRaQ2xZ?=
 =?utf-8?B?T2pQeFVCRmIvelZBWkV4ZThraXFvYjQydTFYMEUzQzFzemhscFNoZ0NFN1U1?=
 =?utf-8?B?SlV5VmFXSHJRcThKWjd6U2pTbjVHOU4yYmI0c25HaHBDenJaZjVPS1lWMGh4?=
 =?utf-8?B?VEhPeERqWnFhUWNLQW1XM2hKRDJ4Y3k1bytWUllPNE0xa1ZaZC9ZSzY3V3ZP?=
 =?utf-8?B?bmpkRTd5d0pvTjBuSmRaRXZZNGR4alVHUWkvOVRza0p4K3dPd0JpTXBxbXVN?=
 =?utf-8?B?Wlg3anlQc1FMaGFYM01xVUVQeHU3MWpNWHY5ejFBUnVjS002M05DSm5vZVFR?=
 =?utf-8?B?WEpJQUVhcDE2WW5KcHhLWmxTM1dwNkNCa1Z4b1JVYWtwaDZ4anh2dFQycTNm?=
 =?utf-8?B?QklRMTcvZWlpMkNUQXJ1ZjNlUkJMSEVCVkJ4VExlSXNPbmw3bkVMNWd2alE2?=
 =?utf-8?B?dUVvMi9JL1NjQmpFc2xFSHZyMXNVdFRYc2xHQjFnL2V0SS9yeHVaWElsWDAw?=
 =?utf-8?B?OVk4TDNtSEhyMW5DRzB6UmFCWjA4bkI3NjQ0YjVreGVZRHJLQzQrbGdTTDhK?=
 =?utf-8?B?UVNoMktzQmV2bnN0YjFhVFREUG5tVFg3aHU0dEZQNmpkNXpRRFlsdjNPU2ZZ?=
 =?utf-8?B?d1dFY055UzhrVjRaWld2dEdYZjdDYUVoZVNmK2hsQ0tsSGV5czY0QjFWVkQv?=
 =?utf-8?B?NjFNb1ptWm9GcmJZTjA0WXExT3hxRXBMT293Q1BSb3h5bHFWdFl4SENyUHAz?=
 =?utf-8?B?WmlJbFI2VG0yVzVacjI3RTlJemQrZWgwMGZaenpXSWpQa0tHRk1rNUNoQU9k?=
 =?utf-8?B?aVNZL2FxR20zUGdTbTBwTExoQm5MdS9IeERWT2swVUx4UjJLbndKc2pxNjQ0?=
 =?utf-8?B?UEZsbUs0bkF1U0NvQjFYbytxSjJkWmxBbUZ4R3JXd0w3V2RaY2x6M2dOR1E0?=
 =?utf-8?Q?iuyhf1?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 14:33:59.6448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e71669b-a1e5-47bf-1501-08de1565de40
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8513
X-Proofpoint-GUID: UyyyYSMtHTlv1gvojWoBDixhHgSYc-ac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzNSBTYWx0ZWRfX2J8wt+8ajZME
 5yD8RDRNmRtT3GnNbkoInZzIw9+RQRK9A6qb2cTe1lbl5l4ff8xyFcHK2wldMnm32ynurFG/5xo
 S6it9xvHVvyVbHplDHCiHlhyeA6kuz0aG6/OllZmnZ0jbPDu8hd3LcVeC8kXVA3jTweyY7NMTbw
 Pzd57CRud8Ej9aU5eM9H4xN/QgQ/icadmdKjwA4havuaPbyor+moL7O0oSioOLMOBSHA9JCoLc4
 RKFMjd7M7LnvPnYALy8U0XAilN0+4UDzvusLIsVk7s4G+iT2+PwXDyV5FDSQeS/IgtGezEXM+mz
 nq8oHMFZjrpUOLCV9gfPqKS425S2mrDdG48JNFFVrodHSPHXmniUPYGng0Tk9Qt1KpYcp28gWHT
 Fip15gqVG+bdYjIh+e5PRzA5id8WSA==
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=68ff82d9 cx=c_pps
 a=VtZoeC9kJTLwapNsIFKCsA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=KKAkSRfTAAAA:8
 a=fOQmII0ABNLH6oUkuSkA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: UyyyYSMtHTlv1gvojWoBDixhHgSYc-ac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270135



On 10/27/25 14:35, Johan Hovold wrote:
> On Tue, Sep 23, 2025 at 05:16:05PM +0200, Johan Hovold wrote:
>> Make sure to drop the references taken to the I2C adapters during probe
>> on probe failure (e.g. probe deferral) and on driver unbind.
>>
>> Fixes: c5f5d0f99794 ("[media] c8sectpfe: STiH407/10 Linux DVB demux support")
>> Cc: stable@vger.kernel.org	# 4.3
>> Cc: Peter Griffin <peter.griffin@linaro.org>
>> Signed-off-by: Johan Hovold <johan@kernel.org>
>> ---
> 
> Can this one be picked up for 6.19?
> 
> Johan


Hi Johan

The removal of c8sectpfe driver has been initiated see https://lore.kernel.org/linux-media/c3a35ad6-c4f6-46ad-9b5b-1fe43385ecc5@foss.st.com/

Regards
Patrice

