Return-Path: <linux-media+bounces-12738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFA09004EC
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F4B28F8A2
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EC9194A7F;
	Fri,  7 Jun 2024 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="uiAkQHTB"
X-Original-To: linux-media@vger.kernel.org
Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE514194089
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766961; cv=fail; b=UxkFhN3lEIdyRJp4XXmj45e3W1OWRqde0AT4HhApzRtipr74Y0c+m63jX/J8AUyeOhEv+1/2u3AL8l93qu9kBcqTPHYIoJi73ziYTHd1kX79Wuy+ziJUToTORyyWSUSghLuwlx/+5xodE9WXXGn8yy4DIIFtbwHlR1ThzLFpXmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766961; c=relaxed/simple;
	bh=h4mPMXVt4/HxPOlNo2p++lRCQHMh6pSzmRpdVsViZZA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GY2zCj11DKQ6GhMlkwqKj5TOg2G31fTt6hpDbqusUh2rmZJYldQ4SjqjuyL1DFqZ+reD6UMwK8oprE+3PAa+OG70OUjhz/JId8IzskK5HY174GCatiTDlhmrPDzzOwpF93g3K0RQ9PURa8Xb8KEfHmomKU0BAwe5NDZgbjevXXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=uiAkQHTB; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 104.47.7.177_.trendmicro.com (unknown [172.21.10.52])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 52E6F10065F0D
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 13:29:17 +0000 (UTC)
Received: from 104.47.7.177_.trendmicro.com (unknown [172.21.197.65])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id A579B10001FA9;
	Fri,  7 Jun 2024 13:29:10 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717766941.574000
X-TM-MAIL-UUID: a4dce02f-c241-4a9c-b097-db2998b54184
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.177])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 8C76210000E20;
	Fri,  7 Jun 2024 13:29:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XM0HVm5RJyudnuCXRcLqleBy7wrOkGGUuFQolSSEJeIXSoso35rY36CrDhNCUupsJfY8I0gptY/DIDCo5HCuyRmk+uAETlm3++tDDb/jVl6F6KW5w5syO8KBxxPLMOzVyrnQ5I/XQoF7UaAD7kusk9GKWuOYa4aSLTu97EWAHLIXDB7Z+l4tqWTEriITPCkGKUp++1k7AdRO5jREM6vDRPdcnA10vwbS85qTjYECeebXb11R9tVtmNUEcXTC7rWJkgPEReauXlTLVwO9qEmOIIWdA8h5x/4/ituYds43HmDsD8eiS+Wr1WUIJuThlZIFIEgV60xRHaLreGBtwXXxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKrBs/MZBIKIH2R5hedO4+IcnyoEnlez5heLldeqrb4=;
 b=UjahS45Eu0crv+ksD0M2UCPIeac2GCIj2x9tpvNbCw2vH+C2jwG7wehCQsZJ1lMnqzZZxXSjhzV+jGrLjPL51R1FNn1mDKVXywc65YnNPRetA1DujoipwtY2ACTALRNEbBdqhLJQXBleGYfbWZsCWYcPcWSMwT/1DZdRJNrkmOIhZIQivjNQ8gdcFXg1BWUQt4qk5Ux3vgUV4YmAyxQGBJA2fikgOpm6nHTKnXiZnkbuj1xn6sxHGnw3Lw/Rw5nCF1Ku5N5H/w4zgdMB6K/51nS6o/A34vztWk+8ojs6seY53ivqGLX2hsxylvieH2dyooJnfuFcQ94CMJq3SMftLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <b2abecb4-03a2-49ce-bfc3-2d95eb7a6956@opensynergy.com>
Date: Fri, 7 Jun 2024 15:28:56 +0200
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
To: Albert Esteve <aesteve@redhat.com>, virtio-dev@lists.linux.dev
Cc: Matti.Moell@opensynergy.com, cohuck@redhat.com, mst@redhat.com,
 acourbot@chromium.org, daniel.almeida@collabora.com, changyeon@google.com,
 alex.bennee@linaro.org, gurchetansingh@google.com, ribalda@google.com,
 nicolas.dufresne@collabora.com, eballetb@redhat.com,
 linux-media@vger.kernel.org
