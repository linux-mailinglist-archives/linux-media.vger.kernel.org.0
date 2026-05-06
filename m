Return-Path: <linux-media+bounces-60686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wN1nDtaz+2mNDgAAu9opvQ
	(envelope-from <linux-media+bounces-60686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 23:34:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8DD4E0A67
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 23:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CB4C30173AF
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 21:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E895A3B27C5;
	Wed,  6 May 2026 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FP/kF4AS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F453559EC
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778103251; cv=fail; b=LxBbGOIpXvOVUImAVgsqYohKBf1L4wZh663t98FLrmS8kbOSpH/A99gMnqxiVaeowCLSOJXhvo46rhm7lKqFGTHSKnbBotX5rLuO3nKLtF3Xddv1vEnM2ous0J8rtYbf94P8bkohO//6CRdIN1KyLWgPImhT564HjHOlBlP7SD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778103251; c=relaxed/simple;
	bh=pxJ30+YOOG7Y9g58Lopci6DaeqDeX3aZfzVocfOjq2A=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HtzopzXzKzN3BNvODHn4NBxQVoLQEWLCwq0Camac4A8+oMw5Dk0OgLYLJ07Sj06rtUv8dOryyD1mHEkuBhyMkaC53nf6kwQJqW3OoXdLg74hG4cad2QwM5fr/sacUV9q+kI/o7d6GLbv5YdZhgQAr+07MMbjmrnnkfgZBEpb/KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FP/kF4AS; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778103249; x=1809639249;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pxJ30+YOOG7Y9g58Lopci6DaeqDeX3aZfzVocfOjq2A=;
  b=FP/kF4ASy+QZpKydvB90/tdNgDG9RynEEG66/uDdppzgUyYBmN1zdO4k
   C15vVcWHau/KjWtT6r/+NirnOCjEoMLepmxlb6kz7XHvUHq8yFUss9iAy
   gDtU2HPeipV1mP1fN+gP9Y7aNKdGe1+/x1WU76Eq7L0Fc3jtLn36MZVOE
   1nRDZQLHN8BxqzkNmydj49tkEGwPqQ6JhricCjT3qwgUvJelz+1/ukjHP
   oflmENznKlaYb6+pYLTrGgaAqARlSEasvKAUc6SpMJDUaZ3Besfk6XSg1
   N1669+pEyPAB3t0vUfhYUIYgT9Cl8y5lluUubd2IylOijR6JG9XhCf3ue
   A==;
X-CSE-ConnectionGUID: YGkb5a3PS7GGNV12vQhl3A==
X-CSE-MsgGUID: Nzu+iFcgRHOug16zj5/+QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89634532"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="89634532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 14:34:09 -0700
X-CSE-ConnectionGUID: 42b2O1VYSW6GpK/tapie/w==
X-CSE-MsgGUID: tjoQyICKQEOe0SQnyA3p3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="240256495"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 14:34:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 14:34:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 14:34:07 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 14:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyanDBjUsUXewD26lKiZoND0x1Tit9nvuWigndEzCKqwI7mLieR439ydSoRs0t5MomiwBj62yEpbdFHE5lNwbr8xfuj5e3Fngn72FD6UhlIf8YJGpx8kiSrq2c7vQN0nCN7fjY2GjInjV4R/ErrJkNlia3VE2swaMC/IzROa6JkBvi9yPImTrRGivKGfDLwUXQSZaMzbOTexdDM3uMGmhntOnEvwzl03lnbf7TKaBQNsY9owIqdcpKNXRh7cSoH6X4HenZaDW73g5WTBEkxTErWHF49KlWP7Ekkq7lk7OvKqJUggA/bX27v9D4cSYCLMYKXA5nc26tdz1abHr6NvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoRnBa++gyM+YRHY16MKu94aMUaQGYnDqdpsfAdoHJM=;
 b=MYqiboabM9zjVRC6yMN2jULqBnHyY8QyP4TIZ6AzWCniFxSJGlAisajLUCL4GjkFX8AzO4B4fMyRHm36exLUJXFYern4M29k9wd3bvCN3Radphl79QretNZfdHk3XptyHWvf/zZQ8okbe+rBbsILxEiFHGmG4G0kG4YQ8Wf/2tAkfOlOdApA9FyyxDqWvQBtIkXv/y6V7Tk48YdCnMUz9WSEU6W87WTwnj3jhzf9LZNOFHjpCH348xhUthehZT0BYXwPTfT0QTk3iKhBU1mE5o6novt/d/SwNa1eIvpR3XwPw2fux7GkXYsB5bVFzGI9Lm6CCqYH2qKsWjrNj8gO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 by EAYPR11MB9946.namprd11.prod.outlook.com (2603:10b6:303:2da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 21:34:05 +0000
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43]) by SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 21:34:05 +0000
Message-ID: <7faa78c4-5e73-415b-8c10-1a3c1f16840d@intel.com>
Date: Wed, 6 May 2026 14:34:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: i2c: cvs: Add driver of Intel Computer Vision
 Sensing Controller(CVS)
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	<linux-media@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <antti.laakso@linux.intel.com>,
	<mehdi.djait@linux.intel.com>
