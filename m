Return-Path: <linux-media+bounces-45336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF370BFFB85
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 09:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB893A9AB7
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 07:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6782DC777;
	Thu, 23 Oct 2025 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="IPlBLcGN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB22C0F76;
	Thu, 23 Oct 2025 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761205956; cv=fail; b=tr0E+VUX5KtimCDOKpIWkfEn+b6gM20d7hwMqiwErSn5Z6l/bmJUN4SXgBZ+r7lBoE8QpEXaxSwF8qI3TZfe00jd5dyUbcx42gLcdoCkZPXrG0qti+rLlxn+k6Jfn0ux9xuWtSv/mWi51niSyZY4w/a3ZTN33EPt31e5AhxjOd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761205956; c=relaxed/simple;
	bh=wHWoE4He4dJXhyZm5rsLKCz1uEVeuk3COkDT8Suydqo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=FW5ounumwy2Wrf9YJEwfZxr10h3MHLfoTgBbiqFxGVyqWHVRJ0Y7cUncD6W4nxuicDztOckFlu8e7MQiUt7YHP81GWH7JNGOFacSbAF68YgCbfb9HjdAwb0NghEBt4gmxwWApROu6+ntl0sO7+Tz9FN0CVmeOCqCn40Tg7kva0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=IPlBLcGN; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N57YCE007302;
	Thu, 23 Oct 2025 09:52:18 +0200
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49v017p19e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 09:52:18 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaWqlKMm3g9nuTabVbifeTMXFo7vqIGcLZfGa97zWrXZrTKQDhMVMsqjDv75RO5q7CQCplXt+2sNxyiLGOio+Gey4IknnKAOFqJd2pByqEBH67549liXd9UCWuO2W19SQgHmUAp9AARERXxtmow6iN+JwqFqAW/v5GxIcbqynM/K/HZ7JFnM0H0uVmJgQ2IikIu9IwsYWikbOdTwcfX9rg+iHml/Pd9gdFbcP8F/zWLVuUJvM/rlewXOdxCZe6vy2OtJfwgJSiDXUk2RtGmUVCQouKDUZF7buK0PN2xssv24Fh1KlZrmbhiAxVx1yQAeAEoiEkyMu0P3M7Rh74IvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p/ExPyjgYyuSc54Ed96h/k80RXZmamisCuab0xJs3o=;
 b=IjuQsiHDI+NuYRvFSvVe4krwv1+qRHOGbgUk+dj/h2yEd06eiM63OcaW6W4yHMKFli22bXlGsJHCUM44+EmpR0Uxp9gecq7iQuO4VlhGAMowoAZdzjO1eHx4fh3EwH05wXWCy96TRtrX+VRzGvofIOg9dUcHYexC3GHF0YXCv+85fLyGdZ4NQMYNDvQbroWR2Zo9NrZIZHi+TXjQPZJhQGlPiVT3JLEgsPHWMYo6x3V77mSYS6MMzZ5RfYKEpSLpAFldOEJon2a64JYIV8Cv2p1IW1J68SeuIEn4A1Turkh2w6wiOKSpCNrnHa+qDyLRfX6qbYGp1x7EwvckM4a4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p/ExPyjgYyuSc54Ed96h/k80RXZmamisCuab0xJs3o=;
 b=IPlBLcGNJtOnKQnUrwKFaLRoMjslfCNzWIWjODyYT1YE+s+jezPOZZg28vST/fflk6MkIoUXQFLrjfjccnExl8aDSYKpF2Hx+f5O8MmL8fm27LSfkhPE0mf+f6xeWLamm4P6wrsbfkGL3OBtYp1rE7pV++wZndBmENF1C6v0UkFd2WFKj4GOuCCJbQx+FIp+tMLQVfTG3bJyh7UtIUn9prr6b7ygoNv2tM+7VHZDoivHSfrfL2zF7t89HNZBx2EgpjKn9aX5MT6egF9xFwB+x446/Ns/DMhm8JR8VdU9HyWrZ0VbnN2BxIs90mnGMBC0XUP/x2JWXyaMbqgihLfsHg==
