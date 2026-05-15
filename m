Return-Path: <linux-media+bounces-61634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM2IJ0+8BmpAnQIAu9opvQ
	(envelope-from <linux-media+bounces-61634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 08:25:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B39DE549F7D
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 08:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A223308BD6C
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 06:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081CF37DAD7;
	Fri, 15 May 2026 06:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=symple.nz header.i=@symple.nz header.b="1eAjXquN"
X-Original-To: linux-media@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022075.outbound.protection.outlook.com [40.107.40.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958CF33BBD9
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 06:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826034; cv=fail; b=ohdWdIXwGCLpFQ6Zd1O4MNFlzPcV2Qme7HkVF4Qg9AGqvm1AEV0KsP/j+jqHFRc6u6sGVVmA5gNdOjzb5wA/OSHRiQXSlTYaK74otGd1ZGmPZceIltvcnxwP6PhWYH/b7vc5VqcOvnSYoJ+lz+Cy76ufulp+YZTSV5C5hbteRFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826034; c=relaxed/simple;
	bh=XjLdAwWU1ij1CKYHxW9/f1Hf2Je69EM2fVjwXYyeAFg=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=Alupxc4sPtRNiP6TqM+1ZwTnmpy2EYHMwjf+pXpH/tovXeYgNoatQKJ66Z6gHsj63Eqx29/7feAmFqTYK5YU6yB5sGS8EcmLkle2MjjW+rNtMJZBn3/QTc8KY09smm5LB14p+gBd253+aqYMNs4Hl0lxgE6dslF2a0FhmY+Vyro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=symple.nz; spf=pass smtp.mailfrom=symple.nz; dkim=pass (2048-bit key) header.d=symple.nz header.i=@symple.nz header.b=1eAjXquN; arc=fail smtp.client-ip=40.107.40.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=symple.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=symple.nz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jw5x4FGAVA0fAMy4qfny8OVLbdXEaKsL6x1hEefagD6eGJPEsqmUrniSRBVVPV8DIlPMrLQ36hfFOK1bO62QW34Y2TJJiSaQ46MhsyMQMfCzIVXHBvQxkjxNc1lrBqIE8nWWR14+lH1uP3djlcq6fgeSKryGj//8FCseaZMbIaglCgiwCYLbJSipr4cpG9Ab1gvpNi5TOipu9uRa3qP56VpDpQkT0CMTfgqSNwWIyk9cKUUJ1ZaBEBbU8uBmI/CIUQCqgfITb406xn908Z7QZ8xMjG3Ot0K+/Umz+/9j1EMi0su7o0DNw7ee668X8NixA0BGpWJJWtqYMgVetm5VNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlJz7yZ+7J4PRsASb0vXJBJDjpDGkq3jtxVirQ9+YoA=;
 b=c7y+CsORFbzOB8PNiY3QZ60ecYtBzLZViR5iWGtHe5qp7at0vJpcNigQwv3Ax5VOJBgWZKa/s6rVNLTmpGxL76rWU+8oXXyX/lPDH/cj7l9TdWme8/cQcj01efjLoD2rlNsz0kLVFCrwjEz6vJfp1d/CWy1r+Xf3l5ju7NTnhCNtKw9pXCZxG2yCC2ZXHtEQkt0zU/vvyI1JmMK0mCjjkfv4dN7ShJPygCwq5bu6yjetdN4Ew6yHPua2zFRMIeXAA7AQOscG3a/9WiSg276hMP9Ynyiap6AH0LlYO74hPc1QvNl6yIw32drBYXsyjJOUYj4uik/ovBp2+J5hgWULtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=symple.nz; dmarc=pass action=none header.from=symple.nz;
 dkim=pass header.d=symple.nz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=symple.nz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlJz7yZ+7J4PRsASb0vXJBJDjpDGkq3jtxVirQ9+YoA=;
 b=1eAjXquN/AGsamGQhiMKV41KdKC0XI0PyeuDrJfN5P5vLztuAjnB0v7XDDT4/5KwkHsFtUGtOVCi5fyjB0naeT08+KBa8Cdhnk4o1qzMDUbt9bJAGx6fl8gHz6WmEzRVN7XrNLxdJUOGURDVCoTD2zxOzrt8QZnuia0gXq+XlDkoQXc+VUfM9964A3LTSDmWYs/GWqkktSbFO3baTBGtIp4go6PAfVHRf3cGItTSGtWpoDs5AygEfJ80wt5rWnBJR5w5zS6sjv7rouoLRlwUtjYY37NhkcKyjswJ3jbexlIUC1XrF0Cr2bzpSHoesRwP3SuV2p/xnSXlxusk8n5rtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=symple.nz;
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b2::11)
 by SY5P282MB6373.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:32a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 06:20:28 +0000
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834]) by ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834%5]) with mapi id 15.21.0025.016; Fri, 15 May 2026
 06:20:27 +0000
