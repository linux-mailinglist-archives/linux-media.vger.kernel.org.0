Return-Path: <linux-media+bounces-62206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIOqJo5ZDWpuwQUAu9opvQ
	(envelope-from <linux-media+bounces-62206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:49:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A435885EE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F0B83033D84
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 06:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B94036492D;
	Wed, 20 May 2026 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=symple.nz header.i=@symple.nz header.b="BgXNkKZo"
X-Original-To: linux-media@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022137.outbound.protection.outlook.com [40.107.40.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF242FF66B
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259568; cv=fail; b=SDgspnZ5COJBH0oSgmoZB3BKwOHgmc9D+D7T+dFvZkqpqVJLg7Up/T3oC+NinUpzfhupua4u1YethLHljWUCxkCX60/Q5GZe98FmV6nB2HkT6HQMm/Boq0uL+JIbhC0e1fzXYVeqCEK6npY19Qj5jkVzVyqnlQjchLMpu9Xc2ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259568; c=relaxed/simple;
	bh=YOuCZoSbnXo7cUY2V2lFzphGbT2GhFE42o0AMFJCIHc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pub3b7vNQOw9EM/VbDBcbk3SWJr/HmEqIytqdXsE9dC/SrGla16pB6EXo9PmbIWA61oNW+cAaZO9bPjxe5RlA87wLiy3cCsdRQrPxOL0lKTEl04DhvNnFdva3Hw0VGzzr/8SO2I3TaEqtijAURrkmOGSyHndTkzkCr5JAquLAYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=symple.nz; spf=pass smtp.mailfrom=symple.nz; dkim=pass (2048-bit key) header.d=symple.nz header.i=@symple.nz header.b=BgXNkKZo; arc=fail smtp.client-ip=40.107.40.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=symple.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=symple.nz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHscXc6Eom0E6SNJ7aM1dAVh7cFl91wPVOWvS3dVh4lcwGhwnv82wg0TnkBWDWmn7Pwy8RVoiVrz68v2m7ubqClMbFFThRzoQgW4TSdFFdney3CIQe3Wk76JOtWAh+t5A7y7W9oemaYK76XFwohVEqJbGwaNB7f++BbrL1uSJbvw64vfpqEAtYmykie8CEWb69ZnDttVOLgQHdWGv2kdFVWFuX+vck3MxgBUysV6w2+j5jaJ9e25vtbm8NxpbiwDlqGhj/vM9sp6EzWgF89b0s6umgpxhRJ7VG1LAoXpOXa2fuUpj7YoGBS6hldgfoV9EQXSnpfryfizdo9GrHdOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXSbnCRGS5jGwmn6tEsG1hy78vJP4CRC6mKBKDRWRlI=;
 b=uiZ7YCUOQ+yEucaMmlZ1nBiWX2HI6w5aGPbGjxx6zlGK08Js4hY1qls+kOUMw1A5Me7wI4l4JRFLX/JnuOABtOY29/UN7QDPjws6yPxNYM6msCHJbyad8BVzyZ+NGhKdRNm37D2tK2zbrIHQ3JC4iKM601Ob4qhXcqVjB+26kI47fOncpHivU8jYTDUiK1vduFe7gfhGwKlA9BDSH/709J09cE6Xrc+YkqS3OT64EwhMfqT3KiVRRlQSDeeltG0hqtIHvrCZCukEuukIUuaMPUgcojVsqsJLnimDZCvUviSRmTM/JlrVmfJz+K9DCp8ymuLL5th1p1xff0eBIYSR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=symple.nz; dmarc=pass action=none header.from=symple.nz;
 dkim=pass header.d=symple.nz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=symple.nz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXSbnCRGS5jGwmn6tEsG1hy78vJP4CRC6mKBKDRWRlI=;
 b=BgXNkKZoPq6c2fQ4AMdcGfdBmUYEhr91qqLTraDvGgtI0agYpfNOa4qTFIbgqALQ+ZFrUtgLa8GlFYPSHZGK7RtDKDtnzkSgAdrlnoRv6ErailoGE7PWVO9tNWfPWWDvLlfI3vkDmlPUc1J5JPN66LnL4MAtdJIFBFtQssISajLqp+A28f3FKkU9AwCuoZxmMl+X8X61/qIGYK7C05U9WEFBCYce6QWdAgk3xuKqHpZrzWN+taXZDJjfEXrXVP4pAgTxrbvZ2P/2Xc3mwTzzSu0IH+umVlKk4q5mVTQyLGx2JTA8EEb+2vIcSZM/AY/Fmvw8vwoJSNVHB8rXIvjnkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=symple.nz;
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b2::11)
 by ME3P282MB3790.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:1bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 06:46:01 +0000
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834]) by ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 06:46:00 +0000
Message-ID: <2565c949-a558-415f-8c79-e47812db8341@symple.nz>
Date: Wed, 20 May 2026 18:45:57 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
 <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
