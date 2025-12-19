Return-Path: <linux-media+bounces-49210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F20CD0E09
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 124FD303B43E
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAED264627;
	Fri, 19 Dec 2025 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaZlWSUD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D522A80D;
	Fri, 19 Dec 2025 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766161307; cv=fail; b=VsSwUch1srwhYpf8b625xsZltgwhKJ/soGCP1jUogTySa4jBIKu8eJkFJhPuH08YXpMzfbo6pd1X3Ql6EhdM+pIeHG//N4wzQG0VL/lX4jdQuU63cZzAQmF91cd3sW1cTdDmFAy6S4utYiTBocQCHBimQi0r2VLX2cSzEdUlPBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766161307; c=relaxed/simple;
	bh=M/3/C2/Zar2qbPMgsofSsHy0yL1acpGt749S9VxWOi8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RpiSwc38+aYpOGay4Z3VvVFEyCbE1q1ehVPCLmPMJaDjwKGiOPBydf941iVjBGIwVTy4AwEwtpOXCJlSb3GOvIHpXZEmVp2GN2o+TFSd59xgJuzzwzGPkzIHCAHlME3LFCLKhe+vlJdLtIEFP/fOmio7xWmM4BeKY0blyjMNApo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PaZlWSUD; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766161306; x=1797697306;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=M/3/C2/Zar2qbPMgsofSsHy0yL1acpGt749S9VxWOi8=;
  b=PaZlWSUDqmVV5fSRhz74l8VgxlLKHE839blyc5YKK4nwWBLLKRXS3F4Y
   +8+RoBPvglOCy+wtkRyaYt33qy32Nt/LjVTbFGimiw/EVDyfv3fhZXs+P
   g6lJEzg5T//84DVIv81WnEj1kbcsGsi620rNvdZnUSqmW9qwX8Y1gcuLC
   TYRLC6ARA8d5l/+xPym46VtQ6Bx//kBvR3FN3j8JYFgKpfD5aZfDR3Nrt
   KKlYhkHggtY9f54wWpYVeIU9eGyA/Ikvab3DOb2CVGynuEJKvRDuCgCwY
   /TkTxXekVdMvexcizmtQoQkV8smLrm+JSHh3DmKc/7KO13qvHShvMl7Ul
   g==;
X-CSE-ConnectionGUID: zFbJTHHrT6uOPrm9T8EaSA==
X-CSE-MsgGUID: lp84xR0JSG6MChXCMrVThA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68165840"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="68165840"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 08:21:45 -0800
X-CSE-ConnectionGUID: MaVSW2f3RGu+QyYMGjxSUQ==
X-CSE-MsgGUID: 70AnFY5RR1eX9LdgW5VEhw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 08:21:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:21:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 08:21:44 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:21:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0edFYba9S49p0elJk2f0Rg+NjM6VtYtjyFrSD35r1XJ1KU8l5hi/qjK1wapeJB6H7sRpouiIU9Y3HwWy8wSCSJQ8eMIdqHR+5UE62g10+ntwJ0Isqzc3IiOikVzN7m2QTzdN4rSg2ZcI0/Vg/EW1mrU4OoZErndqXdRnwZO4fIU+bmKDguilDl1sPMXEh5FZrSx7QOGRRTAzcSgOtKquncOZPQxiW1HzHjhXvpMSt9eNoKXUik2dh0QYCNhswip95csxAUi/7HHYqiK4W4GHu53EuNExi4l/dubOJy39ilmwkIxhCCbe0OpI5WCZRf5g9VIxmVuWGzZ4bjb+zioXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzIMCYz485QqHLxrdYdRCy+hspwjojFJgM3wMJINwHE=;
 b=kq5TS4WavEKSzko8EJisRKNMLHF9TwpFsqomNK04yHk8V0Se5ZhyP9e4TjHJoCaF2kK9hePrLtyIEAOnmUyuygGH13gmThJuhf1FVgCEQob1xXzDIX1aFlmbe3xT1OEjtLo13VJmRanqZyt+czJTESo3t6kUi1bTf2hVjJd+KJ/AwnwZ/8kc9DCHiQyhe/XPP+4W6l4LPQPmRn3TzzZfI5wTNY/9hFe6+cktByBoH+nM1hnmL373RezuOtT9N+135WFi60hI87vFHigKR0Gs7rfJ8cwtkkiR04vgRAVBagRtSPX6ucSKw2gUfzaUet65XWBTu7gu2BEYuGQO4620rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Fri, 19 Dec
 2025 16:21:41 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 16:21:41 +0000
