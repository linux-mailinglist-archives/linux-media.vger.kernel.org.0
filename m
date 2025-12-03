Return-Path: <linux-media+bounces-48115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BFAC9DB98
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 05:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3BAD3A8E4D
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 04:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EAD277CA5;
	Wed,  3 Dec 2025 04:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="BJqo3xt0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50BE271A7B;
	Wed,  3 Dec 2025 04:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764735015; cv=fail; b=ZAXBRQFlRBaUmcVFrje68nzAgvt44RnDSFSB1x8ChjRVwyyqzlFTMvDbcqh36mfwkcEcQCkDTP1SusldjANht0tDCFNqCnp8kFF9+LVas9UenfV7JNmxKvkuATDC5cMs4No+VjqHMBu9VLG08A6foOqwZLrkZh250UodR6JHJ44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764735015; c=relaxed/simple;
	bh=C0PX1FVT/5/fBEndFO3qlSSYs6GJWQGSCKnr/HrkQwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P60bcjM7DJJqBhl0oWJiwD/5s1kDi1Uvu5qF5OnA7ildBMAzCUafkp39KpPLb8/D7x1dNnF90OFkchkQxDPFCdUKrr3dPlxPIFb1seMk059mFA6hbmqk5xium9UQnB5dRABDFffHLJB5cfoH3mIKBW9gmSTrUu2zZKcs/0IaZ5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=BJqo3xt0; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B33olbX3747131;
	Wed, 3 Dec 2025 04:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ft5zDK4CVzxHPhYfZEwtvG68SKw16XwLSXV+zDY9si0=; b=
	BJqo3xt0jFbyHYZ8T9MCGxpTuQuTCNho6ZYxzSiBvhCTWA7v00uqWmNN80hq9GrJ
	dNks/jWfez08dcn5HizMBLFPfHExsZjm0+vRUe2CW8kSSk18SfgUT7ThIh5qFEeR
	Zy8hZZ5HOy9AVWbfBExxF2xeHUEdEW8aUfLjLTR6b0IHhFs3+bw4nz8x6wU7WkgY
	YIQ7TgQ0H3Iqa8Q1dQQfgxK/VfGoTdAS9DDQ6y73jcDJ7422NVpZv85LcLuCClSD
	KM5+hyZyrmLUA0tNrVJqmLMmLoYpsLI6+82S4m4tiYF87mlx14Tx5NPOhnAwYZnP
	bcYJ9BIF0of4DbP77O+Wqw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010061.outbound.protection.outlook.com [52.101.193.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21vbp2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 04:09:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh9ypxW2sbrsvRSZgjleYK2ftYJ8bxdqdkBbdMtZ/RS3jZqu6LKy9M/irBle+RrNYqYit2e7/YefBZZ+JkocWvpBSZCgLuuGu1xz1xuItUt/EKNN7y/ezeNAl1bR9y7Dzcu9bCLh6OohfhPShS6Qu6bErW/N4kYd8ZoWIpfceTg+h6KWWG2wpfBd+5wzydoluY9Ughz4bda5thPsGo7r0coerVE/5fSxP4unw/RUY3R9Ljs52OZDJXu4mJvOrs2ZR5XO8aLqWhh7PjCgxKxFkddqDQiVisXUipWNVOD3Kho01OPLZHTjczeXB9O2J+5SpQ1Yr4Y5ehhyKgUHwBGSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft5zDK4CVzxHPhYfZEwtvG68SKw16XwLSXV+zDY9si0=;
 b=a1k2pF+fFpAVGPTK+znNP0Wt7ewXDAFgSac3LJur0ksZgxjDC6EWeeGQurirjqv55ze2T/ok0iNE+Kc6bZ2IItGcIO4+DJ5YBvj66IY9uJ9zYZDRFYH2MtSmpH4MCXheiDMzfjmoEe26TZss9KNglux1w+UiBBvUVuyF16gldLP06iHtKeIqirFhWsXzQmRR/t041qtormJHtM1iWY9YpMJHm/JWXPYhpHMyYM6RSKbODScRYEtsLly6leWskuHpyyz1+i91MwMBnY3AfHbn4sZTQaxYoGdBD5uZZahMA6NTPhT3WjK7p/0PEY2489q3TrGvasPtns9fBAyJXusq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) by
 IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 04:09:51 +0000