Content-Language: en-NZ
From: Simon Wright <simon@symple.nz>
In-Reply-To: <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AK0P299CA0022.NZLP299.PROD.OUTLOOK.COM
 (2603:10c6:108:15::27) To ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:b2::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2196:EE_|ME3P282MB3790:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a66189-9513-46e6-abca-08deb63b7301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|3023799007|5023799004|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ohkr4CQJfxbqKeapemqxu9KLe1Dzdm+Ce1upgk+g2no18wRuj5+pxTofxyjfo/+rjaFLqD7Z47ULppK1vXtXJv/lWdGwe2Xt/t9u+BjKYKlJel2q85mF1gmcawjmnop/uHJUmSzajowuuJlYJGUrzUxTAX1AyuZooY2V05l4/GJOjji1dvNO0pfJvK1LS3q1kXvdGfHT27YtYJhkqQ6ewBSzL1IqYEgJyOopuIn8P2xWEpRVxqb0WBlNaAi1KnhjMLkMM/7uT5UlhqLHDF4HekB8i6hAKgk6jaYtaHOeP2geohva4v2CEKyIuhf89O1Cj36NKTyJtdZw/ajNDzq8uPYbNx1Be0jo9ueWcN4Yg0PpcwegnXWtnPqMJxlI9RIXLH+pWceH3kI8TRglbOvdFKu0ri5LwdsJ3NZpwcM0qHsjyYem5lnZ8G5kGXTKc++lkhulnwmcw9b5rgVtr8PCNQtcHYqP7u3MWPP0iEFfDIXHZKkfsA9Yl0Vp/0t3LrrgL5AjTlPx5dWopN8MoUIKWNZU8jBpy8KRLTPPNJMJZgsJsnPr26LOdLQVjr8UE7H92Ybfap3tJVg1B9LbgsJ72UHS8MTB1pBiY/fgk6sN4dMdiyhOkWWufuKGL9XXzdpgQhcctVGIHFoSLcoN20Rp9lyHJ4ZQ3M+MztXyhkcfhtnUnWciHl3ovZ4bqM61t2a/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(3023799007)(5023799004)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmxEWEsrOWoxTTgzTkNoQmJwaERzc0lsRmZGWk8ydW9xQXpuaHZEaGlFYjJZ?=
 =?utf-8?B?SkpXb0Z5Sks4S1VWcXFSdDA3SjR0SGpReTN6UWhHL1lOL0g4Y3ZMZnlramdu?=
 =?utf-8?B?VFF3R09HZDBkYzZUcWZ5bXFmNlN3cytuSW9ZTUt5OEhWa0dqRWNQRjROSzhZ?=
 =?utf-8?B?enlSMmR3Y0RXYVNQZkpuSVZkMnliVUVsajVyTW96K01zSGptcjJYd2cyOWNM?=
 =?utf-8?B?b1l3dVZMZzZlY25jSGcrMEFQOWpQTWdscndUMmptYmVJQzEwSEFJTExuUitk?=
 =?utf-8?B?aDRLZGlnNVhYcExDeGw3NWU4VE1XZ3BMYnFqRXVhZ25TcHBQSTEybU5yZ0E3?=
 =?utf-8?B?L3JyQVdKTW1aN05ibW1yRk1WcEUvb2tlV0cyd24vejBDLzErK0FUcmYybGFx?=
 =?utf-8?B?SE5sZ3VlMnRpM2U3WjRpOCs4WFlveGp3YXdydWU5MFJRZXdLb0xVNlE0T1Bv?=
 =?utf-8?B?UFNkbHkzb0FKY3dQYWZmRFdUeFNiSFdsRExaZkhGdDFWUHZyVEJPZk8vNFBN?=
 =?utf-8?B?ZVdLR2xsMFc4UUoyQ2dpU0g4b1pSRVhtS0VHU3IxL3lzWmtWMnNBWDA3bVFO?=
 =?utf-8?B?bGdFK0Rtb2hHZjJxMHp0RG5EaWRiS2xzbkhxTk5EVWRFb1BnaDkwVjVsMHNB?=
 =?utf-8?B?czI3UEpwbTcvNGdEWVdaa1hudW9WRHpWMFg5dHZqVXRYOER1SkR4VmV2MnRT?=
 =?utf-8?B?SFFzVFRNdWdsaFViQTVubWYzcWxoMEdESmNQMi93YlFTTldQWjI4R2w0NTJO?=
 =?utf-8?B?V3d5eDFwbnRCZmltYks5MUYxUkExWU1BYzRzZ3l6NmFrYlB4OHJUR21tYThP?=
 =?utf-8?B?WUdaU1B4SytYZ1YyZmtyN1ZQTmtxaXZpTW1QZy9aY3hDUUFQT0czRFFPbExs?=
 =?utf-8?B?Z1Z4eklZMk00TVRPUEs5S1dJeC9CZ3ZiaWltMEFVUUlDTElldnFRemxOVXZa?=
 =?utf-8?B?OGNHMWlzS3RPbmlwekxOczc4SGtxZGJ3OHJ1VnM4N3pXd0NzNTVBVG9WN1lu?=
 =?utf-8?B?bUpwYUh1WDJ1NFZYN3UrYTNGaDRiYW9IczJ3d0NwZDZDcTh6bWN4bUZMamVy?=
 =?utf-8?B?eXhkd29nQ3ZkWVlPbitvK3Z0RFIvUmVtZzZPSFFTU2NDTGhoMnBWeDU1NDcv?=
 =?utf-8?B?YjdCanBmNXJnekJaY0dvZk1ucmhMWGZaOUxOZUVoQjJRU0xCbHg3NzJhODU5?=
 =?utf-8?B?aHN0ZkY0MzYzS2Fyb3JnalVxM0Z0U0NzSHNYUDdLd3VDQnozV09SWFdGczBr?=
 =?utf-8?B?OEVuWHZRLy94bDFhdWpLZi9RR29DMWU1YXJ1YktJVEErWlorVEE0dFdjUnNs?=
 =?utf-8?B?VWFITmZuQUQxU09kYmlwMjA2T3lyd1N5ekNYZ0VtSFRHYUxiMWdmckY1Zmdj?=
 =?utf-8?B?ZzljT09GY25ITTYxSVoyeWVuNU5zUWpKVjRtbzRRYmRSYWR3SXNCZHJlZHpE?=
 =?utf-8?B?L0pqOHcyNXZnRVE0K3VzWC9yYUhSRURjRnVOS3ZYN243YS9ZZlNYaWVKTVRu?=
 =?utf-8?B?QmhjOTVidlhoV0pmNitjc3BGRXlhbTNqNjFBUXFtSXZHUXlpSnpZVUxLdDI3?=
 =?utf-8?B?OTF4ZUF1M1JBRitiQzJmdGI3eis2Zjd2YkthTncvVnJFcWFFV2p1SUxuV2FD?=
 =?utf-8?B?L2lsNUZBZ3F1WXhPVFljc2w5ekgyZ2pDcUFwL2E5d1FFZ0xNSVpxd3hZQjAr?=
 =?utf-8?B?M3hGTG9pa0NYYnpRajNhbEg3RGplTi9tV2hNRGRIM09MOXlHdDFwckJEMWIx?=
 =?utf-8?B?WUxFWStjL05SWE1lOWZ6RmFIT0tzM3U0NmQxRHJoQllqTy9KZjhIZHNpM2o2?=
 =?utf-8?B?dGFtV0F6ekdXMENIaVJaYkdTMmtSUU5IY3A5ZGtGN0hPRWpUQXBqd0RKOHcv?=
 =?utf-8?B?RmhoS3hQbklXVnN0ZEwvemxPZno0cEVyVys1bVBpZmhIYnIvSjlhY3VHVktL?=
 =?utf-8?B?R0ozRFI3b0xITnpkMlZ6WFUvM0NpMlRIUU1zNll3WmJicU1rVHREOGJuV0xx?=
 =?utf-8?B?bjhOZnM5OGhQQkkzMGVLZmVZN25Hb0lvRS80Mlp3QjFSYW01dy9McmhtM2xX?=
 =?utf-8?B?clFPUUxzTnVwaXlMOHoxMkRBU3owWHJRNS9STTk3NzVjY1lLRXNTTytrZnhN?=
 =?utf-8?B?Z0l1dFhTaDk3UVVnRWMxSW1HUllPSkFkV3lHZXFERjlhcEF4MzRoTVF2NTkw?=
 =?utf-8?B?UlgvdzBIL25tRVJPd1Y2M295LzZYcVRPSWFndHJDc1NPN2tLZkRqa3hteGt6?=
 =?utf-8?B?aDloOGU2VkNaS3JKemVudk40U1M0blVRWGRGTFc4dXNLUkowU2RjQVRXR1Jt?=
 =?utf-8?Q?2EHyUbbdccFUdW2zmL?=
