Return-Path: <linux-media+bounces-46045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6EAC23490
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 06:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 87F294E1C23
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 05:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D09272E5A;
	Fri, 31 Oct 2025 05:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJ7i5j8p"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AC342AA6
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 05:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761887739; cv=fail; b=f+izF3W7NhKnm8H3FumzZ8TBvqDFYxsBR7YQeu/pYaOhuSj4E5izueZRY3lPrgfqKpTrC67Edl+HDKkEKMimyEoB6uxNpTg2YPE1DRmhPm9D/6TbUAR2DDEQYugNyWFBhn6BZo/GVpjNDLoZvK6O9BXxIiXB9CdWTzh7b7ztTAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761887739; c=relaxed/simple;
	bh=X4CPQJjUJ170fz/2Ngm7CEtrylSfyzNitGxU8QcX3ng=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lQ2s9YQnm7+/mR7saPLp+52n0Usx/ueCWGZxTQ+6Rbm264r8XUk8hO8ZcTXkV32qAh/Hi0hxJC3sON2dihUOmfAq4P9Npkou+GZL4jiCsrw5ZFrYobIsBKaOTBjDU+KyCb2GzW8x/GeEW5SEsYI0pX4AUMSd21uWncHjAlo9yk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJ7i5j8p; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761887737; x=1793423737;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X4CPQJjUJ170fz/2Ngm7CEtrylSfyzNitGxU8QcX3ng=;
  b=BJ7i5j8pAkFqclm98JYoC6/36wCZm5jSCne37PZnup/hvZYmWTJMAXme
   DyMwnsZTq2frBYnLe5sMw2tvlxdCQd5XL92L7gpWEfZC/rPsYW9KPoTHB
   ZJz0kZHnFgwnwbyv5eQEn+TA65w8GoA8oaOoUMmYje12OpHVvbwu8fvbB
   tQaGl0s/mAWQvAj8M9mcn37Z5wXieZXRh90j6WJ9WZ485iPHx5LevAP2n
   qbCJtOCj2cvflSD4QIwTZ2EcXKsWOeBpsh0Dhkk5CtOEV52CoMGrH/8wR
   gxhjKbY4TVeD57Scub9Y0vCGuDlViFh91cE+HaS+BoQnqPmX9/1HKIHKS
   A==;
