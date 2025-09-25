Return-Path: <linux-media+bounces-43130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618DB9DD52
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 09:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F79017C412
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 07:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E502E7194;
	Thu, 25 Sep 2025 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LrCaS6L/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC6C35959
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758784673; cv=fail; b=OO9jAPAHFl3EFEyefA6B5TDVEZu6kebe8PGe7+8IjON7RmXzYSeYQ/Sp5DYFeErVvqk+Ip5b0xRHWWsksQrZ3eB1QncTFcc0xCzQ2nkuhUVNNVDhLAbHHf/OnNxqkxwc6Twkg5pjh5fXYGfCJnKJJJeW1FMyFAq4Q+Dg36J3FbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758784673; c=relaxed/simple;
	bh=gG3zUpGObCOKNe6y/zwUlxJWrReLnd/ogJOS9FrBoN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F1u/QAR9Ws/4rVsJylq4VM1fF2A+5nYywJLvYAUm3t2aHvx5jiHZMzumPW1CrRu0qpTVrdPeuqZJ5WNTjh6P1GyC2rAd3jTKKhNs68aOBSnxmkAvGBR0igJKzwjITvsBA7ZtOfJCdGN5+dE75Fow46MNnoUQZfdqBrzicPbXyOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LrCaS6L/; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P67fH6009964;
	Thu, 25 Sep 2025 09:17:46 +0200
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49a77mbat8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 09:17:46 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vs11p/dzn5Vpxsd69CVtbr9fujS4FY8UL1+gF4EGUSGN1XRtXgu/OEUNW3kzCId5QZh9Qut7NfbO6uDPk5aMgs+qsFsggzhV4bJGw6YLPo8KzrUvETisIfAHaM6C1roGt3fsNPX0AyN34ELChH32MTwoT+6QaTO4qNj60Tx7SL7ZpgBgyXgawN/3+tG/QDyTSI78TVSIX9dRzqXNvxPg7UiZFQL2zPlMqVAVkCPWF3ppJ0spvyo+l/EAmZRc8AknS++dMnGXYbxtrXmF3MxhRYRyksjDc0AsSOqMGlJ8sIH1RTdj4gmcns5DPsTXOnUDYY2QWT8GF3e7aPeqYUFGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wht9TW+9yk8Od1BeyRTHOU030/I6ws1qAaDMRlhEhWQ=;
 b=a61QFaMaezzdJxn8NLq3s5MvGD/VIowToSpY/LiuTCp5qYoFW2rPu78XXEgoJks0u7Ol5B8T2mNSL8KhmiyJEeZHc8g2NACfx69EPr/p0KCgtof/iBdBSaq6CTMb9ghciCxQC80z9SM3fe8eTgg+8sKnUSMJgkg3UWUOHq2r0bgMOa1PAKzOqZx/ZELyP0i0KuzsTYd0AuKsOW8HEU+FxhP2doqKzzxF07UhEq4B7r03lCMWXbD1TeQ4gBOzc7NXW4AO/hp7cclspDZsh22kTCtpOIaO5PrjkULX6ikcX5WuSbjiUp9XxRxxI2RIbwiF235srEeudPQyZ6XpRP1AAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wht9TW+9yk8Od1BeyRTHOU030/I6ws1qAaDMRlhEhWQ=;
 b=LrCaS6L/bNUMpoyTQLSKREpBYu44LhCsXcB5uhbe1Zawzp9gw+uVlvCWLoQvakse6jVhDnpEhU5ekIoYex0k7F9EpDmtF371fQ97lOhtx+8Ory9Fvy5Y0jTjNbefGczzvbR/HpqQyzeflF/PHU2YtgtilTYlhgPAc/UnR9wIlbj0x6Vv/GlJeaCV4UddsDhqZlV5OopZGP9W+BkcL0FcGbvQix8bawu2qimDdq6cTQzIElDzXBGdFgDDVYmlcYKTU2364LOkLr3Ujac4su7zcyCWtu1/dyhMVYHl6tN7Kn5+f+mfGXhjjk8iRcLoiIE+k+/PCq+8Ja1gstyIyV/V/w==