X-OriginatorOrg: symple.nz
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a66189-9513-46e6-abca-08deb63b7301
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:46:00.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9531f271-068a-4210-b471-bd8da91491c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJA7PJxWVDjo0ombHGcxsQHI+Y8XA5o8MWOq+T2Q5G6C1SRkzMdP/OwSe8Nf6vnI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB3790
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[symple.nz,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[symple.nz:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62206-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[symple.nz:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simon@symple.nz,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,symple.nz:mid,symple.nz:dkim]
X-Rspamd-Queue-Id: 95A435885EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Detlev,

> We do not have documentation for this decoder, but could you check
> your decoder version ? It is store in register 0 and I get 0x38321746.

readl(0x27b00100) reads 0x38321746 on both my RK3576 boards:

  NanoPi R76S (FriendlyElec):  0x38321746
  ArmSoM Sige5:                0x38321746
  Radxa Rock 4D (yours):       0x38321746

Same silicon revision across three different vendors' boards.

> What I don't have is a test showing that the hardware behaves
> properly with the vendor driver.
> Is that something you could try on the NanoPi ?

Done.  The R76S has the FriendlyElec BSP on eMMC, so I booted from
eMMC (kernel 6.1.141, MPP c1f1c12d 2025-09-30) and ran
mpi_dec_test on long.h264 (1920x1080 H.264, openh264enc SMPTE bars).
Then rebooted the same board from SD into Armbian 7.0.1-edge-rockchip64
and ran the same file through v4l2slh264dec.

(Armbian's build of Linux 7.0.x carries one unrelated rkvdec.c patch
that removes a vb2_is_busy check in rkvdec_s_ctrl; rkvdec-vdpu383-h264.c
is byte-identical to torvalds/linux master.)

10 frames of NV12 vs an avdec_h264 SW reference:

  Board         Kernel + driver               Frame 0 diff
  R76S          6.1.141 vendor MPP            0 / 3,110,400 (MATCH)
  R76S          7.0.1   rkvdec-vdpu383-h264   732,094 (23.54%)
  Sige5         7.0.6   rkvdec-vdpu383-h264   639,721 (20.57%)

Same chip, same NanoPi board, same input, same SW reference.  Vendor
MPP produces bit-exact correct output on all 10 frames (0 differences
on every P-frame too); the upstream driver corrupts every frame.  The
Sige5 line is a different vendor's PCB on a slightly newer Armbian
point release running the same upstream driver, included to rule out
a NanoPi board-specific issue.

> The other report also mentioned that the issue was happening 10%
> of the time, but you seem to see it every time, could be nothing
> though.

100% here.  Every frame, every test stream, multiple input sources
(openh264enc, x264, NVENC, QSV), two independent V4L2 userspace
implementations (GStreamer 1.28.2 v4l2slh264dec and a hand-written
Rust submitter).  Rows 4 and 12 mod 16 are fully corrupted every
run.  The exact percentage drifts (20.3% in the original report,
20.57% on Sige5 today, 23.54% on R76S today) because freshly-
generated streams have different intra-prediction modes, but the
rows-4/12-mod-16 pattern is invariant.

I can host the long.h264 + sw_ref.nv12 + hw_bsp.nv12 +
hw_mainline.nv12 bundle (~115 MB) on a public URL if it would
help your reproduction.  Also happy to dump more registers,
instrument the driver, or test patches you'd like me to try.

Regards,
Simon

