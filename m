Return-Path: <linux-media+bounces-62812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NutAIHKFWqQbgcAu9opvQ
	(envelope-from <linux-media+bounces-62812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 18:29:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D54C5D9B6A
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 18:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D837330031EA
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 16:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB8D3B5847;
	Tue, 26 May 2026 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hf+UgUK/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337338B154
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812987; cv=fail; b=HWbkw/nFS4XspTevt8dFZFSRQfLala/7o6GFkBzzBaQGZMbSdRHnvQ1oX07A3qNH8f6+MsOR+blqYh4ZEkmuYTjgVDqSB4hnncIK0A1YeAAW5dJYndqnDHxzpDQPJTqxJLVI6Kkv9JKuapbgnhNOZW9TkUAQcyV+lD4W6uX6KHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812987; c=relaxed/simple;
	bh=XhJ1wvJAky0VYD4FneuXrzL93RH6wLR6HP2WHJNBvpE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ECigwjXv2E1QtAV1yhrv301TP+eGxbRD6S/Y99s0QudEjwclbsHNd0E6iJO0QrPbwKBJTsEGGZx/sCYq0uR7lTn/9o8cXLgq/x0VAft6UtmofYgN7rOQiUBk8f1Vm9ObMQW/SHRcUTqI+giKqGQ6MF9xhmFIWU00QJWtf4nOHbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hf+UgUK/; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779812985; x=1811348985;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XhJ1wvJAky0VYD4FneuXrzL93RH6wLR6HP2WHJNBvpE=;
  b=Hf+UgUK/XqmNc6lySmv1dCj//nBF///kiQgIBT+qDIQO1mXFxPEzpxNf
   ejF4rijmMtD6eMUQDeTFlsxuTu0G7SwdIyoogIzNVM7HovdWpK+eHd3nf
   JeyUmMOSbn9/225QeoZJmPMBTUdl3AtXR+dZEwvzcHFIsrYs5lEWlrKYK
   92m01BqmHI/AmQ9QjSMGHGMUx6r0kIe1w5N9nXgwvU/GotDS2T+GppzGL
   2rpnXMQ2xKH9GqD5Ft/3oX/u9XJzel5Y9IaeRJtCBdpJTEw74It6nBI1e
   h0niwnOD7We93qOhDX8TXObfYGJ5CjXKNn5y0ej/dvQhiXRT5yjdE5aAL
   Q==;
X-CSE-ConnectionGUID: bqxVIf1kSFC6wRcpx1VW7g==
X-CSE-MsgGUID: 0pPO0hhmTt6LoE9Z0kZ3rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79778474"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="79778474"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 09:29:45 -0700
X-CSE-ConnectionGUID: r8CntDtkTSe04f1IFlBNFg==
X-CSE-MsgGUID: uzg734TnRQCoo+ShJg3zdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="242040203"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 09:29:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 09:29:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 09:29:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 09:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCOn7CxkjsFINWRwPyT7Pm1iRS53N2uhoLkvmo6YslvT/hkztpNnZXthA6jmJnOH5kJdMhvnAoBXUID35U0ZzKOewy+vzaK8EJuLFqdTScBkYYYsQC/jSzUmvMaiUEE0yrcpy1i79AzPdj9r8Se7y/XoI9WN/3Y9XlCWicCXtH7pmnMT1ayyCGVFgtcZOv6TxnPLm/dLbwlpvxQBrf5Y4y6/wSps/KU5gr3H7xrs/2iVADp6+e6Hy4E4TLSw6c56z2Fr0eVxp8FudG3NfkeCFycPR/etewlXYfXrve5VQyN5AzdDFevxKpWyOhvMZersWluWuxeYyb32hkG8VL7BqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS0ApU/ipm9H/97662geplDvm+EO6P31BNEpz/7LnMQ=;
 b=iG3CCTvgPR3FXvls9/sMDPZsRPKg7FTPc+a19yvQTWHeb1Ql/RyeYekNs952oW/74OotA3j0mvOH+yF1BBTHgrsdTTtWwb5NlB6QJ8y22rkPThEi2uLmOr2sm4Hh4Drx9Gw4Ysmgt5OqlhN2JxpP1vtiGswt6X5UQZKwbTZph4xRiGZpeDbxvzVjVOHp9yusy3e47UiIIeRIAQ/Bc4mRhZ6tkdd7XpINwjVTqSDWqBjSNqAj9PFtuWogeywXgZHjOS5nf9l4quj41r+JxlJZdk465XO8GFZKMUBNDVRY9Q/+bXqN5YZKQ3hN8wlEMrKCRiYblFxaogGH7Zy6euMyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15)
 by MW4PR11MB6618.namprd11.prod.outlook.com (2603:10b6:303:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 16:29:33 +0000
Received: from PH7PR11MB8569.namprd11.prod.outlook.com
 ([fe80::d549:1f2f:4a3a:20c1]) by PH7PR11MB8569.namprd11.prod.outlook.com
 ([fe80::d549:1f2f:4a3a:20c1%5]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 16:29:32 +0000
Message-ID: <16f5874d-0d22-4c8a-9bad-63a9b383dcf1@intel.com>
Date: Tue, 26 May 2026 09:29:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] media: i2c: cvs: Add Intel CVS driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <wei.a.xu@intel.com>,
	<atul.raut@intel.com>, <antti.laakso@linux.intel.com>,
	<mehdi.djait@linux.intel.com>, <kieran.bingham@ideasonboard.com>
References: <20260526022509.162908-1-miguel.vadillo@intel.com>
 <ahXB-Eg1O2-PlFvU@kekkonen.localdomain>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <ahXB-Eg1O2-PlFvU@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To PH7PR11MB8569.namprd11.prod.outlook.com
 (2603:10b6:510:304::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8569:EE_|MW4PR11MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 419134ee-311b-445c-9697-08debb43f78e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: qfSDUyTsv+BvNh72yftC+z+vFTA8vJVFBngtT6FRjMZskBbvth2Vxe6ZdEuOIIGKu6lI6IZv/bCTIuO3ezZLVwixjMmgCL9wKiCH1PMXOoafoVlOqHdfJQ+ymBrs0bXxsG2717m1dTG/KRCwxXh58DIzAOC2uockmrHIkHUam0DShwti/0aZZSjqTtrmLLU1u+AOzW+Npjnxyth0l1+e8kCC7wZzaz2B+2cioFTO860wyA4dSc2z/l706qPWQ0JSfDO1iVETLkxmfbQE0T+yr7YANaRA87U8Z5VBtQXGVzf+CQ/YNbcjrB/+T9/GHroEJ/nt5no6y13R/coP+gMWJQ6EEqL+BfsT0X+5KHF+LqE2bu4ue+gmgsu1v/oFX/hzSRz4XEnpuhINj89Bb0kyNr4HlxGOkGIpXYb2wAJ4io3xHj/TO30rFoNC9bCnuvV7Hj3Uxp4BmV03VMYx8/fgC/APjf6c50xjrZ1OZ2Yxmu7CHIJWsq0sUy/wtcqUKkjypiDZxwIZOKD+O/qpCW+BIe540AZpF6H4QcNrUVrDoDe1M1O+IDM5sv8cJxvcn6dKlV4gNTdJ+/ylh2imPhSnrqnm8Tmtx4eKNVghLJlV+WakHwv/ZFP5qQzspS/VmKUX32xTeVXZjKlBLKS5aC5/HQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8569.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3dnaXhqZ2ltTGdWYnJsUEVNd2ZDSTRxZmt4bGZKd0FUQm9JZ2dKeHNpK3FM?=
 =?utf-8?B?MXZGWEhaWEw5bmtzbVBtZk4ycWZLRFRTQld0RHFkNWNVRDdKU3pucTFlcTdx?=
 =?utf-8?B?NisyaDgwMWxBbDRKbldMMk9NQ1BBejdrbU1qZnpPUEx0aEkvVDFsUjlaN3N4?=
 =?utf-8?B?ejRPdHdubk5QeFlOaHBPdm9uYVhRV1hsL3VWdFljalJwd0xEbjVha0RZV0Q5?=
 =?utf-8?B?cTZzbzdMaWlwdjRRMWtCTVhOR0pyR2lKbXAydUd6aWJCMnpRWlIvWXN6eG1y?=
 =?utf-8?B?clRtSTREM3lOcndXU1F3UEJYQW5LYyt4TDVEOC9iTVg2Tm9rK2xkazFPMmto?=
 =?utf-8?B?cnpPdmhrK0ZKTGpFTklLdGxHK0JCKytPcEVDem01b2JNRVJEM0k4YW8xcnBp?=
 =?utf-8?B?NEh4VVhrbWlnVWlBeURLU0txYURCNDk1VUdEVHlUVDRaRlBWMlBKQmhNUUdP?=
 =?utf-8?B?b2hxbzlpL1pVMVdUMFZUMUxFbFlMaGFkcUZQbVhqQmlEVUdoTEZ2LzdTTUFK?=
 =?utf-8?B?a010aUhiR0VjVXhZOWZnQUthdzBvZUlEbTBEV29MQ3BkdC81TTNWMTdhMmZH?=
 =?utf-8?B?MVc2cmNxRXova01xbjhTSGhaZU9mNW0xdUxaMHV6YUthV2dUNU1ic2wrQSs2?=
 =?utf-8?B?SzVOTXZFbjdaVExXaE5lanJIR2cyNTk3VENQZXg4UHBBWEJXSEtYT2h6bmFu?=
 =?utf-8?B?emFnZG1tMm5KQnNzbkYrR2JMVkxBb1JneFQvQ0FtVXZXMExjZ1dBazJucWFX?=
 =?utf-8?B?bHR1QStabi8ybURzUzZieFVrTWhTRDloMGN5ODNXRjQwMjRxcElyWXowV25R?=
 =?utf-8?B?Q3MvRE03ZGlrM0g4bnNlcVJJTENqT2V0cjZDa216Znl1TlVEVGdIMk5ycHBS?=
 =?utf-8?B?N2FXSVB3K1FUcG5SUm9ETTNQYTZxOHR3blY3aDNlOU1HRnVFSVdDc2g3R2lM?=
 =?utf-8?B?bmgwQ2tkaXFXSjNPQ0xDdEJ3UmhFYjVsTWY2WUV5NkpCL0tnTFd4dHh1aVN3?=
 =?utf-8?B?TUt1L3lqeU9IMWtuZkpUdUZ5OUJBRnczaVpWY2NWM2NRczRDUCtLVDBSWGM3?=
 =?utf-8?B?dW9YS25aNnZKOU9YZlB6VGNqYzJsZmFVNldlM0pNSHdUTDAvNzRaZDd4ZC9W?=
 =?utf-8?B?cjZ6Z0l2V2JxSFFKUVdPVmluYWFxeVJlbzNiWUR6UHlVVHRQQWJDUkJyR3NW?=
 =?utf-8?B?dmMxYXZHMnUzOEZnUW5idjVxc3lQVEY5eGdpeVdyeVVyTVA4bGJvQzVBT25X?=
 =?utf-8?B?ZGFpSnJKenVEZGs5TkhwZjZRMTNzMTVZMER2ZGErUTZNVVdKWitIUTVlL25N?=
 =?utf-8?B?NFBJbEQrYklBVWJDUHg5T0hOdWZaMUFRZU5kNmdYQVZKdlhzNXFtSE5ZTTI0?=
 =?utf-8?B?eWtIRzRuaWt4enJhOGUrUDNUQ1hBNlZiM01KQ1VrbXoxOUV4WENaSWFOb3ZI?=
 =?utf-8?B?aE14QVByQmdHRTJEQzZIMGRyMk1qOTlaTUNONWx5Yis2QnE4eXRSUmlkTlEz?=
 =?utf-8?B?WkI5cGRZZzV1Wm50dE8yN3gwMkl5bVgzUFJSMjhZeWk1ak02NThlTnBKNSto?=
 =?utf-8?B?QjZhZkc5ZVcrSWVRUE1aM1FtZXB6Tm54Mi9aZnpyQUNXNHgxM2hGRGtpVzVJ?=
 =?utf-8?B?RGxURDd5RFl3SUw0ZVE5NVVDVjBweHI3eE5mVFY2NXJiSjZqSi9IMFQ5czhS?=
 =?utf-8?B?U1MvRXYxS05sSXpldkptUXVuMVFtU0ZwU2ptbk1wU3RGbG9iRnp4VE02SEhD?=
 =?utf-8?B?UURRKy9CYnVicTZJYU9rWVY5SVFUZFhOYXdFUGp4VHllU1dFeVlTcUJVaW9u?=
 =?utf-8?B?STZ6N2FzNUVVMUZMMjg1OVNOYmtaVVBjb0pnVjBMeC9xYzROUFFKUkxqUzZ2?=
 =?utf-8?B?dEpqRm1DTEFSNDZ4TjkwWDBBR2VZa2phMFdzWnhJTFBWY3ZrU3ZnNVpvWnlt?=
 =?utf-8?B?T2pURzNPSVVTMFJXc2haVGQydllEYXRFNkViNlNtM3JkNE9qeHRqTytoTmlj?=
 =?utf-8?B?dTF4bldDNlFsK2pXejQ5YXhJKytLdEFoQittSDdsTmdwc2ZMc1Q2bWV0K1lW?=
 =?utf-8?B?TnVmWGdnNU9rNVc5cTl1SnZYQmtMMXAySHkzaEVVaXdPWmpsMUdwQTY3ZGhI?=
 =?utf-8?B?U3RwR2owcVkwMW5mNDBjbnpSczJqM1grTEJBeGtxUVVPMzRvYUw0bmVtTFUy?=
 =?utf-8?B?N2tmK0daUE82cHJKT21acGZJU0lIcnVLQmJlbFA1cHZrMFIvK2RiZGxmSits?=
 =?utf-8?B?THI0M0daUVVQN25DcEErUXBWMFVZa3prWlNrN3RWNll2aXZ0YVNaRVhOc25P?=
 =?utf-8?B?TFdFbEhiRzFZZXFtSkJ6WHdOTEM1U0pjb0J0M0xkZEt6eko1MnAyL1hZTnd3?=
 =?utf-8?Q?NABiFDSgp0brm0Rs=3D?=
X-Exchange-RoutingPolicyChecked: GTLhsLXz5f+/zhpRYCo1gMdv7llUzUhTBnQ0Zp1mexi8rAgkXHJ0NmPmmRV0JnntSkZdGHyw/J9ifRZzplNqLhgP0nRu0A0EV/cfBDfCH8c5KqHKT86iiKEj1nX6LcuxBqgtPHZqp5cc7nLa63EZyw6qgHdTT5B785p8IIlcZuDEX2pC8v4wf75tp+RtaS4D7suQiGweUNTekW5QTp9eNu2pvIv9CLi7cY+6HNFHtvfTbMZYog3GCezV8NG2l8K+cz3ZUfa8024LnfBKNBzL93FD8B7fZkZMFzTJSSGxKOx22u5t22M36P0D9/ia+Hu1MEQ7Z8AlibdNBYUJWyXXKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 419134ee-311b-445c-9697-08debb43f78e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8569.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 16:29:32.5317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kcWoFRmzwhnlqmKR9SdvAgEN7kzABDmkM/xNm6mZ9bFzEvuLXBzeJKuWwhbLL8TRV6dQXYGSMGmuZhPW543YOu0kqiN5xwxJXu9+oFFV9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6618
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62812-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4D54C5D9B6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thanks for checking this.

On 5/26/26 8:53 AM, Sakari Ailus wrote:
> Hi Miguel,
> 
> On Mon, May 25, 2026 at 07:25:05PM -0700, Miguel Vadillo wrote:
>> Cover Letter
>> ------------
>>
>> This patch series introduces support for Intel Computer Vision Sensing
>> (CVS) devices found on Intel Luna Lake (LNL), Panther Lake (PTL), and
>> Arrow Lake (ARL) platforms.
> 
> Thanks for the update. I got from Media CI:
> 
> drivers/media/i2c/cvs/core.c:909:12: warning: ‘cvs_resume’ defined but not used [-Wunused-function]
>    909 | static int cvs_resume(struct device *dev)
>        |            ^~~~~~~~~~
> drivers/media/i2c/cvs/core.c:892:12: warning: ‘cvs_suspend’ defined but not used [-Wunused-function]
>    892 | static int cvs_suspend(struct device *dev)
>        |            ^~~~~~~~~~~
>   
> 
> I suppose this happens when CONFIG_PM isn't defined
> <URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/100763316/artifacts/file/artifacts/no-PM.config>?

My bad, that seems to be the case with CONFIG_PM disabled:
this fix will be needed, I will prepare this and send an update, waiting 
in case there are more comments..

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index a4168e9c64e1..0086234b813e 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -1375,7 +1375,7 @@ static void cvs_remove(struct i2c_client *client)
   *
   * Return: 0.
   */
-static int cvs_suspend(struct device *dev)
+static int __maybe_unused cvs_suspend(struct device *dev)
  {
         struct icvs *ctx = dev_get_drvdata(dev);

@@ -1392,7 +1392,7 @@ static int cvs_suspend(struct device *dev)
   *
   * Return: 0 on success or negative errno if I2C check fails.
   */
-static int cvs_resume(struct device *dev)
+static int __maybe_unused cvs_resume(struct device *dev)
  {
         struct icvs *ctx = dev_get_drvdata(dev);
         int ret;
@@ -1417,7 +1417,7 @@ static int cvs_resume(struct device *dev)
   *
   * Return: 0 on success or negative errno.
   */
-static int cvs_runtime_resume(struct device *dev)
+static int __maybe_unused cvs_runtime_resume(struct device *dev)
  {
         struct icvs *ctx = dev_get_drvdata(dev);

@@ -1433,7 +1433,7 @@ static int cvs_runtime_resume(struct device *dev)
   *
   * Return: 0 on success or negative errno.
   */
-static int cvs_runtime_suspend(struct device *dev)
+static int __maybe_unused cvs_runtime_suspend(struct device *dev)
  {
         struct icvs *ctx = dev_get_drvdata(dev);

@@ -1457,7 +1457,7 @@ static struct i2c_driver cvs_driver = {
         .driver = {
                 .name = "intel_cvs",
                 .acpi_match_table = intel_cvs_acpi_match,
-               .pm = &cvs_pm_ops,
+               .pm = pm_ptr(&cvs_pm_ops),
         },
         .probe = cvs_probe,
         .remove = cvs_remove,
@@ -1484,7 +1484,7 @@ static struct platform_driver cvs_platform_driver = {
         .driver = {
                 .name = "cvs_platform",
                 .acpi_match_table = intel_cvs_acpi_match,
-               .pm = &cvs_pm_ops,
+               .pm = pm_ptr(&cvs_pm_ops),
         },
         .probe = cvs_platform_probe,
         .remove = cvs_platform_remove,

> 
--
regards,
Miguel