Message-ID: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
Date: Fri, 15 May 2026 18:20:25 +1200
User-Agent: Mozilla Thunderbird
Content-Language: en-NZ
To: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
 Detlev Casanova <detlev.casanova@collabora.com>
From: Simon Wright <simon@symple.nz>
Subject: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5PR01CA0003.ausprd01.prod.outlook.com
 (2603:10c6:10:1fa::16) To ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:b2::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2196:EE_|SY5P282MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: def47cf1-1ff2-43be-64a1-08deb24a0e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2nVqXaWOgfrScU3De6DX7tz3n9iQcP/AlQZj3DspKKd1gebWZlp41xP6utDzlVZgO++Txp9wVZaatpIf0ppz2gSRS20kYFo8CpdZuyfGZVVaE9pI1yWKL8lD8uWyqgOFQqZLKoWZQmabmSPg5b5BEDUVYk5s28NKwOi7TjhKpDCEqDl2UYKgE0SGVnVEn0gpgz5LPD4EaON102c/1el2pOxYR9hvfGk0yvOlLeIKtbqUwS1RM5kK2+v1RfvJYwJSnnzwXgo2gHG4pJZek13tnL0Im7D7iJ77XXqBZUnsnKL4HqBBLR8NxL+MoSmWUaQoVhuUKySY9j93VwVY944XYq6mT1bLobU5SZvd1cXRXGeNSPycfZNNB2Y5c2acluiqtt+jgB6v0SIClSik+ynrG3sCPPfJkycU2qsw5seXbO5IIf1MN/ueBb1eGhlh0KtUl+O6DQW+x5+UqxzKeR9upnIlydo+9iIrBl2Ukzo1WiKEy/Yrow5t0iIj9yQBkINmXmzGgyDjHWgsAu76LW0kYEVEvE4fVmy0FKrNzjq++Ct9ScSOUdOqrEiGB/V1nxtMax18pjeZUr7danh26J02jQDz8Agm9FVJ/ly3spby3t9dQ1DUIr3EPrp+uN+cMRBn4J//ZKXr8XB0274e33i1paIou3vn9eMxE5yp6NqQ9tU99+UQW883iGby3T3eIFHc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(3023799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVk3VisrT243QzFoNjM5TWdtb2JxbkNKOXRObmR0UmM0Zng5NFZwUERXMWFC?=
 =?utf-8?B?OTNTMXNITlNJWWV6Y2NnamtJTnU4M2pxQUhNR1FqUWxKVUdSMkV3QkxyUlFs?=
 =?utf-8?B?V1BUZXJuMEQwWVc4V1I3ZlJLSUIyZHVuSGVzMHB4ai9YaWVoSUZGS0VDT2px?=
 =?utf-8?B?QkNWUGtaR3I3OWVlbG1XQjVOZ1VvRlpuSmdwSnR5VmM0UDZBTEZsbFpCZ1lp?=
 =?utf-8?B?MFhkNVVaMVZiTmNhVk92eXk1MXJuOUlUSUxlcUoxK1MwalZ2VlVnVkd5ZENK?=
 =?utf-8?B?cW16UFlOc0ZSZnA5bzQ3RFVhL0s2VnhnU2pZWUtiZC9kR2R1QU9sZXhMVkZC?=
 =?utf-8?B?QmlUSWxPcHpVUWdRRTJIVzFmNE04a0VZaSt5MzNDUkRyMEV0TEZITG9BTkpj?=
 =?utf-8?B?b2Q5K3pPdi9vTnBIcXRKOGxEMVpLbFVRd0tXOHlIVGtBdGo2QVFqaWdQdjdz?=
 =?utf-8?B?ZjFqdjI0d0lsQlRVY2hpODd6UFdNMzR1Mzh3eVhLTkFOOXRHTXdUVHpwUTg4?=
 =?utf-8?B?WnJiOURFWFNoeGVKcWJkRi9aNmJuejFPWnd1QzFYdlZpMk15R05lTDl1U1ZP?=
 =?utf-8?B?eWFUSWhyRlZFS1JHMWlZTTBnQXpFbEtNeHpDalozbVFTOUpwaXdsWkE1QkY1?=
 =?utf-8?B?TE0wK1I1bk8vNWxjYzBvSk5tUzNTY2dTVnBHWUF6OHV2aDRuWUdjaXBNaDh1?=
 =?utf-8?B?ckdoR1NJZTdIaGRtUTNQRHpLRDJlRURnekx4MGc2ZFJuenNPY0tjREx2NXhp?=
 =?utf-8?B?TWNpK3ZpS1BUWTNNcmdmRjd4OERpMHlmZzRBaW00YVZZdUh3NEhQSjliSjM2?=
 =?utf-8?B?bUlHYnU3aFpNOEovMXFuSjQzZkMyNy83VWUybUVwSEtWUXFWU1BwWmZ3K3FW?=
 =?utf-8?B?WFNSblh4dGpOYzExWmNLeVh0MWJuNjNESXFvamgwSTd6dC94SndvTTBLSkRw?=
 =?utf-8?B?SFcrWmtqaGlaUDNLc1RYUGVPT3Bxdzh5b3ZSSW9YRjFCcGNNUE8zS1JqUHlG?=
 =?utf-8?B?azVtNDNra3JLWmJ0aGFOdS9JSjRBTnNjbzJVUDVYaHYyWHVSREhZYzlrVzJr?=
 =?utf-8?B?N3BOdDBtaFIvaUpvWUxCMllOb0lXL2tmOEkvRTJvOEF5ZkFnL28rRlpCckRE?=
 =?utf-8?B?NDVSazhsRjh0MHBIeHhVR3Q1c1VjV1NMMXFZUTczYTNNSzJGclQ5SW4wVmhO?=
 =?utf-8?B?ZEVaTG9EanJPQkttN3hGK1VXaTJWbTZOamRYRzd6cytzSVJpZmdFcFdWWFR4?=
 =?utf-8?B?UXZ3WXBoclJXZ0RTNVFUdGpFZ1N2eVE3eW5YTnpkdjVUS0JiRFg4cHBnV2pw?=
 =?utf-8?B?bzA4Mmo3b2hQNDUvd09QSnJ4R3hrY2J2bU1ZRThwRmljZDMzQk42RS9HT3I4?=
 =?utf-8?B?WGpBTGFZbml5eE8wamY5MldNakRJWFNjTXRYODdjQlQxNHlXUUc3ZGpTVENv?=
 =?utf-8?B?azZINi9qQ3EweVovWG5HOFdNZHNKakxpOW1JOGUxc2ZlRndyS2hRVXFnWjE1?=
 =?utf-8?B?ekRiTDUrNm5VTDE0RDVJZkVLU3hVYWxDMGM3ZjdsbHcwaGxEV25FbStvZlVX?=
 =?utf-8?B?aTZMWDF3Q3N4NzNvbWt4KzJCVnQvMU5adDNIWWM5M2ZDZHVkbnlmOW9jbGcr?=
 =?utf-8?B?L3E1VHBmaUhYUmtmcXBMdmNaaGt3cm5YM2RwTjcrSkFreXhsQ1VNZFR1S0pt?=
 =?utf-8?B?enFQUG5MS2JFeWFmTEQ2UEQ0bFpVaitUbnNCVGJFVVRnUGY2cEhjWVRzUStm?=
 =?utf-8?B?SkFtUWd4NG9jemJEem5YM2lsdE55eDdEYlJzdWhqamlrSmcvMlBrUUppa0Rk?=
 =?utf-8?B?N2tZYkt4TDZUb1hGS0VrWExaN1pNdXhDcm9zeDlSSnFwMGJxU2ZSaUVlUHhk?=
 =?utf-8?B?YWNBVTZSNnR3bFdFbEhVQWhqK3JuYlZpM2g2Z1VUNlNRL0RmbWxPSkpTSGRF?=
 =?utf-8?B?UVM4d096a2dtTG9QRGdJUmZWelBSZklsc0VNZDNSQW5NQm1QaitUN1k4bnd1?=
 =?utf-8?B?WExJOU9Tb3dOWEV5d0VoZitPY3JZaGVoSjc4OHkvbUNRRUNoSTFMS21VQ0ow?=
 =?utf-8?B?K3paOVNsL1czeitybFd1bHJjUUx3TncweW4vbi9idjkzTktEbVN0R21Kd25Q?=
 =?utf-8?B?TDhhdFQzODVzeG8xWjM3djJpbnB3Q1lFd1NaNEJMaXdETFJCNmgwNHRmQ2kw?=
 =?utf-8?B?dElsMStzNGRUUlQrMUFXSHpPVlFGUjVWdFdWL1R2b3hPTjhtU05mTFJTWEtt?=
 =?utf-8?B?RlY4QmNkQ0R4ZjVlZ1B6VnF3MzVXTGdBQ295c2dpaVJpZHoybm8yR3U1QlNB?=
 =?utf-8?Q?722RQ28FQsV5uxboIX?=
