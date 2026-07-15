Return-Path: <linux-media+bounces-67607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rqkcDDH+Vmo8EAEAu9opvQ
	(envelope-from <linux-media+bounces-67607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:27:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F175A43E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:27:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=KDIAK023;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67607-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67607-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E90E301C6F4
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8007A392831;
	Wed, 15 Jul 2026 03:27:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D5C42BC46;
	Wed, 15 Jul 2026 03:27:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784086059; cv=fail; b=cU0L9DcPJNlHBlcwTbzbHtrPs25rwOS5IiLuKUusKaCAX9l8n86Qh/4Uguri1X04HEUs8PHNQP2wm7JBaGZhsHiPAg5CzCFXvGkA5y71BwxlDuzfx6jV355pV3gwE7pbiljyKbyjGfgdS/PJ+0ONxc0N5i4j0ndvtVSZChUXMx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784086059; c=relaxed/simple;
	bh=I4NLlJkurKRU7m0Y8qFK7Ms9I/Tm2tNUUF8USw5aTYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=seRc6FV1R7mSl3ls4QiipAXicPhDpSRNA9DRsTcb0lUNM7jvZjf+gTAW9S+Dc7dFtfwdTuHy+QCayLfO9oXJhZLebbUv0wqxIjCaF2W/jiOVXYwBktysW7jCB5PzU1KBceLm8RPAyE9nTkbTn6jMF2RyH9lkwUuYL1W49ntGI1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KDIAK023; arc=fail smtp.client-ip=52.101.46.43
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8zIU7nudOUpNeqBJdrK0N87HXgJkA/yint8pmVxjBHCE/hIsGsKM+bbq33asVep0bZyih7gC/HOn/btnvDdJodNMdmLd7O8RcqDPRLEu2jZ6yU9L8uwz3Q64yV6RFPJqbGr5Z56OC+7GiKYKp4B2EY+lEFMGT6cg+mhaxwPdBiNLSuwlUOZ4cjR7CRgZVLJ/Eym0dmpaSwrmdjm0NRr9T1pwjXBTSkRwF+/2tjjly2GxRDhmAhUaY/t38LvPjZ1/0Hx9Ak9Y6S46rE6/HHR35YJxTGPdG2v6bWC5oHkcSSLkdR6OKMzd0UjHvPI4+tQfQ4EZVDlVB8SHtlyQcnJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9EQxZU1F0E6WQXbplurwvnbkVDRc9k8F1oxQQN94pQ=;
 b=OhUUwrlPgSsTCQly7vncXHZuiRzleZVQcXgPQz6P5n9tJFiS1a4WIkuOw7hwRH0K373Sy9ArvDMj5g5RaDGIOyuUZkVK45vzYElhgYz450YzrrqbWj6/CAUpfB6GAcAinYksgcxj4Fd1PVk7jU8igx6O0mAIUrev/1zaFAwAXJQPomxUAJ0HPo68G/qMgj2OL42PPa1YynSYwabZqZhTT5S6lyWaYMFhRV7beIhldLElBifUqIZpbqcLMRyb5A0cBwcPrZpBVwtwDKaI4sC/VAbpLAmsm8R5dhQym3gBME4hL1w6pHIZlclHo0Z/RmzM1bVw3Dj/Pz3tp+aVIsnT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9EQxZU1F0E6WQXbplurwvnbkVDRc9k8F1oxQQN94pQ=;
 b=KDIAK023Xu5X6HRLjCieQbLDH0gbA7Yzb2lqGHq3IXpMFqZqhOb07ZRppHg21xVtThBFHeOlEvj6/XBNMYVWIQMu4I15FosEjr17bblSYywrlbpQXiTNvpddO2JZzqOGC4JZrsalGwiwHc6yzJthyLaaeNioSzuxK+OQ9VTWuYyl7Bc/uLf3TWfo3opRlK+/landFV4JfH9BYJaNgZ6TZMi2pYTg8A9jMUBoNOiLPG4DoFZwajpSUn8TpvwFwkZBYKHvENNoAc5KVW7u9xE6dlJBNq/MOwOzkxqkjGy8esxJ7i9ipshe6dmfRzYOTd4Aeq4oV4lH/SuL8h0ogu1Z3A==
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 03:27:34 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 03:27:34 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Subject:
 Re: [PATCH 2/2] media: cec: tegra_cec: keep track of number of Rx Low Drives
Date: Wed, 15 Jul 2026 12:27:30 +0900
Message-ID: <VIvQevwZQZidfkUQnq4N4Q@nvidia.com>
In-Reply-To:
 <3d1d723b914c3ed8389a032ebbf791146b92133c.1783677198.git.hverkuil+cisco@kernel.org>
References:
 <cover.1783677198.git.hverkuil+cisco@kernel.org>
 <3d1d723b914c3ed8389a032ebbf791146b92133c.1783677198.git.hverkuil+cisco@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::11) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 768f3b4d-2477-4b85-b110-08dee22102c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mt6omuPkRA8VfCqAFLpSoTaosLps9Cm7kWR5wAzGtRH7oYo6ozga2sSaS0oRsW7UdRmq0LbHaovfB3H5NK8NBnI1trhl3NWh/jXJ97o4/8IOXh2ntRNDWaFmVLqliam1AhQiiuA3kYKSkYnG2KiIVtlnrYyuuYNf+QGPkTedgpWztouF/1jBlj5n8CKSCG3w++Jzy5TiCdwGjJs4y4fh3vnRYEGc0EBwes5eBWs14CH9ud9s+SuXmr3CW8/2coGCMghZVYTuDpJLYIUPplLP5BUniaYUsyyiVIxPDnAT9aBdylfMtz5MArOL8pWiKhYjZdg4Twv1dTTieZG8cRwEVSbiBh/YbgSrkZZrIFTXcXLdiV7s16lqX9Ep1dJKyL9+RbsPnSL7SzuHQZxa/lpQDuxOKNDYXajxeTKct/WaizMGbU2GwWd6wYm1FxwxYnTl2bPtSr6lLgRzZcgBik/ZZBJU0nnQa3DzBG073S5ub48EcoTPWPixMU1MyVhAS14Ce8PoagPiMW8dH9yKTS4BdHGd/iShdlvsf8F7I3IL/eWxgV7l7L/a3oSfjA21VhGlfTSVZfn424c8+ila+wIfAmzt7r/KuDtGF8CKUWXYoRpck+evug2WRtDR3TLXNdU9c/SbFWDVRt9L9KIJgaflwnRG+gcL8FGYRnEb8QYDNAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3VneEZQUHRHOFo0VFZLQW9DYXBlMHgyWjY0MEdWNCs0SXhDQVBkWGRubzdM?=
 =?utf-8?B?QkhMeEhzOXRpSXVidVE3TnlKQ0w2ZWFjTDArMktlS1hIdlVORWRsWXY4NG5J?=
 =?utf-8?B?TE42T3NvdklPWDVMVnRaemcydEdzV3ovNS9uSWdzOGRNczNkMk5mYWZrMjBH?=
 =?utf-8?B?Nm5ld0oxcktQOHVSNDdseDhCQWdHbElVNWJXY01FSEdLRW84Y1dkaFhTa0N1?=
 =?utf-8?B?eG1tNzlOaElDZG9wUk42VUM4UmNjV2d1L3d6U1MzODlqMXE0a3JtbXZZQWJw?=
 =?utf-8?B?VVF4d3crM1dKeStmc3ZDUkVoa2dZQXZwbzlBWFIzUklwRU1RTzVhZU9wZHhv?=
 =?utf-8?B?aUMvaVR6aWhES0dhczA2ME5wTTRYd0JDZGtzTUJ1Q1NvMkhNVkIyUkVOdUps?=
 =?utf-8?B?Q1Z6TDN0TU1rOUdUYm14MzlsZW9QZFVzS1d2Rjgvd1dRcmZ3MmkxQnU3ZHR5?=
 =?utf-8?B?T2RpekV5T1RHME5yVW1qRGcycDN4bFU4cldKRStYOFo3VC9CTWRkWUJSVzhO?=
 =?utf-8?B?ODBFVHBWelhEdnNhbElMUjVVRDFydkdCV2IxaFI3NkZGRXlJMEtrVHN0S0gr?=
 =?utf-8?B?L1RVZ1JXSWlrckd0MitDWjE0dnp0QXNiMzU3bHFTS1hFTXoxNHV1WUd1d1I5?=
 =?utf-8?B?c2xZSmliWHVaRjBlbzZ0ejViUTBvY1JLZkJndXhNeTBoVzBBaGVrR21aekgr?=
 =?utf-8?B?NC9YU0tXUzVRc2pRR3Noc240R0xSVUR4N3pMUjdHV2RuSE4zWHk4ZW5ER1VB?=
 =?utf-8?B?ckZkZytma3h4WXBSMCtRNVFGbmErSkZnUWo1VUh6SVlKR09kQUQyd3pRTm1B?=
 =?utf-8?B?WG9XaVFXTHE1S1RkeFZGaTVjTUVRUzNnZFFJVE14L09TUnBEV20vM1JLaTZT?=
 =?utf-8?B?eVhlY3pHam03YnI1a24zcGM3SEQwc2Z5enQwZEI1TlI1VFp2NDlKMlF6VzNV?=
 =?utf-8?B?QjhHRWtFV0RVNiszQml4ZTZTWlFCNllJVkU4YXBTVHg4WXFTL01OMDZleExZ?=
 =?utf-8?B?bG0yWlVqc3hicjlCTmdWOGFPdk1kbWl6MlhuOCtucVlPOG9Dbk9TbWNtMEhN?=
 =?utf-8?B?RzR2dmVBVWhLMzl6eGRCdmhEeTNka1M1c0FRY251QitJZGFOVXkyYlM2dzFH?=
 =?utf-8?B?M1ZBWjROdjZKZTFXUlJROEdiZVJEUjR0eHVVUmRheUZZcXpwdG5nUmZ5YklV?=
 =?utf-8?B?bFJFVXh2cU1tUWFVY3FKZ1FLV2Q4VXFNNTZuT2NoaTl2YS84eVcvVmgwa0Nh?=
 =?utf-8?B?QjkvMDFaZWxPejFSd0EzTlo4MjZCbUY0NUJOVjZrZjEwMEtCZXdZNHRqYnl4?=
 =?utf-8?B?NVdBbURhMDhJZVVSZktLelVndmd4K3U0SUE4M3dLczdEczRIVVdSTlM4akxj?=
 =?utf-8?B?U2ZCdVpaQ3dNYjhpeGVmVHhCTjBKbGFJdUN6bTcyczV3SFZTeCtXd3QwbHpr?=
 =?utf-8?B?ZDJoNk8wQUNrZnIwQmx5NndTZFptR2N3eXdUNEtRSDNzeEtmUFFwOU5MQjN0?=
 =?utf-8?B?alhuTW43V2RFbjNLaVg2WWRuTW05czF0dnRBcVRYclM2YUpoV2hDajh3Z1ZX?=
 =?utf-8?B?ZVVBYWthNFJtY3E0UGM3K25VU2EzbERtRWh5bnhkUEJ5UDJpTGU5dEVnUS9J?=
 =?utf-8?B?WnBLM0t4QlNBc21mN0pSVzB1OW4rcGNwU21rUFNMYUY4UlIzU0NlNXExK1Vh?=
 =?utf-8?B?N3RXam5SZGwrQlU0MUlEMzVPRzhWazlkTnFvS3hUeW5RcGNNUTlmenpOOWdH?=
 =?utf-8?B?ZnFOTXFhOVpzMWR1dGV5M3hwVCtpZ2Y2VXZvTmNWcUpiYWpUa0M4d3VMajBm?=
 =?utf-8?B?c0FlNXlXcE9yb3B3SUU3aFd5RTdTeFc3UlV6cE5JR1poNnZ1aTUxeDJMWGwx?=
 =?utf-8?B?ckZvaFZWUjZVQlcwMEJhYnd5WlBFcmJlUTMrZ1FHWGVoK0FwdVd3VGEvL29G?=
 =?utf-8?B?czQwV0pvaEtLZEp2ZmdOajc1L3JwWmZBaE5zU0hKQUhZN3ZmMDFSTWRGR0lD?=
 =?utf-8?B?V3g0NXczNFNYMTlPelBOYjBIWGVHU2ZXcGxLU1NRbUR4SDRLQ0tINmpzWUNv?=
 =?utf-8?B?V0VmVytZZS9reDVkamdBR0lIemJNOTMzWGxIYVNqMGN1bXRCbk1QN09rRXdI?=
 =?utf-8?B?bmZUWXBNL3FSNXVsbXpaMzBzblljR2IzR0pxS3lsTUhScnNqUnFnbWg1WXpY?=
 =?utf-8?B?dzVacTV2MlN2VnJGWk1DOE13MHh5cGtHMlFSV2hTRFhoa1VvMVFqNFdUQisx?=
 =?utf-8?B?bTB6bzNqSDd0aVFCZE95UTJxZmczZTBIa0tVSDdNQzRkR0xiQXRUNHNubGdU?=
 =?utf-8?B?Nk1GZXUzTy9RaktIdGF3ZGZWU2llamZCeWFhWXpmNVh3Y3dHb0VJK1FlSlMx?=
 =?utf-8?Q?/hVmpM0mA+2iglTfajbKtsz5BhNngcFM9CRaMs1YAnarg?=