References: <20260505223005.84162-1-miguel.vadillo@intel.com>
 <20260505223005.84162-2-miguel.vadillo@intel.com>
 <177805672969.3225262.17973373065597618604@ping.linuxembedded.co.uk>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <177805672969.3225262.17973373065597618604@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:303:b4::26) To SJ2PR11MB8568.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8568:EE_|EAYPR11MB9946:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd19c34-1871-491f-7949-08deabb7329f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: GECx/GX0THlZAuBQ8rhWZ+bqZKSS4ptva1beCEGSmc+9xOYBdUUHZva3JeLnUJzqbRtYxKLrgthBrUXlsfCqWnLD+VF11dtulUkuKy778lHZV0OenE00hqTAuxDNwWfggkB3ZWhF+H4rkncFTZnSINglmhPoa6V4ocjT49Z40s8Snav9bh6mZdNmz9Q0ektu+cDCcvGEB0l3i/jwn3D8W6sQjz7is2fj76X/2eSOk9O1xQUhf8CP2KSJVU+NqSAWSj6LnvAV0CWOvLOa67A6Png1yOakMkV1sY1rTN4HV3PpHUtZHhf2vuHk1iagwl94HhXfI3W8LtUOwhHHdrFJBNQCw7kt61PQHloUqJ4P8vYo7uzueE15TPl1RIfXd5epzOYDoXhbsu1mL12z/P6Wa7xr9w0kLU23oVoS16BVG1/JaesdpwDOUjQ5XIdZlw77M7rKeGI/adwM9UbM3ma+T2z167Vyx/BRVKRwlK+UPmg8huLbXf1QuX0aqLPpYJn1wS5btL5iOdioV5F866qVN+YEHHuDjphPkMwkLmrpPxJkDMm6Z73lWmor0kmgP7cIYVv1Ar0Fip7wU0rl/7qYDqVF+p7/lLLYguRJHi4A4DTQyqo3QLAb48MwXR3bsHkxUgXzdXdf1UfXirFOKypkB2IuU4FIP+RgH8j9OBy3gzsg5n6om6qqlwstm3w8oKP/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8568.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm9ZQUNwb1A5TGxxMjU0eEJ4UXA2N0Ewa0hubitRWlBBalNQYmFXQ3BWZHpu?=
 =?utf-8?B?SjdoTk90VmZZUW1BQ1dvS3ViSFpDTVFqaURFV2NJMk01bjBmRjExc0NzbzZC?=
 =?utf-8?B?SDE2ZUtkbVd1OGtjQ0hTVVVsbkpnWnAxZGVTWEc5YXgrbDRvQ0tqN0VqRkRj?=
 =?utf-8?B?OVN4emwzNllEZGRoMXNCMERKa1RJSk9lbmR3c05va0MxRkd2S1EzbjFkK0Zt?=
 =?utf-8?B?cUJPWm5DR1Z1UGRoYnhXYXVVeHVSZk1qclpGZ3p4RnJqSDcyS1JhOHBXVUFK?=
 =?utf-8?B?c3Fuc0JLQS9aS2k2RHhwckN6UTRpeFlzT3NNQ245SWx1OFF3bEFDWG5zTGMx?=
 =?utf-8?B?Y0V2UHlSUzJ1VXRnV0hIODZDVHp6V1lVOU13OXR0NS81YUcrd09JZk4vQ3ND?=
 =?utf-8?B?dGszS1k4dlBybk40aU1ZYStja3VFZlFobXg4ZGdUSzJRc3VYSFBySFAvTG5G?=
 =?utf-8?B?UWVIZnJrNkJnMHdPc2Q3TUdNbjluUUJZQld0TkUvZlQwNGlvL1AwdnFOVkl1?=
 =?utf-8?B?Y1pNZG1LSXEyTmd3Y2lCVTRWV0E0UWhyZndpZ0N1WXhrWWNTRTczeXZIdGdk?=
 =?utf-8?B?ZlhtdXlWS3RuK1ZGZjBCcEpBMFZxTHJ0bWxCRnAyV0RZMG5kN2NVcGNPVEdZ?=
 =?utf-8?B?S25YMmJEb2p0dys0VXQrVVhLSXVEQXBTVWFqbkRTYThOY3dlUTk5OXZIN1Nv?=
 =?utf-8?B?KzRnOG9rbnFqY3dkYVNXaS9MdW92WFFjRUpaU29BckZtU1hnRlgrSE96Zk00?=
 =?utf-8?B?VU5GTHB2RjdhN2tRa1VJUTJSSWdSZXRTRkhtdHJLTGlpd3REOTUvM1VQLy8z?=
 =?utf-8?B?cWljeW5HSitGWlp4ODRhVUZEdUNoY2pOeUlIZHZIM0FnekhBMndyMlZKZE1x?=
 =?utf-8?B?S3JvdFljZlBpUG81ZURzcFg1UFB2Z05iR29NWXFLV2RsUm4zWTRDSk1rbHZM?=
 =?utf-8?B?RG96eUpmM0lreGcyVXZKL3BwVjlweDAwM2JQTk9CaWVQRGx1QWhRL2o1V1dG?=
 =?utf-8?B?Qm9CdkpCS0lpeTNCbGRJVWkvRldJWlFIUVcyaWZPY1BMYVoyMjZCQUxJK3Jh?=
 =?utf-8?B?SUpqUzJpbVVaK01sS21Db2toQk5VWWJ3eFd5VU5RU2hWNDFya3dqWVk3T1lw?=
 =?utf-8?B?OFRpQjlnMkphbGd6dE52bkh1M2d1Zy9KMUtabmF5c0hGWGRMdSt1UGduWVlL?=
 =?utf-8?B?WlNqaHVyWWxZSDFMaDRHYUh5Z1lYRnAydkVUWXoyNUJSZHFBSFNnTDdIRjY4?=
 =?utf-8?B?eXZvQ0Jpc2NmSkVlZS9sYVdxUWZWeEJZMSt4Vm9jVXAycXFQbEcyYzRlV0NN?=
 =?utf-8?B?WlZFSUorYkl6c3hEY3JyWnhwY0lrWWZUczZpdzRuVjBkdzVTSzhXV21QK0lN?=
 =?utf-8?B?SHdJcWRRQVBxNk1WemJmNXVwa1ZYK3ZFTnhBRGdxcmtSQkZSQWVWeTNHUmxr?=
 =?utf-8?B?T1RVRnRUbjZGTndvZVQ3UmJDQ0ZvdGMzQ2V5TldMQk1FclVWNnRVeXppcHBR?=
 =?utf-8?B?RllTcjRianVIZC9EVUlod3gvYytqcWhpUzNUYUh6TlAyc2l4QjRlQlBmRllj?=
 =?utf-8?B?ZzFlNGVWeUJyUkR0VXNQalRoZ2dwMVp6UzZuajFFemhtcFBIUWYxSGNTSkVX?=
 =?utf-8?B?SW8zWHBpNFJybXBmTXptZU9MYlFnalc4TlFsd1M3aUY5TGRnek5GditsODdQ?=
 =?utf-8?B?N1B6bE9OblBudjhGeURSUnJiM3p0WE04Q3ZqcXB5aWFHN1dvdWQyWmo3UytF?=
 =?utf-8?B?YldneDgvRlJzaVpiM0FmODRnMkFTb3FoWmljdS92OGR3ZGhKL0daeE81REx3?=
 =?utf-8?B?cGhTWWhiZHg5M0M0MGhqUXRrL2lXTXg3Y1loL2JOWmVZTkttMWdPS2pIVkpv?=
 =?utf-8?B?Zm1ZSVQ1dXdINEJZb01Hai91QnZmemVZeVBnOW9zR0NzVUg4SzljOWw0Uk9M?=
 =?utf-8?B?dmxxR0VVUms4WkFFQmhDUkZhN1FYUVZJSXVrV0tGWHlTTmdmN0dOSWdNZ3dk?=
 =?utf-8?B?NkJDZGIzdHpmT3RSc3lxVGUvTjNPekdEZ1JJd3NxbTJYb2cyWXJkSWhhVHdS?=
 =?utf-8?B?VjZNZ2lIVDBrdzNHVkRwNnZGcmlEMTd4WDRlbWs1Q0MyQTVQWHcwS29BbmdS?=
 =?utf-8?B?VHFoS0NTUCtnV1JHUU42OG1FMExyMU5mcXA0WmkzVEZDTU5xU1ZzRjNYNU5w?=
 =?utf-8?B?a2NyQXNQNU5FY29CUlFZYUFiN28wQ0ZHTkpDdkZzZithbHZSbXhBRG5jTnds?=
 =?utf-8?B?dnlWZklmNE43SlBOQ0RTZEtJSEtjTzdkT1IwM3NDSjRvR1VBTGVIdVh6Z05u?=
 =?utf-8?B?cFAyRDlVd0V0d29Oc3hnaTdMQ0dIclpFVkU5Sm1GTkN6MjYrdzU4UnRhdnlr?=
 =?utf-8?Q?+WDls3jhbuAY2+A4=3D?=
