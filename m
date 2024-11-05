Return-Path: <linux-media+bounces-20926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6748B9BCC40
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 205F6283045
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CAA1D5145;
	Tue,  5 Nov 2024 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="aGJkXCl5"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2124.outbound.protection.outlook.com [40.107.215.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CC1D3593;
	Tue,  5 Nov 2024 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730807916; cv=fail; b=jbQlZytq7OWuusA+edAILyhZHPU4Ii9mWkRYUjn+GvrxIOCK4j908H/f4tp/OsK6FmybVV9SFZ/LgLhUT7cFldkuHKae5M0bSrv+lg7FAvghtVAdB94aena1itfUyyZ4U0wOw6HngZgxDMbea+V9i/a6xxElW9Zt3LfLh6HdyP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730807916; c=relaxed/simple;
	bh=uQF+rhnmyvI8oULhhI0kmKA8mPkrgW05WZldsUDRp+c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jw9JlrtJ+IXdn6aOiSDH2O1Ue44kKrlSNYLz3FSMuKpnKxIl5fe+2iMkFstWCzZL1m1+Kc4qTHf/pjgxZ6dVtMx361GZ6wttFVkuIO47AKKw6cVSk896lguh5iXlw2EtUzggaZk8EDltw3XfoWD/RmHLMIJKGr7Cku/aI4G51To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=aGJkXCl5; arc=fail smtp.client-ip=40.107.215.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaIomNuH+d6E5LVC31zKM9MPcG6zrpw9leLfgyv2LAmVUxJIl77yMA8X1O6lgSsPOR0nPqPrnDqUB8sCQe8SO18y6UsWLjabm6iMLpedJlE1V12VDuKga6AEQNrDWJJIjo55LiEsG5yaZFNnVxoA/8t2+AH3/mlpzzfSYcGnAoc1xaNBJ4VLwBmCaMhIqPTnF+kgJIVmir+TW4Ugj/6ZSEn3N2sE7sp2MCVqtsleVgl1n9sAYSngzn0FssXw1R7dvog1nQbYWptFG4eNdZ7f/7JdWToteVtelHBoa+EcVMr8lfXRxI4mk99QE9Qym0VV7FPj7QSQADaMm0n6dY28PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cb2Rof1HpQMy7I+mkiRjZrRvG2s36kGhFc4XlsI9cd0=;
 b=J55O4z6siiIxezB5o+9YdZZ4M6NbjKa8MOhbS4uO/4+r8bAq5qBo8UllsL7dlX+7QXopcehJY0p9KCOA9S/zk/cI6isDDCaNIzv+fllfdG/rA93HgoXuw/wyc/bjpBO1pzRx/A/JzgQsJ6XlWvbyX8ifusg6FqIw4gt4xlPTCwAFeu4pkkdGCeald5Ashffyrb2BN2uzwajR4tBvuUDYV2JQTVn7RFetolXKtlt1G4Wzq9BO8e90K1Ypg+EGIK4SnWmSkVAQvIc0Emj1fq79gqSw7gdHwTZRL/9BSYsbn+tujDZFQLszDudV/Obt9kRQToCz4hHqVW+gqNeZAq/9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cb2Rof1HpQMy7I+mkiRjZrRvG2s36kGhFc4XlsI9cd0=;
 b=aGJkXCl5bGeIMNVWIIx3pEUrHEybPsxRMC5zwIqDAknO9PderfrB1DeoQJTLGZbwtTQawigKueXKnB30Y3dP5tBKRSSbFIe3Kl/4MK+lFWJAywnzRwRnRQFMCv2AKV8I1x+bJHCpRg9agDPkFbop3+o9mutaB0vzzNlBXyXgE2OWB+mHmxMb2JF0VXqI2/htfPzQAsED9v6+ENVd+fknRu7k5AnRieJLsEDlhs/v8nRHOlOtbzKoSypm0kTM2d/YNS9t2ZtLdkf0iw4Mgcx7g/jHcye5mCWXrtFSGlGrzX573gJmCGh0v/CRcSCrJEoF55u4RUaFKfQ+5zxtAl9IPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB6792.apcprd03.prod.outlook.com (2603:1096:400:202::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Tue, 5 Nov
 2024 11:58:26 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%3]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 11:58:26 +0000
Message-ID: <7f6cdf53-9537-4b91-b42e-b260d46499c5@amlogic.com>
Date: Tue, 5 Nov 2024 19:58:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] media: platform: Add c3 mipi csi2 driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
 <20240918-c3isp-v3-2-f774a39e6774@amlogic.com>
 <ejz2o35uenq4bq6ifepgpu2tsfkjrylmtvxx5ysqab5ydodtvx@zb4m24sk6fcb>
 <7c6cdb7b-705c-4744-a28e-866dbda094ac@amlogic.com>
 <qbr4bzggnnkj5lakfpbgmgrfgeuy6tatljkjiwijeradklm7cw@hblicnc6wtvl>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <qbr4bzggnnkj5lakfpbgmgrfgeuy6tatljkjiwijeradklm7cw@hblicnc6wtvl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: aefaaec8-b279-4e1b-43ba-08dcfd9127dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TE43dnNoaW9vNjBuVWlQMnhaUGxmWDMrZFZzZWc2aURzMzhaemZ2Y0hDejBv?=
 =?utf-8?B?Y2ZpR0VaSjZ1eHFZRDh2Y3FEQlhyNjkrQ0UwS1Z6NFBSeDNoQldkUXg2RVlI?=
 =?utf-8?B?TG9RYmhhczM3NGFNN0dYTVg5Z3FxdnRZZE5penRicStQWWhWWVRpLys2dTFw?=
 =?utf-8?B?MW5Wa1E0UWtjM0lCeis5UkJZcFhLbC9VOTBrRTU5V0krNy93MnFUWXlUSDQw?=
 =?utf-8?B?NlB2cWJ5dmx0RUpzOGJ0TVhlRFR6STFDZURWb0ZHaVBRVzE4MXp3My9pTkRF?=
 =?utf-8?B?cFZxeTlEeFZSWlFBbm1hdnVRUFVLSUh2a3FrcmMwc0lPUVR5dDdwRnNrV0wy?=
 =?utf-8?B?OEUwV0ZheGRuNWN0Q0hMbmJ0bW9DNlZRUDZuZFZ4ZkFpSmhjbmc1eHRRVU1s?=
 =?utf-8?B?YzBqa1Mzclc2eC9aditQWTVYeW9aRDZnODYvWmw4SGllN0xrbk9JQVBuWjNa?=
 =?utf-8?B?K1A0K1VjL1dFam05MHFVY2RTR2cwSEEzT2UyR204cXAwVXA2RWJ3Mng2enZB?=
 =?utf-8?B?eS9XbVE4S05BdFdreGc3UjdMRXdpVmkrd2R3a2xiaTVvTVpXNzAvQlRBTFcv?=
 =?utf-8?B?d1FPMlh1Y2lkeWJlMlJ0OVovaXkvS3ZYdzMyTnl1VENKTWVOMVhLTXA2Nk16?=
 =?utf-8?B?Q2g5RFlaYW9tTlFtZzdxclIwWmhTQXV1bzVYVmRBYWxldXNHTTlWQUNMUC9l?=
 =?utf-8?B?azlTbTEzVzV0Z1NiNmJ3MC93VzhzYXV2eTBnT1BFYXJHVE9EREVkSXVkc1pM?=
 =?utf-8?B?NEN0c3ZMSFltTVllRlc1Zk4rUVhQeXFBeUZEQmI4NjdkelN0QXJhK1hlRVhH?=
 =?utf-8?B?RmRwSHA2ZCtJRngvTDJMOFQ5VmpFMmZoVUV2TmZiL2txR3IzTmhCeFZBSTcr?=
 =?utf-8?B?ZkpoQkpqQ0lHQVFIVSt4NFNZM1lrMGF4MFN6QU96ZmxFLytvbS9QYzBtbXFW?=
 =?utf-8?B?eVFvRFUyZDJYbDg0MEVvMEVVL0hqNjA2czdNZUJ0eEpnWXdjSTR4aDk3SFcr?=
 =?utf-8?B?cUxabitIMEc0eTBkVytPR1QrMVNDaXpoaFdmYkp2WnEvaVh0SUtQd2VEUldE?=
 =?utf-8?B?S2I5YUlyRDR1OUFSRDkxd2ljVy9ha1JjaTFLY0hGOC9vbmNYNkxUWVdFcGRt?=
 =?utf-8?B?VWlGc0dsNUp6Wk9rblB5aThzWU1XYklkYUdqckFOUVJtN1hOK0w3NmNKTGJO?=
 =?utf-8?B?Mk5Xc2RRY00rT0toMktOVEdlc3JnZ0wxNjN6dSsyMTBxTWdOeExJWUhvajdJ?=
 =?utf-8?B?eERTZ09waEd1R0ZyTUF0TXVzZ255c0FrU1dVU0w2ZmREd1dianZWSW1oRzk1?=
 =?utf-8?B?V1RibXJ4WXdGc01WeGFqVUs3TWJqaEZibkEzWVVtbm8wamU4RjB3S3V2aTky?=
 =?utf-8?B?d2FaQXF4L0ZmeGJNeHdpR05hMnBETENyQnJtbXdteHMwRUJLbzlEc1FoWndP?=
 =?utf-8?B?SU0wU3hzQktjU0g3Mjc0bnF6L2t6bUY0NHpZdmpiVnBvTXA5T0pxSEFteTV0?=
 =?utf-8?B?azNsYzRzbDU0cjU1dDcyTGRkbGgxaUhhbFhCQ0tjS3BweU4vS3BrNktEMEtK?=
 =?utf-8?B?cDhJQUNqOG9KeTN4ZGM3eGNsT3BzWlNod2RkOUlxcGpGNEgrMGxZRFdrTWxX?=
 =?utf-8?B?OG1zTUtjN3grYWp1R1c2bEhYbWMxL25Kdm9wWVMzMGNqRkExMlRieSsxRXVI?=
 =?utf-8?B?aFhzUnpsRXVNK1VVUnE1NTgxbTROcnM3TmVPRGliUFg4RkxJdTdObTVqeDNF?=
 =?utf-8?Q?TmHLRCXl44bhSCXM9S7Iy78fgVg7WpUiOiTQGhm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0I1T09kcHpUdTZ3bEsxZ3prS3ZkWXA2Tyt0S0hUYkFVZVNiOVFyWjFQV25u?=
 =?utf-8?B?aXltcU4wQUZabzBWakxDMEtZT3lXN2FGdjA5QTNZTllVcHZUdDdPZUgwYUNS?=
 =?utf-8?B?WTBSYm1FVUJYeUtHUlVUNEJlOFczczMwZGI0QWR0OTlyRFFnUTBFcUR3TE8v?=
 =?utf-8?B?WEdyNW55S09iSHRJNWxzL21SNnFVdi82YjhtMHhtV2hYV3hkWUZWaEVSWC83?=
 =?utf-8?B?QTFCcjY2N3F3d1BrdjV2MTFtcytzRHJnaWVYNjN0ZjQwSDZsR2ZRZDQvaXNp?=
 =?utf-8?B?S2FIbTVsSFBGQ0tXNEV4RlNFeE1LdUkva0FLdmpmamZYT2t2ZS96WlAyNkdB?=
 =?utf-8?B?UGJVU09JTWl0Ulpia1FMUEZ5YUY5M0d4eTY3L3VWNWI3dzZFMXVvc0dTS1Ew?=
 =?utf-8?B?TUtRV1pwUHVsbWQ2VytVQlJwcWxTTTJLSXpFVmlId0prcEpJa1dIUEExcVRJ?=
 =?utf-8?B?U3hNTXdFOFZrTmhHQUw2MWtDSXl0cmxCL2dTWTRJUDNTRjhGMWxPSTdVb3Fw?=
 =?utf-8?B?UHBoVVdRdVVnRHRrS2E1MFozWlF1SjN5Z2tMUmNTY1Y0bWZDaVh1bWJET1dO?=
 =?utf-8?B?YnE3bm5zUTBkdkRrWWo1SlArR2NnYVNPZVNQMVlMVEsxaGcrQXkxdXBsV2xZ?=
 =?utf-8?B?ZUx0M0hjalBGMWdtRHhZaTc1NlR2d2NuR1BXREFkMXc4Mi8xUklTbmtzdFVm?=
 =?utf-8?B?NTVHVDNsK1RkeVlGNTkwMjR2K2UvNFdnd1g4dU8rQUpWOFF5Nk1qbkU3Mnhu?=
 =?utf-8?B?TTVCUmhOT282eWJBMmNuN1F0c2tWRVhQbTJVSjRDLzFtMHdzbCthRlNHYTRm?=
 =?utf-8?B?NEF3R2ZvQmZpRWp5RkNrNTljVXcyNCt1bjdPTlpQU0dUUnFoSzhhUEV0RmVr?=
 =?utf-8?B?eGJBN3ZhdTJIRWREdmVNc1lTZENJa28zVVZuRm1qRlFZNDYzVVhXek1JMDhQ?=
 =?utf-8?B?Z3FTTlZCT2s0Ynh0VXpUVlJzZnBDOWc3UG03Y0dMVTlrL3A2NWMyYW9ObmJn?=
 =?utf-8?B?WUtZR2VyVmZLNTNJRVFTK2QrbnF2b2lHRHRZQ1RNM3Mxc29acTBrODd5M0lG?=
 =?utf-8?B?ZEFwM3hPemRjTEVoMi92ZURCSjJTQVlSUStBUGtVQ2VLcDJjV3FDT2UyUEJo?=
 =?utf-8?B?R2NDZEdNMmFkR0gvd0JQVDJOTFo1VEN5aERtVWVNNVVFU21iSWJHRzBKMkpW?=
 =?utf-8?B?M3BSUzZSZi9lays2VzUveVFuMnk1RFJKZEFHK2R5ZXRFN1pEVUdlS3lwNkdq?=
 =?utf-8?B?MTBTRUJLa2JmNjZnYXBJRzVNRTVscG83ZnJoNnhUVkhwaGluL0V0aXBVZURx?=
 =?utf-8?B?QkRDOGdhZWp4am5LbE81UGtYYXZVNHhTekFlRjZVQVN4MGxnamo4NzdSbXBB?=
 =?utf-8?B?eTF2NXJRdGhuV3pmM3ZrNHVEY2xZc0M2VWx1M0R6RVp4cFFmR0FNc2dnNTVl?=
 =?utf-8?B?TVJtazQvbG9QY1QzZDFpZU1OZlBYRzBSTi9JcFhWWXp0b3dqOXB4aGQveVBS?=
 =?utf-8?B?Z1hUYTBsQVZPaDh2OFVySS96bnk4c2R5NGZtQjZBVDFRckszNy84bjRYRTlm?=
 =?utf-8?B?OENYNDcvTjg4WjhtMnpLcjMvYVlVOUJScm1SaEVqZ0ZkNTc5RjVrdzExZUVO?=
 =?utf-8?B?QVRMRHdza29nMEdualVCY3VFYUhpcFFSZ3BlWkU5eDF0TTlBZ3dqdnc4Tkcz?=
 =?utf-8?B?ZnhjQ05QNWs0YThqSHBqOXdwYmdHQ2svZitXTUNacFZXdWZzeElpZ2t5T3ZV?=
 =?utf-8?B?RDBZRXFyTDJXZXB1bnZNOXQ2TFVHQ205bWlrSGtuQ3hsS0VQUTh5enV1a3cy?=
 =?utf-8?B?WEMxbEwwbHluWjY1RGJsZ1AzYUYzVGl0NTd1Zzg4N3A0RWZHR1BCRzRPSHFw?=
 =?utf-8?B?eTd1K3dHOHFkZW95a0MyeE8rN2FHWGw5aU91Wk9kQ0VDN2Q3NzhaeHFwU3c4?=
 =?utf-8?B?N3dSWmYxejV4MDNQT29ub2tFS2NSaCtmbGVZdXh5bGRweUlKQlBIRE5tdExl?=
 =?utf-8?B?cGIyWWRlTWwvaHppWEsrTTJkUm1vb1YvQ1ErMVNnMVpNTHRrRmJXYitDakhh?=
 =?utf-8?B?K3E3cjZ3SDluM1A5R00vQ3pVeFhWNnFJNkxJQ2YvNWVIQ05JRWFPcjlmUFAx?=
 =?utf-8?Q?NKQ/0ujc5npJbMy7KyXN25m+V?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aefaaec8-b279-4e1b-43ba-08dcfd9127dd
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 11:58:26.2295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qf10CZ0iT6mInFSlPj9Jtd/DaenKYI9bI9TEkg0Sg3n3ofjNV+dFCcruJahBf+XrOoH0RCUBFHdtJwH//ptSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6792