Received: from DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e]) by DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e%3]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 04:09:51 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: nas.chung@chipsnmedia.com, jackson.lee@chipsnmedia.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        xulin.sun@windriver.com
Subject: [PATCH 2/3] media: wave5: Fix kthread worker destruction in polling mode
Date: Wed,  3 Dec 2025 12:09:34 +0800
Message-ID: <20251203040935.2685490-3-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251203040935.2685490-1-xulin.sun@windriver.com>
References: <20251203040935.2685490-1-xulin.sun@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To DM4PR11MB6550.namprd11.prod.outlook.com
 (2603:10b6:8:b4::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6550:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: cded814c-fcc7-42f5-4a7b-08de3221ce78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5/yQzTb4QbOANZRnkBzfoHR3SPu4rvwbPy/GlasQ1rXuMYfAm/Sl4gl9Ovqu?=
 =?us-ascii?Q?kSnTkD9nBRj6tTBKbmniNz76aZAugnbMcnB2yf0AWLoFewefR8e9trddPeFm?=
 =?us-ascii?Q?eSdL9hS8iqqTE096+QpXIa13YIssgwDJKg2/CvJWb+XGuPljcp8DWoHvbThi?=
 =?us-ascii?Q?+R45opurnbK9N9IDxsKygWZWsiMKY1AXRMpaYnOExo68n6c0VksCC6j9Oebk?=
 =?us-ascii?Q?DQwbu3P6bf6fF9mFHvBbpkT2HdjpAamcXSCwWpPqfmURP3TKnGseuCQGKma5?=
 =?us-ascii?Q?tsl/KwjuoXjRaDZYyQdfszshTaeTlVf00mNPlMiAeo/WxUys9Gh6tFL9K83Q?=
 =?us-ascii?Q?mPaRDpGHkuGGk1YZQ5Q73/M6PBN36qZO1vkuMW1KbCQHBPzN/T6wFu3KVnin?=
 =?us-ascii?Q?+IsQbLgQSDVT76WNg1UVD5/P70Z7NLZJYgBj20RnzCJJXI54AA/xbCZixYBA?=
 =?us-ascii?Q?XpYs8lk4gBdb3JGFgDhCqWgF3+4pscDiz8OADESQ7ZDmRc88DsFgYKojdxh/?=
 =?us-ascii?Q?1YPuYZVTF8NCO0LQ1H9ORk+O2F1CZZ8X3zO1CGpmlzuMPF2er+Zs3vwa24HD?=
 =?us-ascii?Q?w7aGShahr00TycTUOq03s3M8FfP7WHWh/MQFWPsMqL5MxNUqeGFkN4mpi+vm?=
 =?us-ascii?Q?4L4fuOhEGGYTP7AnuRTv89VQVUUeF1048peK1y+rwnvD827+GyHoCiBhar7V?=
 =?us-ascii?Q?b/LPRs8sQfWPbtDwJ3dOWue9q5vRRgoWWh+84abnlE4XsMNKqYN2UB9J5mjY?=
 =?us-ascii?Q?HucFRr0n8/iMoYhdfh2vKUbFNLinJMtptmQRUWkHS8km9QyVKP5zQ0APdNRd?=
 =?us-ascii?Q?15sHqWK4sjkgOLLE0Xy/rh5ylExtpd1Ur4jSPdB5Rjx/ApGDnna+cJoMd3iH?=
 =?us-ascii?Q?HGyzDoUchfAlHuY3cXLzlLnOxY/NPcz7kufy/qG/w71vyYt8NlSuLwOmI5n+?=
 =?us-ascii?Q?Gp9RwYprl6/AxqQnsYjtSIupY9wup1QjGnPVeEzGrAzorEqWUqMECe0Wrdur?=
 =?us-ascii?Q?BqvFdGJ7DKDFDNAebLSOiRT1FltPQFLAELC2bFMXhPEoqBN6IkFjtqaAwZjF?=
 =?us-ascii?Q?dYp9IGu2uBBLKURDuIdBD5L56f8SQyBEVaiqrbdbKNlIS6/QSkDJwA2AzoAR?=
 =?us-ascii?Q?tEuzWUGBn0j5Jf0bp47MGgxkY5jiOkQn3NcsELhN1qIoJ0A9qBCRrowAUhx9?=
 =?us-ascii?Q?Kc/wB5JjFDpvcmoaHT/XlfcHWTmCz75s08UC1xtHQ0LdqsDd+Z339Ne9nSby?=
 =?us-ascii?Q?B5RfrPtFCF720euHYUfjvOR+d/Y2usDJkV3IVsga2uhlsdu6XqLYt0NfUGI8?=
 =?us-ascii?Q?FWtVlG7k86nVXMO3HPbjsHX7KZG5hEkPUQzuW6yHsfzsTm/6H445UmFIb2M3?=
 =?us-ascii?Q?jMk1wy1Z2L8iWxzpWp1l52+Rr1VfbRiYxzEB7z8E8Vr3aVxf/Uq8LoTTnawl?=
 =?us-ascii?Q?Q8r0PwQ+GggwzNylq6MlymTLft6tMZ3hSp1C2iB66aQA1KhXq2n547TIF+Rs?=
 =?us-ascii?Q?frKJWS875fZPAqv8rXSSKlEO40BJQRkwXlxh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qMGu9U43vfVHg/FeCnkBP1xjeiHRGP3Jxi2+q8SSRolUunJtGXOGL073tuw1?=
 =?us-ascii?Q?JdGKlrHQXRBRiYRRUyDGCvYok4Q1MiwgZXyKVTEZkXUvOrbyda8A2YNIG3pC?=
 =?us-ascii?Q?xR6MH7okrWNr3U2muN5Z3V4KkEGCxRLlPVIpKHtOdrBECIdip/skgh1Gowx/?=
 =?us-ascii?Q?yg+tAJnI1BNYK0AJpu6DlAf302G6PyVSxTyGuKd5VEk+i4aHJo2zmRedvpHr?=
 =?us-ascii?Q?gIHtAwCiZxqf4Hi5F/p2lMRPBZHIXqJ6XCsvn4MtJQp/ipyHjMB7cRdySYoE?=
 =?us-ascii?Q?a0JMjGMGKp7EAYcdIslQAL3wPjzvUyDCh2AA4JhOH3wGSRESt6cz4XE1ByJJ?=
 =?us-ascii?Q?hj76RamS0WIDHkRMlkOI8OlosJMFnjGje1hu5Ay/93Hz9chnPVrbmmBVOUqO?=
 =?us-ascii?Q?vR1qc3ywVAXfBBlTBTxRVgNXC7HmYhmtTR2JxAdtEShfVF3akMkt76vxxb1C?=
 =?us-ascii?Q?oobrBnIvli1qCIIfzZ4pa7SPjlW5Pe/H2PDu3V31D34GEIL+Dyk9m7LpZMQJ?=
 =?us-ascii?Q?klJffanDQJ1s8MQYGYd0E7jAY8KiHw5ET7Nb5SxAeqnQ1+B67lqqg79VHyRf?=
 =?us-ascii?Q?fkQyEf/WtuJ8R4ULFksSnx0MDvgyVqGqoZ3c50qOe3Y6KXgrsOJURGvHQPGM?=
 =?us-ascii?Q?QP2lsJBNy4QIdDPM8iBxmMgxvE98BydOLy6nuY9J2JdSwfCIOixY8v2Ma8+1?=
 =?us-ascii?Q?LEr7qCrcSYBkcJCRDSgh98FbAHlwUB7w+p+JLb0wyACYoP0fp/5Sx5tYXrBs?=
 =?us-ascii?Q?Ccpg1Iau6MkRzWcDYtDKe612YN442lFKIMiNxbY0VoOBGTYqlmtPimijTO5F?=
 =?us-ascii?Q?i+ndgk2xVQVECSbR2n8xDpDyCqdCSHpgPQmson4HYKDiakuCzh2c/uVK5XzD?=
 =?us-ascii?Q?LFmWx9mW3y6bMF/QtZjlB9TXAP+Hp2UB4Wp5C80/AORnQ9/nIBK4Ms6vahRC?=
 =?us-ascii?Q?VOEooqiHGQ7oIpBx5BhEII0f7MU975uiVsms0PcgsQ2m9kW9nL0GnQhq1Ke6?=
 =?us-ascii?Q?NNA0XL1/EfCKKpWPRe9FZm7IvZj8jRaboeC7FdoudShT0pU9PUhmUZ14EU06?=
 =?us-ascii?Q?bnNZU1v/93RjVvqg2T3LcZob2giZ3tacvMo2eSozrJhA3+N+Z2Iw8vZKkQEC?=
 =?us-ascii?Q?c61/JYVLtiNHIiULD/1kamLi8Bs4ShhulD3BY04NYJTvQfljpYDRa2UbZkSZ?=
 =?us-ascii?Q?zK1Io3T0t3BW6kxRUaXfoIGm6r2xskZjVnZEikliMD45bFg9xxsK5/Fes8u4?=
 =?us-ascii?Q?EtL2NOSNwfmsq50rKHIbvDJRaaDfLokOYPH/5vVAvyTSo4g9E2cvUbRGr5Zc?=
 =?us-ascii?Q?7GKh8j30tu0on+1BgNzl56IlbA+C6HWpFlSHdDc6fSTg6mrKneEJ05cF/TgI?=
 =?us-ascii?Q?EE+fO2rfCl7QuwPiVcfD8swMjoKAsxqOxAUkFzkTdQeGPdMvJ6KqFjHBq+Mw?=
 =?us-ascii?Q?UQ59bQz3ci4RXN2uGjqhI5O+6nhssbQDFDk9XovVLQHkBWNst5Rq2oFZc61E?=
 =?us-ascii?Q?w64f10n/Df83zPsTVoTUzE22HIGs2utmSbU0ofwErqkc8UfZUkQSak0Xw846?=
 =?us-ascii?Q?9VfOe099n/zGN+f9Qf4fbdujN12Qh/N45AbbUP9Js8t+A+s2LbcdoiM+X07p?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cded814c-fcc7-42f5-4a7b-08de3221ce78
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:09:51.4538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPj+4oPflKfD7cEelINR+oAjvQtuAYHqSggaHKCi6SHELQknCIIG5WuMULKI6L1gVaeLkZgTkHjGLelYFEywRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-Proofpoint-GUID: PcA00tr102Lk43-CZO5AaRQX2phWTgGE
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692fb811 cx=c_pps
 a=2eujPE0xRaAfCuSU6K/fwQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=qIpOT1Y7RMXHqj30YzIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAzMCBTYWx0ZWRfX2Nnj9Se4vTsa
 Lll0BKmC6s9biKyxURraVCIvSZpGOHeucWl3V1Bn3B5/vW/DBRdiCXSQ9FchSdV8AxDoX9nH/gI
 SQ7p+LjNWo2+NZGIeHakwKQ9Zc9wmfJa/uJDRed0XAnAiqgEGl7hIC3yTzteA4uxQpFReLasBXz
 R9fI8u2JYk77UVn9IQ9zA/A7WvcmthepWk/0GjPZJtP3HcLNCiAU369GFYFzSs1bXbMwVFPUr/F
 9tChvGaQOUhwqbYi7fVGbkrBrMJXKnwjYVOeCCubzATzFpa+070o2L/rUAlBeO7QjvcozhvOmB+
 2T4Okhev9KAA6w+0P3UaqeSDoHWi/Uec8iTNM1CPzFcK4+OPd6ZeaQ01W4Mxt8/j4y05ZRSYF3u
 teIhNd72bg18vXrvSpAvExWN8iHwRg==
X-Proofpoint-ORIG-GUID: PcA00tr102Lk43-CZO5AaRQX2phWTgGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030030

Symptom:
  ------------[ cut here ]------------
  WARNING: CPU: 2 PID: 1034 at kernel/kthread.c:1430 kthread_destroy_worker+0x84/0x98
  Modules linked in: wave5(-) rpmsg_ctrl rpmsg_char ...
  Call trace:
   kthread_destroy_worker+0x84/0x98
   wave5_vpu_remove+0xc8/0xe0 [wave5]
   platform_remove+0x30/0x58
  ...
  ---[ end trace 0000000000000000 ]---

Root cause:
  In polling mode (irq < 0), the driver uses hrtimer to periodically
  trigger wave5_vpu_timer_callback() which queues work via
  kthread_queue_work(). The kthread_destroy_worker() function validates
  that both work queues are empty:
  * WARN_ON(!list_empty(&worker->work_list))
  * WARN_ON(!list_empty(&worker->delayed_work_list))

  The original code called kthread_destroy_worker() before hrtimer_cancel(),
  creating a race condition where the timer could fire during worker
  destruction and queue new work, triggering the WARN_ON.

Fix:
  Reorder cleanup sequence:
  1) Cancel hrtimer first - stops the timer from firing and prevents
     new work from being queued
  2) Cancel current work with kthread_cancel_work_sync() - ensures any
     in-flight work completes
  3) Destroy worker - now both work queues are guaranteed empty, so
     kthread_destroy_worker() won't trigger warnings

Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 23aa3ab51a0e..0bcd48df49d0 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -352,8 +352,9 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
 	if (dev->irq < 0) {
-		kthread_destroy_worker(dev->worker);
 		hrtimer_cancel(&dev->hrtimer);
+		kthread_cancel_work_sync(&dev->work);
+		kthread_destroy_worker(dev->worker);
 	}
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-- 
2.49.1