X-OriginatorOrg: symple.nz
X-MS-Exchange-CrossTenant-Network-Message-Id: def47cf1-1ff2-43be-64a1-08deb24a0e7e
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 06:20:27.8163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9531f271-068a-4210-b471-bd8da91491c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOFsv1j6bWqzz0sFzXQzCvbkFxqkrdPUucKRj86X8LPPoc8rhaqrXqeosMmO/sO7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY5P282MB6373
X-Rspamd-Queue-Id: B39DE549F7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[symple.nz,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[symple.nz:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61634-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[symple.nz:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simon@symple.nz,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,symple.nz:mid,symple.nz:dkim]
X-Rspamd-Action: no action

Hi Detlev,

I'm seeing systematic pixel corruption on VDPU383 H.264 decodes on 
RK3576 (NanoPi
R76S).  The decoded luma plane is correct for rows 0–3 and row 8, but 
wrong for rows
4 and 12 (and the corresponding rows in every subsequent macroblock 
row).  The error
propagates to all following P-frames.

I confirmed the mismatch is in the raw V4L2 CAPTURE buffer two 
independent ways:

   1. GStreamer v4l2slh264dec output compared to avdec_h264 with no 
videoconvert step.
   2. A hand-written Rust V4L2 decoder that submits only 
SPS+PPS+SCALING_MATRIX+
      DECODE_PARAMS (SLICE_PARAMS returns EINVAL on 
VIDIOC_QUERY_EXT_CTRL on this BSP,
      so the control set is the same as GStreamer's actual submission) — 
identical
      20.3% mismatch at the identical first-diff byte.  This rules out 
any GStreamer
      post-processing or control-submission effect as the cause.

Hardware:
   Board:      NanoPi R76S (RK3576, VDPU383)
   Kernel:     Linux 7.0.1 (mainline rkvdec-vdpu383-h264.c, unmodified)
   GStreamer:  1.28.2 (with v4l2slh264dec from gst-plugins-bad)
   Content:    1920×1080 Baseline H.264, SMPTE colour bars, openh264enc


MINIMAL REPRODUCER
------------------

Generate a test file (any H.264 Annex-B with visible content works; I 
used openh264enc
with SMPTE bars):

   gst-launch-1.0 videotestsrc num-buffers=60 pattern=smpte \
     ! video/x-raw,width=1920,height=1080,framerate=30/1 \
     ! openh264enc ! h264parse ! filesink location=test.h264

Decode via HW, capture raw NV12:

   gst-launch-1.0 filesrc location=test.h264 num-buffers=60 \
     ! h264parse ! v4l2slh264dec ! 'video/x-raw' \
     ! filesink location=hw.raw

Decode via SW, capture raw NV12:

   gst-launch-1.0 filesrc location=test.h264 num-buffers=60 \
     ! h264parse ! avdec_h264 ! videoconvert ! 'video/x-raw,format=NV12' \
     ! filesink location=sw.raw

For a 1920×1080 NV12 frame (frame 0), compare the first 3,110,400 bytes:

   cmp hw.raw sw.raw

Expected: identical.
Observed: first mismatch at byte 7680 (Y plane, row=4, col=0).

With SMPTE bars (white region at the top), SW Y[row=3] = 0xe9 (correct 
white-bar luma).
HW Y[row=4] = 0xaf instead of 0xe9; HW Y[row=3] = 0xe9 (correct).
Overall mismatch rate: 20.3% of bytes in frame 0.


QUANTIFIED EVIDENCE (frame 0, IDR)
-----------------------------------

   SW decode:  Y bytes [7680..7695] = e9 e9 e9 e9 e9 e9 e9 e9 e9 e9 e9 
e9 e9 e9 e9 e9
   HW decode:  Y bytes [7680..7695] = af af af af af af af af af af af 
af af af af af
   First diff: byte 7680 → Y plane row=4, col=0

Error propagation:
   Frame 0 (IDR):  20.3% mismatch, first_diff = byte 7680 (Y row=4)
   Frame 1 (P):    23.0% mismatch, first_diff = byte 253 (error 
propagated to row=0)
   Frames 5–30 (P): 25–26% mismatch, stable

ANALYSIS
--------

A diagnostic experiment implicates the filterd_rcb buffer (RCB index 
6).  Redirecting
filterd_rcb buffers 6, 7, 8 to point at the output buffer produced 98.4% 
corruption
with first diff at row=1, which indicates the hardware reads p-side 
pixel context from
filterd_rcb (rather than from the reconstruction buffer) when applying 
horizontal
deblocking.

Based on the error pattern, our hypothesis is that filterd_rcb uses an 
8-row circular
index (slot = row mod 8).  If so, H.264's 4-row deblocking boundaries 
within each
16-row macroblock row would cause a slot collision that HEVC (with 8-row 
CTU boundaries)
does not encounter:

   Edge y=4:  p0 from row 3  → slot 3  (zero-initialised on IDR → wrong)
   Edge y=8:  p0 from row 7  → slot 7  (written before this edge is 
reached → correct)
   Edge y=12: p0 from row 11 → slot 3  (still holds row-3 data from the 
y=4 pass → wrong)

This would explain why y=8 decodes correctly while y=4 and y=12 do not.  
We don't have
hardware documentation for VDPU383, so we can't confirm whether this is 
the actual
mechanism.

We tried several register adjustments hoping to change the filterd_rcb 
update granularity:
ctu_align_wr_en (reg027), buf_empty_en (reg009), ref strides 
(reg083–106), and
num_views in the SPS table.  None changed the corruption.

Is there a known configuration difference for H.264's narrower 
deblocking edges, or a
BSP-level fix we've missed?


ATTACHED REPRODUCER
-------------------

The C program below (builds against GStreamer on-device, ~100 lines) 
automates the
comparison and produces per-frame mismatch statistics:

   gcc -O0 -g -o h264_hw_vs_sw_dump h264_hw_vs_sw_dump.c \
       $(pkg-config --cflags --libs gstreamer-1.0 gstreamer-video-1.0 
gstreamer-app-1.0)

   ./h264_hw_vs_sw_dump /path/to/test.h264

--- BEGIN h264_hw_vs_sw_dump.c ---
/*
  * H.264 HW vs SW byte-level comparison via GStreamer appsink.
  *
  * Decodes one frame of an H.264 Annex-B file via two paths:
  *   SW:  h264parse ! avdec_h264 ! videoconvert ! NV12 appsink
  *   HW:  h264parse ! v4l2slh264dec             ! NV12 appsink
  *
  * Reports first divergent byte, mismatch percentage, and unique Y 
values for
  * both decoders.  If HW bytes differ from SW bytes, the bug is in the 
kernel
  * rkvdec-vdpu383-h264.c driver.
  *
  * Build on device:
  *   gcc -O0 -g -o h264_hw_vs_sw_dump h264_hw_vs_sw_dump.c \
  *       $(pkg-config --cflags --libs gstreamer-1.0 gstreamer-video-1.0 
gstreamer-app-1.0)
  */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <gst/gst.h>
#include <gst/video/video.h>
#include <gst/app/gstappsink.h>

typedef struct {
     uint8_t *data;
     int      width, height;
     size_t   y_size, uv_size, total;
} DecodedFrame;

static void free_frame(DecodedFrame *f) { if (f) { free(f->data); 
f->data = NULL; } }

static DecodedFrame *run_pipeline(const char *pipeline_str, const char 
*label)
{
     fprintf(stderr, "[%s] pipeline: %s\n", label, pipeline_str);
     GError *err = NULL;
     GstElement *pipeline = gst_parse_launch(pipeline_str, &err);
     if (!pipeline || err) {
         fprintf(stderr, "[%s] gst_parse_launch: %s\n", label, err ? 
err->message : "unknown");
         return NULL;
     }
     GstElement *sink = gst_bin_get_by_name(GST_BIN(pipeline), "sink");
     gst_app_sink_set_emit_signals(GST_APP_SINK(sink), FALSE);
     gst_app_sink_set_drop(GST_APP_SINK(sink), FALSE);
     gst_app_sink_set_max_buffers(GST_APP_SINK(sink), 1);
     gst_element_set_state(pipeline, GST_STATE_PLAYING);

     GstSample *sample = gst_app_sink_pull_sample(GST_APP_SINK(sink));
     if (!sample) {
         fprintf(stderr, "[%s] no sample\n", label);
         gst_element_set_state(pipeline, GST_STATE_NULL);
         gst_object_unref(sink); gst_object_unref(pipeline);
         return NULL;
     }
     GstBuffer *buf  = gst_sample_get_buffer(sample);
     GstCaps   *caps = gst_sample_get_caps(sample);
     GstVideoInfo vinfo;
     gst_video_info_from_caps(&vinfo, caps);

     int w = GST_VIDEO_INFO_WIDTH(&vinfo);
     int h = GST_VIDEO_INFO_HEIGHT(&vinfo);
     GstVideoFrame vframe;
     gst_video_frame_map(&vframe, &vinfo, buf, GST_MAP_READ);

     size_t y_size  = (size_t)w * h;
     size_t uv_size = (size_t)w * (h / 2);
     DecodedFrame *frame = calloc(1, sizeof(*frame));
     frame->data  = malloc(y_size + uv_size);
     frame->width = w; frame->height = h;
     frame->y_size = y_size; frame->uv_size = uv_size;
     frame->total = y_size + uv_size;

     uint8_t *y_src = GST_VIDEO_FRAME_PLANE_DATA(&vframe, 0);
     int y_stride   = GST_VIDEO_FRAME_PLANE_STRIDE(&vframe, 0);
     for (int row = 0; row < h; row++)
         memcpy(frame->data + row * w, y_src + row * y_stride, w);

     uint8_t *uv_src = GST_VIDEO_FRAME_PLANE_DATA(&vframe, 1);
     int uv_stride   = GST_VIDEO_FRAME_PLANE_STRIDE(&vframe, 1);
     uint8_t *uv_dst = frame->data + y_size;
     for (int row = 0; row < h / 2; row++)
         memcpy(uv_dst + row * w, uv_src + row * uv_stride, w);

     gst_video_frame_unmap(&vframe);
     gst_sample_unref(sample);
     gst_element_set_state(pipeline, GST_STATE_NULL);
     gst_object_unref(sink); gst_object_unref(pipeline);
     return frame;
}

static void compare_frames(DecodedFrame *sw, DecodedFrame *hw)
{
     size_t n = sw->total < hw->total ? sw->total : hw->total;
     size_t first_diff = (size_t)-1, diffs = 0;
     for (size_t i = 0; i < n; i++) {
         if (sw->data[i] != hw->data[i]) {
             if (first_diff == (size_t)-1) first_diff = i;
             diffs++;
         }
     }
     if (!diffs) {
         fprintf(stderr, "MATCH: HW == SW (%zu bytes)\n", n);
         return;
     }
     size_t y_size  = (size_t)sw->width * sw->height;
     const char *plane = first_diff < y_size ? "Y" : "UV";
     size_t off = first_diff < y_size ? first_diff : first_diff - y_size;
     fprintf(stderr, "MISMATCH: %zu/%zu bytes differ (%.1f%%)\n", diffs, 
n, 100.0*diffs/n);
     fprintf(stderr, "  First diff: byte %zu -> %s plane offset %zu 
(row=%zu col=%zu)\n",
             first_diff, plane, off, off / sw->width, off % sw->width);
     fprintf(stderr, "  SW[%zu..]: ", first_diff);
     for (size_t i = first_diff; i < first_diff+16 && i < n; i++)
         fprintf(stderr, "%02x ", sw->data[i]);
     fprintf(stderr, "\n  HW[%zu..]: ", first_diff);
     for (size_t i = first_diff; i < first_diff+16 && i < n; i++)
         fprintf(stderr, "%02x ", hw->data[i]);
     fprintf(stderr, "\n");
}

int main(int argc, char **argv)
{
     if (argc < 2) { fprintf(stderr, "Usage: %s <h264_annex_b>\n", 
argv[0]); return 1; }
     gst_init(NULL, NULL);
     char sw_pipe[1024], hw_pipe[1024];
     snprintf(sw_pipe, sizeof(sw_pipe),
         "filesrc location=%s ! h264parse ! avdec_h264 ! videoconvert ! "
         "video/x-raw,format=NV12 ! appsink name=sink", argv[1]);
     snprintf(hw_pipe, sizeof(hw_pipe),
         "filesrc location=%s ! h264parse ! v4l2slh264dec ! "
         "video/x-raw,format=NV12 ! appsink name=sink", argv[1]);

     DecodedFrame *sw = run_pipeline(sw_pipe, "SW");
     DecodedFrame *hw = run_pipeline(hw_pipe, "HW");
     if (sw && hw) compare_frames(sw, hw);
     if (sw) { free_frame(sw); free(sw); }
     if (hw) { free_frame(hw); free(hw); }
     return 0;
}
--- END h264_hw_vs_sw_dump.c ---

Thanks,
Simon Wright
Symple Solutions, Dunedin, New Zealand