X-MS-Exchange-AntiSpam-MessageData-1: VrHPMyztb2dNMg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768f3b4d-2477-4b85-b110-08dee22102c2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 03:27:34.4471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F54ne0uLSjqqCSvx09xuK0fOY8Ew7stUDXawTSeeqg0iAr2KNhT3phth7kboVaLogriLDVmEMHuGzTfkQ6Zppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.66 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67607-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:thierry.reding@kernel.org,m:linux-tegra@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA5F175A43E

On Friday, July 10, 2026 6:53=E2=80=AFPM Hans Verkuil wrote:
> Keep track of Rx Low Drive conditions. Useful for detecting
> potential hardware/cable problems as it suggests unstable or
> incorrect voltage levels.
>=20
> Note that the Tx Low Drive conditions are already logged in
> the CEC core.
>=20
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/cec/platform/tegra/tegra_cec.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media=
/cec/platform/tegra/tegra_cec.c
> index f8ffaeb78118..e22a4625f192 100644
> --- a/drivers/media/cec/platform/tegra/tegra_cec.c
> +++ b/drivers/media/cec/platform/tegra/tegra_cec.c
> @@ -24,6 +24,7 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/seq_file.h>
>  #include <linux/clk/tegra.h>
> =20
>  #include <media/cec-notifier.h>
> @@ -47,6 +48,7 @@ struct tegra_cec {
>  	u32			tx_buf[CEC_MAX_MSG_SIZE];
>  	u8			tx_buf_cur;
>  	u8			tx_buf_cnt;
> +	u32			rx_total_low_drives;
>  };
> =20
>  static inline u32 cec_read(struct tegra_cec *cec, u32 reg)
> @@ -116,6 +118,13 @@ static irqreturn_t tegra_cec_irq_handler(int irq, vo=
id *data)
>  		return IRQ_WAKE_THREAD;
>  	}
> =20
> +	if (status & TEGRA_CEC_INT_STAT_RX_BUS_ERROR_DETECTED) {
> +		dev_warn_ratelimited(dev, "RX bus error detected, generated low drive\=
n");
> +		cec->rx_total_low_drives++;
> +		cec_write(cec, TEGRA_CEC_INT_STAT,
> +			  TEGRA_CEC_INT_STAT_RX_BUS_ERROR_DETECTED);
> +	}
> +
>  	if ((status & TEGRA_CEC_INT_STAT_TX_ARBITRATION_FAILED) ||
>  		   (status & TEGRA_CEC_INT_STAT_TX_BUS_ANOMALY_DETECTED)) {
>  		tegra_cec_error_recovery(cec);
> @@ -241,6 +250,7 @@ static int tegra_cec_adap_enable(struct cec_adapter *=
adap, bool enable)
>  		  TEGRA_CEC_INT_MASK_TX_BUS_ANOMALY_DETECTED |
>  		  TEGRA_CEC_INT_MASK_TX_FRAME_TRANSMITTED |
>  		  TEGRA_CEC_INT_MASK_RX_REGISTER_FULL |
> +		  TEGRA_CEC_INT_MASK_RX_BUS_ERROR_DETECTED |
>  		  TEGRA_CEC_INT_MASK_RX_START_BIT_DETECTED);
> =20
>  	/*
> @@ -318,11 +328,20 @@ static int tegra_cec_adap_transmit(struct cec_adapt=
er *adap, u8 attempts,
>  	return 0;
>  }
> =20
> +static void tegra_cec_adap_status(struct cec_adapter *adap, struct seq_f=
ile *file)
> +{
> +	struct tegra_cec *cec =3D adap->priv;
> +
> +	seq_printf(file, "receive low drive count: %u\n",
> +		   cec->rx_total_low_drives);
> +}
> +
>  static const struct cec_adap_ops tegra_cec_ops =3D {
>  	.adap_enable =3D tegra_cec_adap_enable,
>  	.adap_log_addr =3D tegra_cec_adap_log_addr,
>  	.adap_transmit =3D tegra_cec_adap_transmit,
>  	.adap_monitor_all_enable =3D tegra_cec_adap_monitor_all_enable,
> +	.adap_status =3D tegra_cec_adap_status,
>  };
> =20
>  static int tegra_cec_probe(struct platform_device *pdev)
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



