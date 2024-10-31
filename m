Return-Path: <linux-media+bounces-20632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D49B77D6
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5AE11C242B6
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39F0198E7A;
	Thu, 31 Oct 2024 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I5ZYZ3mD"
X-Original-To: linux-media@vger.Kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AA8193427
	for <linux-media@vger.Kernel.org>; Thu, 31 Oct 2024 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730368025; cv=fail; b=WisxoTQMjp8eldb/AyZylnavKjyxyB9lO1eJvzZeMFuPMdxUE6c3NNUFcvVc+lHWZlXRr2CDC1ruVSys+MapDLcRfh2npw6zZIJkEDRsmOkSFtC1vmGHbkD/vtbJho4nVtWauSm19t5xbWLSvWceoSPcEH0BDuJuYQVHjf7XjTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730368025; c=relaxed/simple;
	bh=WuxH2FfbuGktWI7Usgxc8bDVScIRDk1r0oLMM3ZByzA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nd8lD4ejvIvblcso3gyxMg48x5q2my8Eyd1jQ6oQUKf6rHagxCB+uMQGpo4tqh0rwLO6pjK4v5jzbKwPigH4cZv+MXqyUtDscPtAdcPANdDjALz+LXQrW5f1sG0DW+vWZs0jRjUlJWfZDmqwY7Ty021BeqckDayW8mDwmwZxRCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I5ZYZ3mD; arc=fail smtp.client-ip=40.107.21.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+qs5rZwWrwberV49GM+JMNVHD5KeED1wsDjnF4xIV67WQPvEmbK4yM2Rru4up1nhUQRybFCXOXpv2uEhO8+4VsuMx3qjBexBHcpIrPcwAhOpohXe08QB8rI0cZcf0J40Ge6ex3+TAgD+CUaHpATqoOwIaNwbNW3I2nicDpGoapWqlF5W5hRk8ZD6jFDoqAl+/yH5CK4M8snYGovTMEW7o0rFOWmaOaimw6mA6YKfTka8iTHcpSV2lJJgPlnK9oYAUCKEtzBs6k42SuUhvDq513GJubDs13P46YBn3jx7UDOVPye9la4xAefZoR9tPDPsWGERGAWkh/UN5CsCkE1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg4uKdhihQPkQiT5064OZExm5xVryGpPvXK1sE04m9A=;
 b=JRy7mIReZ5LY2MCpitcr8fs3rVvuxEh5AA4tKPZ745+FPsoIgARBjSSO8x5YVRpu+IgkZGCu2XG/53y1hfmLjdY7Z2h17hVrZmQ1HSliRnuz8h8XgewWb9S2hWaK1DX9+epbUHq/Oj7nEMR0ZvWBVNj5ReUzRkfRD+Z8OAsodmtnWSGNYFHax17F6Xz9BknmnusUNsGunoufEu2T5DWnR23lSd+mKZK7vv4VYDY+pxtj+mfrW2cDNJMStE23KHFlxBnCdRT/073Z7e7jdaTNTX5kklHECDaIo9/tng2s9elCzNlLO4seBVpYrZBykJyxxujFlSZXp8geIkc2xw/L3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg4uKdhihQPkQiT5064OZExm5xVryGpPvXK1sE04m9A=;
 b=I5ZYZ3mD910mlCmEALODA7LL79LckewLBZg1lsG8EDYessNVtOxCDNNFEiyZd6ffUOeUku1QtVJqQAHi3Y+uQB6aO+Td3b8ApnzXfk1T/r++fz3n51Yne1j/05n/glsh497pA7aLuOnqbDHVdZgI0DsVpOureOHDYMdzIhfsHpfUjcWA4YF3aI3IiTIE/VuNRnSnGS5Dg6NGa7X2BUzuzWeWhGpd4cnP24jmyzjfylFoyxnvG9TK5CF8FTJa2ufw+Fm5Am1DcyAK8Jd6ne1bBETynv/oB8A7YdhvS0RCVs7BiVV1VDkuvYRh+t7XlFRPAeKPRdtsGSOoBEceVgjeJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS4PR04MB9385.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Thu, 31 Oct
 2024 09:46:58 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 09:46:58 +0000
