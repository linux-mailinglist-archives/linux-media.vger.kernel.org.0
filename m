Return-Path: <linux-media+bounces-13200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 100019076C1
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 17:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28DF01C21398
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E8012DDAB;
	Thu, 13 Jun 2024 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGCnxT8d"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA7612D215;
	Thu, 13 Jun 2024 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718292962; cv=fail; b=uXCWj+xzNnE0tAHozsveJjDMcxlR0zNgCaYtmGCRwpwnQqw1A1W13v0JEr50O4TBB3adzwLi2caQp0i6LaaVJMPLyabIPU609sCXHOORWRFsLxExVzM3iEZGpfjZ42YDOh/BR9I2MZ8NiAlu4qUPPxHUcL/tKedkHZPqhk7agBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718292962; c=relaxed/simple;
	bh=o+6jtkQSf7lzB4zuLjwExs2hOjtrH0ke4qSK6u9CtjE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GE/T477DXHlY8iXf5YRaEhrDFDvXkIOhOns+1HzTN2eYyn1gUFHqnK/bP2PqzgOxP597ll2gO4Ja8BRSSmdv9dfdcWRy12K1jUJR73n+JA/9b7xDtcPj6jBLAwAfa2az9XmeUgGTVSFRq8EG6yPr8IagvqgRsQAe58aepSmPxYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGCnxT8d; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718292961; x=1749828961;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o+6jtkQSf7lzB4zuLjwExs2hOjtrH0ke4qSK6u9CtjE=;
  b=FGCnxT8dvn3R9K/TH7xgHf6Z67WvKYsUFOHjVmN+VoB2w10Kzc/JH19L
   BoJ4QjzBJxCAMwXHazLO0FPex9oPeBy457p/70C5t5aRgWfS+ciNl9hbP
   uTSVyB21rGSgmixn7kBCuITQ85c9JgUBlgsxfqcL8F03jSpihgHMplfT8
   pv5rYDA1hRSEwqJi5O8gTv/U1aOwhe+0Bo0AkIWWRACehyToxmP4BoEWt
   8cRDZOcdTcr4IBhUskQTq6cH5L+hh2a1jJLiMlFeHaO+XipcD7XNebAPT
   qTtbMg2CXw0mt2OgyLi+7dEi0/8mTXJ0Lzaejn+DHXQ1FamcWWdZrUm5/
   w==;
X-CSE-ConnectionGUID: 8Ya+3UNtTZiDJcjVLrvewg==
X-CSE-MsgGUID: 5gowMO4PRy602zzk0u4gvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18952287"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="18952287"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 08:36:01 -0700
X-CSE-ConnectionGUID: I49W4YsNQKCd3A4NItcUGw==
X-CSE-MsgGUID: euoi39n8Q0WQU8puViCLCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="45098616"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jun 2024 08:36:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 08:35:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 08:35:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 08:35:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 08:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWY1OV+SM2vOXc+xLJ3qjIm1auE9hBIaocbniiJCFdoWNAkXr0cTA29Bd+O4AmAThPHsYhW2Dd4+y2Lz3YPpViLy6VHIEXrdYbaj0G/kE3ODCMzrftn6n9kFTfUlbaXfgIUOPxim2kfhCKTS8GZ/+qCwskxk6NtBJzwdLnS1/b/cxujxmNvuXq1xU61f5OQc8cwRJJ+hwHmRbs8rAOnw9POYZM5XUhVvaCE+jBoppoJLl/gqJtVvvhbSxZAbVtiwf8WLftCJ/aOJA01d1oK28iXkuZGnC8DWOvjKdO32qPkWsKcVVxm/Hqv1/CoMl1rNmomwuHlodXeMFF8PKSuTwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+6jtkQSf7lzB4zuLjwExs2hOjtrH0ke4qSK6u9CtjE=;
 b=XNfy+RI7iDGpEY3W3oAR9JLbaWF/avnHfNnWaj+9//ryPDkQyhx/Ul/Zr2r3H8maoQBU/Ub2AdNP1Z7MrMCz/Cz/0CiUve2f3AyJs9SgFbsIspPcIPk6GfhZDLUjBUKVV5rkdRThG5kKlWcC14e3qqMTvKlvNSOOmeFGS1wR5BfLvzK3SKMlro5KweqmyU0OC9lcmMlR70EzmUJAdfh5QgCeyZnKQq7z7ZppnfzSMk/paWqW5OHJ37eA9AEiZwU5z0mdt0jhh9CIMfk/nvBlUM5uEqtCRisPMJ82Wrp/kOR3iRZCqrHx1DUg+ZsH2O6/9lWw8QgcY7XSIxMBP/O0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SJ2PR11MB7428.namprd11.prod.outlook.com (2603:10b6:a03:4cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Thu, 13 Jun
 2024 15:35:57 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.7677.019; Thu, 13 Jun 2024
 15:35:57 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Hans de Goede
	<hdegoede@redhat.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, Andy Shevchenko <andy@kernel.org>
