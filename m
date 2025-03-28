Return-Path: <linux-media+bounces-28907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DAA7420F
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 02:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007EE3B4B94
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 01:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE6F1C5F2D;
	Fri, 28 Mar 2025 01:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pfHgWbhb"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012054.outbound.protection.outlook.com [52.101.71.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DEA1DDD1;
	Fri, 28 Mar 2025 01:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743125471; cv=fail; b=BWY9u6YEdXdlhnHq1BYI9A78eo60bwI+DkvymjAu5MDTLe4wNxrAEMQus5HYYOfu/8qieDWdcU2H+iFfYc6mj7O42YKMcsTkwtmYOT+s7FPklthYMzuC6V28TfFKQ2wjUdMGMsEvJgcYxjpheX1cGnq8OEFjRg067dZ17aRNIXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743125471; c=relaxed/simple;
	bh=c/yB+Vrcp6sioLydTijma3VT/m956Kk3aXShnkYNJ9o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VSNqkg4JTWnk9v8Rbq9yFktfDilfzAWULm1Cgm9idtCv7uQu5mtpXcOsELo0OFg+aEavfuqLHtLQS6rA3HmDkUkzvhNwJ1kE1SVG2VknWna8JEQJF1hct+ic0imekNb/mW9dohWyDWEBUmSYgU3uW9Du+QfrJJ7jOiKJnT5odv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pfHgWbhb; arc=fail smtp.client-ip=52.101.71.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXTklrPsbtnazVuHmKSbZXu98TL0T7R+NoBoiBhgBIpT79Qzaoz0vDEO38vuJh9RszSuv6fb2VSAkRNR/6r9D76Q45NkSBz0IIEuyvaXq9OVpFLYsgD5fafCGWl/6FLWlgtYQcb8IH8Y2EPUA428M3DlEuIxLP3/VG35W6huzPu7XcRhAbrc6fEP0SYK2o3whRm0QBaVZRcoaSAfyyCt3GLxWX02Q0qL8AoUVq4m/2qwFcpb1AWLJrB+6yTf7frAbmjs7Gqion/fWr1WwH/wQlKepJkEZFxyaT+4FxsjIjQ4e23W4SqNN/1/HRE4zNZeljxMtzHBtu57GB0erwZVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3Ip1Ss8v30D7BtRYDJJhrgZbAtpHXYEfvhVDDKocFA=;
 b=hxweOrGxWrje6Kcl71erae0MEAqvFoyMUPTU1QdD43p+N1OFqd+Eqo3rF7lFD9Xi1Ybu+KdWejaQAU+4dcvMEsO63fJDg0bRizzb/UpDsSY0+QwBuiBw/bPb1EjvYs3Y3QLTta8fJlTThI28gWL0oHskojnNMVrVEgHAyrgPSBCYTyD+rjdo/O5amQNkeIgMWLGvArzODsPOT+DYfwHLtnO19n6/tX337GqZ0U9OTS3koxdNVCl4hNQg7fUpg3LfyRPuKfnl2ID0Lhiyn89gvTwOj7BmwbURmvAIpBRs9dU5pzjJXW6wkbt81RBdwFfQZGRqncsodoblZUKGTW1wpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3Ip1Ss8v30D7BtRYDJJhrgZbAtpHXYEfvhVDDKocFA=;
 b=pfHgWbhburk7Cgv41a5q9aYOA0j9THo6/LX7TNKr3X+d/I6oerKF5PyB/qnkUl7QtylF0asDnA5lyiTxyGeoOWXehTQ6QQBDWBu5S5+GFhF/dGZuwN2WNvYl0WTY6Ve0M1RLzYqEwCGjKKLshiH5Aj3iPvz7GXnGPwnkUAn6V6/sSynhRvVpPxg+nYU7Rb2avMl4y9rX0TQ3AKMMLo3PXuMRN2brlzo57Ex7CUf5FGYLZnJ9KlJpGuwvtTkxmHNzZYvTOZ3G5mOH/9N7UQMlsK3pPDBsXGTW6vudWi7o5VPXK1hARrBsbTPC0Hyhr1LQSxmiGUgU2gpMMd5ElDSX+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU6PR04MB11135.eurprd04.prod.outlook.com (2603:10a6:10:5c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 01:31:05 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 01:31:04 +0000
Message-ID: <ff23f9d1-3ec1-438f-bf9d-a236baac0cea@oss.nxp.com>
Date: Fri, 28 Mar 2025 09:30:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250327023710.549-1-ming.qian@oss.nxp.com>
 <20250327023710.549-4-ming.qian@oss.nxp.com>
 <Z+Vjh8Iywt1o9+IS@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <Z+Vjh8Iywt1o9+IS@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU6PR04MB11135:EE_
X-MS-Office365-Filtering-Correlation-Id: f3de7842-d572-46ee-c5aa-08dd6d9834e1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVBWR3J4YW9pbTRDZ3p5RVRwbm9yOWlTcHBlaVhLNDNBakxvZFg1dnU0ZUdu?=
 =?utf-8?B?dG9qUmQzbndyMjNGanNSQmtwSjl3OUJSZ0hBQ0dITlllKzBOV25reWMzNGxP?=
 =?utf-8?B?M21wL3lyVG5DOFlpbTRHakc5VVlnWjc5dndhUS91aS9JRzdwVWpNZnZJbno5?=
 =?utf-8?B?QW0rcHBvQUgxMSt4bnhHV2JGcW5HMVFkTnl1V2JxMVdZbWlPMzFzMEdPcVZN?=
 =?utf-8?B?TVUwdWNYZllVYWdhL2FnM0lNWGJVVkdnTE5vTWo3eSt2cUozOUZuUHdPYWVR?=
 =?utf-8?B?UzhtaVhrRXdZY0R3Qi91QVhOSUxDUTFuYVpBZXAzNnBGcXlSVGZZcTFLajln?=
 =?utf-8?B?MUxRemo2QnVLYlhxTUtMS2FjSyszM3VZVjZ2cGhlV2xRMi9ZSFh1Um5zaEpY?=
 =?utf-8?B?OEJZRnRZSlpEUVBtQXZJeERncXc1aG84K0hNTGRBZE1BZ21pNGw3RExGMHl4?=
 =?utf-8?B?UXVWZHRDTUJvT05jcEtMMGxVTXFhaEthR0NYUHc4eXI4RkNNYXhiNmRCaWRz?=
 =?utf-8?B?SzV5RTU0bGM5YzRjNkkyb1p1bE1iSTlNWXdtKzRzMTkzN05iUnFScHl0Y205?=
 =?utf-8?B?bG9XMHhVYk5MN1Y3K1hxRllBQ2xsTTI3a0o1c0dEZkwvMlhVdjAwRlZZcjVD?=
 =?utf-8?B?YzBDbWRtS3d6WmtSMmdvYVNwS05TbUdoNjErM0w1d1o5OVdzdGtndERkby9t?=
 =?utf-8?B?cEUwS0lzT3k1eEtXV1Z3U05oN0p0QXVxSm5qMDYrM1lIVVQxamRlTVdvZGlW?=
 =?utf-8?B?ZXp6aDFrNDJMOE5JeGtJK0VvNjBXdVFLSXFiaERwbzFNaEF2djQ0dU8raGZL?=
 =?utf-8?B?YUZLNU9pTjltWFZ5THlmUGJ5T21sZjY4WnZ5Q3dsdVMyQW9HRVhpbVVGL2VO?=
 =?utf-8?B?a0oveEVkWEVzTXhGTEQzOVF6VUJ1NDFpOGtlVS9IVVhxZDJnWUczMWxTWUNI?=
 =?utf-8?B?UnNHbnlnL0RVRC9QWE01MHROZXNkeS9rMlpKcWJZQ0VIL0JTcjdOWnVwb0FD?=
 =?utf-8?B?QVU0b1l4ZmJ4amd2SHcyaVkyVm9uS24yaEVlWGxLL0xkbFFUM2FLcWluSVEv?=
 =?utf-8?B?M1B2b2pxcVNwbkFvR2xPREs0bXcxYjZEVmdGL2YybklqSmlvY3FpZTVnYVdZ?=
 =?utf-8?B?YkdjbmxDSStBQ0FucDRwQy8vM2ZGcXp4L3pWbU1nek9BUysrV3BuRXFVblFI?=
 =?utf-8?B?SlM0OXBJdG1oT1UrcVhSbU10RWhqdGxVK2l1ditVUytoTUdzaXBaU2tpclE2?=
 =?utf-8?B?blFtQU1SVDd1cW1UVnhtcE5sU3FQbVBjVjEvSjhYd1FLRG9haEhvOEZIZ0Ux?=
 =?utf-8?B?VTlNWC8vdTgrbldpK0ZxTVA4VWJCUVkwR2doZ0Y0c2p3eUhFZVR2RUNMNU9a?=
 =?utf-8?B?ZlVKMFliZnc5ZlU4UFJxZXBHVmk1aXIyNUNZRkhlSExzZ1d3T2ZCUThuYXVP?=
 =?utf-8?B?VjhqUW5lQjNoVjdUcVFJNDhFMjN0RVpjcUF3amVvUUpSQVQyL3hVYlptMmxG?=
 =?utf-8?B?eHA4NFNWYzV2dDBCQ25XZEhyRkdiSithdWFkeEdiM3UzUDN4THg0dWJKSXB4?=
 =?utf-8?B?eUdpK09Cd0JRN0lLL0ZBOVlWUklsNTJqZGY1aVcyRVoxSHhBUVJycEJQVTc5?=
 =?utf-8?B?L056MGZoSnNrTFRvbGJkYUNYNGpMSlI1WTFLclJkQ2dwQXlhRWM4dVhpY24w?=
 =?utf-8?B?N2xLdzdycTZ5bk1tRUM1WE1NL0FzaW8rTGI5ZkFicm9mRnA1TEc5U2NRQk0w?=
 =?utf-8?B?TWJKRGxEK2dNZGdobHV2a0VUeGhTV2UxY0RzRzVOQTdqTnNBbmNhVnJJSDdj?=
 =?utf-8?B?NmU4UVhOYTl6Y1QxYkEyaDdRYTIyanhJcXRlcjZsem9kWmQ0TE9zRUpDUEd6?=
 =?utf-8?Q?aqvWnbuEHl61A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG5HTTVtOVF0RkVpcHRkdERiUG5tcUI5VkpaN24wNWtlb1h1VGVITENlOFQy?=
 =?utf-8?B?ZTBHZ1IrZjZhQWFaTmlJTnpXNmI3L2UrWmpldVdodGtJSlFyQzRPV2VhNEwz?=
 =?utf-8?B?VlZQMEpQeTl2RDZ1QmFmZDNQL3MzVDJRSmlwaWNxU3BsWVMxRVhsSXhpcjJw?=
 =?utf-8?B?RVdjbkhKN0pwUjF2Nml4cStiYVNoUThuUjhZQ08rdVRobEtLNlhOYTROOVlp?=
 =?utf-8?B?YTNzNmZjMGd4c1BOcDZNZjdSYVZ1Z2t2TFFNWHp0VytnNU5wUU96a1BkUlcx?=
 =?utf-8?B?VVdpWUJ1dWRnekhNV3h1NkFLNzBLNDhoV1NwSHp5b0JSNzVCcTZxZTdjOE1k?=
 =?utf-8?B?aGVhd2ZUV1BoOGROZXFqU2tvd0orbW81Z1dybUFLa0hSLy9RUnNhc3FEeVpq?=
 =?utf-8?B?eG5PUzNzVDJla1pMVzBqa0xyRDF1OFRmMmVRNVhlTUdvQTRreGJvcXFPSzhL?=
 =?utf-8?B?eE92ZXU3TkRhMFYwa2ZweWtTR0pBazN1RHFveWhZOW15ZHA0YTI5eW9WS3VD?=
 =?utf-8?B?NFJMc2lSclJNRGVycnRDUk5wTStxRldRYkhZTVZ6aGs1UFp0SGdvM0puQk9C?=
 =?utf-8?B?dEVIUjB0LzhaSXp3Z3FidVh6b1lYYm4yZDhkUkZHNUdESVBlNnN5NmIvM3Ay?=
 =?utf-8?B?Qk1oVHhrMzhxTmVkNW9RTTRjNi9QMjZyMDArNEdJVXJiM3ZjMkZTTHNId013?=
 =?utf-8?B?M2lvRFVwa2NCZVhYMlkwb2hVU3pnRkJLUEFFalBBa2Y4bXdUclBZS1A3OUMz?=
 =?utf-8?B?ZVoxbWlyL1RFcmhWeUduRDBja0VPdXFvdE5QM01RS1lnMytpOE9BNFFVazFz?=
 =?utf-8?B?eXV6WjFXUnRiN1ZOaER5cEpIUHI4K1dwVExFTlBIeVdJK3o5KzQ3aGM2T3dj?=
 =?utf-8?B?TWZpMlF0RkdYSWxqNVFOamdXVStsem1aWVIwdDRWSGo2MmlEOEFCTTVYNWRX?=
 =?utf-8?B?b0RENklxQTF0UmNmV2pjV1pMdXVpSGRVVFRQU3VnVzIwZDk1SEdEZFplejRk?=
 =?utf-8?B?OFdFNXhuSGJOUysxZE0va3U2TlhDcmdXOExJc2kyU1BsOUx6WnA3WVZVVEV4?=
 =?utf-8?B?ZWUvY2JFa1N6ckx4TXVvcEhHa0ZXTmw1cVJzRWhNSFk4Zk5UWnhDL2xPUXhy?=
 =?utf-8?B?a1gzUWt3RVk1dllVcE9yQjZsYm9lWXFmbEY4djB5ODJNbTl5SDQ2bWp3K0c0?=
 =?utf-8?B?QTdrakNPQzVFcTY4aUcvLzdObkJTUi9nK3g4TE1lT0QvMllLQW9TVk1Yenpr?=
 =?utf-8?B?WkE0WTlNaUx6RlczMGtvb0FqOTlkSlZ3SENjVnlIeitHdXRxaUQ5YjdDYk9a?=
 =?utf-8?B?QWNIcGNnOGtDMG8yaE9IMS9INGNnbVBCVGRSM2JZWWpWVWVPc3I5MllTREQx?=
 =?utf-8?B?V04vNFJyc3F2aUQvOUlTRWw0K3ZzUVcwRXNBU0kwc0hCSko0UndCdDZWZzVC?=
 =?utf-8?B?MVRBdFBoT3NlMVhNZ2hGT1VnSE5RblB5VkNPc251RFBkTUJWWU15cGtEU3NT?=
 =?utf-8?B?Qk5FSmJKajRQV3JqVW9CanNkRnlzdHJUZno0YWs0RVdabjN3UERHclZyQUVY?=
 =?utf-8?B?OFVVN2dVTENYemNhSjRic2FDcTRWd2dyNmhSb3E4NVdZSHYycm5TNFhucm9U?=
 =?utf-8?B?NGhBcmEyUTU5RHZLRXVWSHJROGZBNjZnZmVRYzA1cERiQ0hZTHAwVDJvNS9I?=
 =?utf-8?B?MU5jYS9iVnd4RXR0V1pZdVc5QVVPanZrYk93Z3FOZ0wrVitGaHZXUjRCQ2JZ?=
 =?utf-8?B?MDJtcVJlYkZpSFovWkdBSlBscFBJSzVNRnFzZzE1RTBDRnlFUVFLbWsrV3NG?=
 =?utf-8?B?ODN6TmlabmVRVXJOeXRiMHZFckZaWW9rWWkwbnJ6N1NGK3pkWDQ0ZGc4SjBN?=
 =?utf-8?B?ZHBOYjBLYm1vMWo4T2lSYUVCMUtGT2hLaEtOdWhYbmxEQktLTHUvZy92R2Fa?=
 =?utf-8?B?dFVZaFhSVU1EeDM2Z0FVMCtYT2s4eTlQclVHamJleGJIS1ZKa0ZhRWpKeXBN?=
 =?utf-8?B?alZabW15M0E0R1VidStKOEZyZmlZR0VxNFBMNXRDQXQ5bnEweFN6VzdjMjVl?=
 =?utf-8?B?empKVHhzUmV6UzhZVTdMenBsdzVOaTRpMmEzTnJuQTdxUjNBOWgxTEcvdzV0?=
 =?utf-8?Q?uiP1H3zE3H/t15Y4GlElRBoTP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3de7842-d572-46ee-c5aa-08dd6d9834e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 01:31:04.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svfK5DSsU9stRouzi60kV+TlVkeDob1EDxRrUQuQPttS9mJeXQ97HUY+x6ZXzGsFX1AfgBo6wYttZXLv9Q7iEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11135

Hi Frank,

On 2025/3/27 22:41, Frank Li wrote:
> On Thu, Mar 27, 2025 at 10:37:07AM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> To support decoding motion-jpeg without DHT, driver will try to decode a
>> pattern jpeg before actual jpeg frame by use of linked descriptors
>> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
>> used for decoding the motion-jpeg.
>>
>> In other words, 2 frame done interrupts will be triggered, driver will
>> ignore the first interrupt, and wait for the second interrupt.
>> If the resolution is small, and the 2 interrupts may be too close,
>> when driver is handling the first interrupt, two frames are done, then
>> driver will fail to wait for the second interrupt.
>>
>> In such case, driver can check whether the decoding is still ongoing,
>> if not, just done the current decoding.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> index d579c804b047..adb93e977be9 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> @@ -89,6 +89,7 @@
>>   /* SLOT_STATUS fields for slots 0..3 */
>>   #define SLOT_STATUS_FRMDONE			(0x1 << 3)
>>   #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
>> +#define SLOT_STATUS_ONGOING			(0x1 << 31)
>>
>>   /* SLOT_IRQ_EN fields TBD */
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 45705c606769..e6bb45633a19 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
>>   	return size;
>>   }
>>
>> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
>> +{
>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +	u32 curr_desc;
>> +	u32 slot_status;
>> +
>> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
>> +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
>> +
>> +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
>> +		return true;
>> +	if (slot_status & SLOT_STATUS_ONGOING)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>   {
>>   	struct mxc_jpeg_dev *jpeg = priv;
>> @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>   		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>>   		goto job_unlock;
>>   	}
>> -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
>> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
>> +	    mxc_dec_is_ongoing(ctx)) {
> 
> what happen if hardware completed just after you call mxc_dec_is_ongoing(),
> any thing will be missed?

The interrupt status is cleared before the ongoing check,
so if hardware complete after mxc_dec_is_ongoing(),
a new interrupt is triggered, driver will finish the decoding
in the next irq().It's the same normal process as before.

Thanks,
Ming

> 
> Frank
> 
>>   		jpeg_src_buf->dht_needed = false;
>>   		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>>   		goto job_unlock;
>> --
>> 2.43.0-rc1
>>