Received: from DUZPR01CA0166.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::9) by PA2PR10MB8529.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:41a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 07:17:43 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::af) by DUZPR01CA0166.outlook.office365.com
 (2603:10a6:10:4b3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 07:17:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 07:17:43 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 25 Sep
 2025 09:08:14 +0200
Received: from [10.130.78.67] (10.130.78.67) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 25 Sep
 2025 09:10:29 +0200
Message-ID: <9200d8fb-56f3-4ffb-8379-347d5acc250a@foss.st.com>
Date: Thu, 25 Sep 2025 09:10:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4l-utils v2] v4l2-ctl: Fix failure on controls starting
 with a digit
To: <linux-media@vger.kernel.org>, <hverkuil@kernel.org>
References: <20250819-fix_3alock-v2-1-84953c908075@foss.st.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250819-fix_3alock-v2-1-84953c908075@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|PA2PR10MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6b1765-1cf6-477d-b346-08ddfc039eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFlPNEIwb28wL3lkd3ZlWEdmeDZDRk04Q0ZXY2cyNGJFc0lrc2VUQUhGaGdi?=
 =?utf-8?B?UnU0RlpCRzB4TTNsTkpvUUJQVmpNUEVpSlZLOHgycUtqQjBQNUUyaExyQm4y?=
 =?utf-8?B?TlAwT2NTYzV5Q3dwd0xPbjl4QVpOaWxkMlRybHA4clZVeS90czNYL0VPMG9L?=
 =?utf-8?B?MVVJVFRtRVJwNGZTTFE5RitpaXo0cmpEMWFJb01nL1BwTXk5OFB4ZHVQWVRP?=
 =?utf-8?B?eWJjd3U1QXEvdHNFK3NGM1JPQUFMckw0Tm5hZmRML3FCKzRacTFJRS9ENy9J?=
 =?utf-8?B?czU1Vkw1aHdJcjlkYnQ2YXV1UnEvVVkva3UyY2ZnemlDR3NwWWtvMTJwVUUy?=
 =?utf-8?B?NWhPcnVSeVJmNzNSYTdtYnRZQ3FYbFRuL2c4MEY0T2FoZGxyYmVVODZBOGl4?=
 =?utf-8?B?eTU0V3BKNk5LK3BpVGNqbkt3UzNwYzFVQ2tTUlhZYlg0QkxaeTk0NllHNHVa?=
 =?utf-8?B?dTcvRmo1TFQ1Njg1YnE0bWNmVWorYlNuSm1wRm9TaEs4cWcvaEt0MmlPRWEz?=
 =?utf-8?B?NGFQMlVTRHVPdE5Fb3g0blFDMVNudEdTUlBOM0xUYWozYnZkTHM2V1A3Nkps?=
 =?utf-8?B?bk1GZmtZZDlhU1pSTXI0T0wvWHlvZy9HQ3BUaWUyWVJDQjZoeVNydVJRTDRl?=
 =?utf-8?B?ZG81M1RObFhVYlQ5VzVFaEdvRko0ZDBCQXk2NzdhYk5qbDNHZE1kbnpDWG9S?=
 =?utf-8?B?cFJhQlBpWVNaL0xCMjV4cmRnekxXWVBIR3hFOFNmUUJqWnZCMHhFTEZHNmw4?=
 =?utf-8?B?OE9jSE1hSUpkWk9OR0J0MUUya1ZIQi94dTlEeGdXd0xTRHExdmZmeTF5c1V0?=
 =?utf-8?B?aHE0WVA0SVZRb1huY0UyVnY4M1NWcWJRUlVEMUlOaGd6bVRYVFp1ZXcybFVs?=
 =?utf-8?B?akpHY1FHSTBsUDMxVXB3VjZtbTR5UVdzYUNSZkpkaDkzMXY3YnNhNERrbjRv?=
 =?utf-8?B?Rm5FWExhb0J5YjlCeFBZVHRtRGM0STV5Ym1OdVA0R0cyT0NFUDFsZGhXU2JO?=
 =?utf-8?B?NTlvL3JzNDJQd2hkTkx6QWtHbHhRZWlzbFJ3V3lTWDRZcUE0QXIxUzVyUFpm?=
 =?utf-8?B?SlAxUTlRMlQ1WFp1SVlPSFdKZVR5QXVTM1M1b3lIYTN3TG9HOUF6b0paN0xG?=
 =?utf-8?B?QWhFekpUaHg0VVlEZ3Z1eVJNVkE4ZkFIZUkwQmhMa1N2SU56Y1pHM2tSTWhq?=
 =?utf-8?B?ckFDZ0dWVTF5SWIrMmZEa0FlSUM2bGRkVG1qbEYzUFE0aEhXbEVSaDRLMDht?=
 =?utf-8?B?aVRmbU1TRCtaSG5nR2hnVXBRYmpuY2JBa0RXT1JyZlVZd09hRXpCWTdvcG0x?=
 =?utf-8?B?enZwWHRHR1pOR29UUkZxY0ZpdSs4OVFodGVyeW9XcUZnSFhxNC9yRTVqbTYw?=
 =?utf-8?B?MDZPbkhwMnFkeVFteWVxMU5ZUHYvVm5FUzFveDU1OWlKS3VLcDVMZzluQVVi?=
 =?utf-8?B?NS9uRDBJcTFXWS9UZUNSaStFN3VwdUZMeGJhWXVZQmVkMnlnaU1HSlF0dzlw?=
 =?utf-8?B?U0xjOXVwOU9maUNsWjJFczNCSW13cXloei9FMXN2cUpkQndkWHFZbUNuSnc3?=
 =?utf-8?B?LzhCclo3WU1qL2grSDhEOC9GVlpxdVVJY3A4K1pvR0FONmRDbUxqa1ozRERh?=
 =?utf-8?B?eHh3bGE2VnNxcVNXMi9sUlowVjBNSW40YTlYTG9LbXZyVFlnaUd2Q3k3Q05G?=
 =?utf-8?B?VEJGYmg3OVRyQ3NuQ1d0eXFybEZBeVpPcHJISy9KK2dETjBySHN4ZjJBY2VQ?=
 =?utf-8?B?dGtoNWVjWkFmQUdCM2R3ekkrd3BURWFBdE5McjhmVTR4R0FmTGJPdGpwcDhq?=
 =?utf-8?B?Q2FXM09MY2ZqY2ZGbjU1c1RLTDNHcWpXUW13aTFodFc1dThVckd6NDl0SVlm?=
 =?utf-8?B?K2x5WmVpVlRKRWEzdXh5dFNFR1NNVzUzWUxRdmEvVm54NHV5ZkdoVXNkVHBa?=
 =?utf-8?B?NGJmWFBJSzlJdlg2UkVteHRtU0RKOEVabHVFbHZYZVR5Y2h1bGtlSFdTOCtX?=
 =?utf-8?B?aERvZ3BidzhnT29FMnlsWUtoK2Z1N05VbVNjU0Z1WVVCUjRKbVRmOGxZUDl0?=
 =?utf-8?Q?olVlO/?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 07:17:43.3183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6b1765-1cf6-477d-b346-08ddfc039eb9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8529
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIxMDAwNSBTYWx0ZWRfX8fRVSsr62SRt olSmlQ62qljeRsZe7ajBFTP6mlWNvcCCtICNom9vcy3shVApu+wI1h8xgb2A7n5UMvTC3BftKB+ pBJ/Xf9gdA117tw0/eMYTG7ZZCYxHBMqe69wlGbrGPcqjrjnjj3VxqSEZ9dfxJcibnNqVUllTya
 piJpxO3HUqgAVnyPMIlGHHihsaR4GAHyhPfHPP2fVyEuKqFasl1sB2S/F6j91DfdurjMWw/Q/yq EIda1vFLNsmT6y6Plh95YJXInvSJDZwiJWArSJAQRHY3vRJK26EVWzDQMCZ4YOlWp1ii4bFEv7Q WpA3GuZKEMpQOTc8TtYs2SUpW09chebNFysEIy2pRXTxjfG1FGSWrsj2WtQ3U2BsDn/cNuJhqGY 9nee0k0w
