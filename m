Return-Path: <linux-media+bounces-59527-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI3SLzBm62mtMAAAu9opvQ
	(envelope-from <linux-media+bounces-59527-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:46:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5CA45E9F7
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17BA5305C49A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0633CF67B;
	Fri, 24 Apr 2026 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NEqO1q6f"
X-Original-To: linux-media@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020100.outbound.protection.outlook.com [52.101.196.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FF3CFF4A;
	Fri, 24 Apr 2026 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034629; cv=fail; b=t8WrVHSLumHfuF6G82PjXVQSKcF2OujjH0ROnl4vruK2Qnn/s7sJZFRCV8Q6IB8O1aOrLNXMHFI7LvNaq3rFd65XhWxapuGszINhF0YhGOvn+nONDWWujTwkrdDA/Lkv9g9bnBsOROOJlt5M/13v5dB0WLrxSaxqccH1VBxx+mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034629; c=relaxed/simple;
	bh=yIYC1j6UaAYb6UMV2endYCAe+t/8wtUdTmoF7hhMa8M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ud3kKfj69m4al51DgrBPhkVKEPTh+3FkUH/qeRjrDz5YInNba9S2bVZ6n1tRxZwGUI4i4rae7inZY339soG7GfCR2XnIdRbYw60ddJQ+Zekva4iQ12pUcR/PyAB/ztwMmKN3ycOvcQgwtj3mFvLUdguiPwMHRYgJaGK2LGXmUoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NEqO1q6f; arc=fail smtp.client-ip=52.101.196.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NigBRx1yEkVD33IbDA4vFt4eHJUN1TvF0X6D2JG+40c5YJ/fXwNLs9Di5O0dlgmjZFuWwvIIcjNv87ptlFqpGAn75z5sa9pOIXEl13SUzrv2onUgkr74mM5xwnIvj54nvWQk72mKwJD3R+MeodsRa1CHAQcCi3YQrDJfuFaCeuWaa04dSdgNyuelzAIVbrIGN96WN62q1rNCyqu3jsgf7C3g5MXjTtwx0Sb1GJ61jppWl8ru0naZU1x5+qy7xjoaxiIiFv8HoJif7UYttqQ9he5DIs4TDc1/BqJYU0Zzt9VuS1RAHRzeru5RJUDKi89kEOfIn+HyzIRJ4RoPUALvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM2KVpbeXVKYgSfEiEsPee0AccJ+OUQ3jbc1h7inrC0=;
 b=hFamBzZUeedjkS7Zf1QtkFDqv6yGgn1yZDWBul02fnEERgNe6suDnXpHyq92ClUa4XCh7idWEqS2SC6JwKW2LmX7APxZ6ZBLD3y3LwxjlxgRl3cIoCjQ9q/0RY3WhcLQoz0gbT1muUjj5r5KcJCsRBy9msGiwxRMBF+04pSlEbQJsPymGe1YmlFniW9zeiiSC33JPFAECgyHwKyWImj9xAgxnUoGgrpKjDhAnQhnvI9V4FkEcdr3BaAbRMzz9C5fHTA48DNGpNf3OzUI7Eh1isM3Bjq5IUVfgbZ4mK2fsbE8disa6A1FKHVw7bleE6eB1G+U7wDZqrg91yoaayPAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM2KVpbeXVKYgSfEiEsPee0AccJ+OUQ3jbc1h7inrC0=;
 b=NEqO1q6fN+YFKLS2FZBm37UU1P1kOOZAG2BVDmexX5j31Sz1eHLhrEJ9K9RXqcXwtqxxi8qdOw5gWSTQrO2Agxx8gcMtDWNNW9y2UXUvDf9LFIirZwyYyLv7uRdiaDH7tmaBO9wWi85sTrN2FmJezSooNALesP9SkpLVLDlOI3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7026.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 12:43:44 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 12:43:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 13:43:43 +0100
Message-Id: <DI1E781QPU8F.1C28PL0089NP6@garyguo.net>
Cc: "Link Mauve" <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
From: "Gary Guo" <gary@garyguo.net>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 <maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
 <chleroy@kernel.org>, <peterz@infradead.org>, <jpoimboe@kernel.org>,
 <jbaron@akamai.com>, <aliceryhl@google.com>, <rostedt@goodmis.org>,
 <ardb@kernel.org>, <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <nathan@kernel.org>,
 <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>, <tamird@kernel.org>, <arnd@arndb.de>,
 <nsc@kernel.org>, <simona.vetter@ffwll.ch>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
In-Reply-To: <20260424054742.45832-6-mkchauras@gmail.com>
X-ClientProxiedBy: LO4P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf2ce5d-0c7e-4354-218e-08dea1ff1ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qZxuI9vt5qSeLsyrg9zmyJOM/CEX42j7kuAUtj8gBfLFAU38bw3Oae3ceSTgI6jh+sfFJKFIl28itXW5SS2Ubcuft6krOLaAqX6wlUr2XRq2u+HJghwErPBSzf0wedOoJHXPGmnbCFqYNr4q12AsQmTrFvjR2rAzLaaFmWmRn/UbbOvrLj2V/+fy1DfEBFGcKeIW8LPS707iJXyarkkhbiWIz3pvoHSPGVu+Q3TzbwTk2oD3KC9HRvtHlFtv5nydOTcG2JVdRayes42fMfaF9O64XmIh0KrkPiLX/G2JWP8FpL+MhQqrzPUynUZdP1mdCDJRuqfHJC04KxExZ0XBPV1C/vzfgW7nrevjdQno9pM9Hr5ZeFIPIIFefTomna5Wp5C4RaJcBkXbPtK4i3KmP76I/nuRZnK7yYqRvG3hsgKW37hrYQfRQxIAfhu+bK3q2mW4wIoQoZnWe+fvAh63ujEVJXDioNO9pvop5s4h/FUzdjxd49dqIp760z84ThMFcCNubJpMBURW27kSP2WdXsy38e5VedJYcjTHXENAnBcoV54kjPTQNz87nVbDqs/h4e+hjNKyCHklwxnsva/fkFFRxQYgGgFwbU6GgwJZB8W4Nz3mScVa1YPBMOldxjtkHYonQhHB1TNkKPjY2Dz9GAZp78Sg7Y/raDgLQKUTz5I26lWn2J7zGMiNh9+/UIM2JuiIJLoF3Uh7QdjeyQk5ge86kOIon6RRJrdpsdIqL4FqeZCHuAeQx3wHz7yEjiwbbcZU2wEyhAwFRgW7EKp9BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDdVTTRJYW1VU3pTU2JyWXdmWUNDQVpIbVd6RnlYVnlLa0VYT3kwK3RRditU?=
 =?utf-8?B?YVBIRFlSUjcvS1VIR3YvM2dOR3g3bFpTT2haWUdRYVB3anM5bnd5ckpuVDNx?=
 =?utf-8?B?NkgzWW9QZ0NPbjQ1V0xGY2xDd1BRV0hDbFlKSHhMZUR0MU04cGREMDBQb2R1?=
 =?utf-8?B?NjVENkRDcTVFR1pCZUJ2ZGdVUTF5WjNTdlRub3Z1UjVkTXg5bjU0Zm4rOFpD?=
 =?utf-8?B?eSttaTJqUE1UaDB2UlE3V1d3ZFRiZHhtWUxXT1dvejNwTFA4VitDWHY2eHAw?=
 =?utf-8?B?NEhoVXQ0WVE1WjRKU1g0WVVDOUIwTUdmSWZuMFFUR2paRjlERCtmSU1tMGVl?=
 =?utf-8?B?ZmlhRWxEb0lWSEg2eXRRUEpMb3lRdHJaUVRORnp5UlJUWnpVdGg4UFZieXdh?=
 =?utf-8?B?NnJwVXdBdHdTa3h2bWZ3WmJydmJoZlNjS1p6NVpBM2cvNGlRbUEvNkdicTMw?=
 =?utf-8?B?Nk5QVEZVQ0lRR1JrQmY4RUV3aUZ6SDFDN0kzaGFjZnk3YlVjQnoxeE8zQXp4?=
 =?utf-8?B?cE11b1BtT3MzeG9GSDlpVXJPdG85L2F1aERaMGR1MG0xRkg4RDJxNDdKK3Jl?=
 =?utf-8?B?ZEQwTVVOSkduK0pnQXEvU01FS1hVRUdEWmpIRnFVdm5ySlNYMlJtelVLM3Fz?=
 =?utf-8?B?QW12T0N0NkhhTk1wSXJ4SjJaRGUvWDB1MmV6bUZHaDhvRnNzbUdHNmtsUmtN?=
 =?utf-8?B?TjhhQTFaUlY3ME04TzdIQWZsenFLYzJHVU50RVdWN292M1lVbWcwck1QWkFP?=
 =?utf-8?B?c2NNaTR1RG9WZFlNUkpJVnRwWDZ5ckl5Wnh5c2hjVlBLc3lIOTNXWGJ4VFJV?=
 =?utf-8?B?anVTVlkvUHY2czljSHBsSXI5R2ZhVWczRmVuREFlaDhrQVZQcjBsbTU0Sk81?=
 =?utf-8?B?Y2hRMXBvOVpJdGlGbDJrQjJBMGk0dzJqNzhqMWNrWExzTXRjL0ZxTytBcURW?=
 =?utf-8?B?YklaZElTMFdkY0VHVS9pRDhRc3AyanpER0FraUJCRlJFS1BRd3FwWjRSOUxw?=
 =?utf-8?B?bkI5UEgzS3BhKyt4ZjE5bWdmM0Mrc0VXTXZvV3paRWxyUmFRODRSY21QTG9x?=
 =?utf-8?B?cWRvbkJmdVVEaEw2ZWdGV2t2aHBJUFhzWEIvaGVLMUlCcWVKUERwRUNLMEtL?=
 =?utf-8?B?K1BqVU9HTnVnL01TWFpGU1UrdEZiaE90ZXk4NjUvSUFtRERVT0FVWFd6aXJZ?=
 =?utf-8?B?U0NZdjZuVlRIS25xc0FIRzZSSXpobHNhKzg4WnlaUHZCc3BETEJLekNBMjVE?=
 =?utf-8?B?K1ZFemZEVlN6OGRMUVg3Q09EbHo1azRMd3VkRTkyckdxRDg2aXB6ejFFaDNz?=
 =?utf-8?B?TXJCYThId1hOU0UyMXdnU0ZPSnFmTjNRclg2NExhSk5vQ2haNjVPcVVpRllv?=
 =?utf-8?B?Ti90VnkvdmhtNERDMGN2SVhxMkMyYWlPREhrQTdqRys5KytmNlNDWVh3aUp4?=
 =?utf-8?B?Q1lKa2ZsZG15YUxsZUFnUjZMVy9zRUNkbDRsVHNDUGFDMXdMZ0s5Qk5kZjcr?=
 =?utf-8?B?WFIrcjN3SnNIK0tGdmxMUUZ4eFNHUFhuL09DdHpJREVqWnI4YlRpM3VnelVE?=
 =?utf-8?B?M3RIcHlYWWJ0c0ZNbkJsVkRwUlljb1pvNVVUNjVxMjlpQjFuMmhjcU9LMGln?=
 =?utf-8?B?eS8yeGxINUFqVlh5S0V3a1djYjFQT3grT28zTWJYQ2JFdG5YOUo3VFFvekxB?=
 =?utf-8?B?RTlxWGFjSC9oVTh2a1d6RHMwZ2NxcGtoOFJzV3JLdkxqNlBpR1Q0SkhXNVVQ?=
 =?utf-8?B?bzVIZDh4bTVjU2o1bUlxdTJYZTYrYXZwbmFlVGYrdmRQN2JzUXQ5YlI4ZmIx?=
 =?utf-8?B?LzAvS0tWdmhTbFJremppSzgxNk5QSjFPWjRaZTN1N0xTUERlZUhRKzdrM0kx?=
 =?utf-8?B?bEZMZEdHdmloMHcwcC92ZFBiV0xJL3dOOFRUQVNWaW00VWNjWHRPdjFCZTdz?=
 =?utf-8?B?U0lZL211NWFTODJ3K1ZPZWVRVHBHWFpnaVA3VWc0U2N1UmlDWU9MRjdXU1FH?=
 =?utf-8?B?R3M5VjZ3cS83QjZMSXVOd1puOWFkZmFQdTJlV1ZrOEUva2ZRV21VWGtiRnFu?=
 =?utf-8?B?c290TTZwNGNpVEVwK3dkOVg4clRvRHpCZDJsWjFvWTFqbzZHY3N0RFlteWNZ?=
 =?utf-8?B?MXB1SzNjSTRwUUwyMVluc255cGhNOXVlbFBkL0VZeHZYeGpMSnUzZWpqN3k4?=
 =?utf-8?B?MlNjWTRLU2FKZllVNk5mMS8vY1pLY1lpUDF0amw1QXNDdktKSVdCTmo3allQ?=
 =?utf-8?B?VHNMQWxSNm1BWXlWTkFxUHRZc1FKQmtONFJjaGhQV1FBaDFCYlg3Zml3eEhQ?=
 =?utf-8?B?Z0JHUGFZNUlyclFPL3pTOVU4MDdPZzQ3MzhZbnRJTmkxVDVUWTlwZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf2ce5d-0c7e-4354-218e-08dea1ff1ee9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 12:43:44.1297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYzL+1TKZSabyrdAizLf0SgY/fCe51GNVaxudBMtsXwZ+zeR8n9ErHV4WLwE0vIkd0wm+6lAV1eTdy1/XTYL7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7026
X-Rspamd-Queue-Id: 1C5CA45E9F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59527-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.ibm.com,ellerman.id.au,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:mid,linkmauve.fr:email]

On Fri Apr 24, 2026 at 6:47 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
> From: Link Mauve <linkmauve@linkmauve.fr>
>
> The core crate currently depends on these two functions for i64/u64/
> i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t use t=
hat in
> the kernel so let=E2=80=99s panic if they are ever called.
>
> This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udivdi3 w=
hen
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the kerne=
l
> build on PPC32.

Can we always build libcore with `-C opt-level=3D2` even if
`CONFIG_CC_OPTIMIZE_FOR_SIZE` is specified? It feels like a better fix than
stubbing things out.

Best,
Gary

>
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
>  rust/Makefile             | 4 ++++
>  rust/compiler_builtins.rs | 6 ++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 2a5428a5503d..ee11fba7a03d 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(=
CONFIG_64BIT))),)
>  		__ashrti3 \
>  		__ashlti3 __lshrti3
>  endif
> +ifdef CONFIG_PPC32
> +	redirect-intrinsics +=3D \
> +		__udivdi3 __umoddi3
> +endif
> =20
>  ifdef CONFIG_MODVERSIONS
>  cmd_gendwarfksyms =3D $(if $(skip_gendwarfksyms),, \
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> index dd16c1dc899c..fc6b54636dd5 100644
> --- a/rust/compiler_builtins.rs
> +++ b/rust/compiler_builtins.rs
> @@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
>      __aeabi_uldivmod,
>  });
> =20
> +#[cfg(target_arch =3D "powerpc")]
> +define_panicking_intrinsics!("`u64` division/modulo should not be used",=
 {
> +    __udivdi3,
> +    __umoddi3,
> +});
> +
>  // NOTE: if you are adding a new intrinsic here, you should also add it =
to
>  // `redirect-intrinsics` in `rust/Makefile`.