Message-ID: <aeff111c-caac-425a-8152-a90ae04980ae@oss.nxp.com>
Date: Thu, 31 Oct 2024 17:46:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.Kernel.org,
 tfiga@chromium.org, ribalda@chromium.org, yunkec@google.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@nxp.com
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
 <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
 <81b3dcb1-3c3a-41bc-895b-05657191b980@oss.nxp.com>
 <20241031093403.GA2473@pendragon.ideasonboard.com>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20241031093403.GA2473@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS4PR04MB9385:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a27aaf1-7f13-4a71-705e-08dcf990f635
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Mlh1M2ZBRUxhVzRjTGl3ZHNOeGRleERjVktreHgxbUNCTS8rVTBRcUFlUVlQ?=
 =?utf-8?B?Z0d5emZsZ2FQNy9RNnA0ajRrYnBNYjNoVmVyMHh0K3dDSmNBMGpGamdNaVUw?=
 =?utf-8?B?V0tkUGlJdDU4UlBtSFYxUlBpSTI4WUpidVF1OXpDSmphTXRTRG8vRUhTYWND?=
 =?utf-8?B?ZU4yZE5SL2VEVklHZldpUGJCbTFKc0ZOWHQ0SzdHL1N4TkdNNmFvckw2bXph?=
 =?utf-8?B?SmhUWHh5ZElsZUY1UW9nVGtNc3ZFU1h4MCtIc3lHTGRYZHdSYXdWOXJJbisx?=
 =?utf-8?B?bk0rYjFwVXB1TjhFbjNHN3o4TTZHQVBUUlB3eWM1VzJ4M2NPY1o2anRZUW1z?=
 =?utf-8?B?NGU0MkF2VU85bk5yOVlEWkZJaStWd2Jqb1hJS1hTUmNUQlk3bDdyamdxNlRW?=
 =?utf-8?B?aEVWUmY2aXhOOG5xOUtsWG9uZ0RpbUYrc2hGSEEzQ2QxaGNjbjBONE1leVp5?=
 =?utf-8?B?bE5RS2VoeFk3dUEzdDg4UWhleHAyMm1BUFljdEFCV0dqaUpmSEMxVndFME5y?=
 =?utf-8?B?bE1GN016WlJiS0doNnJXbVNucTNxdGVRMkowbUYyYjlzb01YN2NSd1ozOEdD?=
 =?utf-8?B?R3pUejM3UUc3eFpkeVZCTWZpQmc0cGtEY1NXR3lQaTMvTWRSTG5tQytmbVYr?=
 =?utf-8?B?YWVDTXdycmR5dXArT0NibGZ0dGh5Q2E3RWhZM3VGTmZnNVdBMUV2cHBkOEdr?=
 =?utf-8?B?UDFreVh1clNxc0JkbXdMZnc2dWI4T1h1b1FUZEVwNm1OeVp4SDloMS9Na1BQ?=
 =?utf-8?B?UzN2OVZzQUtxZmJoRGZ6bzgrbXFqVklSeG9SdGE5czlmNjlzR0hNNFo1c3ky?=
 =?utf-8?B?aXFFNGF1MU5xYk1ZS2ZIVU9RcHdoUkJhd1BVKzVyOTR5dDJ6QVY5TzYzUDU2?=
 =?utf-8?B?RUM3bE5aU3Nrb2FESmhyWUhPVnZKMFpZaVM0V2VNMUNLOUZTWFRxM285dXNC?=
 =?utf-8?B?cStuT2FCampwRnRhc2t6TU1QNkU5OTVvZnVDL1k4ZGphck1BbVozRDR5R1Aw?=
 =?utf-8?B?Um8yUmJnNDF3ci9VUFJkWVoyQWgxQXhuRVBGZ0NOSFZSL2R1OHRCbW52WHly?=
 =?utf-8?B?NFROSVMxMW95ZGZ2c09mc3NrQVJyempNbTFlUy8zU1U4WGd4L2phK3FJQzBN?=
 =?utf-8?B?dzV0aUxyREtCNzJXSWM1OWsyZGdiUmIzTXhoMjVSdnI0K1pSaTAzOUlHSU5K?=
 =?utf-8?B?SHBUK1djTm9vMkFCWnVQdE1lQWlNSzQ4L1RVaEZhMmo0c0FyRkpaSzlWaUtQ?=
 =?utf-8?B?cVlPQjNmUUo3a2pVdkJwcmg4dEM0VzB3MkZDKzVNQVBtRWxqVnRKSlp2VGpB?=
 =?utf-8?B?WE9WbTBCNTN0ZEc4S3VFdGRzWWpLZDlDRXFmU2YxYytIYzltVS9RbzlReWtp?=
 =?utf-8?B?YmQrQ3pNNDFYbjFtYTJlL3M1b3BJM1pOL1dCYUFQeUNzQ21HbnAzU1M3dkg5?=
 =?utf-8?B?Rjg5U3NlNXdTdWJadjZNVkdjWWtxZ3E1UG00UndxdXJwbkg3RjdxdTNFSlYr?=
 =?utf-8?B?SmdCTjZDbi9PaWkyL1NlZm1zMUtzcmxsM213OVZJUlk5bm9zMWVEd2xBZTBD?=
 =?utf-8?B?UXRvQ2RtTHcybi9ZbEUwRXl5MmFkcmhjUGQxWU9XTkRRSitXZmNFYXh3M0JS?=
 =?utf-8?B?UzNiWW1OZ093QU5xN3dSS2lNcVFMZmRnL2VneHhSd1NQUW03VWIzQ3VUK2tW?=
 =?utf-8?B?WVJxaTZib0FpZ2JDWkppVzBUNGFENExIWXRyS29LejNWeGxvTUJQZG9pOXdY?=
 =?utf-8?Q?2eVk1JW8LCXe3ZY6qzYZMN0IHgl6Ak/UrtnHfPO?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dGdTZ3QrTWxoSEZkRG0rcGQ3Tmx5Vy9tUmlWWDduSmJZQm43d3N2elUxa1gw?=
 =?utf-8?B?cWpnQ1ZXWVdlMzVLcmVrclZjS1ZoTEE5WnE2TnRWOGlTbzk4cnBnTWNTTThH?=
 =?utf-8?B?aTlCeGcySmNtWC9XM09JdnFsN3dRNnQwRjRDRE5LaklRbFJYN0ltZkRyVUNY?=
 =?utf-8?B?L1VBTXNReHFwVnYwbVQxeEtQSG1WQ1ZVMEhCaUNCZjZQQTdjeUZyVERuN3FW?=
 =?utf-8?B?K3I1SzB3UFg4MFF2WGJXTEp6TVJFYjRETDI3LzhjZUpwNHJ1S0V1YXBmQVJS?=
 =?utf-8?B?SFFJZGVIOU1ramZnOXVwTmV5eXJwT0pXNGFlZU1ZR3NjeWpuMFBJRXRVQXha?=
 =?utf-8?B?K2RPZ1ZZZk1hazhPQ3ltVTA4R0h1R2RjMEYwZEM4OXpKenNjU0lLbFlqaDg3?=
 =?utf-8?B?ZlNjemJZZXJERTkveVh5bDNYY2twQWduUXBLOVQyazRYd085WUV6NXovTHR5?=
 =?utf-8?B?aS9aTkt3R05PS0h1WWx5TzBBQTVXaEVKdDRwL2dJZ0E4TGdmQkcrZG00R200?=
 =?utf-8?B?S3VKVnUrQVhYUnlkVmtraW5OZ21pVU5BdVphZmNZeUlKdGJOZ2Rlc0xwVDhP?=
 =?utf-8?B?NXFIZlVzaWNTeDRNci9PVFZQazQ3U3VGa052VTI3dmpGOUVoOWNrK0VWamhk?=
 =?utf-8?B?dUQ3MU9XT1FrRkU3VVlhMlJpZ05oL1NFc1FCRDlmenFNbU1pOHYyMlNKS0pi?=
 =?utf-8?B?Q0tpd3p4anN1aWR1YzJNOG51ZkNmTE0rNFdiVmxNK1VzaFZTSmV3eWxWSWJv?=
 =?utf-8?B?Sm5QY3M3R1JDWHBhVmYxcHBINXY3Y1poZDd4R2lXZTNBRm40UkZseWYvalIw?=
 =?utf-8?B?Q21aaVVPNnZRbWIrWklvMVMweklxcFVGZVBxSDREdzFqeDVadUp5ZU9wVGRt?=
 =?utf-8?B?VGdwWVRzNEI1RnZCS1B5NUZlQzJQaWtqQkFDeW02a1dIcTlLUXFxTHd2NjMz?=
 =?utf-8?B?VGlnYXY3VXdwZkhSY1BnQ1gwVjJyMWpEeVdMUWNtNEVSbzNHcDBIZUlyaTJG?=
 =?utf-8?B?YUJVdnVjNVlyNGcwd2lVN0FQWWFVSThyLzdoaStHeHZZV1p0b0FHdWJQRlFQ?=
 =?utf-8?B?K1JBZ05BRk04cWJ4WWRhWHE2Q0Z6TWlpL0FjeFhOWGR4VlRZeUxTQ3RYMkhC?=
 =?utf-8?B?bG14a1dQQmZXZnVXSVRzaFhLUlNaRGljMVZTaVdyM2h5ZXVzSlpYL2RVYlc0?=
 =?utf-8?B?MENpT0JQSElWTkhEWGk3NmFPSVhVc0VPcWhVeVJwVnlUSCtpeFhwR0g4cmt5?=
 =?utf-8?B?QWJLZ0ZLYURxZ1Y0TGRPUDBMVjFFazJ6K3pneDh5d3RuYzRHY2MxNnBEbXo2?=
 =?utf-8?B?b2JkcXY4VVcyWGV4dXdLMVRLQktpOHN3Sy9DWVVzYmJlbmJMQjZyMkFLekx0?=
 =?utf-8?B?RVF2WTBtMHo3S0JSUjh2d1d3N0ExdHNDQ0F6QS9xWVpOWThBY0J3ZFBDNU5T?=
 =?utf-8?B?Z2R4QUFUSTNrUjJvUCtDY3dxVEtFbDdIeERPSnMyNmhyVHFZQ1k1eFVZVjNT?=
 =?utf-8?B?OE03UXk5K0Y0cG5SUTRISndjUjVaRWRYQllldmZQa2xxT0F0bE5nemJSbFB5?=
 =?utf-8?B?VGxmZUVOdVlBbHI5amdja3BIMGlkOWJqS25WeW56NjhSRGYwbHFzaTdPV0w2?=
 =?utf-8?B?ZDhubzBjWEdXRyszTW9wYUwwMXhvT1BIQU5aaFlTcFhKQTM3UzY5L3hPamor?=
 =?utf-8?B?M05BZnBiY2tpUmZrMHkzcEtjczMyTXBEY3NPZGx1RTRhRHk2OXhuTWxMQVBa?=
 =?utf-8?B?b2pBSm50VGw0QlAxTU53empHYWRxRzhnQndFUFI5ZHk2UWhQeUhJOHZrVExX?=
 =?utf-8?B?akdTNEpVWlNxcDNUL1RuM3dhbjdHMy9JYjJPYWdwVFlCcEJTblo2S1hvT3B5?=
 =?utf-8?B?VURTcm5yL0FORTJEYUJZTmR5MzNaU28yWGZBRStoL1k0U2xGUEJuVDNwcTVa?=
 =?utf-8?B?R2VhMUlzTHh0TUhCZ3VVZWx1VnQxNEJVS1lCNjNpK1UvK1V1cFNEQ2pvTThp?=
 =?utf-8?B?cFd5NU5weTZWb05nNnE0QkJ4a3RVQXJRRzdiSVljZi94SWRmd0NrdldWKzFQ?=
 =?utf-8?B?YTJVWWl5c3FpbkpxQTlZN21aM2Z4Q2h3cS8ydkx3emFaZ3VHTEJSdHZyVkp6?=
 =?utf-8?Q?fi1QAVgLyvG8HpKBo9YC3ST0V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a27aaf1-7f13-4a71-705e-08dcf990f635
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 09:46:58.4248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMUXVHVAFeH57X80zgWlqawvsH8d//aoQs5BPgLEGOnLOiHnwUwLQsSHMSLGiCmNCvhy2zz5hMKXjTw/Kyjt3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9385

