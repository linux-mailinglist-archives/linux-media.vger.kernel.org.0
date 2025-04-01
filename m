Return-Path: <linux-media+bounces-29095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D60A9A772EC
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 05:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8502616A77A
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 03:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4DC1C7006;
	Tue,  1 Apr 2025 03:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CbjpizLH"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE118DB14;
	Tue,  1 Apr 2025 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743477471; cv=fail; b=aeL3+WYqyqfnJ732n1jX04l45wNIQM8WnbqSAu8581dQTAiCraio7UcsXmy2GPLV6GCEg4dFBQCFMSQHN+i/HkZxV8z3v11DV0nnFPpjMEJHI/0hp6v7m1gi716DBc+WIiucrthEGuSlbP+ZSl41fIeIn26UeGEMCBsTUADSUNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743477471; c=relaxed/simple;
	bh=1sN2kDd3tNerRoPpX36wrOy3Qm3mNBoPiHcsqZJ1Vr0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wli7eq5U1iN7JHYhJ5r8/NafraMnIfBQlSIE6zN6rAEhKsgmv+V2bj9SK3/2P4p124VgGpJzD1WCH1Rkrhm7Vdv5zXNmZSdJlKybWNiGdk5LMbJMzr4useb7XVI5BEP8II6SqrQZT3XY02+2F/L1b0YCBa/w4DdIx1Tp36eEC8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CbjpizLH; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBrxZH21bJR4kbfufzKmQaeKYXIZyohr+T1Fqtkwp+0X+nCXBJfmIRkRnHcCAElUEZj+WSTffQEGb5ibQ5lcDouyJawog52lVM1XV6s42hS0fdSNN0h5EopL/HxhGrq0sKgvfnknivXsPaz0ZmI7IyD6qDJL+TcLYSb8leWiiZFZrDxrFWfUQsdXqqxWcY1dAgbYwBoijMvmERhM629nqPlcrt5+AT59XSQDaaeH4doitDmqKJQ0DPEo2r89Yy4xZkBC9cmlGgqN2Lgv3TdAegO5cV9+pUh1AANwYopgfiYXYjWOFk2D5AAsdomxnijd/mHh7LG4RLqOkBkSddrX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK2s9d27Zy+MVaYXzLPHRm4WVyM90ncObNRFogDz+Ho=;
 b=BX+idPvn3RtxobRq6xAaj1wnl0/A85BdanFpJxSkhaVu83apyIpfTHDYH9zZj5KR9lWzsWq3QpeuRp6jiswuFiYPekyUh4xib6TJ3HxD8L9fGp3aixmv+keou2gP6Szx784rUu7L5Es8Dd85pfMoJY6qbwWJoychmlRCh61wyaYENWYAl0R72OL35LUsE4nYxQivmUJ0bo78AgovDO6gI3bWL59tNsaGQVOP0HYPu03jATOpcY8jWrtCpuh4C8hfk1RgIBEiuM6VXD1/4YScAs9ncJ+t9kmwt3Gsn5IsePFcBXMlrK/1cg6PAOp0Cm5TvyR1P2YKRKfsAD6vZzXQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK2s9d27Zy+MVaYXzLPHRm4WVyM90ncObNRFogDz+Ho=;
 b=CbjpizLHHaThxzorTuvuWfxqXuxrk7ueLPwIM+PZDDUNdldjONR5u/PEkAwGMCH+H27KJNW8SK13OJvLr4l9UceMl/sYPGPibT2/GvbBYsLVQ3ntuZz/eiGGJ8Lw7KuSg1+tlQ6Y0zobFm1ooE7mnSwbxWXj9reInfTNwOv/hccqNvWPHm/7bp1VNhIvMKSHbXs8tCMpihfDUkMo9XGQeQGGn9Jo7iEsmZG7FFBxXYly2ms3uaXo6jgfOkHecsXb/c9otZuJWGuch5PPGm6lIttvT/NQP0gaCPQ9d/TsyUBflXevq+/3X87DzeXj6sUmVBxxVD+j7IgagV/Wdl4Ptw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA4PR04MB7951.eurprd04.prod.outlook.com (2603:10a6:102:ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 03:17:45 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 03:17:45 +0000
Message-ID: <22fd3087-6832-4b61-8c78-bc8dd3ac808b@oss.nxp.com>
Date: Tue, 1 Apr 2025 11:17:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-4-ming.qian@oss.nxp.com>
 <Z+a2G5We38cQw3UD@lizhi-Precision-Tower-5810>
 <99aa5db6-eb75-4fcf-ada7-cc6d519a40cc@oss.nxp.com>
 <Z+qnln8qbHCYVH+e@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <Z+qnln8qbHCYVH+e@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::22)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA4PR04MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b3e78d-7b35-4aed-8fca-08dd70cbc572
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjZPUWN5dmZJcDdORjZ5QkxROTFUNGV0end6Nys4bDBLMWdiYUFteitwY0ZO?=
 =?utf-8?B?WkJvSjQ1bGFTV3lYNXRDVUFLTWxRVUhBM2RIbG5wdis1WVErcHFDOUh4Tmh5?=
 =?utf-8?B?emZLM1RiaVNPU1RKOXVxbSthOWhRcS9reVIzNmQvRXpyL0NINFVuNkZQeWtz?=
 =?utf-8?B?bXFXdVA1SUsweDRsR0RSVXZUSVB1SDljdXp3czhZVWNVVzZ1UmNWL09WbWRR?=
 =?utf-8?B?SldWeWU1ek9OeWtERmtXV0FpdzBaYkF4b1d1d0R6YnZjR255anhORTc0SkM0?=
 =?utf-8?B?ZE1WUjhMbnRGelB6NXd5WDNQQnZhbUp0U0FuV0tqbXlBSzRmcTQ2dFhDU0lo?=
 =?utf-8?B?ZHV6M0owMVZ2M3F5QzZDZDhWVXlsUHNyYmIrMGloSjJUUVlVSFVpNEExOTZR?=
 =?utf-8?B?T21aZ3I4OUs5QmtieGtoMTRsdmNkTkw3a05iVkthU3d1WWZtMHZ4ZVFyZDdo?=
 =?utf-8?B?SjZ4cldhSzZDOCtudnpXRStSYXNmNGFIeXBDQ2puczBobFo3V3g2YlhLd3ZZ?=
 =?utf-8?B?Skt3STJRaFlHQ2xaaVNNclBvVTBxRlJCZ21hVStpUnQ1aDh5dGVIaVdSdE5a?=
 =?utf-8?B?ZWlkQnhwQVVDVlF4Zk5LS1U1aEh3RE40WUY2U3VsRDliY3AxOEVKb2hTS09J?=
 =?utf-8?B?aUNmT3htcEhMVG1xcnY5U0JKMlRMSm1ienRFa1dLQU0yaU5EWEpMeWhvRFNH?=
 =?utf-8?B?UnA3ZjV0UGlCU0VMdnlKRDFWMXdXMWNUT1hUcWM2c2lGWDBjZEpNblFrU3Fy?=
 =?utf-8?B?SGNBdUtMcTJQTkJPUnVmVmNJZmNaNWVNTmZEekk5cGVSRnFpb0VyV20vVmd1?=
 =?utf-8?B?UDFKT0RRMTJMUXloMXFud2s2b0prWkRiSmZxNDQyajV0VThJZGhDMUFRRkU0?=
 =?utf-8?B?Nm5IcSswVlpJa3oyMXhqZUtLbCtUUElJVWhLSWlXTFdEcE9zbHFMUTRDbzIy?=
 =?utf-8?B?am03WGNRdXJSUGd6d2hBRnNEeW9GemFHbUh2ZWF0eVdsdGVjZkowVzVkYm0z?=
 =?utf-8?B?bUVidmtMZCt1ekZrb1EyeFZoMVJsUFg2bHFoNUt2QzRZVXJDdTlaWERnakdG?=
 =?utf-8?B?TXFTNEVpNmc4OTltbzVCbkF1VkZyOHp4YnFucWhwdk9tZnhLMmZBNER4K0hm?=
 =?utf-8?B?b0lBenh5WU9CajBYZHJOQnQ2QWlXb3hhMzZPQnpqYzZpMkV1ZG82dnBybC9W?=
 =?utf-8?B?d3hydlhYM2JGTFMxd3g4YiszZUk5VmYwRUhBcE8wM1N4Qkt6WDN4TG5jeDhm?=
 =?utf-8?B?Qi9hdDNCbFMrZkdnUGVnbEYxSTUwSXd4R1BQd1c1STdtMGdDSm1WWmUyeElh?=
 =?utf-8?B?UDF2VkZjeSs5Vmt2ZjNoV3Bnc1grdHRqSlhRNmZXengzOUxtRUNaTms5d2Rx?=
 =?utf-8?B?bTZ4MDEwaldCNmNLNUZNWE1CeWhUemdJMGlGcW5WWWtDUlVrQjVrTFFkQWQ4?=
 =?utf-8?B?UjZnRnBETHVzV1NDZDcxWkdpMzJ3U2dZbVhkYjM5QjRTbFlBZTU1bE9wM3BR?=
 =?utf-8?B?WHRteHZvdjBMNHRMRVdiaGRHT25zZHdFamQrdWNUWmp0a3VSK1BKTkxKdnZF?=
 =?utf-8?B?Z0JLcXVaREsrU05CVWp1alZLbks4RmxFVTlVWkFVWU93R3gwUldFY1ZQNGlv?=
 =?utf-8?B?Tys3WXFNRnc0MlY5d0prakVoVzhldUwrTGpvVE1CT1RQZ29nVmtvOFNsTHp3?=
 =?utf-8?B?TENMbHZobEFWdUdiL21vUzN6Wkt2dXdBZ3ZYVjc2MFErWnN2b0ZUcGNadGov?=
 =?utf-8?B?QytUdk0zTVF0QzZqWHhycC8zNGVaM3EwVjhNb2dTQ0VpRW1JT2NSaVR6MGdY?=
 =?utf-8?B?T2xoK094M1dleEdIeGthWWJKSTFienNmZlpNYkJheE9TNnNEMytidXp1ZzlZ?=
 =?utf-8?Q?dE/XTS31XR/3a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0IxUk5GR2duaEZxS2tMdTBlS0Z1Zk1tUkJvdzliRmFETkRJeHZTR3lTNVJQ?=
 =?utf-8?B?RkZFY2FuZjgzTXJ6THV0OHR5QWovZHE5b21mUE4yVDhQWVd4cUZEeVo2b1pR?=
 =?utf-8?B?U3l4TFdISEh6ZEJKN2loMDhBbzNVdFNmV2dyZlFhbm95SkhjYnhUQTRnbllv?=
 =?utf-8?B?bm40WjdLeUFqRkt2Yk42NnBKek9mYS9Bc2huQWFLWkJBVHhoUmg4Z2FIZnJE?=
 =?utf-8?B?N0h6RkFRN3FMMy8vY3VTN2VBZXVyVTkzQmlQd0tEalpnUFBydDdZdGxNcTY0?=
 =?utf-8?B?bXZWTVNVd2hjZVlZUTlvaXo3c2hEbWFoTSttNnFqd1YrZ0QrZEpYN3B5Q1Bx?=
 =?utf-8?B?Y1A2RzhUNTAwMmtRWXFGZ1BnR0xKRWh3bEpLWTVidjdnbnpVczNLbE9MckNQ?=
 =?utf-8?B?TWhydEVlRUMyQVVLbWZjMVJhRlN4MS82b3lDR1BLV2NQdGV6aklNZkxBZEJX?=
 =?utf-8?B?TnRWa2ord1FyYXBvTDB3UDI0M2trREc0dHBkTE5LUU15ejhQMjNicXlRSVJx?=
 =?utf-8?B?b0xmcGNablRkV3pwOEplZGtrWk1uK0NaOXdwOUxRWUxrYXJ6RGl6WHAvc21V?=
 =?utf-8?B?d0I2ckgyblpLSXFUbEk2dmczYUlmOWZpNXdRc1E2YW9tWHJ5djZRM2d3dzlS?=
 =?utf-8?B?emtxT3VYMWtkaW9xTWxLL2o0RVJrV2VzZGJ6REVsdk0vVlFFTWQ5VHRkcUlq?=
 =?utf-8?B?ZFhZbndwYnRXamMzTFJCTk9zN3hpUnh2alFQSmhJU0J1dW1zZTVUTWpjdGdr?=
 =?utf-8?B?NWxxM0xCNm85QlBVWVlhQnhUYmFuZ3FWTUVERVZEQklrWWMzbnhDZHV4ZWVV?=
 =?utf-8?B?SW5zVEZ0aTlKaFFFNnJjbmFremMvTEN3dmVnbUNaanlkVHQ2U3Zxd3Jlc1Zy?=
 =?utf-8?B?eTNoZi94Ry90SnNHYjBHdDBGMW1kTmgzT3ZUaTNaTTE0YWNqU2N3TFF5QlVz?=
 =?utf-8?B?RkJPSkl5ZHQ4RHVGbUMxMllrc2hDWGQxRnVKdjFYdlZQR3ljdHF3VVJnLzZo?=
 =?utf-8?B?OVZ4TU9SQmE5Wko4aHhjY3gwTVF6dFBUbUxvbnFtVnoxR2dJUjZFMkhMOEFY?=
 =?utf-8?B?ZDdSKzFTTnR0V2JUUTdOeXAzeXNCNk41NTI0N2JVTW5vdDlsSXZVcUR6Y21O?=
 =?utf-8?B?VFhEYldXSE1oVndFeHF1em4yYXgzSWhHQVp0a01ydFRZRGEzZDhlQjVCZlN2?=
 =?utf-8?B?YzJkSHV5OGVOdXV1Uko2dzRnS0ttSEdRekk5Z0ltdnNaZnFpeGM1QjVMR3c0?=
 =?utf-8?B?d0lOL081cXcveEFDYkU2NnpoZmJ2bXRhQmFXb0FybHlwNkR1UTJ6b2d2RVJy?=
 =?utf-8?B?V0JPbjRzTGRKMUVadENDQWVOMXJWVzNoT0EwRm1uZUpvYlAvSVI3T2g0b0I0?=
 =?utf-8?B?VGkxNnhtWEpET2pqeGxhNUJxZStVZzB0VDMwMTRkTGNaMDBpMUIrL3Q0a0Fl?=
 =?utf-8?B?UXM0VWJYejBjTEFBNzdMcUpOeFZRdjg2cVFQRWNybVp6dDhoV3dFSkJKdDN6?=
 =?utf-8?B?NlhML3hYQW9yT1FDaitBUGR0cFFxTGVzcmNLVXo4RnZ5NmovcXpYWU1WSkdi?=
 =?utf-8?B?ZWlNZGc1YUU1SU5URU9kMW5CcFhORUJwbW9UbGs0QnVBcmtQVXRrdStmV2s2?=
 =?utf-8?B?QTI4Rm4rZzd3N3BzWURSdTBQVlAvQkY4SEZPQUhXM28xdnNOZ0dPRlIxaThx?=
 =?utf-8?B?SVEwZWFGV2xlRnZ0WjY2enhORVdrWklPdkhUQ2x0WjhWcUNJenFFalBkRUtO?=
 =?utf-8?B?TXpBYUpGTDlKcWs0bXZDazlWME83cG9MYUdWdGVVdUhwRWVhLzF6Z01QcXl3?=
 =?utf-8?B?R2czRkVLMkx3aE1PdHhsd21QeVBXYmc2UmtnVGtOZTVRUU9HSHlIUHlLY3cx?=
 =?utf-8?B?UEt1akliZjdLcWFQdURkQ3ZrUDN4bHF4aTd5cmFDcDdTNFJVNVBaYzZWUGRp?=
 =?utf-8?B?Yks3OXVyeWd0MXU4bG84czZXcFJ4dGNEN1VPdXlCZW1COWNHM0R0cU9TVy9L?=
 =?utf-8?B?MzlTTEtHWXh1dHFLbGIxY1R3dXFPYUlnelg0N0c4WGxDSnJRNTBrZFVoaHpQ?=
 =?utf-8?B?aGJkQjBMa3BadSswY1Y1a0s0dHh6RGMwVldjdVp3a2dwU2YwNUExL1hKMzdq?=
 =?utf-8?Q?nLM75xF3Y9oiJ55ywLdHkRLhn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b3e78d-7b35-4aed-8fca-08dd70cbc572
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 03:17:45.4392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ve4PoV0waGcIEDgavqIsnm9YnZYFGO3A6T621Rn31t10V6NC8jRRDm15W+I/lLWdF1DMNRgY16463YbKoA6hcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7951