Received: from CWLP265CA0474.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::12)
 by DB9PR10MB8095.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 07:52:14 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::7f) by CWLP265CA0474.outlook.office365.com
 (2603:10a6:400:1d4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 07:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 07:52:13 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 09:45:15 +0200
Received: from [10.130.78.67] (10.130.78.67) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 23 Oct
 2025 09:52:12 +0200
Message-ID: <0e192362-7705-4486-bf4d-3697b3a42720@foss.st.com>
Date: Thu, 23 Oct 2025 09:52:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: i2c: vd55g1: Support vd65g4 RGB variant
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250819-vd55g1_add_vd65g4-v2-0-500547ac4051@foss.st.com>
 <81c24fde-9b0c-4da3-bdac-67a7460819d4@foss.st.com>
Content-Language: en-US
In-Reply-To: <81c24fde-9b0c-4da3-bdac-67a7460819d4@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|DB9PR10MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 497297d7-eb5a-4730-c812-08de12091412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3BVL0RVRUtzWTNWTDNVdFlQRGp6OUJYOElMS2dmV21JdU9DRm05Qkg4NUZY?=
 =?utf-8?B?cFlVVytjZTBpVC90TmNqUW03a1R3aVRmYkpTTkNUMDR2aGxES25HL1RweWRa?=
 =?utf-8?B?QkFTSFJoellRQVVYZjRQS2EwN01wWFpMaTZPdTJscWdWdS9TUGlBRU9XbzFQ?=
 =?utf-8?B?R2lyN1FoR2hXWU5iWEQyMkFaRkU4TnY5d0pJaEdtSXNkYXMzRVVEaHFJNGhO?=
 =?utf-8?B?c1RabHNwMXRMQm1kM3pKeWQ2ckkzTGRMRXhzSWNLSU9wNzk0Ujd2Sy8xQTk1?=
 =?utf-8?B?UGMxWlFQbkkzZjJmTGR4Sm9uRlk0L1dYZjdsdWtSWXNYdUIvcEk4dzM2dFM2?=
 =?utf-8?B?enB4aVpWdk5jc2hHem1sSi9UN2V3THEzQ2VEV2JxSHhFbk4rSmtWSkhKUS84?=
 =?utf-8?B?QkdiTlBQZEJncWJON2hNT0VPQnlWNDV2WnBMR0h6K040Y29JdEh0K1pWeDY2?=
 =?utf-8?B?Ri9VNGpaWTg5M2tnMjVpNHo5VldQS1pKbVRpbm1EUnZOM0d6S0M4d25lc0sz?=
 =?utf-8?B?empaN0RQdEVCWmc3c2tudStTbnhpQnc1dG55Nm9tMEkvRjgwZ0RjKzFXSmdG?=
 =?utf-8?B?UG1XRW1qejZJVWsxOWtXWEVmK0NmVm9FYTBVbHEyK2ZRb3FDdkhYSzVyc2o3?=
 =?utf-8?B?ckw4My9INVFocHg5bWQvWksvQkNjRnlNUDArdjdZQmZyUnNyU3A4RjBHenFF?=
 =?utf-8?B?VXNoZ1V6WGtzTHBTK2ptblVQYTNUKzh1OFRvZldYK1prdUtPRjNFMUpzK2VQ?=
 =?utf-8?B?UjJiQWh0L1BtRy9xNFU5Z2ZKMFEreDFQeHNrK3FHbjlIS2tXMXp0VExpdEcw?=
 =?utf-8?B?R3JhTVV4Vk5MQkltc0FFUWNmK2RSb3VFWEVhVWlnWno0SWt1VVVGWnZXZ3Ba?=
 =?utf-8?B?eXBrUXUxZXJhUlo4bi94V3JQS01wa1JsV3BHWDdqK1lBU3NISGFUNWo4TkFK?=
 =?utf-8?B?akpvQkYweEtWV0xLdHR1c0pqdis5R3pFQUNNNjFLMmk2QUcvclRiZ2hDVFlZ?=
 =?utf-8?B?ZjBHdUlyK09qZXRtQkZVUVpWM2JhR3h6Zm1xUjNSZHJKM0d2Y1E3UGhUYkJX?=
 =?utf-8?B?NlBpRkJLTEgvZ3kvTXYzK2RRNitsZlRZYnNkWmwyZEJrSFpQcExEQktaTkR1?=
 =?utf-8?B?NGxlYVRtODR0cVJiUHRyRk1hM08zNzAyeklWQnc3M1BybnlZMzJsTmtyQk1B?=
 =?utf-8?B?V1JHdUE1NVZCR2JVRnd0bW1zcTc1KzE0S002YWdna1dscmVRQTVSSlNhNFJC?=
 =?utf-8?B?VGtFTHR2NGNxbk9LVko2ZitQNW1sdXRIOHFVR0UrMC9MNnZTTmlQZGFLVldo?=
 =?utf-8?B?OWY5VTRrdnJvYTl0MzRkRFlzeC9NbmFIckxjWElPcndBWld5clNFdnZBMTNM?=
 =?utf-8?B?N0NvbGpSai85MENpT1g0WDNsSHhSM0Y3NDZFT2QrcTdnNXJqZXVGUmtoSEd3?=
 =?utf-8?B?aWJLZkIxOXBpOGVmZVlPM2dNRG9oVXUwTGdPaEg5djRlVmE1RGd3ZDFBckNS?=
 =?utf-8?B?KzBaekY2NmNmeEduT0p6TmlOcFJUZUhoZlpMWTFPRWFJaTYrSHpyYjM3ckI2?=
 =?utf-8?B?ZGN1OC9kUlVTMFlFcHNpaGZGMGZDRGtka2ZVUCs4NlUrTStHQnVpZVZoZjNQ?=
 =?utf-8?B?RmdLdHN4Zkk3Tld2a3hjdkxLYlFTNUdJa1A3Mi8yeXZsK2RSYkM2R1hnSnJE?=
 =?utf-8?B?amRVWlJGR09yT2tIQWhhajdZUTNKbUEwVDZjZ0RoRWtpQzlBVnJKNEZaa1pt?=
 =?utf-8?B?YVYzZGtLRUJlZlpxbE1rOXBTS0ZKclM2aWFNc3dsaGxzNW5CK3p4OS82enRV?=
 =?utf-8?B?b0tUZjVBcTBxbUphempGNHBCd3EvcFVEWUNpTUFEdzV6TFp3cXh1dzNrSWZ4?=
 =?utf-8?B?YkNMR2MxQ1ZrK1VFd3RDWmNicklRUm9obXBwNk45MS85VkVsamFaVVRmOEoy?=
 =?utf-8?B?eVNUbHc0YlJobWFMb2s5ZmZMNkZWd2o3N0RLNmdqelExT29SVDdDTHY1Uisw?=
 =?utf-8?B?TlhvNCtOc2RRdE9jRnFQL1hZd2RPMzdIeHA4NHk0K3F3QVZrbDFBUkg5QXRR?=
 =?utf-8?B?MnIwYTVtM3RjNGFyTDJxdWJVN0swWUM5OVVKTTVjWE5GQ3VZcFY2dnREbFc1?=
 =?utf-8?Q?pZls=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 07:52:13.2724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 497297d7-eb5a-4730-c812-08de12091412
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8095
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDE4NiBTYWx0ZWRfXweAMNaVuDZ+o
 tTJnu1Sqf1vntYBeI6MgRsOu8Qoj7Es4ylZd8FO7ZiotLUJh7RvUKFvwVyiDgeXPVYR4jPKmRob
 0YTRVlX67cg4TrdVxKvJPbPZ1FGkAmia7kysY2mxrYRW4dFoN3iv9DTcB8pkAALlw59x2IgwCwz
 p1SgqN5LjkCVeBw169t+8sUjIk2u7mE2lIAWhzdzRaOAv6Wi4KLl4M16lNbYtyxcI9g+2qFAsdC
 e2v7DXRookTp+QCHo4dzzjMOz+YCDpdh2+jKU2bIPod9/QPhAo/xvKPepHY186t93PdqyHhYgCc
 aMZZjisbJWcRiA7WxMBvuMDyX77fFowGxrsjU/nKnz+pOFqdBht7UVIF4RJwMyGmpliFBgggY9b
 qNzzc4FAC1cvByTfxuw3nT0uiDZO6Q==
X-Authority-Analysis: v=2.4 cv=CYwFJbrl c=1 sm=1 tr=0 ts=68f9deb2 cx=c_pps
 a=H6LALYfxwt1dZiozdb8jwQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=WaRyL3-Hq7oA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=0vzbTO5JVv8L63xkM8AA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: L0ZWwC3RU7KnjcluHHhRI1hN_SfZ3GjH
X-Proofpoint-ORIG-GUID: L0ZWwC3RU7KnjcluHHhRI1hN_SfZ3GjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510170186

Hi Sakari,

On 9/18/25 14:46, Benjamin Mugnier wrote:
> Hi Sakari,
> 
> On 8/19/25 16:47, Benjamin Mugnier wrote:
>> This serie adds the support for the vd65g4, the color variant of the
>> vd55g1.
>>
>> First patch is the device tree bindings update, while the second is the
>> driver support per se.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> 
> Is there anything blocking for this series ?

Did this series slip through the cracks ? Having it reviewed would
greatly help me getting my downstream version closer to the upstream one :)

Thank you.

> 
>> ---
>> Changes in v2:
>> - Fix smatch warning about vd55g1_mbus_formats_bayer potential overflow
>> - Fix vd55g1_mbus_formats_bayer dimensions
>> - Link to v1: https://lore.kernel.org/r/20250819-vd55g1_add_vd65g4-v1-0-b48646456c23@foss.st.com
>>
>> ---
>> Benjamin Mugnier (2):
>>       media: dt-bindings: vd55g1: Add vd65g4 compatible
>>       media: i2c: vd55g1: Add support for vd65g4 RGB variant
>>
>>  .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |   6 +-
>>  drivers/media/i2c/vd55g1.c                         | 234 +++++++++++++++------
>>  2 files changed, 172 insertions(+), 68 deletions(-)
>> ---
>> base-commit: 2412f16c9afa7710778fc032139a6df38b68fd7c
>> change-id: 20250818-vd55g1_add_vd65g4-8e8518ef6506
>>
>> Best regards,
> 

-- 
Regards,
Benjamin

