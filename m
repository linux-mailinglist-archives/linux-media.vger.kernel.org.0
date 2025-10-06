Return-Path: <linux-media+bounces-43787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FB8BBE1A2
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 14:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 291161896813
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 12:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E370D284669;
	Mon,  6 Oct 2025 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="EJJb1PCc"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D028312B
	for <linux-media@vger.kernel.org>; Mon,  6 Oct 2025 12:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759755441; cv=fail; b=EZNBLAmx4PRBQkfPJ9ikYg/hnqfc5ZoMYJTRg3x5n1suQ9FDrdIa6O6QPRL7zfoPD7BKQdvMgpa+7y53dr6runW1AjdIdU37DHzR5raEAozW1S4SzLjLRLEdlTFA00oiaFmVWlR9CM4zwOo3lA7++CIRifKmrkoFx4o4VspHgXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759755441; c=relaxed/simple;
	bh=xod/R5jR/1kLRNHPtWmkvfgQ9PsZ0fHBKocu2NsLzN8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UzCyLkfzfvAtUa8duwt5O9+KlT+oDugjymEJ0a/2bzC7RzheWPX9UZiw/Ya1cZsPfbcr7Cf2ovsxeqdqEEe9wIWpW0o6fMGB9Q+zRTdO2UKQ8PTyYM78K8yJK4FMacEYFiasq9jQjtqKopd1TWwfiCcxDHu7GHgYIg+q/I6Dp84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=EJJb1PCc; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wx7a6iyypZSgdpp2AV8NeTuylU63FMegtQfx37ON+ws8lSrrgyam7RHMD3iQPY2BkJzMT4KCg9yefKsKkbLm52Pqww1t8OnnPlZ2jkf9uxuyObz0x+cDUPncWHnMU2wHOP8rvB4X1Nxv3sdQfjtaFv1ELrecWauFEwu/gV2aZuVa123usbMxxJJKUKSrom2rCfUVTiiWc7sDTPBGGMZZFQBmzeLi+LOLlt/IyeuzpNIe+pw/aQ8XzHeUyueApApGI/59BsgNBwdVH9m1RqCSlgFkacqyTTQ8QI7lJOOMwRtDNYfZs8vx7jKVA03kSGd1efKfBHZvy0qe7GAT4JTZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGhCXlsAljQuejG9G86kgavO24rptFLBIgUCMYDJzzo=;
 b=RpdZsHCpejzIn8zs2CKgI8aG3Mq26lO8yxHZ5eIy/uoEYW9H8iVgiQbaZIndiQq3RUnkaeDERozgfJd6lGBMwD2TAvHpaeO8W1IpXk7zbugOMl54kHM0ooyqbCRzDJC9c32KIow1XrmI0iqS9SevpcQIfoYiAJcjrMVH6QgyNoHhoHtNx1aNQNBZeBqCGB1MmBQEbW9HiFG5nnQn+Y8Vx0yHZjkvyu0wrctRTjJQArUXNxAWJFWO0ZD+G5Uy3bbm0HJq3pn+UzBsvhNjiOmQ7TlXcqeqFc557ov3mHl1wQzOVDRj4vsK3SFIie9FMuBTF1sJEiVwmqddu3GD4UQ2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGhCXlsAljQuejG9G86kgavO24rptFLBIgUCMYDJzzo=;
 b=EJJb1PCc8VEbCZh5yaWSCsMgF1TUPp4JhmG7jH1kEFC5tBjAMeVEVhpL1x8UqKZNgYxTG8cpzrNOHGvIz3ya7Q//3oajddXl3y5TuAvoxxWiL69C0wI2V4kDqXz1yrBCPCAEXHcqJJDPV71CwWyc+ElYnQRMxPmYZP/rimVWcb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB11579.eurprd04.prod.outlook.com (2603:10a6:10:60c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 12:57:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 12:57:07 +0000