X-CSE-ConnectionGUID: pmJYbfTeTWqWLly2C+9coA==
X-CSE-MsgGUID: d+I8efNoSxiawU6z3WE3Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66655928"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="66655928"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 22:15:36 -0700
X-CSE-ConnectionGUID: aQMavBwgRYymk6Mw34fBfg==
X-CSE-MsgGUID: SmM5A95CQWmuC2x5gIibzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="191287429"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 22:15:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 22:15:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 22:15:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 22:15:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEbM1asv4iQTrC9A5d0Dr/im2rGtCvTx0JSrXZFXimt4G/gyRryY0fQoJOofHi674JKTpznneG4SBf29rfmfYE7spSHDfK+tcaUrFviPO8+GGdr2O0zhee6Qc+hf2O+XJzMFmA/3fnQTlwJ0n+zrDyXt28nvFiQiGclCTmpT4Xi2x6NwU12rAFVXLNtuaiSqpR54jIxwIB4q7GkAOETAxy8XxqJryezTZvS8Q0Vd1noNPKYGoyOyvMJWFOgQeu5Kkcx0VzvnQXA6C/UEvRaiYHVZdy95zSwNtYUgbYn/2ritZhY99d5qng9F1daYVAljAlPmkkxnRDHDPkIFEVYz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4CPQJjUJ170fz/2Ngm7CEtrylSfyzNitGxU8QcX3ng=;
 b=kaP1bq6TuYmiwIF6AC6QTcPNnMjtKyi+smu1FErWd4rToa6uCXXNoqKJC6peyVgvg9RsYIrGwlEnmEKMds6f67DFZjOQVfUWNID1JqFKISAFiQDxfkInhf+sPYOYcMcUrNmqg0H78mI0JXcwBL5pRGrTkdtvsF9LrGiLhv6MQD2H5rHHbXCmpMAV/QnXcc3OyUx3yUCDfpqYneUOG9A2npEBFfRg0Yig+el/gqCWUGiuYmkoD/XvS4Q3HFDjYRZ4/tW46/0ecPUK2GMa3m4wLpzRCjVw2mcx1qRq6DIEvj6aEB0HvpXPzbdS+/Jcim70/rh7Q1DXaiGIkO6SCT3t7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by IA3PR11MB9274.namprd11.prod.outlook.com (2603:10b6:208:578::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 05:15:32 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 05:15:32 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>, Christian Koenig
	<christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	=?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, "Brost, Matthew"
	<matthew.brost@intel.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: RE: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
Thread-Topic: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
Thread-Index: AQHcRvz4E9hXyspRBUGk9qxvPpLsUbTYR6AAgAFminCAAQoeAIAAh4hg
Date: Fri, 31 Oct 2025 05:15:32 +0000
Message-ID: <CH3PR11MB71772DF7DC3776F838AA8CC8F8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251029002726.GA1092494@nvidia.com>
 <IA0PR11MB7185E85E1CFAA04485768E30F8FBA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20251030134310.GR1018328@nvidia.com>
In-Reply-To: <20251030134310.GR1018328@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|IA3PR11MB9274:EE_
x-ms-office365-filtering-correlation-id: 4ec1e8de-9796-48ec-f731-08de183c842c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?u8J7bUDFJBXlycX2VZdAHf1z28WH+K1zYTS1DYcpUg+Iw/A1Pjugx2bv8W?=
 =?iso-8859-1?Q?6TWhJXfa2sS5wRMaElpEcb6AmpNeJritqCdX94i2kfVB9aKWSa+/ghPl93?=
 =?iso-8859-1?Q?PDDnxgU9FYG8PLe8a+SAni13UUrzWjrxAFDSv+HDzdjlKALMh/suwAAlWt?=
 =?iso-8859-1?Q?21KuhusSb45yuhexsNmDjvRvxGuP+FEcoFaOdMatvzuYjVvWNheXsZpalJ?=
 =?iso-8859-1?Q?9gQd2FZ57Cbe+f2XhtJF76sZraXzMks5kVgx6k+6Z4Hjvt62m/jMiib1Ms?=
 =?iso-8859-1?Q?YQUoyiJNvxZ4DQ5ThbsI28vMBNJKvJfgAszvfxPdfejqLoSahTMo0R8xZY?=
 =?iso-8859-1?Q?uRnAW+YuZ4FOwKapZQkrjedY1jr6LB6hEQzceZfW61u0EKNXeJF6+LH2h3?=
 =?iso-8859-1?Q?b9JuLj8bJqbK9FE73LbHz/smpLACdMTmWx9aLMGD/dfXCDhsYkCuQc14Mq?=
 =?iso-8859-1?Q?yjn97sOazv0/E3mDnfB7I3Pryz+VREsdMWC6goxspPFiyn5fF+hslKTZej?=
 =?iso-8859-1?Q?OcGlsXipxbf2D43axGz4PqwCai6NBCRVKj9WrsR0G4nS92AzDTEWnC/yLM?=
 =?iso-8859-1?Q?Gjd1MEUwyuEFOTry4J1QH2VRFNTNFHDAb1q5t50arAe6NsIV73lNpD9TP5?=
 =?iso-8859-1?Q?I4r28Qm41rJ8xBO+hgFCr6i+qk1oX2/K8PJrbrEAVjt06yNc990HT662qQ?=
 =?iso-8859-1?Q?IDheykt51hvd+h5dR/MMKk3/vGc7xCoJV0A1sHyZ33t2pdLpcfV7fdVIx3?=
 =?iso-8859-1?Q?Nzgtu0GAOrIS/Z54tLzn7JU2OpjhxwsdC9LcttfQa8wo1Xu2uroDiJYM7e?=
 =?iso-8859-1?Q?exv6YKLpvVAl05Cvt07vOoN51tUn7hwqjwjvjrs1y9rjX5qzI+p5LZ//yB?=
 =?iso-8859-1?Q?43yA1QxKOsboVwGuU1caQIZ8YBDOL8YTSMVqO9/a8bnIQ63ZZFPOT5TipU?=
 =?iso-8859-1?Q?JTMqC4WUmDICAkrZN+GqF1X0LUyibrEMl0hA1f8xmUHs6+oUvD3XorjMKO?=
 =?iso-8859-1?Q?NHxAv41/FGK5EdZwpKhSMtJ3vauxM+Yoq4X/x4LM0rPw4O326hhTmA7+LL?=
 =?iso-8859-1?Q?+lyQgRWoBw+nNXIiRTACJMWSytMf3NiGTHJcP/yntNIqVeHJQazKnDL5eu?=
 =?iso-8859-1?Q?qa+bEaRVBQXExbfOUn8CicqZQKnLpugcBsfsny3uOXSWaJWtWwXTjiVYsw?=
 =?iso-8859-1?Q?DrYYMKhaWBOlIMI9uQefWjhQ5VVfQTiY8wCrjqVUW93SA/gnqgmsSPf8Nr?=
 =?iso-8859-1?Q?37euySB+EBWZfk1Wx8w1Bl0tRqLC1nV9mudjopchJvCxw7iTSObmXGkQ59?=
 =?iso-8859-1?Q?g98m0200+pzjEAYiqEhTADVt8dbukowaodHdrLUn8kTbK3HBVkU+E/FMnJ?=
 =?iso-8859-1?Q?eN4MIH3xJKparAOXzcVjQwECfY/8I1FIUWvhu1cPZVXDYudIg2oSBIAlrZ?=
 =?iso-8859-1?Q?zu6y1iPP+WjflWnJWTxUnsNC0UMNSAUoxe5A1/PsSbSVfqm5+d1NeB8HNj?=
 =?iso-8859-1?Q?1HjpCU7008FaXfVst4zp98JW76Pt7HQ9XQBrNLququbiPD+D6lqrxw64fP?=
 =?iso-8859-1?Q?INup9ZfIN7+ahg4ww+Ue1MEdGlUV?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7177.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?X7vkrdGTpirGudILqy6abZmdlgcVU49BMWVpW6zXgjCqWagv8ZRDERXUpc?=
 =?iso-8859-1?Q?ieuGOaFzePmyF7xxXKp0ktEh0kt9CM/1RKVnSAARq+L588hyXr5GRPLxbM?=
 =?iso-8859-1?Q?S2O9U7yy22ZWjz8khs87rX22p/R/yOgptLxfLTO6Zlk8qYPS536rzRPJqo?=
 =?iso-8859-1?Q?5UgHdCGLg2yj2/tAY8Nbydd27LmaSglUbQkm61IhM397knj6SLqWZGcXl0?=
 =?iso-8859-1?Q?iT/H7DsVBoyfbh6ldtW+3q0Ldhb53NkEafiFi8akaK65HV/ePFajSPgQU3?=
 =?iso-8859-1?Q?1jtz6THkuQOJjRVI5YW0A0yLw9L5lARiEyxvCJY0vsBA6yZKLBG9/wdwl3?=
 =?iso-8859-1?Q?FMAbaHeW2Qq2ITuhpiDD8Bwh9PLBzVN6agASO4jyiZjsi+oFomABCPA8xZ?=
 =?iso-8859-1?Q?PfsXcJM30QuDN70BP4R0KjHPcTb595RSE5BRR79zZsSz2iuVo1bqMtQYGb?=
 =?iso-8859-1?Q?sH3xuKVdtQ1HvUz7oGly+gDJ9LwLxWFR+1oGVqYxkhofK7wxAxYmrELfnE?=
 =?iso-8859-1?Q?yn7yiuY+y2VZM7rSqotVPlxSbA3y544awvkOTjeg2F8RrP9NZY2eBCBB9K?=
 =?iso-8859-1?Q?Pl3hItH6d4t5znZALiSYmt0rhwnFnaq+t9n/mvPpKzcyio7HKNqrQqpWT4?=
 =?iso-8859-1?Q?VzEJdFo4TM/97gkJNuaGn8ibP4NgeP6UTrW5dQ6/ZzxJwSwi2zloPz3pfF?=
 =?iso-8859-1?Q?vHl7bS4VhHYqpgyRCET7Px8oeTzZ0zS13bjF6o8HnGrtR0tObdUCoHCss7?=
 =?iso-8859-1?Q?L2Svp7cqepG5Fx65vyKRD+31rqSUQ9g8+jqOeNocOLbCEdSplv7b6IGKnB?=
 =?iso-8859-1?Q?3zfHbU6/DK2CJqGD81Lx3Q/va0fPxMMasd6YxbsetsQyS0qAHXND+KaoHL?=
 =?iso-8859-1?Q?wq7y5PYscbeivStVvtZyCafVgP5FmJPzU+5eMbbeNdU1EDeXxn09PTuq7F?=
 =?iso-8859-1?Q?kXusbwgUyuBu6Vp3Bff+hwABtmL4cq+fj2DMH4pqBHdv227q6wd724C7G/?=
 =?iso-8859-1?Q?5X5IKOcV4BtrCgJGpV8ylODiNjyC4QmnaZOnPbVNEVpLJkI0aZzyebTFlc?=
 =?iso-8859-1?Q?eFfNBKQdmdn0KilMsZ4p/MKU6voDPk2iMGOFpzJIDfgOFU+kfUhmtpJ3vf?=
 =?iso-8859-1?Q?4rPfyFeWGijm5rT7zRhNU4sV/tnva5ryxsD2gXEWfheBxMswtZAgniBjwv?=
 =?iso-8859-1?Q?FErGNeqmW0SltZEsn+PlmJ3Cbg3V4iAoP8AUdlFfuB5z1U+6rKiz7nGmfz?=
 =?iso-8859-1?Q?cvkuocby+UK/pYn6n38AIEP9Jrq3zBIqEKDaMTZPrHV2LXi8+zoOc42Xb/?=
 =?iso-8859-1?Q?N4T98OFcB0TfJRcPFDyursviKQCoeeENHr5xFl92FSzQzGfyAt0pvi8LcP?=
 =?iso-8859-1?Q?Hm2CzEt/5iRC/X43qD4ZzDv2oIS0WIeacKMF9cDEyy5Ps1WhA0jsj3BxnI?=
 =?iso-8859-1?Q?5BROHH9XGB6OQymcy3+0ftxKn1FAghopHUaOpgPuQon1cVIwXoscZQ9CJ+?=
 =?iso-8859-1?Q?YabmpCa9aEO1LdIUdfrooLK7oEbAP4iylC3SRvtVm1G24rVbC2NjpE/F+S?=
 =?iso-8859-1?Q?qT8NKJj51JjbT1PaC07kofSzYsHGwJwPuhh3KEYqVRVl1ZHNf9+kgpCmlP?=
 =?iso-8859-1?Q?2btrhvVrnAbOPiP2hIjO054cs+E/n3a1Nz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec1e8de-9796-48ec-f731-08de183c842c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 05:15:32.7709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOhgfuYKUaurdTe7wdaBZ+z+SOokAWgnXVR8nCe/ng3itaNtYlQbOg2uUQp3w8G2M40ObMFMHfL2wBoF3KBxo+smw3xTILLOULdjEMYh//8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9274
X-OriginatorOrg: intel.com

Hi Jason,

> Subject: Re: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
> interconnects
>=20
> On Thu, Oct 30, 2025 at 06:17:11AM +0000, Kasireddy, Vivek wrote:
> > It mostly looks OK to me but there are a few things that I want to disc=
uss,
> > after briefly looking at the patches in your branch:
> > - I am wondering what is the benefit of the SGT compatibility stuff esp=
ecially
> > when Christian suggested that he'd like to see SGT usage gone from
> > dma-buf
>=20
> I think to get rid of SGT we do need to put it in a little well
> defined box and then create alternatives and remove things using
> SGT. This is a long journey, and I think this is the first step.
>=20
> If SGT is some special case it will be harder to excise.
>=20
> So the next steps would be to make all the exporters directly declare
> a SGT and then remove the SGT related ops from dma_ops itself and
> remove the compat sgt in the attach logic. This is not hard, it is all
> simple mechanical work.
IMO, this SGT compatibility stuff should ideally be a separate follow-on
effort (and patch series) that would also probably include updates to
various drivers to add the SGT mapping type.

>=20
> This way the only compat requirement is to automatically give an
> import match list for a SGT only importer which is very little code in
> the core.
>=20
> The point is we make the SGT stuff nonspecial and fully aligned with
> the mapping type in small steps. This way neither importer nor
> exporter should have any special code to deal with interworking.
>=20
> To remove SGT we'd want to teach the core code how to create some kind
> of conversion mapping type, eg exporter uses SGT importer uses NEW so
> the magic conversion mapping type does the adapatation.
>=20
> In this way we can convert importers and exporters to use NEW in any
> order and they still interwork with each other.
>=20
> > eventually. Also, if matching fails, IMO, indicating that to the
> > importer (allow_ic) and having both exporter/importer fallback to
> > the current legacy mechanism would be simpler than the SGT
> > compatibility stuff.
>=20
> I don't want to have three paths in importers.
>=20
> If the importer supports SGT it should declare it in a match and the
> core code should always return a SGT match for the importer to use
>=20
> The importer should not have to code 'oh it is sgt but it somehow a
> little different' via an allow_ic type idea.
>=20
> > - Also, I thought PCIe P2P (along with SGT) use-cases are already well
> handled
> > by the existing map_dma_buf() and other interfaces. So, it might be
> confusing
> > if the newer interfaces also provide a mechanism to handle P2P although=
 a
> > bit differently. I might be missing something here but shouldn't the ex=
isting
> > allow_peer2peer and other related stuff be left alone?
>=20
> P2P is part of SGT, it gets pulled into the SGT stuff as steps toward
> isolating SGT properly. Again as we move things to use native SGT
> exporters we would remove the exporter related allow_peer2peer items
> when they become unused.
>=20
> > - You are also adding custom attach/detach ops for each mapping_type. I
> think
> > it makes sense to reuse existing attach/detach ops if possible and init=
iate
> the
> > matching process from there, at-least initially.
>=20
> I started there, but as soon as I went to adding PAL I realized the
> attach/detach logic was completely different for each of the mapping
> types. So this is looking alot simpler.
>=20
> If the driver wants to share the same attach/detach ops for some of
> its mapping types then it can just set the same function pointer to
> all of them and pick up the mapping type from the attach->map_type.
>=20
> > - Looks like your design doesn't call for a dma_buf_map_interconnect() =
or
> other
> > similar helpers provided by dma-buf core that the importers can use. Is=
 that
> > because the return type would not be known to the core?
>=20
> I don't want to have a single shared 'map' operation, that is the
> whole point of this design. Each mapping type has its own ops, own
> types, own function signatures that the client calls directly.
>=20
> No more type confusion or trying to abuse phys_addr_t, dma_addr_t, or
> scatterlist for in appropriate things. If your driver wants something
> special, like IOV, then give it proper clear types so it is
> understandable.
>=20
> > - And, just to confirm, with your design if I want to add a new interco=
nnect/
> > mapping_type (not just IOV but in general), all that is needed is to pr=
ovide
> custom
> > attach/detach, match ops and one or more ops to map/unmap the address
> list
> > right? Does this mean that the role of dma-buf core would be limited to=
 just
> > match and the exporters are expected to do most of the heavy lifting an=
d
> > checking for stuff like dynamic importers, resv lock held, etc?
>=20
> I expect the core code would continue to provide wrappers and helpers
> to call the ops that can do any required common stuff.
>=20
> However, keep in mind, when the importer moves to use mapping type it
> also must be upgraded to use the dynamic importer flow as this API
> doesn't support non-dynamic importers using mapping type.
>=20
> I will add some of these remarks to the commit messages..
Sounds good. I'll start testing/working on IOV interconnect patches based o=
n
your design.

Thanks,
Vivek
>=20
> Thanks!
> Jason