References: <20240607080045.1337046-1-aesteve@redhat.com>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
In-Reply-To: <20240607080045.1337046-1-aesteve@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To BE0P281MB0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:d::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE0P281MB0177:EE_|FR3P281MB1454:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0d6c9a-7d4f-4dac-3d22-08dc86f5ca05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEt6c0EwUDZBaHNiL0pZYjhCdUhiQ1dVQjRRdy9id24zdURtZE92K0JkdHdL?=
 =?utf-8?B?NTlPQVUvTzRtcWJzWnJCWkxTelJtZ3VuYUhkU0YrbEd6SnR3THRkYS85U1hH?=
 =?utf-8?B?bmM1NUt5YzByK29ndDBrTCtTcVhLaTZtQzVpT0ZOR3NZWFJ2dVlyMzBCZURp?=
 =?utf-8?B?R203bTdtSlExK2Z2YW5QNjRKajdNZlk1THJKMTN4Q25vR1I5aGlPcFdRV3FM?=
 =?utf-8?B?di9ONzNTYzd3WVpkNVcxM1NObDdUaTl6bUVtWHB6Mm1scUx1Y2I0RFBOVTNM?=
 =?utf-8?B?a00rQ0lSQkdLNE01amtHQmpJVVJXb2hiSUhLZlA2SnF1S0lSWXQ0Snc4a1JJ?=
 =?utf-8?B?NDNpVWlTVEc3eWJoTHdjbElnU3FDQSs0N0pjc3FsOHFpOEpQOE81NjNCdEhO?=
 =?utf-8?B?M3RpUjFVSVVVMzhsYUNRdXltVkIxRDVxbkpLek80NEpzMXpkdkNpUDN3Y3pI?=
 =?utf-8?B?UDRyNU1uQ1ZFQUVDS0dnRGtSeEtvQk4vWnAwVnZnOUF0cnlpWjdQa3J0dFQr?=
 =?utf-8?B?ZWxZdUhkZXZxeHQzUmRIdUlKcXViN2cvM0ZuOWZEZHlHTmFIdXpNT0hXcnBS?=
 =?utf-8?B?RkE2Mm5KMDg2R1U5cTdIL00xUlpMV2wzN25MUEVvalpVR3UydTl5eWtZMlcr?=
 =?utf-8?B?bzI3Q0hnMVQzN2FKQmxvSW4yZ3NzNzU0VnplNnh1dWEvaTdncTN5c1F0MWJ2?=
 =?utf-8?B?OFhEZy9TWmJmTEpQT3cvSE5jelZaWHdkemJVMmZNb2ZIWVB5RWpRbXp5Y1dT?=
 =?utf-8?B?a0Y0VlhnQWhaNUVDWTNqWjRrYS9GTnIyTElqNk9RRmVhRUYvemFQQVRHSGVo?=
 =?utf-8?B?d2cvdEErOEVnSDVWbnZsM0JtdXpvNS92dzV0cFZwUW9SSVI1ZXQxclp5alhp?=
 =?utf-8?B?ZnpMQzJHVEdmdGlIL2dGM3hZTVQxT1BLOGM4MUljT2I5b2ZZSGpQK0pVUXlW?=
 =?utf-8?B?aElEa0ttcHNkeWJ0YzkvMmZqSGtzcU1ObHBCZllJd0Z0MkkzQXpoYmJYa0ZV?=
 =?utf-8?B?eUh1b2lRdGt6WnhCeXVQWWdGL3EzNndxcGgvRzhpVWJ2Y3hmbmFMa0kyeTNK?=
 =?utf-8?B?L0VheUE3cHZ2M01xUnROUVF5bDZhQytRM2d0WmFTeGtLVzRDUHROU29vNUo0?=
 =?utf-8?B?Nnd6cEgzTUwwc0h4V01Sa0dUUEFiQUxxUjdCcUtqc3BEL25XNVJUTVdiMnVW?=
 =?utf-8?B?OVN0SFJVTzVkSWU4dXFsRzZQREZaN0tVWVdCZFQyV1gyQTExY2lMRjd6eFRV?=
 =?utf-8?B?RXBsUzNmbFhGbWgwZkFlSzhvcFl2c1hlYkUySTBBTDRhR1Z6cGFwdHYvVkkz?=
 =?utf-8?B?WkNaZXNjN1dJbzlsRDUxZ2xOR0krcC9scXBCZTJvbmp6MU1TbkN2Ujhua2Fj?=
 =?utf-8?B?TDI2QTNtVkwxSTFYVzhGYnRaV29YQTFiaEFzKzduOHVva29NZ2x5czQvTFRm?=
 =?utf-8?B?cC9VMmVKeWpUdjVIenNaMFUxdmhGMzN5M1dNNnEzNnZyNmJ0TkVUeW1Rc0Jy?=
 =?utf-8?B?YStQeGtqSzEvNnB4NW50eFJMekc3cDBCVVZObHI1Q0dNWDhmeVhlZ3BqUWsx?=
 =?utf-8?B?amJXOEVyRHg4MW1lTmxYOGF3VzBXbnpOY2poT3VmOVR6WXFNbnNMMmcvMHVF?=
 =?utf-8?B?K2ZIa2NUeHZWRGt0Vnc2dUl5T25Id1dMQ285SjZDSitPNW5taWQzSFFIWUp2?=
 =?utf-8?B?Q21valV2YWdma2hoOTlrUDJuN0pIVllKUCtNQmRCRjN3MUsrUThodjFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE0P281MB0177.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjJ5cFRZVTJEeUhyQUlQNTNtK21ON1lCR25HZCtuT2dIbWM0Z3RjMFhDZ3U3?=
 =?utf-8?B?N3dKMDNVTStmT2RZV1dtK08veHFXeGxqSkRpM2ZmeHNyNFZ3U29qcHE4djhT?=
 =?utf-8?B?TGxBa0pabUpTNWxzYnJRS0ZUTlN3TnZuaktNOXRHYVY4Tjl2T0RYNk92bWkz?=
 =?utf-8?B?b3YyTHRHS2ZYSkRSU0wyN2sxTG4rbUZTbXpKZXVobTkwK0dLNnVxMDB2VXEy?=
 =?utf-8?B?WXE2SlhKMzAwT29oZXNZWTFZODBZTElLUDh4djc5c3psZGZRamtJcFowMFFF?=
 =?utf-8?B?Y3d1NXgzY0ZLR0FPdXBCM2J3UlEwUmJ0YkJlZG8wdys4MTZWTktvTkJVYzBU?=
 =?utf-8?B?dWZzYUtVQ1grVkRYdEF4VEI3Ympkb0lQYW5xV0hKbW5xcVFaVHp5bUt5QzJq?=
 =?utf-8?B?VklFVE1jQWd3NExieVA2QXlydFdsUUpWTmVkSm9vZUUwK0RleWlXN2VGQThk?=
 =?utf-8?B?T254cFNOMHdZU1JxNXIrWWpFZWhpOUpVQ3gwckRDV1BIckUxbW94THFCT2Rq?=
 =?utf-8?B?bnJNUithbnd5T0JKT3RuZTIxb3ZsUVJZcTdPN2dGRUdUWWFLbXA4N05sUzRQ?=
 =?utf-8?B?bTNpWE1BRU1UYzFKUjBxdmJRYitiazhsb21YTzhka0N3Z3B4aEw5aFI0bWdU?=
 =?utf-8?B?OElHbWZKZEJFbEtxWXE0djd5dW5XQmNtVDBwVmUyZFhETCsrb0hTU2Z5N1pq?=
 =?utf-8?B?RGljQWdIZXQ2MHJCVWhNdGFLUkhhUFRqeERvOGVyUldWV3NRVGxlVkRtZUZZ?=
 =?utf-8?B?TXlZSWRBYldXUHVXaWdKeWlLZnExQ3hiZUJEWEk3VUJVbWxEYWJaTm5XSG1m?=
 =?utf-8?B?SlhydWdKRVA3Ti9laW5OMUFGazZaM29aSGc1UjBYcnY3TkdSRjJFdXZzK2kx?=
 =?utf-8?B?OWhjUTJyNXNBaThTTklxR0NKUFVmOC81WG9YM1haRlIyMlBRZDVhRTAyWXll?=
 =?utf-8?B?NzJiQTFPK0xrNE9yMEZDNU9IMWgwTnBEUHpiTEZyeHFuYXh0N2pweEl6T3BY?=
 =?utf-8?B?RXg2T1lLbG95d3lEWUlRd3Jqb3VrdkY5QVhKUVo4K2U5V2hhVitIVVVMQ3JU?=
 =?utf-8?B?SGtkdHg2K05DQ2kvczdjK2JQdUkvVE9GN3NtL09KQjk2YkwyUDdUUW9GaVgr?=
 =?utf-8?B?VjJWSTUrdzRrc25yWHRMRHlsWWQ2ZTNzV3hlWndRaTJVYWZndlU4UUZ2ZHY1?=
 =?utf-8?B?eW1FVmZmekZzK2NwZUtXNFNyOUxaeHZTSjVtcGZaQUZpcjFudFdRdFlGMDRE?=
 =?utf-8?B?R0REeS9HaGpMYzRUcXJjTVJpZEhSMGF6OHd5ckVJblBNcGkzM1M3QVRzRUZp?=
 =?utf-8?B?aGtSNjVnRlR4cTlTWThOZ0NBbG5xYTZPZEtzdnpNYlJDSjM4TloyUzlhU1JD?=
 =?utf-8?B?U09PRTJaWVlkYzNCWlpNZC9ENWs3YUMyazRCdjBOTDVEOFBveHFxUWJVWjRL?=
 =?utf-8?B?dzlRUmcrandSbWFkQXBYdTV3TVBTeFhHWmd5eXJxVFJ1MHgyRUFKZzZuWktD?=
 =?utf-8?B?SnE1S1JGQk14RlhuVEpMVnNNQXJVajdkdWJ3ZGQwbFB1WWM1NnNnd2lVZGxX?=
 =?utf-8?B?KzVHQmt4VTJEaU1TMlhlMDlmbGpId2RETkw3M3h1NysrQjNHMmZORDFkRU1N?=
 =?utf-8?B?OTNMSFNtNk9ORGR3MERkQ1V2cFZleTNQZ3BpQ1ZOQjZKRmpSb1BtcnJuUWlL?=
 =?utf-8?B?TTNGMjg5V1I4OFJhaWpGd3N4anFtRjQ3K2xxd2txanlSTlZyMXlUUXRtM2Rt?=
 =?utf-8?B?NnRGQlphVGNqTFdFR01tcUxOUVhkK00wUURBU2QxcEVISEloTzd1eldNaUhC?=
 =?utf-8?B?UWF0eGJyczQ0MG93alFGcGVVNXM2SFlYcERqTUhWT2ppTkQ5anZZYTBjQnoz?=
 =?utf-8?B?eDI0THNRZ3hHZlRvZFB4MFhZbzdzSmxta0lqVmQzVDJYL3A4ZkllV1VJVUQy?=
 =?utf-8?B?RnA3dnZxVUpOQ3dGSEI1OUtOUVgwT0pPVTJmODlOS3NKWXRaR3hGaGhKVXRy?=
 =?utf-8?B?L0hSQk9IenNucEZ6OUxIdkJ2Y05wd0lCaFB2bC91RDFiNTBHZ3hsYXFjNXZH?=
 =?utf-8?B?RytodUY5Z1NGZ2E1Zml3NlRnMFBFby9xV2UxcGp6dkc4UjhMV3J1Q2UvSStw?=
 =?utf-8?Q?3eL13PFIzPHxbZ/NbCUD++obl?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0d6c9a-7d4f-4dac-3d22-08dc86f5ca05