Hi Frank,

On 2025/3/31 22:32, Frank Li wrote:
> On Mon, Mar 31, 2025 at 11:10:20AM +0800, Ming Qian(OSS) wrote:
>>
>> Hi Frank,
>>
>> On 2025/3/28 22:45, Frank Li wrote:
>>> On Fri, Mar 28, 2025 at 02:30:52PM +0800, ming.qian@oss.nxp.com wrote:
>>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>>
>>>> To support decoding motion-jpeg without DHT, driver will try to decode a
>>>> pattern jpeg before actual jpeg frame by use of linked descriptors
>>>> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
>>>> used for decoding the motion-jpeg.
>>>>
>>>> In other words, 2 frame done interrupts will be triggered, driver will
>>>> ignore the first interrupt,
>>>
>>> Does any field in linked descriptors to control if issue irq? Generally
>>> you needn't enable first descriptors's irq and only enable second one.
>>>
>>
>> Unfortunately, we cannot configure interrupts for each descriptor.
>> So we can't only enable the second irq.
>>
>>
>>>> and wait for the second interrupt.
>>>> If the resolution is small, and the 2 interrupts may be too close,
>>>
>>> It also possible two irqs combine to 1 irqs. If I understand correct, your
>>> irq handle only handle one descriptors per irq.
>>>
>>> Another words,
>>>
>>> If second irq already happen just before 1,
>>>
>>> 1. dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
>>> 2. writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */
>>>
>>> Does your driver wait forever because no second irq happen?
>>>
>>> Frank
>>
>> Before this patch, the answer is yes, the driver will wait 2 seconds
>> until timeout.
>> In fact, this is the problem that this patch wants to avoid.
>> Now I think there are 3 cases for motion-jpeg decoding:
>> 1. The second irq happens before the first irq status check, the on-going
>> check
>> help to hanle this case.
>> 2. The second irq happens after the first irq status check, but before
>> on-going check, this on-going check can help handle it, fisnish the
>> current decoding and reset the jpeg decoder.
>> 3. The second irq happens after the on-going check, this is the normal
>> process before. No additional processing required.
> 
> Okay, not sure if hardware provide current_descript position. Generally
> descriptor queue irq handle is like
> 
> cur = queue_header;
> while(cur != read_hardware_currunt_pos())
> {
> 	handle(cur);
> 	cur = cur->next;
> 	queue_header = cur;
> }
> 
> with above logic, even you queue new request during irq handler, it should
> work correctly.
> 
> But it is depend on if hardware can indicate current working queue
> position, some time, hardware stop last queue posistion when handle last
> one.
> 
> Frank
> 

