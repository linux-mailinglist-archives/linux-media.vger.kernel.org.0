Return-Path: <linux-media+bounces-63510-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yl4mLGvTH2oDqgAAu9opvQ
	(envelope-from <linux-media+bounces-63510-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:10:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB7635064
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:10:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=BvPf5LDs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63510-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63510-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C51AF30721A7
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752953FD14E;
	Wed,  3 Jun 2026 07:04:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C13F8ED2;
	Wed,  3 Jun 2026 07:04:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470271; cv=fail; b=bV/aVSfcdflryeyhpIqvyYKwE9dPBY6oZdyGl2xV4WtvDVOrmgp5b372Oy4qnPfZaay6bdSAB4W1hV7YOr8ZAcJxdcSjFF0ZVS+eHLgLTN2rMD+YCiG+boVegukS/p2ecedAnS+4o/KwwuXRBWTGHpMy1XkiFLdtvH6iJcy3G10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470271; c=relaxed/simple;
	bh=1sUt5u0+PCjV++obu5+rjIdFMHlnJ041Vy4zlto2H8o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bCLLDf2g2sRt9R7wUxv0256pXgYwSTfRBTUo9ma+QzqQ2jgipW0fdQoJx+RDbWB6uAXCdiK1fcu3+Vv7QA6qRLSeieygT8TE87RHAsDrx2iGFDs9h1B3UwxpHcHQONQP0GY7FDWZbzh0L8ZDcqQ8oiQXXkMFDlZULz1h8uxmbRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvPf5LDs; arc=fail smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780470270; x=1812006270;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1sUt5u0+PCjV++obu5+rjIdFMHlnJ041Vy4zlto2H8o=;
  b=BvPf5LDsgwVLe+LM3v1Y1bkaMTcg76/aaHb8Zp96i5iA6TX9M3l7T0He
   /G/APbX4afZ3AsB+XGqwVW8W6niwnAMIygOCytM5LKKJ7A1JD14mnmVkJ
   5FvzcWOnf8R10FECCb0wY5gsF0dJ7tjB1WFjFb/iVfSZ9sHMEZ6HWHH/2
   ALTdJq5qKyZbaxePz1aezCjUo4ieKjSL56kR+bpa/g51fl8mffHEBSl+J
   E6oOad7PDyuS3zFxpq/bAh1J/z0918boaHEREzEUnN4w+6nRjC014hsb6
   rn68iGQLFVbryjHOFhz0Vh+a/mQrdzSnhMSE2uNWP8cymV03uzMzwrO/B
   Q==;
X-CSE-ConnectionGUID: LblFxg6lRd6okLMq3EKcIg==
X-CSE-MsgGUID: T8+5KHrEQiCzNQ42JP1PBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81008299"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81008299"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:04:28 -0700
X-CSE-ConnectionGUID: dKLQYd0eT8evTA1BNsjyNg==
X-CSE-MsgGUID: gIAJGDTcSES4Q7BCpPqaUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="243087069"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:04:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:04:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 00:04:26 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgO0SyhItPoKOFYWBNFl5krgXdKpsdbWkA1FZlY0r2ZMxPILqv6V3czbhLxaNkcuRUKHvEOmWy6N0a8UoFwctMjmruBAEy98H3+EjnmF3MxxkYcWwoFqPB+SOMWWd1DLQxqhmI/ufL/wH9xUf/2K7Oy6MirCv8U0RIwQCW8hn5IWRVc5r9b6JNvVqNNuUlLv9bjATKzDqMNffxzN0XCgTDt1SfrcEiAq8goKz7AnjSSX3Q3FvNut6t1Wh+lmQLlAmaaFMKT9EkgTBc4bxYI/1EPMAUajGSqBkxNWjxlbnFRHxoEf8s6Ln7YQ0NMl47kPlOlctwHxqHPr8eQJ220L1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sUt5u0+PCjV++obu5+rjIdFMHlnJ041Vy4zlto2H8o=;
 b=Rxg3xU55KWXnJlDPxCZFztDW2T2rGdh1Pe6rn2kqsXQ221cfKud/gWsW27XqG7gq7TXIIpg3/BeBHAuXRmS4wCDbw/Zg9tf+FEeD69UrshkVP11co113ex0tyx/8m+DQF7nzKgAyFpRdlMY0/vVo9tTqVHgKYgAFSOYWyst+cJk6wbXd4pCHbyaIaDlmPY0dCGFm5xuyTFdL01Q1K729bBlhPJxmaaiGD2Emy19fJQrP3WC/GyG+7WQmW8WDUFdsunIf/+07cazW6m6+C9AA5HCWCQbvWlKgLBtiNtsDKVdPQMNJfKmJSlQrRLts9IYChUOz9FjRSikcnkzrg6UhYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:04:11 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:04:11 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "David, Hu" <xuehaohu@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, "Leon
 Romanovsky" <leon@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, "Alex
 Williamson" <alex@shazbot.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "jmoroni@google.com" <jmoroni@google.com>,
	"praan@google.com" <praan@google.com>, "David, Hu" <xuehaohu@google.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v5] dma-buf: Fix silent overflow for phys vec to sgt