X-MS-Exchange-CrossTenant-AuthSource: BE0P281MB0177.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 13:28:59.6810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUnK6g3lrbnUry54cPpq63AQ12bQyUxR5zJGkWC22AC0PqabUrCHyoHcA3vWHeAHdIY/K/TLJCwA4SZ2HcgfSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB1454
X-TM-AS-ERS: 104.47.7.177-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28436.002
X-TMASE-Result: 10--24.025100-4.000000
X-TMASE-MatchedRID: 0FbuSxFHrmnEeENaa6f3ipQ/7SF2k7HSDDgMha/WNJWmiVeoNe/DChf6
	P5SYTz3whdV4DNbM8esSIpOZI85QV40IhLRfrm0owCynNqaZmbgftZuMZfm2Sc+9rQ+ljgUnU3L
	lkMVqCR22rF0xZKBGAAmYviVgIizsPqLVifTMwhLnSw797O7vsMBJQtlfP5o9SN0awXNAjwVLiX
	zOfLapnr84v1ncdyt/6wlzBnX8OEAW2fjHaLKh0BBO39LWoxf3HkO3Jwwo8GTYB7h0QmbuTXg8w
	OTJF6Ws/KmF6PXUvSF7lwZF7GC6hP4tSK3Y++M+wBDfgAwffVNGDXkz8A7dj4M+VZimfMfO4Qpv
	Gpvkj+db6vrNZx7TgYnvjQ1qO1rnoG8aa0RhIhaCeSwp+1c04+Xp5Ieya85+B1/+MhJHxqBQuyT
	WcRlTdkvf7TMPgZT6IXvLm60VOTxa/TI2/6XK8uMkmBIy75MrLDnt+iPiISGoHJcUcHtaqlJ7G8
	3umMVvXk7Rlwq0n7dCeEor3AIpkftaF3Lm3R5NG+h1KEqcgkYJZ2Q97L+53dZsF6RN0T1Z2is2J
	ndz3MoLBf2DjkLv2Ue5oGsVx/VACvFujtW1edaors6fQnzHvqEdrhqOPissN0X64jGy2dYocZCi
	FAXLX5nIks1lKSkzBqppdY0Ui0fHzgRDb/6bnqAMgqqohH1PoXieF+7O0prgCr61uI2z4i2SOQM
	Upav70B9raYNQBm9XvsCGVv8czvD9A8H1rUWtlIFBfXfM6ZSK7q7iyFn58e6Y/d5rGedhZpWOUZ
	K9+E0E5DpoN1ht3liotxKi0ygwWAgtBtD1e7rrhpwxi7CLzzmoMBkrmuf/mCYM4MaoFU97wQPQv
	9XohUiWqV2CUL6T2HlzhM3zNtnRKDuafjrn+bOqTHJspUBKpa3EDSoNNvSJkcezle6Ws3hjRNft
	OUC/O/mB2+12nNVaOxpgjiWHdQKmARN5PTKc
