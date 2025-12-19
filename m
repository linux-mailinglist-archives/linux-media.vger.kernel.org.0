Return-Path: <linux-media+bounces-49181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE63BCD046B
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2689C309F20C
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E62338587;
	Fri, 19 Dec 2025 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LLYntKS3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9D13375CB;
	Fri, 19 Dec 2025 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154684; cv=fail; b=llabe2Ge+qPPMWirMx5U3Y3plrZPdFvo1Dr+gfIKCSmbBcAHeo1jKo4lIVImsLreG2K5TBsKuwMD3dDwaLW8uctbRBxJQRvOVU3+syKbkxkUopitfpvueSPDnpM/qQ6hV0FtDRBCoNRoNMJQpbxkC1ZB2RVU4FMtgpTI0jaVGDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154684; c=relaxed/simple;
	bh=XDpAn+Sv2oeyfFZ6SiLUsllftEnl9g19NsOjqu/L4L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YV/0BoNrwWELEL2fZ+xiiasm2N4mDHVsuOXpV3TGDltxzB22L3Y870K5RXDgypDVjXJIAFLqS73qtECZEkrmKHBbDsAFke4C+mQ6g+Yn2WzONO8x/YmwwRI978jNu2Wa2bZvpdTkaEC5WPY/UO1b3TfYIXpI2OCgC7wYLPTWo80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LLYntKS3; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJE6MJU449819;
	Fri, 19 Dec 2025 15:30:53 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31bp0h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 15:30:53 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQRWg9V/MIeH7svnXLIBxs7Oyj6n4kWK8mmPmvD/7Jfxm/B9zQOnfT/mGZNg03NDbH82I4WCpU0y9MABTHMcUeJYZgxVdSCF/hYuPg1zvkpnSzQOoAx6TkFCxLECYASSGohNfh4Q0mqEJEVZ7J9k3+dOXgd7O/TbibafpX1w3sR0BYBjThvkeJIOynpUsP+ezlAHjH+mJw0N1C5HTye4rTh0IQHHyMImugSmnfYpurzGNWdE5Ytwy6Lvxguj//ZdFx81NX3cURr63c+nBA3yBhHf6SJFfYfy0RDrUTP/YyT+LSZ/runIX/2vz88HZVUrqoq9V2So3hHVjhjB+je2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csNo7wVFl5X8AavvKBJRxL88T+QyATwTlRtYkNnS5eU=;
 b=kEFa0ZDEDa3vOMwbsc0e4WmIZV8UYqGLVSOixN0O5D9k8jRKfwnyhYZbwJHQ93QG7BFay3kfbOdd9UI2ylU3qFNoRAsAs5VsGHF9gt0K+Ppzxs1PrPeA2hjo0Z7+2v9ffgZkIp97txdPA0zqK0ZOGJeoTUvtU602ShKzZRMrlVQFt3Pp/pw9jwgWIshrQ4D50X7LNZ+zChBkDdKFGWyz/weTnAoiozIsK9h138Mpnzv4iQW+Q+ntxf6FpI0CI7GaTC2lpPQzAahNGdEQSw85QbJoFTxgY20sRYPBE44lPPjWYlE5p86yvcUg1x1eW8aEDBspbS0xl3ySojeUCpVCQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csNo7wVFl5X8AavvKBJRxL88T+QyATwTlRtYkNnS5eU=;
 b=LLYntKS3lPxG+1V04JHmSFT8HQpcDSIViA0uFkbf/sGwKSWCH3FJ+JQHUsUSfGZ+SF2UhiR8IFQOMX312FD/ZuHGcq7S1LzSoHWuxjKr1aiA1rm3o+Uf3lLIW/d/06H+7YxCwJ3G3RR8SDYBui/AUkyzrrPo7DgF5TwI69vdgnTMxt3IwQpW+SyH1OyD2Ejb21V4/hXrIaVNXzbzko0zcyYvKtGPbpCF8jmqj/4CyK0kY2zJ89zkW3lCxYqiOPX29zonjPPqR+0EYYxNQ5rk+VFJJZoTnb57BIuTiCRrrGUWdYszBLLXn/adcFvWmp/6l8ma0cBtzUZ59dDWK9oyDw==