I think it doesn't matter, the 2 descriptors are the cfg descriptor and
then the image descriptor.
If the current descriptor register remains the last image descriptor,
the ongoing check works.

And I guess your concern is as below.
If the current descriptor register is still the cfg descriptor, but the
hardware has finished decoding the next image descriptor.

I confirmed with our hardware engineer. This can't happen.
The first cfg decriptor has a next_descpt_ptr that is pointing to the
image descriptor, when the hardware read tne next_descpt_ptr, the
current descriptor register is updated, before the actual decoding.

Thanks,
Ming

>>
>> Thanks,
>> Ming
>>
>>>>
>>>> when driver is handling the first interrupt, two frames are done, then
>>>> driver will fail to wait for the second interrupt.
>>>>
>>>> In such case, driver can check whether the decoding is still ongoing,
>>>> if not, just done the current decoding.
>>>>
>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>> ---
>>>>    .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>>>>    .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
>>>>    2 files changed, 20 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>>>> index d579c804b047..adb93e977be9 100644
>>>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>>>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>>>> @@ -89,6 +89,7 @@
>>>>    /* SLOT_STATUS fields for slots 0..3 */
>>>>    #define SLOT_STATUS_FRMDONE			(0x1 << 3)
>>>>    #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
>>>> +#define SLOT_STATUS_ONGOING			(0x1 << 31)
>>>>
>>>>    /* SLOT_IRQ_EN fields TBD */
>>>>
>>>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>> index 45705c606769..e6bb45633a19 100644
>>>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>> @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
>>>>    	return size;
>>>>    }
>>>>
>>>> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
>>>> +{
>>>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>>>> +	u32 curr_desc;
>>>> +	u32 slot_status;
>>>> +
>>>> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
>>>> +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
>>>> +
>>>> +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
>>>> +		return true;
>>>> +	if (slot_status & SLOT_STATUS_ONGOING)
>>>> +		return true;
>>>> +
>>>> +	return false;
>>>> +}
>>>> +
>>>>    static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>>>    {
>>>>    	struct mxc_jpeg_dev *jpeg = priv;
>>>> @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>>>    		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>>>>    		goto job_unlock;
>>>>    	}
>>>> -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
>>>> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
>>>> +	    mxc_dec_is_ongoing(ctx)) {
>>>>    		jpeg_src_buf->dht_needed = false;
>>>>    		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>>>>    		goto job_unlock;
>>>> --
>>>> 2.43.0-rc1
>>>>

