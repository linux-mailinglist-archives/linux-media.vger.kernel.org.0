Return-Path: <linux-media+bounces-29188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94CAA787F6
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 185733AEE12
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 06:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CA7231A4D;
	Wed,  2 Apr 2025 06:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oNZKQ1GR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BVDG7OzH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFFB230BE3;
	Wed,  2 Apr 2025 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743574486; cv=fail; b=p91VQqtuvpNBReDzVRTphhY1OZ4mrsWUtg1XLP6ANJi3G6siHdZiC4YpFBYDQUmjRHzywL5qK4TfDOI3Ofh2JIeffgRZeQp8LP2bX9vUL2mdP92BHE/qj4YosIr6tZvB0mhqsrQSMZ9FHCbgmOR4femJ9qrsflhGgqETW6vQBvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743574486; c=relaxed/simple;
	bh=zoWqn1MvsbE/d6OWxknpvxZYmNtbh1jm7YSq6Kgcs9k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DrcTsmOvhZNBG/T3GULMwuP8LBAmijNrVM7502PHFXYGlSX1LOr+MnFl20v5XTBWVH5KapWjarAnbURIeHy9IUFP/ThIphMbuOyUm44Gfg6Oz1Y68OBWKKNGXcs9TjcwUoLkpWoJLXCyzHaaBveimMOlmvRSrXRsmyOrULZk8PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oNZKQ1GR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BVDG7OzH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531L2IMk003875;
	Wed, 2 Apr 2025 06:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Yngij6zIQ0iw/vGIqecRZ1/QC/DbRwCjdn46Rw4rLyM=; b=
	oNZKQ1GRxh2RluanLy4TyGIjjCQysNKKpgZtSzf0CHPghZypL2KazS3RLxTLzTwf
	SkjWbVFbFXIM5gPbbqX1L7sDE1l/baSZwrwZehrJKt5Loeu6tCwPDjuHBOgD6bSM
	/49CeUgHe7DFbN3A2ItN5HZPvwKr7r5weDIVwHXw1K8V+F+PeTQ4E0/8+LkXcZGk
	BIMBjr8XSY6ck+/RxvqusBtA9T7br3fFWtwyiUCwSD1kQqLkxLy7M2/jAspOVpBN
	BM1CtRwuBOtUusiQmvVIe8ola469lVVcy6W+ozcHco8ItaCapf7rMA5klcFOu3EF
	ZChdlXKmGyCsJY3sCWQ00g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7sasr4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 06:14:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5325t9GV004624;
	Wed, 2 Apr 2025 06:14:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aafgcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 06:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/FPeeBcIbc11OzkjM9u9zlKDThRZ9Z67VuiB0/O9BumlZF13YO3bZLUZowHFwIjtIPFWaUwsxs16uBNd2yyN1g5p3dbCeyvHIMziRVF1HUuV1C+3mY/VTxZTjCrjR2kKV+/jvt5feFm9A4c85FUHANJMkCbk2S0wedHh8EwaNTF3E/6gFAxJiGWQeSMPGhOGQwmmVPzjiFFVSYjvB5vYZjxk0/DWhKJqjzquZTvRN7zJwmSHHvyxXqbObp5UYRMvaXHORvEP1eUhN+3wvubUGHDc++7eyH6e6/2+x2Mx+IJMkndEH51QZoaw0K7unM3uhW75i9xKEBxeVM9HkNxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yngij6zIQ0iw/vGIqecRZ1/QC/DbRwCjdn46Rw4rLyM=;
 b=zOc9OMfDahB3NDmdJ9bq72UzDOZIA1YxUFQXveM/K0SufeQhue2OCHWqrqHRRQlazRr8CuRUuV0B59ijnXTEffQe+dWpEMQ9ij24ed+L0bAqVNry/PKVcwdItS/8PtzPJGnxZq8cdIZv8VtZppRf6rAsqF1lIkNJcNTd8lgt7B3wLbID6gwNbJRVTtSDJFDUbE5gSWZ0kF9uJ363AifUexm2hY6Sgfhy0KLWTb1awcjHbN8F0ax0qOs+aH8HY2VeMg8kffY9YQgHIUPD8AgpuARLEwpqksFKBDlVn68m3Nv9CJuBU43KMgSYUTV98JitbUDhGXpkgiOVhlgCvz7K4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yngij6zIQ0iw/vGIqecRZ1/QC/DbRwCjdn46Rw4rLyM=;
 b=BVDG7OzHHNU80S1pQ1JuL8360/ekP4TojvwgU60iNfPuVWESsw0rshUxgBfSuHy5aca+1YE5WqlZVKe1piG1prOmTDygYtDnOtAzgIOY7d0NgccEZawh0YtrrEfOveBsjAC3IyvdcW3yeOCDZMsNuRbmrnoyiiVC4txEwEgOuy4=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CO1PR10MB4740.namprd10.prod.outlook.com (2603:10b6:303:9d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Wed, 2 Apr
 2025 06:14:34 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 06:14:34 +0000
Message-ID: <b32309c6-617b-4dbe-a49e-8a1b9a56a327@oracle.com>
Date: Wed, 2 Apr 2025 11:44:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] media: vsp1: Add VSPX support
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
 <20250401-v4h-iif-v7-5-cc547c0bddd5@ideasonboard.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250401-v4h-iif-v7-5-cc547c0bddd5@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CO1PR10MB4740:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb0c802-743b-4c23-9bec-08dd71ada35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmE2TVI1Q2dhcXJ0Q2V4SnFRWDlDWU0wY3c3b2l5cC8ybHk2Y1pmNHd0elFD?=
 =?utf-8?B?WFl3dCtBTC9VZU9qd1YwbTU1Mk52K2VUZmszR1h3ZEVqa1Y2U3AzRU9PbFNH?=
 =?utf-8?B?ZXRiWWdxSE1zcEJ3bjNLdGRZQURRQ0xodzBLUk1TdW1mbXc3ZUFQRHVqZmk2?=
 =?utf-8?B?amk1QUNGL1dVaXdqY3FPQUltQUdSdWJOVGh0ZGpOdkZiOTZLNlJrNnVhYVBR?=
 =?utf-8?B?YVpvbWpvUmVEcjd1ZW1uWXBsbG5RZEpiTGNYWDZDeVB5QzZLQlZlRWhyV2xJ?=
 =?utf-8?B?MmhFS3NHbC8rcVJoSzVBQ211aHh0QTRBRVI0dVcwU2lVYWttM2lVU2h4OGhn?=
 =?utf-8?B?OFBOZXZ1Si9CSFRYcDZ5Ymt0SHMwLzhiK1lzRmR1THQra1FPV1hLZmwvNjUw?=
 =?utf-8?B?YlZpd012ZGdwaFAwUkRSSS9udS80UjJIaWNFdzJDWk9ib2pETWIzS2dQWjJ4?=
 =?utf-8?B?RWYycjhyNldHVE5mRXd0QjFXdEtoNVJjOXdHMWpJOWhVSG15aWl2MVpMVC9Z?=
 =?utf-8?B?YXIwTGlsQkVjRU5xNkNlN25jbXp1b3RMaG94K0FERmd1Y1NKSU5hMWIvYWc3?=
 =?utf-8?B?NFpVMG1ublMraEpuTVR4OWZ4SXFoMnFmWGFoYjliUWl5Nk9WSVBIaTBZSVI0?=
 =?utf-8?B?Q252MjcrRm5IbFpMU2lrNEtEc2JzMWlpNUlvSy9sZVREZjNWTjRTVnJWa0py?=
 =?utf-8?B?cTUxdzhYTEwzbDZJTVoydmZWamNNNDVST2RnNjV3UlRZU1NMbnpSN0cvRUFl?=
 =?utf-8?B?VW5pZUwrUTZZc2RKd1dLbm1YN1R2U21pMXBub3pSekpRZk9vUDc0eGpGQks1?=
 =?utf-8?B?OVo2OGxDS0VLZTQxWVB2QUJTNjU0NC80VWJFeEcrSVVxMjl4OGtHSGdtM0J6?=
 =?utf-8?B?R3AwMzRrTFhzakYraTE0QVlROWs5ZjlOcy8rZ0ExV2dvMUF1ZUd3a1pCOGd3?=
 =?utf-8?B?dFk4dHIrQ2NIeFM2Zm5qa1prWFZKRGsrMmQ3RUErb2hPbzNCMGFBTm1xdDB5?=
 =?utf-8?B?aWtNRy9QNFFOekYrZ0djRTR0Y0R3SnR1OWJTTmQvbkhJNVNncEh3U1hra05p?=
 =?utf-8?B?bTBpWDZFZk50K3JMSlROWUtBR2YyaVlncTc3WFAwUllqejg3OVE5RFV1RXlh?=
 =?utf-8?B?WUIyazdqbnVvTmFybGhIbXZKZ0Vqb3JjMStrSDltRTByaFZDM0RNcEM2ZEpu?=
 =?utf-8?B?VmcrM1RqRDZmNUoreUVkRlRWL2Z2YkJBa0RMUUx3UTNuSENPaDJ1eVYvekRP?=
 =?utf-8?B?c0tSSGsrYUhhelJPWmFabnZOOHo2eHVtc1ZWdzZQaWVVWTNrNW1USUV1cEVi?=
 =?utf-8?B?dVNJdDNoTmdkdGtNNXRZY294Z2RhVDd3eXFDcHBHWTIvV1YxOWdlWDl4UnBq?=
 =?utf-8?B?YzJLMWp3ZGppNVN1SkFCV3FYWE0zaW45eWYxak5LdHBQWTVNZ05KU2t4U0JX?=
 =?utf-8?B?ekthY0R1M0dBNDd2L2RTUG54emd4SkZGVFFtWHNBdDROWkFCSG9sdzAySDlB?=
 =?utf-8?B?Q0FDOTMwVjVyOTd3aGhUd0FQTnRZYktBSUtnc0xPNHBHQzhYQXlvZnFMRG9N?=
 =?utf-8?B?UnpIcTROcVI0eG1oU090TUJrNVNvUzFubnRWNlhLSUZpUzIwVm00d0RNaXIz?=
 =?utf-8?B?cmJ3T3NFdnpxcjgwSk5SODdPZFNXZ1ptOWN0RC9VNzloTklRamZtT1oxMUM3?=
 =?utf-8?B?eEZqTXAwNWJJMFQrejVaTTB2MWZUeDZJMkIzUnFLcEd0Sm8vL0g4TUpZY2Fn?=
 =?utf-8?B?VTFqZE50b25PemlJTk1PU0xZWVpNQkhiM24zbDJVamVQWFZJOVdtL0gvdmdm?=
 =?utf-8?B?UmJTZmtBcG1NczNaRDF0TWxTT01iclRBZENDbXp4a0NKU0xveWFQeURQQ3FM?=
 =?utf-8?Q?duwI7M7BKxV1j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3BGZDJEeHliUUJrTS9hbW4zalNoa2NDRG1JL05XQXRHdllPM1VFTnBlbjdz?=
 =?utf-8?B?SU9kQVBpNG95L2pLWWowMjZ2Yy9oMU42Z29rL29NQkxUTHk1WjRVQUp2Vkd2?=
 =?utf-8?B?NlNtYmYrKzA2S1FoY01SbEtIL3N5cm0xSzE2V1p2OEFYTU02eU9lTWFHZDZz?=
 =?utf-8?B?eHhPY0o5UW1lRWd4bGpQUSsrM2ltTDJhTDJaOVVsYWV2Q0Z3SDNJZ2V0Umsz?=
 =?utf-8?B?aGZzVHVFSE5YWGxsbEZWQnFFOEJ2VHVXS3p6NFI1TTdTUTlyek1IQTc2TFJW?=
 =?utf-8?B?Z1hBSkE3YXpVa2gvUmNSWm1jak5Eem01bnBiUXpxY0FlN3IzUkgyTi84NFFt?=
 =?utf-8?B?MkgvcHMwaDYrcmFRNnpoS09DUUg2U3VtbjF0QkJZRWtYdHVmOGpWZjJLeXl4?=
 =?utf-8?B?ay9OL245aUsyVUFCd0pKbS9TRFFPc3F0dERJdE1Zc2hnRTh4QmthRUtGUGVQ?=
 =?utf-8?B?ZjB0U2gvQklYWWgwbzZCblVha0UvVkF3ZFBTc05MNVJBc0dpakJ2aFEyckN5?=
 =?utf-8?B?SWtoOCtFRWFEbGhlNTFXeGNPcEFVVjB4Ny9xelZnS2pyeVJ6WWtLZFBQeEZQ?=
 =?utf-8?B?Yis3bUNjV2pHODVpYWhyWlpOdS9oZ01sN0JOS051N2hJWDdpS1U4amxXMzYv?=
 =?utf-8?B?L1RKZk9mZmdudjZ5UmNFYU82ZWE4OFJGSjk3M1p4NmxGRWFCbWxFV0N0Vits?=
 =?utf-8?B?UnNqWDRyNWZCSStHWElLdTNSV05xZVJ0NE1tc09KaGlKbm94OTF4M2VncnR3?=
 =?utf-8?B?SXJuM05yUmpwV2FDQUlocFNad3lzRExubTVteUZUanNMWkE2WEZoQzZURUZX?=
 =?utf-8?B?Si91SmpoVmNHY1Y3em9naDVqcm80UDN6Z2tvbTlraVJLNTVGQ0FhL055eHc3?=
 =?utf-8?B?bVBWRmhWcWVISTJRTGorWkQvOGRlUFFJUzFuNkd5R2JRSWo4VUxnbkE5WHdr?=
 =?utf-8?B?bEU2c082OTlmaUtldnRybXdQdUhpL2hrbEkwbld1Z0ppL2N1ZXJBYUkvZTBa?=
 =?utf-8?B?MUgzRDJFY1FMYlJ2eVBzUDVydE4vUHVtWUZkSUhQOFFpcDZUZlNEUDg1Vkxu?=
 =?utf-8?B?bWZoWkgxVVhMcUpjQkloVjZ6NFJYdmtWa29ITEV4TU9GQU5lNk5tU1RkUmZN?=
 =?utf-8?B?ajNLRjZSbHdnVThqclV1QjNSVjJIUnpLUWJSOE9nakFxTjJhTHFZWXc3OUZ5?=
 =?utf-8?B?QTJadlJDZXAzYXl3N09hV1RueFU2T003Q3RESnhFUzZhQy9pekpocXExM1Vj?=
 =?utf-8?B?NkdzZFk5azUveWdYdUpZV2lpMERvZEMxblhIUk15KytUS1ErdmVad0lLRDdy?=
 =?utf-8?B?UWl5TGl5bXlHQUFCSmpWUkN4NEFEWU82NkNWKzRYMXpsVTJFR2kzcjVNaXky?=
 =?utf-8?B?Y1ppZXgzdm9nN2xYQjg1eGFSR1V1Z3lYVTU0Mm4wK1NqYUo5VHk5M0J5R2dy?=
 =?utf-8?B?ckdOSVFWblNSTGxaNDE4YTcyUGZMOUlPM2NOZnZ1S3BINXZKazIxSFFORHBl?=
 =?utf-8?B?TWdtWHFkK2pFd014NjVFMUNxSDZaNUpsNVFkM2ZjV3JISS9lOGlJTjJsQnhx?=
 =?utf-8?B?UW5Vdzl6SnMxeDdrWVFENDJ1Y0UwYnlldi9odUExVldpazF1L0Flb3l0eUpP?=
 =?utf-8?B?UHJXV1VpMTA4QlVKMVlNdnRoWkhGWndFblM0UXBWdDBsMTlubUhMY2I2MXhH?=
 =?utf-8?B?alA1VUJQODhUcHZvMXlQSXJlcFB3bnVCZFBRS2VQdUNHMGtCVFMwVERlTmJp?=
 =?utf-8?B?OC9RamNuZGYzSmxtaFphZEo4bjhxOHk1eUhHYVdoMzJRRHVKeENEeGs1SmlU?=
 =?utf-8?B?dHpvc3BSa1RFcG53SFFWM2lqT1ozaHpJM2YvN0tyZXhCT2RVZjBjZElnWnkw?=
 =?utf-8?B?djV0WmN1QVd2MGZqc2U1MjFiRkRwdUVib0pvM1JWYVVDanVGa3ZEQndNRlZZ?=
 =?utf-8?B?WFBMREhWNmlDNjU5dG41WWJkRU56a0s4TGUrNndiclBKS2pYZGlDc3Aya1VF?=
 =?utf-8?B?MGlXNksyT0hqbmFsc25zZndReEtPSTRJYXRmaVhZOHhlSHRHTHNqN2RCeEpt?=
 =?utf-8?B?RlFqRytpeDRyZHI4SjkzYThyNitDYXNYQnNzeTd3Nm1vVThVNG5SMnl3QVMr?=
 =?utf-8?B?ajVQcklSMlZ5Z0RHMlFQUGlyb054ZkRlWHIwZEtDWkZ3Q1Q2c2tuYkJmOXll?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VrqEgBvtwKTkMt/uYddKQNLWxPIeEv22x1g+6QWho4w8MQ4gG3YOvHJpqnabPHYlP++JZO+hV1dqQW1EZzRvb0nIvqGvVPaVs5lFC8rzy7kKgTRtw+ifBxal7NgQLHjOWC7LVx+gZt3fc06z0uXPQ8DJJgEPaNRqIKJP/rtC+TtpdUjm47AOqdB8aINXSvXpb7MjZEqEf5dgbNULPwskyqfOiKxC8Csg2DHtOvSvtyxP0WwurbPYOHyyR0Oxe7+lXxeKSFuZqN/dw7+RiIYpUxP4d3DMnwNF9b0Gm+0DWdaS062IyG+eQGYF+EdjX99zO1LaM8vfnbJ+bd3M7cMv9GGKFGs7WtoPxm0r2Q1MxhIohb+jORDLe972nIAjQZer8NZ9acwzn/RivdHgN5q8O6H3emlOaK1Pbjr4R7RMdvWdiIrkQNM2bw8Hcukh8j+hqSFfWq5ZC6LAquht09zaplssnqd3z97W42asLLOkY8I0w81Y+RX96EMNhIjEA5ZQmDxQ+HbxZmnoKNS2oulboG6Ds4+jg2HQdMzEN8MWLEE8YBG77HGtdUudXqZgDv5384vSwM1K8ya2YAIzQGOXT7bTss+4BbPm7vxhGFUz8ww=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb0c802-743b-4c23-9bec-08dd71ada35e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 06:14:34.4818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnzp7I4834B1rCE2AlNpOsSEReFT/85Lxeo2Bc+2OnbPrwSIh5ECieBDM3zSC7LC4QnskHp6C085gYGqeP9YXPp5kdCSe2sNpoTLoTesPQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4740
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020038
X-Proofpoint-GUID: J4ndgA5Eaj0obxQB9Dx3G4JGREDw9pxM
X-Proofpoint-ORIG-GUID: J4ndgA5Eaj0obxQB9Dx3G4JGREDw9pxM

