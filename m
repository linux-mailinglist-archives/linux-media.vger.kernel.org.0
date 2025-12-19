Return-Path: <linux-media+bounces-49203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 629B7CD0BAD
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2112B3061A63
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1D135BDA5;
	Fri, 19 Dec 2025 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MCtNzVRm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9F0359FAD;
	Fri, 19 Dec 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159927; cv=fail; b=Ji4ev52SJ1B49ly5I0koRo46TM11zHTzBJgC3u2aV3CMK2QXaFDbjshhkivGlKrUZqjLVW5yVDSlfyOqueDqzXau/ZsLuF6sI+CDKLNxCbLX6C9DQ36C1sijJvBoBPkqwC69/EKNTlH3yuigS2goTmovz4yqBm+6poaW2UYZV1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159927; c=relaxed/simple;
	bh=y97qHZ4Qlzytv4p3l2IoF+NLFntRSqrGCZq03y8gi9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YpbKujBvaMV0MguporAnE7rOVD/vC9JLsgYn3GMALgdHAtdnuaR/tmz7ZuOvJupmKeLkrapYBhzqj8H2s9+4y20ksgOTWYXf3uaIbJOX8zmsQcXim/B3KRoeq7Vv8nst7QU/fh0XIzqaUFLesV5Xf7q40/qAKSAggPPpNowGF0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MCtNzVRm; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFVSS91702716;
	Fri, 19 Dec 2025 16:58:35 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31c1qd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 16:58:35 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcPcA47bLxlTdt2DL3V3OTphMc0rMTpViN9Zjow3g963/Q7RBnRQhQF/tkcFcxTtoQJh6NVxh+s/SU8AMGvDKwYFU2E9TG7gdFYVxJEdYKaQFr8VzQqQBEl9r+90k+2T7qut8uVNCJSro7ExUgzhf1TGxd0xKmlo9FlRwsTwI4WIVdfzN8bICvgigljSzuvI8SxECiahwN/MEhwmuW3PcxOd3H4Pa51iMbFjB+DWW4MZyTV0OBtCKuBjd7qG92vsJeivC+kwwUK3579VI5xPkxM0NFLC3rgSeaXmtUjov3MnJ+PCAWEjW0e87DYpPCrZclPx2bFJ5QIqrdTHpyJRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlaILW5B68sCUokFAlNTsvrGcHZ5VVpgq7UYhjJWayE=;
 b=xO9O2nl++a6bwML2TQdpX81VkW9nerlYx2Y+m+4UUIg0Rp8xrlEYLOLlOB7+vwUqfNGcS3z4Nq+vMnxDaeCm2bj8g5JYnTP4zrPrZqXi3mf98cv+KAaaIjp/8Jv5j3aZ3xiY+rcB+SsG66/IeW6LviXirV9AvpV8HKlqvR9yUmcMDG8crrz0Wb5QsEqFgFsyqeEOLCX1cZQj1FFfjkPNTq36v/3uWsvL7aJPSdsbzgvzbhC5rjxW2DZyUhvSitpQOwk48iS/pPxdvqpx+5oEhIriQOMnHvkG+r4qRZpxGxUuj+Co/wRNvWtT22iZ0wS196LKPsidR0ezXwnbwZU7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlaILW5B68sCUokFAlNTsvrGcHZ5VVpgq7UYhjJWayE=;
 b=MCtNzVRmAurUAPjgR4uB1lo/FbWEoPzfbgLGaS34680XmM+o1wizZPl+o9RxmJp6GzY70BYigE6Tg6zeOGixQCI+QvOUPYB5Bf0+45Z1FeUHgouh8VEi/b9uct8c1V5KsFdT1MxfUYqGEb+LwIJgot2PF61sPHBlLY8OL514Glb67w1bBpc85Z+ROfw/iLWh+fONS3WMJoa6eXEqlW2CvJJrY35GHoCf3RZdNutJ7DgyKZwCHXnX6bGcC5pGFMlw1bm3CTtqwr1FTiVRWO0K2buYMTGJgdTPQkTyHekF9JSavKI2mJAgijU2X5PV91ZpMquW+lzWuUeFQ7T2AdCuQw==