Received: from AS9PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:20b:462::13)
 by AM0PR10MB3156.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 14:30:51 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:462:cafe::7a) by AS9PR06CA0017.outlook.office365.com
 (2603:10a6:20b:462::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 14:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 14:30:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:31:40 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:30:50 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 15:30:36 +0100
Subject: [PATCH 2/6] media: stm32: dcmipp: byteproc: disable compose for
 all bayers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-dcmipp-enhancements-v1-2-e2f8d46f022c@foss.st.com>
References: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
In-Reply-To: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|AM0PR10MB3156:EE_
X-MS-Office365-Filtering-Correlation-Id: 450c2ca2-2afb-41d3-a92a-08de3f0b35f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cCt3dDNsYnM3bnM1ZjJIdTRRL0E1M1lrTTF5RFRZbUhva3JFNE1VS1RhUDNR?=
 =?utf-8?B?T0E2WnhkSDdSQVFHZnNLY3BMcVFOQXJnMUxVWk5HVjRZWkNrRVBpSkZ4ai85?=
 =?utf-8?B?L2o3MlZSWlFKelZsZFNpVmRqTXY2R0VYVXpsNDFENlNVUW1nUlpoemNqN1lZ?=
 =?utf-8?B?UWJ0L1E5K1NpVTlGSUs0N3VBZ2hKczRkcFBmRmJ6SUJydWFoNStlNzFWWW5R?=
 =?utf-8?B?bW9HekhmNEplMzNyNFRONTkxeHBHWE5aYitMdjFDZTk2VHVxS3RvOG5IVUxU?=
 =?utf-8?B?OTBCd3ZUTjRBY3Y2dmMxM2tMVmhEb0w0djk4UGkwMUp2NkdSSmNlM2NUbjd6?=
 =?utf-8?B?Q3BMNGY1UHl4RTlaZEJOZ3pTdXlDbElGakp1U21YbUtzRGt4aDNYd0ZFU2x5?=
 =?utf-8?B?UnJmMVZSTFNyUnQvZ2Z3bCthemV5WW9aNkhrMUV4eU56YU9vZTZrcEJZazFG?=
 =?utf-8?B?cUhqOWlRZHNOczZqYWNQYU40YldqZFEyR005bFh1VTBWRit6ZjFzeDlObnU2?=
 =?utf-8?B?RDlIRGJjdzlkV0NvTjFaWUFzb3VCVVFvT1JDa1B3bEdyTVZReW8zeXN2dzNB?=
 =?utf-8?B?WDNWRmlMcm9ocmlJaUE4aFpvdVdYZzlEYk5GNmlKL0V1Uk1lOGVNUGdoQmt4?=
 =?utf-8?B?QUFpS2RxY2pEbi9jcnE5MGFEd0FhZGdIZEJjb05uMWg3UGpVYVQrWUhFSGRo?=
 =?utf-8?B?bmNGZE1lTWs0cjdZMmtTRE9CaTRPNjkvSWVqVXVKanFqSlBVeGl5QWw5NVFh?=
 =?utf-8?B?eUcwUXJMSnNXSnd0UEVWUDd1eVFIV0hIU0xwdjdwaEZNWEdZRW1lOE1HQzZ3?=
 =?utf-8?B?L2dxekdEb1dEYnJtdzMzclk4NFhNR2NRSkQyNHBTSWFpd2VwMFAraVpOaGN0?=
 =?utf-8?B?TVk3eVVieVpSaC8rUVZ1ZmZJNThoRjZ4SHlhODdaeEtVQ0d5YzlmL3l1YWo0?=
 =?utf-8?B?UzhGVXI3NEMzbSthamlLMXJtZTF2SGUvUFA5T2JqQWhUUytJc2k0bUFHaitI?=
 =?utf-8?B?SWtsZjJ6Q3AyOXhKL1hORVJyN0Y4OUV0N3RFYmc1RUtzc1I5cGdtRzZGZUpG?=
 =?utf-8?B?cmhUL2NPZjBZRlppSVdIQ29XbEdZQ3F4QlFQa2pUZnVKSDRpcmNDSVZjLzZL?=
 =?utf-8?B?UzVMakw2YTNkR1BHM0VSaU80SGdzVU9MZ0U3UFRlUjQxRk5LVFRyOFNYQ0pC?=
 =?utf-8?B?dm1GVHVBTHozSVRZRTZyL0dtKzVuZzhVbmJ2NlZvd1lqVitQQ2xVVEdNZWQ4?=
 =?utf-8?B?MTNpK280SGhWeE11MEpGYzY0S1QyYkhUblo0clYrUUllbVRGUk9aak5jeXFO?=
 =?utf-8?B?MWF1d0RwYU1ndFFxNU9rNDVzb0hYcWNzemQ2cW5pdUZ2b25VN3dEdmUyT0E1?=
 =?utf-8?B?ZUwwMmQrZVZxa2ozb0svSFhoTmlZakQ2a216dGNWaUZXWEh2Q2EyTENYTExx?=
 =?utf-8?B?eUhtc2xtVE1VVnJ2N1pwVitMZm1yTEJoeWZoZ2Y4ajhrYlErUWk3d0NTZXE4?=
 =?utf-8?B?eFprQW1VZTF6Q0dEbVFGR2R0MlNhNkZ5d1I2TUJ1bmErY1pNWHJ0a2J1azJw?=
 =?utf-8?B?VEwxY1FoeWlVMzcxdVErT2N0KzdjdzU5NUd0am1MOFNWUTIyZldCd08wUGFJ?=
 =?utf-8?B?ZmZzMVByZU5WUytSbnFzQ3RkYU0rcnY1QTNUeHZndGhOUFM4Q1UralZ1eEtq?=
 =?utf-8?B?VDVWczg5aEt6YXdWbURsQzIwYlR1NThGK0VwT1hqbHl5aGY4YVc2Mk5wb1dn?=
 =?utf-8?B?VloraTcxT2U2RFVXclMrSVJjMjNWcWczUE5BWW9qNHMwRjlhWG0wQnQ5Qi9H?=
 =?utf-8?B?N2RBZ2dNVGMwMDZVWEJHOFRxU3FnRzA5RmFLL3ZZVjAzSmhsNTdHVmVXcVpW?=
 =?utf-8?B?TFBuMjJPbEdndW5vV0lxOUtDUFB2R3dTUFdhNmpJWnZtNjdUcFJJTGVMelFl?=
 =?utf-8?B?WE4zd2hkTnZhQVl6L0FKejlIeUxiVHpWZ3RieWVjMjBjSjdVbmllU0txbXc1?=
 =?utf-8?B?bmpwVFBPdUtqZHhQNzVOZWZvQlp0eUVUK0lVVGpIa3BRWk56OS9kQjlKWTRE?=
 =?utf-8?B?UDV4NjJJZkRocG5ES1BKM2YxUks4UURjSzVlQ1lSdDFjSE43UWhmU01qVHN1?=
 =?utf-8?Q?kArQ=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:30:51.5068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450c2ca2-2afb-41d3-a92a-08de3f0b35f9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3156
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMSBTYWx0ZWRfX/CZngveaZJab
 Yq4C+zpJ7tXvuHS9sWczDTNbRnzfzYVK2r2HVNa+8qzxHSWhbeG19XyGJ9aoWxmKoeHy9BPX1/r
 MvpyepYmA4yqlTzvT+v6svg0oBfbq0IlucoxcysDi19ybz/lN4KsH4Yu37W5/TPo/ekkTDKCBnL
 zIg8z6E2H0vmKymJyDTK+Axn2hxy2Lui33KHbaXpuF3jSuBWBGaTPNTtMjv/yoeBdXf5I8Kiu9G
 ib2augGEaj+Pf4Vs6ce2aY0nbhdL78+/AjCNRIjEVa0MzlrRd7a9W1HG0DHyXMzC+Iakd999zRB
 Gbu3qMQ4L5I7B8iYycVu04g5OB3KrUWFWa9KMEFpdQ0/xmgMeWJ8VoPOdDJzvbYmgM3DJjWne04
 bnO/j2klgKW4DRfL3sc68vgM2s16E3vusRuevZpFDMiZw1OwZzEtlvzrUsMSsDJvPXWi9vikD3r
 sPfgTQ4SU4+OUvwSLsA==
X-Authority-Analysis: v=2.4 cv=e9ALiKp/ c=1 sm=1 tr=0 ts=6945619d cx=c_pps
 a=OdbLnzhLelEqtRUqioBy+g==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Pp28VEXKKhAU6vDGe-QA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: FFj0-GD6ROgG7nBYMPbEe0mqZckp9e79
X-Proofpoint-GUID: FFj0-GD6ROgG7nBYMPbEe0mqZckp9e79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190121

Avoid possibility to perform compose on all frames which mbus code is
within the bayer range or jpeg format.

Fixes: 822c72eb1519 ("media: stm32: dcmipp: add bayer 10~14 bits formats")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index db76a02a1848..ec1d773d5ad1 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -130,11 +130,8 @@ static void dcmipp_byteproc_adjust_compose(struct v4l2_rect *r,
 	r->left = 0;
 
 	/* Compose is not possible for JPEG or Bayer formats */
-	if (fmt->code == MEDIA_BUS_FMT_JPEG_1X8 ||
-	    fmt->code == MEDIA_BUS_FMT_SBGGR8_1X8 ||
-	    fmt->code == MEDIA_BUS_FMT_SGBRG8_1X8 ||
-	    fmt->code == MEDIA_BUS_FMT_SGRBG8_1X8 ||
-	    fmt->code == MEDIA_BUS_FMT_SRGGB8_1X8) {
+	if (fmt->code >= MEDIA_BUS_FMT_SBGGR8_1X8 &&
+	    fmt->code <= MEDIA_BUS_FMT_JPEG_1X8) {
 		r->width = fmt->width;
 		r->height = fmt->height;
 		return;

-- 
2.34.1


