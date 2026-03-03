Return-Path: <linux-media+bounces-54254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BtME7eIpmkZRAAAu9opvQ
	(envelope-from <linux-media+bounces-54254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 08:07:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF141E9FCC
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 08:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C02ED3045660
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 07:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014D638643B;
	Tue,  3 Mar 2026 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcAK7UdR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105A632C94A
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521646; cv=fail; b=mlT1dSlvFLvoT9P4AZ9xM70N6j+8dZxRC7LRsMUJJLuy5hPhpdZ3nOfJPELAJHWoQFDbPKXDP95HpZtIKOHyt5K7MHX+DTNrGbYS5IaKWIkuD5lHXVSkG9TQ3G+99woxmxJCVblbGwsOl9GL9gPIbcHOkU8sc66GFajD0eTHWgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521646; c=relaxed/simple;
	bh=6sHNW2XZgAG5yKxgywPE2oa+SOneY1Jjz0RGLnsm6GA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eI7Wg2GQKhZ4JiR8m+gjE/d1+Yo74Rjd5/Q70kA82PUk5qGPn6WdBBGpNgChM58Hc3jbWTGoROa4ZkJtE+uEJPxHMD32PMIN/0QitybqqSnhdvFKPrf59Li/hHuq19L1mcWekOFKG2Dk57W46tdJhzNz+ZJLG91DknVzmwQdKwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcAK7UdR; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772521644; x=1804057644;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6sHNW2XZgAG5yKxgywPE2oa+SOneY1Jjz0RGLnsm6GA=;
  b=fcAK7UdRqMvGi8eoh8P+DkodSOWYi6ytwyEH2XFxNDcYr+eIApfd3h0K
   bzyrT3NpnRd0rEhtgmyXjcA79ls26xdr8jl+rj1y2CXhwnVVukQL+AGI5
   xcbhBE59uKrEmt81RfocC1EWxxn6LG0z+ERcRgxO40EI2mKjlZwn62BMw
   XhmS6z5nbD8j4jixlJPIqGob5qnk0PhqlQTJI5cYRfx071x0FEPyOcbug
   jz5BEogfgWHrlkp3XhQTZcDkHlg6hIp/dDMfsK/TwGXHZPrjHxy55mGYD
   T/UT5slpaVKPUELkFNK7dUhnF8aR0uQqIbbnWru5pyTx9m3MP1E2Y5AY6
   g==;
X-CSE-ConnectionGUID: 6hFEFnvESvmxTPtJlxM8mQ==
X-CSE-MsgGUID: icGDYP8iTYSHsY6ibweGjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="99022571"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="99022571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 23:07:23 -0800
X-CSE-ConnectionGUID: wvv8aaxdSsG1hzCYGRyQQA==
X-CSE-MsgGUID: H5zPQTTaTR+IqzHzLXx8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217134243"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 23:07:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 23:07:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 23:07:22 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 23:07:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn6FjfjrqQYfInD+GF/uORED8eTNWq3UVWey2CKUjrsfEKdfaDpE979fk5IzkvTWife3+KeJiEZF6bEnmhJqQVmWXM24W3B3cX8gazNcUxZuLf2cmhDNxr7jHw0ajRI6xo/VmmerFz5qr2+BposUUZfvq2Kyl92FRf8hs8hPIRrtfJBCOIufQPdEQ/bxJoMQquVA4mh1FT2F9UsbzSBpIewO60rQ0hoBnfX+Z9YCW+YwoakGCbQw5f2zSwGtc2OBzzy0xc1PHZEFxKrcYpjYkJ4t6zmIcnZxS+TkRXgy3oZUtkGa0F7RxjuL8S4ko/7P+SRbnb6+rMIKutCfYTwKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q5YHi2JmIadEhj2dFIvbdMz5BUSKxqJ5lwwGyuOtJc=;
 b=H8neXg81JrDFOYthOMKrYgBaH5dK9mwX+SOfos7PcWfrlPSP993Pi9wvdWMwiBgt2DCiX+9FLlZ8SY5ptAbzCBDU3lEcR1FPUaP0ptqTnEXi54kt08jJXa5OZyBEcKQSd7TqR13BJBJeot8s5NXYHgtPvNRJv5bdv0cKPXFYlWOg6qqp1Ujs7aZ/T9G14ksOsB6nQcTsVncveyQ0ZCRG0YPnyzBaV/foeVWbo4gymmjlWf85MySPyKs5xP4d7QAg4tvVByjXAl/kZaKVJTXfXuGrUPotN7Nq/zu+0DKvajR9CGEi+ySuLbfJ7ZPGXVAKA+LFmmRCC2N1dtcsrr7Fgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by SN7PR11MB7589.namprd11.prod.outlook.com (2603:10b6:806:34a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 07:07:19 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::b997:e226:4979:c035]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::b997:e226:4979:c035%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 07:07:18 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Christian Koenig
	<christian.koenig@amd.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "Tian, Kevin"
	<kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Brost, Matthew"
	<matthew.brost@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Thomas Hellstrom
	<thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH RFC 00/26] Add DMA-buf mapping types and convert
 vfio/iommufd to use them