Hi Jacopo,

On 01-04-2025 19:52, Jacopo Mondi wrote:
> Add support for VSPX, a specialized version of the VSP2 that
> transfer data to the ISP. The VSPX is composed by two RPF units
> to read data from external memory and an IIF instance that performs
> transfer towards the ISP.
> 
> The VSPX is supported through a newly introduced vsp1_vspx.c file that
> exposes two interfaces: vsp1_vspx interface, declared in vsp1_vspx.h
> for the vsp1 core to initialize and cleanup the VSPX, and a vsp1_isp
> interface, declared in include/media/vsp1.h for the ISP driver to
> control the VSPX operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>   drivers/media/platform/renesas/vsp1/Makefile    |   1 +
>   drivers/media/platform/renesas/vsp1/vsp1.h      |   1 +
>   drivers/media/platform/renesas/vsp1/vsp1_drv.c  |  13 +-
>   drivers/media/platform/renesas/vsp1/vsp1_regs.h |   1 +
>   drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 604 ++++++++++++++++++++++++
>   drivers/media/platform/renesas/vsp1/vsp1_vspx.h |  86 ++++
>   include/media/vsp1.h                            |  73 +++
>   7 files changed, 778 insertions(+), 1 deletion(-)
> 

> +
> +/**
> + * vsp1_isp_alloc_buffers - Allocate buffers in the VSPX address space
> + *
> + * Allocate buffers that will be later accessed by the VSPX.
> + *
> + * @dev: The VSP1 struct device
> + * @size: The size of the buffer to be allocated by the VSPX
> + * @buffer_desc: The allocated buffer description, will be filled with the
> + *		 buffer CPU-mapped address and the bus address
> + *
> + * Return: %0 on success or a negative error code on failure
> + */
> +int vsp1_isp_alloc_buffers(struct device *dev, size_t size,
> +			   struct vsp1_isp_buffer_desc *buffer_desc)
> +{
> +	struct device *bus_master = vsp1_isp_get_bus_master(dev);
> +
> +	if (IS_ERR_OR_NULL(bus_master))
> +		return -ENODEV;
> +
> +	buffer_desc->cpu_addr = dma_alloc_coherent(bus_master, size,
> +						   &buffer_desc->dma_addr,
> +						   GFP_KERNEL);
> +	if (IS_ERR_OR_NULL(buffer_desc->cpu_addr))
> +		return -EINVAL;
why use -EINVAL instead -ENOMEM

Since dma_alloc_coherent() never returns error-encoded pointers
IS_ERR(ptr) check is not meaningless here ?
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vsp1_isp_alloc_buffers);
> +
...

