Return-Path: <linux-media+bounces-65630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hHVpFisQPWoawggAu9opvQ
	(envelope-from <linux-media+bounces-65630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:25:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A46316C5148
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:25:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=NNsbK1Gr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65630-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65630-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=windriver.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 520E13052FF2
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 11:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6303D905D;
	Thu, 25 Jun 2026 11:25:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C5C3D88F7;
	Thu, 25 Jun 2026 11:25:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386720; cv=fail; b=ETjgU5LN6pz1XJXvJhL67IvV/TNTjLF9qA5WH8uXsTXWQMLxEhTmWAUXwjhexkLGpJkh5fLWZa/G6ESD8L5G9jBEkBBuHMiF6A+N3GdHeMFkcvIwl8L0lO36HtKlyRe58hyVo936fHtDfI8nG/aaDV8LxEUOrh9A4AB7o/0AeCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386720; c=relaxed/simple;
	bh=mDBbMdJJMCvtShUFUfHDGRDDl7e8UTsey4tLuT23Fd0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tIferer3v03WBBZ6QqiR2vLgXL0h0sNOl+k82OYKZVf/nNtesQPt1Ly14TngoO6ke3IEypUgPbLdB9WYL+muL1CDcscmkuMwu8qb0q4SjM5BYJ7fiRUa2k8WAzWX98spjom734mAHUZjoC36s7jLKhKY+4RhByxi9cKWiznmbVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=NNsbK1Gr; arc=fail smtp.client-ip=205.220.178.238
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P4qIqZ454569;
	Thu, 25 Jun 2026 11:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ytuhS22cF+H5ve9faQgaPittdOfvePEdXhskFeUU2Vs=; b=
	NNsbK1GrC91OVl9k70o9OWqziu8aOV0Of6aVSSnt93Vj/aFqxIL3r92u9q/whPy5
	2ZSlTVouq3StFRXTFF711n1216SqfqAYoHB/WwcYJHgYxk4kmY3F82XCHARBmbwY
	H2JyMrRsYSooAH1tK/YFWV89L2gPTnWmzu52+eDFUVpb8wR0meYseZgeIaxMOZ5P
	U07DnXOTEFEuI0C9ykUtB0Bhct/ehv9KRPlcn+UYNiqegbvtkqCegvprn84x0KhC
	eMfx374rcC6B2CGqn7qJrL7T+dqKYM/vXedSoBqjr/HBgwOiLTb3MsoHCKorZVlF
	H7m4IKw7qcwVcsJGMQwiEA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f0t5dgj3h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 11:25:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rskms0t0d745CV3qWSxN1AsWp+1n2A6SIoIUi3vioVEK1stlbHcrTM0jdAf+Cdr2kuFd7HZcp0aRu530hsBYWggEu7p/ZeOODQxKoWe0C4hbCqf0jkfwtiYZHOEEepNPMG7eQh/6ku5MwdiyUuAjpG8jRTldianh3t5B0gnjGKwdcDzgprbWc5Ov+DBx/2KR5xxmcM7SLMOUUAjOIgY35YwpflV36qawnga7hJ6l2uMRdA1xwgOWb4BzLuN0zutZ7N0VGeTJLR01/DLjMfVKuVBEaLEHatqo4I/waelEzSP3JFXc25ksqGqzCLWYrjFhFx+6Nq/aiVG4STUV8k7lYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytuhS22cF+H5ve9faQgaPittdOfvePEdXhskFeUU2Vs=;
 b=BqB9iKRjDM+hjz4WpNaGiG+EGCmzFKx+koGECLbHlnmU3thJFdituHtCv2pChfXlsF8IZaI/eYj9kAcIe70/HEhyecA6vqM4x4mBcJK//KhEehtDLDyaFVPqzu1rHG8wRiDAuRF6b4tN9NtjoZrW2gNxEVJfrNx0vTxYu8gTjGyczl8O2xXG4molIGXGVSIjr/C/GzRy51HgsxncCKHzRf0TAKxUnYqgbr47oC3VjutqEnXGsA0/m0voKwvF6GVWa3gOneHCgAKpJ4gafyEsTyjWKRL8DwAM7AZMdSmd/N12Sksf6xLETzOFljFRFt4kDLMFOgsMWsTTGBQ9nB/h9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by IA4PR11MB9300.namprd11.prod.outlook.com (2603:10b6:208:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 11:24:52 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 11:24:52 +0000
Message-ID: <53782a92-ca2a-4e48-b9d8-b420741e952a@windriver.com>
Date: Thu, 25 Jun 2026 19:24:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: dvb-core: fix use-after-free in
 dvb_frontend_open()
To: mchehab@kernel.org, kees@kernel.org, linma@zju.edu.cn
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        yun.zhou@windriver.com
References: <20260610083055.3976083-1-yun.zhou@windriver.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <20260610083055.3976083-1-yun.zhou@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|IA4PR11MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: 2439b88a-a7c8-4b71-b915-08ded2ac5fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Oo0Ei9DC2ZEptVzTzHH5GR3w/tUM9lfryd4zTVAIQPFb6YeBwRuYDTjrJkHTu+vXKAxIw6cS+kDtG+0VTy8GDgLjOyb3likXuFHC52QBxQFeFDRoyxgqo5Fgk7XRV2N8m4r6s2M9ialegZO1qdbdD0k1r/1bDlDDe9A4fp9eOGpKlsEM2dDqNcrIqW8qpbH0wXN1NBTFv3QwBT9J7igjlwV2NI6z8pVxalEZBG68we+Hmm7r5YGzHygdSs/ulzFgDsMQiWqxVbCLA2oa7aH1NrziuCohYdeQ2aaxiraQ2IflMheL7b/gA+S0CxbAQwnuLeTeYDlDqST5Fi9nPT2J/6I/td/yI6t9FjYJ40hqda013IcXrxxlXq1LRq02sN355OlzVSaIWYRI0oWbYQeHwCsn1t0j8PQpZCnWHmqIVH+CftySzOZTsYTr8MfgcBmaax5jLQYFZlOTOLpwzqS4GqHpHOJ86vEdpyCQomdN7gP9GHA/KxWSQi+iPQqN4APdxqHoYGxTScfb57tP0y8EAW7ykCU7n/RVG64hFixv/laN0fFG3g+lp/z6WCe0l7jteDDYVcmNv5pIZTNViH/sr6Rh/h4Ly5bgVPGh3w7t3PJP4xVCsteOJ8nzhFbiaMPz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnh6SHphNHRXZ2I1Sk5FYVZ0WnNWaTRmUmZhRGNDNDhxZVVKRlBPSlAzV2VG?=
 =?utf-8?B?KzU4RDQ1amtWdWt2ZE51QXVoTlk4WlVFMDZRcTdxaG80YWxvdnJYdTZOVlIz?=
 =?utf-8?B?OGpiSnhBcDErMUFTQUg1emNuYUloOGRQTGNOdVVrR0NXT2FJY2pWMnUzQ1Vz?=
 =?utf-8?B?RzFzaW13ZUpFS3ViTmttMXpXejQzVzhWYXZyM0hJMDc5UGRoRWg3bXpHUjhh?=
 =?utf-8?B?Z2hVVmRkaHdSOGNnMjhrSVBUNXdwQVVobU1Ua0ZuWXNRMEJGbm5oSlRzOHRE?=
 =?utf-8?B?NUJmK0pUb0ZodjJjcVNRT0xqVkRtQmU5OGJNakpKYmpZMTYrQy96TFgzN1N1?=
 =?utf-8?B?WUxWY0NWK0NCQ0o4bzBlRmlKWnFReWNFdWNpTmg1THE0UkUzNUtvbmFUWEdQ?=
 =?utf-8?B?VnBoRTgzNlpmWGhsWkVSNXUxSW1VVlZaa3djL1ZPdFFFQmhqbWJNV0FFalpO?=
 =?utf-8?B?dC9zYUptQ1BjVDlRSUFXY3pOSTVpajR6Zk4xb2NUcncxcjBlVW1CRDhnK2dL?=
 =?utf-8?B?TldlRmpvb3FvTkRDUnl2dlB0eE1KUFg5VTlXdzBRZkhYNjQ5RzR2YWFmTXNF?=
 =?utf-8?B?VU5GMHB2czN1YzVyNmpjdnV1TTl1SGxRcFZFY2JUeTgwMlcvdjdhODlXN0Qy?=
 =?utf-8?B?bUlaVWM3V1d4WlZXOG5Yb2gwcDdzWmd0L1gybEZ0cVFiSlo0Ym5UTy93OFRX?=
 =?utf-8?B?VjdqSXlqRm9VRm1OdE45UXRIQmxDa1NpTGFDTkNTbnFmN0dhMm1ncTJGMkc2?=
 =?utf-8?B?dDlMSGtzVjNIays4alE5NGlOTXRYY3AxR05VZXh2Ym1nU3BvVGthazExWVBj?=
 =?utf-8?B?eTVVQ0l1Ulk4V3pNM0RWUll0ZUNtUkRIajhWV0VpcFBQQlo0SitONkxWTFRh?=
 =?utf-8?B?ZEJINzRmaGs4cjdRcUE3NVdDemRLOGU3dG1Ob2JINUs0WkNKOVJ5TUl1MUpj?=
 =?utf-8?B?ZXlRZHA2LzJYMkdjRVpoS3pPRy9EK0s2WExoUUNCWHpQMVZ2ajQrZzZ2R3da?=
 =?utf-8?B?eERuaDhOSDVDenBYN1ZLaEhDR2tmRjFqMkJkR3pzYmpwQ2pvWTZCcUUzTUtS?=
 =?utf-8?B?TU9hRE55SmtPdFgycTZFVUJvcDQ4U1JWT0ZEVXIyWFlSR3N1cW5NZDdoWVZF?=
 =?utf-8?B?SHZNZU80ZStCZnpDUjJlRXdlSGd3VW5oUU5sVGw0ZkxlckUzN01mRU5EUlVz?=
 =?utf-8?B?Q0ZZQzJWN2FqWDZranQxWTZXdUVnSjRIODZuYUNERXZ4UHBGMVQxNm15b25w?=
 =?utf-8?B?UXF2NGZnVlJ2NmFBempycnk0ZUZPQ1Rlb05ETzhIVlFNcGhzU1g3ZFh4dkNu?=
 =?utf-8?B?NmR6Z0dMenlCUGU0a3N2YjZmMEZUVnNnQmdoSSsvYmpUeDJNNWdobmozSkhi?=
 =?utf-8?B?eGhBT2xHTDhiQkMxRW5JZHdXRjRLUGF5R1JwVW8yWGxOWE9JVjlpNGRUVkF4?=
 =?utf-8?B?KzFwUVh4Sm50b3hkcEx0UHdZOVR0MXJNeHg5bFhBUUNEQjYvQXZJd2wxcURp?=
 =?utf-8?B?S0ZRaERWNnQ3YXNzUWlabHRacEFzYUpyR1lHdHo5UGZQck9JbWJlYkZWS0FV?=
 =?utf-8?B?ZlpxWFExL1RLS0NJWURVemZVenYyQnRiS1lqaU44cWwvWTdGS0MwYWdJclVD?=
 =?utf-8?B?RllXdUlBSjh5Z3djZ1h2Sk90b2k2cEEycWFaK29nZmgxc2s3dktHNFNJcHJi?=
 =?utf-8?B?TDVwZFNLeUo5Z0tpUWRiZ3BMeXJ3VFA4VmUzREw2Ym5uRm4xRVYxeDhBR0pC?=
 =?utf-8?B?Z3JpWHdwZnd1K3p6MkV3bDFpQmdHbnkydzFVTGxKcndldkdQMnFwSEkxODlI?=
 =?utf-8?B?Z2N6NGRRV01lSW4xeGttUmdxc1BFdHpMZzVYbXl1bXdVbTV4dUNzTnEwZjdY?=
 =?utf-8?B?RFYrTGtsRXBCR1NIdDE4ZnVEcVJYekM4VUR1cWlkOGVtR1NwbmNzMmIwQW1l?=
 =?utf-8?B?V3dEbXBZa0FQREsvTGxWbUJHempnNHA4dWdPLzgyd1dVbmNiUWFVK3ErbXg0?=
 =?utf-8?B?bSs3bjg2dU84VTdTMCtPQ0hPS1hmUzZSVEV0TEdFMjJRZWV4Y3NRTTAzc1Rt?=
 =?utf-8?B?R0FLNmZoWXYwLzl2cXFKcEV4bUZZMTdiR1RQK2twcVlLdmJBUFdYZWNKUlRV?=
 =?utf-8?B?UFRCRUtCTCtTVURtRUpReml2clZ1VWluSFNkdThkZ3NyOGR2TlpGbXZOWVNP?=
 =?utf-8?B?ZDNyVEdzWi81ZFAvSm55cTRURnRkTTNQQ3dQT3JPTEVCbFM2ZytQSDdEeXh2?=
 =?utf-8?B?OVhHdDgxbEhvOVBtdWhnZG96ZmtYeCtOdVpnV0ZPRHFaZElOVXE3Z1VYTitT?=
 =?utf-8?B?aFlTWUNjcXZDTDZNeW1YQmhKV3o2ZnZ4cWVKRWNhWElHTVpMalpaZz09?=
X-Exchange-RoutingPolicyChecked:
	f3VV62txXX2kEUtlf0LChGMhFgXmifN2bssnWp5CK41x+qDoGRyznVFdSkDqOdisvcQKuQ+4Y3XgSkkOWl4aB6DbmhbBNQmcQx0NIZtSzUg3SXwylkUkFxKVSLXkRWncEyRuPekKTwg9cRUzSJ+gfjPBJQm5QeRWBM5xJHIf1wSBn/eneJw6iR+kHI4vGwhaDQKndwx1zsuELsfzq5SnkPRuiBavEtcpSpSbqZ5I/hOkOl3q1ysvn5BJTFOa+pIBd7uexv8HK4xaQOKbRipGgoCmAbMQDscniFzyS0jrZ6JY5mdcUSrkE/ST9faC8kXUcTlePJgOcgatPfojTMB7iQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2439b88a-a7c8-4b71-b915-08ded2ac5fc9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 11:24:52.0032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72uAfxrkkh5syS0IIAXLvWzYIX5Eclqp6Z1osmNgd7WkYokaVn1Dhenal9aTVIFOYXF9jEmy0+CwFTy7VuPRHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9300
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfXwKmGNgL+SvFu
 6QnLK/0D2TXHb4inOVe+MD3AbL/xukl9v8rpteAG2XLwU3IM8aeggDznpeGPRFq+40G3b/d5ljx
 beREmo250zzzYi9cdleVhKJ2ojsRtGW1lTpAHLZqLdahybDIhOqK
X-Authority-Analysis: v=2.4 cv=HOvz0Itv c=1 sm=1 tr=0 ts=6a3d100c cx=c_pps
 a=/NeaHkXls/iJsjBnUIdqww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=6GENO9LqX87v1q-aSr0A:9 a=QEXdDO2ut3YA:10 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: r8Lsluz6Ni0q1MtMwcuuYg1ahHxE1E9x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfXzuDh5pkHYey4
 o3sJK1ft+hoV4gU7PnX+ga6nWbwU0YcHuQh7+C8Wn0I5317aI9wChQyQMSsdkrnFBkCTHXH9Es5
 BHIDgf6pMhtwuJ6m1kXGTl+4WL6ECFQ29gfHpd0jo/KmbK48zPcJxVikxSyoGGbBLBSxRY7LraC
 58UydypTzXiGIh0P3f1t+1s41B9GJFSuTi4ZWYHGBYrpTaRxMWN4J9Ofx4P0s/atoxPuawRamkn
 oQfTjAtA+qblQL2m5cccahBoICvfQL7/SvUny1qSrdgxDog3S9Rr4OpTtFEzuBjX9sc5wuW/4ou
 x06Sj0o9OciuetQgwMfm6LtC3/KsfHicQFVGeOmOGw0TCfR/WCDYv9zG5Mq/ecMnbUPxTHl2dpg
 f9eJ/XEP7O0wjFC6RUsc/krM20z5YKfxzNHOAXWbzCQfrqLeF+se1ak7ziaCFhF0hnCA63PH7xN
 WWt1cp0W7HhFOscSmMw==
X-Proofpoint-ORIG-GUID: r8Lsluz6Ni0q1MtMwcuuYg1ahHxE1E9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65630-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,windriver.com:dkim,windriver.com:email,windriver.com:mid,windriver.com:from_mime];
	FORGED_SENDER(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linma@zju.edu.cn,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yun.zhou@windriver.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A46316C5148

Friendly ping

On 6/10/26 16:30, Yun Zhou wrote:
> dvb_frontend_open() calls dvb_generic_release() in its error path after
> dvb_generic_open() succeeds. dvb_generic_release() drops the device
> reference via dvb_device_put(), and then dvb_device_open() drops it again
> in its error handling, causing a use-after-free and refcount underflow.
> 
> Fix this by incrementing the refcount before dvb_generic_release() in the
> error path, so that the put inside dvb_generic_release() is balanced and
> dvb_device_open() remains the sole effective put on open failure.
> 
> Reported-by: syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
> Cc: stable@vger.kernel.org
> Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
> ---
> v3:
>   - Simplify fix: increment refcount before dvb_generic_release() instead
>     of introducing __dvb_generic_release()
> 
> v2:
>   - Fix Fixes tag commit title
>   - Add Closes: link after Reported-by
>   - Cc stable@vger.kernel.org
> 
>   drivers/media/dvb-core/dvb_frontend.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index d082b6c57c76..608525d08277 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -2887,6 +2887,7 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>   	mutex_unlock(&fe->dvb->mdev_lock);
>   err2:
>   #endif
> +	dvb_device_get(dvbdev);
>   	dvb_generic_release(inode, file);
>   err1:
>   	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)


