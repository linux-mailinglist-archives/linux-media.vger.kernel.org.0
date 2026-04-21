Return-Path: <linux-media+bounces-59235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHFhDpu452mu/wEAu9opvQ
	(envelope-from <linux-media+bounces-59235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 19:49:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E22743E2F1
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 19:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8807D3038A41
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 17:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE11531F9BD;
	Tue, 21 Apr 2026 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f+qv87RI"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF2E31A046
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776793431; cv=fail; b=UYV6a0e9D4NGkXytFSwwb6TjiajYaMHoRX+30+UWG23da6iicu5iVGk73Zxe8fbb5gV0GTPiIjoKeiL425QP4B5PznIWZejYsyoaZI2kOXE9ghMjpB9ftw8SlvYhJbAik7288Q5AIbagr8mxZiBR5fbglGeXBe6MmJ0N8yeq4mY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776793431; c=relaxed/simple;
	bh=VP5XSo/mxkihAdnENH0YJSqMIqhh5BqsWIqQZr9dBzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ii1pGUEkrCSSqN5V37BkkGK8e4+ISKdFJg9YGWyMg4g5qkhSq/nFBWvRFren5Hk9n+aD6m4yUOVIuWue2uR8I4EiFtmHfLVswad9FKs/oHAf0jGjmPPIcU77U9A9svQsMk/VS9almsidu8GDtND8qniRAIREf5tGX/5FrSIlBuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f+qv87RI; arc=fail smtp.client-ip=52.101.53.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZwvTrAloADlkrK62GVftDHR9MlSoXn226+3QrUbKK1fA6E5NoNRybv+THU7lZrNk5et7u1FSkupo34azI4VJvGU2OigOazYliHJ/vTY9BhgQRepLvbQGYkgdaixWaWGi3KM9bF7PwR0HFXSb9Jj5GXj4vRFirIJ8eoqKk0eG4FV5fDC8OfTgP0Dl3+r3K4rVo1VClVawla7jEmZmgK+6gSwyZJp0Kf24mi4etsR9z2i9xRnGOY0x0YM45zLaLPEHDsTTS4FH0UmbwFCw39YxIJf/encmNd7/fd18uNblzCNHd3TitD+VkoXxLIwY/8KDsfztVaEo3kD7mWNzstgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d20sBKFlUaHRpoAKBBhzJ1Qu39OZv02Y2A0bpdBgCg=;
 b=nZJx9pJTwYmVkb9qOQ2qQHz2cdcI5s105lKNSBoft/rCciaFLDHmuxb5LY9UyRLJxcZsqTHd5eNZn4DqWyod19MRXSGO/r7uEochmRSblWB41U7jTvIBv+uw4fXHKCw0KoCh9Ua9NJUy/BV0fcF9yYbrOXOol98EJV7PF0tLDFBOf4Hcyo4o7qT40BZ6Qeme2WWHcGdsaB7KjG1xicivcct/Dl8jaCC9hKUt96mZS83nKH3lnYuf0xYE2TyZ/xDrSnUuPqVquwrZJwLRx5SZSe4tnz/oTfmOiwna9W0I3jGsdrAt2sLJ7kcfE2SgX2J7qN9Al9n+wSBw9mBvnVu7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d20sBKFlUaHRpoAKBBhzJ1Qu39OZv02Y2A0bpdBgCg=;
 b=f+qv87RIhx6KVnFhweSYxVlB1nHVX9xOiFzGR7RfO20Aj9bjh5ENJ4Mv+JpFQyM3brlGxU6QDYCOMtbkNiMu50BiFThMmNAQcWwVjuw6DJt4JMNACxuGwfMbU0qPfSk5W54of/goMuW83VtODLPQS9JeZznBHagQotYiy3farao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB9035.namprd12.prod.outlook.com (2603:10b6:930:77::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 17:43:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 17:43:46 +0000
Message-ID: <e58a23d8-8cf8-41e8-ab87-d22eb04bbfde@amd.com>
Date: Tue, 21 Apr 2026 19:43:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Pinned, non-revocable mappings of VRAM: will bad things happen?
To: Val Packett <val@invisiblethingslab.com>,
 Demi Marie Obenour <demiobenour@gmail.com>, dri-devel@lists.freedesktop.org,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 linux-media@vger.kernel.org
Cc: Suwit Semal <sumit.semwal@linaro.org>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
References: <a06133f7-3093-4733-9786-bc46c1453e06@gmail.com>
 <b8d04414-18b5-40f7-9ea2-88b30ff5bea0@amd.com>
 <c7865b27-6bf1-4df1-9520-c9ef6b3ef368@gmail.com>
 <4751cf03-d3c1-4d5d-af8e-39ad7c8ffb84@amd.com>
 <7472bfcf-8c22-4ac7-b903-a883cdb8f1c6@gmail.com>
 <8fe8b78b-5294-4319-af92-a4fb00527417@amd.com>
 <8846bac5-77ff-4439-ac5c-c33cdb4a94e3@gmail.com>
 <964c3670-fad3-44ce-bd93-2057bca2dcb8@amd.com>
 <08ad2301-3163-4497-8869-fa4cea30b384@gmail.com>
 <e5c00f2c-0819-48b4-b66e-71b9a40a7235@amd.com>
 <686713fc-c762-4b1b-88b2-d486d4f38ac6@gmail.com>
 <de6777c1-1165-4ace-a5a7-3004aa9ea8c5@invisiblethingslab.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <de6777c1-1165-4ace-a5a7-3004aa9ea8c5@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:208:2be::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: 4672b4d2-3c9f-49a1-b93e-08de9fcd89e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18096099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/G3WwiHIwoWF0esv1BdCSV0tuIc47JMPYYWVIvGPAQpX6LQOacaqlhlx0b9d3paD2RSZ4RBFEdyYHCHr/1tFWdgJVJHQ5vPCO4e7DH30dc3zALey4D/2qJu87PLGQgz5do4RAMyWrEfHfYtFikGxG9vOBwNjJgZ/7boBJeO4YmmbVocYSt2BtHX3P9T+F0JITFWlw73QYyCO+WgfkOATA4vx7dTcGqvPHG4ps8fmTF/HVhkVeWfJIs7B/AMP5hpVLoqvL+3AumwWQ0bDFs34VEk16Y+Gkda/qGQQQ713bbfeMP7EYNNL2LwOhTxcLlVgwUBKSM39eFqjBNdz/wPbgz0DDvhTp1edzSTZCu14COnBMddq6Nq3qAsLlqDw+Aymx23owXIxW05PHhbkJf3imQrYZ48ZS5Ea0Vds4ytjxqqtaZtuuacqQusxxPlb0ibS2nH5G9ofkWFOy/TAGgXYthce99XdOouwjKWu8hHk/0Lhv8cur57QdHPfgjYr0SDx4ewD9UKEWy4+/dmR2YzYV9NLZpexgWVTTR+GckQnycoGSRlhmXUjBomE8Y2SkdULut0Qut00L3cDn0ZMHChf9Fh4Ns6taZApQvwgZ2Bt83QTRqobZJZh4G7SMVtX17/jRlwpE8WIODFufey0HcWji5ZZ/6Nr2+oqfr+d2TiJ1CDkyB1xrUphCIpI/qwRIQJ3XN6csJ+dKYOkfK7FRJ/vThwBDvWQGHprXA0QY42PRJDjLp1XArtWPg3UyA2aTIPV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18096099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkZ2MnEzMjdFL3hoWllEWSszMTc2OXlGdGFrclVERHVEMjJlY2kwRlZSM2xo?=
 =?utf-8?B?MFBrdUEwUTBTQ0JBOCs1Zm9LVUJCazRkOXFxbWI1RzJ4U3dXTXVESU0vb0l5?=
 =?utf-8?B?cERzY0diZ3M0KzdBOC8rL2hlZzZBRnoreDBWNmZZMHpXcFAxZGFnbHo5YUkw?=
 =?utf-8?B?VjZxNStVa3JpaktXdStseGdJNWROY2krUUVwTUJZSTd2SmN6N0xsaTRQbVJz?=
 =?utf-8?B?cmNRTkhXaDRLVlhncnFKbzVKRFlPd2hBdVZ0RnRZWlVreUZSK21vN0pSM1ZH?=
 =?utf-8?B?YWg3WWV1eWQwcThPNXFpeXByTGdGMG5DcXBkUGpOTVdwK3lwMmtlS2tLMjlV?=
 =?utf-8?B?Tm1uK3BFdThORUxqTWtzSVBzczVSN20xb3dJUkhjQVdvbzlYajgrV0dZOVpz?=
 =?utf-8?B?QUcrN1l2ZDFGbE9RVitIRVgzZmxNdkt6UWdyMzlmalFacDltRVFPaWhDUll2?=
 =?utf-8?B?dmxiSG5SMndjTkNsYzBGaCtoWEx6eTk1emZmVk1LVWlBdHNlYjBhSU9iaGI4?=
 =?utf-8?B?eXJiKytWNU9RWmk0SkNvZUU2ZldpRmtqMUVETlpjZFFHeDR4WlNPWlZlQ1Qx?=
 =?utf-8?B?bkZwTyttVHFrV00zQ0Zxa2FLdlo2bmpRZStXTVkxeGg5R0xucHZqMDh4bFlF?=
 =?utf-8?B?MXJCK1JXWmVSeDI3eVFLL3ZObVlhRVhxVlZ5QnhNMWwyRGJEZTlLTzJtNnMr?=
 =?utf-8?B?ZzlLVVlBcDhyZ3lONzY0bkZpTnhOWFR6aVhsalYxbkdLVlNFNVp0aWpSWjhv?=
 =?utf-8?B?VXZ1VU4vVEI1cDA1Q0N3anRJSEFScmtJSVBUM0lwd1ZVSXlPaHJHcm5VRkdr?=
 =?utf-8?B?TVhwLzhmMVl6R1FDd25ONWg3UGdDRzh3OExQa01JSzZBT0UzMjM4ejJrbjdT?=
 =?utf-8?B?UFNSaUdVVEhjYldGR0t6M3lQYi9PUmVXZk0rY1VLd1ZlN3pQenpDL0VUSGFp?=
 =?utf-8?B?NHRRcHp2bm5yb2k3RjNEd1BGZ3ZkdGtXWWFKQ2NWeFZjSnBQLzN6OG16UTlw?=
 =?utf-8?B?eHcySE1VUUR5NnNQejZzckgyUHhJVlc3Y3YxK29IalBUTlZ5cmlXVnVJSCt0?=
 =?utf-8?B?Q2U2Q3BTcStBNDF3UlF4ZDlzR2Z5ZlVOQm02L2dwdUhEVzNQeDBnVXB4QnBn?=
 =?utf-8?B?d3pOQkNRQnBuS0hRT1I3VjJaMWJBQnVTYkdDdGNJL1RXajdJTXFmZGl5dFEr?=
 =?utf-8?B?YjlnUmszY1ozUzZ5Q1J6b3JIelo5V0Z6M0pINGtBMXBGSVpGdjZtWTU2MmUr?=
 =?utf-8?B?ZjJDZktaTUVzODQwTzgxU2FhbERTaTg5TmVkMGl0eU1INlBXQ3l6WXMrd2Z0?=
 =?utf-8?B?QjhhV2NHdU52N1NIZWNqRkNPNUVoaEZwSzBOcEdWdS9NVHVTLzRuc0VRblIx?=
 =?utf-8?B?eDhUR1NZNHlMU0phKzNFNlFaVHhZOFJ4eVhTQkc1bEt1bkpteS9QQUU2Tm1p?=
 =?utf-8?B?VkI0amFPaHAzWS9NZ1JIL3E4L3IyNm5FQXdSY2U2c1M2Q2Nzekk4VkwrSU1k?=
 =?utf-8?B?bXpmdkthaGZ5NlorV2p4MGxoRk5mdXZ2aHJVR3ZuNlhBL2Z3VXNUbVJkN2hw?=
 =?utf-8?B?TTJKMGY4Qk9zK2J5ZWNLcHh3R1B0TUZCMTJEZDJUWVVhRDUvc283VnZaa1Zl?=
 =?utf-8?B?dngzU0JjZ2pyNXpkLytibG1FNGt5Yzk4SWNBa3ZvVmFNMHp0TEVsYWZseTVH?=
 =?utf-8?B?c1ZBR2lvL1NaOGsySGJpSEZuMlZCS1JxRTZVbzI3ZkhuelBVKytkVnFIUThG?=
 =?utf-8?B?STBqMHRYU3hOQUZCcXlTbG1mWkt1bVR6bUVtcjdTTDVJaDFEdTBBRGVZMERZ?=
 =?utf-8?B?WDcwN0NIVVRaMXF6aHNCT1I2YjdyQnFSUDVHbmE0VXlVYlYyd3JKc3M3UVNp?=
 =?utf-8?B?QmJ5TERUTzNsQzA4V3QycTUzMnZKK2RjeXd4M3dwQjhPSGdwZWRhMXZybVJS?=
 =?utf-8?B?QUVkL1JRb2tuNE13YlNSaXVVd0RFUVhyelFLdVJqRHZwcFNyQjgvOHpjYlRW?=
 =?utf-8?B?ZWJoQnowTVB4L1BGNDdUci9BQWhZREZpNWJHNmJxMFBaSWhkRS9aR1Fudlh4?=
 =?utf-8?B?djhZK3ByaGF4ZFZEOEM0c3BjeDZ4M3krUkc5TjBYZlh5U3hBYkFCQ0x6Q3hX?=
 =?utf-8?B?d09vY0RrMWZVUmszbHVSb2g3SmNZQkRNV0V2eFdCY3lLdFphTFYxaFZzL1kv?=
 =?utf-8?B?ZDUyR1BjbnhZazBqcnlaK09OZzdjZ0ZmK1E0YWNsbk9wZ3JkOVF2T21zNVF4?=
 =?utf-8?B?MjBSYVU0NDFOdDNvMzF1VkpzSjFDekh2SUsraCsybC9UT0t5clhTenZaRUpq?=
 =?utf-8?Q?E9DpzJSgtvpXsGeB+i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4672b4d2-3c9f-49a1-b93e-08de9fcd89e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 17:43:46.5330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvBf2nc9gczw8QGiYqC+HvqaBWflgkmhXn2eq8uldEPT/CzX/jlMRI2lXoOIsVMs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9035
X-Spamd-Result: default: False [0.84 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[invisiblethingslab.com,gmail.com,lists.freedesktop.org,lists.xenproject.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-59235-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 8E22743E2F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 18:55, Val Packett wrote:
> 
> On 4/20/26 4:12 PM, Demi Marie Obenour wrote:
>> On 4/20/26 14:53, Christian König wrote:
>>> On 4/20/26 20:46, Demi Marie Obenour wrote:
>>>> On 4/20/26 13:58, Christian König wrote:
>>>>> On 4/20/26 19:03, Demi Marie Obenour wrote:
>>>>>> On 4/20/26 04:49, Christian König wrote:
>>>>>>> On 4/17/26 21:35, Demi Marie Obenour wrote:
>>>>> ...
>>>>>>>> Are any of the following reasonable options?
>>>>>>>>
>>>>>>>> 1. Change the guest kernel to only map (and thus pin) a small subset
>>>>>>>>     of VRAM at any given time.  If unmapped VRAM is accessed the guest
>>>>>>>>     traps the page fault, evicts an old VRAM mapping, and creates a
>>>>>>>>     new one.
>>>>>>> Yeah, that could potentially work.
>>>>>>>
>>>>>>> This is basically what we do on the host kernel driver when we can't resize the BAR for some reason. In that use case VRAM buffers are shuffled in and out of the CPU accessible window of VRAM on demand.
>>>>>> How much is this going to hurt performance?
>>>>> Hard to say, resizing the BAR can easily give you 10-15% more performance on some use cases.
>>>>>
>>>>> But that involves physically transferring the data using a DMA. For this solution we basically only have to we basically only have to transfer a few messages between host and guest.
>>>>>
>>>>> No idea how performant that is.
>>>> In this use-case, 20-30% performance penalties are likely to be
>>>> "business as usual".
>>> Well that is quite a bit.
>>>
>>>> Close to native performance would be ideal, but
>>>> to be useful it just needs to beat software rendering by a wide margin,
>>>> and not cause data corruption or vulnerabilities.
>>> That should still easily be the case, even trivial use cases are multiple magnitudes faster on GPUs compared to software rendering.
>> Makes sense.  If only GPUs supported easy and flexible virtualization the way CPUs do :(.
>>
>>>>>>> But I have one question: When XEN has a problem handling faults from the guest on the host then how does that work for system memory mappings?
>>>>>>>
>>>>>>> There is really no difference between VRAM and system memory in the handling for the GPU driver stack.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>> Generally, Xen makes the frontend (usually an unprivileged VM)
>>>>>> responsible for providing mappings to the backend (usually the host).
>>>>>> That is possible with system RAM but not with VRAM, because Xen has
>>>>>> no awareness of VRAM.  To Xen, VRAM is just a PCI BAR.
>>>>> No, that doesn't work with system memory allocations of GPU drivers either.
>>>>>
>>>>> We already had it multiple times that people tried to be clever and incremented the page reference counter on driver allocated system memory and were totally surprised that this can result in security issues and data corruption.
>>>>>
>>>>> I seriously hope that this isn't the case here again. As far as I know XEN already has support for accessing VMAs with VM_PFN or otherwise I don't know how driver allocated system memory access could potentially work.
>>>>>
>>>>> Accessing VRAM is pretty much the same use case as far as I can see.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>> The Xen-native approach would be for system memory allocations to
>>>> be made using the Xen driver and then imported into the virtio-GPU
>>>> driver via dmabuf.  Is there any chance this could be made to happen?
>>> That could be. Adding Pierre-Eric to comment since he knows that use much better than I do.
>>>
>>>> If it's a lost cause, then how much is the memory overhead of pinning
>>>> everything ever used in a dmabuf?  It should be possible to account
>>>> pinned host memory against a guest's quota, but if that leads to an
>>>> unusable system it isn't going to be good.
>>> That won't work at all.
>>>
>>> We have use cases where you *must* migrate a DMA-buf to VRAM or otherwise the GPU can't use it.
>>>
>>> A simple scanout to a monitor is such an use case for example, that is usually not possible from system memory.
>> Direct scanout isn't a concern here.
>>
>>>> Is supporting page faults in Xen the only solution that will be viable
>>>> long-term, considering the tolerance for very substantial performance
>>>> overheads compared to native?  AAA gaming isn't the initial goal here.
>>>> Qubes OS already supports PCI passthrough for that.
>>> We have AAA gaming working on XEN through native context working for quite a while.
>>>
>>> Pierre-Eric can tell you more about that.
>>>
>>> Regards,
>>> Christian.
>> I've heard of that, but last I checked it required downstream patches
>> to Xen, Linux, and QEMU.  I don't know if any of those have been
>> upstreamed since, but I believe that upstreaming the Xen and Linux
>> patches (or rewriting them and upstreaming the rewritten version) would
>> be necessary.  Qubes OS (which I don't work for anymore but still want
>> to help with this) almost certainly won't be using QEMU for GPU stuff.
> 
> Yeah, our plan is to use xen-vhost-frontend[1] + vhost-device-gpu, ported/extended/modified as necessary. (I already have xen-vhost-frontend itself working on amd64 PVH with purely xenbus-based hotplug/configuration, currently working on cleaning up and submitting the necessary patches.)
> 
> I'm curious to hear more details about how AMD has it working but last time I checked, there weren't any missing pieces in Xen or Linux that we'd need.. The AMD downstream changes were mostly related to QEMU.
> 
> As for the memory management concerns, I would like to remind everyone once again that the pinning of GPU dmabufs in regular graphics workloads would be *very* short-term. In GPU paravirtualization (native contexts or venus or whatever else) the guest mostly operates on *opaque handles* that refer to buffers owned by the host GPU process. The typical rendering process (roughly) only involves submitting commands to the GPU that refer to memory using these handles. Only upon mmap() would a buffer be pinned/granted to the guest, and those are typically only used for *uploads* where the guest immediately does its memcpy() and unmaps the buffer.

No that is not correct at all. CPU mapping a buffers for GPUs are pretty much permanent through the whole lifetime of the buffer.
Otherwise you can completely forget running any halve way modern workloads.

> So I'm not worried about (unintentionally) pinning too much GPU driver memory.
> 
> In terms of deliberate denial-of-service attacks from the guest to the host, the only reasonable response is:
> 
> ¯\_(ツ)_/¯
> 
> CPU-mapping lots of GPU memory is far from the only DoS vector, the GPU commands themselves can easily wedge the GPU core in a million ways (and last time I checked amdgpu was noooot so good at recovering from hangs).

Yeah that is certainly true :)

Regards,
Christian.

> 
> 
> [1]: https://github.com/vireshk/xen-vhost-frontend
> 
> ~val
> 