X-Exchange-RoutingPolicyChecked: JAaIcGn4z5WkPz0ucuxbxuYhUhBnLrKzmslnIStvroGKGRtJ0wItEaVmTaIQ/1dJH4gr16gDPLK/oTJ4hw3eoVptpRY/UeX7u6uJRmqmjkap5OeILEmd/48G6v15TgI0zQa+zqvbzosLl0/0O8sDxRIcHq6psvDmqgFeef44Rncbs/AKFV23fYuuGi/TFzmwj9B0le/+0j3EVLugrY5YyMvXKQMJVGFk6NSnF0l0l7sRty/0b8+N07Uoqys1+lrAhoTmELNB3ptjHOzp+fSMVBZGfLWdsI9zdIkZs3trUrvHPNfzvyFRKdGSuxRit+fyLVC4labZWcLcT9yHtcuJVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd19c34-1871-491f-7949-08deabb7329f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8568.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 21:34:05.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ji0x+qpO8xjS5lDA7N3uMCjwDrfxV1TCSc/fMMjjY1Kirpa4oJaq6AGyFuh2Gg3u1avnt7XrEbjrq/tar1aLTFjKPrY7bUZNUxWo3nMUjao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9946
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: AC8DD4E0A67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60686-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Kieran,

On 5/6/26 1:38 AM, Kieran Bingham wrote:
> Hi Miguel,
> 
> 
> 
> Quoting Miguel Vadillo (2026-05-05 23:30:04)
>> Add driver for Intel Computer Vision Sensing (CVS) devices found on
>> Intel Luna Lake (LNL), Panther Lake (PTL), and Arrow Lake (ARL)
>> platforms.
> 
> I haven't heard of the CVS component yet.
> 
> The main thing I can determine is that it controls the privacy led for
> the cameras in the pipeline automatically if there is a stream active?