> + * struct vsp1_vspx_frame_end - VSPX frame end callback data
> + *
> + * @vspx_frame_end: Frame end callback. Called after a transfer job has been
> + *		    completed. If the job includes both a ConfigDMA and a
> + *		    RAW image, the callback is called after both have been
> + *		    transferred
> + * @frame_end_data: Frame end callback data, passed to vspx_frame_end
> + */
> +struct vsp1_vspx_frame_end {
> +	void (*vspx_frame_end)(void *data);
> +	void *frame_end_data;
> +};
> +
> +int vsp1_isp_init(struct device *dev);
> +struct device *vsp1_isp_get_bus_master(struct device *dev);
> +int vsp1_isp_alloc_buffers(struct device *dev, size_t size,
> +			   struct vsp1_isp_buffer_desc *buffer_desc);
> +int vsp1_isp_configure(struct device *dev,
> +		       const struct v4l2_pix_format_mplane *fmt);
> +int vsp1_isp_start_streaming(struct device *dev,
> +			     struct vsp1_vspx_frame_end *frame_end,
> +			     bool enable);
> +int vsp1_isp_job_prepare(struct device *dev,
> +			 const struct vsp1_isp_job_desc *desc);
> +void vsp1_isp_job_run(struct device *dev);
> +
>   #endif /* __MEDIA_VSP1_H__ */
> 

Thanks,
Alok