Subject: RE: [PATCH v6 05/49 RESEND] media: atomisp: Switch to new Intel CPU
 model defines
Thread-Topic: [PATCH v6 05/49 RESEND] media: atomisp: Switch to new Intel CPU
 model defines
Thread-Index: AQHavCWm4Frw5V/RYk6sF+fK4/vZB7HDx5wAgAB5MgCAAZR/wA==
Date: Thu, 13 Jun 2024 15:35:57 +0000
Message-ID: <SJ1PR11MB6083C042F658644B304C1A13FCC12@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20240611173406.352874-1-tony.luck@intel.com>
	<38336785-cb59-464f-b2a7-49812f4c2ce0@redhat.com>
 <20240612172355.11c470a3@coco.lan>
In-Reply-To: <20240612172355.11c470a3@coco.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SJ2PR11MB7428:EE_
x-ms-office365-filtering-correlation-id: 5a22c0f3-b7f5-499c-5df4-08dc8bbe853a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|1800799019|366011|376009|38070700013;
x-microsoft-antispam-message-info: =?us-ascii?Q?Z5cW/22d6oKHACtrF2R9b48Rr/tM/XEfr4ZM20jx4SqrV8AVH9swu7WKi/tX?=
 =?us-ascii?Q?Ka6BoknVnF28mAKDL8SJK6qFGTcjK3RA+CfIz5BxwBDNn3p7mTY4zq1w2NES?=
 =?us-ascii?Q?XGbSeOwbrrELbVSGCFyCIoWNLCmg0PsUdUSr1Y4UYOdHysR5dt+gBg/5xh7X?=
 =?us-ascii?Q?qITNHwLV0jVxDQVIYbSxfQhFuaLUv4RoKyaoadyZRGG91n7+jadjw40v/IJS?=
 =?us-ascii?Q?WfKkPwCbwxP5hmgNvBas0psXa7tI5qGIQHRJa8s8jxC/K6dwfJMTujLctBTw?=
 =?us-ascii?Q?Q+tjNtJ1flUOYSUz0Z6zpdadW89fcdawAfWjOfKfjca1IZ36Snp7sm8che1Z?=
 =?us-ascii?Q?EVDvYO1d7GBuaXCLKvxlHVxZp+nRffYEh4PyI+8rVAHX9EkYDEWnsHAjk44O?=
 =?us-ascii?Q?7jH3TRreeKuuTI0/iobacdngkRqWMJi9BDQW1hbY2zqPIBHVvGHFEIMk79S0?=
 =?us-ascii?Q?LfbJ7y/WiK8OK0Sub280cFn+Hp7E7Jf7Sb/Qt5SAFbYp891+CteHCpDW7LMP?=
 =?us-ascii?Q?89HfVZhr/5h3Eyhd/uiBthYTaYA0cQ3gEmu3Tsqk+TxdbJCGeULiFsO3fOT7?=
 =?us-ascii?Q?rBS4Ofwuq1CWW/F4nHZRDxqIi+qohhdJQxPga4CaYW4bsjd8UGHkm2aiK4Gw?=
 =?us-ascii?Q?tCrlGCKsX/DDLpKgnrvTepqRQp1sXW/cHI8h8NXn7av1b1pV3LvD3O1LdwbJ?=
 =?us-ascii?Q?dBh2iPf9vfC5yu0hGu9e58plGIYwHDRZpbhkB47LD0xwC/4j3VDZkoA7qeRK?=
 =?us-ascii?Q?CjndD3M6YEOjxO6B9sTvKmqyEDwK3Y4aztADvYW9QUdhbNCoxX4oiyzRqpwa?=
 =?us-ascii?Q?XwP6h+hpbP3ggqhqTrJJowZEaBtgp2dmbwZVk8KpF8L7oQ36phPKUYI+WfeF?=
 =?us-ascii?Q?aAkpjOGAbeaQNPd4UWsZ7EWEtzS0HQjXD9OBwSllxfaBr68f/YvEsLkk4kbR?=
 =?us-ascii?Q?x3/zvk94MTz676S62w94ELcTdb3vCo4YVeZfjTNb5UYm6J5klXBMtEI7iyTE?=
 =?us-ascii?Q?idgpGmL81lJXprVXQj1rKMpElNQMh+1d6xDc1CHeGqFv11i1LQUK5LbnxWaL?=
 =?us-ascii?Q?GYio018IFOuAzB5mJdILPsOu6IctMXqv9rMGubXgOuGuSl7vZJYmBfZKfmon?=
 =?us-ascii?Q?l8f4G4P+IKqe6kpVKybfzPJ214phodnLlTyb7AZStKwo15vGifFGVYWHZoIC?=
 =?us-ascii?Q?aMI/t7rITdhAD00ta5sJFTgIqNJF+5tefja5EF9mB/Pl396Z7d8ZgI1fdbc2?=
 =?us-ascii?Q?66G4xBlbhhx0vbxUqFW2RGzITr20wxgFgNBLSL3eZku8S6l78thiYtY0HaBt?=
 =?us-ascii?Q?fF3Iw5XXsCC0X0hBXo1esjOj9//YQIZSxepJZz9gSb9wuEcaHknumv1l2QXN?=
 =?us-ascii?Q?odJvM74=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(376009)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nSbsSzU/LkQwqBjk9HgRNt0BOW/XkUE9MQlu4QTdqX8SZYbFSJiAdoCTylrQ?=
 =?us-ascii?Q?8VjQtz4tD42Vpz1ZM+ADR/yURc0ATxSG+CaaiY/ipN2JIzqKwaLjTiFPc8sz?=
 =?us-ascii?Q?2UV4RxrWlcbapddA8lE3q7K1wge2InSOtoGopuhp+tzc2hNreUhxBQhph+oM?=
 =?us-ascii?Q?4nt6YgDO70Vw+2ErPn0FMNW5WZ+5F1BkSHSsOPfonBNRjhD+HnlD0tO6Iy3k?=
 =?us-ascii?Q?oinxyUIk8/UPp1pbjZNszob2FXFM05EPoGcQDLeDJL30HfxvWJSsszxMH9mZ?=
 =?us-ascii?Q?UtVgxfgWbcJN8L3heBYTTE/2V9ii/xNILhOS5O0BBBNN1d8YWb26/31sVdq6?=
 =?us-ascii?Q?RPwZMN6PWLCsZSFttpF/lFvhF2rA/E3cevN04UUAttigW4i4gYFcPb0YoQUr?=
 =?us-ascii?Q?IT/krVnYia1TuKCCHlnDdvETIs1b15FsSwG2h14K+E0m+/uB5FlEhYSZHrvR?=
 =?us-ascii?Q?sOeqInCNKbWqCaSms0XsIVKdMDW10H6EnLYBlv1VrilJfYafkS26L/OK3k2K?=
 =?us-ascii?Q?MeQVTjdkaxJnVDXN+FxcSxMZOD8PrYAo7z/tCRd4gae2k6S3ns2hfAaK+DoC?=
 =?us-ascii?Q?GFZP49XablClOL9JTVaFUHZvV1x7RQGH6J0B4IWEAn7OU+C8lqExlklNAm+y?=
 =?us-ascii?Q?Y8K0Pqlm0MJSjIikIvl3wTaYQgpqI8ZB7P8Owzj/rDLUznCU2bODr2WNA828?=
 =?us-ascii?Q?WjDK6Yau0GrDUPWmfh83OdB0HQ3ICLv4JVeGgcJIrwkmQpq5jSZeAIsUmwrw?=
 =?us-ascii?Q?bb1U9Wmke3rACp4QtMRxA3mJBzOu2QtyG95VM2LRr6lqdjygKSuHoZoSLAGJ?=
 =?us-ascii?Q?ziJbBA/GqxYqG7/DIywzExRlY66fIkL4PQP1xQvn/bqLhbPk0M6xyJHlQiAK?=
 =?us-ascii?Q?ZTrjk4yiXIHWRLhEwou/qVhdGtwhowCFFhgl/lgo+R9ICjdUHsdrXNptvmmM?=
 =?us-ascii?Q?ae6nN4WPGYDibwiux9gatL8K/aMOPNgYpf9bFbd7SvZ5MMGASzdYAYMaxxDI?=
 =?us-ascii?Q?DLBhe7Hs4XV8Gi57XVNd+7qw/I6w56ODCKCFofqdUDIMLKsPn49tE3VGgU4t?=
 =?us-ascii?Q?Q+qhPI7ORkmQMwi9gAW4OpEU+zcIOwEqMP0Ns4PRECglHhIz0rqKiCoAtLrE?=
 =?us-ascii?Q?RsiObozTd24zmLr5XMvzK1J19kZN7IbKtowtF0kPWs05zJOPrqsrHYU9XUFl?=
 =?us-ascii?Q?7VzOF3ZZZsS3AFhqw8oog+eHVqsb11Q/ndoY4Rt5IFWSSGeuyYsCdKp24ShX?=
 =?us-ascii?Q?0jC2+i8EEAh/JYyD1G7F4xft78lPChAk3ev2+KIlOEqNJ1CiQbZEwR5VNWBN?=
 =?us-ascii?Q?IQnnd07QlfdnTSqcVAdu8/EWdQ2QJJ76VsL3oTGuN6C451rza1ppNrWEtH11?=
 =?us-ascii?Q?mM9jhswW4XRH8rYqfyxnkd0SwPNLyq7g4qnG6QZ8JOJ75pGr902fHxZ3kI91?=
 =?us-ascii?Q?l1GyO1Ni2mHZNIqB86pxqk4zY3vtQ38tanUWVQsGCzschA8gGDuvSOoDZmPx?=
 =?us-ascii?Q?2gc7LTzutOnGtPhgTzzc08TPH+s/e8VbdFdZPFPs2lVGGS6GTOgLm2b1lUUo?=
 =?us-ascii?Q?dvD9PKwvvzgtzWS69yGj5q2gMayAxF+32tguR6Cz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a22c0f3-b7f5-499c-5df4-08dc8bbe853a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 15:35:57.4409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l6HULqNoJy59SOKkUc3AO+gthtVAmuixMjEUeTa5NtpJtYcax7SY2HLPFuH59H2mRKU8ZscVYtGtRe2UoZ9cog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7428
X-OriginatorOrg: intel.com

> > My intent is to get this send to Mauro (media-next) in time
> > for the 6.11 merge window.
>
> Hans,
>
> It seems that you already acked to this one, right?
>
> If so, please add my acked-by, if this will end being merged
> via some other tree.
>
> Tony,
>
> I don't object having this merged via your tree with Hans
> ack.
>
> We may also have it merged on media via Hans tree. He usually
> send me one or two pull requests per Kernel cycle with lots
> of atomisp patches on it.

The only tree I currently have that feeds to linux-next is the RAS tree
I share with Boris. This doesn't belong there.

I'm asking various subsystem maintainers to take these through
the appropriate trees and having quite good success. This patch
is one of seven looking for a home.

So please take it through the media tree.

Thanks

-Tony

