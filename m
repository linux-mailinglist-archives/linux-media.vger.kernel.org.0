Return-Path: <linux-media+bounces-67423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SRodH8teVGrmlAMAu9opvQ
	(envelope-from <linux-media+bounces-67423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 05:43:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8143746FBD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 05:43:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Fwn0kaPP;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67423-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67423-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22D76300F13A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 03:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3907E33BBAF;
	Mon, 13 Jul 2026 03:43:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6895A2561A7;
	Mon, 13 Jul 2026 03:42:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783914179; cv=fail; b=HaIz3529+4ySXUY10E1iPR6AR1F6RfspZudESmP4sbiadoF/1rBUMa1frcAWF3lm4HvD202LpmGOorb1E0om0gO9V8K4bhBzaa2KbVVEBCWYyprdVzSpxvzI1FZr1V5++6JUYXFxMkUXqiDqMJYyfkcPaU88sFJRDzzqB764kko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783914179; c=relaxed/simple;
	bh=kQCOkNYaQInuOqPZ9OZAKN6YTxLADtcEcrD37x6acWY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ib0YstSo558RbaMNX0pXxXc+15LQeQUWVqHv0F+b+0xGaICJWcMrtT37QzGoPim6wGXRJYtwMaQ8RstQ2HOI31fMeY1OwlQTAHpmWkyTF1Tym5BfAW7J+GAz18jRwfib9K3KuRsajriFnfqVUnK86/o3qo89C186LGCIc0pK/Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Fwn0kaPP; arc=fail smtp.client-ip=52.101.46.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4ExxuKnl3lJFhGyPLXmk21Ksa95NcF4bz+N53bRA7myT2RtDOMU4w3Hhpg+qE19XKe8JWAHNOf40c6vkCBoU2SF/gIdHd6gAWdJ5sKR9mxxaghTsxwy12w1zJtjOOKjKBwh4mWtQhwidRN/8YkIMhUKHeKLN28OU9HxV7L/qeUpUP0VqLmyVmtyp0fSAyRPVZxwsdkC5adiJ5WcEvqE1tk/p/1F3SZ29jT2brbSLbJKbLfEcgjGCN8HyNwmj/v32FHsHxfPEkqomIMWg3cbd2Jg7OoZKeeJnfMN6CvOtwFRdhx9Rf0gsPOMsm2n6qfKN4oNX8MOz9E+WlyxcmHZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rarSoDGf3lpUc9EdeGBloCDz/c/ujIoBS6fQ3hXOhJw=;
 b=j9XIQyPslRqTw4Y0SlX8OAzRLGf56HLPSaVBoQN5z4/QFRB8Ce7mEN39yP4Lg/QfbZ16jl0eHCp2yRl8XpWXWX+IzmaPFidkN/74jKf8Tm0Mw5z5WVez1hsUXgyS9N6Hkk0gHMcPTSFp448HSdb86CQs8YqfnTidNrum7bXlVVoSJo4PoyKlgVzjb0hzIaSDXwP3QjzcI6MLv7Z8tyEDV6UhcN+BK0lWbMXQrCDYtBEpjqk38o/YNyUfrfhUX6v8KUTkVqg84vSUsYuayWfj5f+8Z/fHw5YmZQYtEKk21gu/29Ha2cK1Bff2ccRT+XYvY41YjOjZ716N+RIMwBhBRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rarSoDGf3lpUc9EdeGBloCDz/c/ujIoBS6fQ3hXOhJw=;
 b=Fwn0kaPPPoO89Nimlu767/WdiKyBvjopfZwpGhm7bOcts/ZAGAzhxceN1v2wM0aSE2NK8owzi7EnCGvLxw8WhVDbbCwIk9FAMHI9axY0xGiyvVOxGQUtMPNnM80Y8onZ097u1RY8f08IPG8CfQqsEMICGr2wP5/+eRihCcJUtak=
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 03:42:54 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 03:42:54 +0000
Message-ID: <705970df-f0da-47de-8412-2e8f03b5b5c8@amd.com>
Date: Mon, 13 Jul 2026 11:42:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: amd: fix unmet dependency for
 VIDEO_V4L2_SUBDEV_API
To: Julian Braha <julianbraha@gmail.com>, pratap.nirujogi@amd.com,
 mchehab@kernel.org, sakari.ailus@linux.intel.com
Cc: sultan@kerneltoast.com, Svetoslav.Stoilov@amd.com, superm1@kernel.org,
 arnd@arndb.de, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260711235939.2312639-1-julianbraha@gmail.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20260711235939.2312639-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|BY5PR12MB4097:EE_
X-MS-Office365-Filtering-Correlation-Id: a445ab19-7afc-432c-abee-08dee090d207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	mjmhujP9LCpyciKLawHMjTX3DOV2TdvqgPMsiLeUNI3PI/E0aKtEWrwidENgS7MdEE9q32d9kTRmeZlyFf8O2kYIOtwCdKtemMeqCEkCPXBhM7vV4CNUDlXQw67XWsftrdKHIwik94ly/lcfjw9uS61b6dHpFmeeamLt57DjvDgO37Ki+QBkhtsGJHarOloQNV+PlNtwYWnYoA5wiutl9DQ/ht4TiA0OFj0DR8+k5r7GnP4Ed+ukcFgfhNvsVWLZ93UOzFOjHbKG5Li1Cbj6wTdcCCGoa9VIdz2se34uuWI3RwOcB+x8oUSI5G+uGRQh51FG09mk7zUBZRWblnp4ELRry+xQ+OsDs0TQwMtaTnO5x+EfYCT/P4n5T4dL7jyItLhdNRm7CsHiz3F8Uz1DqRa7JdtXEn4xJ95lSVNzayjd/zCtD4uZ6csPmV6PB5aW/n5x+7Spxx8mhi0ZCy+QfC00K2u1EHGyJ8Jm2OlzrDYOHjUw68RiT4WADotidfUntujFr/ncYncKD9Dz4oYmqEnXx8aFGPSijlxNUN/yOV7iBg1dt6gkhu8uQ60ta+wPpEb1JPuB9Q/pM7oiochQyCel08jYEroji9ANz/e5PjHjgYWUjoN+JjrADpUOXclU2j9wNOclY2xsoepFpwHHA4brg7rECoqcSZaRMIWdyoc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFNXaThGYWllenZLYnFVa0JtUFNReTF2WmozSGFJd2REcjZ0dUJPMml2TWZO?=
 =?utf-8?B?WXhOSmNKaFE5WUwyOG1IWi9DTWRRSGpkeUVPdWRETW5aTkpDQUVNVDREdFZW?=
 =?utf-8?B?OXVGVkpHcDRGQVBhRDJtYWJXejczUlVUSXpJZ25vcVdQVm0ydGQzeEJySG5r?=
 =?utf-8?B?MEI4T1htUWl4YS9rajlBUytBVkNMeHpKN2tmbVY2Q3pWd1JNUjdjbjRJL1M4?=
 =?utf-8?B?bU4vRkJpRmR0c3lMYkZtTkg1QVNkYngwbm1zRDlvaFNyUklIY05pcGVqWVJ1?=
 =?utf-8?B?N2NxZUxmeEh5OHZNeTFnVTdGSzZ5dGdwaUhMajBLZXBqNjFaL2RkUFdxdkY4?=
 =?utf-8?B?L3RsNzNteCtwR2hSZFMzWVAzODIyTzg0NjlwNFE0YTdSd1RHWHJyRmgvRDVE?=
 =?utf-8?B?OHhhU3E0QkVRQU1lZ2p6QlFOQ2Vxbk9RUzRvVUo0Q3Rvckl2eVA5V2VFRjJa?=
 =?utf-8?B?dkhXOS9TUFprLzRDUHdyUkpMQTlUdWgwMW5COVRSSkVBellGY0E1VjJxUzdk?=
 =?utf-8?B?WStnczV0cCs3RHV1dm5lNVQwTElzWkJQNmJZa1QwM3A3MGluZlNOR0lPWG55?=
 =?utf-8?B?S2U3UmpvTllnaW1Uczk1MDBVMkZkTmcxdFRnbXRLYnB1TU90ckU0cVN6YjdR?=
 =?utf-8?B?cjdCOE5tZTliTUd0dHhsa0xCUG5Nd2xySktjVUJlc1gwdldxeE5iNndyWlg4?=
 =?utf-8?B?Yk01ZWpNS282V0wxd1pWNllaMWJMT1M0cG5QMUpIREIrTUNvUklTZjlXQWtr?=
 =?utf-8?B?bHZmd0hjOWwxSGxtYmNjT0cxYldWL1lOZC9OZkZHNGw0QTc5bFQ0Yk9WSlR3?=
 =?utf-8?B?UjlzSFNRNk16WnNLalBxemRIYVVBS0RBTE9FY01ZUWl5TjMrSWlmL3JoRDJt?=
 =?utf-8?B?aDJXL1NDdmxVV0N1V1YvY2l2UW1rUmJHY1NoQmFVSCswQWJzNDNSK3Z6TDQv?=
 =?utf-8?B?WWVVMnpSMU9jaHVzWFlQeitOaXNMVWhycWQ0dlRUYjdWZjhzVmorSlQ0NVRn?=
 =?utf-8?B?WGlUSDg5NFpSOThzVWFQMDBMa2hKeUNncWsrSWloeUxWZTVsQXp6RlpJRmJu?=
 =?utf-8?B?b24zeVhaZUo4bm5nTUlnNitKaE02eXg2MnVobmpFTlIvRVVlQVdQNEJHMGhk?=
 =?utf-8?B?c3NVaGNiMTVsZENDVUkrZ0U5dEJDRjlTUncvOXV3WHJTbFNocXVyUDAyUDRE?=
 =?utf-8?B?S1pna1FZelA1Q1Z6SGZSTkEvWjFMZ0xCTWNkWHpPN1F3c3dhdFlKazVNKzlS?=
 =?utf-8?B?V0NmMC9DV3I0c1NKblRFTWhNbE81dTdoMGRUV1pHN0w5ak9qcDdHaUtLbXdp?=
 =?utf-8?B?UFFxQXdrRkZ3elBUanRNWVN6TVBLcy9pKy9xdmFTY1JWMTExUFJxWTB2NGtM?=
 =?utf-8?B?R2M3aCs0WUhxYXZvRDI4aWVXRW41SGNwcklzRXlPNXBuY2ExWmRNRnBpWjJz?=
 =?utf-8?B?dnZOMExyS1ZSWVdzbEhKZjF1bjBqaVJWWXNkQUc3RGEyUWVqT0hGSWYxUmRQ?=
 =?utf-8?B?RnBiWGZrcHR4eEk1S3h2a1dkS0lSOFhzTFNwRUZmd3dEMElLNERqTmNCMmN5?=
 =?utf-8?B?NXFPdmZ1QlR6T0pTNkNWVjhUdW93OUhJdmpHenVOaWp4TExHeTh4L0wyTjd0?=
 =?utf-8?B?QkEyMXJqSXRDOTdZN2hZR2R2VXRKd21OV0JxTU0xZmpvM1hCT1JETURlNFVn?=
 =?utf-8?B?WEpRckVkQkIramp3WGpLWCt4NDlpY202L0pFeUc0bk0rNzRFc2FpeEFDcGhE?=
 =?utf-8?B?VUJlc0YzMktqSWhvRkV3bWw1Z3ZhUjI2cklGcXB2MGx3aFBNT295Y3AzYUZS?=
 =?utf-8?B?UDNmK2pEN21yVzFjaEtCQlNncUFTZWxNdkQybTRZSXpVSWpad0U4NExPc3hi?=
 =?utf-8?B?a3dxS3RxK2NhR2FkVFQxeUVMUFNOcGdOWWxHSEcyZThGYXlFR3hQNyt1SE9w?=
 =?utf-8?B?K2R5b1B0eEQweUtadmlkRnFwVk91ZmEyU215VFVyaUlDY3RJSGs0Nm5SbWpz?=
 =?utf-8?B?bXVZZ0dwenZvdXVWSGt6dHdSUVNTZ2hMalVnd20vWWIzS1FUVm04NE5DZVQ5?=
 =?utf-8?B?RnlRYTErTC83OWw1ZmZSSzYwSlh1eTUxU3dUM1l2OUJiZVE3N0xBNkx4aTBa?=
 =?utf-8?B?NkdyaStCTW1taE1ocFVnUTEvOFFyODk2UEk1dHR5Y1hYbktNQjlQeUNyOS9k?=
 =?utf-8?B?NWdadXZxb05mc2hBdlBzaWUzTGNHVzEvNWlQTzR5UkdaR09BZ3FFZ3VWOTNU?=
 =?utf-8?B?SmdvVUpmMnEvNEtDdTFWQ0lGZXE4NXlEVFFvVDYvUFJJV1g3dVFwMURMOTF1?=
 =?utf-8?Q?Sp8w99NqutfPIdpZx1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a445ab19-7afc-432c-abee-08dee090d207
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 03:42:54.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QE/ZGFnATHvzBOSMpAL8Kp4l9qDpJodkAir+QNK8R8teSw3BhynQUhhICng2ELf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67423-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:pratap.nirujogi@amd.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:superm1@kernel.org,m:arnd@arndb.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,kernel.org,linux.intel.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,aka.ms:url,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8143746FBD



On 7/12/2026 7:59 AM, Julian Braha wrote:
> [You don't often get email from julianbraha@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Currently, VIDEO_AMD_ISP4_CAPTURE selects VIDEO_V4L2_SUBDEV_API without
> ensuring MEDIA_CONTROLLER is enabled, causing an unmet dependency:
> 
> WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
>   Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && MEDIA_CONTROLLER [=n]
>   Selected by [m]:
>   - VIDEO_AMD_ISP4_CAPTURE [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && DRM_AMDGPU [=m] && DRM_AMD_ISP [=y] && HAS_DMA [=y] && VIDEO_DEV [=m]
> 
> Many other options in this subsystem select MEDIA_CONTROLLER, let's do the
> same here.
> 
> This unmet dependency bug was detected by kconfirm, a static analysis tool
> for Kconfig.
> 
> Fixes: 9a54c285630c ("media: platform: amd: Introduce amd isp4 capture driver")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  drivers/media/platform/amd/isp4/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
> index 9d1927af1cb8..77b61fae82ba 100644
> --- a/drivers/media/platform/amd/isp4/Kconfig
> +++ b/drivers/media/platform/amd/isp4/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_AMD_ISP4_CAPTURE
>         depends on DRM_AMDGPU && DRM_AMD_ISP
>         depends on HAS_DMA
>         depends on VIDEO_DEV
> +       select MEDIA_CONTROLLER
>         select VIDEOBUF2_CORE
>         select VIDEOBUF2_MEMOPS
>         select VIDEOBUF2_V4L2
> --
> 2.54.0
> 

Reviewed-by: Bin Du <bin.du@amd.com>