CVS is more than a privacy LED controller — it runs always-on Computer 
Vision Sensing algorithms (e.g., Human Presence Detection) directly on 
its own firmware, though that functionality is not exposed by this 
driver. Because CVS sits between the camera sensor and the IPU on the 
MIPI CSI-2 bus and continuously accesses sensor data, the driver's 
primary job is ownership arbitration: when the host wants to capture 
frames, CVS must relinquish the MIPI lanes. This patch series implements 
that handoff mechanism.
> 
> What else does the CVS do ? I see there are 'firmwares' to load to the
> devices, so it seems like a far more complex part that simply turning an
> LED on and off...

This patchset implements the communication protocol and handles the 
multiple hardware configurations currently deployed in the field. 
Without it, the host cannot acquire ownership of the MIPI lanes and 
therefore cannot access the camera sensor for image capture.

The CVS firmware is resident on the device — nothing needs to be loaded 
from the host side. Firmware update support will be addressed in a 
separate patch.

> 
> Trimming below as I'm not specifically reviewing the driver here, but
> reading this patch made me think about the other devices that are
> essentially a media-bus pass through device (like other video
> multiplexors).

Correct, other solution "similar" to this one is the 
iVSC:drivers/media/pci/intel/ivsc/ but the implementation is different 
enough to be able to extend that implementation.