X-Authority-Analysis: v=2.4 cv=H6Tbw/Yi c=1 sm=1 tr=0 ts=68d4ec9a cx=c_pps a=kay2B06TGPuDn0YhBOuP/Q==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=WaRyL3-Hq7oA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=i_GiNyom4gaxzGMW0xEA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: DjzqpLyGZn6PJRsXJ5vHfazSAvsDOoJb
X-Proofpoint-GUID: DjzqpLyGZn6PJRsXJ5vHfazSAvsDOoJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1011 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509210005

Hi Hans,

On 8/19/25 09:07, Benjamin Mugnier wrote:
> Specifically querying the 3a_lock control from v4l2-ctl fails :
> 
>   $ v4l2-ctl -C 3a_lock
>   VIDIOC_G_EXT_CTRLS: failed: Invalid argument
>   : 0
> 
> A similar issue occurs when setting the control :
> 
>   $ v4l2-ctl -c 3a_lock=0
>   VIDIOC_S_EXT_CTRLS: failed: Invalid argument
>   Error setting controls: Invalid argument
> 
> This does not happen with other controls. Internally, v4l2-ctl parses
> its arguments in order and differentiates a control name from a value
> using this check :
> 
>   if (isdigit(s[0]))
> 
> This means if the argument starts with a letter, it is a control
> name; otherwise, it is a control value. This works well for all controls
> except for 3a_lock, which starts with a digit and is wrongly detected as
> a control value.
> 
> Currently, 3a_lock is the only control that starts with a digit.
> 
> Introduce is_digits() to check if a string contains only digits, and
> therefore would return false when parsing '3a_lock'. Use is_digits() for
> control get and set operations, and expand its use to all other relevant
> cases.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>