X-TMASE-XGENCLOUD: 51fcad86-a674-4548-ba49-dff0358f8a13-0-0-200-0
X-TM-Deliver-Signature: E9F12A6FD0054B16685D5EB7287D29B2
X-TM-Addin-Auth: eSS9+SRVl1rtVQJCq6TQJt9qyjshkEibyMzPgmO2gcStMjVEtFRSFRQY/Aw
	oBjOPCahOM3ZFaELSwnaUTvM0hj6g8Rhbcc4iLRubKiEuOcerynzeqSKF+gFyR4mrYZpiaO1oc5
	jftiU3jnpttA5hYGHRWCx26orteCBQlB9us0SxB1YAnJiUJ7ql3xFmAfT3zfm+iwdyFdoSw6TwV
	YtRl8JAlzdNtT7xjOW8GEigYfQeiyWUYqo5T/ALl8oVpCMn09ZeRMdInlxAhpRvF8mOySpvBFoh
	NDCYBJDfKrjvstM=.XpvntRZfpj/f8PSCutx5kdr+P5nQAtxgHeOCFBofIEGMOJBUf5Lh+rPQvN
	xAw9hN3g0fha4HAnoXwndQfEnMHLxlRiP7yJIxZZe4qEIfVnI/mysP+aIGqUkAOfE2AM9yGoi4O
	RRAkw+AWq3KL7d9DrcU4xLehhn9+cB7/YXdJHEhBXGTxjfsz5C6POMdJo8hBNC0FWne9t2gXbES
	5g3bs/f9iIvSzzRhuJACsspfjmj7hlA6tEhA2fNlLPf1xw+hXAxUVwI4fRkfizaJKrKQ9wjxeHb
	8+QaPdmjEfxiGN2nV5adiLRW/xttq5bp4x9IXNrbRb0AC7LfBpLj690UOgg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717766950;
	bh=h4mPMXVt4/HxPOlNo2p++lRCQHMh6pSzmRpdVsViZZA=; l=6314;
	h=Date:To:From;
	b=uiAkQHTBrZiMn/HlnCF6f+vHf6kD8oedOO9r6YbqAUpVJkytsP0ofQDtdFN1B1eAt
	 aahjAVYdtXOe+OAhyw87cf3Mg+8fIoTaBHYdEQDIZzlt5Z1PEXymkOMjB58uCv5iAA
	 cadUsWbcsBl94rRL9Myqz5ixbmGPbSEUgJDG7wlU+nfdr9Bni7ViPRLfHRvyMnVNMz
	 Op7pv6u5BAnGCrms2bvk1SCz5F1AHAD232+dapD1ES48XqA3B/BP8WZreWd1wdinmp
	 vu9p89tBcs3r+YGtQnplCFl8JGAynrFDGaVfY7GfmNchgRMiy2f4kUaD6OI0QYLtoH
	 ckil6VcEQfi+w==

