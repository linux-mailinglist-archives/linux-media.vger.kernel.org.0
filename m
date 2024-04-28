Return-Path: <linux-media+bounces-10279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BA48B495B
	for <lists+linux-media@lfdr.de>; Sun, 28 Apr 2024 05:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08E2B1C20F19
	for <lists+linux-media@lfdr.de>; Sun, 28 Apr 2024 03:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497C628F1;
	Sun, 28 Apr 2024 03:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpSALCih"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA023BB
	for <linux-media@vger.kernel.org>; Sun, 28 Apr 2024 03:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714274560; cv=fail; b=it46jX0U0aIBaQdfDj0YiemriWoXRPupS64JHdwsvKzJh1ZvxzV1HiPrwI4SpjKpQaU+5hYTLAxOzBjQKNZEoMRV7WOwJTwabYjEz0f3meO7kkiaHduHGQIj41PPWeZXljlojP9ZK2LnXJPlhEA2GG8icPQ6I6UT90Z+xJuuNFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714274560; c=relaxed/simple;
	bh=/5+yjhxqPxqqBHJrMcLFKfq5CA9QI8wWPy7l6x81+3g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kXcuvLL3RcCuuUeXGMbwdKR8JjX3cG+817QoxomCHub0h83vYLN4Ev/D4wHzeGb4Bh1WzGRJm5yCeDb5g0GBOg5albBTGS/6a3BrShB9oHOgkVgXyfAvbrlvFVNNdPbf3zf39uJbdSSKCdVmeLTRZqCYNOuSm/tGhi/bAIGYvXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpSALCih; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714274559; x=1745810559;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/5+yjhxqPxqqBHJrMcLFKfq5CA9QI8wWPy7l6x81+3g=;
  b=UpSALCihnvN2iVr2ZvFi1bRisPCCeKBgUGW2GOAfFSK/E7WwKcbdCTc+
   doasGWZ6pfthwFCRoFUFPCe3Z/3/9yzR2BiTvX5xZG6oCcrEPzcH4BLaU
   As9R60P4tZUQCDXZxjRAnVa2QVttjzrEvYa1zi0AYddZk6RzY2OJYwzQM
   mQgiDLg7uPXPjRjAr6TEqHUxneXwxNrCUJKzMqDMGz6PpPT9cR6reSflG
   FimkMrM6AoAmY5qMGlpt+mbEkoj2V4K/eTv59VWBD0EZBoRaaO3S/sEig
   JsdEKTzc/ok6qfmQkVnpHufckDbFm1jdb+EWkgbdCjtIhG0PIp5KtRKch
   Q==;
X-CSE-ConnectionGUID: 77wH0lkGQWicbZ0eTvBRRQ==
X-CSE-MsgGUID: 4HpONF1pQDClLRWAMThq6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10090256"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="10090256"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 20:22:38 -0700
X-CSE-ConnectionGUID: mYDfp2nsRcC8VCAdICWS5w==
X-CSE-MsgGUID: FVVocQBgRlOknZVTElK1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25758562"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Apr 2024 20:22:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Apr 2024 20:22:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Apr 2024 20:22:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 27 Apr 2024 20:22:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 27 Apr 2024 20:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1cMDYhSaew5TSeWf/5KGzRYtYTxlfh5L4QCfGylGnSt/w1onF8iTpIdElTMLaY9s/bgEE6QjRu+igD/OZ3oW6SSbu3Y6CTKo834QgDlmk2oRlw+gJ85DjhFux9/DMwWyyBeQ+tdcQuSN6ZYJu+58n2GVUbJr2boI4rB9LpK6LWGjh0o8ChgF3G7HTkodj9aRiFDpfYUyI1EHytm4oE/0yzNdUiG1g5OZFLfFmkbCbZc3nncilhcRsBAwHIR4cWXVL/ocSDUVHZBRYvZF+GrAmsx9GA0x6WQDb0YYZQisKzcQR08ltQISZ7X+rZDWAZqAsrVg8f9rpBZ+9x3J80ejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT/KPCMV0QYWnRF/Gmf/KRSW0WZ/23OA2KMcZ3TyOs0=;
 b=LH0QGrczl4PvsPFtvDJsrWueSsKgXoR3+hmhKp/zWbEq24kIeaGIU6Hscnj+XTnLCSnAqEdvXzV3/nAbbWpU45nJeujE5jHyFVTSHayorXicMnbZsB+anC+xE2u8w5npQiK0ObOFjNeymT2pc8+RpZ1uwBBT1hBo7xRjvpWOKrRELPDTeK8j69gfLG8LmamgNxamfh4/HsW7m/BQJEFrFb7aEyhGnOGQdLeIqfYy1dLMsoM7+IElZamR9LJPxhGCUHCm9/c85kw1ON9gASnEaiX1oOo5BWEO8EM7bByYoP9WUshGrB6l2gvKzcUlOZOg3xXZsTadPrQiY6Zxm/fhdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 by SA3PR11MB7627.namprd11.prod.outlook.com (2603:10b6:806:320::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Sun, 28 Apr
 2024 03:22:35 +0000
Received: from MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::8814:40fd:3adb:8de2]) by MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::8814:40fd:3adb:8de2%6]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 03:22:34 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 3/3] media: ivsc: csi: Fix link frequency control
 behaviour