Thread-Topic: [PATCH RFC 00/26] Add DMA-buf mapping types and convert
 vfio/iommufd to use them
Thread-Index: AQHcoGtCf9ua8bJZokKhC0c/o24ZWrWaG/eAgAGkw+A=
Date: Tue, 3 Mar 2026 07:07:18 +0000
Message-ID: <CH3PR11MB7177124A1305900DC0F16D70F87FA@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <20260301190543.GA768004@nvidia.com>
In-Reply-To: <20260301190543.GA768004@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|SN7PR11MB7589:EE_
x-ms-office365-filtering-correlation-id: 77c48c53-494c-4885-c0a7-08de78f38202
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|921020;
x-microsoft-antispam-message-info: wY0eYu8ScALAXOKwyO2Q/8aHw4ZpAYCuQlg4vsfb06UVqrjhCMoe1FhKe1bCrE5+zsMLSeEVH3Nan99wrK2KHcqXdjirSgfCr+aDgI83FZYPXoVg3iBePM6WOqq1xx4twbGCvRAsukOSHu97z5p3qBI7EFjX4EvJS+naW96TZ6JZoGqFkLBLOTv7HBudycU0vEanqGC6Gh1Io+4QfrAA6YM1NzD1eO69cLYJ+O2vNXBOk7vzm6ODU7c6gB74ew7NNE1MDVGDxmd+/y3Ek5FfYeO58ykyKdsZAXH8zXzW7+hG9xwS/6iL25B3Kfb6WwAbXQ0dGtvFFfyYQihT8dCdCzZDbYWh7ngSvAQNKoDfFkEz38EwJLOb8rE4ewaArn4z7tpQMdMkJ15P13yDbntIDBwhW+miycdM6WonTwkKghTVdt+hWTuxXm/3O5kb/86dNH0i5wko7bJAXVRm9MaZ6aCqNLZL5f1YhFKqq5OW6VF0s5TVhqLaXH9ogHiPG2gzRIDtICNpGzk4zbkgBxDieTnvwU1TpOoAWUIvfhXTfh84kXJJw6pUB1VT2zv+5KAWKsBTMd0X6bO0EtSqQAXDzacpR5/F6lUd2fX6uIH5pp26aQwk3cupH/ja644IdZ2OoYy3Lt4JpBVk6Y7Dc6qwa4OFbzsRy74Ua5bd3+s/5QqGaTe9eYEO/VbjnN8ce+dmAd/f/2JvcVLoIw7DRdFfJA8K76t5wWB54t186OzkRWURbct+8py31bZO+u7loMXeVZrO1VeEHMS3lSvY4Ej6F+gGnaCvmJsR/E10UztcO9WOf3HffDWMRYVeEWbe7Axj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7177.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f42m2G+N68Q/n1SELBEbtrDARTb7n36ZbuwQEQCNT5yNp92AHYR7yH2U4q99?=
 =?us-ascii?Q?WdyLhrPNjtu2JhtJyvaKkGxbosOO19VxCQLBfSdTn2VjF4m87zNY/suzV3nq?=
 =?us-ascii?Q?hMWPvtqq7UrSE0mpQyRkW5NZPHn9o/v2v+j+msPygRiwDtW1r3aJQkCasKm3?=
 =?us-ascii?Q?OO5q0CsLPyKfM1yv9BjPde02P9/m3AE6AZJoL0V7qXCWGMejzdrIgHbbFkXh?=
 =?us-ascii?Q?5+4A5gx5XruiD94LLShC5r2Q548mbFODnnXuk/oj+kBk7nBOAUZtlSKnsrYx?=
 =?us-ascii?Q?llhVFrNygJKxEAQ3FPNDVxbngpaoofg4TbnlZKrcO1H4uwYjOu/EwFkj+oJS?=
 =?us-ascii?Q?ycO/mYy8wK2WRGu1TBKMgra1reVjHZO/H75Hx2eljEtQfylzpUUQnTB07CYi?=
 =?us-ascii?Q?pIFMaVcr63lzInyN5/CN80gy8XkgmLZ/+mz6E1c77OBGIuDlYzoexEsu2ObZ?=
 =?us-ascii?Q?yVcwv/uh9mSMqezqzeHe2ANGGSfFi7eLHAnqcNwK07slnS5qxArV5PcQgxQk?=
 =?us-ascii?Q?40lHaa/FiLiZbHkRLXpjIM4WMSQ3HENxVvRJzWn9A2ZkffEMnYxTZT7ytkQm?=
 =?us-ascii?Q?BKx5OCmjeFQof+y7PE2sFCntC23AEixbh95H6L+5zJ3+M1CG5wBu0qspElGC?=
 =?us-ascii?Q?s1yCXEpmJiIckM/jv0gZv+A7HS510pXbTSqQoYyVXH1WGAXeK5nuVkJN7IWE?=
 =?us-ascii?Q?KQjnQjqveF5Unh99kmCc+XQSP1GU88wmb01UFAG6gWx5AqJnMpAR5kKfD3HV?=
 =?us-ascii?Q?CVCYuPJrpYr/NlS+qYATXZDUV4jrokb6sUVcVDuZlBp89bn8aZApcr/IzZpk?=
 =?us-ascii?Q?JDSccVbSEjI1tcIxknmmQ21/EN23H4H9ehCSRaEjAoRQbQZ3pIXhgCWTq95n?=
 =?us-ascii?Q?H/48nZT6DoM9b2eK+36i8O4KQDA0PfCzl3gLIXmh3saN4UsH6qAmtSkhSYwx?=
 =?us-ascii?Q?TtkMFU3G++6vznNobm7W/qaFJcmkXghT7QcjWYOFNUwER/9+1LxZ37rCOs9y?=
 =?us-ascii?Q?6PTGggrEdffmYMJPH8f0hLtzzcNeNWg2i0SFPSAaxL5u1L+cr8uQ/2S+m+0y?=
 =?us-ascii?Q?zz72/EuakxjvHBbfGpEbZUbHF7ChiqtAeSdFVku2t0bQ+nYMMvQ+sCEf674F?=
 =?us-ascii?Q?cpOoIDCemfw0d8DViTII5CuU3JN4aHZjKCsX9uiLb311OAyu6AJTKZpgM4KO?=
 =?us-ascii?Q?s31ctWyFgF57m1LmC4CFippGcHJQldMNva5zI2OiKEkIR8yGx/uDSuQCEeM+?=
 =?us-ascii?Q?yfRBwoDUgqqEo5FdXH72rdYEpIXYD8g4R5HFeSvtPETthvdZ+q4FEXkTobjo?=
 =?us-ascii?Q?GDiBuERWvCKShcULfP9vWJtVMPP9BZGO/vvT+z6XZg12+eO1eV7XvmailLR1?=
 =?us-ascii?Q?ge+4Vv7S6oTyfFGTv90vO1HCSbzltPoFdlQRPnHpIjy2mH/EBgHqwVHCq5dz?=
 =?us-ascii?Q?e2c+jGi0Ywpb/piH/jNaEcDBGZEZkvwXMkYsI5rUo7Be/W40mb5ksibzzS9P?=
 =?us-ascii?Q?axsnLX+nvuasUPOCjJ18298/0Z+zwaLB6u8HZaMH2d1G+mSrNt8zX+FsNd84?=
 =?us-ascii?Q?3wp4GBsaf2xNeP7ToqJXvj84mNE40usWKTO5ZFwHEoGPZblfs+E6+CHSiFiN?=
 =?us-ascii?Q?nX3qaKrRISDGg8yCefTwxVMmQxciOyWz9ejqpIyGhasePQvcJNmqLrPsPVYM?=
 =?us-ascii?Q?FbJFfunjW99K/5YXz57iHGPIS6hQzK0DuwA4PoUQG/ftX97UiiijATyzGGKG?=
 =?us-ascii?Q?OiYxbDgaFg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c48c53-494c-4885-c0a7-08de78f38202
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 07:07:18.6491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9V5HzoeXOZ2ohIP5SOtYAd9DQwmg0gHFPLbgxfzkZR1tD/6S9b/iEfrZC65BW13ZNdJJuK9e2Wgtfr5U/RjZYzZ/VGflvHXIJ01saMMs6+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7589
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: 9DF141E9FCC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54254-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.kasireddy@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Jason,