Hi Albert,

On 07.06.24 10:00, Albert Esteve wrote:
> Hi,
> 
> This a formal attempt of including virtio-media
> device specification.
> 
> Virtio-media came from a discussion on virtio-dev
> mailing list, which lead to presenting virtio-v4l2[1]
> specification as an alternative to virtio-video.
> 
> Later, virtio-v4l2 was renamed to virtio-media[2]
> and published through:
> 
> https://github.com/chromeos/virtio-media
> 
> The repository above includes a virtio-media driver able
> to pass v4l2-compliance when proxying the vivid/vicodec
> virtual devices or an actual UVC camera using the
> V4L2 vhost device (available in the repository).
> Steps to reproduce are also detailed[3].
> 
> There is some overlap with virtio-video in regards
> to which devices it can handle. However,
> as virtio-media will likely be the virtualization
> solution for ChromeOS (already landed into the chromeos
> organization) and possibly other Google projects for
> media devices, it would be desirable to include the
> specification in the next virtio release despite
> the aforementioned overlap.
> 
> The device ID in this document differs from
> the ID in the virtio-media project repository.
> And it will probably need some discussion on which
> would be the correct definitive ID.
> 
> Full PDF: https://drive.google.com/file/d/1pNCFP06VoV8Zuyx0aDVQ7HAT4xp-pZ0a/view?usp=sharing
> PDF with the media section only: https://drive.google.com/file/d/1sn3NUUeCm46zVyJKHkpytTIgGw1fUt5T/view?usp=sharing
> 
> [1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
> [2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
> [3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
> 
> Albert Esteve (1):
>    virtio-media: Add virtio media device specification
> 
>   conformance.tex                           |  13 +-
>   content.tex                               |   1 +
>   device-types/media/description.tex        | 578 ++++++++++++++++++++++
>   device-types/media/device-conformance.tex |  11 +
>   device-types/media/driver-conformance.tex |   9 +
>   5 files changed, 608 insertions(+), 4 deletions(-)
>   create mode 100644 device-types/media/description.tex
>   create mode 100644 device-types/media/device-conformance.tex
>   create mode 100644 device-types/media/driver-conformance.tex

I'd like to add some general considerations:

1. virtio-media device capability discovery is very chatty

V4L2 requires potentially hundreds of system calls to get the full view 
of the device capabilities. This is inherited by virtio-media.
AFAIU V4L2 developers agree there is room for enhancement here, see [1], 
[2]. Also I've been told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were 
added for similar reasons.

 From the point of view of virtualization developers like my colleagues 
and me hundreds of hypervisor "exits" are excessive and costly. It can 
noticeably increase boot times, which is something we fight against in 
automotive. AFAIU other virtio developers agree with this, see [3].

In contrast virtio-video has been doing this in one command from day 
one. Yes, the data was incomplete. That's why in draft v9 I added TLV as 
a way to store all possible capabilities. I hope the linux-media folks 
could take a look on it. Maybe this is something, that can be adopted in 
V4L2?

2. virtio-media has a hard dependency on V4L2

There are certainly some "patches" on top of V4L2 in virtio-media, like 
the representation of the extended controls (which actually looks 
similar to the representation of the controls in virtio-video) or 
VIRTIO_MEDIA_EVT_DQBUF. But how far can this go? Is it OK to add your 
own ioctl ids in virtio-media?

AFAIK the linux-media maintainers have been overloaded for years, see 
[4]. Would they be happy to deal with the additional requirements? Would 
virtio community like to have a dependency here?

2.1. an example: format modifiers

There is a patchset aiming at unifying V4L2 pixel formats and extending 
them with DRM format modifiers. It is now at version 7 submitted in 
2023, see [5]. The first version was submitted in 2019, see [6]. Not 
merged yet AFAIK.

In virtio-video I just added them in draft v9.

I'm absolutely not trying to criticize here. I just try to highlight 
that there is a lot of legacy and the process is painful. Right now we 
have an opportunity to design a new API according to the current state 
of the art of the stateful codecs.

3. uncertainty with cameras

AFAIK there is still no agreement about how cameras should be 
virtualized, see [3], [7], [8], [9]. virtio-media provides support for 
cameras in a specific way, which might not be desirable.

4. (minor) is it possible/hard to implement the device in hardware/on a 
micro controller?

This is something I thought about recently, there might be a use-case 
for it in the future. One of the concerns is that dynamic memory 
allocations are IMHO inevitable in virtio-media or virtio-video up to 
draft v8. I think multiple virtqueues in virtio-video draft v9 would 
help here. Not sure yet...

There are also other minor concerns, that are probably tolerable.

[1] 
https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.ideasonboard.com/
[2] Page 6 in 
https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf
[3] https://old.linaro.org/blog/the-challenges-of-abstracting-virtio/
[4] 
https://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.nl/
[5] 
https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.info/
[6] 
https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillon@collabora.com/
[7] https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/
[8] 
https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@xs4all.nl/
[9] 
https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.com/

-- 
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin
www.opensynergy.com

