Return-Path: <linux-media+bounces-54713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGeXNgmVqmkkUAEAu9opvQ
	(envelope-from <linux-media+bounces-54713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:49:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E621D56F
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF9DB30237AC
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 08:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF2D330B28;
	Fri,  6 Mar 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+xz6L/V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C598B3B2A0;
	Fri,  6 Mar 2026 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786876; cv=fail; b=DyUmkUtuuHJKy11SXxkrmeundc9f2U/QePSCH3LX4z7SF6vvPthps7UE9oGSI5IDRRCh6UFy1aEl9GyJVoTQ58xYiHqNYqlwf48civtpuBcAKZJ6VCaYK0UTFD++Kzsvmc1RXEkMnToVtipaDlT0SVCKhCAyyehEKX3ocTZKhrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786876; c=relaxed/simple;
	bh=s/M4ARrBGSg+0UNXt5OQL/ye+f20aYmANjDmyZM/Msc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HZuVreDCNrr23JsJ3xub8mLR1aQFYw0VxBRIFF0YOxgkptir4eD5RD3jz5kEiK3kQ47nIac9VhHLTnnvPgcFfUqJUaE0cfpJa6E1Sqnd6UhMY7YNCevGs+6jInkrK+EKLOvyhGj/OnPvimV+RfhVfZ5q9qmGR+bDPJ/Bus9DINY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+xz6L/V; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772786874; x=1804322874;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s/M4ARrBGSg+0UNXt5OQL/ye+f20aYmANjDmyZM/Msc=;
  b=b+xz6L/VtLhUtQli7Plmzk0FUXbzN5CD9P1NAEFOTgQuI7NF1hxKWTLd
   K5Cy81ZTg6OwahhLu3BV8zJdHDt3fwvQpq4ejRxFLlkXK+3hLmvrCikhP
   OtO1cSR68IpybcQ7TLQAiKixAclGt/L+v2+s/L5x2/YIDPt4NflcmpMWl
   TwbxuyJ+vAVypjT1JpNvolSpx58GJD0JrTeVc5a5ZFjRvkeurAjs+tbQn
   C9m0FAbXS9nUUrSyg9ky+YeNsfe1tiSea08UeAsUWS9XrMn9saSJS4Bpn
   N78WyVTmyclTsZ05CsORsIfEcOIUf69514XXyYLwEFeE/NzALXuIfGoV0
   w==;
X-CSE-ConnectionGUID: PzaR0EQmSvmxYTXrOysC7A==
X-CSE-MsgGUID: 8kBq2GbnR9W2tPxJ6jX9vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73592039"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73592039"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:47:54 -0800
X-CSE-ConnectionGUID: t1tDE+FDTXmVsWG1tHcEpw==
X-CSE-MsgGUID: lz6eH//dRRGCCRvc5LFG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="221768990"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:47:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 00:47:53 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 00:47:53 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 00:47:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWIIhT/CIf9J8568otm8aCjs3um361g8EvIdtPyZUEgR234V0n0wZuwfHiQT/MJIoKN8UfflhJh89WHMucX3serHY0uNdN8+yluMnVH5BUVMZ6696mEv6177dbX8Fx2uSImON8jjlsnV1WJQ8/6q4kXLm50U6B4pqKD1aTydGLy1/w3dfz4wIV2dBRP6buzLjCs+DULcG9OwG6TQloWzbNbzeJe5tu+m8jBHqD10rRcQEMKozUd8y6L8N+Enxnf5ldc2g8yrFUba37ufx/KwhvGPVwEVn+1bgnt1TrnqRJE8f5DbWuFU4xnTH17348lVPNQmcYq+yhCXfwmO6LoueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtzP8x6bWYbDDajHpfUIaYpe1vMSqMP/AFnNN7tPtmM=;
 b=dgVq2eLo9Q7GgxENn/Aoo45o6vjxYYxlPjoDg9VwB3IdRl6lxrwsxv4qDOrhJKoybPbJF+inix9kWF2aFbW2bekkH9unNLYxD4s6O4a/K1Ho22IyF2EcGbT86Yc82VpdY1vuf/PkkYDRi5IegiKsfJZng2iw94elTt56v/kQeSQbjCopTw7orFLyGez7I9WchC8UvWO2FLpGw+M5Y0+8A94evGQHUwd1qWbC0VNtlVQYMijrnO/bN0se4VUEGOK9SUixsS9d2J+Tu41rOChPr5/cKn8Fq695VAfq8p12BO1YOgzifLGyQc2VCx722XnJT18hhobQ9VvE0Mt9cXztAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by DS7PR11MB8805.namprd11.prod.outlook.com (2603:10b6:8:254::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 08:47:45 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9678.016; Fri, 6 Mar 2026
 08:47:45 +0000
From: "T, Arun" <arun.t@intel.com>
To: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
CC: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel
 nvl
Thread-Topic: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel
 nvl
Thread-Index: AQHcp+7BHqgdzPW8iUCRjKvSDyBfA7WZwgkAgARgxgCAAxTp4A==
Date: Fri, 6 Mar 2026 08:47:45 +0000
Message-ID: <SA3PR11MB802248098C161FB7EFB7CB529D7AA@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260227133542.970820-1-arun.t@intel.com>
 <20260227133542.970820-2-arun.t@intel.com>
 <aaRPMtWnX7nWShmv@valkosipuli.retiisi.eu>
 <0f2502fb-20cd-4638-8428-9a9eb5318147@oss.qualcomm.com>
In-Reply-To: <0f2502fb-20cd-4638-8428-9a9eb5318147@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|DS7PR11MB8805:EE_
x-ms-office365-filtering-correlation-id: b376edb4-2ef1-4a23-42c0-08de7b5d0950
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: sfVIDIYbxGsai9qXURFdlFSUjXdsbVWH6EWsp2sSI9/Lk5h74kfeHWdLJYwSjwA5kuYWqVji2rteCsoIdkwBmNIiX2Ryg3rICJPVXBpsHDlDeU86gOBdNcWoPR4KdMD0ipy+4mhgxZCAI9W/5UY7Rjv4pjlBZ6zg7L1eydU+T6gtSuFNjC0IevwjxUuc+KHWbbWviCStRw4tvMfIxsk0PkrzkbqJ07CsjHTSdpZeZqWkDkcTUml12Csi0rvg8wGIxYUStVjhna9boe+dvoBYAFhaWcczOhvsXzOEFsi87dRvqeGoSusWR0pPMCWiVJZ8KBnHSCe4BhLTdv3thq7W+XsPGTaxzugNTqP9jb7KCUjVNSvnEsdM4V+C/7GcCZ/Plyl/xmk+gyhEZ8vAamF+/OX/SZoYwbxpMfGUKqzLhD8O8O0Wu/MK/RMJR8vDqPbVUWNvBgpWsUqI3gYUedrdWB0MNCtFEkCy0Bv6q3qxKDA2dE6ugpeD4fvIQlTyrrRGYrnhX2uR96kPQ7w/Oj4DIrtp2VCwpWCb534Z5NQLNSu6oJVpuX6kIRQm+4XusP/6Z+6Po39FLP6gzKjk6tgS0tRKYorYZQmCdC4xWYchchFo+rm6rIXWpPfhx5yDKfmgxvpB1u1V4+r7JFSmhwC21zDyyocOe2aHZjY2HSHQy23lIHZLpDedZOhKl/avBN0sF+bY2IYgwWxz/roV6ayLl7BMcfsUoQzX5zHwIMZoz2fHVdOkmb+57dS5d+t/T71cO/nrvnAB8w4G5EWrEXdtUHoTHCWVM5wwoy8qT61acr4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FpPW/EMWXe1zgAdHrjrWNLNuCobC7rvna7oPY6jIk7XLdYNOZocAZO71wJe3?=
 =?us-ascii?Q?lvo/ZWqS0V0TWQ2k9IlecUB7kxZ+JYuGvww7hcPCSB04nrroqfBcbqjBKrSk?=
 =?us-ascii?Q?Prbt6o6N+VMq/qx9QbaRV6ALqJR9S6H0hk6GNTn17vxuBks33ENu80yirCwH?=
 =?us-ascii?Q?fObW6eAiQ4S2f9lYuH08SCjp9rkqzggWuqZd/DfuscAhwDTQ6n/uAFZ/hB7Q?=
 =?us-ascii?Q?djDBl0/+GC/Tqgsyk2c7nMZptF1rLeq0KvAjALZvi52E/6RsEvsS6XZIrK6U?=
 =?us-ascii?Q?cCQFbeg/EKmUbCFkM5QgxI8umn5Lj2IZfB4W9vgE/+NVG1cD4jLMgTD0a4RU?=
 =?us-ascii?Q?Axd1hX6SD9GkoMjw6sYRbb5PgZOQ/WWIXSacBE4m8ta60o9zojI0mLEUndsA?=
 =?us-ascii?Q?nXnnhzlL66oGdMMGsM8U5NTNApTYb6wUcLJ3Eo3ndyBK/GenU4ycWux+HgJ+?=
 =?us-ascii?Q?hSszPglYzkQ4E3mxljwTT0CrZ4+dPzIzBAwNwSOnakiZmCkL8F5tWtefDBS9?=
 =?us-ascii?Q?dQrP5iSQJKzLf4S/4oLtzFiFdY1U8bHVTiQK3dMg3J0J4bjQzpek0aanj6Ri?=
 =?us-ascii?Q?WSF//+CZDw8rxavaw0rCNALqYRshC3NEc3FKLvCEB5AxY5ezWZyVmyGvfIsJ?=
 =?us-ascii?Q?N8cTbVz+67avbCiLZ4jtXhlaRKgkNDyaNEzIn5OAThTXq94xt2HRkc2Er+vX?=
 =?us-ascii?Q?CCuVI8ulRseMtADk2axGmniTzcKjTzN52sbtqUMoTi2UzlrOokF9aUBv18sd?=
 =?us-ascii?Q?6w7+e7UbHBwCrKH79nWTQNE/Mf7A4lUbe/uyHalDRQ8sQZV1drOIRDcc1aaD?=
 =?us-ascii?Q?lCL+Z1nDqT4Sjm5exKOzEKqOB0GW95/7U1uff76NSoLfRbutXtt+5LoinX/6?=
 =?us-ascii?Q?EekZ0uJGk4Mq/AwKw/MA6gA2AbRLjfFnmZbQN3Bpy5W5U+HjWvgs3QXs6Q/5?=
 =?us-ascii?Q?uQ2pqI4IOCE2nT8H15uAHnqbjftFqfnbNFKIzoUXu1SSM1CeMLwoUo3UcZ6B?=
 =?us-ascii?Q?hdMH6XNr8poC1P/RSl5FNL9vwtRSPdOXVzF1d63dZ1OMyY9BtXkZwwGn6ORl?=
 =?us-ascii?Q?1+uzTB2yqVR9OQy8y55yH/Wfc95PElFgZYOReWrfydpne5QPhqpBUrrFfa9s?=
 =?us-ascii?Q?03cuYPuHHmO1um/yK1v6tkMAdzFOjiUbM2+RuCKafwHKFFyfAzzMSX1YEwr7?=
 =?us-ascii?Q?dCO1+RQVI6aOAd0R2EOq7Q93SMTdOCLP7Zw2+/u+ctj6xUdAv2Bu1cZa1pn3?=
 =?us-ascii?Q?D1rGlXbkKTgt5dQD7pY6DqBBOW8nlGbo3rsiKcjx0xUKq3Qkh5dfJoMzLkX+?=
 =?us-ascii?Q?SI7gdmlRS4w7ab/Xve2l/itN3Rso5vuFosh1PaeGbcErWo0LaRAdPatN1uER?=
 =?us-ascii?Q?89oI+fRv8MORLER9eDNGyHXtPg0AGYTwtjAoyma1tzt4vw2Rcusmqd5PK+5m?=
 =?us-ascii?Q?5FyDerDtqTIYvcRdajASH+4x6VgyygfN1QdK1MV7/fevd2vLKvDZyAXObbW+?=
 =?us-ascii?Q?BBRWaZViJYgV1fwm8uWQY0RiYFSwxKJv3zD3AjJjhrQ96EIMqwxEY64ohZSv?=
 =?us-ascii?Q?wFflhhG6cQsQKp1f0RP8jk+5XME4Di+90Ql/4lNbIskVyZVfZ2DeTM64ht0s?=
 =?us-ascii?Q?KhsxJhDtgFroY5cM2c831GO3WGHPA1PVhzbiXxtr/SULVcpHtpCNMz8MNEV8?=
 =?us-ascii?Q?u6kYqo5b9yo/hDI6OP8hlUXMZza4BzFLfSQJ7+CtaReq0k49?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AnUXFCRb37FpggOG295R3aq7riVbhQTeDGvXn4itjuw0NBSIb7uMc4c6NcwbZrkCPSJerHfofw3XlzHmHKViloscAH9WAvzG+9qVfJorBQRzHp/+cH9YXE06d4E6wltrtr9yzHJYgNMWa3KUWw20Twji+fTDGyQSO/cSX6MaL35kVBeq0FLZCqeaLgz+5Asn3IjCjafKw3XPVvpH4OsBSpoxGyFx00+qs4wIpWSO23zKPusukW8pRt2M59gYT2ORIa6YJ3XpfGEMa2acuiUI/sH3ncNrPLtL00Hza+WVykWhMgXQaQTcqvRUhy5SNXMW5DMhq5twT5QFhsSrLzJYAg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b376edb4-2ef1-4a23-42c0-08de7b5d0950
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 08:47:45.0950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uxmIzK1cFELYjCeuRImR2ABiO0OcmNLBO1sSTQlbjEUJ2vx7IvDzPWHlHRP9g2hA0nSZUsY9SMPCExyUSHmj2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8805
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: 9A4E621D56F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54713-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Hans,=20

We are using CRD G3 card + ov13b10 (UF and WF), which is supported by Discr=
ete and TPS68470 power solutions.
WF camera is powered by Discrete and UF camera is powered by TPS68470 PMIC.
Discrete solution provides regulator name as "avdd".
TPS68470 provides multiple regulators like "ana". Vdd, dovdd, etc.

As per your comment We have tried below experiments and shared output below=
:

Experiment 1:=20
-Add avdd name as a regulator name.

static struct regulator_consumer_supply int3472_ana_consumer_supplies[] =3D=
 {
        REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:00"),
};

+++ b/drivers/media/i2c/ov13b10.c
@@ -704,7 +704,6 @@ static const char * const ov13b10_supply_names[] =3D {
        "dovdd",        /* Digital I/O power */
        "avdd",         /* Analog power */
        "dvdd",         /* Digital core power */
 };

Error logs:
[    0.732156] tps68470-regulator tps68470-regulator: Failed to set supply =
avdd
[    0.739297] tps68470-regulator tps68470-regulator: error -EBUSY: registe=
ring ANA regulator
[    0.747663] tps68470-regulator tps68470-regulator: probe with driver tps=
68470-regulator failed with error -16
[    3.621085] intel_ipu7_isys.isys intel_ipu7.isys.40: bind ov13b10 1-0010=
 nlanes is 2 port is 1

Result:
Only WF camera sensor is working, which gets the avdd regulator from the di=
screte solution.
UF camera gets failed to bind due conflict regulator names.


Experiment 2:
Add ana as a regulator name:

static struct regulator_consumer_supply int3472_ana_consumer_supplies[] =3D=
 {
        REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"),
};


+++ b/drivers/media/i2c/ov13b10.c
@@ -703,8 +703,7 @@ static const struct ov13b10_mode supported_2_lanes_mode=
s[] =3D {
 static const char * const ov13b10_supply_names[] =3D {
        "dovdd",        /* Digital I/O power */
        "avdd",         /* Analog power */
        "ana",         /* Digital core power */
 };

Result:

[    3.060209] intel_ipu7_isys.isys intel_ipu7.isys.40: bind ov13b10 0-0010=
 nlanes is 2 port is 2
[    3.060421] intel_ipu7_isys.isys intel_ipu7.isys.40: bind ov13b10 1-0010=
 nlanes is 2 port is 1

both sensor regulators are enumerated properly.=20
VCM also working fine for UF and WF sensors.
I think we can go with the supply names below, please confirm, shall we go =
with this change.

static const char * const ov13b10_supply_names[] =3D {
        "dovdd",        /* Digital I/O power */
        "avdd",         /* Analog power */
        "ana",         /* Digital core power */
 };

Regards,
Arun T

-----Original Message-----
From: johannes.goede@oss.qualcomm.com <johannes.goede@oss.qualcomm.com>=20
Sent: 04 March 2026 02:59 PM
To: Sakari Ailus <sakari.ailus@iki.fi>; T, Arun <arun.t@intel.com>
Cc: mehdi.djait@linux.intel.com; linux-media@vger.kernel.org; linux-kernel@=
vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel=
 nvl

Hi,

On 1-Mar-26 15:37, Sakari Ailus wrote:
> Hi Arun,
>=20
> Thanks for the update. Please avoid using --in-reply-to argument for=20
> git send-email when sending a new version of the patchset on the next tim=
e.
>=20
> Could you cc me to my @linux.intel.com address on the next time?
>=20
> Also cc other maintainers, see what
>=20
> 	$ scripts/get_maintainer.pl drivers/platform/x86/intel/int3472/
>=20
> prints.
>=20
> On Fri, Feb 27, 2026 at 07:05:41PM +0530, Arun T wrote:
>> The Intel Nvl O13b10 sensor with the Intel IPU8 ISP.
>> The sensor is powered by a TPS68470 PMIC, and so we need some board=20
>> data to describe how to configure the GPIOs and regulators to run the=20
>> sensor.
>=20
> This can be rewrapped and fits to three lines; also see=20
> Documentation/process/submitting-patches.rst . Most editors can do=20
> that without too much manual work.
>=20
>>
>> Signed-off-by: Arun T <arun.t@intel.com>
>> ---
>>  .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>>  1 file changed, 150 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c=20
>> b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> index 71357a036292..71dc0940a94b 100644
>> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux=
2_consumer_supplies[] =3D {
>>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),  };
>> =20
>> +/* Settings for Intel NVL platform */
>> +
>> +static struct regulator_consumer_supply int3472_core_consumer_supplies[=
] =3D {
>> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:00"), };
>> +
>> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[]=
 =3D {
>> +	REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"), };
>> +
>> +static struct regulator_consumer_supply int3472_vcm_consumer_supplies[]=
 =3D {
>> +	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:00"), };
>> +
>> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[=
] =3D {
>> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:00"),
>> +	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:00"),
>> +	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:00"), };
>> +
>> +static struct regulator_consumer_supply int3472_aux1_consumer_supplies[=
] =3D {
>> +	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:00"), };
>> +
>> +static struct regulator_consumer_supply int3472_aux2_consumer_supplies[=
] =3D {
>> +	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:00"), };
>=20
> That's a lot of regulators. The sensor driver appears to use only=20
> three, even after the second patch.

Also the names still do not match up with the sensor driver, the sensor dri=
ver (after patch 2/2) has:

	"dovdd",        /* Digital I/O power */
	"avdd",         /* Analog power */
	"dvdd",         /* Digital core power */

Where as above there is no "avdd" only "vdda" and "ana" which are both cand=
idates to actually be "avdd" I guess you want to change the "ana" one but p=
lease double check.

Note all other regulator_consumer_supply maps except for the 3 actually use=
d by the sensor-driver are *wrong* and should be dropped.

Even if there is a VCM, then the second part of the mapping to "i2c-OVTI13B=
1:00" is wrong. The "i2c-OVTI13B1:00" consumer will only consume "dovdd", "=
avdd" and "dvdd" supplies so for that consumer there should only be those 3=
 maps.

Regards,

Hans




>=20
> Is there a VCM there, for instance?
>=20
>> +
>>  static const struct regulator_init_data dell_7212_tps68470_core_reg_ini=
t_data =3D {
>>  	.constraints =3D {
>>  		.min_uV =3D 1200000,
>> @@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_t=
ps68470_aux2_reg_init_data =3D
>>  	.consumer_supplies =3D int3479_aux2_consumer_supplies,  };
>> =20
>> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_ini=
t_data =3D {
>> +	.constraints =3D {
>> +		.min_uV =3D 1200000,
>> +		.max_uV =3D 1200000,
>> +		.apply_uV =3D true,
>> +		.always_on =3D true,
>=20
> Setting always_on to true shouldn't be necessary here.
>=20
>> +	},
>> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_core_consumer_supplies),
>> +	.consumer_supplies =3D int3472_core_consumer_supplies, };
>> +
>> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init=
_data =3D {
>> +	.constraints =3D {
>> +		.min_uV =3D 2815200,
>> +		.max_uV =3D 2815200,
>> +		.apply_uV =3D true,
>> +		.always_on =3D true,
>> +	},
>> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_ana_consumer_supplies),
>> +	.consumer_supplies =3D int3472_ana_consumer_supplies, }; static const=
=20
>> +struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data =3D {
>> +	.constraints =3D {
>> +		.min_uV =3D 2815200,
>> +		.max_uV =3D 2815200,
>> +		.apply_uV =3D true,
>> +		.always_on =3D true,
>> +	},
>> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_vcm_consumer_supplies),
>> +	.consumer_supplies =3D int3472_vcm_consumer_supplies, };
>> +
>> +/* Ensure the always-on VIO regulator has the same voltage as VSIO=20
>> +*/ static const struct regulator_init_data intel_nvl_tps68470_vio_reg_i=
nit_data =3D {
>> +	.constraints =3D {
>> +		.min_uV =3D 1800600,
>> +		.max_uV =3D 1800600,
>> +		.apply_uV =3D true,
>> +		.always_on =3D true,
>> +	},
>> +};
>> +
>> +static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_ini=
t_data =3D {
>> +	.constraints =3D {
>> +		.min_uV =3D 1800600,
>> +		.max_uV =3D 1800600,
>> +		.apply_uV =3D true,
>> +		.always_on =3D true,
>> +	},
>> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_vsio_consumer_supplies),
>> +	.consumer_supplies =3D int3472_vsio_consumer_supplies, };
>> +
>> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_ini=
t_data =3D {
>> +	.constraints =3D {
>> +		.min_uV =3D 2815200,
>> +		.max_uV =3D 2815200,
>> +		.apply_uV =3D 1,
>> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_aux1_consumer_supplies),
>> +	.consumer_supplies =3D int3472_aux1_consumer_supplies, };
>> +
>> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_ini=
t_data =3D {
>> +	.constraints =3D {
>> +		.min_uV =3D 1800600,
>> +		.max_uV =3D 1800600,
>> +		.apply_uV =3D 1,
>> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_aux2_consumer_supplies),
>> +	.consumer_supplies =3D int3472_aux2_consumer_supplies, };
>> +
>> +
>>  static const struct tps68470_regulator_platform_data dell_7212_tps68470=
_pdata =3D {
>>  	.reg_init_data =3D {
>>  		[TPS68470_CORE] =3D &dell_7212_tps68470_core_reg_init_data,
>> @@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_dat=
a dell_7212_tps68470_pdata =3D
>>  	},
>>  };
>> =20
>> +static const struct tps68470_regulator_platform_data intel_nvl_tps68470=
_pdata =3D {
>> +	.reg_init_data =3D {
>> +		[TPS68470_CORE] =3D &intel_nvl_tps68470_core_reg_init_data,
>> +		[TPS68470_ANA]  =3D &intel_nvl_tps68470_ana_reg_init_data,
>> +		[TPS68470_VCM]  =3D &intel_nvl_tps68470_vcm_reg_init_data,
>> +		[TPS68470_VIO] =3D &intel_nvl_tps68470_vio_reg_init_data,
>> +		[TPS68470_VSIO] =3D &intel_nvl_tps68470_vsio_reg_init_data,
>> +		[TPS68470_AUX1] =3D &intel_nvl_tps68470_aux1_reg_init_data,
>> +		[TPS68470_AUX2] =3D &intel_nvl_tps68470_aux2_reg_init_data,
>> +	},
>> +};
>> +
>>  static struct gpiod_lookup_table surface_go_int347a_gpios =3D {
>>  	.dev_id =3D "i2c-INT347A:00",
>>  	.table =3D {
>> @@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_=
gpios =3D {
>>  	}
>>  };
>> =20
>> +static struct gpiod_lookup_table intel_nvl_int347a_gpios =3D {
>> +	.dev_id =3D "i2c-OVTI13B1:01",
>> +	.table =3D {
>> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
>> +		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),
>> +		{ }
>> +	}
>> +};
>> +
>> +static struct gpiod_lookup_table intel_nvl_int347e_gpios =3D {
>> +	.dev_id =3D "i2c-OVTI13B1:01",
>> +	.table =3D {
>> +	GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
>> +		{ }
>> +	}
>> +};
>> +
>>  static const struct int3472_tps68470_board_data surface_go_tps68470_boa=
rd_data =3D {
>>  	.dev_name =3D "i2c-INT3472:05",
>>  	.tps68470_regulator_pdata =3D &surface_go_tps68470_pdata, @@ -287,6=20
>> +420,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps=
68470_board_data =3D
>>  	},
>>  };
>> =20
>> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_boar=
d_data =3D {
>> +	.dev_name =3D "i2c-INT3472:04",
>> +	.tps68470_regulator_pdata =3D &intel_nvl_tps68470_pdata,
>> +	.n_gpiod_lookups =3D 2,
>> +	.tps68470_gpio_lookup_tables =3D {
>> +		&intel_nvl_int347a_gpios,
>> +		&intel_nvl_int347e_gpios,
>> +	},
>> +};
>> +
>>  static const struct dmi_system_id int3472_tps68470_board_data_table[] =
=3D {
>>  	{
>>  		.matches =3D {
>> @@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_=
board_data_table[] =3D {
>>  		},
>>  		.driver_data =3D (void *)&dell_7212_tps68470_board_data,
>>  	},
>> +	{
>> +		.matches =3D {
>> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
>> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
>> +		},
>> +	       .driver_data =3D (void *)&intel_nvl_tps68470_board_data,
>> +	},
>>  	{ }
>>  };
>> =20
>=20