Hi Laurent,

On 2024/10/31 17:34, Laurent Pinchart wrote:
> On Thu, Oct 31, 2024 at 05:19:02PM +0800, Ming Qian(OSS) wrote:
>> On 2024/10/30 17:19, Hans Verkuil wrote:
>>> On 30/10/2024 10:03, Laurent Pinchart wrote:
>>>> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
>>>>> From: Yunke Cao <yunkec@google.com>
>>>>>
>>>>> Tested with VIVID
>>>>>
>>>>>    ./v4l2-ctl -C rect -d 0
>>>>> rect: 300x400@200x100
>>>>>
>>>>>    ./v4l2-ctl -c rect=1000x2000@0x0
>>>>>    ./v4l2-ctl -C rect -d 0
>>>>> rect: 1000x2000@0x0
>>>>>
>>>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>> ---
>>>>>    utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
>>>>>    1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>> index 40667575fcc7..538e1951cf81 100644
>>>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>>>>>    		case V4L2_CTRL_TYPE_AREA:
>>>>>    			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>>>>>    			break;
>>>>> +		case V4L2_CTRL_TYPE_RECT:
>>>>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
>>>>
>>>> I find this notation ambiguous, it's not immediately clear when reading
>>>> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
>>>> or the other way around. media-ctl use (20,20)/10x10 which I think would
>>>> be a better notation.
>>>
>>> Good point, I agree.
>>>
>>> Ming Qian, can you also update patch 1/4 of the kernel patch series to
>>> use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?
>>>
>>> Regards,
>>>
>>> 	Hans
>>
>> There is a issue in v4l2-utils, that ',' is the ending flag in
>> v4l_getsubopt(), then I can't set the rect control,
>> for example:
>>
>> $v4l2-ctl -d 0 -c rect="(0,0)/1000x2000"
>> control '0)/1000x2000' without '='
> 
> The should be fixable in v4l_getsubopt().
> 

I can see the following comments of v4l_getsubopt(),

    Parse comma separated suboption from *OPTIONP and match against
    strings in TOKENS.

I am not sure if we can change it.

Thanks,
Ming

>>>>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
>>>>> +			break;
>>>>>    		default:
>>>>>    			printf("unsupported payload type");
>>>>>    			break;
>>>>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>>>>>    	case V4L2_CTRL_TYPE_AREA:
>>>>>    		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>>>>>    		break;
>>>>> +	case V4L2_CTRL_TYPE_RECT:
>>>>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
>>>>> +		break;
>>>>>    	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>>>>    		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>>>>>    		break;
>>>>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
>>>>>    					sscanf(set_ctrl.second.c_str(), "%ux%u",
>>>>>    					       &ctrl.p_area->width, &ctrl.p_area->height);
>>>>>    					break;
>>>>> +				case V4L2_CTRL_TYPE_RECT:
>>>>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
>>>>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
>>>>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
>>>>> +					break;
>>>>>    				default:
>>>>>    					fprintf(stderr, "%s: unsupported payload type\n",
>>>>>    							qc.name);
> 

