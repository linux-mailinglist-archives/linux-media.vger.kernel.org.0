Return-Path: <linux-media+bounces-29187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3409A7879A
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 07:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47E927A4D4E
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 05:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B643230BF7;
	Wed,  2 Apr 2025 05:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DOU6tZ4B"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012064.outbound.protection.outlook.com [52.101.71.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC108632B;
	Wed,  2 Apr 2025 05:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743572062; cv=fail; b=JbPblfcvNhYtMwF4/TwB3MfSitcZ2UoSsccTnzB2lUps4chQ3loiykxy2vgrII7cgUjosIKa9igxkpU26cjTLF8CHelkZHDCU5XM0/cvABpEuWuEv8zXSCNxvYbR0AQPAnVQbuqoEkqdnJFAQOG2NzTcQgZvoXVMyP0uO7zr9Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743572062; c=relaxed/simple;
	bh=80Gh50Fm5L6CaFC6BTuM09mWbL5R8Lfvjaad1QPCqto=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mim30ElD/EMUaig36v2CcORKaD3zTXp37i8tIOqOvZhQhF8JVljsMx02aBMvdaCVMTnkL2vZzafv9+7MYWwEFNDaH5VMiM5WVZQ8cdPk+cZ3xWnmJyCNaqWzXwz8ZWNNaq6njN6QqFElgLUOGAwmsfw8nAUJlMBVse3/eHL3zy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DOU6tZ4B; arc=fail smtp.client-ip=52.101.71.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSxnJzk3/rf5Oczvk5kcN2SXUNLSUKHbHqc2P4BEUsXZMkocyZGxXG+fsw1iIU76neEltWlH/2nkjN/2oxG2+Yzh1qsbXp0DbaC6nOdLwRZsM8FOzsuxVXyqEBWvg21bQTfSj0+hUwdvFvwui8I5RQA6fLU8nA4NuzkPDCOSSizXEsgLxvtGf68AoBqfWCmufYdH82PGBGi80Vie44lgrPeFHExMtPra84fG2Ihr9OO/s1zzD3RmyPyZQdkM5OcIUFbELJp3R3WdgRb6I4EzSHVBu+AUkEr5DzDnK9d4DK4rZ4+v7N3FEVwixr/KI/QNkDjd4piGuP96hegaQTOqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/5gEXA2XIEVTlbcC/53yX8+6sTSU3KUxWvpoZExcKI=;
 b=rcvN41aJwMQKyV5fG5tWAyGhNbqM0ASJIW2OgThn2neV6LUxO+oO4kWOXeepLw8BxHAYBQiu6df6uUwAfMdX3b+GAAP42dpJq8HDkobNEGZnJYMGRFZJtGuWoS/mKfAkoGs6+OUt1ohDCCEFODb8egqpagTDACU96OqzZnIddu8oddpWnSSVU5uEJGanHkjDrZS4soPP0egLWlQXzYtdd1HxuyzpX6Im6Hf/AysB27zv+hPepVkwOf0PazC2JUhhTgLlB2ETEjTdDM+gOCvYvOuoyFkPHNM5BGNy1WApiCUFTi7WzF61T+gW1n5iAEeD0Gg1aooASrkmnHyEo3GC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/5gEXA2XIEVTlbcC/53yX8+6sTSU3KUxWvpoZExcKI=;
 b=DOU6tZ4BoK9wl2eoDDHMwbPOsI7Ld3nzHsa9vTgpwJr9kzwcne0707uIfOtrHP3WMMkR7RQQjzEVIiWtYuvK5M4DhIKAVkODoELlsriVfZ086S2sXM5ZGdJG6tdhbdvhMckowiuLHAx+He9jwHk3G7+AHorJLUsH3IoN7yUm36975tkTSGX4y577SwA8L0UFvwyAdMd1ubiIA6kxXdpKZtulXSMsB3Pt28DbYBR3ZnZ3GVFhqXTytpVUY3UoHaNyVyNcN6Q8OdCu6u5aNdG/EinR7k1sHL3Sz6KqwDwbBJ++CF5G6MuMDijurK2ftPEEsKFPqx06tjEdep1MRHrRGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PR3PR04MB7353.eurprd04.prod.outlook.com (2603:10a6:102:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 05:34:14 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Wed, 2 Apr 2025
 05:34:14 +0000
Message-ID: <3b212947-0495-41fc-a143-c695c0c92269@oss.nxp.com>
Date: Wed, 2 Apr 2025 13:34:00 +0800
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
 <22fd3087-6832-4b61-8c78-bc8dd3ac808b@oss.nxp.com>
 <Z+v6Q1TRpJUkF2oh@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <Z+v6Q1TRpJUkF2oh@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PR3PR04MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 69fd5520-adae-4416-c0de-08dd71a8009b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXdpVEVQb095eks0YWVQSWVLNnY4cENBaUJYMVhZVFE0MzBBNFl6bkVXUWs4?=
 =?utf-8?B?eStoMldYd3ZiaGp5Z01VL1hjZ0xOcms3RDI5QzVaMEtHQmlYMnNBQTk3YkxW?=
 =?utf-8?B?UUlJSnpSME1ESDNKNDdkbmlBUkVrSEpBRDVvWEszdlRTVFErYThYTm9EaEhN?=
 =?utf-8?B?Rmp6eSs4ZVo0c09QU3Y1S0xEZ3Y4YzZBU280NnF3aG5WRDJPSjhIamwyNnZS?=
 =?utf-8?B?TzhtSlNLVkdRRXlzRjlaTFg5Tk5JakZDOFQxUzhxZThhSzI2YzZKWStKWjR1?=
 =?utf-8?B?NlhTUC8zVlViSmh6Q0swS1psNy9jRS9wYmtLOE0vSCtDRDlBY1E1bEZacENv?=
 =?utf-8?B?RWFkV3E2Z0QyeHdwb2hIek94cTdNVmh4N0xIZVBzcWwyOUJVcWxlTTJ3NFJR?=
 =?utf-8?B?MEtlOER5dnpnclRmaDM5WHN3OWQ1ZkdlMUZXOFRuVTZ6VklBZUMrVmNUT3Jy?=
 =?utf-8?B?RjFoUURCbXFEa1h2cEJneUF5TmN5dENSM2JUWkFZaS9HMnh2U2E2YUhLd1p6?=
 =?utf-8?B?b0kxYXdib1dRMFd2NWdHTDUvV1grYjZKZHd4ckdCS0FkZk9rVElXUGdyQ3BY?=
 =?utf-8?B?REdQcTBXeW1PTlRhVU55RER6TEMxS2N3ckQ4NEJpVG9ycE9OSEtSZjBEazZW?=
 =?utf-8?B?VXFQekFTZlVFbEdxMVRLdk9JRFo3UVJEdWRoMVVPUEhRNG03ZVFiQnVvbHR2?=
 =?utf-8?B?VmpzZWxhZitaQjJ6UEdwa2tGM1VET2trMTNzWjVzaXR6L2RIbEZzZCsycm9G?=
 =?utf-8?B?TE9wUitKclg1MFowbW1BcVZnRnV6dXNTMW9KQ1RneHRzZ2NDUGhjQ2g2RVNX?=
 =?utf-8?B?OGNXNVBMSmdjK09ZK0lpMEMxdVhxYndWNU5lWExRQzhESHlFN214ZEs2TW0w?=
 =?utf-8?B?ZGRUTGY4VDNlQXpxMXhtSHNwUlFzUkFRL0VORUVrWHNBNVV3b09Kb01wYzlC?=
 =?utf-8?B?emo3ZEh3TzFKWUdFSHJFSjZ3aXdsVGcwRmwxdDV1QmpkMnZVc1IzOFJ4NGdY?=
 =?utf-8?B?aEhQeVdWQUZ5Ui9laWdDakJ1U3dBS1hBeUhpOE4vY0JuQ2R5WVJJdTNTcUx2?=
 =?utf-8?B?OC9EMkxZa0p1cGhzZlg1ajR1Ymp6NHVSOEJPdFRQKzAzb2ZrNnMwMm42b3kx?=
 =?utf-8?B?MGkzY1RvOW4wdG1qelpBRUxDVDJMY3NRUVUrYTRRSlkyZ1FUek5jOFQ4Q09s?=
 =?utf-8?B?d2xuanBhVXV5R3lZK043WXpOQnFTNmhHK3pnbFdHU3htNWEzSS9RV2JLMzV5?=
 =?utf-8?B?NnhmdTl3RkhzYWhQKy9qRjBNdlZFWWRKWkZlYkcveU1vd0duaFBYS3drbVZn?=
 =?utf-8?B?dGJsZlNsNHVtMXBCNU5RWkdwTFVDYkp0ak41bzNqMGNEK2tiaUNsdlQxTmFL?=
 =?utf-8?B?RHBHVGN6Y1NjU0JOMkl4K2s1ZExxRWpqOXBSUzRqUHkwcHBpekFnRTBGYk1C?=
 =?utf-8?B?NTdOQ2xENW52VzcxRWFYYUtQVTE2cFdCek03ek5wRDlta3RIY0VLOUxTcUV3?=
 =?utf-8?B?VUZvcllOVzdyRlJ1TmtSTVRxc1dINnAvNi9lTDdMWnVyRHhQR3NWM3hWK0Z6?=
 =?utf-8?B?WXdSV1FVdC9CUVRMdjNueVcyc1dwTnk0L1VvZ3V1WGFvMElrTUFwcWRIWHBv?=
 =?utf-8?B?bDlzUlVFUjEwbW00WW1ZVXRVU3pGWGs1VzU0bW9XY1lFZ2Nra3AzWnFZOXRy?=
 =?utf-8?B?M2FLbk8zM1VQdVBLTzhaY3RSclpmT1NGbTNNcTNGcWtMZnNwZlkxSFNJTkQr?=
 =?utf-8?B?VThzWURqZ1dEZno2R0EwM0tXM2FQVG44aDBTY21yMUVUU3dwNmZnSFZkL0Jj?=
 =?utf-8?B?OHZNNU1uam1DMXArNG5hODFhcWhtYnlhSE1lRzQ1eXk1em5IL1JkbG5tWXYy?=
 =?utf-8?Q?uBfkff/1PLF8r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFFCUjFLQ3NaejJUZURnYWpxTnhGSlU4Zkx6WnpqRHdMaEJNTFlTYm92SFZu?=
 =?utf-8?B?YzJyanhrcmp5TU1Dd21KdENBb3B5SHArenVVcXdZNTg0bVdMcHVzM05MVVhx?=
 =?utf-8?B?UEtLamhTb2s5UjhWZmtTOXdyNHJXMEZwQjFQaTE3c3BlQ0ptTm5Fc1lCbGg1?=
 =?utf-8?B?RzRidDA3cGVGSTFMU1BlZFJIdVJXUUNCT0Vsa1ovOXNDWVM0b1ZLaWwvMVdT?=
 =?utf-8?B?TktmdWZSOUlWSnN4SVp6WmdCaUZCYWo3VUNXLzV5M3hUMUViZEVTc0MwRHhX?=
 =?utf-8?B?TjVyMlp0MXExbFBIQktXYTZicEVvdkdwQ3RxM2x2TDd1TlExNENUcDgyeEtk?=
 =?utf-8?B?QUNZTzRBaEJyLzFZYVVLNGZ5Nk52L0xLKzhiSmc4dm5iSWZUcitlZHluU0g5?=
 =?utf-8?B?YXpUK09GcGNodUROeGY5dVI0S1BVaFFMMnFDTmY0Q3BVd0w0c0t0ckk1cWIx?=
 =?utf-8?B?VWY1bXUxdVoyUWpJQWZLdmhMTWQvWFduM3pvbTl6c045TysyNlBYL3VQMFRH?=
 =?utf-8?B?Y2swUlphVVExNUk1ZXhwNGpjNE44cE5VUURvRmdKQzNYQ0krUUtTdkZJVTgv?=
 =?utf-8?B?a1RIdldSejFnNTIyTlZSRzM5b3ViU3dQMVcyMTR2cTN0VmE5ZzhUc04rUXR3?=
 =?utf-8?B?RnVsTy9DSWt1ZUxpMXVKWkNUODJvMWxSZDNOR0s1SGsrNXFGRXRtOXhxYm1I?=
 =?utf-8?B?TzJ6TnBVOEFydTNFL0NnVVFSMlNWN0xQRFFxYVB3blpXS2JCOHY5NldhUkEx?=
 =?utf-8?B?RkJzL3Z4aFBzOGp5S1JZaUFReXRyNFZWakpURExTRGw2Smk3VElZUlpqcjIr?=
 =?utf-8?B?M0N4anlWRHRGZ1dUMm8yY1QrZHEvUGptZ2l0NVZja1FaMzhKRm5uTDZINTYy?=
 =?utf-8?B?V1hoeEJWRGh5bENDL0pISURrbmtNM25vREgwSHlYZmx1K2h1TVlBa3hvT3hv?=
 =?utf-8?B?R1lPYWgvYVlkUXNjMlNHWk85THkvczNrdlAydGgwTnVMdzROaVFyV01uU3ZS?=
 =?utf-8?B?V0liNkdwWjFHclBYMmo3WlNqSzVHSmJzVUtKQW9IMzYyamEvbzY4ck5EZlZO?=
 =?utf-8?B?aXRveFhTMjhqbHNDYkFyNDN3cms4S0NzL0dwYlY5VnFBT28rVis4WkhXekN5?=
 =?utf-8?B?SUxXYW5STEJ5L3R4RDd2OS9ZR0c0RlBFS1Q0YmNCeExXTHNHTGNHbVNYMVhs?=
 =?utf-8?B?Q1RyamlsdjRVN1p5cGdSUEY0TjVHTU8rY1d5MklaVHluNjdoQUoxZHlEWUgw?=
 =?utf-8?B?bEM4aFp0d0c3TjlTaVlieEE0UkhyK0dzUHRPRWJuYmExSkdINStmRVh1dmlF?=
 =?utf-8?B?TUhDQ3lIUGNpb240ZDRGNVVKVDY4bFE4bmFsMGRRTSs0SkFVK1BodGQwMk9m?=
 =?utf-8?B?ams4eUp0QXQ5WUhjVnlPSHg2SnVXZmwzYXNDNiszVnE2cjZGMzVSYUZtcGpP?=
 =?utf-8?B?UjJ1Zkh6Q3NNYVBnV29DVnI3Zm55TXY3di9FSXFaK2ZDVGQwdm52R01hU1ht?=
 =?utf-8?B?UjVqSVhrMlNCd21yLzh0MzBmQlFhMG80VGI2bkF5YURCYmx3YkJSS3ZCRVZF?=
 =?utf-8?B?eTRmbm9vS1EvK0dPUVYydzgvTzFGc1AwOG50eWhiWTd6SEtrZ2ZIREZpaXB0?=
 =?utf-8?B?L2YrRDRSeHh4M29jaVU4YWhVZlY3dnFyZytYcFAxQW9KSm1FN2E4UGFCV1l6?=
 =?utf-8?B?SFRaRVl1c3NJRndrdVd2bDJXdUx2VW1DcS8xMEJ6aGJGR3JBRDBnRk90eHBI?=
 =?utf-8?B?U1JmYVJwSzcvb0kzMW1PU2NOMjlNREZiK0xDZlByblMzaGsrYW9ZajJzQnRS?=
 =?utf-8?B?WU1NdDhtbmowRTRLejhuYnNDZXpEcDRqN3NheFEwZ0hCTlJITDJaL0EwbTA3?=
 =?utf-8?B?dWhzS1o1a1ZpWjkyUHFrK1hQSzh4Mk8yTjNpaWZyRzRqb3BUbFdEVVRKZWlL?=
 =?utf-8?B?OVhNUjR5OFgrVDB0ak5FVzBDVERMVDN6UXVHWVpXOU9HcTNYYkVXUXVOZUhP?=
 =?utf-8?B?ZXpzWUlSVk9yOG5rcU9RRmNsdmNRYmxUdms5K1pQZFZoaHhxRm0rSytmRlZs?=
 =?utf-8?B?R3kycjVrUUJzQjR6RHI5Y2thVjJVbysvVy85aFFrSnIzZGF6RHMzZmVSSlRl?=
 =?utf-8?Q?U4qkwGf5tnmjtDsyGjcLMVe64?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fd5520-adae-4416-c0de-08dd71a8009b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:34:14.0231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgv6wP7pKrLTdNTMVty6wlprKNZmENfsguVKCaw2bPcwPSocgvg2xcmSceFDDEBqtuOO8/z+ic1HrlEzys2Uog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7353

Hi Frank,


On 2025/4/1 22:37, Frank Li wrote:
> On Tue, Apr 01, 2025 at 11:17:36AM +0800, Ming Qian(OSS) wrote:
>>
>> Hi Frank,
>>
>> On 2025/3/31 22:32, Frank Li wrote:
>>> On Mon, Mar 31, 2025 at 11:10:20AM +0800, Ming Qian(OSS) wrote:
>>>>
>>>> Hi Frank,
>>>>
>>>> On 2025/3/28 22:45, Frank Li wrote:
>>>>> On Fri, Mar 28, 2025 at 02:30:52PM +0800, ming.qian@oss.nxp.com wrote:
>>>>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>>>>
>>>>>> To support decoding motion-jpeg without DHT, driver will try to decode a
>>>>>> pattern jpeg before actual jpeg frame by use of linked descriptors
>>>>>> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
>>>>>> used for decoding the motion-jpeg.
>>>>>>
>>>>>> In other words, 2 frame done interrupts will be triggered, driver will
>>>>>> ignore the first interrupt,
>>>>>
>>>>> Does any field in linked descriptors to control if issue irq? Generally
>>>>> you needn't enable first descriptors's irq and only enable second one.
>>>>>
>>>>
>>>> Unfortunately, we cannot configure interrupts for each descriptor.
>>>> So we can't only enable the second irq.
>>>>
>>>>
>>>>>> and wait for the second interrupt.
>>>>>> If the resolution is small, and the 2 interrupts may be too close,
>>>>>
>>>>> It also possible two irqs combine to 1 irqs. If I understand correct, your
>>>>> irq handle only handle one descriptors per irq.
>>>>>
>>>>> Another words,
>>>>>
>>>>> If second irq already happen just before 1,
>>>>>
>>>>> 1. dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
>>>>> 2. writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */
>>>>>
>>>>> Does your driver wait forever because no second irq happen?
>>>>>
>>>>> Frank
>>>>
>>>> Before this patch, the answer is yes, the driver will wait 2 seconds
>>>> until timeout.
>>>> In fact, this is the problem that this patch wants to avoid.
>>>> Now I think there are 3 cases for motion-jpeg decoding:
>>>> 1. The second irq happens before the first irq status check, the on-going
>>>> check
>>>> help to hanle this case.
>>>> 2. The second irq happens after the first irq status check, but before
>>>> on-going check, this on-going check can help handle it, fisnish the
>>>> current decoding and reset the jpeg decoder.
>>>> 3. The second irq happens after the on-going check, this is the normal
>>>> process before. No additional processing required.
>>>
>>> Okay, not sure if hardware provide current_descript position. Generally
>>> descriptor queue irq handle is like
>>>
>>> cur = queue_header;
>>> while(cur != read_hardware_currunt_pos())
>>> {
>>> 	handle(cur);
>>> 	cur = cur->next;
>>> 	queue_header = cur;
>>> }
>>>
>>> with above logic, even you queue new request during irq handler, it should
>>> work correctly.
>>>
>>> But it is depend on if hardware can indicate current working queue
>>> position, some time, hardware stop last queue posistion when handle last
>>> one.
>>>
>>> Frank
>>>
>>
>> I think it doesn't matter, the 2 descriptors are the cfg descriptor and
>> then the image descriptor.
>> If the current descriptor register remains the last image descriptor,
>> the ongoing check works.
>>
>> And I guess your concern is as below.
>> If the current descriptor register is still the cfg descriptor, but the
>> hardware has finished decoding the next image descriptor.
>>
>> I confirmed with our hardware engineer. This can't happen.
>> The first cfg decriptor has a next_descpt_ptr that is pointing to the
>> image descriptor, when the hardware read tne next_descpt_ptr, the
>> current descriptor register is updated, before the actual decoding.
> 
> Maybe off topic,
> 
> CFG->next = Image
> 
> Image->next = NULL;
> 
> If hardware finish image descriptior, current descriptor is 'Image' or 'NULL'
> 
> If it is 'Image', need extra status bit show 'done'
> 
> 1:	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> 
> I suppose it should be DONE status if just finish CFG description.
> 
> 2: 	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
> 
> It is possible curr_desc already was 'Image' after 1.
> 
>   if (curr_desc == jpeg->slot_data.cfg_desc_handle)  //not hit this
>          return true;
> 
>   if (slot_status & SLOT_STATUS_ONGOING)  // not hit this
>          return true;
> 
> fake false may return.
> 
> check two aync condition "slot_status" and "curr_desc" always be risk. But
> I don't know what's happen if fake false return here.
> 
> for this type check
> 	do {
> 		slot_status = readl();
> 		curr_desc = readl();
> 	} while (slot_status != read());
> 
> to make sure slot_status and cur_desc indicate the hardware status
> correctly.

I confirmed with the hardware engineer, the curr_desc register is set
when hardware load next_descpt_ptr, but the ongoing bit is set when
hardware finish loading the content of the descriptor, the size is 32
bytes.
So you are right, the slot_status and curr_desc is not synchronous,
but the gap time will be very short

This patch is a workaround that hardware finish 2 descriptors too soon,
irq() is not scheduled on time, the driver keeps waiting until timeout.

And I agree there is still some risk that the ongoing check may return
fake false, even if the probability of occurrence is extremely low.

When the fake false return, the driver will finish current decoding
early, and the decoded image is incomplete.

But we don't want to change to poll the done status.

Considering the probability of occurrence and the respective
consequences, I think this patch still makes sense.

Maybe we can check the slot_status register twice and add a short delay
in between. Then the probability of returning fake false is basically
reduced to 0.

Thanks,
Ming

> 
> Frank
>>
>> Thanks,
>> Ming
>>
>>>>
>>>> Thanks,
>>>> Ming
>>>>
>>>>>>
>>>>>> when driver is handling the first interrupt, two frames are done, then
>>>>>> driver will fail to wait for the second interrupt.
>>>>>>
>>>>>> In such case, driver can check whether the decoding is still ongoing,
>>>>>> if not, just done the current decoding.
>>>>>>
>>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>>> ---
>>>>>>     .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>>>>>>     .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
>>>>>>     2 files changed, 20 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>>>>>> index d579c804b047..adb93e977be9 100644
>>>>>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>>>>>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>>>>>> @@ -89,6 +89,7 @@
>>>>>>     /* SLOT_STATUS fields for slots 0..3 */
>>>>>>     #define SLOT_STATUS_FRMDONE			(0x1 << 3)
>>>>>>     #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
>>>>>> +#define SLOT_STATUS_ONGOING			(0x1 << 31)
>>>>>>
>>>>>>     /* SLOT_IRQ_EN fields TBD */
>>>>>>
>>>>>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>>>> index 45705c606769..e6bb45633a19 100644
>>>>>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>>>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>>>> @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
>>>>>>     	return size;
>>>>>>     }
>>>>>>
>>>>>> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
>>>>>> +{
>>>>>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>>>>>> +	u32 curr_desc;
>>>>>> +	u32 slot_status;
>>>>>> +
>>>>>> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
>>>>>> +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
>>>>>> +
>>>>>> +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
>>>>>> +		return true;
>>>>>> +	if (slot_status & SLOT_STATUS_ONGOING)
>>>>>> +		return true;
>>>>>> +
>>>>>> +	return false;
>>>>>> +}
>>>>>> +
>>>>>>     static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>>>>>     {
>>>>>>     	struct mxc_jpeg_dev *jpeg = priv;
>>>>>> @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>>>>>     		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>>>>>>     		goto job_unlock;
>>>>>>     	}
>>>>>> -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
>>>>>> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
>>>>>> +	    mxc_dec_is_ongoing(ctx)) {
>>>>>>     		jpeg_src_buf->dht_needed = false;
>>>>>>     		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>>>>>>     		goto job_unlock;
>>>>>> --
>>>>>> 2.43.0-rc1
>>>>>>

