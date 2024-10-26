Return-Path: <linux-media+bounces-20355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B45C9B1AA3
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2024 21:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A149282325
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2024 19:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAF1184551;
	Sat, 26 Oct 2024 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QnBpuaMn"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B67433D0
	for <linux-media@vger.kernel.org>; Sat, 26 Oct 2024 19:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729972468; cv=fail; b=UbzTKJLyKBgQp3/Ix8hB4YUGkvoK2FGe/4uuxPuisVm4WTdLL1VDzs3n/+lxaXNSbXj76uA6i2Qu3WPwomTMCVxl4R33fefhKMaNDep8STQaoLNWA+gEkII+9zXtcqSoPWAiZmZUBEUvfLVgPxAp91FXQ4hRCTEnDrACDuChwSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729972468; c=relaxed/simple;
	bh=pISFAIdRSApW+ljemNbitbFVoFJy5phq7uHssd7AUVM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TEauijkqcqwvmzvOYZIucs3HcKFAyg6sr6PJhc7PRIZg5y46nSlHVXWmJW70ajJCkhHo45Iz6lhHrTBC7wWU1Iun6ZNBD1sOGzA0Bbmr8+lTsjXd89+y4hbGltDxAse6pXpazl9WCza6ORioVt+3fpTREiCKnNEEkUuNVazQzeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QnBpuaMn; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlF68RRkkwMRUQhGsJtB4yhgVdLGB/ScnNvqG6H+AFxeNbaYBXqL+BEVBT2S8MlEyEXPKFoFz0qpnJVlDgS5tcJKkkQQmp1Kd0SEm00ZOzgbRQEW001UYc51H/nBDH1Z6milvSI9oGsHgHx/cIMBreZzLefH4zxtkFeqqRDQFahBPI8SKWXJ1QYyRx7I7YPLwYRXMdRA/YRVGPGIhrZF0MU5GWm9KRRbW9VNssDtnNTmVkgNGVi+ckTABHBRruPmUWqsYR3h4H41t6dxiyUwHFpLTwY2VGLpmXZa3sqGX+6a74HiLe6FexyMgHUXHzMBOBAK83ietsoSbJgbKIH6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+IETGRuV/x3iJz1fA/hN8N1qQhaXmlp63lZuEpRNlM=;
 b=Xz0VZKBCUdO3AniEWaew1aF05okEMvZNMq1v3kPoZmzmBymBhXDKXOt+f+dodRlenOpXQG0CqhU/bYLN3g/jySV82YSyAhfAVW+xCn5u+oE2Go7eT0LlBPv/8s/XwgEzZkAVfWrlqcAGWr1K9B8fApMIDwM2rvkB2gtiLCfukKiorlcDNbqz/DTCGDV0KFP833yZA4XaeWPlI2rvpTuV+jLYE6e93UuYUAM07TYT1uo8KumCJ1uSy731wNbtYMaNauRjeNhtWtBJWy1BimzIIQufpJkj8HheBq4+TNNekmUGTix6EcID667mV3yfhD4AKGiUPi4vkm9p8MXD36Xe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+IETGRuV/x3iJz1fA/hN8N1qQhaXmlp63lZuEpRNlM=;
 b=QnBpuaMnlTQA3yL7iIZqamcoeaUNlUh7t2WxCpwo/dPouzTzvAqGri4gMhnmwOmAfytWyZbo3niwR6xKxMQswYZAbxrKD2HvnhfLbYltXlkGQC9qDI3c30Jv1uJht6mtw+HhwUOJd7nTiJ6FO6OrPnVx9ObYBLlt0CLWR1/bYgXEE+huisjfMzKs7CQi9LVgj4HheKcPNXYppDsq3NawbA28UmD4MP1fdBvGkoAmi1TZlxaOEqbB6YkSuejs/ata4RfO0eVxcY8uRa3fzOGT/3k9QRhhV9cE5T9rIFpW7vOVaIlLu/nnG74/IdGR/QNp2Oab90+cWzP4czBlhJUbmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AS8PR04MB7654.eurprd04.prod.outlook.com (2603:10a6:20b:290::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Sat, 26 Oct
 2024 19:54:20 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::eeac:ae8a:b567:e3b3]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::eeac:ae8a:b567:e3b3%6]) with mapi id 15.20.8093.024; Sat, 26 Oct 2024
 19:54:20 +0000