Received: from DU6P191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::7) by
 PAWPR10MB7175.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.8; Fri, 19 Dec 2025 15:58:32 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::a8) by DU6P191CA0048.outlook.office365.com
 (2603:10a6:10:53f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 15:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:58:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:59:15 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:58:29 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 16:58:04 +0100
Subject: [PATCH 2/6] arm64: dts: st: add power-domain of csi in
 stm32mp251.dtsi
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-2-a6edb2aa8154@foss.st.com>
References: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
In-Reply-To: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|PAWPR10MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5cbd82-262b-470d-51a3-08de3f17759d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFErZFp0Wkh0K3lKTVloZUhKTDhCd3d1NE1XeHRkYkZIeCtHK0dKOXc5cmlT?=
 =?utf-8?B?RS93MkhuWmtCWG5uU1ROMXJxdFlXYjBFWHFXQ3FRUnJmdGZhMWpGaGtxRUJZ?=
 =?utf-8?B?NDl3STA0bDNxYjRJU3NlMy94QVlvT0hJZEJsZnJpN1lPQTZWU0xIN1MzSzR0?=
 =?utf-8?B?WEJsUUZNL0gwYlZiTmZMT3ZRUzFoSGcxOEVSWWkwVTZuTmlXUmp6M0hpaGhi?=
 =?utf-8?B?eFY3SUNnc016MGhkZzNka0dBZjIrNWdvS0dnOHdpQmJ4SmlXWTI2TlN1K3pU?=
 =?utf-8?B?ZlQ5dVhBTjNBVkNhdldGWUh4MzkyaHN6SVhjM0VDeU9xQ2lranN3VHplV0pC?=
 =?utf-8?B?MllBTnhBdzIrNzI1dkhJMXlHSFJOODRERXlZNlJGYWNTT3did3l5Tml3VkxR?=
 =?utf-8?B?c0hVTjIvWjM3bWNtK3gzT1hsNUJMMTdYVGZ4UXBpYWtIRVlLdDlnNHV4b0h5?=
 =?utf-8?B?dHhJNWYwQ3NSb04xZ3o0L0NCdTVUQ1hwbVJGUG9GRnFXZnVld0JlaUljTWF1?=
 =?utf-8?B?RDVLUi8yKzh3aXFpcDJKc3g5N3U4WXpEc2RML3U0ZGZCZ3ZGYUxyL3A2RWp1?=
 =?utf-8?B?L1ZEVkZZUUM5Qi9zSzk2OHovaFE4SDFuN1ZXMUdhOWhCdUN4Ym1CbnVOQ01G?=
 =?utf-8?B?c1BKYlFNTktUNFpoQnp6Vy82YTZtS0ZER1ByNnNuM0l2K3BtVlZXYXh3a0VT?=
 =?utf-8?B?MnBvWXFnVlZHVDhOQnBPWER6Wm9DOWRHeVBwc1JaVGpRUkVhTlVrR1V5MWRa?=
 =?utf-8?B?NmNJRmdLc2lybkRCMjFXU0R4MXU3RjhPdElxbndOTVBQaVhiQ2N0bFA4YldJ?=
 =?utf-8?B?d3F1cFVITjdEU1ZyTk9FSjh0akZpK3dQUzlRbFFjM0IrSGp3TjliVjgrOHNR?=
 =?utf-8?B?U1RiSmk3NG1vRUV0cmVnbXRmVTMxeWZURkdvb1d6S3lvM0h5b0VPYUg5a2hI?=
 =?utf-8?B?ZFNTUGJqNmI0VjFSaHlZMHZaZ2lBa2RLT3NxMVFHMlQ3dm9JaWl5TUhRMzkv?=
 =?utf-8?B?T1JWSWE5NDRPdUxxVGYwY3dwUmRPSk9xNzRiZmNycXFxUlNsbmphc1BGb0lp?=
 =?utf-8?B?SmU4aCtHLzhpa0ZaZGxvYjNrbk16ek51bTZWMDJnZ05yTEx0Nk5BMk9VWFJz?=
 =?utf-8?B?U1FDY253ZkVmNlBvVlJOK3NvY1JCM3MvbWhnaXN3TS92QjRqY01mSkI4RTZB?=
 =?utf-8?B?bGpKUkkvMWh0UEIzV3E5cHFIRm5Uckl3WDdwYXpCVDhmcm90QWVlYmVDN3pv?=
 =?utf-8?B?QXhTQWRCV0Q1WVR5b1ZqSXJVOURDWURTakFSUlNQdVdsbDFSa3RnaGttQmx6?=
 =?utf-8?B?cUZiVEtCTUtLVktZaE94bFJDR1UzYWI0S3JDUkpGeXNWRDlyL09FaWU2THdv?=
 =?utf-8?B?d0JpRzdKKy80c3pEVHRzVGNwZWdEbWdjbXQxMDRVdkdvbnFnem9MTzF0RENi?=
 =?utf-8?B?Q051cU9SNmtpcUl4ampINUxYWmpzeTVZa0lERHFSbnFaUDkxWmxJbzVSWlBS?=
 =?utf-8?B?MnNtNGpkczQyZjY4Sm9mNk16V0lxbkplRlFVUkhnSkVGRVZiQnhSVHV6WGow?=
 =?utf-8?B?YU1obGJvcDhSVUJyMDBhUi9OclAxUEgvMU96bWFPSDFmVGF0N2RoK3VVdmFx?=
 =?utf-8?B?Vk9Nc3NBU2R5Y2g5VzI0Z0dKOFIrcmVIMEw3ajlhVzFFcTNlRm1jSUdGYlc5?=
 =?utf-8?B?R1NQNXFSYnJ5SnRJNU1YRVhNOUVpU213QW95NFZOVU51UXJDaytkK3MzWW1u?=
 =?utf-8?B?cktlNk4vaUU5dnhGTGJPZ0t2UEh6Z3NBSXhjSmx0RkRnNTVVakZVVTNFTy8v?=
 =?utf-8?B?Z2N6MjNJK1BhTFg5VzhUTTZ6SGo5T05TajA2bHhhRVl4d0Z3WFVvbXJ4Ylpo?=
 =?utf-8?B?T2xNaGNHSDVrSml2cEU4bTBBMTZVblU4QjdGNlRmcTU3MnFpZGlmVmJFUzI5?=
 =?utf-8?B?azY5T2lKWlRvTlcxL1U1ajVTVkI1SlhJVWhqTGoyTUEvVE9uMzd6bVdoS3Q1?=
 =?utf-8?B?S1k1UHIyYk1LSDhVS01rVmliMlZvcTM0YStqNld1N0Z0NWhuNENYb2l0R3Zl?=
 =?utf-8?B?Qnc5akdSdW5TV0svMDJkQlhZcGFWOXExQWhDZHEveFl1M05sRHhEVUpMSEtp?=
 =?utf-8?Q?/rz8=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:58:32.2102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5cbd82-262b-470d-51a3-08de3f17759d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7175
X-Proofpoint-GUID: 3WEkf0T3qa3SYWVigUYa68RkM2r7Kd_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEzMyBTYWx0ZWRfXwTe1FsG2/xoX
 UXkh/qq25AMx5CKX1CQXJUX6M1XQPM4tL7/jAZu9teDnRS9o44h6KY0MWSQYddqYlIZk3YMdBus
 OnerrxBdXbO8a/rpGhoCamLlLRrdUalnBlvCTR099Lrgnq1tmv9wlOhFvEp6N7ZA1v1zwuvfaU+
 xzbRuvcKlPXGlhwoXjrRfPw4qR4jQ1PPA8v1KiPD4JqSW6ltW4knoySjfs0y8Kf8ulk08AlDShK
 LGettzHGELu5t1Puc54gpbpKzzWcVpJo9bjOsudXgnksIwSS683YgZ1FuvN3I+v2AJIwKtCT1Za
 akjAsxXV/xSecRqQWvcZrLmZaFp133lNp2HWymGJxiU3efDBbem0UdTvK9jWHcH11XF3th9i64+
 jxz+Vxtjaxp98P8aRaiy4tRcboZTrxiQbKkaSiLzJdz+PmgDfdQz+azkxMUPiMGY31YXig9kjV5
 MZ7EnAA78jqTYXZHv3Q==
X-Authority-Analysis: v=2.4 cv=G+4R0tk5 c=1 sm=1 tr=0 ts=6945762b cx=c_pps
 a=Wm5aeSjH12BsbKEBP/jB+g==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=TcYYUubLoMKjKQuDwYYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 3WEkf0T3qa3SYWVigUYa68RkM2r7Kd_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190133

Add the power-domain property in the csi node of stm32mp251.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..c83fa864eb3d 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1589,6 +1589,7 @@ csi: csi@48020000 {
 					 <&rcc CK_KER_CSIPHY>;
 				clock-names = "pclk", "txesc", "csi2phy";
 				access-controllers = <&rifsc 86>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 

-- 
2.34.1