On 2024/11/5 19:39, Jacopo Mondi wrote:
> [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Tue, Nov 05, 2024 at 07:21:36PM +0800, Keke Li wrote:
>> Hi Jacopo
>>
>> Thanks very much for your reply.
>>
>> On 2024/11/5 01:50, Jacopo Mondi wrote:
>>> [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> [ EXTERNAL EMAIL ]
>>>
>>> Hi Keke
>>>      sorry for the late feedback, hope you're still interested in
>>> upstreaming this driver
>>>
>>> On Wed, Sep 18, 2024 at 02:07:13PM +0800, Keke Li via B4 Relay wrote:
>>>> From: Keke Li <keke.li@amlogic.com>
>>>>
>>>> This driver is used to receive mipi data from image sensor.
>>>>
>>>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>>>> ---
>>>>    MAINTAINERS                                        |   7 +
>>>>    drivers/media/platform/amlogic/Kconfig             |   1 +
>>>>    drivers/media/platform/amlogic/Makefile            |   2 +
>>>>    .../media/platform/amlogic/c3-mipi-csi2/Kconfig    |  16 +
>>>>    .../media/platform/amlogic/c3-mipi-csi2/Makefile   |   3 +
>>>>    .../platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c   | 910 +++++++++++++++++++++
>>>>    6 files changed, 939 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 2cdd7cacec86..9e75874a6e69 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1209,6 +1209,13 @@ F:     Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
>>>>    F:   drivers/perf/amlogic/
>>>>    F:   include/soc/amlogic/
>>>>
>>>> +AMLOGIC MIPI CSI2 DRIVER
>>>> +M:   Keke Li <keke.li@amlogic.com>
>>>> +L:   linux-media@vger.kernel.org
>>>> +S:   Maintained
>>>> +F:   Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
>>>> +F:   drivers/media/platform/amlogic/c3-mipi-csi2/
>>>> +
>>>>    AMPHENOL CHIPCAP 2 HUMIDITY-TEMPERATURE IIO DRIVER
>>>>    M:   Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>>>    L:   linux-hwmon@vger.kernel.org
>>>> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
>>>> index 5014957404e9..b7c2de14848b 100644
>>>> --- a/drivers/media/platform/amlogic/Kconfig
>>>> +++ b/drivers/media/platform/amlogic/Kconfig
>>>> @@ -2,4 +2,5 @@
>>>>
>>>>    comment "Amlogic media platform drivers"
>>>>
>>>> +source "drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig"
>>>>    source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>>>> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
>>>> index d3cdb8fa4ddb..4f571ce5d13e 100644
>>>> --- a/drivers/media/platform/amlogic/Makefile
>>>> +++ b/drivers/media/platform/amlogic/Makefile
>>>> @@ -1,2 +1,4 @@
>>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +obj-y += c3-mipi-csi2/
>>>>    obj-y += meson-ge2d/
>>>> diff --git a/drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig b/drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..0d7b2e203273
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig
>>>> @@ -0,0 +1,16 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +config VIDEO_C3_MIPI_CSI2
>>>> +     tristate "Amlogic C3 MIPI CSI-2 receiver"
>>>> +     depends on ARCH_MESON || COMPILE_TEST
>>>> +     depends on VIDEO_DEV
>>>> +     depends on OF
>>>> +     select MEDIA_CONTROLLER
>>>> +     select V4L2_FWNODE
>>>> +     select VIDEO_V4L2_SUBDEV_API
>>>> +     help
>>>> +       Video4Linux2 driver for Amlogic C3 MIPI CSI-2 receiver.
>>>> +       C3 MIPI CSI-2 receiver is used to receive MIPI data from
>>>> +       image sensor.
>>>> +
>>>> +       To compile this driver as a module choose m here.
>>>> diff --git a/drivers/media/platform/amlogic/c3-mipi-csi2/Makefile b/drivers/media/platform/amlogic/c3-mipi-csi2/Makefile
>>>> new file mode 100644
>>>> index 000000000000..cc08fc722bfd
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amlogic/c3-mipi-csi2/Makefile
>>>> @@ -0,0 +1,3 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +obj-$(CONFIG_VIDEO_C3_MIPI_CSI2) += c3-mipi-csi2.o
>>>> diff --git a/drivers/media/platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c
>>>> new file mode 100644
>>>> index 000000000000..6ac60d5b26a8
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c
>>>> @@ -0,0 +1,910 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>>> +/*
>>>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>>>> + */
>>>> +
>>>> +#include <linux/cleanup.h>
>>>> +#include <linux/clk.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +
>>>> +#include <media/v4l2-async.h>
>>>> +#include <media/v4l2-common.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>> +#include <media/v4l2-mc.h>
>>>> +#include <media/v4l2-subdev.h>
>>>> +
>>>> +/* C3 CSI-2 submodule definition */
>>>> +enum {
>>>> +     SUBMD_APHY,
>>>> +     SUBMD_DPHY,
>>>> +     SUBMD_HOST,
>>>> +};
>>>> +
>>>> +#define CSI2_SUBMD_MASK             GENMASK(17, 16)
>>>> +#define CSI2_SUBMD_SHIFT            16
>>>> +#define CSI2_SUBMD(x)               (((x) & (CSI2_SUBMD_MASK)) >> (CSI2_SUBMD_SHIFT))
>>>> +#define CSI2_REG_ADDR_MASK          GENMASK(15, 0)
>>>> +#define CSI2_REG_ADDR(x)            ((x) & (CSI2_REG_ADDR_MASK))
>>>> +#define CSI2_REG_A(x)               ((SUBMD_APHY << CSI2_SUBMD_SHIFT) | (x))
>>>> +#define CSI2_REG_D(x)               ((SUBMD_DPHY << CSI2_SUBMD_SHIFT) | (x))
>>>> +#define CSI2_REG_H(x)               ((SUBMD_HOST << CSI2_SUBMD_SHIFT) | (x))
>>>> +
>>>> +#define MIPI_CSI2_CLOCK_NUM_MAX     3
>>>> +#define MIPI_CSI2_SUBDEV_NAME       "mipi-csi2"
>>> Isn't the name too generic ? Should it report at least "c3-mipi-csi2"
>>> ?
>> Will modify the name with  "C3_MIPI_CSI2".
>>>> +
>>>> +/* C3 CSI-2 APHY register */
>>>> +#define MIPI_CSI_2M_PHY2_CNTL1      CSI2_REG_A(0x44)
>>>> +#define MIPI_APHY_NORMAL_CNTL1      0x3f425C00
>>> All other hex addresses use small capitals for letters
>> OK, will use small capitals for letters.
>>>> +
>>>> +#define MIPI_CSI_2M_PHY2_CNTL2      CSI2_REG_A(0x48)
>>>> +#define MIPI_APHY_4LANES_CNTL2      0x033a0000
>>>> +#define MIPI_APHY_NORMAL_CNTL2      0x333a0000
>>>> +
>>>> +#define MIPI_CSI_2M_PHY2_CNTL3      CSI2_REG_A(0x4c)
>>>> +#define MIPI_APHY_2LANES_CNTL3      0x03800000
>>>> +
>>>> +/* C3 CSI-2 DPHY register */
>>>> +#define MIPI_PHY_CTRL                    CSI2_REG_D(0x00)
>>>> +#define MIPI_DPHY_LANES_ENABLE      0x0
>>>> +
>>>> +#define MIPI_PHY_CLK_LANE_CTRL           CSI2_REG_D(0x04)
>>>> +#define MIPI_DPHY_CLK_CONTINUE_MODE 0x3d8
>>>> +
>>>> +#define MIPI_PHY_DATA_LANE_CTRL     CSI2_REG_D(0x08)
>>>> +#define MIPI_DPHY_LANE_CTRL_DISABLE 0x0
>>>> +
>>>> +#define MIPI_PHY_DATA_LANE_CTRL1    CSI2_REG_D(0x0c)
>>>> +#define MIPI_DPHY_INSERT_ERRESC     BIT(0)
>>>> +#define MIPI_DPHY_HS_SYNC_CHECK     BIT(1)
>>>> +#define MIPI_DPHY_FIVE_HS_PIPE      GENMASK(6, 2)
>>>> +#define MIPI_DPHY_FIVE_HS_PIPE_SHIFT           2
>>>> +#define MIPI_DPHY_DATA_PIPE_SELECT  GENMASK(9, 7)
>>>> +#define MIPI_DPHY_DATA_PIPE_SELECT_SHIFT       7
>>>> +
>>>> +#define MIPI_PHY_TCLK_MISS       CSI2_REG_D(0x10)
>>>> +#define MIPI_DPHY_CLK_MISS          0x9
>>>> +
>>>> +#define MIPI_PHY_TCLK_SETTLE     CSI2_REG_D(0x14)
>>>> +#define MIPI_DPHY_CLK_SETTLE        0x1F
>>>> +
>>>> +#define MIPI_PHY_THS_EXIT        CSI2_REG_D(0x18)
>>>> +#define MIPI_DPHY_HS_EXIT           0x8
>>>> +
>>>> +#define MIPI_PHY_THS_SKIP        CSI2_REG_D(0x1c)
>>>> +#define MIPI_DPHY_HS_SKIP           0xa
>>>> +
>>>> +#define MIPI_PHY_THS_SETTLE      CSI2_REG_D(0x20)
>>>> +#define MIPI_PHY_TINIT                   CSI2_REG_D(0x24)
>>>> +#define MIPI_DPHY_INIT_CYCLES       0x4e20
>>>> +
>>>> +#define MIPI_PHY_TULPS_C         CSI2_REG_D(0x28)
>>>> +#define MIPI_DPHY_ULPS_CHECK_CYCLES 0x1000
>>>> +
>>>> +#define MIPI_PHY_TULPS_S         CSI2_REG_D(0x2c)
>>>> +#define MIPI_DPHY_ULPS_START_CYCLES 0x100
>>>> +
>>>> +#define MIPI_PHY_TMBIAS             CSI2_REG_D(0x30)
>>>> +#define MIPI_DPHY_MBIAS_CYCLES      0x100
>>>> +
>>>> +#define MIPI_PHY_TLP_EN_W           CSI2_REG_D(0x34)
>>>> +#define MIPI_DPHY_ULPS_STOP_CYCLES  0xC
>>>> +
>>>> +#define MIPI_PHY_TLPOK                   CSI2_REG_D(0x38)
>>>> +#define MIPI_DPHY_POWER_UP_CYCLES   0x100
>>>> +
>>>> +#define MIPI_PHY_TWD_INIT        CSI2_REG_D(0x3c)
>>>> +#define MIPI_DPHY_INIT_WATCH_DOG    0x400000
>>>> +
>>>> +#define MIPI_PHY_TWD_HS             CSI2_REG_D(0x40)
>>>> +#define MIPI_DPHY_HS_WATCH_DOG      0x400000
>>>> +
>>>> +#define MIPI_PHY_MUX_CTRL0       CSI2_REG_D(0x284)
>>>> +#define MIPI_DPHY_LANE3_SELECT      GENMASK(3, 0)
>>>> +#define MIPI_DPHY_LANE2_SELECT      GENMASK(7, 4)
>>>> +#define MIPI_DPHY_LANE2_SELECT_SHIFT           4
>>>> +#define MIPI_DPHY_LANE1_SELECT      GENMASK(11, 8)
>>>> +#define MIPI_DPHY_LANE1_SELECT_SHIFT            8
>>>> +#define MIPI_DPHY_LANE0_SELECT      GENMASK(14, 12)
>>>> +
>>>> +#define MIPI_PHY_MUX_CTRL1       CSI2_REG_D(0x288)
>>>> +#define MIPI_DPHY_LANE3_CTRL_SIGNAL GENMASK(3, 0)
>>>> +#define MIPI_DPHY_LANE2_CTRL_SIGNAL GENMASK(7, 4)
>>>> +#define MIPI_DPHY_LANE2_CTRL_SIGNAL_SHIFT      4
>>>> +#define MIPI_DPHY_LANE1_CTRL_SIGNAL GENMASK(11, 8)
>>>> +#define MIPI_DPHY_LANE1_CTRL_SIGNAL_SHIFT       8
>>>> +#define MIPI_DPHY_LANE0_CTRL_SIGNAL GENMASK(14, 12)
>>>> +#define MIPI_DPHY_CLK_SELECT        BIT(17)
>>>> +
>>>> +/* C3 CSI-2 HOST register */
>>>> +#define CSI2_HOST_N_LANES           CSI2_REG_H(0x04)
>>>> +#define CSI2_HOST_CSI2_RESETN       CSI2_REG_H(0x10)
>>>> +#define CSI2_HOST_RESETN_DEFAULT    0x0
>>>> +#define CSI2_HOST_RESETN_RST_VALUE  BIT(0)
>>>> +
>>>> +#define CSI2_HOST_MASK1             CSI2_REG_H(0x28)
>>>> +#define CSI2_HOST_ERROR_MASK1       GENMASK(28, 0)
>>>> +
>>>> +#define MIPI_CSI2_MAX_WIDTH         2888
>>>> +#define MIPI_CSI2_MIN_WIDTH         160
>>>> +#define MIPI_CSI2_MAX_HEIGHT        2240
>>>> +#define MIPI_CSI2_MIN_HEIGHT        120
>>>> +#define MIPI_CSI2_DEFAULT_WIDTH     1920
>>>> +#define MIPI_CSI2_DEFAULT_HEIGHT    1080
>>>> +#define MIPI_CSI2_DEFAULT_FMT       MEDIA_BUS_FMT_SRGGB10_1X10
>>>> +
>>>> +/* C3 CSI-2 pad list */
>>>> +enum {
>>>> +     MIPI_CSI2_PAD_SINK,
>>>> +     MIPI_CSI2_PAD_SRC,
>>>> +     MIPI_CSI2_PAD_MAX
>>>> +};
>>>> +
>>>> +/**
>>> You don't need to kernel-doc in-driver types and functions.
>>> Documentation is always good, but this won't be parsed by kernel-doc
>>> (afaiu) so you should drop one * from /**
>>>
>> Will drop one * from /**
>>>> + * struct csi_info - MIPI CSI2 information
>>>> + *
>>>> + * @clocks: array of MIPI CSI2 clock names
>>>> + * @clock_rates: array of MIPI CSI2 clock rate
>>>> + * @clock_num: actual clock number
>>>> + */
>>>> +struct csi_info {
>>>> +     char *clocks[MIPI_CSI2_CLOCK_NUM_MAX];
>>>> +     u32 clock_rates[MIPI_CSI2_CLOCK_NUM_MAX];
>>>> +     u32 clock_num;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct csi_device - MIPI CSI2 platform device
>>>> + *
>>>> + * @dev: pointer to the struct device
>>>> + * @aphy: MIPI CSI2 aphy register address
>>>> + * @dphy: MIPI CSI2 dphy register address
>>>> + * @host: MIPI CSI2 host register address
>>>> + * @clks: array of MIPI CSI2 clocks
>>>> + * @sd: MIPI CSI2 sub-device
>>>> + * @pads: MIPI CSI2 sub-device pads
>>>> + * @notifier: notifier to register on the v4l2-async API
>>>> + * @src_sd: source sub-device
>>>> + * @bus: MIPI CSI2 bus information
>>>> + * @src_sd_pad: source sub-device pad
>>>> + * @lock: protect MIPI CSI2 device
>>>> + * @info: version-specific MIPI CSI2 information
>>>> + */
>>>> +struct csi_device {
>>>> +     struct device *dev;
>>>> +     void __iomem *aphy;
>>>> +     void __iomem *dphy;
>>>> +     void __iomem *host;
>>>> +     struct clk_bulk_data clks[MIPI_CSI2_CLOCK_NUM_MAX];
>>>> +
>>>> +     struct v4l2_subdev sd;
>>>> +     struct media_pad pads[MIPI_CSI2_PAD_MAX];
>>>> +     struct v4l2_async_notifier notifier;
>>>> +     struct v4l2_subdev *src_sd;
>>>> +     struct v4l2_mbus_config_mipi_csi2 bus;
>>>> +
>>>> +     u16 src_sd_pad;
>>>> +     struct mutex lock; /* Protect csi device */
>>> All the operations which receive a subdev_state are guaranteed to be locked
>>> so you can avoid manually locking in enable/disable streams
>>> (and drop #include cleanup.h if you don't use guards in any other
>>> place)
>>>
>> OK, will remove this lock and drop "#include cleanup.h"
>>>> +     const struct csi_info *info;
>>>> +};
>>>> +
>>>> +static const u32 c3_mipi_csi_formats[] = {
>>>> +     MEDIA_BUS_FMT_SBGGR10_1X10,
>>>> +     MEDIA_BUS_FMT_SGBRG10_1X10,
>>>> +     MEDIA_BUS_FMT_SGRBG10_1X10,
>>>> +     MEDIA_BUS_FMT_SRGGB10_1X10,
>>>> +     MEDIA_BUS_FMT_SBGGR12_1X12,
>>>> +     MEDIA_BUS_FMT_SGBRG12_1X12,
>>>> +     MEDIA_BUS_FMT_SGRBG12_1X12,
>>>> +     MEDIA_BUS_FMT_SRGGB12_1X12,
>>>> +};
>>>> +
>>>> +/* Hardware configuration */
>>>> +
>>>> +static void c3_mipi_csi_write(struct csi_device *csi, u32 reg, u32 val)
>>>> +{
>>>> +     void __iomem *addr;
>>>> +
>>>> +     switch (CSI2_SUBMD(reg)) {
>>>> +     case SUBMD_APHY:
>>>> +             addr = csi->aphy + CSI2_REG_ADDR(reg);
>>>> +             break;
>>>> +     case SUBMD_DPHY:
>>>> +             addr = csi->dphy + CSI2_REG_ADDR(reg);
>>>> +             break;
>>>> +     case SUBMD_HOST:
>>>> +             addr = csi->host + CSI2_REG_ADDR(reg);
>>>> +             break;
>>>> +     default:
>>>> +             dev_err(csi->dev, "Invalid sub-module: %lu\n", CSI2_SUBMD(reg));
>>>> +             return;
>>>> +     }
>>>> +
>>>> +     writel(val, addr);
>>>> +}
>>>> +
>>>> +static void c3_mipi_csi_update_bits(struct csi_device *csi, u32 reg,
>>>> +                                 u32 mask, u32 val)
>>>> +{
>>>> +     void __iomem *addr;
>>>> +     u32 orig, tmp;
>>>> +
>>>> +     switch (CSI2_SUBMD(reg)) {
>>>> +     case SUBMD_APHY:
>>>> +             addr = csi->aphy + CSI2_REG_ADDR(reg);
>>>> +             break;
>>>> +     case SUBMD_DPHY:
>>>> +             addr = csi->dphy + CSI2_REG_ADDR(reg);
>>>> +             break;
>>>> +     case SUBMD_HOST:
>>>> +             addr = csi->host + CSI2_REG_ADDR(reg);
>>>> +             break;
>>>> +     default:
>>>> +             dev_err(csi->dev, "Invalid sub-module: %lu\n", CSI2_SUBMD(reg));
>>>> +             return;
>>>> +     }
>>> This is repeated in two functions and could be grouped to a common
>>> place. Up to you
>> Will use a common function to replace this part.
>>>> +
>>>> +     orig = readl(addr);
>>>> +     tmp = orig & ~mask;
>>>> +     tmp |= val & mask;
>>>> +
>>>> +     if (tmp != orig)
>>>> +             writel(tmp, addr);
>>>> +}
>>>> +
>>>> +static void c3_mipi_csi_cfg_aphy(struct csi_device *csi, u32 lanes)
>>>> +{
>>>> +     c3_mipi_csi_write(csi, MIPI_CSI_2M_PHY2_CNTL1, MIPI_APHY_NORMAL_CNTL1);
>>>> +
>>>> +     if (lanes == 4)
>>>> +             c3_mipi_csi_write(csi, MIPI_CSI_2M_PHY2_CNTL2, MIPI_APHY_4LANES_CNTL2);
>>>> +     else
>>>> +             c3_mipi_csi_write(csi, MIPI_CSI_2M_PHY2_CNTL2, MIPI_APHY_NORMAL_CNTL2);
>>>> +
>>>> +     if (lanes == 2)
>>>> +             c3_mipi_csi_write(csi, MIPI_CSI_2M_PHY2_CNTL3, MIPI_APHY_2LANES_CNTL3);
>>> The driver seems to only accept 2 or 4 lanes. What is
>>> MIPI_APHY_NORMAL_CNTL2 for ?
>> Will modify MIPI_APHY_NORMAL_CNTL2 to MIPI_APHY_2LANES_CNTL2.
>>
>> MIPI_APHY_2LANES_CNTL2 can indicate this 2 lanes setting.
>>
>>>> +}
>>>> +
>>>> +static void c3_mipi_csi_2lanes_setting(struct csi_device *csi)
>>>> +{
>>>> +     /* Disable lane 2 and lane 3 */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0, MIPI_DPHY_LANE3_SELECT, 0xf);
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0, MIPI_DPHY_LANE2_SELECT,
>>>> +                             0xf << MIPI_DPHY_LANE2_SELECT_SHIFT);
>>>> +     /* Select analog data lane 1 */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0, MIPI_DPHY_LANE1_SELECT,
>>>> +                             0x1 << MIPI_DPHY_LANE1_SELECT_SHIFT);
>>>> +     /* Select analog data lane 0 */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0, MIPI_DPHY_LANE0_SELECT, 0x0);
>>>> +
>>>> +     /* Disable lane 2 and lane 3 control signal */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_LANE3_CTRL_SIGNAL, 0xf);
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_LANE2_CTRL_SIGNAL,
>>>> +                             0xf << MIPI_DPHY_LANE2_CTRL_SIGNAL_SHIFT);
>>>> +     /* Select lane 1 signal */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_LANE1_CTRL_SIGNAL,
>>>> +                             0x1 << MIPI_DPHY_LANE1_CTRL_SIGNAL_SHIFT);
>>>> +     /* Select lane 0 signal */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_LANE0_CTRL_SIGNAL, 0x0);
>>>> +     /* Select input 0 as clock */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_CLK_SELECT,
>>>> +                             MIPI_DPHY_CLK_SELECT);
>>>> +}
>>>> +
>>>> +static void c3_mipi_csi_4lanes_setting(struct csi_device *csi)
>>>> +{
>>>> +     /* Select analog data lane 3 */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0, MIPI_DPHY_LANE3_SELECT, 0x3);
>>>> +     /* Select analog data lane 2 */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0, MIPI_DPHY_LANE2_SELECT,
>>>> +                             0x2 << MIPI_DPHY_LANE2_SELECT_SHIFT);
>>>> +     /* Select analog data lane 1 */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0, MIPI_DPHY_LANE1_SELECT,
>>>> +                             0x1 << MIPI_DPHY_LANE1_SELECT_SHIFT);
>>>> +     /* Select analog data lane 0 */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0, MIPI_DPHY_LANE0_SELECT, 0x0);
>>>> +
>>>> +     /* Select lane 3 signal */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_LANE3_CTRL_SIGNAL, 0x3);
>>>> +     /* Select lane 2 signal */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_LANE2_CTRL_SIGNAL,
>>>> +                             0x2 << MIPI_DPHY_LANE2_CTRL_SIGNAL_SHIFT);
>>>> +     /* Select lane 1 signal */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_LANE1_CTRL_SIGNAL,
>>>> +                             0x1 << MIPI_DPHY_LANE1_CTRL_SIGNAL_SHIFT);
>>>> +     /* Select lane 0 signal */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_LANE0_CTRL_SIGNAL, 0x0);
>>>> +     /* Select input 0 as clock */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1, MIPI_DPHY_CLK_SELECT,
>>>> +                             MIPI_DPHY_CLK_SELECT);
>>>> +}
>>>> +
>>>> +static void c3_mipi_csi_cfg_dphy(struct csi_device *csi, u32 lanes, s64 rate)
>>>> +{
>>>> +     u32 val;
>>>> +     u32 settle;
>>>> +
>>>> +     /* Calculate the high speed settle */
>>>> +     val = DIV_ROUND_UP(1000000000, rate);
>>>> +     settle = (16 * val + 230) / 10;
>>>> +
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_CLK_LANE_CTRL, MIPI_DPHY_CLK_CONTINUE_MODE);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TCLK_MISS, MIPI_DPHY_CLK_MISS);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TCLK_SETTLE, MIPI_DPHY_CLK_SETTLE);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_EXIT, MIPI_DPHY_HS_EXIT);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_SKIP, MIPI_DPHY_HS_SKIP);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_SETTLE, settle);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TINIT, MIPI_DPHY_INIT_CYCLES);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TMBIAS, MIPI_DPHY_MBIAS_CYCLES);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TULPS_C, MIPI_DPHY_ULPS_CHECK_CYCLES);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TULPS_S, MIPI_DPHY_ULPS_START_CYCLES);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TLP_EN_W, MIPI_DPHY_ULPS_STOP_CYCLES);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TLPOK, MIPI_DPHY_POWER_UP_CYCLES);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TWD_INIT, MIPI_DPHY_INIT_WATCH_DOG);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_TWD_HS, MIPI_DPHY_HS_WATCH_DOG);
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_DATA_LANE_CTRL, MIPI_DPHY_LANE_CTRL_DISABLE);
>>>> +
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_DATA_LANE_CTRL1, MIPI_DPHY_INSERT_ERRESC,
>>>> +                             MIPI_DPHY_INSERT_ERRESC);
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_DATA_LANE_CTRL1, MIPI_DPHY_HS_SYNC_CHECK,
>>>> +                             MIPI_DPHY_HS_SYNC_CHECK);
>>>> +     /*
>>>> +      * Set 5 pipe lines to the same high speed.
>>>> +      * Each bit for one pipe line.
>>>> +      */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_DATA_LANE_CTRL1, MIPI_DPHY_FIVE_HS_PIPE,
>>>> +                             0x1f << MIPI_DPHY_FIVE_HS_PIPE_SHIFT);
>>>> +
>>>> +     /* Output data with pipe line data. */
>>>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_DATA_LANE_CTRL1, MIPI_DPHY_DATA_PIPE_SELECT,
>>>> +                             0x3 << MIPI_DPHY_DATA_PIPE_SELECT_SHIFT);
>>> Would it be possible to provide a definition for these 0x1f and 0x3
>>> values ?
>> OK, will provide two macros to represent  0x1f and 0x3.
>>>> +     if (lanes == 2)
>>>> +             c3_mipi_csi_2lanes_setting(csi);
>>>> +     else
>>>> +             c3_mipi_csi_4lanes_setting(csi);
>>>> +
>>>> +     /* Enable digital data and clock lanes */
>>>> +     c3_mipi_csi_write(csi, MIPI_PHY_CTRL, MIPI_DPHY_LANES_ENABLE);
>>>> +}
>>>> +
>>>> +static void c3_mipi_csi_cfg_host(struct csi_device *csi, u32 lanes)
>>>> +{
>>>> +     /* Reset CSI-2 controller output */
>>>> +     c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN, CSI2_HOST_RESETN_DEFAULT);
>>>> +     c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN, CSI2_HOST_RESETN_RST_VALUE);
>>>> +
>>>> +     /* Set data lane number */
>>>> +     c3_mipi_csi_write(csi, CSI2_HOST_N_LANES, lanes - 1);
>>>> +
>>>> +     /* Enable error mask */
>>>> +     c3_mipi_csi_write(csi, CSI2_HOST_MASK1, CSI2_HOST_ERROR_MASK1);
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_start_stream(struct csi_device *csi)
>>>> +{
>>>> +     s64 link_freq;
>>>> +     s64 lane_rate;
>>>> +
>>>> +     link_freq = v4l2_get_link_freq(csi->src_sd->ctrl_handler, 0, 0);
>>>> +     if (link_freq < 0) {
>>>> +             dev_err(csi->dev, "Unable to obtain link frequency: %lld\n", link_freq);
>>>> +             return link_freq;
>>>> +     }
>>>> +
>>>> +     lane_rate = link_freq * 2;
>>>> +     if (lane_rate > 1500000000)
>>> I would dev_err here too
>> Will add dev_err.
>>>> +             return -EINVAL;
>>>> +
>>>> +     c3_mipi_csi_cfg_aphy(csi, csi->bus.num_data_lanes);
>>>> +     c3_mipi_csi_cfg_dphy(csi, csi->bus.num_data_lanes, lane_rate);
>>>> +     c3_mipi_csi_cfg_host(csi, csi->bus.num_data_lanes);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
>>>> +                                   struct v4l2_subdev_state *state,
>>>> +                                   u32 pad, u64 streams_mask)
>>>> +{
>>>> +     struct csi_device *csi = v4l2_get_subdevdata(sd);
>>>> +     u64 sink_streams;
>>>> +     int ret;
>>>> +
>>>> +     guard(mutex)(&csi->lock);
>>>> +
>>>> +     pm_runtime_resume_and_get(csi->dev);
>>>> +
>>>> +     c3_mipi_csi_start_stream(csi);
>>>> +
>>>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>>>> +                                                    MIPI_CSI2_PAD_SINK,
>>>> +                                                    &streams_mask);
>>>> +     ret = v4l2_subdev_enable_streams(csi->src_sd,
>>>> +                                      csi->src_sd_pad,
>>>> +                                      sink_streams);
>>>> +     if (ret) {
>>>> +             pm_runtime_put(csi->dev);
>>>> +             return ret;
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_disable_streams(struct v4l2_subdev *sd,
>>>> +                                    struct v4l2_subdev_state *state,
>>>> +                                    u32 pad, u64 streams_mask)
>>>> +{
>>>> +     struct csi_device *csi = v4l2_get_subdevdata(sd);
>>>> +     u64 sink_streams;
>>>> +     int ret;
>>>> +
>>>> +     guard(mutex)(&csi->lock);
>>>> +
>>>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>>>> +                                                    MIPI_CSI2_PAD_SINK,
>>>> +                                                    &streams_mask);
>>>> +     ret = v4l2_subdev_disable_streams(csi->src_sd,
>>>> +                                       csi->src_sd_pad,
>>>> +                                       sink_streams);
>>>> +     if (ret)
>>>> +             dev_err(csi->dev, "Failed to disable %s\n", csi->src_sd->name);
>>>> +
>>>> +     pm_runtime_put(csi->dev);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_cfg_routing(struct v4l2_subdev *sd,
>>>> +                                struct v4l2_subdev_state *state,
>>>> +                                struct v4l2_subdev_krouting *routing)
>>>> +{
>>>> +     static const struct v4l2_mbus_framefmt format = {
>>>> +             .width = MIPI_CSI2_DEFAULT_WIDTH,
>>>> +             .height = MIPI_CSI2_DEFAULT_HEIGHT,
>>>> +             .code = MIPI_CSI2_DEFAULT_FMT,
>>>> +             .field = V4L2_FIELD_NONE,
>>>> +             .colorspace = V4L2_COLORSPACE_RAW,
>>>> +             .ycbcr_enc = V4L2_YCBCR_ENC_601,
>>>> +             .quantization = V4L2_QUANTIZATION_LIM_RANGE,
>>> I presume for Raw Bayer data the quantization range is full ?
>> OK, will modify V4L2_QUANTIZATION_LIM_RANGE to V4L2_QUANTIZATION_FULL_RANGE.
>>>> +             .xfer_func = V4L2_XFER_FUNC_NONE,
>>>> +     };
>>>> +     int ret;
>>>> +
>>>> +     ret = v4l2_subdev_routing_validate(sd, routing,
>>>> +                                        V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>>>> +     if (ret)
>>>> +             return ret;
>>> You should validate that the provided routing table matches what the
>>> driver supports, so only [0/0]->[1/0]
>>>
>>> Now that I've said so, if the routing table is not modifiable I wonder
>>> if you should support set_routing() at all, or it could be left out
>>> until you don't add support for more streams to the driver.
>>>
>>> After all this driver implements support for routing but doesn't set
>>> the V4L2_SUBDEV_FL_STREAMS flag, so the operation is disallowed from
>>> userspace for now.
>> Will remove set_routing().
>>
>> Now the driver dosen't require  routing configuration.
>>
>>>> +
>>>> +     ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_init_routing(struct v4l2_subdev *sd,
>>>> +                                 struct v4l2_subdev_state *state)
>>>> +{
>>>> +     struct v4l2_subdev_route routes;
>>>> +     struct v4l2_subdev_krouting routing;
>>>> +
>>>> +     routes.sink_pad = MIPI_CSI2_PAD_SINK;
>>>> +     routes.sink_stream = 0;
>>>> +     routes.source_pad = MIPI_CSI2_PAD_SRC;
>>>> +     routes.source_stream = 0;
>>>> +     routes.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>>>> +
>>>> +     routing.num_routes = 1;
>>>> +     routing.routes = &routes;
>>>> +
>>>> +     return c3_mipi_csi_cfg_routing(sd, state, &routing);
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_set_routing(struct v4l2_subdev *sd,
>>>> +                                struct v4l2_subdev_state *state,
>>>> +                                enum v4l2_subdev_format_whence which,
>>>> +                                struct v4l2_subdev_krouting *routing)
>>>> +{
>>>> +     bool is_streaming = v4l2_subdev_is_streaming(sd);
>>>> +
>>>> +     if (which == V4L2_SUBDEV_FORMAT_ACTIVE && is_streaming)
>>>> +             return -EBUSY;
>>>> +
>>>> +     return c3_mipi_csi_cfg_routing(sd, state, routing);
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
>>>> +                                   struct v4l2_subdev_state *state,
>>>> +                                   struct v4l2_subdev_mbus_code_enum *code)
>>>> +{
>>>> +     switch (code->pad) {
>>>> +     case MIPI_CSI2_PAD_SINK:
>>>> +             if (code->index >= ARRAY_SIZE(c3_mipi_csi_formats))
>>>> +                     return -EINVAL;
>>>> +
>>>> +             code->code = c3_mipi_csi_formats[code->index];
>>>> +             break;
>>>> +     case MIPI_CSI2_PAD_SRC:
>>>> +             struct v4l2_mbus_framefmt *fmt;
>>>> +
>>>> +             if (code->index > 0)
>>>> +                     return -EINVAL;
>>>> +
>>>> +             fmt = v4l2_subdev_state_get_format(state, code->pad);
>>>> +             code->code = fmt->code;
>>>> +             break;
>>> I'm not sure if the V4L2 API specify that the formats on a pad should
>>> be enumerated in full, regardless of the configuration, or like you're
>>> doing here reflect the subdev configuration. I like what you have here
>>> more, so unless someone screams I think it's fine.
>> OK, thanks.
>>
>> I will pay attention to the review of this function.
>>
>>>> +     default:
>>>> +             return -EINVAL;
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_set_fmt(struct v4l2_subdev *sd,
>>>> +                            struct v4l2_subdev_state *state,
>>>> +                            struct v4l2_subdev_format *format)
>>>> +{
>>>> +     struct v4l2_mbus_framefmt *fmt;
>>>> +     unsigned int i;
>>>> +
>>>> +     if (format->pad != MIPI_CSI2_PAD_SINK)
>>>> +             return v4l2_subdev_get_fmt(sd, state, format);
>>>> +
>>>> +     fmt = v4l2_subdev_state_get_format(state, format->pad);
>>> Could you clarify what other streams you plan to support ? As you
>>> support routing I presume you are preparing to capture
>>> multiple streams of data like image + embedded data, or to support
>>> sensors which sends data on different virtual channels ?
>>>
>>> How do you see this driver evolve ? Will it be augmented with an
>>> additional source pad directed to a video device where to capture
>>> embedded data from ?
>>>
>>> I'm wondering because if PAD_SINK become multiplexed, you won't be
>>> allowed to set a format there. It only works now because you have a
>>> single stream.
>>>
>>> Speaking of which, as you prepare to support multiple streams, I would
>>> specify the stream number when calling v4l2_subdev_state_get_format().
>>>
>>>           fmt = v4l2_subdev_state_get_format(state, format->pad, 0);
>>>
>> Thanks for your suggestion.
>>
>> But this MIPI CSI2 hardware module doesn't have the ability to separate data
>> , such as image + embedded data.
>>
>> So there are no plans to support other streams.
> I see. Now that I've reviewed the adapter subdevice path I realized
> that it's the adapter that can split data based on VC/DT to either the
> ISP direct path or to DDR.
>
> The CSI-2 RX then transports streams as received from the sensor
> directly to the adapter.
>
> In order to support capturing embedded data to DDR in the adapter the
> embedded data stream needs a representation in this subdevice as well,
> so that the source pad is multiplexed as well and the adapter receives
> two streams that it can eventually split.
>
>
>        Sensor         CSI-2Rx         Adapter
>     +-----------+     +------+       +--------+
>     0-- ED --\  |     |      |       |     /->0---> Embedded Data (DDR)
>     |         ->0====>0 ==== 0 ====> 0====|   |
>     0-- I ---/  |     |      |       |     \->0--->    Image (ISP)
>     +-----------+     +------+       +--------+
>
> When going to support embedded data capture this driver should create
> two routes and allow enabling/disabling the embedded data one.
>
> Tomi in cc for inputs.
>
> For now, if you don't support capturing embedded data, I would remove
> routing support from here and from the adapter.
>

Yes, you are right.

The adapter module can support capturing embedded data.

I will remove set_routing() interface.

>>>> +
>>>> +     for (i = 0; i < ARRAY_SIZE(c3_mipi_csi_formats); i++)
>>>> +             if (format->format.code == c3_mipi_csi_formats[i])
>>>> +                     break;
>>> nit: please use {} for the for loop
>> Will add { } for the for loop
>>>> +
>>>> +     if (i == ARRAY_SIZE(c3_mipi_csi_formats))
>>>> +             fmt->code = c3_mipi_csi_formats[0];
>>>> +     else
>>>> +             fmt->code = c3_mipi_csi_formats[i];
>>> You could set this in the for loop, before breaking.
>> Will put this in the for loop.
>>>> +
>>>> +     fmt->width = clamp_t(u32, format->format.width,
>>>> +                          MIPI_CSI2_MIN_WIDTH, MIPI_CSI2_MAX_WIDTH);
>>>> +     fmt->height = clamp_t(u32, format->format.height,
>>>> +                           MIPI_CSI2_MIN_HEIGHT, MIPI_CSI2_MAX_HEIGHT);
>>>> +
>>> You should set the colorspace related information too, as you
>>> initialize them, similar to what you do in init_state()
>> Will set the colorspace .
>>>> +     format->format = *fmt;
>>>> +
>>>> +     /* Synchronize the format to source pad */
>>>> +     fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SRC);
>>>> +     *fmt = format->format;
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_init_state(struct v4l2_subdev *sd,
>>>> +                               struct v4l2_subdev_state *state)
>>>> +{
>>>> +     struct v4l2_mbus_framefmt *sink_fmt;
>>>> +     struct v4l2_mbus_framefmt *src_fmt;
>>>> +
>>>> +     sink_fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SINK);
>>>> +     src_fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SRC);
>>>> +
>>>> +     sink_fmt->width = MIPI_CSI2_DEFAULT_WIDTH;
>>>> +     sink_fmt->height = MIPI_CSI2_DEFAULT_HEIGHT;
>>>> +     sink_fmt->field = V4L2_FIELD_NONE;
>>>> +     sink_fmt->code = MIPI_CSI2_DEFAULT_FMT;
>>>> +     sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
>>>> +     sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
>>>> +     sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
>>>> +     sink_fmt->quantization =
>>>> +             V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
>>> If you could initialize them like you do above, with specific values
>>> instead of using _DEFAULT() I think it's better.
>> Will use the specific values.
>>>> +                                           sink_fmt->ycbcr_enc);
>>>> +     *src_fmt = *sink_fmt;
>>>> +
>>>> +     return c3_mipi_csi_init_routing(sd, state);
>>>> +}
>>>> +
>>>> +static const struct v4l2_subdev_pad_ops c3_mipi_csi_pad_ops = {
>>>> +     .enum_mbus_code = c3_mipi_csi_enum_mbus_code,
>>>> +     .get_fmt = v4l2_subdev_get_fmt,
>>>> +     .set_fmt = c3_mipi_csi_set_fmt,
>>>> +     .set_routing = c3_mipi_csi_set_routing,
>>>> +     .enable_streams = c3_mipi_csi_enable_streams,
>>>> +     .disable_streams = c3_mipi_csi_disable_streams,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_ops c3_mipi_csi_subdev_ops = {
>>>> +     .pad = &c3_mipi_csi_pad_ops,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_internal_ops c3_mipi_csi_internal_ops = {
>>>> +     .init_state = c3_mipi_csi_init_state,
>>>> +};
>>>> +
>>>> +/* Media entity operations */
>>>> +static const struct media_entity_operations c3_mipi_csi_entity_ops = {
>>>> +     .link_validate = v4l2_subdev_link_validate,
>>>> +};
>>>> +
>>>> +/* PM runtime */
>>>> +
>>>> +static int __maybe_unused c3_mipi_csi_runtime_suspend(struct device *dev)
>>>> +{
>>>> +     struct csi_device *csi = dev_get_drvdata(dev);
>>>> +
>>>> +     clk_bulk_disable_unprepare(csi->info->clock_num, csi->clks);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int __maybe_unused c3_mipi_csi_runtime_resume(struct device *dev)
>>>> +{
>>>> +     struct csi_device *csi = dev_get_drvdata(dev);
>>>> +
>>>> +     return clk_bulk_prepare_enable(csi->info->clock_num, csi->clks);
>>>> +}
>>>> +
>>>> +static const struct dev_pm_ops c3_mipi_csi_pm_ops = {
>>>> +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>> +                             pm_runtime_force_resume)
>>>> +     SET_RUNTIME_PM_OPS(c3_mipi_csi_runtime_suspend,
>>>> +                        c3_mipi_csi_runtime_resume, NULL)
>>> You could use SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS and set
>>>
>>>                   .pm = pm_ptr(&c3_mipi_csi_pm_ops),
>>>
>>> to avoid __maybe_unused in the functions, up to you
>>>
>> OK, will use your method to set pm.
>>>> +};
>>>> +
>>>> +/* Probe/remove & platform driver */
>>>> +
>>>> +static int c3_mipi_csi_subdev_init(struct csi_device *csi)
>>>> +{
>>>> +     struct v4l2_subdev *sd = &csi->sd;
>>>> +     int ret;
>>>> +
>>>> +     v4l2_subdev_init(sd, &c3_mipi_csi_subdev_ops);
>>>> +     sd->owner = THIS_MODULE;
>>>> +     sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>>> +     sd->internal_ops = &c3_mipi_csi_internal_ops;
>>>> +     snprintf(sd->name, sizeof(sd->name), "%s", MIPI_CSI2_SUBDEV_NAME);
>>>> +
>>>> +     sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>>>> +     sd->entity.ops = &c3_mipi_csi_entity_ops;
>>>> +
>>>> +     sd->dev = csi->dev;
>>>> +     v4l2_set_subdevdata(sd, csi);
>>>> +
>>>> +     csi->pads[MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>>>> +     csi->pads[MIPI_CSI2_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>>>> +     ret = media_entity_pads_init(&sd->entity, MIPI_CSI2_PAD_MAX, csi->pads);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     ret = v4l2_subdev_init_finalize(sd);
>>>> +     if (ret) {
>>>> +             media_entity_cleanup(&sd->entity);
>>>> +             return ret;
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static void c3_mipi_csi_subdev_deinit(struct csi_device *csi)
>>>> +{
>>>> +     v4l2_subdev_cleanup(&csi->sd);
>>>> +     media_entity_cleanup(&csi->sd.entity);
>>>> +}
>>>> +
>>>> +/* Subdev notifier register */
>>>> +static int c3_mipi_csi_notify_bound(struct v4l2_async_notifier *notifier,
>>>> +                                 struct v4l2_subdev *sd,
>>>> +                                 struct v4l2_async_connection *asc)
>>>> +{
>>>> +     struct csi_device *csi = v4l2_get_subdevdata(notifier->sd);
>>>> +     struct media_pad *sink = &csi->sd.entity.pads[MIPI_CSI2_PAD_SINK];
>>>> +     int ret;
>>>> +
>>>> +     ret = media_entity_get_fwnode_pad(&sd->entity,
>>>> +                                       sd->fwnode, MEDIA_PAD_FL_SOURCE);
>>>> +     if (ret < 0) {
>>>> +             dev_err(csi->dev, "Failed to find pad for %s\n", sd->name);
>>>> +             return ret;
>>>> +     }
>>>> +
>>>> +     csi->src_sd = sd;
>>>> +     csi->src_sd_pad = ret;
>>>> +
>>>> +     return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
>>>> +                                            MEDIA_LNK_FL_IMMUTABLE);
>>>> +}
>>>> +
>>>> +static const struct v4l2_async_notifier_operations c3_mipi_csi_notify_ops = {
>>>> +     .bound = c3_mipi_csi_notify_bound,
>>>> +};
>>>> +
>>>> +static int c3_mipi_csi_async_register(struct csi_device *csi)
>>>> +{
>>>> +     struct v4l2_fwnode_endpoint vep = {
>>>> +             .bus_type = V4L2_MBUS_CSI2_DPHY,
>>>> +     };
>>>> +     struct v4l2_async_connection *asc;
>>>> +     struct fwnode_handle *ep;
>>>> +     int ret;
>>>> +
>>>> +     v4l2_async_subdev_nf_init(&csi->notifier, &csi->sd);
>>>> +
>>>> +     ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
>>>> +                                          FWNODE_GRAPH_ENDPOINT_NEXT);
>>>> +     if (!ep)
>>>> +             return -ENOTCONN;
>>>> +
>>>> +     ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>>>> +     if (ret)
>>>> +             goto err_put_handle;
>>>> +
>>>> +     csi->bus = vep.bus.mipi_csi2;
>>>> +     if (csi->bus.num_data_lanes != 2 && csi->bus.num_data_lanes != 4)
>>>> +             goto err_put_handle;
>>> I would dev_err() here
>>>
>>> Thanks
>>>      j
>> Wil add dev_err().
>>>> +
>>>> +     asc = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
>>>> +                                           struct v4l2_async_connection);
>>>> +     if (IS_ERR(asc)) {
>>>> +             ret = PTR_ERR(asc);
>>>> +             goto err_put_handle;
>>>> +     }
>>>> +
>>>> +     csi->notifier.ops = &c3_mipi_csi_notify_ops;
>>>> +     ret = v4l2_async_nf_register(&csi->notifier);
>>>> +     if (ret)
>>>> +             goto err_cleanup_nf;
>>>> +
>>>> +     ret = v4l2_async_register_subdev(&csi->sd);
>>>> +     if (ret)
>>>> +             goto err_unregister_nf;
>>>> +
>>>> +     fwnode_handle_put(ep);
>>>> +
>>>> +     return 0;
>>>> +
>>>> +err_unregister_nf:
>>>> +     v4l2_async_nf_unregister(&csi->notifier);
>>>> +err_cleanup_nf:
>>>> +     v4l2_async_nf_cleanup(&csi->notifier);
>>>> +err_put_handle:
>>>> +     fwnode_handle_put(ep);
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static void c3_mipi_csi_async_unregister(struct csi_device *csi)
>>>> +{
>>>> +     v4l2_async_unregister_subdev(&csi->sd);
>>>> +     v4l2_async_nf_unregister(&csi->notifier);
>>>> +     v4l2_async_nf_cleanup(&csi->notifier);
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_ioremap_resource(struct csi_device *csi)
>>>> +{
>>>> +     struct device *dev = csi->dev;
>>>> +     struct platform_device *pdev = to_platform_device(dev);
>>>> +
>>>> +     csi->aphy = devm_platform_ioremap_resource_byname(pdev, "aphy");
>>>> +     if (IS_ERR(csi->aphy))
>>>> +             return PTR_ERR(csi->aphy);
>>>> +
>>>> +     csi->dphy = devm_platform_ioremap_resource_byname(pdev, "dphy");
>>>> +     if (IS_ERR(csi->dphy))
>>>> +             return PTR_ERR(csi->dphy);
>>>> +
>>>> +     csi->host = devm_platform_ioremap_resource_byname(pdev, "host");
>>>> +     if (IS_ERR(csi->host))
>>>> +             return PTR_ERR(csi->host);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_configure_clocks(struct csi_device *csi)
>>>> +{
>>>> +     const struct csi_info *info = csi->info;
>>>> +     int ret;
>>>> +     u32 i;
>>>> +
>>>> +     for (i = 0; i < info->clock_num; i++)
>>>> +             csi->clks[i].id = info->clocks[i];
>>>> +
>>>> +     ret = devm_clk_bulk_get(csi->dev, info->clock_num, csi->clks);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     for (i = 0; i < info->clock_num; i++) {
>>>> +             if (!info->clock_rates[i])
>>>> +                     continue;
>>>> +             ret = clk_set_rate(csi->clks[i].clk, info->clock_rates[i]);
>>>> +             if (ret) {
>>>> +                     dev_err(csi->dev, "Failed to set %s rate %u\n", info->clocks[i],
>>>> +                             info->clock_rates[i]);
>>>> +                     return ret;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_csi_probe(struct platform_device *pdev)
>>>> +{
>>>> +     struct device *dev = &pdev->dev;
>>>> +     struct csi_device *csi;
>>>> +     int ret;
>>>> +
>>>> +     csi = devm_kzalloc(dev, sizeof(*csi), GFP_KERNEL);
>>>> +     if (!csi)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     csi->info = of_device_get_match_data(dev);
>>>> +     csi->dev = dev;
>>>> +
>>>> +     ret = c3_mipi_csi_ioremap_resource(csi);
>>>> +     if (ret)
>>>> +             return dev_err_probe(dev, ret, "Failed to ioremap resource\n");
>>>> +
>>>> +     ret = c3_mipi_csi_configure_clocks(csi);
>>>> +     if (ret)
>>>> +             return dev_err_probe(dev, ret, "Failed to configure clocks\n");
>>>> +
>>>> +     platform_set_drvdata(pdev, csi);
>>>> +
>>>> +     mutex_init(&csi->lock);
>>>> +     pm_runtime_enable(dev);
>>>> +
>>>> +     ret = c3_mipi_csi_subdev_init(csi);
>>>> +     if (ret)
>>>> +             goto err_disable_runtime_pm;
>>>> +
>>>> +     ret = c3_mipi_csi_async_register(csi);
>>>> +     if (ret)
>>>> +             goto err_deinit_subdev;
>>>> +
>>>> +     return 0;
>>>> +
>>>> +err_deinit_subdev:
>>>> +     c3_mipi_csi_subdev_deinit(csi);
>>>> +err_disable_runtime_pm:
>>>> +     pm_runtime_disable(dev);
>>>> +     mutex_destroy(&csi->lock);
>>>> +     return ret;
>>>> +};
>>>> +
>>>> +static void c3_mipi_csi_remove(struct platform_device *pdev)
>>>> +{
>>>> +     struct csi_device *csi = platform_get_drvdata(pdev);
>>>> +
>>>> +     c3_mipi_csi_async_unregister(csi);
>>>> +     c3_mipi_csi_subdev_deinit(csi);
>>>> +
>>>> +     pm_runtime_disable(&pdev->dev);
>>>> +     mutex_destroy(&csi->lock);
>>>> +};
>>>> +
>>>> +static const struct csi_info c3_mipi_csi_info = {
>>>> +     .clocks = {"vapb", "phy0"},
>>>> +     .clock_rates = {0, 200000000},
>>>> +     .clock_num = 2
>>>> +};
>>>> +
>>>> +static const struct of_device_id c3_mipi_csi_of_match[] = {
>>>> +     { .compatible = "amlogic,c3-mipi-csi2",
>>>> +       .data = &c3_mipi_csi_info,
>>>> +     },
>>>> +     { },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, c3_mipi_csi_of_match);
>>>> +
>>>> +static struct platform_driver c3_mipi_csi_driver = {
>>>> +     .probe = c3_mipi_csi_probe,
>>>> +     .remove = c3_mipi_csi_remove,
>>>> +     .driver = {
>>>> +             .name = "c3-mipi-csi2",
>>>> +             .of_match_table = c3_mipi_csi_of_match,
>>>> +             .pm = &c3_mipi_csi_pm_ops,
>>>> +     },
>>>> +};
>>>> +
>>>> +module_platform_driver(c3_mipi_csi_driver);
>>>> +
>>>> +MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
>>>> +MODULE_DESCRIPTION("Amlogic C3 MIPI CSI-2 receiver");
>>>> +MODULE_LICENSE("GPL");
>>>>
>>>> --
>>>> 2.46.1
>>>>
>>>>
>>>>

