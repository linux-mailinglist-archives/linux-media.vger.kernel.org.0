Return-Path: <linux-media+bounces-20560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60649B5B91
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 07:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E71281C21099
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 06:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDBE1D0F51;
	Wed, 30 Oct 2024 06:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lKi4FZd8"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2050.outbound.protection.outlook.com [40.107.103.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090033398E;
	Wed, 30 Oct 2024 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730268533; cv=fail; b=bJDS+qccoX4P6ba2wzleqbuvAfcJsGrsKLfI4uQ60bftg6BjcfpSOY3dInljnzGzG/JNbt1LRKm5Bnkg1RiKaNj3y24MtlGNxiHk7MP8OEYqf9jFxmljYsSBeHdcPhK2PMsmlDCAnYlhTxyzuvGsm2+Drdv1nJShj08aqsk70Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730268533; c=relaxed/simple;
	bh=3i2K9fFXnkHzn1YClXm8gB2pYWZdmW04odXGSHTwSHk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q93Wh7RE9hdmUUkuwMyopFo5tv58wpH+OToqVmU0eodC0lvYXzRm7QqkHxD8FfvW3eMZv8xahW2atAGb3oqx8a48xUxLtvjFS/HocOvc1XbnRzQXYBH1nW72T+C7Aak+8fyHBUf8lB1t34uBie/5dXmyb2UEox6PjRSzJSJ/kmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lKi4FZd8; arc=fail smtp.client-ip=40.107.103.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiOzdVWbts+tCqnVJX1gyDe3UxHzKyx+tqFBmurut71dOm+gqv00Y8wAvj4tqsaGGj6YNM2kc7hWOZkAe01mv0UdGTiN4amarZ6ZYW7eJI95NeJSnmZv1NRdTxDvYWdiC7I6gNww/FfAe45260o1qy/XVBhl/8pdvKWZimQJdaXuUGUz7lFB6yLo1AOHfuvxLxq6n7gZwfZaTznDb2AqYcSlhD2fZiBOetsuc1A/eDgdWSZAmkMf8wbnsVvgIrWwfIlEsk662WNQ4lKZyZKZoRln+jip28EI0Wvcifkv5ljUIz6xjVLLsgngyAHi8UAk5UuEx/LFwsuEifsKiYF92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15lb1D81F3DrJWZQGQsAgyEEMm5WRPWGwD4Ria9h3oY=;
 b=SXS8Q34rMPvjGBSZnD/teB8df6lDIq8Lb1UDRqcAmU4BOL5xNrMb4zLH6Pzs4w8Nh6tAAcRGjgZvLfnL/Nn/MQy7OC/qRn2/e5dYE8b8lS82YZgorYR2rtnGOGVWvoAEz9sP82DNsHpEHI5h6Lm4XgSg6Zj+aTm6VTUjSsd8ifWP9dWnGjnj7mSBljvSio63Ajkjx131Y6g/5TSVgd+W36lXwToXvo99sHOSqp4S+LGngwL9eL4yFTVponusoSkx47rAFHsMnlonuhKBhD+lKeSLYWxdDWy5jBCna0Pzi98JhzntSJ3jh8UF5vIJrRw4QS4MdgKh+R/jT2fSFyz3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15lb1D81F3DrJWZQGQsAgyEEMm5WRPWGwD4Ria9h3oY=;
 b=lKi4FZd8cD43Lv3DY+PcRPeslpQOF+Q2r2zgYsSCkeDDR0iRorXhunq+x/L6YzHHTgUNyBRfoRrUM6eHV+0emo/C8Xld4tE7JLNkywJlnkcVRBJMtn0BIRJ8P2oZUGLKhoGkP+D++J1riY+FgNNI1En855UleWgx495CTYJ38VpiKBrAz4tX4mRfQMC154ODotPn4XySAd1yscSoStQmQi31qhBI1vXL5TA3podQXXSMiHYUaRDOrya7pzEvTwMKHKY4fqK9auRb6/j6b6Ez5uqKnz6CeIudIKCetxZJgEe4cLfpto96sp8faYyPuJTtqWWyxV7G44j9KG+kdbZTnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by VI0PR04MB10094.eurprd04.prod.outlook.com (2603:10a6:800:247::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 06:08:47 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 06:08:47 +0000
Message-ID: <1021790e-8253-4fd9-8b16-c9c5fa70de6c@nxp.com>
Date: Wed, 30 Oct 2024 08:08:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for
 OX05B1S sensor driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <c32439a5-4230-4ca5-8d46-fb00d25072e5@linaro.org>
 <20241029115747.GL22600@pendragon.ideasonboard.com>
 <b5ada63e-31f5-4aec-8499-7e34f1943659@linaro.org>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <b5ada63e-31f5-4aec-8499-7e34f1943659@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0188.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::25) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|VI0PR04MB10094:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cbf1ac-f8d6-4851-0e25-08dcf8a95122
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RTBMcWQvTmVnVTFGaGtWRVdUTGF4cEtIY3EreE80UDRNMXB3SDl4TEVpamJM?=
 =?utf-8?B?eDRrOEx1RVlKamtvbEdBOWJzUTBneVZyRzQwcnhzSWlXTEo1MFVPOFRxaXdk?=
 =?utf-8?B?ZURDdnpreTNJb1hZMzZvc3lwR3lZMC9jZVBCSnIrcWRRY0hYbnMveXIvRy9n?=
 =?utf-8?B?MTNBSVVzTHZWdm5jamlaeUdzOUFSUTVZQ0FLYjVRL3NJbndUU3ZFdDBHekZU?=
 =?utf-8?B?cnVOcVEveGtxS1UreHZENHVWSmxHUTAvckMyQitRN1MxUTVFT1NBdE9WeU8v?=
 =?utf-8?B?ZjZQaUtKOWxNS3ZLN2lxeHAwaGNVaWc4TmMxY3d3cXVPTjVyUDRicjVHQXU0?=
 =?utf-8?B?TzBDMitNR2YwTGwyYmlwRTl0bm9qRW9aaFozLzJCaTdEYVpjTHlFNEtqcTZv?=
 =?utf-8?B?RGFESTZTSDYrYWdxeW5TeTAwdFZPTXlXMENiY25SYXo2UldFTGlKSGpvd2xs?=
 =?utf-8?B?MFhvc2FremtmcVhlUzIwbDgvYnBiT1oxek5sNGFKOVNBR0pjc01WRmlVT3dh?=
 =?utf-8?B?djYwejZJM3FCSjgrV3Z2cHlKU2dwS3JvTFRBZHJmWFZuMWRtYUNkekJCVWxj?=
 =?utf-8?B?QUx1bmNYeGpwQVZ2SEdpNVo0Q3Z6YzR1UER6QnczTzJoY0ZiS2tTZkZ1OTNx?=
 =?utf-8?B?MEQ4RVBWSWpRaWcxQ1VZMGtOK1pzNU1KdzZhNDVSUWdWRzAva0JObTVtSlZR?=
 =?utf-8?B?SHVrdHRzeUxCbUJPTDN0TVlveXE0WG1pMTl5dUhuVC94T2pvNUhONTY4UlNG?=
 =?utf-8?B?MG1Ec0daUnU0SkY5L3JhQ0VxWmZpMTE1QXdGaW44ZnFONGYzY0tjUHBrOVdw?=
 =?utf-8?B?ZnVNOTJoaldIcCtFUXFHU3Z6LzFCVTFQa0FJVjV1OU1BSnFwcmhSQ2NrcXB0?=
 =?utf-8?B?eVl4OFMvaXpqWmlmRUR6KzdZQ3R0UDV5QTN2c0U0dU85OERQanZMejhSd2Z2?=
 =?utf-8?B?VEZHNDd6c1NiNmZ2Z1FOYUZLNjdHOFdUd2oyQ2ZXVmF1YklGSmhZSHNERHAz?=
 =?utf-8?B?UkFnVkUyaUxhODc0NUJjTko2QldPT0Z5NTRuNUhxZVJNaEpueFhFaUtFdjF0?=
 =?utf-8?B?ZlZ1TmkyNXNaSkhjeUhwRWcwQnhPbWRXUHRWQ0pIOXJZTnZYTU1LVStORnJx?=
 =?utf-8?B?NStaS2NLM0VrRW9Fb24raG14OHc4djlQeTMyNUlPTFExWENWek1Za3R3bFhT?=
 =?utf-8?B?dDdGajVxZlFZRVFWcTlNRFhnSkFxQXh4MVZHbXZzU3pUc1RHNXc0VXdqc211?=
 =?utf-8?B?bENyOVR5Mi9PY0IwSGk3VXpBejJQUzBoMzAzcThvVko0SEd1QjV1VkZjZ1Jz?=
 =?utf-8?B?aHlyTGJYNWRtd2ZiaGF6RkszaVlPVUMwUmQza2xTNXBMMnNoUmN4dVdMZ0ov?=
 =?utf-8?B?ckRWZVBXY0ppZitvWjYzVjJ6aktNcjlTNVh6akNwWDIxNFVxaE1lUDVDYVkw?=
 =?utf-8?B?KzBxSndaY1gzN3VWSGpSMXBoMHBxT1lHbXNuRzhuNDhUdlBRVVhmUTRFMkhZ?=
 =?utf-8?B?Q09INXRrc2I4S0Z6WkxCQzJScXV1R3lmb0ZWTllPZ1JrZ0FncjhhajV2dUo4?=
 =?utf-8?B?LzV4bThiMTRFWk5CVEVWcklrR2VzZTNuUEhwU2U0a25iUUVGdFVrV3JlWTEz?=
 =?utf-8?B?cFJxaXRFZDd5QUp4aXNTNk1zN1VPeWhkdldwQWhIQ0RVWVFjOWJRTGpCenRD?=
 =?utf-8?B?K3hOd3F3R1ZTWVlBN0loMmRkNkxHRXJPaVRydVZDbFlGV1lxdUl1ZjAxUzgr?=
 =?utf-8?Q?ptqRn4VaBOzOiLVPajwts3Pfyl9GcTPcIIJgpVt?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?R2crVUxpcTdmSGhGbzZsbEdvVWc1S00vQVBhUUI0b1l2YTFPYk8wTUFUSElk?=
 =?utf-8?B?L2o2TjUrdzZmZnE2ZGhQNExqVUNiVCtGMlIyY2M2VTlpRmsyZk5TUmp3eVlx?=
 =?utf-8?B?d05maHRLNXQ4K0pweW9zSGliUGNEU05SZWZDb1d0QUJWRk0xQTFacHB4Wmph?=
 =?utf-8?B?WnE5Q3JLSk44M2FiNnZVS2FscjRBVDV6anVqNllmWTFKaUNmTVd6YzY1TnVP?=
 =?utf-8?B?eUM2NCtzd0dtMU9XQzR5cHBTbjQ4L1E3SGFHaGlwTDRaYWdpWHNjUU1rV0ds?=
 =?utf-8?B?dHlKQk90VkF4Y1oxMURjV1Y5SEhPZUh3bFNSTzNGUDNEL29HVnRVQ3NIVEZj?=
 =?utf-8?B?OVQrWFV0Tjd4ZXpBUnlXLzRreEEyTjFEU1FyR0o1azIybjJCRnBVTmpBT1hX?=
 =?utf-8?B?Q1gxWkZDMW9XSG95aVI4YWFMK1Y5S1lNeGVKRDM4aFpFZFIwS1AzVm96cm5J?=
 =?utf-8?B?amZ4NmpOTmZvUjVGS1pGZ2lrMFdvSTdlZ1BKNlFhaGhndWJ1R20wYyt6cTZa?=
 =?utf-8?B?WFVrSjV5R0t6c2EzRFdkTnJNSGpYRXQ2WDV0dHFRbGhIVmVMNnNEUUNIeHVp?=
 =?utf-8?B?ZjQrR1hkNFF4V3daSHhoeTJPOS9CeGhlUEJBOWpGYUhSNHJxMmF1QTFmYjZJ?=
 =?utf-8?B?UlVuNWFNRHVGeUVrSWEwb2E1K20wekJvMEdkOTNjczQ5ZEpQQmQ4TlcvQkJR?=
 =?utf-8?B?NmpkTE1XUVVvb25JS1RScnM0ZFU5MWRubkl6QnlOT1ZHZ3NMVDY5dmdtaEsw?=
 =?utf-8?B?bTFPczdna3MydFRWUnNFYXJkQkc5enJaclY2dUlHeVhselpOM1JHYWY0QitH?=
 =?utf-8?B?TnFSY3o5alg0SUx2cTN4UmtBYS9PL2NoTEVSVkdOczBTVmVQUkZPTVI2OWZU?=
 =?utf-8?B?UXZxZUFJUlZwL1JlYnNud0VsK2Q0UUFzcmE5V3gyNWZ4RHAvTk4zM3R4S2tw?=
 =?utf-8?B?QmJwb09ITW1QaVJTOUVoNjNJT083VEJoUlByTy9VSWVYUkt1T1QwVmZacWgx?=
 =?utf-8?B?YUt4bkFRM0daa0xnU1BnUTNqNTFxRThDVzNLeXdLRXFyYmJGVEcyWENEbzJn?=
 =?utf-8?B?Z2hKeXk2RG9sRnJjeG93RlJEbUI1RGcrR2k5Nk04NUl3cm5tMWV0RmRGenVN?=
 =?utf-8?B?OXJMdFp4ckZkaEN4NjhJTklxVjFlYkdaQWk0QnBNc3lhcm4rclVMZzhuUXN2?=
 =?utf-8?B?QWRZTks4UWhUM0dJckg1cDRvUHNxWGdYNm5Cb1JlQmlFM2Y2bXoyMWVSOUNt?=
 =?utf-8?B?Q1FldVdxVEtTWHk2V0hFdGk2dHpQMlJyTFVBc2ZUR2c1Qno0dDcvdTM5US9j?=
 =?utf-8?B?RDRKWGpOYjZUazMvZi9kaDFjNER4YzF5Y3BObmtaWDJZd0UzOUlrUmxQeWMy?=
 =?utf-8?B?S2Exa2FrbzFoRmlWdGZiZ3RVekpGclo4S3ZhemU1V0wvMGp4T0hVdWJ1ektu?=
 =?utf-8?B?R1IxdlhtZzBKZ2hWSERwMEZzYWUvL25nWHFwWCtrazVXNWIvUzlIVjFYUEZC?=
 =?utf-8?B?eWRXb3IvbEpPNCtmcUhtc3pwdEt4MFZ3YWcyeDFsTWxHWG9sN0pQSnBXWTkv?=
 =?utf-8?B?Z1R2UWp3UGNtN3U5R2NEcEE4UHlDZ1FiVmpReWRtUnNBcXFxWTA3Vm94WXJP?=
 =?utf-8?B?QkFZdGphYWViaEdDS2g0Ymlob3Y4ZS9zeXhZcGtHMGdIMGlqcTZsSWx2dFVz?=
 =?utf-8?B?elpIN2gwWWdWVnZYbjRYQnBxNndUejBMRENlalFyVEVFWG9NNjFYOTRVZEx4?=
 =?utf-8?B?SkhxVFhvd1RJT21hRE9xMlYwc3VLMWJvdlVUaU9Za2c5a3ZVWXdFUEdKQXJE?=
 =?utf-8?B?TDZuVUQ5TEh4Y3E5d2JTS2VVbWJBOXRaTDIzME1ub2lWYzhraVZOMjRUVWcx?=
 =?utf-8?B?SnZyd0lBakpZT3h5ZkJmeXRtZ3g1RlJqTnBvUTR1allGMlZIaUFHWjJZQlp4?=
 =?utf-8?B?NjNIU2t5TEI2YUkzbzBjcEVjclV1VVdjS0hWU2hCeE83b0JVcWlqN0ljS2J4?=
 =?utf-8?B?WGJmNEZDR1BCMlFOcUNTcHZOTDJ1OXZWNVg2OTVMb1R2djFhQ0FOdjhCdm5K?=
 =?utf-8?B?a3pnVU92L1ZUNHJHVlk0UkhudXI0eHFiUlNndU5ZOFdidndoVGtab1Vvbzlz?=
 =?utf-8?B?V1NjUVQvNWFkS0ZvRU1lSklrK092emN5NTVMQ0J1bSt2V3BoYVcyQ1R4b09s?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cbf1ac-f8d6-4851-0e25-08dcf8a95122
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 06:08:47.5608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWC/g9WmMtti8e8REndky5QFHuPfWQbCmrM5H7LJp2iVDgpN03XYyMMQlZAwV8aztuZ+SoldIpnFPF2QLy7eBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10094

Hi Bryan,

thanks for feedback.

On 29.10.2024 14:00, Bryan O'Donoghue wrote:
>
> On 29/10/2024 11:57, Laurent Pinchart wrote:
>> Aren't they needed given that the binding ends with
>>
>> additionalProperties: false
>
> Yes.
>
> Might be nice to have
>
> unevaluatedProperties: false and just rely on the top level
>
> $ref: /schemas/media/video-interface-devices.yaml#
>
> Seems redundant to me to keep specifying these properties over and over
> again.
>
> ---
> bod


I'm not sure I understand all the implications of unevaluatedProperties: 
false.

Does this mean that I will have to add false for properties from 
video-interface-devices.yaml which should, maybe, not be allowed 
(lens-focus, flash-leds)?


Thanks,

Mirela