Date: Fri, 19 Dec 2025 08:21:39 -0800
From: "Luck, Tony" <tony.luck@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Al Viro
	<viro@zeniv.linux.org.uk>
CC: Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, Chris Li <sparse@chrisli.org>, Eric Biggers
	<ebiggers@kernel.org>, Kees Cook <kees@kernel.org>, Luis Chamberlain
	<mcgrof@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu
	<petr.pavlu@suse.com>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aUV7kyjxlijuy5sC@agluck-desk3>
References: <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3>
 <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com>
 <aTn0WdVv-S_EpQmS@agluck-desk3>
 <aTqAxfiVCR2ch4I5@stanley.mountain>
 <CABCJKufWw4VQA_k6Deuf5Bn6401cbYv_St8VV_0-LAau6F0nTw@mail.gmail.com>
 <083ebd92-4b3f-47f8-bf0f-395a604b5f05@kernel.org>
 <aUVI9smf2t7PvDF6@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUVI9smf2t7PvDF6@stanley.mountain>
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|CH0PR11MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c80a18a-c719-4659-7485-08de3f1ab15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V2wztL/ek/wts7ebeApSq8E49fmBiAnNkP94YtsIOpb+lhEZ3fxGDpDGf5te?=
 =?us-ascii?Q?N1dGUy7ivlcn7CHbUtesrSqvCOWM93bnSSerLtP3u8A2kyVblCUcgT4RKnjk?=
 =?us-ascii?Q?WIwhSSnUyV/yaTE34pZSLc0noOB081hBl/nRHN2oLVf1ooVLHSCHbupwBHdP?=
 =?us-ascii?Q?SwEhgQguVg4xQN95hkzX7AvawCMH5V5gp/9ZEQwukDKzDtZ7yECOOuu2uv0f?=
 =?us-ascii?Q?UOpddg1nP9O0v/K2j7gc2LfZZ2bw6nTdZGmP47zcIpHc1pT1ZnY4VTl+T0St?=
 =?us-ascii?Q?chivK/EJd86bOsiauWyG7loocsuYtm6wvZv3VgV0hyT1otv1C/k4HpLl5Igh?=
 =?us-ascii?Q?azqQpwJX5s0Dx6gs06W6SyWKb58Mn0/FQ2WtpzGf26mb6WjH8ByrF0z5Q2FK?=
 =?us-ascii?Q?yQYjTGsFv/4WxdDRkeLoDad/oBxIipnP5l3ZQ8qVpJ3HksFH3Wc0cH3JaMTt?=
 =?us-ascii?Q?mgIviX+fD8gYF1qS69R32FtoU65jJf2UD9TLrKzan6oC2PxgwttwQ4Ec1jnB?=
 =?us-ascii?Q?GKkcS/wu+sw7TiUy/fQYXZDDluQ+/uPeApRgLCgdcXqjcNo6Jg7WMa/uRmD5?=
 =?us-ascii?Q?P7ZKbWfpsRxuoyLRhCijQpf5/etUjVKIOd/MC+5Jmhk+dDSIaP7nwGpuALVC?=
 =?us-ascii?Q?VCzmCHBBhymFDBGorSIlwACfvPtVGlazoxSp5ZPft2PooIOCkC4QM5pgVBcQ?=
 =?us-ascii?Q?CrIL0Eatys39HY7IpHqKon6rULMuguNonFopl2WfuMSalnv0s+qj3VkXWHrA?=
 =?us-ascii?Q?Hvkgb/XEOCtoj+BmUoFPECrBT0Ru//O6BiN1kYG6h7cIk+QB0D2Ms8zHD+9x?=
 =?us-ascii?Q?wLYyiq82zHOQguUo9dfw/Bikimhfykf/SRClRaPYCNgO8ZrvIRu7F5fBjFdW?=
 =?us-ascii?Q?WjqLiB1NiWrbulT4G4c9EK5nHK7QCizGgFIbNZiRmbqvgvrUsZ41A/lgimC3?=
 =?us-ascii?Q?967k83Dt/VeYUCPI5wbJR0H/sQYGsMHzVjbDG+CQhZJPjpFxyJsjvs3pPHTV?=
 =?us-ascii?Q?OCiFTVflvyOs85vtlE/iDBymu5OMdsjDEz6y5GQs5hiUdjGGiGxDpB/sHW1T?=
 =?us-ascii?Q?mHDKuEqIDGsc7MG7EAQY6IXdHw6L49iapaGhUre1wz/rBU1ojPANLMENchbl?=
 =?us-ascii?Q?MoJ5BWHmPjvsL6CYmKgtF+8+nKWzKqa745i7VNqZvoKr50Hm8c9IwMvA5ybe?=
 =?us-ascii?Q?XNrKxWhhk1bHHjQ0tYlyUBr6NCLWvXvSb1sHQHukvl1YcfNLVqJnGpqjUQVo?=
 =?us-ascii?Q?1yOUbmhYzEna27cSK2WuvII/eoA6ohoDabqmeAsQxaAaUqFuObuDkcD38r1e?=
 =?us-ascii?Q?bDIsxQHrtaMi8agcqyaXTcElv0JveKudBlPPHo4Zsn2TL21Efodcww1h6ZA3?=
 =?us-ascii?Q?AaFz86IOD1tte8CXTy8L4CIGysuy+eW3bJmoymQb4DIlIzTYdoX+WMDKu0o+?=
 =?us-ascii?Q?tYpsfmsNGb28HanIntD8oK9mwGBH9HYi6uU1Yz5akDwtbdIFR8ATrA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e4DpS+Rf79eEh/5Qr9XsQ7u9UEL+qM3nDlWoauDNsWvVwhP9NUNzD1AcbOWV?=
 =?us-ascii?Q?oxMz6Rpi3GjgfaoKu1jjRa4AemkkDv/65KPnieDGYJwpx/ZZqXmnrBDvKPFX?=
 =?us-ascii?Q?wqQusaraSR9DbEnyDizo9fN2iKz+fYUhuTog+rz2u7nI9m08gPzP6L3Yhw6d?=
 =?us-ascii?Q?6TmCx+62cP0nTFWzEyXdYy+6iITKuert8D/PZD49MtYKoQV/X6PCioV2y/rw?=
 =?us-ascii?Q?3fCSYVrJVd3bzTRFJWo2/VAll/kvVVvRl9lXPHMJpZU1CDIe4Qu5/wzPYNmQ?=
 =?us-ascii?Q?oIQ+y3gU8hnvpAfNH8rAGX63QrvrXpZ69YWDr0FrHpK05isLtRpOgdJyobov?=
 =?us-ascii?Q?hpkZylo2mQ9JIBdOkRGg7UZzViy1ArEMwSKHVlw7bFAtZ71L/r/51fc0wqrP?=
 =?us-ascii?Q?DicisLbBXfmvA+tckfIo00NjrEssjwdkvTVh0UkVPEf6jnz8NAQu8r3GaiJq?=
 =?us-ascii?Q?PjzIVEQQfHoFEdG0wBCGISLGSRK846GhYxTntFYQlRnTU91g6HzJgqriGvpS?=
 =?us-ascii?Q?rvoShhuh9coYeFOej2HKuYaCYwdvu6wCAEBksqDshwgUokzkFFquQTrkAzyq?=
 =?us-ascii?Q?wBUWa8hUEBpyZQsvZG3bnE8XYFkoT/6FIBlhvx42Ff6E06iF6e2Vg9O4t/1m?=
 =?us-ascii?Q?Xo104guYBG+EO1D2U6Y1SEbb5daryMKUJGFeJgJB2BA/50BggC3qbkXFDjtU?=
 =?us-ascii?Q?WikEzvwYuUCAQ+qNOsuy0vknj8Mjmbu5LMYNqkUj4HBgSHZBUjOPFoSmUg+/?=
 =?us-ascii?Q?rxVrsLG6UMEfEYcT3tFzuNXBBa246+86aLjqHwINWxFDj7BR/SetsAZnBZ4q?=
 =?us-ascii?Q?ZRC4u0+lIdgF8lB9z1z7ZYh54GHNSMo5bYhHvT669X1h0aaYirvUD7xl9ppd?=
 =?us-ascii?Q?ZhKMBIhPfqpp5WP8JHmwj7jw75zX2SDv+4paoSiMKH9b1i2mwbVzjL/h5iii?=
 =?us-ascii?Q?jDBaHsPTp72kRUNJ/UlYFIjEcmDgjvIgTUw7t2e8GKP1qyNgsfjBgMoZHdyM?=
 =?us-ascii?Q?Rs054QNGe6ctMilQ913NPRUTHmOIUb/GiWjaJx6q5Lvbn3ZFtQAWhqvHOiIy?=
 =?us-ascii?Q?p1FvYWLPRB7Hm992VUwSNIZF4XQcQE/g0raaLjg3W7sHNCappXz5SzAUCDNX?=
 =?us-ascii?Q?RikVR1wWNY0vdVJMe1MlOsSO9gOxMaU9/NZhG1PxYe9Nmf2ZTgo+v7wNLMzD?=
 =?us-ascii?Q?AXAoyYWPVk0VvP+kwDegF6QDRpwaFO0mn1xh8zgJ88GtG6vBC9mQeDrDycXe?=
 =?us-ascii?Q?oGPiLSIQDL9Gtsm5msyr15AFHAYmovm+TfzeYpiafP3icQs7TN54x2wtKMS3?=
 =?us-ascii?Q?Oy+BJsTe4DSiuAiOEgP/UCg3/4eL+i6A2dONr4Mh+Ahgf4aR3MbRBsa99MqN?=
 =?us-ascii?Q?OXyB/wiaNyyAveMi4Jf9+U00JeCri8WpsfE0ALB65KjIVIiRmM7TuM5z5LH6?=
 =?us-ascii?Q?BMgcZD+9LM25JV4gJJ+NVb83DnCzcP49Dr7Ja7dS0f/c+CfmMNzikaP+3GrD?=
 =?us-ascii?Q?46PcpDxtC7mlX41p/cjyQyPgG57bOU95UwVv3oDvj+dQpfQgR7vedc2pR54N?=
 =?us-ascii?Q?FZ743DqVy7SC5TdKRFuSuS56shoZautGVQbTPhSkGfLsr4R0UElYU5J0JiNU?=
 =?us-ascii?Q?HMIr4noufA9E/W7uR9rb7TlUzWL6QUE3YSG5VaFFNI5N85gGDxKXMCTNkZA/?=
 =?us-ascii?Q?SnVT+9GAb6lFfAhuC6/Wsz3OcUnl5+gHXlTdKQ4FLsvmCiX4C43whggy03S2?=
 =?us-ascii?Q?cydIpseC9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c80a18a-c719-4659-7485-08de3f1ab15f
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:21:41.2900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOkXBgoxbJZnR2Do4mWMUV5gurreltjDSXIlkgN9JlDpAt3+6NtpqKZ2QfVPIrxH8CukXuviIDyY2dUYwtACRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
X-OriginatorOrg: intel.com

On Fri, Dec 19, 2025 at 03:45:42PM +0300, Dan Carpenter wrote:
> On Fri, Dec 12, 2025 at 02:30:48AM +0900, Daniel Gomez wrote:
> > Maybe the flag fix just needs to be applied to the evaluation? Other op
> > structs do the same. But Dan's patch did not implement evaluate. E.g.:
> > 
> > static struct symbol_op constant_p_op = {
> > 	.evaluate = evaluate_to_int_const_expr,
> > 	.expand = expand_constant_p
> > };
> > 
> 
> I was waiting for you to send this as a patch.  I can do it if you
> need me to.

Dan,

Al Viro thought this was wrong. His alternative patch is here:

https://git.kernel.org/pub/scm/linux/kernel/git/viro/sparse.git/commit/?id=2634e39bf02697a18fece057208150362c985992

-Tony