--
regards.
Miguel
> 
> <snip>
> 
> 
>> +
>> +/**
>> + * cvs_csi_set_fmt - Negotiate pad format
>> + * @sd: Sub-device
>> + * @state: State
>> + * @format: Desired / returned format
>> + *
>> + * Mirrors sink format onto source pad. Accepts many media bus codes, falling
>> + * back to Y8 if unsupported. Normalizes field setting.
>> + *
>> + * Return: 0.
>> + */
>> +static int cvs_csi_set_fmt(struct v4l2_subdev *sd,
>> +                          struct v4l2_subdev_state *state,
>> +                          struct v4l2_subdev_format *format)
>> +{
>> +       struct v4l2_mbus_framefmt *src =
>> +               v4l2_subdev_state_get_format(state, ICVS_CSI_PAD_SOURCE);
>> +       struct v4l2_mbus_framefmt *sink =
>> +               v4l2_subdev_state_get_format(state, ICVS_CSI_PAD_SINK);
>> +
>> +       if (format->pad == ICVS_CSI_PAD_SOURCE) { /* source pad mirrors sink */
>> +               *src = *sink;
>> +               return 0;
>> +       }
>> +
>> +       v4l_bound_align_image(&format->format.width, 1, 65536, 0,
>> +                             &format->format.height, 1, 65536, 0, 0);
>> +
>> +       switch (format->format.code) {
>> +       /* Accept a large list; default fallback to Y8 */
>> +       case MEDIA_BUS_FMT_RGB444_1X12:
>> +       case MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE:
>> +       case MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE:
>> +       case MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE:
>> +       case MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE:
>> +       case MEDIA_BUS_FMT_RGB565_1X16:
>> +       case MEDIA_BUS_FMT_BGR565_2X8_BE:
>> +       case MEDIA_BUS_FMT_BGR565_2X8_LE:
>> +       case MEDIA_BUS_FMT_RGB565_2X8_BE:
>> +       case MEDIA_BUS_FMT_RGB565_2X8_LE:
>> +       case MEDIA_BUS_FMT_RGB666_1X18:
>> +       case MEDIA_BUS_FMT_RBG888_1X24:
>> +       case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
>> +       case MEDIA_BUS_FMT_BGR888_1X24:
>> +       case MEDIA_BUS_FMT_GBR888_1X24:
>> +       case MEDIA_BUS_FMT_RGB888_1X24:
>> +       case MEDIA_BUS_FMT_RGB888_2X12_BE:
>> +       case MEDIA_BUS_FMT_RGB888_2X12_LE:
>> +       case MEDIA_BUS_FMT_ARGB8888_1X32:
>> +       case MEDIA_BUS_FMT_RGB888_1X32_PADHI:
>> +       case MEDIA_BUS_FMT_RGB101010_1X30:
>> +       case MEDIA_BUS_FMT_RGB121212_1X36:
>> +       case MEDIA_BUS_FMT_RGB161616_1X48:
>> +       case MEDIA_BUS_FMT_Y8_1X8:
>> +       case MEDIA_BUS_FMT_UV8_1X8:
>> +       case MEDIA_BUS_FMT_UYVY8_1_5X8:
>> +       case MEDIA_BUS_FMT_VYUY8_1_5X8:
>> +       case MEDIA_BUS_FMT_YUYV8_1_5X8:
>> +       case MEDIA_BUS_FMT_YVYU8_1_5X8:
>> +       case MEDIA_BUS_FMT_UYVY8_2X8:
>> +       case MEDIA_BUS_FMT_VYUY8_2X8:
>> +       case MEDIA_BUS_FMT_YUYV8_2X8:
>> +       case MEDIA_BUS_FMT_YVYU8_2X8:
>> +       case MEDIA_BUS_FMT_Y10_1X10:
>> +       case MEDIA_BUS_FMT_UYVY10_2X10:
>> +       case MEDIA_BUS_FMT_VYUY10_2X10:
>> +       case MEDIA_BUS_FMT_YUYV10_2X10:
>> +       case MEDIA_BUS_FMT_YVYU10_2X10:
>> +       case MEDIA_BUS_FMT_Y12_1X12:
>> +       case MEDIA_BUS_FMT_UYVY12_2X12:
>> +       case MEDIA_BUS_FMT_VYUY12_2X12:
>> +       case MEDIA_BUS_FMT_YUYV12_2X12:
>> +       case MEDIA_BUS_FMT_YVYU12_2X12:
>> +       case MEDIA_BUS_FMT_UYVY8_1X16:
>> +       case MEDIA_BUS_FMT_VYUY8_1X16:
>> +       case MEDIA_BUS_FMT_YUYV8_1X16:
>> +       case MEDIA_BUS_FMT_YVYU8_1X16:
>> +       case MEDIA_BUS_FMT_YDYUYDYV8_1X16:
>> +       case MEDIA_BUS_FMT_UYVY10_1X20:
>> +       case MEDIA_BUS_FMT_VYUY10_1X20:
>> +       case MEDIA_BUS_FMT_YUYV10_1X20:
>> +       case MEDIA_BUS_FMT_YVYU10_1X20:
>> +       case MEDIA_BUS_FMT_VUY8_1X24:
>> +       case MEDIA_BUS_FMT_YUV8_1X24:
>> +       case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
>> +       case MEDIA_BUS_FMT_UYVY12_1X24:
>> +       case MEDIA_BUS_FMT_VYUY12_1X24:
>> +       case MEDIA_BUS_FMT_YUYV12_1X24:
>> +       case MEDIA_BUS_FMT_YVYU12_1X24:
>> +       case MEDIA_BUS_FMT_YUV10_1X30:
>> +       case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
>> +       case MEDIA_BUS_FMT_AYUV8_1X32:
>> +       case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
>> +       case MEDIA_BUS_FMT_YUV12_1X36:
>> +       case MEDIA_BUS_FMT_YUV16_1X48:
>> +       case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
>> +       case MEDIA_BUS_FMT_JPEG_1X8:
>> +       case MEDIA_BUS_FMT_AHSV8888_1X32:
>> +       case MEDIA_BUS_FMT_SBGGR8_1X8:
>> +       case MEDIA_BUS_FMT_SGBRG8_1X8:
>> +       case MEDIA_BUS_FMT_SGRBG8_1X8:
>> +       case MEDIA_BUS_FMT_SRGGB8_1X8:
>> +       case MEDIA_BUS_FMT_SBGGR10_1X10:
>> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
>> +       case MEDIA_BUS_FMT_SGRBG10_1X10:
>> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
>> +       case MEDIA_BUS_FMT_SBGGR12_1X12:
>> +       case MEDIA_BUS_FMT_SGBRG12_1X12:
>> +       case MEDIA_BUS_FMT_SGRBG12_1X12:
>> +       case MEDIA_BUS_FMT_SRGGB12_1X12:
>> +       case MEDIA_BUS_FMT_SBGGR14_1X14:
>> +       case MEDIA_BUS_FMT_SGBRG14_1X14:
>> +       case MEDIA_BUS_FMT_SGRBG14_1X14:
>> +       case MEDIA_BUS_FMT_SRGGB14_1X14:
>> +       case MEDIA_BUS_FMT_SBGGR16_1X16:
>> +       case MEDIA_BUS_FMT_SGBRG16_1X16:
>> +       case MEDIA_BUS_FMT_SGRBG16_1X16:
>> +       case MEDIA_BUS_FMT_SRGGB16_1X16:
>> +               break;
> 
> I've seen this on other pass through devices, and I wonder if really
> there's nothing to filter here - it could be anything. Or perhaps if we
> did need to ensure the driver only supported a specific bus type - that
> could be factored out.
> 
> 
>> +       default:
>> +               format->format.code = MEDIA_BUS_FMT_Y8_1X8;
>> +               break;
>> +       }
>> +
>> +       if (format->format.field == V4L2_FIELD_ANY)
>> +               format->format.field = V4L2_FIELD_NONE;
>> +
>> +       *sink = format->format;
>> +       *src = *sink;
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * cvs_csi_get_mbus_config - Provide current CSI-2 bus configuration
>> + * @sd: Sub-device
>> + * @pad: Pad index
>> + * @cfg: Returned bus config
>> + *
>> + * Fills lane ordering and number of lanes; retrieves link frequency from
>> + * remote entity.
>> + *
>> + * Return: 0 on success or negative errno.
>> + */
>> +static int cvs_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
>> +                                  struct v4l2_mbus_config *cfg)
>> +{
>> +       struct icvs *ctx = sd_to_csi(sd);
>> +       s64 freq;
>> +
>> +       cfg->type = V4L2_MBUS_CSI2_DPHY;
>> +       for (unsigned int i = 0; i < V4L2_MBUS_CSI2_MAX_DATA_LANES; i++)
>> +               cfg->bus.mipi_csi2.data_lanes[i] = i + 1;
>> +       cfg->bus.mipi_csi2.num_data_lanes = ctx->nr_of_lanes;
>> +
>> +       freq = v4l2_get_link_freq(ctx->remote, 0, 0);
>> +       if (freq < 0)
>> +               return -EINVAL;
>> +
>> +       ctx->link_freq = freq;
>> +       cfg->link_freq = freq;
>> +
>> +       return 0;
>> +}
> 
> So more of a question for linux-media community, I've seen this pattern
> a couple of times - should or could we consider a way to factor out a
> passthrough device which doesn't modify the stream(s) formats and is
> simply representing almost a connector type ?
> 
> --
> Kieran