Thread-Topic: [PATCH v5] dma-buf: Fix silent overflow for phys vec to sgt
Thread-Index: AQHc8gFVLsg23RDxwEGXFvwv1wqsKLYsaj7A
Date: Wed, 3 Jun 2026 07:04:10 +0000
Message-ID: <DM6PR11MB369065C9128545535BE343458C132@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260601200012.3872274-1-xuehaohu@google.com>
In-Reply-To: <20260601200012.3872274-1-xuehaohu@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|SN7PR11MB6726:EE_
x-ms-office365-filtering-correlation-id: f24ce12b-6f72-404f-56e6-08dec13e5023
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|56012099006|18002099003|22082099003|11063799006|6133799003;
x-microsoft-antispam-message-info: Pbag1Msi2uBvDpCRMTvdMSP0Vs8bZUZ0LCe/eyoZeM7TouXDCBu5p0hDsFJ2UZHIs8/u2UtNOZ0K7Ps4fBKH9UsaHrbuZ+D/TU3cegrcXXyjDExqtWPVQCJLqBq1F2XMGmwxc1wghNtqSP72myezq/ueWFExPV38vsc5sv6WuiVIhkXMFIHx+zDHy7ntDJMEux+Tgw6cb0Tv9vFPBemaASICMmf/1XqmsMmxNOmcReO98AdP+UFubz5PSkERwt2GjJCP+dL6MMog3MoVfWtSMbfY5xPDhvUZAhKHvDYxtS+PVMhelCqgLKZPhf2DOQVh7GfNmOoQqoim803+9QWe11jrM39C6JkLZF8OQC98mTP59WuxwgeduX5ZEhbPbGSeMi28eHNQqI2fklZzqY7wozchrwojEzoW4kRor+ndraSH1PCu7Z7kp5ISrLfO+j7nY4inNXOhLo19HA/VdiCnoXoaXNbG3XMvDx8uAi2PkmRz66rETG5WZyV5+/4GDrQ6TAEXsXT24p4WKsx5sPf/W4sbBK5VF/LzcHlkzREcWU7MIOhMJeiwJrQtcdh1jIc+TWddAAWNLDtp3AdD5ppgIObri8gspyPj2a0fKYrijmW0Mqp7mYDcXgBcdUWaPg/ja2PDVWR/8ObceZFOy5TosYUctu7JduNBavX7OquYvQMAHghYW4xctxqFwRv8lbJgifgtIau8C+VWn9aEi5i8lbCcUKMOaVHJ1AypvsXPGOuSrcefjZaqaJCWNgrWZII5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(56012099006)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzJTbnVtMzMxczFDU2czOXM0RFRia0hVZDdiZkUzU29NWVBwTTNnTVVveXVV?=
 =?utf-8?B?RGF1YWJkcnZ2RVV1dWx3R3RkYVVseHIrb2xNK1QwVXBrcnhBMGlOL1lkdkZl?=
 =?utf-8?B?WlNWbUlkYTRsbUVnNUV1OERNNk9zOElVcmN4UmRUSi9wVVREdGVsdUl5bjJP?=
 =?utf-8?B?dkdldGtwN3R2L0ZOZndWV3hMaEoxNUlLTndZUGFtTzU4d21sbGZUUHFGUm9U?=
 =?utf-8?B?T0ZKRHYxWkhPdTJmbEhHbGJIV0k4MDdJTjFaVnh4WjVSM0lhcWpQS2pZci95?=
 =?utf-8?B?ODU5NTd4eDRaamZOYmUxbmVoR0hKeTZzNk0xNzVUaFRXajZjQ1doK1dEUThL?=
 =?utf-8?B?N0ZwblhsRmxBbFJFZTN4dmZBNVpyLzY0V1lXZktmcUNTbU13QitpUHdRbnk1?=
 =?utf-8?B?YnpDTXYyaEZoemU5RjJaV3FmVzNJekFwVUFWdFFadFlNdlhaTlgwNzJPWE94?=
 =?utf-8?B?ZjZ1U0JZeURuNi9vUGNVRDlvMDJLL1JmbmdBS3VFYU94eUx1TDl4a1ZpZ3R3?=
 =?utf-8?B?MzArNUVQY1ZYMDI1VHV2ZzhRd2luV0hHYmlCWkozb2w3TnRFcUcrUFpZa04z?=
 =?utf-8?B?ckxNako5SG1qRWhwaXdtd1dZcGYvamdEMlljSEIyQk1ZRUpxL0ZxWXQwQUZ1?=
 =?utf-8?B?TFNjSm1ncGFqeHJJVEtNWC96eG0veXA3ZVUwV21QN1I0UmFIYUxnNjIrdmNq?=
 =?utf-8?B?SEV6U3d6M2hWbEkzR0k0Q21LYVd5dERLU3Y0d3RYdkZ0VXlsQzk2KzgrQ0xC?=
 =?utf-8?B?NmMyS2JjbWgvK21HV1FkSHQ3R2RRK1hFOGZNQTk5YXJudGs2RE9LTk5WcGV2?=
 =?utf-8?B?L2R1RnhYR2NMSm1pY1AxaFp5ZkNITUdnc3JDcWF1M2NlOGxxNUtsRlpSdW56?=
 =?utf-8?B?d0UrdWM0SDkwREpzQkJ4MlNOSnJPN1ErZ0dQaHRZK1dGeGdyY21oUk5EdDVU?=
 =?utf-8?B?V2JQMDhuRm1PeUFFV2p3SG1qeEhYcGdINWpickdUZjZHWGF0Z0hmS0lQZDM2?=
 =?utf-8?B?RTVCanNrWDdETFhwankyLy9ScXFYTmg3SzgwNWdKSzR6NDhiZkNhUDRpTHlo?=
 =?utf-8?B?Y0N4em9aeUJlV3FFZnczejNBOVBUMjVWWG5SVHlKSm1MWUZGSTl1M0pXaHp0?=
 =?utf-8?B?OHZMT1lrSldZTnRQSkZZbmRVYWV5MFpVMDdVNE1neXJMNlc4M2ZqVThtbGJn?=
 =?utf-8?B?RFRBYkxlZTkwSmFmdkpxMGpNbStwOG9lVlBldG9kVWYzTGlFQ0U2RlpqVlN0?=
 =?utf-8?B?ZW9UR2tXQlArSmprcmc5dGZtR0p5Z2hBRGJ3V2N6cE9EcGhoYUtZYVlqSEg4?=
 =?utf-8?B?aUlsS2JVSUVqOWk4MUszc1c4OUgwWmZmdjRSVHBnL1RYR3Z5TDVNQnNLeEZs?=
 =?utf-8?B?MEQvUGU5OGo3UHgrQ2pwR0hJN3RPZ1IvaTRBenpDOFZGTDlQRUQzOHVMQ0NJ?=
 =?utf-8?B?MG9DVVFMZEcwRlVLajRxWDRiRWkzdTlITFBPOHNsenU3NnFRaXZReFVUZFpK?=
 =?utf-8?B?NTFDZUY3MEtaUWRPeFNlbEx4eWtSMzJ1aUdyU1Nxd0dZMlg4d2pyM3FwMUFV?=
 =?utf-8?B?dURRZWx4OW80WHRaVFRBcENKOXNrMG1GN3Q2cTQ0VHlFcXMvTzdRYWlabStB?=
 =?utf-8?B?RnB2WE5TVktGd1ZEWGg2eURXZHducWdLWXpMeURQaGd0S0M5NE1BSU83cXdT?=
 =?utf-8?B?cUhRTXVycVFieU94QTI0aUJwUUFzbjFhcVppVTZqR01jQUxMaWh5U1VYY1ND?=
 =?utf-8?B?azBtMDNtUXNicTZ2WXByZFVpUmxzZnk4ZU1LeVp4UkY4UGo2ZGlMWmdGbnRj?=
 =?utf-8?B?YXUvNlBza3MrbTRwb1l5dXg0N1VxRFVvUDhOQjE1T2o2NVJnMzdYV0JkT1pz?=
 =?utf-8?B?K0VwMnVWV20xRm5hZVp0dUJ1Qm1LTHVTZnRKZEdrdzRXSmx2WGNFNmtjeVRG?=
 =?utf-8?B?ZE55aVRDMGNNUFh0elIyQW1ZZnZVallhcG93N0x0UEUxS3I5WERpYUdsTmNn?=
 =?utf-8?B?d0wxN0xYVmlNLzQ1NDFRZS9NYktUQzdkZVVrRktsVGFLU05WTGIrWWFWeWV0?=
 =?utf-8?B?QS9WdFBTUjNMVmtpa3NXM3UvNlZrYjJ3aHZ6SDRhc2tzdm1iZVpXOTU1U01v?=
 =?utf-8?B?ZmZva0prNkpZaXh3SXNyYTRCNjZmN1dYSE4rUWtTeVMrMDlqN2lxM0hvaHFq?=
 =?utf-8?B?OXk2bGRja2xnVXg3cUFDclMyMnFMNndUVE52ckEyVkVwWHBCWVFrRUxQNVlv?=
 =?utf-8?B?SjZ1d09QQTZadDhpUHdFRlpSRmdlNlY1cHp4Qlo2ZFUwaGR0R2xFTFlPK0tq?=
 =?utf-8?B?WUtzczI0UHAzVklJKzJKZlhOYlRlQWVZcUEzYmJKVnB0SzViRFhqQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mjO/nqzPmHp8xDHdreg1+Fb1LuGCzE8CgGUyBo4F6Na2wvbsJftcl0/KtzgmBqbI5A6NJGo5m8sg/hl1IuS6QguIOtURsI4i5lhlevMHEC8qV7PaglPaDMmVqTPyikwP9xAcLYhziIbFfzJPZW3leGg+dJ5lQ++e1u02Ge4qJ7mVxvDd332nuKA1oA6uENlOuQNDrDW+OsN+VhK9oHuy4ApLab1p14/4owpuXaZhnRtnmA9ViPd6iMVdfx/OXLkQmwTj1jqrSQ2wBMrCuO38rMVy6/p8cmwsBTg3xmFy3PRmVmlTP2FufVP1hlKgdqjRu7reBd1hRpIeso+yYO9JgA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f24ce12b-6f72-404f-56e6-08dec13e5023
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 07:04:10.9363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iFenc/n4zHArtpMyCeg+ZFZOirLb/6bwKZUVOlJppO0/U0T/AOf8yk8xxaQYBE4GwB0N+7L0c0WM1n3va42vXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63510-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,DM6PR11MB3690.namprd11.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CFB7635064

