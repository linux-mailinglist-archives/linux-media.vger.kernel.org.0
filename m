Return-Path: <linux-media+bounces-57824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IzWJjxyzGn1SwYAu9opvQ
	(envelope-from <linux-media+bounces-57824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 03:17:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C99C3736BC
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 03:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FEAA307309F
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 01:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF6A28BA95;
	Wed,  1 Apr 2026 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYlzQ12b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEEE17A586;
	Wed,  1 Apr 2026 01:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775006141; cv=fail; b=CzBetOdfdI3cVSrly+4JALfMO49dDSlt6qdtwwGEmwEl8d4j3qliXr9qAFwQxUREBBHDjJTUcUltrCHNpEi9Uq4aAwT9VrajTKUyYpPtByVtfn2PYxQnAE7SLcnCLaWF59mqa/Dc4wWBtLDUDYk4xqdMItbT5nPhI6dfpo4y7PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775006141; c=relaxed/simple;
	bh=XGVPL6QExAQ5JKPqzN+AsOs9sg1Vzi8msCc2x+WZcpc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bm+A38PleZW9mOUOXqQ4ZDb9r3kS7jsxnB1TfZnoEAYGFgdtp3q5q+XtD0dlm4WKmJPfW13L25+1meD5bJhgBEF3UFinflfaiK3Q9rsozO+Hd9KEAEUNZ83nMBQl0US7Ekf3eHnY0zP78mm70NmWlz9zjcKSW/EGql8hFEj6HNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYlzQ12b; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775006140; x=1806542140;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XGVPL6QExAQ5JKPqzN+AsOs9sg1Vzi8msCc2x+WZcpc=;
  b=WYlzQ12byTPOsvKjU3t+GsXkmuVLLNiihGg5A7LEy7Jm4gLV+RI9WPA/
   +0+vLQOPMU33jh8fwUMrIPUmKNWzxMgVlvWLcIaxhWqbtukcFUfVxhujL
   g+YaZuc0VUgEZqWTNzUglwx0Qf5O1yTy62OOtBZsIdo3VIfA1FCmCyDYr
   xPnJVnBj5H2drH6yIeiHPAl9Rw4AHD+77a3iU+1CmkRrXcetkGBs8bIA5
   wUahoEL35hu0P/A1nwOYiENx95YPGXK+nJizCZ/QteCVHE6kloLT2vfiK
   S+bs2JHDInfr6Adr6Ze3SEJ99izr5eEmjZB4TmWIFOQ2MyaAVGmjCdOFE
   w==;
X-CSE-ConnectionGUID: NniD/ZyrQX+dztA8q/bqtA==
X-CSE-MsgGUID: vezGy6wfStSv7J6l8q7eOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101487922"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="101487922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:15:39 -0700
X-CSE-ConnectionGUID: 9J1xutW5Q9Sz/82Rs2TPog==
X-CSE-MsgGUID: Omj3ruPKQhKo8jVp0DOYxA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:15:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 18:15:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 18:15:38 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 18:15:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNWpNFhL5Ye6abCIp0H0Bs1tiRR/DLch7KlSF6X9PT8V9wrDTJky74twbClZl8sH9ff/1YcZsK9u9EQDrdgNv7IKiLLurmohWm2iIssyP2PvRKLRVa6w8LzngZxPE6YQYau88QRgkAqToYuOqeO3SBvhm0lF82/wQN7MtMwnfRfY1ZYQ9U/WAtAxM9P0GbUfVZFCFdG0hXfCbFVvwhAAsoXoZnLITZYt4NGXf8x7r1RaGWN89S9WiP6owCdQS/FhAOq6GJDoz7s0KY2SvPGwflRgWiBD4dR4TETM52yodBcUHF2plzK/F2maf4+KN022tyixyeXHTmcJF5EKBKu7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jkcueib8rEI8f+C+zEzpVAW+IGzDsguK00C9SV6uVMg=;
 b=EBEMthlyw6Z1wf1DrPLEgoU9iuuvlEwPrnbZk/NiZiE0lMKi9Xkh5eni8dqdfRVjVS+ibDtdBAug6yTOJmS22KnT5aLFfQT01839LaGckqO8oBDcv+82gqBaABQ67kyNklgriKeM4yAgItT0Gtb7QAVoSYByuzfBInEJxv5d/k/6sUWAZc51AE87kgPbfPc7ty+JfSG/n62uMIrrXAh/WZO1IwUKH0DZd9E8fnlXKGW0WK5InEFgocAMg2vFg8eUzrNf3kHYHc9ioDghlGn3ERFOV7Rt6cLffGJAABvjb0NfPP4ORrjeZibfNz9KFD3lFwonsGOW1mnJAXUvhUHEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH3PPF37A184CA6.namprd11.prod.outlook.com (2603:10b6:518:1::d15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 1 Apr
 2026 01:15:32 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 01:15:32 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "kraxel@redhat.com"
	<kraxel@redhat.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2] dma-buf/udmabuf: skip redundant cpu sync to fix
 cacheline EEXIST warning
Thread-Topic: [PATCH v2] dma-buf/udmabuf: skip redundant cpu sync to fix
 cacheline EEXIST warning
Thread-Index: AQHcwNYF9KroOjxdFkWXYGnE97XBWbXJBjIQ
Date: Wed, 1 Apr 2026 01:15:32 +0000
Message-ID: <IA0PR11MB718531C51736C57114D6DC2CF850A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20260331061657.79983-1-mikhail.v.gavrilov@gmail.com>
In-Reply-To: <20260331061657.79983-1-mikhail.v.gavrilov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH3PPF37A184CA6:EE_
x-ms-office365-filtering-correlation-id: 5a149c93-1021-415c-3386-08de8f8c2b8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: JlKImN6V9XE9iBtE0bhbjz6q3af5Mfh3CE+plBgimiE6x3Xm6iQa0k10JTz60prS5FGEnNy0foY+rTsoeg+2TBG5i6PenaFCkg3+VOOb+tsAzppls/Iq0jYjjqsL3W8/hvg0401ITpv9mItD4hg9UQJtEJGSFFBT5pq/n3yxUiAPegC01NcN0Xy47oycT0nJJZrXMqXQ6i/zNcGd7/Wx/LHlw31NkVJ0CABFNnqpTdK3MpMMCKh25arWv2l5+GzymCuD3RTrfpmB3iqUf/mjFCTd9ugwF0cGOTPExhjKADmQphOBXL4mMMrk+GhpkR4kxJyXzeZ4c5CkYRVX5hQ+lEWW0mY38NKWrrV8vbiKVrjv+N0sKQjsQWD/ofOOpKaI/RBCV5CtN28EhBsoKffjxPPwknaIh9otgBdlKloc1P2gCwq27XfYyCIjc4XiNKjJipJ8gzKdT/wZPTmHnWopWLB5f5eNZVLWIjX92NwfYxYhka0iAEfPgD3AuTWWbhjwDFKcv4FVdWOtrvCYtn07OX9JwjpnZJuphZIt1KbFhavTA1ydZrinEW8W9icIkkEQ+5Gns+UBMFHs8vJru3IodUz1o/x7xztVx8yNvjPb4Odn4GFPgdykGhQLmX8nUcGnfhE1b79tYD93Kaee2z6PlhqsHKUzSq3iKAh72Nj0ninnvRiZnMpZNuR177GxqMy92z6z8IUJZ13OGQTAVA79WvUPvQD4dRGRgbZtZh66FDDf7qGGcQScepNeGvdawmAsv8+DFmYhsQHA8JzVle3SAJmTrZcFzgYYzSG/ba+asjc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tvX9n0YPBAuPuV15UsOuBYXlA8uG3tUVO1l8v9BBkx3qwHeoULEIGaY9rwj/?=
 =?us-ascii?Q?JtJuAadhBvC8ygZScwrHmeUyTdRwpKOpFo9UAKC7M31b5WbU+XPeiL7JPZ2E?=
 =?us-ascii?Q?BrzlS6NBDGXy4Ms//Ao6ZPYPYOvBa21ZAy+D70eOUfrbnhbX/9oCz8gGRZvo?=
 =?us-ascii?Q?mHdgvHy65T9rnJYuPoMXkk291Bvg3j/X23BcU7WjcszYy9GzFwebUxnfWU0y?=
 =?us-ascii?Q?RbKWYSWPYzEJBkMqXRx2cUC8ZRhV2SZiYvPtmSV0yWONtpJknrKgfrso/Nrj?=
 =?us-ascii?Q?ZEvM686aY0a1yamJ+7wofX41Fx+8GIcxfCcW/gp217RqzFhVUDRHzngwY3+Y?=
 =?us-ascii?Q?9AsnPweg6FGB+/kGKSalI1sJ1AhOUtVrMMFOz2N64JS8cFV8LwLx3Rx6mMAg?=
 =?us-ascii?Q?wtlFhyZsROR0QCZCAwEvnnchW2MFuEDh7KJHHPI54O7ON1+hjhzd2CT2Gtu/?=
 =?us-ascii?Q?/nCjDZtPEqgqIZcx+fOiP3W2okjzqRy/KpiYdNBtn6qGJAK3JXfJDSa9Az2i?=
 =?us-ascii?Q?v7YtSS821IZbc+6B8mPuvd4LkHUJ78/wkf6z7fqtG7MPeDXmMxULlWtBbqMV?=
 =?us-ascii?Q?KRXb/5gZKGoAsd/GdcJJRTUDfE+w4rPVUPtQ0lIGaBDtmfle7b5vP2XPIa3j?=
 =?us-ascii?Q?tFsnTCVsO0uA40XPF20FyYc3uaJseexOMLtAdbUtb1ZuZpYH1Tu7YBOeycn2?=
 =?us-ascii?Q?h4GtNVL3W37/zc2vXiq7jvWyrrrSrfI7wnV0y2chsG2KYrb+TwyEDqmq+S9K?=
 =?us-ascii?Q?jiImiW7uWBcXPZGMt19pKM6ud7XywnI5j8wGMgoyIl6Wf/CE5hEjdMEvhSTd?=
 =?us-ascii?Q?PDcKWu9O43D5q4HnshyV3fKoiebmd2Bkpa/9htf1GW4yQUqQzE8NYADMR1hr?=
 =?us-ascii?Q?wgkF78j43rSxS67eMu8cJG114jrW1aeDj6mdgbXweDUH988dh+To/mYN0x1j?=
 =?us-ascii?Q?XkVxPRNbXsnUXMAzN05NEFEFQy7lmJiR/2MKglnT/B2oCFW92h+JQQZGaLmt?=
 =?us-ascii?Q?R5WHIWC90Efou+dQ/weM71o5UrE2T+GMsIMWqC9x0aEXCpzDXWHhtw3oChTN?=
 =?us-ascii?Q?CZLMsAxtp/RfDiw6lPuqi3+Mi2/JTuigeZVsQbS8oISQhG2DVGAzud+Jin04?=
 =?us-ascii?Q?sQfhesWClTCkLnQciQS+4AU61E38hMwZGRWR45TmDKu/2fL25v/l99RttnC9?=
 =?us-ascii?Q?Ig055aTRlidvzOXyzyc30ynGU9rm+bfU0LTPBXTrkzgaiO2yL9XIpOn8/cmP?=
 =?us-ascii?Q?u8ElseCW6Y15s/qffj7E/F6FN/Z9j3avefKK8HSbEmx+9eiunhrFyVyxYq1b?=
 =?us-ascii?Q?+o6iJr1vaL7JdKLRmvRlaQ9D4HGxKoRzDHxtP0LchCcilGsggDiWp6fyhq++?=
 =?us-ascii?Q?5useBFmek9ZD6SUpdYaVOvR4iwGt5exkihIFvLRT5QifqYKVl3fbhwqYTnQA?=
 =?us-ascii?Q?AQaUC2alc8WzCVn9N/qLfXb2qn+o6Jl3ybXXXHLa5m4tFmMo5UvKHUrrjg1E?=
 =?us-ascii?Q?KKugj08Y5AiuQNUKe3fJm8FADBUy0EL0G88Gl7dzuy+HGbfdK8axFOJwts8+?=
 =?us-ascii?Q?tTMsal5BUmuZi7VLNK5HQakPXcibrjrmPZwrwVnzASK8qRus8tMGUhW4Fh1s?=
 =?us-ascii?Q?ms5sDlRjQjVT1dcYGsGqiac9JEhJhANiiKZPLQpGnUDGDlTLgIeyfrsIv2QV?=
 =?us-ascii?Q?LymBySYoxXJWps9g/CCTpeYKy/aOgSDrwpExiFt9rGW2yE7MJ0P5KelBniks?=
 =?us-ascii?Q?DQQUlbeZig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FH4fahOzJw98R5758chkhmbHNbYWa5EagvePy6pBnjQSlnyTgTM9BxQWTQLmgupYpJvvfmLzVWqrsThCVpojqKUSFOwrdIS6dwBFvsRLQ2iIiWMytKXvtzGuR9qpyHZiNAMp0jejErpvsGV2zVRG5na+hVnvl5Kd2Pl6ZLXxX7cgaxmH5X7M8vhAGZ2BCZKAczoMziLToUbkM3wsLpfS8vX+8X4CWfliS2UwZnvFox2B4YmlQjlRLKHrUhlRMEQNHmqkZ7o+b1aoKIrUzvh/opwETyBuoguGre9hbCRlZwvfJWWTaSwuVhGBqSieRgoaMVkjsKqztzG5oGy3ANtiYw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a149c93-1021-415c-3386-08de8f8c2b8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 01:15:32.2016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lksl2jHjByqjoSrJ0jMU0Swb3cqqB18JqkKfwD6KNVhGn7U2nLL0r4xnZrXUoQPrDq7V8eIb0j3jmxMUhxIBl7feUoTykHGiKu6n8vEfQg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF37A184CA6
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57824-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,IA0PR11MB7185.namprd11.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.kasireddy@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1C99C3736BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Subject: [PATCH v2] dma-buf/udmabuf: skip redundant cpu sync to fix
> cacheline EEXIST warning
>=20
> When CONFIG_DMA_API_DEBUG_SG is enabled, importing a udmabuf
> into a DRM
> driver (e.g. amdgpu for video playback in GNOME Videos / Showtime)
> triggers a spurious warning:
>=20
>   DMA-API: amdgpu 0000:03:00.0: cacheline tracking EEXIST, \
>       overlapping mappings aren't supported
>   WARNING: kernel/dma/debug.c:619 at add_dma_entry+0x473/0x5f0
>=20
> The call chain is:
>=20
>   amdgpu_cs_ioctl
>    -> amdgpu_ttm_backend_bind
>     -> dma_buf_map_attachment
>      -> [udmabuf] map_udmabuf -> get_sg_table
>       -> dma_map_sgtable(dev, sg, direction, 0)  // attrs=3D0
>        -> debug_dma_map_sg -> add_dma_entry -> EEXIST
>=20
> This happens because udmabuf builds a per-page scatter-gather list via
> sg_set_folio().  When begin_cpu_udmabuf() has already created an sg
> table mapped for the misc device, and an importer such as amdgpu
> maps
> the same pages for its own device via map_udmabuf(), the DMA debug
> infrastructure sees two active mappings whose physical addresses share
> cacheline boundaries and warns about the overlap.
>=20
> The DMA_ATTR_SKIP_CPU_SYNC flag suppresses this check in
> add_dma_entry() because it signals that no CPU cache maintenance is
> performed at map/unmap time, making the cacheline overlap harmless.
>=20
> All other major dma-buf exporters already pass this flag:
>   - drm_gem_map_dma_buf() passes DMA_ATTR_SKIP_CPU_SYNC
>   - amdgpu_dma_buf_map() passes DMA_ATTR_SKIP_CPU_SYNC
>=20
> The CPU sync at map/unmap time is also redundant for udmabuf:
> begin_cpu_udmabuf() and end_cpu_udmabuf() already perform explicit
> cache synchronization via dma_sync_sgtable_for_cpu/device() when
> CPU
> access is requested through the dma-buf interface.
>=20
> Pass DMA_ATTR_SKIP_CPU_SYNC to dma_map_sgtable() and
> dma_unmap_sgtable() in udmabuf to suppress the spurious warning
> and
> skip the redundant sync.
>=20
> Fixes: 284562e1f348 ("udmabuf: implement
> begin_cpu_access/end_cpu_access hooks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> ---
>=20
> v1 -> v2:
>   - Rebased on drm-tip to resolve conflict with folio conversion
>     patches. No code change, same two-line fix.
>=20
> v1: https://lore.kernel.org/all/20260317053653.28888-1-
> mikhail.v.gavrilov@gmail.com/
>=20
>  drivers/dma-buf/udmabuf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 94b26ea706a3..bced421c0d65 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -145,7 +145,7 @@ static struct sg_table *get_sg_table(struct device
> *dev, struct dma_buf *buf,
>  	if (ret < 0)
>  		goto err_alloc;
>=20
> -	ret =3D dma_map_sgtable(dev, sg, direction, 0);
> +	ret =3D dma_map_sgtable(dev, sg, direction,
> DMA_ATTR_SKIP_CPU_SYNC);
>  	if (ret < 0)
>  		goto err_map;
>  	return sg;
> @@ -160,7 +160,7 @@ static struct sg_table *get_sg_table(struct device
> *dev, struct dma_buf *buf,
>  static void put_sg_table(struct device *dev, struct sg_table *sg,
>  			 enum dma_data_direction direction)
>  {
> -	dma_unmap_sgtable(dev, sg, direction, 0);
> +	dma_unmap_sgtable(dev, sg, direction,
> DMA_ATTR_SKIP_CPU_SYNC);
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Will push this one to drm-misc-next soon.

Thanks,
Vivek
>  	sg_free_table(sg);
>  	kfree(sg);
>  }
> --
> 2.53.0