Thread-Topic: [PATCH v2 3/3] media: ivsc: csi: Fix link frequency control
 behaviour
Thread-Index: AQHal+nZ98ZcR/ht0U+FX2NUrI6JtrF9Bjkg
Date: Sun, 28 Apr 2024 03:22:34 +0000
Message-ID: <MW5PR11MB5787CA1021720C2070CEEA2E8D142@MW5PR11MB5787.namprd11.prod.outlook.com>
References: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
 <20240426145538.654212-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20240426145538.654212-4-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5787:EE_|SA3PR11MB7627:EE_
x-ms-office365-filtering-correlation-id: d08d289c-e92b-4773-a8e8-08dc67327292
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?WrjEjH27HQXEa0FJuTq6F1A92x3th8+mAb1szXrWX+N7F4bL4RFkC4xgP8/O?=
 =?us-ascii?Q?87IUchj8dZuTUdESwE0iHyhxlVpJ4VV3gD4dLIEnEfOm3XsiNa9STvM8s3WI?=
 =?us-ascii?Q?nhe4msf/C6I1NEP7KxFZnmNkHRNqblCJ1O47Ygood6kGlDodZR6xpUyJZxIf?=
 =?us-ascii?Q?KNIXAyrEMbz2ljiDFVVQnYOqsRXpch9rUDWYzu3dWkthb2e2sl0yYTIzRVbC?=
 =?us-ascii?Q?ImbekxOZC6P15hHeQI3tebd7uHDQbnAtLcneecwXiZm5wiRZcUDSUYCYqqOr?=
 =?us-ascii?Q?nNAtLkfiyrAL15SBMwi7RFaxzo8zCV5SwyqbzHY8ib17lfoaPyr0UZna/j9K?=
 =?us-ascii?Q?w5jiTqk+Zra3u2uLOPMzu7BIkExH/MN7AQyn0tbd/QmWmfZWo06OBERqFSjw?=
 =?us-ascii?Q?Z91otDAHL6IJyj49NfUmxVSyth992Av0lRvt/u9vjtXU5KojFNlWuXert6AA?=
 =?us-ascii?Q?G8g03RDiqZYuQlt9oKVrKbWygVuzr6/ejlNGZ+YfmwhaGowWsEhF/ttVMWcx?=
 =?us-ascii?Q?db1ZNYrhmaBEnS40CJWFpAixfGQPWaK+nAE60sk029nQ503/JPk7MdsIKEii?=
 =?us-ascii?Q?NX+M8sKv5ATdIB6ihGiL+YhOS6pOdfUuwSc4T7HGbfxo9UZGze5yKRJQfog2?=
 =?us-ascii?Q?DlQoWRd/AK2nbeCobIT5/gxWvdPn4Oc2BJbFJ8+PjNm3qmZ35wnbcHxfW0Mo?=
 =?us-ascii?Q?sdCvEIuMW8ww1jG/yMjUI5x1WeKptrU3Epd704NZwmTlH0FcAyP9kiXDTRnH?=
 =?us-ascii?Q?3BZutv5gT3zAZeWEfgbE7L4w67uFS2QjnwTOVOtHfVwi3My7VL7MbhbfC47Y?=
 =?us-ascii?Q?NamCCgB9oXXrEttxI2Rl7AqQtAzPL6V1JuikSX5K+vsy9egVDuhWhWdqvFfq?=
 =?us-ascii?Q?ISyma6cpalNI/Zh88jL6sBbhSr7u+c3RZqjO1UnVZLPGILNgbciBxV9I1HEC?=
 =?us-ascii?Q?/keImsAOfMBD6RJsnvktwwxX0ThhsAb79n0aDm672wvpQ4XFiPIo3pJcMoLZ?=
 =?us-ascii?Q?jonHXk+0zW8JdOtwfulDK/w3N733kjnNjxky9SiFWhmq/a49mVH6a5IwboiR?=
 =?us-ascii?Q?mmGASBQUsjDgWKlkhFgKpFo/o0MSm18/aGw9pwSdVSIC/7ccI//sw71bF+KJ?=
 =?us-ascii?Q?AGh/08s2ZKwVh+zxLU6CMUwHg0Eb8MFG7kWjyb2IOMD7tHABPVgIFK98YDbt?=
 =?us-ascii?Q?T72mZtady7CHlAJBwWzbDMYFh1zcxgQX5dFKzbODBu1SurRcIYAmg9nM92/8?=
 =?us-ascii?Q?DXMNoc1d9Dmh770PG6rK9yT9ekamuPTw0mF1Od2NgJqN2NunKWF8YWUOPvgB?=
 =?us-ascii?Q?HQJmjbbw+lNgukBbcT8IAhAI+36+3xnjsHTHTXynItcd5A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c7r7r/54Z7DB9ab2ec2so8wo0EZpcPUdWtpmqI62rAtTo6LjZvVHV+n8Ubaa?=
 =?us-ascii?Q?hZS2JDKmUdynp6pcF9t8yFf0FTeoy9LmwZD52l3XpnRiUhju0ZxO5J4u4Ldi?=
 =?us-ascii?Q?cbKaDMXWKjOPJEGkVGQOTolY9C74Aroeh+1AIOowFUF1l+gk9M/8EpDnzz/g?=
 =?us-ascii?Q?TK/reJiwgJ6tbIlewx9HsQ4NOJK+uUQz244QxjLlnwHkikeX0/2sAPbdW3Ks?=
 =?us-ascii?Q?ZKv36/ZBv0B1AKQhUlr3vGfZf0ZSfXskfjnzWEh9Zx67IOeLFmCUkpkUcDDK?=
 =?us-ascii?Q?guT1Xm337JagK6AcEx9ZhkkzcoKWeg2eIc7tPLJ3QqBEEf6e2ObWEmU3STCv?=
 =?us-ascii?Q?YPEdP0Pt9JjeKtT0tTahmr3rthHNrzU4A6ghVsXuhTWsWWGwNuOlB2v0iaxh?=
 =?us-ascii?Q?oYcEa2gcvjpHU2Ja/l7Up/sW/AeMTkZxQI92OjZ42GqSZiJrIiCshfXBc6Bi?=
 =?us-ascii?Q?GBT9d4I4AYMPoXUnUaZd24ozR3Rp0sU9hM68F3zlFAhnkio7uuNCHNTH8eam?=
 =?us-ascii?Q?n8DgV7Q6ip4KTg9JSDwbrmvhwyhOGm0/i5eV4EalwncPBUh6vx2prDlo68GH?=
 =?us-ascii?Q?9zAcIpHTazvuI/fGlAwpJ/2Iyds2ZwO3guaajrEZcIkbQzmdPfLDDE0SlILP?=
 =?us-ascii?Q?3K79v8qqV6MfOMyC0+fId5NUbftV+IPBym06DbMjv/oGWzpxWAVvtuOPCnWp?=
 =?us-ascii?Q?qfrw5wwM/m8IQkA6gXOja0+iaEpszgYItsjgZBiwoh3ZjhqbDMdnMjbwDesf?=
 =?us-ascii?Q?LVbaULfHHkaPilEjnwuPxpvl01/gYLl5b38O8+Ye8yMeUkdCGR0jjJQIJ+7Q?=
 =?us-ascii?Q?fWYxAMXqY0UUKDOInKqk0o6i1YuXk3iIKpJ2/v34edgnh2yzDgn/Oe7SraAg?=
 =?us-ascii?Q?Uhf2X66MfSjT75L5w52wTO98BAE/HnVa7YsZEsxtnB6avLnwYbbihlu2tzPI?=
 =?us-ascii?Q?/SpGRSFH5Jk/xPH5oR/SomCuzjPj5K4xiOVXEA9fmoWXIsg9tEyp2DYyR4KA?=
 =?us-ascii?Q?LDd3EHWVupAkjJYL0kj9URtYgYmqE+XpyZaTZ9hFrFFiFUnBDrt/DfjbvAOi?=
 =?us-ascii?Q?ej/6asZQYI3FlANFXtjhK7g9kJ/YqWlKLn1Z9/mZsa0H+JqEkDm0eUyA5Bwd?=
 =?us-ascii?Q?V1faxmjV/Uukql1haj8+mFlil8n3zxsOqTCLafm9Prf3XebMeDnJthPcd3+N?=
 =?us-ascii?Q?+1rl12bBpA5PUuLIoG0naXHTFkcj51JuC3OplvQKF50rEun1/of9yTxW4U8w?=
 =?us-ascii?Q?38QiZdg00kmPJip+zovqqUiVm9A8Qwg8Rng4EPCfO9QngKohLaH/u9IyGqlu?=
 =?us-ascii?Q?hi3UosG1nBZ0tleFgpZsSRMNIwNowoGxh/mNFBnbXQbfxW8rbKMx5IpXVw96?=
 =?us-ascii?Q?4jpmWjbS7ILULjTsHdK086GvLS5Eq82ktUft1/4G5NhVqUJdT4kVb2kcnYRI?=
 =?us-ascii?Q?85IC/xeUQr0mkz3R1Cu0u7xivMnz5OcOPEo6VI039WkmWcAQxTJXzHMfRwOx?=
 =?us-ascii?Q?ysS2IGt1Jcpt/XfZpA0M6+EGsYkQni2t78uTz9eAgnSaXUU0TcXRT1nY6r7f?=
 =?us-ascii?Q?pP5fsAzqRN5i6CWJIaPZdpQ/+3kbLkmFT24jsT/a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08d289c-e92b-4773-a8e8-08dc67327292
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2024 03:22:34.7425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HXVphAPOHKi3wv65azknn2idoLcBUFwPN113SAWM++OWtSe5lU2JFK0s9PwpdoSM0irkAy88q8VClEgkIupZBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7627
X-OriginatorOrg: intel.com

> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> The link frequency control was an integer menu control the value of which
> was hard-coded in the MEI CSI driver itself. Instead obtain the control v=
alue
> from the upstream sub-device and use the CUR_LINK_FREQ INTEGER64
> control type for the purpose.
>=20
> Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by:  Wentong Wu <wentong.wu@intel.com>

> ---
>  drivers/media/pci/intel/ivsc/mei_csi.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c
> b/drivers/media/pci/intel/ivsc/mei_csi.c
> index 55e0c60c420c..4a35932f1cd3 100644
> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> @@ -15,6 +15,7 @@
>  #include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/kernel.h>
> +#include <linux/limits.h>
>  #include <linux/math64.h>
>  #include <linux/mei_cl_bus.h>
>  #include <linux/module.h>
> @@ -32,8 +33,6 @@
>=20
>  #define MEI_CSI_ENTITY_NAME "Intel IVSC CSI"
>=20
> -#define MEI_CSI_LINK_FREQ_400MHZ 400000000ULL
> -
>  /* the 5s used here is based on experiment */  #define CSI_CMD_TIMEOUT
> (5 * HZ)
>  /* to setup CSI-2 link an extra delay needed and determined experimental=
ly
> */ @@ -145,10 +144,6 @@ static const struct v4l2_mbus_framefmt
> mei_csi_format_mbus_default =3D {
>  	.field =3D V4L2_FIELD_NONE,
>  };
>=20
> -static s64 link_freq_menu_items[] =3D {
> -	MEI_CSI_LINK_FREQ_400MHZ
> -};
> -
>  static inline struct mei_csi *notifier_to_csi(struct v4l2_async_notifier=
 *n)  {
>  	return container_of(n, struct mei_csi, notifier); @@ -470,7 +465,7
> @@ static int mei_csi_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  	struct mei_csi *csi =3D ctrl_to_csi(ctrl);
>  	s64 freq;
>=20
> -	if (ctrl->id =3D=3D V4L2_CID_LINK_FREQ) {
> +	if (ctrl->id =3D=3D V4L2_CID_CUR_LINK_FREQ) {
>  		if (!csi->remote)
>  			return -EINVAL;
>=20
> @@ -481,8 +476,7 @@ static int mei_csi_g_volatile_ctrl(struct v4l2_ctrl *=
ctrl)
>  			return -EINVAL;
>  		}
>=20
> -		link_freq_menu_items[0] =3D freq;
> -		ctrl->val =3D 0;
> +		ctrl->p_new.p_s64[0] =3D csi->link_freq =3D freq;
>=20
>  		return 0;
>  	}
> @@ -553,7 +547,6 @@ static const struct v4l2_async_notifier_operations
> mei_csi_notify_ops =3D {
>=20
>  static int mei_csi_init_controls(struct mei_csi *csi)  {
> -	u32 max;
>  	int ret;
>=20
>  	ret =3D v4l2_ctrl_handler_init(&csi->ctrl_handler, 2); @@ -562,13
> +555,10 @@ static int mei_csi_init_controls(struct mei_csi *csi)
>=20
>  	csi->ctrl_handler.lock =3D &csi->lock;
>=20
> -	max =3D ARRAY_SIZE(link_freq_menu_items) - 1;
> -	csi->freq_ctrl =3D v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
> -						&mei_csi_ctrl_ops,
> -						V4L2_CID_LINK_FREQ,
> -						max,
> -						0,
> -						link_freq_menu_items);
> +	csi->freq_ctrl =3D v4l2_ctrl_new_std(&csi->ctrl_handler,
> +					   &mei_csi_ctrl_ops,
> +					   V4L2_CID_CUR_LINK_FREQ, 1,
> S64_MAX,
> +					   1, 1);
>  	if (csi->freq_ctrl)
>  		csi->freq_ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY |
>  					 V4L2_CTRL_FLAG_VOLATILE;
> --
> 2.39.2