PiBGcm9tOiBEYXZpZCBIdSA8eHVlaGFvaHVAZ29vZ2xlLmNvbT4NCj4gU2VudDogVHVlc2RheSwg
SnVuZSAyLCAyMDI2IDQ6MDAgQU0NCj4gDQo+IEluIGNhc2UgTU1JTyBzaXplIGlzIGJpZ2dlciB0
aGFuIDRHIGFuZCBwZWVyMnBlZXIgRE1BIGdvZXMNCj4gdGhyb3VnaCBob3N0IGJyaWRnZSwgd2Ug
dHJpZ2dlciBhIGNvZGUgcGF0aCB0aGF0IGFzc2lnbnMgdGhlDQo+IHRvdGFsIGxpbmtlZCBJT1ZB
ICh3aGljaCBpcyBncmVhdGVyIHRoYW4gNEcpIHRvIG1hcHBlZF9sZW4uDQo+IA0KPiBQcmV2aW91
c2x5LCBgbWFwcGVkX2xlbmAgd2FzIGRlY2xhcmVkIGFzIDMyLWJpdCBgdW5zaWduZWQgaW50YC4N
Cj4gV2hlbiBhY2N1bXVsYXRpbmcgYHNpemVfdGAgbGVuZ3RocywgdGhpcyBsZWFkcyB0byBhIHNp
bGVudCB3cmFwLWFyb3VuZC4NCj4gVGhpcyB0cnVuY2F0aW9uIGNhdXNlcyB0cnVuY2F0ZWQgbGVu
Z3RocyB0byBiZSBwYXNzZWQgdG8gZnVuY3Rpb25zDQo+IGxpa2UgYGZpbGxfc2dfZW50cnkoKWAu
DQo+IA0KPiBGaXggdGhpcyBieSBjaGFuZ2luZyBgbWFwcGVkX2xlbmAgdG8gYHNpemVfdGAgKDY0
LWJpdCkuIFdoaWxlDQo+IGF0IGl0LCBmaXggc2ltaWxhciBwb3RlbnRpYWwgb3ZlcmZsb3cgaXNz
dWVzIGluIGBjYWxjX3NnX25lbnRzYA0KPiBieSB1c2luZyBgc2l6ZV90YCBmb3IgYG5lbnRzYCBh
bmQgY2hlY2tpbmcgYWdhaW5zdCBgVUlOVF9NQVhgDQo+IGFuZCB1c2luZyBgdW5zaWduZWQgaW50
YCBmb3IgdGhlIGxvb3AgaXRlcmF0b3IgaW4gYGZpbGxfc2dfZW50cnlgDQo+IHRvIG1hdGNoLg0K
PiANCj4gRml4ZXM6IDNhYTMxYThiYjExZSAoImRtYS1idWY6IHByb3ZpZGUgcGh5c192ZWMgdG8g
c2NhdHRlci1nYXRoZXIgbWFwcGluZw0KPiByb3V0aW5lIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcNCj4gQ2M6IGlvbW11QGxpc3RzLmxpbnV4LmRldg0KPiBSZXZpZXdlZC1ieTogUHJh
bmphbCBTaHJpdmFzdGF2YSA8cHJhYW5AZ29vZ2xlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRGF2
aWQgSHUgPHh1ZWhhb2h1QGdvb2dsZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4NCg==