Just a gentle reminder regarding this patch. I'd appreciate any feedback
or review when you have a chance.

Thank you.

> ---
> Changes in v2:
> - Remove spurious debug trace
> ---
>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 8 ++++----
>  utils/v4l2-ctl/v4l2-ctl-stds.cpp   | 2 +-
>  utils/v4l2-ctl/v4l2-ctl-vidcap.cpp | 4 ++--
>  utils/v4l2-ctl/v4l2-ctl.cpp        | 4 ++--
>  utils/v4l2-ctl/v4l2-ctl.h          | 9 +++++++++
>  5 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index 32dbe9de7162258ec19c49580bd36c0971fd7fe6..98e0a2596758f69d85ef25769358cef9ce8bcb7b 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -1000,7 +1000,7 @@ void common_process_controls(cv4l_fd &fd)
>  	find_controls(fd);
>  	for (const auto &get_ctrl : get_ctrls) {
>  		std::string s = get_ctrl;
> -		if (isdigit(s[0])) {
> +		if (is_digits(s)) {
>  			__u32 id = strtoul(s.c_str(), nullptr, 0);
>  			if (ctrl_id2str.find(id) != ctrl_id2str.end())
>  				s = ctrl_id2str[id];
> @@ -1012,7 +1012,7 @@ void common_process_controls(cv4l_fd &fd)
>  	}
>  	for (const auto &set_ctrl : set_ctrls) {
>  		std::string s = set_ctrl.first;
> -		if (isdigit(s[0])) {
> +		if (is_digits(s)) {
>  			__u32 id = strtoul(s.c_str(), nullptr, 0);
>  			if (ctrl_id2str.find(id) != ctrl_id2str.end())
>  				s = ctrl_id2str[id];
> @@ -1212,7 +1212,7 @@ void common_set(cv4l_fd &_fd)
>  		memset(&ctrls, 0, sizeof(ctrls));
>  		for (const auto &set_ctrl : set_ctrls) {
>  			std::string s = set_ctrl.first;
> -			if (isdigit(s[0])) {
> +			if (is_digits(s)) {
>  				__u32 id = strtoul(s.c_str(), nullptr, 0);
>  				s = ctrl_id2str[id];
>  			}
> @@ -1359,7 +1359,7 @@ void common_get(cv4l_fd &_fd)
>  		memset(&ctrls, 0, sizeof(ctrls));
>  		for (const auto &get_ctrl : get_ctrls) {
>  			std::string s = get_ctrl;
> -			if (isdigit(s[0])) {
> +			if (is_digits(s)) {
>  				__u32 id = strtoul(s.c_str(), nullptr, 0);
>  				s = ctrl_id2str[id];
>  			}
> diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
> index 8c9abf5df687d3aeaf68089e702566854bd34bd0..5e23cc5708b7c33e4cc8562d2ec1d13c3efcd70c 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
> @@ -445,7 +445,7 @@ void stds_cmd(int ch, char *optarg)
>  			else
>  				standard = V4L2_STD_SECAM;
>  		}
> -		else if (isdigit(optarg[0])) {
> +		else if (is_digits(optarg)) {
>  			standard = strtol(optarg, nullptr, 0) | (1ULL << 63);
>  		} else {
>  			fprintf(stderr, "Unknown standard '%s'\n", optarg);
> diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> index 498362217149df1b854f138fd642dc938e7a90fb..2384200248d567d14be0628aa2e1158b345fc57f 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> @@ -133,7 +133,7 @@ void vidcap_cmd(int ch, char *optarg)
>  							   optarg[2], optarg[3]);
>  			if (be_pixfmt)
>  				frmsize.pixel_format |= 1U << 31;
> -		} else if (isdigit(optarg[0])) {
> +		} else if (is_digits(optarg)) {
>  			frmsize.pixel_format = strtol(optarg, nullptr, 0);
>  		} else {
>  			fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
> @@ -165,7 +165,7 @@ void vidcap_cmd(int ch, char *optarg)
>  							    value[2], value[3]);
>  					if (be_pixfmt)
>  						frmival.pixel_format |= 1U << 31;
> -				} else if (isdigit(optarg[0])) {
> +				} else if (is_digits(optarg)) {
>  					frmival.pixel_format = strtol(value, nullptr, 0);
>  				} else {
>  					fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index 0eb4bb5c9200a32c1fa056d73d2c1f4e050e7e23..cfe33f32f52286a5b23421ad4222918feafe03d2 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -812,7 +812,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
>  						    value[2], value[3]);
>  				if (be_pixfmt)
>  					pixelformat |= 1U << 31;
> -			} else if (isdigit(value[0])) {
> +			} else if (is_digits(value)) {
>  				pixelformat = strtol(value, nullptr, 0);
>  			} else {
>  				fprintf(stderr, "The pixelformat '%s' is invalid\n", value);
> @@ -950,7 +950,7 @@ static __u32 parse_event(const char *e, const char **name)
>  	__u32 event = 0;
>  
>  	*name = "0";
> -	if (isdigit(e[0])) {
> +	if (is_digits(e)) {
>  		event = strtoul(e, nullptr, 0);
>  		if (event == V4L2_EVENT_CTRL) {
>  			fprintf(stderr, "Missing control name for ctrl event, use ctrl=<name>\n");
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index b0d42110ca0fbbf05dc3957a6fe08f426947b871..132ac64a35414a9be47997ca1b26319ce5adc664 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -1,9 +1,11 @@
>  #ifndef _V4L2_CTL_H
>  #define _V4L2_CTL_H
>  
> +#include <algorithm>
>  #include <cstdint>
>  #include <linux/videodev2.h>
>  #include <linux/v4l2-subdev.h>
> +#include <string>
>  #include <v4l-getsubopt.h>
>  
>  #include <v4l2-info.h>
> @@ -331,6 +333,13 @@ static inline bool subscribe_event(cv4l_fd &fd, __u32 type)
>  	return !fd.subscribe_event(sub);
>  }
>  
> +static inline bool is_digits(const std::string &str)
> +{
> +	if (str.empty())
> +		return false;
> +	return std::all_of(str.begin(), str.end(), isdigit);
> +}
> +
>  #define doioctl(n, r, p) doioctl_name(n, r, p, #r)
>  
>  #define info(fmt, args...) 			\
> 
> ---
> base-commit: 48316b8a20aac35f982991b617f84fb3c104e7b0
> change-id: 20250813-fix_3alock-fdac270ae321
> 
> Best regards,

-- 
Regards,
Benjamin