Message-ID: <369af1f2-1772-4718-aa63-f3d09bdfd78f@cherry.de>
Date: Mon, 6 Oct 2025 14:57:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] v4l2-ctl/rds-ctl: support optional ioctl and migrate
 some code to it
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>, linux-media@vger.kernel.org
References: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
 <f5a942fd-478c-4a5d-bf68-d53191d543f5@kernel.org>
 <5734ec94-ec46-47b6-993b-5a1ac1e41767@cherry.de>
 <7f204b8d-c2bd-4d81-b8de-b1fa50c6f091@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <7f204b8d-c2bd-4d81-b8de-b1fa50c6f091@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB11579:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3fc171-f5e0-4b73-9424-08de04d7db4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGcwVC9oRWM5c3RKaE96dHkwU3QyRGdGTjBKTE1XaUYxRFpNeGgyYVo5blhR?=
 =?utf-8?B?cURQK0hjTGNPMDZsWW1sMGJRMEROMlhsNFZaM0drRnVjRUwxdTNQSzYzUjlK?=
 =?utf-8?B?bFZnUU9CUEVLOW12d0c0cDJWay96eGpSaVN5WnlnNFB6ZVc4RW5IUC9uSVRS?=
 =?utf-8?B?MzlEYzR6OW5BZld2R3gvWnpJQ0JadURQMFdtbE40OWJieXZvMHR5T0JWd2RV?=
 =?utf-8?B?Y1JqdnNRTVRDUnBYVmZFeWtwQ3ZjMlVMWituUzljeVQrdExSOGpXMExFRjRP?=
 =?utf-8?B?TEhPMmt0OGM2S2gxTURVNm1UbmZzclBVSVdISGd2eWg2L2pVWGlRd0gwTmRq?=
 =?utf-8?B?VVd4K3Q4aFRTR3pyeUp6MkNGMjFOQUNWNnhxVmJzbU8rcnFycU5oMXRwRGlM?=
 =?utf-8?B?SHpTY3RWY29zU2xVanp2RllQRVh0VFVCNWtaOElCRGFDUHpWZU9xckJGVVhv?=
 =?utf-8?B?SlhseW5Cdkp4eSsrSzhKUlplNFdrbXJRUi9CT1J6RFhhc280UlhZOUF4R2xn?=
 =?utf-8?B?Rm9zSWVXZnp4elduRkRKZmdUcjB2YUpIQ2txSndXaTVWRUVCSlBMYmRhSmJS?=
 =?utf-8?B?NEt1UEpPR094TUxJcDlWT3JIcHFZTGRXM240U29RWnZEWnE2R3UrelVWUmE5?=
 =?utf-8?B?ZHpHNk5KK2ZESGpJWlFNWlJ1S3hhdGg1N1FEa0NRSnA5UnVjbXRoR0dTTGNo?=
 =?utf-8?B?QTFWWkZ0cVhZQTc4RS9EREhkV0xmcXI5TWt3ZEhNQ3BhV2hjdlNKZjRBajdz?=
 =?utf-8?B?NjFURWVEOWltUXBQYm5wT3ROVDZaVjk0SEp5aEFTWG9JTm84QjJRWGFVMEtz?=
 =?utf-8?B?eDlsSVRoakFMZzhGOW5ZM3VzTXRFVDdPaWFiTy83QkNFN05kdFFrSnpJQzhO?=
 =?utf-8?B?Q0ZNcXRvV2c2Wjh5bm9SKzNYRm43UnNyeHRCWU84RExPak9rOS9aNVoxdGtG?=
 =?utf-8?B?dWM5QVlpNmRkOW9mU3VsWS9xQlBBWUVvTXNiUXVhQndXdllnZVN4RmlKWE1r?=
 =?utf-8?B?akVQUCt0dy9vWXhRbVNUZ0J3U2R0UUEzaS8vSDRvWG93YWdzZmtHdDd2L3V1?=
 =?utf-8?B?RXdpdGhZL1dpOEtMY0t5cjE1S1hGT3RKWEZKYlBGNWNVa21CdVNGTG5UV0Ez?=
 =?utf-8?B?ekluT1BFY2E3bnUyWnVPd1p5L0ZmMVo3aUh0QitNQVZTdC81UEVCS1czZjlh?=
 =?utf-8?B?eWZuSW1ySnJjcnlCVGlaRWVscVZ2bUtsZHhaUUhMbWdFQkdDR3JOZGg4NTRm?=
 =?utf-8?B?VDA1ZEEwQ1cveXZubDgwTlY5Z080QTJRQlBVSWc5bXE0WlFsSUt2bFllUmx6?=
 =?utf-8?B?a2hra09TVEQ5U0psQU5YM2R0RGczV016US9MQWt4czc4dnFtaW5abk1yRlFl?=
 =?utf-8?B?OEl5b3ZZQnNZeWZsdmVCLzdjVGlwdjBLSlAwdTg4bWlzdUhaRVJvbStaeDI0?=
 =?utf-8?B?TEJnckU5QTc3ZFBTaVNwUVZmZ2dHRERRNHVYdi9HZXVnaEZEMUlWQVY1Zks1?=
 =?utf-8?B?ckdSeGNKUWpIcGYvV0J6NklGYTF0YjFtYWZpTHgrM2k3ZkR4cHpyclN6VU02?=
 =?utf-8?B?eWREWFFOVEJWK29YQ2RIQU0xTmxabUlGbkdZR1YwMmMweWpUcUx5Y2tNY0FF?=
 =?utf-8?B?M1drRjk4eWhBclVjSW5WcjduY3Y3dEZ2WGs3K25DTnVTZllSaTYvbFEramVS?=
 =?utf-8?B?UUNLRXpVQ3U1TCttQ2N2SXZmek9teGNpMERzWFZ3TkFoejZBNnZCYUFDU2VJ?=
 =?utf-8?B?Sk5KNUN5ZHE3R1VIR3JYTVN2NSs3eUwwRjBGQ0RwSFpvYUNYZ3pTMXR6ZkJz?=
 =?utf-8?B?NGRrYW1oMHYxekEzT1dJMEVqWFIzVk04a01CWGlyUlgvTzBlOEZvNmtoc3Ri?=
 =?utf-8?B?aWRNTEpKZnQ0Z1BQTFFnb1Z1Ym4wZ1piKzh4endTRnR0U0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUZjd1FDTGNBV3prVjh2RTZOZHRXZG1FVDhrMFBPZ0Q3SEZ0ZnZNSFhEWEIw?=
 =?utf-8?B?aGFWNTFlb3RSTnp0cUtqTGt6N25GcVF6dysrQmNLVXQyKyt0dVBzOWZYcHRU?=
 =?utf-8?B?c08xTDBGSHVzaU9MK3pMeGh0OXNqNXBmMGtUSlkvNDRYc0NnUE9QQTBta0xo?=
 =?utf-8?B?VHVRV0I1Q1J1UDZtS3pzcG1rY1JRNE5TYWdmN0tCS0k5OTJHYms5UGVxbVRX?=
 =?utf-8?B?NXJodmtCNng1K3kxUjdBZkxuRHBuTHh2YzVwWVduTnJQZ3haWnlrRENiTWh1?=
 =?utf-8?B?Sm1FaWhNRWRvdmVPOU5aZnVGdElEY29UazNFNnhRSFowbnJvdVZVMUhOZ2k1?=
 =?utf-8?B?RHhpaS9MT014bFJoVUZpQlBHcWVFa0FVdjR1MzhrSkJHSU44MU9pZFZ4TDBC?=
 =?utf-8?B?dzBTQUxzTmNoTVNjajloejZwampQQmtSYUh1ZDJ6Z3dEWVBEVzB0eWR2aUM5?=
 =?utf-8?B?eS9QT0EvVHZINmZQUlBkcUtkMFRaaHppVWVLaC9CbUhZTWt6TXYySU16cThu?=
 =?utf-8?B?NXRqazVvc2VGdVNKMlp6bEVnNFhKazdEQVJZbzVEVlpyRTdwSDk5Ym5RS3Zs?=
 =?utf-8?B?eFdiaXNENHExNEF3emgwZ29TQmRlbG9DRXZHYWlrTW5JbXVnVGtSU1ZmQUNw?=
 =?utf-8?B?d04ycG0wZEF6UlVicHFJaW1TTVdCSkh6N3RoQ2o3NXhmZnNWNiswTlAzVDNE?=
 =?utf-8?B?a2xpWHAxd2VTMlo3L3pKMlAvTUlWUjNWQ0ZUNi9IL05EUHZydGxMK1VTTWZ2?=
 =?utf-8?B?QjA1M1RPaXhoU3lIMjJwUWg4WkpEOHFXYXJZUm1oQTlVTnFVYlNLVUNoN0l5?=
 =?utf-8?B?VnY0QUx3bUJCUlc4U2hiaXc0bFhxVGwyYW4ySi9Wb3VpMFZYSWxTSzgzeXNG?=
 =?utf-8?B?cHFmRW1yaERGVVJOWFdIeTBXL04vUzA1WWRWOEhyd1FJeWhkb05KWTN4bUE1?=
 =?utf-8?B?OHZFbnF4b0t0NjBnbWNHMm1TTDRmTnExNEpYS0pqV3ZaR2F6dVhQVlRZS21B?=
 =?utf-8?B?SkRtTEthUnN1b2c4YUdOY25qMzMwR2ROUVA2TjlLSlZBSm55dFFqMXJBN0NH?=
 =?utf-8?B?citGSUdwUE5SMzJXdGJsVmZDVGVONExOZENSUElBK3pNeEtNRnZRSnpDMGJG?=
 =?utf-8?B?ZUwvMjZsNUNhc3h2YVNScnNoUzh6VTZPejBMUUZyZEp3Y0ZnL01QUlpKMUVS?=
 =?utf-8?B?RG83Y01hVEdMaFFCc1lSWjEyWUM0UXRhTVVsTUhwSm4xa0x0SVJVd05NbkF5?=
 =?utf-8?B?UDNxaEEzaDI1cE1KR05QT21pSUcvR05Hak82bGR6L0d1dkpGOElxdWhZZUxJ?=
 =?utf-8?B?MWhKZ3RKUlV4U0krZy9MVkVwRzlOazJ6UnRDc3ZvVVlkbkhxaFdGMlR0TEZ4?=
 =?utf-8?B?TWMwTWFBV2Z3d0Y0TlV0UWIxMnhldFhaQURXRFVvU2swSXA3RGZCeW4yaUM0?=
 =?utf-8?B?cFNQR3hld1ZTb3ZvWGYvVitLblYrNzROcG8yMzFjUGNUeWFDb09WaHZ2aG04?=
 =?utf-8?B?Z3IzY0ovNmtvN1h1Q1VLa0twaFhhVFFkd3F3V21QNWFmQU00aWN5MitaNk9Z?=
 =?utf-8?B?b0czZFUwQXFJWkRvZzY1VmVYYUNnQkt0aVdZUE1iaDFaUXZSNVl5cUtEcUhG?=
 =?utf-8?B?OExhSGxtbUlkZnhCblNxZ2RQZng1RVJCVTRES2sxc3Mzbnc0M2ZGS0h1RUlK?=
 =?utf-8?B?SktDZktiOGZkd0hYb0dldzBuelNPM1NmNy9kd2xmMXFkQkJ0M0J0NkVpWVhK?=
 =?utf-8?B?UlZXdmRGbnVsaFJyaHYxMHpocXNpNFNZakNUaktjQllKT2NTeTh0VmQrM21I?=
 =?utf-8?B?bkxuaVJYM0h3UjUzSU5BdytrUHRxTUdOa1RXUXdlNFdzeVNJK1ZpZ05lZ05h?=
 =?utf-8?B?QmNCSTcvVmptWVMwaENYWjhack1HMTc2dnU2MTNqYWorTUtiZklsMlNkcjgx?=
 =?utf-8?B?LzFPdm5ERDB5QWRXTllNOU5vMkgzS0t3blVMcFhqamdUdngvNysxd3I3SnRt?=
 =?utf-8?B?R0hlK1NjckUwc0tudXl1QVQ5V3g2R1NRQU5adXpERGlZc2NiQ0VYZW9XRTNO?=
 =?utf-8?B?bjB4T21sbXIxbERSUE81aHdQR2J6Q1JhRldGSkloM2t5UkQ0TmJOWjd4NGdS?=
 =?utf-8?B?WlpGRE5rdFllNjF6a0lnZWJucEYvMm1TL3RmanMwK21ad0k1eU1qNUlsYk8v?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3fc171-f5e0-4b73-9424-08de04d7db4a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 12:57:07.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiieqzYYOgVWiEJSYq4QUomACLK7dYgKE1bWj4f9eWtquLxqDqVR5PXc49uQlfzkHp2y092Elxf7EThj8Za1vsIZVfYWgq3WrDGeCZ6N4Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11579

