Return-Path: <linux-media+bounces-64654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4pH5C4TGK2opEwQAu9opvQ
	(envelope-from <linux-media+bounces-64654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:42:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0C7677E19
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:42:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=WLCePuva;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64654-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64654-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C263302438E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 08:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BADD37C912;
	Fri, 12 Jun 2026 08:42:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C1526ED45;
	Fri, 12 Jun 2026 08:42:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253757; cv=fail; b=cGMXtr2xdWmMeeanxWf4Pl5idXtJDZKjER8DVOeXk8QtNBYv+cyXujv9/kG4insSQToraEd0pFeIQ8ZztL2H/O5v6gtilwaquonSEpHzCH8NO1lWP7IknhxuUQZHbqWDk6HTnbe0Yjy94Gt7+xTJl5XkztqZ0A8tTGuDCkwlMf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253757; c=relaxed/simple;
	bh=F4zAuCELzQJWpYWoWNaJjkybFRAJfi745bCzKoaa3zc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r1QkHQqqf8Co3Ga+cc9R6a2XrSFuEXSfMLcxiMyMaa4Z+QXa71Gy1rPCcsYl6IDggBAtU+2rMEVINJlsBRFcdq53WARDHwR5+D1Gbu4HjtODxUtKQdDijBpNaUWABNAc7r6ZOxbQ05cSjpJ2kEHMyFBCklXCdV0HaSpiRGIp3NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLCePuva; arc=fail smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781253754; x=1812789754;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F4zAuCELzQJWpYWoWNaJjkybFRAJfi745bCzKoaa3zc=;
  b=WLCePuva/BI0oo1Bt13NmH7BKhOPlSR9dRmbiaA5J7YTXBnBRqWSvsRQ
   z9UFg2UEqTNbXMnMqhzBhEv08An78euWtyLfP/YOegGKIh0xQ0YfgUij0
   JYLCFb//ruPMyIfnTNl3FVLRTS3WkMpyQHvhQH1eTGUVj6TvZhuAlGThY
   OhW5hRg3kmWLPJAaGxNEgUqKNQcVPSfIpePulpM2WeqVlRb7AZFVsTPNq
   PMrNLwL6wNONY1EEo6uJqIP3Pu6A2vGa2mynQPifhwXKDMuvRfkZu+9q9
   0amabxTeM0GrvMcshnqNyOD9QND1UEBvlhGuKmfRifTgAzH+Gm+vqUCL8
   Q==;
X-CSE-ConnectionGUID: H3sz6PEuRPO2lOM7bitymA==
X-CSE-MsgGUID: QtW3dQfGTFO5gro2wK81qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69627942"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="69627942"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:42:33 -0700
X-CSE-ConnectionGUID: U5+H3HO6QkiRqquCFfvd9Q==
X-CSE-MsgGUID: hNaadtnLQaqNM3gaJGK4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="251713762"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:42:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:42:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 01:42:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:42:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IL+/fLXXccUSJT/Rq/6k9oJ6Ct26n/DPEDMA3xafWTZx2ErHM9Dx2NgtW7eJnVjBZKn7OwO0OrJ6eWncE3wmBZVwuKqsK3r7zIpwgsKTkt8TndXCSvYhqFQ3fKJ2Fb9dzsYuxMIiPaBWlYHXBCjVfT1K+eehv9J2AVRv3lRKBO3Txe/6Q+YPtk+0JGnrPtyGHyONKDaswAEe/Cz00elZ4onz38PkZ1xttZH7+NaIxO2uROOpIJyeQWr9DAYENGtrYLpi10vznFKVyaukxZuBpcqdd5iEVOZSdMj0EJ3iDiCB/WwGRCo2RYH1pb4JCTg9Jh2urZi6ofXRtiIHLRaMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpsgLquBzo8qGGD6gZ9Cz9RKOawcuxu6GD3oFLMtq7k=;
 b=UnN9NpmVrKiPAuPWdFxDiqOp/oYlgDbM4ccG9IWtxr9mQM8xU3F6n1NRiMnRrstCk9aI6wZHiRR3a5hr/GeKmDVWjvDuIh9oIWqGyGu4UTrqpq/1Mp7aTQArOuHB1AaYwYOIrDOcXiPSVTTJxI3jk5rpCgqNtS2oLwRMl2jhGocnhkv2HjlQGaQmRx44rkuMBLaarH7p9LvzP0pVDrZof5skBf6eTZqHYp/Lynnp/wtEDfrhXiDQ4SiAuCl1jWs/RoYe25sjaBudzFO5iwLvgY7Sqa2pT95i2Jjvi27ffcnpxF88AyO3/9uBK29FWfIqSJAj0NWDDIbufVHT8DPtGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 08:42:23 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:42:23 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Matt Evans <matt@ozlabs.org>, Alex Williamson <alex@shazbot.org>, "Leon
 Romanovsky" <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro
	<amastro@fb.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
	<christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Logan
 Gunthorpe" <logang@deltatee.com>
CC: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>, "Pranjal
 Shrivastava" <praan@google.com>, Alistair Popple <apopple@nvidia.com>,
	"Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
Subject: RE: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Thread-Topic: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for
 DMABUFs
Thread-Index: AQHc+PAQRqml0ikcREqACcjq+Arri7Y6mQ/w
Date: Fri, 12 Jun 2026 08:42:23 +0000
Message-ID: <DM6PR11MB369091A6F1E32054A95AB6788C182@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-3-matt@ozlabs.org>
In-Reply-To: <20260610154327.37758-3-matt@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|BL1PR11MB5238:EE_
x-ms-office365-filtering-correlation-id: 3ff11f89-ab02-4fd5-2535-08dec85e85ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|38070700021|22082099003|18002099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: Ov5LhRk57yBT/6yo9yNep4x+5mRNB9Qn/IhTq+AITak3qAVxKWf8Qsxpwxs28S30i27t90qKWIk4/P4k3ZrCDX4wH6eYi6Qflitr6SiV2d+QtABlY7/9zA4t5hsucpaxjGzLAzEkrOaVvkBv/TQvf1FuLyMfsEr3QC6GAtom0l4pRjBJnrZmDt4p04yEAwrmO3T2t+faGkYEJHJlTtj7qB1kheSB+xfYb/2rJkkMRNFPROtnBsYmcNAmfMaFjfF5DSLjTqAV2omnVuTh8+LtmMZ3Cc89spcIjTilgre82cmmjC4soRqK/HSpFRe97eWepKLOYpUiv9ykRiK7i15WVwAMErVBSVFrSZK2qjrukaeR2XzwIxmi/PidTTsDHRe71gd1zEfj9WST71GY33FfsNTNGXnB63m0VHWAXI0EAd7FsPETq5KVZQ41dUk9tsGV5mGdsnu3vMXbvRQAbINDkXBOiLtj80PZZDn/pc4ZvMXShP1PVU3zwLHXAxF1PTuz2GW0xd2peEw/Q68aqP1E5Q+x3jNLbA4pazTIHqyHE9XQ/eKLPsrCy3voEyylz1WEyQfYnywJG2H2lGHJXmc9dTWXolHQmP/MjIPfEsqtVO7hx+sXw4QzGfofXtVW6YGq06Y5GZI5VeIzQVuSRGYcHH3QOm1QkiQVMQxo/iFlBApZXBm/EGe/uiHL9ruVJk076sc6cW1mO8alVdeQXn1BSjlOBH7aFl3p7V/+4uQPkDnITeBU8+socv6SM7HzDmtr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(38070700021)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?C2J+rz3kj6s2iUbNjHVC+wioYkR04i1FmrlmJH4qAxYakRBidwhHjG7dcb?=
 =?iso-8859-1?Q?Ejynw1+znfAvXdvTirm6Yu8Lk6ghiLU02KPBcYvrzopohUk6ptWcwjDvrf?=
 =?iso-8859-1?Q?fq4mqjX89hjFfkMjcTALYsRP9qKzxTDT+b7oR4LMQRb9a1/Tfb4E+SM6fA?=
 =?iso-8859-1?Q?n+BW+WImCJRhtGVpJJVNGUbHNFVgfn+uNKPxp6zKH++SFVEi3tKOnC14vB?=
 =?iso-8859-1?Q?PWf5G8grm8nzjc3qYh/diOSLGkMcZKziofmBQLIPlMwahvdmJskf68Mh55?=
 =?iso-8859-1?Q?MHVhUJtO22IkUXLw/cTJ1cCwENjUJe8OdUDPwayv7SytWEQPTPD7XHpHd7?=
 =?iso-8859-1?Q?SWbSIP83+PE3HTM4P+SdrDe0KgLLqZCI8Xcu/GDbG8bpUytaXFBaTdFoAz?=
 =?iso-8859-1?Q?DJ/CxCAurrI8AC2JRmeHT6S/Y/j/tLKx5heS+oUGT+KE2ojcmiGWaplf6F?=
 =?iso-8859-1?Q?utnrpzFTDPhlEynCJ05ADE83SNUN/Xa/pGe96YrEnL/FQmzbJJspeowRHW?=
 =?iso-8859-1?Q?sBAF7UNLj8kSoC8SX3GgiRvUd7ZVsVqkxxj46vJfwEd+q/2dwkiP2hKKLF?=
 =?iso-8859-1?Q?z16XIBYVBCsyPXS5ShFv7TZ7uMboxMD0wJTuj4H/u7GSeHSprDhivJXxK+?=
 =?iso-8859-1?Q?oxokQSrVVE1ddcmFpZl70q+1fjjrb2pTDpjPiAEn0J7jUW7ggfngQ2Kq+M?=
 =?iso-8859-1?Q?h6UcYB1XHKmJz+4oevgPLBz4CK9hB8qNPCwTlZ8SRXKtvgyrftyoqc1pq5?=
 =?iso-8859-1?Q?91U0cQK/ZD5n6U3wLaPnkBejo233GElEOsC3zkF8SvUs2oNZ5u3QZUD+oE?=
 =?iso-8859-1?Q?ninON55madFJsYjqggVOJU+v459mx1Eg7XPHA0qglocIIhLbQE94gR8SxG?=
 =?iso-8859-1?Q?ItDwJFkQ46ecdceIv1VZS/5D8A59u+u65bsoyZTWaX/qfN/CflpqFg4USR?=
 =?iso-8859-1?Q?vdAGTGLEbvnMJhXwHGa3YmQlSFiUt+C9ESECGgUg/Cwvd7UsCO+9AtsN+k?=
 =?iso-8859-1?Q?Q+LyuhZ0rJa0t4JlxAB7vQj6/uNhesY2HQdbZAC0LGZeA9PZIZgIu67PWo?=
 =?iso-8859-1?Q?v6gPFj1K5ovdJ7vi0OUnY7EaiNdwL7tfQ+TjT0WJmwd4SisyiVugK9OcqV?=
 =?iso-8859-1?Q?rPzNHlm09x//n0TI4aKiUY/BkNshcUeaKLGJShCbPZobE4XgsgyJPwFtSt?=
 =?iso-8859-1?Q?MbHH82jb0SGwxx+nviAZkn/sPkr02Aw8TMvLPU9e2Xet7eZn3L1Up50ise?=
 =?iso-8859-1?Q?IltWepQaFD8gTHuEhTX/ZPGnm+8+k+xiiWpVfYB7y455lnqpO/2sHBqk11?=
 =?iso-8859-1?Q?3JwQhbVZfkGaSGBeiPxbNWRqOgD354EkPH/2CnBW69QBOhD3y6QzkCDXSJ?=
 =?iso-8859-1?Q?nNG/zUlRwgjFsQG0FeyiZfJzXesn9Gx8xZtysyeRLTHtK5CPbCclYI7Etc?=
 =?iso-8859-1?Q?vnXgp2PgmcRaSzjvuQhPJ0qophFa5b52TLixRsVRJnLwPaQfdgfEn3zfyA?=
 =?iso-8859-1?Q?1J+7pOcsnFmdDoMeozHWx9CkRcHBsdk4tDGuxY99S57hKecJmBs814FZ9l?=
 =?iso-8859-1?Q?56nBXfUV2l/SI99nkRNC3MmWwyxzR+FY23BT/hhUcD1esQoG3TQArGTknk?=
 =?iso-8859-1?Q?HHcOWeEofBXY17uG8pfBE5KFIS9bd2ppxWftm/+MPnihh0D+mYnnhpf+iQ?=
 =?iso-8859-1?Q?YQ1g4Miw8TXQbSiyg4CG82IXAdI6Jzpg8ivF8Oqq3+aeNgKtMNiRPmc2px?=
 =?iso-8859-1?Q?I4u1aVRyPwOIvfa02SzBbTJXS8hByKnArkY1qbtAiYmmeI?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UwHSsWm4NtaL7Mblcio3RQRSuVYMd/gy6EmiaCdlYXC5qUDRJdVPZcNeDIxtHHr+ce0kE4DjFGNgYK5B5V8sQa/ptORqL+iZO0LmieTQ563VUMjmZEbnsGMpB974fVGtud4OieycnI3WwAvJSU+AO5ltIp0gdF35JZKfbNAVbGFhD/DGo6Rr/HDeCigQpBGPh99K+7BpjNJU9ldPla5P8UJsmNHIYQkQDZLpIW+zP9hKKj26qgl5qWYmxiWBb8ICYZULmpUydjd0TDcvsSC6lAJ+bbASIv72pr8UFuWlU0uibQMUvaKCgJaOViPIvgIzAldFwDtVfBNTnludEZ9e/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff11f89-ab02-4fd5-2535-08dec85e85ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 08:42:23.2123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vzPFVdmtjnxKzPIr1L0ApYCdrYV8XYBzeAMvFCS7Fe98Nsfqm8iuUAzhL9QPYjX+5NbBtQAv+rvMwaJBI5DTsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-64654-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC0C7677E19

> From: Matt Evans <matt@ozlabs.org>
> Sent: Wednesday, June 10, 2026 11:43 PM
>=20
> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *priv,
> +			      struct vm_area_struct *vma,
> +			      unsigned long address,
> +			      unsigned int order,
> +			      unsigned long *out_pfn)
> +{
> +	/*
> +	 * Given a VMA (start, end, pgoffs) and a fault address,
> +	 * search the corresponding DMABUF's phys_vec[] to find the
> +	 * range representing the address's offset into the VMA, and
> +	 * its PFN.
> +	 *
> +	 * The phys_vec[] ranges represent contiguous spans of VAs
> +	 * upwards from the buffer offset 0; the actual PFNs might be
> +	 * in any order, overlap/alias, etc.  Calculate an offset of
> +	 * the desired page given VMA start/pgoff and address, then
> +	 * search upwards from 0 to find which span contains it.
> +	 *
> +	 * On success, a valid PFN for a page sized by 'order' is
> +	 * returned into out_pfn.
> +	 *
> +	 * Failure occurs if:
> +	 * - The page would cross the edge of the VMA
> +	 * - The page isn't entirely contained within a range
> +	 * - We find a range, but the final PFN isn't aligned to the
> +	 *   requested order.
> +	 *
> +	 * (Upon failure, the caller is expected to try again with a
> +	 * smaller order; the tests above will always succeed for
> +	 * order=3D0 as the limit case.)
> +	 *
> +	 * It's suboptimal if DMABUFs are created with neigbouring

s/neigbouring/neighboring/

> +	 * ranges that are physically contiguous, since hugepages
> +	 * can't straddle range boundaries.  (The construction of the
> +	 * ranges vector should merge such ranges.)

though the field is called 'phys_vec', removing 'vector' in description
is clearer here.

> +	 *
> +	 * Finally, vma_pgoff_adjust is used for a DMABUF representing
> +	 * a VFIO BAR mmap, which is created from the start of the
> +	 * offset region.

Elaborate it a little bit that the vm_pgoff is already counted in paddr
of phys_vec so it should be skipped when finding the pfn.


> +	 */
> +
> +	const unsigned long pagesize =3D PAGE_SIZE << order;
> +	unsigned long vma_off =3D ((vma->vm_pgoff - priv->vma_pgoff_adjust)
> <<
> +				 PAGE_SHIFT) & VFIO_PCI_OFFSET_MASK;
> +	unsigned long rounded_page_addr =3D ALIGN_DOWN(address,
> pagesize);
> +	unsigned long rounded_page_end =3D rounded_page_addr + pagesize;
> +	unsigned long page_buf_offset;
> +	unsigned long page_buf_offset_end;

what about "fault_offset[_end]"? page_buf is a bit confusing.

> +	unsigned long range_buf_offset =3D 0;

could this be called 'range_start' then the 'range_start' in latter loop
is renamed to 'phys_start'?

Not strong... just feel such naming helps me understand the logic easier

> +	unsigned int i;
> +
> +	if (rounded_page_addr < vma->vm_start || rounded_page_end >
> vma->vm_end) {
> +		if (order > 0)
> +			return -EAGAIN;
> +
> +		/* A fault address outside of the VMA is absurd. */
> +		WARN(1, "Fault addr 0x%lx outside VMA 0x%lx-0x%lx\n",
> +		     address, vma->vm_start, vma->vm_end);
> +		return -EFAULT;
> +	}
> +
> +	/*
> +	 * page_buff_offset[_end] is the span of DMABUF offsets
> +	 * corresponding to the faulting page:
> +	 */

if the naming is kept then s/page_buff_offset/page_buf_offset/

otherwise,

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