Message-ID: <46eb025f-3b9c-412f-9425-75127c654270@oss.nxp.com>
Date: Sat, 26 Oct 2024 21:54:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dw100: Rectify rounding error
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20241025130300.227817-1-umang.jain@ideasonboard.com>
From: "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
Content-Language: en-US, fr
In-Reply-To: <20241025130300.227817-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::11) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8703:EE_|AS8PR04MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ace1737-2f3d-433e-4473-08dcf5f7fb84
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZjR1eGhFYjNvaEl2R0hpN0Z2RFRwMkdqL3prd1VIVjhBMVdxNndPMUxoU3NP?=
 =?utf-8?B?bTZZMnNYMlZoYmh1cjJOZUdZWDljMlpzOEUwMkpJWEw2elc3NzlsU3FDd3pr?=
 =?utf-8?B?NnFUaEZNaitKbFlxL0krREZxZ1R0SGgwbnBIa1lqaldyTnB1NzZsUVFKMVk4?=
 =?utf-8?B?MWtMdU5IbDVkV0EvUXNBVUc3V1BqWEh4dUNpSE1DNW14NDlXUzRJT2hMZjJH?=
 =?utf-8?B?ejhjS3k5SGtUUWZLWDhtL1lvQldZQ1FwUk5scmNqUjRYQjljeHF6aG81SWI1?=
 =?utf-8?B?b3JRNkdKUDg4K0ZINWRob2JUb1lNRExmTzZhc3BxZnhua1FiVnV5N3dFdk1G?=
 =?utf-8?B?NDRaU0h5WG0vMEwrZmVqSFhwK2ttM08rbXlEQW9DUVNUQ1VidWNUTiswUzNw?=
 =?utf-8?B?NWJMZExlOXY1ZkloNVpRbTBadWtkODJkNzB5ZGY2dE5xQ3d4NFIwSXBwdDhI?=
 =?utf-8?B?N3BzZUpyTGJ5UzUzL1lFcTR4RmxqZmlkY09pY1EzRmhRUEhXMzRPdk1rUEp3?=
 =?utf-8?B?NHV0SzA1QkFZYkZHRU42Uk1OMS9mN1Q5bVZtSFl6SWM0aDJSUmxVcTNsNjdF?=
 =?utf-8?B?c2VBMWNHc0J5bUpGWlN3NVdRWWdWemttNGlHUEpMdjJxTCt5M2lyVGVSUDl3?=
 =?utf-8?B?RkZKTGRVdER4c1lqL05FQThQb0Rxb1AwYmJMNEc2NjVlaU45VWRNcGJGbS9L?=
 =?utf-8?B?RTZOWTFuSDcxSkgzSDM0L2V5Tm4wcmlTemp5Vy9MQUFrb0xUbFV4K3Y0R0FE?=
 =?utf-8?B?bXZNRnlRZy9HdUtmaWJZRXVaeS85cmdaRDVXSmdjOW9LMzZMdmFiUlhubisw?=
 =?utf-8?B?UHlONmdjMEZkUXcwdm16WW9FcG1TajdzcXR4eW82M1ZSTzJwdXJwRUJjVTIz?=
 =?utf-8?B?UEl1eUpaRXNTR2pXSU9UM3RVTHRpd3BUcHY1eW9sZmpQMHFid2JKd3llZWVx?=
 =?utf-8?B?Nm5Vd21jUXZEZ0FMTEZhUlFHNlhTZUR3Tk5qbGlPUUpYQzdjWEN4VzhjUjBo?=
 =?utf-8?B?K2h2ZnBBTVFJdkQ0REFzRC9aU1ZJanc2TXV5cnJzYW9ZazNrYSt3dldmNlIy?=
 =?utf-8?B?dmdOOEl4RmhqQlFLTkQ0TmJNU3ZZdjFjL2x2bDNSUE9hV09ZVURGd3BvOU1U?=
 =?utf-8?B?WDRUSmtQcUNRT0VHOE9PWnplVFpZeGxmMEhLTnpaUlFkOXFndkZZZVRYa0Zw?=
 =?utf-8?B?Rk9TYy9IV04xZmt4czdoSmQrZ2tvaDBoSHVoWlg0d2REaGFXa2lXOXFiMVd3?=
 =?utf-8?B?dkQ4Wnl5ZndxVXJOYXd4d1hCaEpXWGJSOEJlQWlvL0J3cFFvamJaR1dscXNU?=
 =?utf-8?B?OXpBWkZWZnFrTWRJVU9vU2s1S1RNWGd2QkVuY0FCNUdsU291cDNtS3VSVXM1?=
 =?utf-8?B?OW9QdlpDdE5LeUVVaFh2VzQ0QjY4aWxqTlUzSC9tcnhjMjEwMmxMa1I2Y09G?=
 =?utf-8?B?dXByV1Mra2dPMGdNbmZ6Vmw0c1ZqdHh4Mk5tV1VSNWUzajZiVlpTSitGWmEw?=
 =?utf-8?B?eE1xWkhIc2F6QW1tNiszTmlHcVllZDQwSGQ5QWcwcUo5N3BKdTRlRHRkNUY0?=
 =?utf-8?B?OTJvWDROem84TU8vN25oQVQ0TkRMUnE3T2YyR24zOTFQZytWcWZtOWo2RmJj?=
 =?utf-8?B?L2VLY2g5NlJFcFRGQXBqbnc2QnF1TndManY4Z2t3U1l5bEFwR3ZzVEJjVUkr?=
 =?utf-8?B?ZmpOM2RxR2RLNnVmTlFEakVCb0s5U0FsR05kV3BsTUpEajNIVU5Ydlc3MWF5?=
 =?utf-8?Q?KQz0ofbnYzCL99EorqDolFMwGJk/ugJTu9lkFet?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UHRWbHJJNk9wU25TdERJRDk3K2FsOUVlLzgvVUhEWUpzMXBxRTc1VGkzazg3?=
 =?utf-8?B?Q0FRQVg3bXNGU2NBZTJBL01XVm9TQnJTSk9SQ21wN1FPQjdCdjVLL29sc20x?=
 =?utf-8?B?QVh1YnpzR2NzWjRsbm5iK0NCWUpZbVdrRDd1bENlVVFQQWx0cXFPc0NGalhk?=
 =?utf-8?B?VVZVQk1TckFsbWFiNTFsUHEwdUZOU3ZXNlBDQWRoUUcwUnZsa1B5blo3ZHRm?=
 =?utf-8?B?eG12TGxuWEhkUW5xUEZyR1BBRC85TmNZU2dSSWI2VXVmQWM5YUhneFJRN1hC?=
 =?utf-8?B?d0hKRHZVK1JKb3VQdXNTTUliWFd0YUJ0RkEvWmxIMlNMVGpuM3V0aVQ4aWo1?=
 =?utf-8?B?dXg2UFRDQ2tYUThHSldMQXNlOEhHM1JCWDd1ZHBJVm9sQlVzQjQ1NmNKL1Bi?=
 =?utf-8?B?bFZaNldnQVdET3pwOWdFdmRBa00rOEQyTTlLVk85TkUrc2hLTVFoQm1XVitn?=
 =?utf-8?B?ZVVVemdDc1RFb0tZSXluZUVUQnFBQW51ZjlkQ0FFRFhETHl0eEtkcnFYZmdP?=
 =?utf-8?B?Ni84QnhLbWY0OVdENGxsQ2xwV0p2c1FzVHBwYmdINUF4UTVnaHhFZC8xamdX?=
 =?utf-8?B?bERxUXRIMzB5a1lPRXdUUnFQa010RWtEdkZmUkR6Z2lZLzRQL3BpbFduY3Vr?=
 =?utf-8?B?Y0pXeDVjL1dOc3dQUm5kNXM2V3VQajJvTDVETDNxM3NzNEJKaDZpNTBoZTdr?=
 =?utf-8?B?aTdqT3VMVnRDUVU1OWROczN4VU5QVHlORlRVdTM1NjJvSzUwNDBzYlFXZngz?=
 =?utf-8?B?MEM0dlcvK3BFN1JGTHV2YnJBTmxFM1B6V0JYaVJ6L1lkdVAxYk0wckJ3Zy9F?=
 =?utf-8?B?amZaWHdmM0dEUkFBRWZnTW5lZExuS1RDR3Z1YVVLejRIaUdaWU5lSHNMVEh5?=
 =?utf-8?B?YUFJQlg4WDQ1c0xWRTRZM1ZpUFJ6WlRtcHJISnZVSE1tcXhPZHlOcWQrTEwv?=
 =?utf-8?B?ZGt5N2NRYXRpRlFBQ3ZUcjl5dTZaMU9KNmlpSlYySFl2eXpoN08raXhjR0hO?=
 =?utf-8?B?azRlVjRrWmJyUjczNHppZ29YOGdJb0lrYVoyd3MrSUgvbExaWVBZSlBqUUx2?=
 =?utf-8?B?SlJSTzlqL0x1NUJUSU9Sa0pJeStIS05sZjh4RVpGd0JCNVNhUmZjM01jREds?=
 =?utf-8?B?dmlXRGNiT3BWZENlUXR1WEpwUUc3bXBFVTRiUDU5VFlvWG56cCtxaFpLcUxQ?=
 =?utf-8?B?ZnRiUkR4Y2NGdjlGOGJENTBNK1N5NVhRSDVjOTJTRFdBdlZFaXV4WndoU291?=
 =?utf-8?B?WXpCZVlKc2ZVZkduUmhJeHRzN1BlS0svcFVYZFhKdktxMlJkTXlHSzM4YXlR?=
 =?utf-8?B?V2RCcWl1bDB5eC9lYjA4bGJDYXRXZ0xDWXUwQWFjQ1Vzb2xpS0JOVGk3VG1O?=
 =?utf-8?B?WFp6Kzl1b29ydFQ1Rm9TeUJoODFwTWdVcVBZeDdLOUg2dHF1MVlJRWFUOCsz?=
 =?utf-8?B?dldwOTBrWVY0emFzQ0ZCNjNZMkk4cGZnVHpGRkw0bit5VklFc0Ywd28wMWM2?=
 =?utf-8?B?THJSc1VSYWZPTXFLRUN1S00vc2ZILzh2SUd2b3N2SVR2ektoYW1WU3FjYklX?=
 =?utf-8?B?UDFHcnk1Ukw2VDFSa3Rqa2t6M1g3UjhraW1QK1ZhZjlteWVrSDJ2d1VUcUN6?=
 =?utf-8?B?VVdOdzlUcUVmeUcwaUpYWjdVNFJnUHRDcXoySVVJRHRvYk1WQ3Z4TWlBNkN0?=
 =?utf-8?B?UUlKZGsrT2lDd21DL25GTCsvelFyb2ljNDY0ZGdaYVE3Z1k0dElMUDhmeTc2?=
 =?utf-8?B?Z3ErVlhNRjhraEJnNXcvRk90N0I1UUFqeDV2WTJyd2V6ZTlWcHA0aFlzZjNN?=
 =?utf-8?B?OE03NTNBajFTbEpQaFJSOWdNakI5VVZVQml5WmJVTm1Wa0R4L24zVjhUclBh?=
 =?utf-8?B?TStVOFF1cHcrZEVoMk1sMXROeFFqeWZUR2ZqNHJTNmhzZWVvYmZGT2pVV0U5?=
 =?utf-8?B?eWpuRHhNWmlmaEthbG1jSzNvWFJMWE5CMFpXZ3JzVHpYd0VVQmJsR1BBekZo?=
 =?utf-8?B?SFY1TmVDaFFHQ09hRmgvdjVPcExrU1BoZUU5K09KVGFEdjJxSWNNdnIvUVNX?=
 =?utf-8?B?Uy9XblNxRUdBZVJIWHJNNnBJOUkvUnV5NjdERWNWVytDQlg5a3UxL3djd3Ny?=
 =?utf-8?B?RFFLRDFJSXk5WlJzT3RXVzFZTHJ3MTczd2FQZ0NlNHg0S0tWRlA2eS9iRHpy?=
 =?utf-8?B?OVAwN1FDckNlUVNqUUZEbmo2TGl4WDcwc1ZCcHlTcHlGL0UrdjNDVUltWWNI?=
 =?utf-8?B?TGZnKytvVHA3SHlyaFFldDl0RGlRPT0=?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ace1737-2f3d-433e-4473-08dcf5f7fb84
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 19:54:20.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qp6Ec2LI7qwhn1wNElu/7KCeQr6EPFOIr0iv10RiNDeFoIm7BeiG1PM4hMnKmnuI/o2R4eAoPvLrrslidM2OzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7654