Hi Hans,

On 10/6/25 2:19 PM, Hans Verkuil wrote:
> [You don't often get email from hverkuil+cisco@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 06/10/2025 13:37, Quentin Schulz wrote:
>> Hi Hans,
>>
>> On 10/1/25 11:17 AM, Hans Verkuil wrote:
>>> [You don't often get email from hverkuil+cisco@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> On 05/09/2025 14:19, Quentin Schulz wrote:
>>>> Some ioctls are optional and the logic around it handle it nicely,
>>>> except that doioctl (via doioctl_name) sets app_result static variable
>>>> to -1 if the ioctl fails.
>>>>
>>>> However, both rds-ctl and v4l2-ctl exit code is from app_result. So it
>>>> is possible to have those tools perform the expected task (albeit
>>>> failing to use an optional ioctl) and still report to the user that it
>>>> failed to do so.
>>>>
>>>> Let's add a new function doioctl_opt which allows to NOT set the
>>>> app_result variable when the ioctl fails.
>>>>
>>>> This migrates two ioctl VIDIOC_SUBDEV_S_CLIENT_CAP and
>>>> VIDIOC_SUBDEV_QUERYCAP to be optional ioctls.
>>>
>>> Actually, those ioctls must be present, unless you run an old kernel, but
>>> they've been around since kernel 6.4.
>>>
>>
>> Yes, I am using a 6.1 kernel, which is supported until Dec. 2027, c.f.
>> https://www.kernel.org/releases.html
>>
>> 5.10 is also supported until Dec. 2026.
>>
>>> I'm dropping this series as this isn't quite the way to do this.
>>>
>>
>> Could you explain what is the issue with those patches so I can suggest
>> something else?
>>
>>> Perhaps you should explain the problem you encounter first (and mention
>>> the kernel version you are using)?
>>>
>>
>> Run v4l-utils on an older kernel (6.1 for example) and it'll try to use
>> the ioctl that isn't supported. Since it's optional (the return code
>> isn't checked directly) it'll happily actually do what's expected from
>> it but the program will end with a non-zero exit code, thus failing my
>> CI tests while still actually performing what it is requested to do.
>> This is due to the failing ioctl setting app_result global variable but
>> the failing calls not actually being checked right after in the calling
>> function so the program continues as if everything went well but the
>> last line of the main function (std::exit(options[OptAll] ? 0 :
>> app_result);) actually returns the exit code matching app_result value,
>> which is set when the (deemed optional) ioctl fails.
>>
>> I use v4l2-ctl to set a test pattern on a camera and now my CI simply
>> doesn't pass anymore on Trixie because of that. For now, I ignore the
>> exit code of v4l2-ctl -c test_pattern=1 and validate it actually was run
>> by running v4l2-ctl -C test_pattern afterwards (but still not checking
>> the exit code of this command as it's still returning that it failed).
>>
>> Kernel is 6.1.
> 
> Isn't debian trixie on 6.12? Why are you on 6.1?
> 

Typical embedded ARM devices setup (sadly). 6.1 is the vendor kernel 
with support for cameras while upstream catches up (no camera stack on 
RK3588 yet). So we essentially only have the userspace stack of Trixie. 
I mentioned Trixie but it doesn't really matter to be honest, I could be 
compiling v4l-utils on Yocto with that kernel if I wanted to and the 
issue would be the same. It just happens that our CI is running Debian 
at the moment.

> Honest question, I just want to better understand why you are on that old kernel.
> 
> Anyway, the application result is of limited use: it is never tested by me and
> failing on non-existing ioctls is probably not a good idea anyway. v4l2-ctl calls
> lots of ioctls: if present, then do A, if not, then do B (or nothing). And each
> time an ioctl fails fails with ENOTTY app_result would be set.
> 
> Going through the v4l2-ctl code and checking all places where an ioctl can be
> optional would be a substantial amount of work and is probably hard to get right.
> 

Fair.

> It might be better to only set app_result if the ioctl result is < 0 && errno != ENOTTY.
> I.e. missing ioctls are just ignored as being 'normal' behavior. I think that's
> reasonable.
> 

Do we want to silently ignore ENOTTY even for the return code of the 
doioctl function? This would make it impossible to know if the ioctl was 
run or doesn't exist, which I assume may be desired?

If we don't ignore ENOTTY for the return code, then we may have an issue 
with app_result not being set (so = 0) but the return code of the 
function being != 0. Then we would need to check that no existing call 
of doioctl is relying on the app_result variable for the exit code of 
the program when this happens. I'm thinking something along the lines of

if (doioctl(foo...)
     goto exit;
[...]
exit:
     std::exit(app_result);

This would be an issue for example.

Let's agree on the way forward and then I can try to figure out if there 
are such cases and how to handle them.

Cheers,
Quentin

