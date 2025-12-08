Return-Path: <linux-media+bounces-48369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E15DCABFDE
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 04:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CC603015953
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 03:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0082D273D84;
	Mon,  8 Dec 2025 03:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+vRQ3Q0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A7526E70E;
	Mon,  8 Dec 2025 03:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765166133; cv=fail; b=D31YFvK2U00T4dbt6QPZR4LN7NUZvuwYjEKHYQIiDrjwBk0ey9t4ljdOQskIGTLgLPIpAzG+vMI2VmsFq2lx6tW0m+MdnACJEz4JuMoG4H+TSrnRo+th45945ZiHHqLEIi2uRFNJ/XHVqGFb20NvXmS/tMohJMuxwUkLAcMTG/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765166133; c=relaxed/simple;
	bh=KvJh6stpK3kagjbq4eajvSUfh476b7ArvWb286Dzs40=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pM6H2OD9V7TGWsKctCHvlvIpJzq6he/3hrrnEU+Vp9JkSdRQ2lyItZ/ViIHRVE+zZitNrZ10ljjCKQkAZJPnxIG/HlZY7SW90XVaL9pBt9N4LOLx+7hUjY0Kiow/+bOmjZBOy79BHgv+2DdDFmkCsaPNUhm3QBs6RvizBQkdtxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+vRQ3Q0; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765166131; x=1796702131;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KvJh6stpK3kagjbq4eajvSUfh476b7ArvWb286Dzs40=;
  b=O+vRQ3Q0ncscRgQuyFDc5TocDu4JqL++NRIJQHRGdYGYoEDEXLOSvY6L
   DR2j89jYLGwcnncpxfizUhROiKduORMxqvEbsebFX+/jKzXEjYz/tNNpC
   t5lOjCWrr9lR7gqEhrmeWXZhpeaJ2GTPSLAbtFYbOXDVJTb9WfqQMcF1y
   kDQFJdHBmZPPl3xL58Kk725cx5Qj4wm9JUvY4yE0JXY4s9SeD4pDu6toP
   J72mtfQC5ekYFgpbphfghx/GNQmLB1B5DsFC+uxb15pPngQBNF5I8Kno+
   1uQSFyem/Pg3q2HxSHqpGO6UW3RNCtcKUXqrcJwUVDI1kejzwma74yFWa
   w==;
X-CSE-ConnectionGUID: yr/yP98uQVazaJutI1+rKA==
X-CSE-MsgGUID: 6YmfFeFgQAGN0MNJHd+W8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84708776"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="84708776"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 19:55:30 -0800
X-CSE-ConnectionGUID: RQcbzm3FTWeqL4B6xM6QpA==
X-CSE-MsgGUID: ivDrVvewRqOb68KE+Svq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200745444"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 19:55:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 19:55:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 7 Dec 2025 19:55:29 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 19:55:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVlfzx48MqqMf0SgqRnUXLHZ+tObc4bECQk2k9RFr4BtdaXX+NdrwmFRjUM/cvpkh+7zM7xkhsd3AnAx8SW2YlFkO+PTwSuUNd61ddZWelHFksYh98CDi6aa7rWS54FN+KItv6KN5q0yh4fthWCsQp47sXg4H/90DRsbXvhyFY1KzHUnED/g7kuZ3zPyjg0cQ49V/k/3Foocf3MSp+7ndLERWQDLvq34grjNwjan3wYn/QRQJ2f/VQ8Ety51F8sF2EOEBpvqKCuI6iFQRjMPnwrA0pNYhR850uVBR5w6LufhlKTSIH2YW4hGRqP9BiITH5pejByzIu0Rcdy43CIPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdA32+Sl/bNrNx4m3M00xA7Of8Mgn6l6B9u8mX9WOXo=;
 b=p6Xyl7R9ghmLyjTxp87GhYZy5U4D1tRWR6BwGA0NWWzk0kjVnpMnIZ9K17xsvPY9jimIE6qqh84M8MKJVsvzxh7en6MNPAyU75kwc0yf7iqXApHZzAdoie8P3feC5z0a6g73RCFntDetdFBDACdtjdXyAD++iQmRuDOAcjy2q6Y21Fb2p077yveIpdpGhjDaAyLfH5r3cE6b6sUnhBU+JY9IPDyKxYAN9D6bl3sJUG6OSTUF3QRS214zpB+7GgTLUg9FxekDCaT1gEpB2bzRSTFeGUK73qlIW1Y+ji//+IIGEBOE2F/n1j3dKRfml1kHa/WmT6du/CwiGA7JBVnGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
 by PH3PPFA3FE8A23F.namprd11.prod.outlook.com (2603:10b6:518:1::d3f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 03:55:27 +0000
Received: from DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40]) by DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 03:55:27 +0000
Message-ID: <f30d1971-71f3-4c72-9a68-b8203b8fc194@intel.com>
Date: Mon, 8 Dec 2025 11:55:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: int3472: Use actual clock frequency for DSM
 method