Hi Umang,

Thanks for the patch. Nice catch.

On 10/25/24 3:03 PM, Umang Jain wrote:
> From: Stefan Klug <stefan.klug@ideasonboard.com>
> 
> The current scaler code fails in many cases which can be validated
> by the following python script:
> 
> ```
> error_count = 0
> valid_count = 0
> 
> def check_scaling_error(src_w, dst_w, add_point_five):
>      global error_count
>      global valid_count
> 
>      qscale = (dst_w << 16) // src_w
> 
>      if (add_point_five):
>          delta = 1 << 15; # 0.5 in Q16.16
>      else:
>          delta = 0
> 
>      scaled_w = ((((src_w << 16) + delta) * qscale) >> 32)
>      if dst_w != scaled_w:
>          print(f'scale_error: src_w: {src_w} | dst_w:{dst_w} | scaled_w:{scaled_w}')
>          error_count += 1
>      else:
>          valid_count += 1
> 
> print(f'==== Test without delta=0.5 ====\n')
> for i in range(1000, 1920):
>      check_scaling_error(1920, i, False)
> print(f'Error: {error_count} | Valid: {valid_count}\n\n')
> 
> error_count = 0
> print(f'==== Test with delta=0.5 ====')
> for i in range(1000, 1920):
>      check_scaling_error(1920, i, True)
> print(f'Error: {error_count} | Valid: {valid_count}\n\n')
> ```
> 
> Excerpt of the output is retrieved:
> ```
> 	==== Test without delta=0.5 ====
> 	...
> 	...
> 	scale_error: src_w: 1920 | dst_w:1915 | scaled_w:1914
> 	scale_error: src_w: 1920 | dst_w:1916 | scaled_w:1915
> 	scale_error: src_w: 1920 | dst_w:1917 | scaled_w:1916
> 	scale_error: src_w: 1920 | dst_w:1918 | scaled_w:1917
> 	scale_error: src_w: 1920 | dst_w:1919 | scaled_w:1918
> 	Error: 859 | Valid: 61
> 
> 	==== Test with delta=0.5 ====
> 	Error: 0 | Valid: 981
> ```
> Hence, fixing the scaling rounding error by adding 0.5 to the
> frame dimensions before applying the scale.
> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   drivers/media/platform/nxp/dw100/dw100.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 42712ccff754..541706f0aec4 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -984,6 +984,7 @@ static int dw100_s_selection(struct file *file, void *fh,
>   	u32 qscalex, qscaley, qscale;
>   	int x, y, w, h;
>   	unsigned int wframe, hframe;
> +	uint32_t zero_point_five;
>   
>   	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>   		return -EINVAL;
> @@ -1032,8 +1033,9 @@ static int dw100_s_selection(struct file *file, void *fh,
>   			}
>   		}
>   
> -		w = (u32)((((u64)wframe << 16) * qscale) >> 32);
> -		h = (u32)((((u64)hframe << 16) * qscale) >> 32);
> +		zero_point_five = 1 << 15;
> +		w = (u32)(((((u64)wframe << 16)+zero_point_five) * qscale) >> 32);
> +		h = (u32)(((((u64)hframe << 16)+zero_point_five) * qscale) >> 32);
>   		x = x + (sel->r.width  - w) / 2;
>   		y = y + (sel->r.height  - h) / 2;
>   		x = min(wframe - w, (unsigned int)max(0, x));

Reviewed-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>