> Subject: Re: [PATCH RFC 00/26] Add DMA-buf mapping types and
> convert vfio/iommufd to use them
>=20
> On Tue, Feb 17, 2026 at 08:11:31PM -0400, Jason Gunthorpe wrote:
> > Jason Gunthorpe (26):
> >   dma-buf: Introduce DMA-buf mapping types
> >   dma-buf: Add the SGT DMA mapping type
> >   dma-buf: Add dma_buf_mapping_attach()
> >   dma-buf: Route SGT related actions through attach->map_type
> >   dma-buf: Allow single exporter drivers to avoid the match_mapping
> >     function
>=20
> I've rebased my github branch:
>=20
>   https://github.com/jgunthorpe/linux/commits/dmabuf_map_type
>=20
> On to drm-misc-next comit 41dae5ac5e15 ("drm/nouveau: Test for
> imported
> buffers with drm_gem_is_imported()") and reworked some of the
> pending
> bits on the VFIO side to accommodate Leon's series.
>=20
> Christian/Thomas/Vivek, how are you feeling about this approach? I'd
> like to focus on the above patches, should I post a non-RFC series?
The approach looks good to me. One particular idea that you have added,
that is new is finish_match(), which I think is very useful. Hopefully, thi=
s series
is on Christian and Thomas' TODO list and they can do an in-depth review
soon.

Thanks,
Vivek
>=20
> Thanks,
> Jason