To: <johannes.goede@oss.qualcomm.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <hdegoede@redhat.com>,
	<dan.scally@ideasonboard.com>, <ilpo.jarvinen@linux.intel.com>,
	<bingbu.cao@intel.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251205095525.1264971-1-hao.yao@intel.com>
 <d4f08e2d-8257-ec95-9f67-7514240a4f82@linux.intel.com>
 <aTMs6PB2O58KbikU@kekkonen.localdomain>
 <d036f6dc-1150-4478-a3a2-cdb5723ae4c7@oss.qualcomm.com>
Content-Language: en-US
From: Hao Yao <hao.yao@intel.com>
In-Reply-To: <d036f6dc-1150-4478-a3a2-cdb5723ae4c7@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To DS0PR11MB8230.namprd11.prod.outlook.com
 (2603:10b6:8:158::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8230:EE_|PH3PPFA3FE8A23F:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe0d2f1-4cf0-48e4-11c4-08de360d9f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDJJRHRQK25Ja0hMdld1eEFubjZNaTIvWmM4NktqNTNaSHpGTEZ3RDErb2ZJ?=
 =?utf-8?B?NGpqZ2JsL2FXY0RVbWhZdEpXMjIyK2dpMkdJUGZsZW5qemh0cmRDNWVUWmt2?=
 =?utf-8?B?eHh1OTZ4WEZVbkxoQ0ZoUHhHRWo4a3hudUdaWUM0L1g0ZGdlUjlKM1JERjJp?=
 =?utf-8?B?ZDltakF4K201ODNoUW92UU5za2MrMkVmd3F3c1hjTk5waGFtbm8yUGRCYkxZ?=
 =?utf-8?B?bHJpSXFUOGJsalVMQ29ZUHEybGFWWjl5MW1XQ0cvNmhJV05NRXlYUFVBZXpY?=
 =?utf-8?B?NTRBY01hZ3E2WGI3VFdjRjhxa2RmaHVjVXFtSVU2OFhRdlNLT3gxeWNIQjdO?=
 =?utf-8?B?Q21QNnB2WTRlaStXVEZHSGZiMktMcDNKQzZMZ0o3TlQzOTM1SFBsWGRGRUp1?=
 =?utf-8?B?aUp6R3dQaGhvVnB6VENNWFhJVldJcUIvVDFtUDFmekVGejkwNXZYdUxpTGlV?=
 =?utf-8?B?OTA0dmtsS2gzd2lLNTJHR1NzbUlISjQzQVlrYVNheVUwV01McXM2emVYbVBC?=
 =?utf-8?B?NzFCN2V0d0VXQnF3UEFxOU5TUUF6bVFxM2NwemtHamxvQjJuZzFJTTFBejRF?=
 =?utf-8?B?Tjl5S1cvRkRmaVp4MkY0eDhpNzFvZ0lhZ0RXTWEvRUNUQU04TTdnRFErTXUx?=
 =?utf-8?B?RFJNL2lrdmZQL1B3WGl4Z3FGMXJERW00QjlybGk2SzRkWU1xaGJaYStsbzQy?=
 =?utf-8?B?Yk1oVktha3NHeFc5TmV5UXBNd1pmQlRTamVQcXQvd3NQV2dJeU4xSG8vSlhi?=
 =?utf-8?B?cXluc1JMWUpicUhCSTdxaklQNmNxQm5na1JoY1pTNnhjY3NTMHZQOXZsZ0d0?=
 =?utf-8?B?ZDB4bWpWSUJBMmhJeklEN0g4bFY0aENpd29waDJWMmwwN2VrK2VUbkc1dnY5?=
 =?utf-8?B?YkpKc1VaRUNSb1BKaXo1WENnWE9kMFI2cVVGWkJUanRDeHpkL0dMTXhNeUNz?=
 =?utf-8?B?cnM5QXJ3ODZ4UzA4d0dPZ294dVE1K3E3dDgzdG1BdEVkdGhVb1ZlN0x5Z2pP?=
 =?utf-8?B?c0RlYmlrQ2tqTXFTeitmTWFwblJUS2hIRk96azBDODFzUG9vMG54aGpZNEJX?=
 =?utf-8?B?dzFob1NKUnpjR1k0b2RZN3crLzQxeFB1RGphOG1CUDNpV2o1VVZNOVJOdEh6?=
 =?utf-8?B?d2g3N0Mxdld2bUtsWVZXSE9XbGcwODkwZzVvanA2YVN1U3A5QmdBMW82MkQ1?=
 =?utf-8?B?NmFtejg0ZXlQbnppQnczYmFGRXU3RFV4TkcxVWQ3aFJTR2U3NjExOW5scXY3?=
 =?utf-8?B?ZFVMMHlpa0xuS3Z4RzB0V3NmRml0MGN3WkhHSWJ4RS9hcVI0TDc5SThrZlcy?=
 =?utf-8?B?V0RlQXJMWFZSZExEYnhUN0ZoY1d1SllxQS9VWUw5bkdsNXl2dW4rRHBUTWJB?=
 =?utf-8?B?SUhoRUdmRjdCOHdNV1lTOFFseEZNQUZwZC9ILy9BRDN0cENZb1BhMVNyZENw?=
 =?utf-8?B?aTlNTXlvUVFQVUZIaGxxdy96eGxKN3VrbVllWWJQOHBqbVl2N1c3Ukp1RHdt?=
 =?utf-8?B?R3lBMnk5OHQ4QVI4Vjd5RFdPR2R5d3BjNVl1NDdlclJxTnhtaFRJZVJRZi9R?=
 =?utf-8?B?ZzZmaVQ4b2N2cjQvVEVCd1ZyWWJNdlQyTlZtUmxVS3haVm5mNzNnZThDZjU2?=
 =?utf-8?B?QUljOERWSWdBb3FFK2VTeWRmK0JHK2dUaG96QUJUeTdKY2xRMTFBQkMzaGhC?=
 =?utf-8?B?ZGdUOWhOUUVZVEV2QVVLb2YxeVJOY1JsMU03ZHljeWljSlNaSVlxOXVDUW1H?=
 =?utf-8?B?RThwNDNCZ3kwZ295dTQ0elZmNXV3a3BsWmJIaGVhUWtKVjV1MzdzdjNteXZw?=
 =?utf-8?B?WmJ5K01jemdtN1lEOER2NVI5VndudDIvQ0Rodi9vVzhZZkpTL05pRllmc3Ju?=
 =?utf-8?B?S2VFSVJjVjc3V01IWm05V05lczE3YllkM21xM21uZktxQmdoWXJYZEtlUCtl?=
 =?utf-8?Q?pIBovFOugEchovRIoyEe5VPVXeaF4dTx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L08yTUZzQ0dTVE1QVEpRL3B5NWM1MDhhclIvZk9VTEtXbmhhWmVpYUJGeDNa?=
 =?utf-8?B?MVIvejUwUmx4NlJFcExjZ2VKbVBxcnFCWXZJbjVXSHZDejc0NHVDc0t6UG9k?=
 =?utf-8?B?ZU02ZE9FK1U3NnFmcVJBNDA4eHJ5b3ZmaVJ2RG9LcFFMemorM3c5T2hQWlFU?=
 =?utf-8?B?RjZUMXNPWmFkbGFCczZBVEY5ZG0xbXVpR3A5VVlHQWRVQ2NPSVNmbmR0QllB?=
 =?utf-8?B?RVM3Q1lya3BFK00vTzlsdEF5OE5TUTZmUUhJZ3YrVnFTUCt1b3A2VU4va1F4?=
 =?utf-8?B?L2ovTmRGbjRGeVZqTEJDVlduUDVhZGdaUS9HT1JlWDZUNnQ2bVZrN1ZyYVVX?=
 =?utf-8?B?RGl0UGlLalVWb25jTGpwaHl3dHV6Qmd4TW1lNHU2L3dPeE9nbnZVNjBHMGxP?=
 =?utf-8?B?ZmQ2UWtKMUdQRVE3WHhQT1YwL0MxendQbDFkeS9nU2xXVkJDMGtoVjJOQzN4?=
 =?utf-8?B?UW1QUU1zR2o1RDUzSmtxZ1J4bnpQcWJzZ0lsVU0wTkFvWnVvaVliS2RlMDRO?=
 =?utf-8?B?Y0RhOHlHb0pJRFBwSE5DU09BUFVzRGxKRWpVeTJwcVhFcDA5RkEyakYwTk1H?=
 =?utf-8?B?elovUDZSb3EvaWN0RnE4VUYzQ3ZCcGNtVmJQclF3R3Z4MTh0K3d6b1VoMjBZ?=
 =?utf-8?B?NEU5a1lLZFJ0c012QkhOWmVWQXFMTVAzenJqcllVenVzUzZrMFFZNVZKbjNZ?=
 =?utf-8?B?eVZ0RXE4b0hCbDVHYi93cFZLc0NqVDB2WW5QVmtVYXJ2ZnIrSjFrMHlaNmcw?=
 =?utf-8?B?aEF1Q2ZTTThucVJMNk50NEV6VXhGTk5vRkZUaVY3ZmtGNENVQW0wUUwwMXVU?=
 =?utf-8?B?WEFKelBaREQxUHRNYXcyeVFOWFZ3QTkzOGozZXRLaGpZNkQ2N3k5SjJmS0wv?=
 =?utf-8?B?Qk1BQXBqcG5TVmUyRG1tS05Sb29nVG11MzgxRG9yTGpBMWJQRmVJa1JVWXEx?=
 =?utf-8?B?Z2FpNlJVQmFHcWlXL2xIUkNxMmRraHNDTXh2a2lLNndoQUM4SVVyMlZUN3hB?=
 =?utf-8?B?UW9NQ2J2NzZuZjE5QnJHaUdtTmZtUUVvazJvQ0RqVWVkNVNqdnE3ZFgzaVN3?=
 =?utf-8?B?bGs0NVZpNmRiMGJyM1gycVBkdFBMVFNwakYwcEpvNmFpVHpsMm1QbXZmdk5U?=
 =?utf-8?B?c3paYjZ6NHQvSHFqKzZqWTMvejJvRlorN2tQTGx3dlZURCtzMjkwaC9kaGt3?=
 =?utf-8?B?R3diQitZQVhFNmMyTWFmbDJORU5QcjhmMytFdTNBb242UE1qRmtlanFNY2hL?=
 =?utf-8?B?eDB4Mzk3cEZiT3pXT0lKcG50M1hoclVTdVZXV0kvUkxMT3hyMVBENXhWMGJY?=
 =?utf-8?B?M2h0bUxwUkJNb25GZjUvN25kYVM2bTNjZkFkQmhEOGhUVmxzQ1FTbXZyYVJW?=
 =?utf-8?B?SWczWHdleDVaaUw5TU56cVlFQ0liK0NZc0dhOTV2YWRQNmc0aEczOENxNnE2?=
 =?utf-8?B?dEs1VEZlVWNpUmJqOG1pNFJ5aCtOYUNlbTVJMkZlMzN0amJWbTRaL3JBS21x?=
 =?utf-8?B?K0hYQ3E2ZFpjMXVsbkF6Y1NSTUJiaHN6WlJPOEhWTTVpSEVPa29MVzU1b3JG?=
 =?utf-8?B?NHJ0eDlqaGo2RUpVN2lBWDhiWTJBVG1CQnJXMHVkRnVXZFpQRU16YzRCL1JW?=
 =?utf-8?B?V3BreWhocGlaMTJsdTVOWHd2c01lY1kzYUdoUVFyY3cyQ0JlbGxicDUwMENE?=
 =?utf-8?B?TklGZ1VoVU93ZHpkTW9LNHBCOVVJQnJvU0QxNFJlbkZCOFd3RU1FcmdndHlU?=
 =?utf-8?B?cFh1Qk4zaUxrQU1rZWkzS1pNUjUzWXRhbFJLMFI4YkJqOTlGclZBcXRnSnQy?=
 =?utf-8?B?SEF3ajZhaUp6MWNXaXRBRWFucXpxQndRTThQT3NxcDlnbkN3WWFYRlA2ZzZC?=
 =?utf-8?B?cjhvZFlrVEJVZVl0L1ZramRxNUlWc3pkQjE4bnJnU0hMczBiejBUc0xpSUlz?=
 =?utf-8?B?QkxwU2x0c0tVREVXamx5VFp3ekcxWWx5NXFqWUUwdHpQSnQ0eDRtQ3NvQjJD?=
 =?utf-8?B?cngxZTZmUjVsUE5vSmdiWkoydHNoN3ZyV1hMQkdKdGhtcVZGWkNyVk5OaHJE?=
 =?utf-8?B?Q0lGdzFZMStOVXFBaUY5R25CTUV5NG9ha2taUkVkdWphS2hkbitUMGhLU29m?=
 =?utf-8?Q?JTuQ5ofSCpFAz+bEhUjHlG8J2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe0d2f1-4cf0-48e4-11c4-08de360d9f6d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 03:55:27.3130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeDVl2ovck87PWZO9FfS+Io7gCvDLyHcQtNjFCzRVwCCfP9VN1ri38wH7MaJB3n/8XWWTcYlHtYBHk/XZLHFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA3FE8A23F
X-OriginatorOrg: intel.com

Hi Hans,

On 12/7/25 22:43, johannes.goede@oss.qualcomm.com wrote:
> Hi,
> 
> On 5-Dec-25 8:05 PM, Sakari Ailus wrote:
>> On Fri, Dec 05, 2025 at 06:10:10PM +0800, Bingbu Cao wrote:
>>>> +#define PCH_CLK_FREQ_19M	1
>>>
>>> I like 19P2MHZ.
>>
>> How about simply PCH_CLK_FREQ_19M2?
> 
> +1 for this, this is the standard way to write fractional
> MHz clocks.

Thank you. Will fix here in v2 patch.


Best Regards,
Hao Yao

> 
> With that fixed / so for v2:
> 
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> Regards,
> 
> Hans
> 
> 


