Return-Path: <linux-media+bounces-64958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S318DmvnMGpBYgUAu9opvQ
	(envelope-from <linux-media+bounces-64958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:04:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F4F68C56C
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:04:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=eitVheU4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64958-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64958-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 545993029A6F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 06:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289D63DA7D4;
	Tue, 16 Jun 2026 06:04:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787F3093B5;
	Tue, 16 Jun 2026 06:04:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781589851; cv=fail; b=RL5YgHAch/E/IXRY0XmEyr0eOJSt61VgrwcCN74+cxCskRyX63lDogEr8Xbmh59pqnhEybLNf0ib8g49xNL5ytTX1Xs5Tin4WLtZGvGitavKadnNYKppox1x4jYqNNN8SpOZiZ4R9cnjmIwQRuj+RZ90IuK/NrWpofy6h78NUEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781589851; c=relaxed/simple;
	bh=PkJs7iJ/Dd8WSHrt53MaWqE43esM+iZqlpwGMN92l8w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KO6WoFAipilpKx0rgIjsLgTT6c1bwgkysCPC2FQUEH4nrLptmED/ZsLj/QTQ5wkhvF37d3tixqfub31WkZwH9nv24oViJJzkQKHNa3bxYNsg2stS2SbBj5IzHWZlNlt7TbIFx6yUNT18Unuq3IbdX1FL1DrelP8NPNudry/LjfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eitVheU4; arc=fail smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781589850; x=1813125850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PkJs7iJ/Dd8WSHrt53MaWqE43esM+iZqlpwGMN92l8w=;
  b=eitVheU4UglnkfcAskCXOZucH4DUzhIfU5Ynt8bEk/V91N/9cruiPmFn
   E9ktCu483QXVqCvxIMlJ7/YP64fQqmn5gowQncUnlHnjtS6Mmp7gh1EDt
   HqC2DfZPsPkngpjOeclcyAKrMFwMezc8qGC1p6NNeuXex7er2OOk8qB5B
   Y1UE4dq69IyM27Gvjj0wkzDrL6Y9eQv48vVMirw5mkUWwzzK1OdoudN0I
   +swpWPknBqGWa8aMCZVsOhGNvYo4+vddzUZmv9ES6cNLL8Dnzormc7BTg
   K+ckn4jDRhbgO8LLK3C7WoluUydOO5dWL3pJUHXEyaYeQAo+7ownyA+gk
   w==;
X-CSE-ConnectionGUID: DyMCtZNySHS3vHlOlnLPJA==
X-CSE-MsgGUID: Hokz4mbCS9q9KaZ+mc3fTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93833687"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="93833687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 23:04:09 -0700
X-CSE-ConnectionGUID: vNmextl+T8Ojd4mDDFUrGQ==
X-CSE-MsgGUID: +sirEM8oSeOs2TgL0a/PCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="277869229"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 23:04:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 23:04:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 23:04:08 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 23:04:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAe5JnRY04zjPLQIG17qVQ+D/s8aiBP0k/MP4kX2swDLD38bFB3gCeNr713DR2gY2EO6OwSz855uDmM4nz0GmNMiQOjUepCyXDn9hmeFmJ6x3SdwPUcu8Rm+3mLDjNwqOpLT4qzpza2Rxs2UvXjy8B60L0wYMU2PW+U1Q9MF00eEm5WA5Bp/IOInFMZzidXrD9WoJqcMEwUqa7zNbrrB3GVRpU+0fLdFyLN0j5nuLiabgJitkIhFsspMrDoEPlaUVUdwJ8Rv3iCl4z//Zv/sL7g9whwjGlwykFYhxruSPATMAEAbPX66s1JhpDqYDI0Istsl8iB7EwhDyJgVqQrTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9QsLiFb2NmbJArXd5IxCe88MBG3jHftP2M8zoX0DCY=;
 b=VyOX/N66sEq4TSlIFSmS40KX/u/lcU16T7uDPtplRUp1b20mqJ9tLwkiQdVNSL40+t+kBv+lP4DNq9xogyR2BcbOvXoCdh23qIan2E+u+ErOBzi9gAJAZsqWTdfuX5nT+Zj4lkGWTOXbpJPbxpHJpoTTAAhZNOPd55fiwQ/h3nJZKYeTgTIgvWFhP7pv+SL+sSSY2tlU0HHyC0qV2UtysB/rz/BqexjNn6su1hSSBL2qMBEyhYCaqPQY/hNk+tdyT+LsZizQ7mhPtErRF8O6EXqaL6HEJ0IJ22F3PvJ26Cthw8G2e9UQBx9/bb9AKTGRXDgD+CnwYK3JD9PpQfHJ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:04:04 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 06:04:03 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>, Donald Hunter
	<donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
	<christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>, Jason Gunthorpe
	<jgg@ziepe.ca>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"sdf@fomichev.me" <sdf@fomichev.me>, "razor@blackwall.org"
	<razor@blackwall.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>,
	"almasrymina@google.com" <almasrymina@google.com>, "matttbe@kernel.org"
	<matttbe@kernel.org>, "skhawaja@google.com" <skhawaja@google.com>,
	"dw@davidwei.uk" <dw@davidwei.uk>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: RE: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
 folio
Thread-Topic: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
 folio
Thread-Index: AQHc+b3PSBoLk1+d5026A21Ds4F9PLZAdSfQ
Date: Tue, 16 Jun 2026 06:04:03 +0000
Message-ID: <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
 <20260611-tcpdm-large-niovs-v2-2-ee2bf15e7523@meta.com>
In-Reply-To: <20260611-tcpdm-large-niovs-v2-2-ee2bf15e7523@meta.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA1PR11MB8474:EE_
x-ms-office365-filtering-correlation-id: fd316922-80db-447d-94d9-08decb6d1182
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|921020|38070700021|3023799007|18002099003|22082099003|56012099006|11063799006|6133799003|4143699003;
x-microsoft-antispam-message-info: ZqE1x8EHyNik83Qf80EnpnsFPjXUM0vrYe+CWbMKw//YjLX7bbb4A5I4f9v7qh64iRQA6MGbsbKpIuaMT9ijcABXT/h8txIgk2JnQwlxLlMS5OlTZOtdcDvgHQFVY/tVG7ExW2GUJqQYQP+TRsyAs7apHj37TreY+B6SQorJugz8rc/hVDiylgcvO/56FMVFyc8UmHo07F9ZceSwSgheQkim64SCqT8sYPAkyuKqA8sfEyNsOFm1DvMu2NzxKio+PLrfd9m2wDHp5OQkL6jratR0oVFoIRjL9yUXfN9p3gYHgrS1YF0r6dGPzIJ1jBmx7DoY+FWTEWUuw61xx53YwkbvinoGKIw3BZyFdGSVyD0nhDNzbdeSQum9ueqtq3x+zxSvPneTg/YjW6W7Yj9YWqTjUMRJuheGOO+amNllkXQam80nzPr2B8v9HSKc5x4OIVFT1Hy8908QYeO2bPji5zQ6mzYOj0+TJv5WIJF4KjIbfFste94iH2w39tk1jyhc0aecrkC9ffg4vtNWqGCkBqm9m2YVUQr3bh7QTIVH5oR2TGVGkWjNbBzCJFtYI/Eoyle37BLZm8ItvmRwmZUa4IFgzk53ymWd5nQ83GSOXK9JU7uMIBb8lcyZ8Okd0do/ABOzvrLQsXjfWpAd+J7XYoqSnzlY0EVeuVRe0L4Gf0yO7xSMlh2lgyzFAeNlFrnI1/NJYVoZM8qzoGgOvze6bs/jWe4hYszEfRB0vwHYv4A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(921020)(38070700021)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nyO2RRTqmcvdvsx7PGDtZ66TOkEDQWyFvcKGJF4hqQGAVykBfjlZPdfRVX?=
 =?iso-8859-1?Q?Uqa9XsOflDl6fDtcD+8eoR639Z9Gb2gSobfT1J+0YiUbusWou9w5KQsUrM?=
 =?iso-8859-1?Q?m2QpG2kRXHBTkTqeqrtyxvMypwkz7nTMcQI5GFjIoO2Am4hx2J77S56ngF?=
 =?iso-8859-1?Q?+eyMBki9+5UImLOXcaQY+z1fNul+4yBhO4OFZl8YGhPPkDO4wwLOyHhL3f?=
 =?iso-8859-1?Q?zFENl1ACRTqpJkE/aaDG3dVIbYEmmVLBVUgzuaaRPDBmwG7TGl4wsq95qv?=
 =?iso-8859-1?Q?lZw+WzTT23CItXdmEcva+vUwFNudtUuqedlq+J9KfrvWzzJm/ZT2BxGzj5?=
 =?iso-8859-1?Q?s56MEIh5GknbeH9uv1hvC7fPICBe+NY0BTIElx1ilaATns4fP0k2bsXVYS?=
 =?iso-8859-1?Q?5LV3cs86sm1CUCuighF9xzLIfhvqYBup8TvKacsuxfNppkh6AA9QnvaZRE?=
 =?iso-8859-1?Q?wH1cJJ7buIdAvggWSKLPB9DpihSl1aDjFusW9CXzA3kOiv6oVfXOundrsI?=
 =?iso-8859-1?Q?HkaWi5K/gN76px6Zn18IfGn4f2VTstF01EEK/IBsyKPCxGX7oNSs0VqLVl?=
 =?iso-8859-1?Q?yRF0sWkqLOKb0iuj/OxTM5ARJ4hXAmogLrIQkk4nAdK7ZyQGJ4D0ZsssGf?=
 =?iso-8859-1?Q?6Gg++wSEu9O68eZMGvFr7KGKtW8BBbi2WVWhW+LSAx5EyfoW6PPFmJU1AK?=
 =?iso-8859-1?Q?lNAV18hNWNq6FAmvtxtGTNToihzLPxlh2TVQhiQb/BTjy9TD2uLomWjvCG?=
 =?iso-8859-1?Q?MZs1T3TZxQXiR3Bo4R5+1BVPb1Ngm8pEV74zi+rv5eaoMrLan3cP6O8jI4?=
 =?iso-8859-1?Q?5IAB/9iyqsbyGANOdsMn6IvKCpDjSCxu7PxTZPF4psDol06ac0K3pZ+oPS?=
 =?iso-8859-1?Q?02wvfTVieyZanYXKqsryt80/GiWOBG7vwFbyIrE/xxhlJw0wK/MkZBwUWH?=
 =?iso-8859-1?Q?gCcz5azVS0iuxseUFGmFHjqL/jlSwRNhXQsGWYJGby9jZKIDqRXJpbDqCp?=
 =?iso-8859-1?Q?eld267/PF4vFmXeqw01KoF1tClVbffqZpAsU6YBCS9hnpqly3lL+uSP7P4?=
 =?iso-8859-1?Q?fCVa+MNfRwvCrnBCMsKhoXja6fXFU+OpDa0Mmf2IPjE4JCJCxTj10Dfa06?=
 =?iso-8859-1?Q?5aEz4uqSkw6k1kTwv6EaI1AqHRmqhFIt4bYq4ii4KVDjlXC1WR9i9dFdPg?=
 =?iso-8859-1?Q?PpwaJYbciSujWML6MiqRxRXQGb6WSCgLp7IcZkam9z5V9ddV4AVhtYAKqc?=
 =?iso-8859-1?Q?SjggO7qKnD++IGxaHaLir8Owflcvu3jg3p9ev2lAco/ujcBeCaKNjMJ5Xk?=
 =?iso-8859-1?Q?PkkUz6IgjqAR9Uxr+BUQ4yXMapydtAyTofHZ5IowS2fPe0kx7zmoULnzP+?=
 =?iso-8859-1?Q?Zn9QwNh1e2dx+Kmy8uD3x6R062rFNxWfczFNIw2DbgfmkH3bs+bCMzCGFQ?=
 =?iso-8859-1?Q?6RCGtdxgtwETYXzb8gy6gahTxrfAFP2c2CMPbzRp6APkzRO+2nvUy2NLvx?=
 =?iso-8859-1?Q?SnQy1XyyGxGTdKAtcWKMMpuBGRCOXvmHZqg2Ix6J4Ya3riO36rdGROZN0C?=
 =?iso-8859-1?Q?WISOOmivdoTPQ/xWUyaERDNRBVsYLcTYBtoYnirWcGN6K5fIJAvWlv3gVt?=
 =?iso-8859-1?Q?UuSUisG6MjMygjaZav0Uj+/mFrmhvsaWWEkz2huCCdGY7UqWViCPH5tjDW?=
 =?iso-8859-1?Q?SohmnsWpMlQNGpOMxEatP7xZexsV7a70UVAtv4J1naFUfCQ/s3zFSaSQge?=
 =?iso-8859-1?Q?ZaKbRTjDWqLqpCZJE/XxvbYi5r27j73/pZu0UMev8siVunEVlVIeOLSyOx?=
 =?iso-8859-1?Q?11VfhgFpNg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: P80HmHgQ7XI+5KcluQYW94r2VaU463cplUyss1QawSZ7qLfZykaD9ua0CPUSoyahbL9l7Ur/gHbzoyPW9m9O3e2m2iEb/WBCHnaQbHIOiRKFnXKkoeYHkC6NGFLvyH0CAEHH4h+chycRp11a9ZPD7xYzBmi9GnoQtQYQnXwe8nhkPhRV14r2/gcJK+TZcsV26zzJ5uXd/mMpK1e+/YNtLLNlVFthhOxtlYW8mjTo9XLDL8+KDMScS/l7knDTwHf6qIeTFCMzJiPdtBSIWEziN78XgSXpQ6LaO+LvkuT5DWu3oNbFVh8Q+QCP3tjI8BZQjP/udhUtApubDKU65aJX+A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd316922-80db-447d-94d9-08decb6d1182
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 06:04:03.8643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gLtuwpWUu8d00xVGUiqWUsmAk11l4os/oFm6QtH7kdbAmbDziezxQgG0FI5gYm3myR+/VnArIuRXgDRjo9NmRmsK5WFIuv7M6cj2zNZAE1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64958-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,linaro.org,amd.com,ziepe.ca];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:jgg@ziepe.ca,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[vivek.kasireddy@intel.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,IA0PR11MB7185.namprd11.prod.outlook.com:mid,gitlab.freedesktop.org:url];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.kasireddy@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3F4F68C56C

Adding Jason to this discussion.

Hi Bobby,

> Subject: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
> folio
>=20
> From: Bobby Eshleman <bobbyeshleman@meta.com>
>=20
> get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
> underlying folio was larger.
>=20
> Instead, walk folios[] and emit one sg entry per folio. When folios
We have recently merged a patch (that will make it into 7.2) from Jason tha=
t
replaced sg_set_folio() with sg_alloc_table_from_pages() in udmabuf driver:
https://gitlab.freedesktop.org/drm/tip/-/commit/5bf888673e0dda5a53220fa0c49=
56271a46c353c

Since you are relying on sg_set_folio(), the core argument against its usag=
e
in udmabuf is that it doesn't work well with offsets > PAGE_SIZE, resulting
in a malformed scatterlist. Not sure if this can be fixed easily.

> represent large pages (as is for MFD_HUGETLB), each sg entry is a large
> page. Normal PAGE_SIZE sg tables are unchanged.
>=20
> This is helpful for importers like net/core/devmem that expect dmabuf sg
IMO, udmabuf needs to detect whether importers can handle segments that
are > PAGE_SIZE and set the entries appropriately. Please look into how the
GPU drivers and other dmabuf exporters/importers handle this situation, so
that we can adopt best practices to address this issue.

Thanks,
Vivek

> entries to be size and length aligned. Prior to this patch udmabuf
> handed over one PAGE_SIZE sg entry per page, so devmem only saw
> PAGE_SIZE chunks regardless of the underlying folio size.
>=20
> dma_map_sgtable() does not always merge contiguous pages for us, so we
> do this internally before exporting.
>=20
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
>  drivers/dma-buf/udmabuf.c | 52
> ++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 94b8ecb892bb..9b751dd98b12 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -141,26 +141,68 @@ static void vunmap_udmabuf(struct dma_buf
> *buf, struct iosys_map *map)
>  	vm_unmap_ram(map->vaddr, ubuf->pagecount);
>  }
>=20
> +/* Return the number of contiguous pages backed by the folio at @i.
> + * A udmabuf may map only part of a folio, or reference the same folio
> + * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
> + */
> +static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
> +{
> +	struct folio *f =3D ubuf->folios[i];
> +	pgoff_t j;
> +
> +	for (j =3D 1; i + j < ubuf->pagecount; j++) {
> +		if (ubuf->folios[i + j] !=3D f)
> +			break;
> +		/* Same folio, but not a sequential offset within it. */
> +		if (ubuf->offsets[i + j] !=3D ubuf->offsets[i] + j * PAGE_SIZE)
> +			break;
> +	}
> +	return j;
> +}
> +
> +/* Count the contiguous folio runs in @ubuf, one sg entry per run.
> + *
> + * Coalescing folios into a single sg entry up front lets importers actu=
ally
> + * see large chunks. We can't rely on dma_map_sgtable() to do this for u=
s
> as
> + * the dma_map_direct() path preserves the input scatterlist lengths
> verbatim.
> + */
> +static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
> +{
> +	unsigned int nents =3D 0;
> +	pgoff_t i;
> +
> +	for (i =3D 0; i < ubuf->pagecount; i +=3D udmabuf_folio_nr_pages(ubuf,
> i))
> +		nents++;
> +	return nents;
> +}
> +
>  static struct sg_table *get_sg_table(struct device *dev, struct dma_buf
> *buf,
>  				     enum dma_data_direction direction)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	struct sg_table *sg;
>  	struct scatterlist *sgl;
> -	unsigned int i =3D 0;
> +	struct sg_table *sg;
> +	pgoff_t i, run;
> +	unsigned int nents;
>  	int ret;
>=20
> +	nents =3D udmabuf_sg_nents(ubuf);
> +
>  	sg =3D kzalloc_obj(*sg);
>  	if (!sg)
>  		return ERR_PTR(-ENOMEM);
>=20
> -	ret =3D sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> +	ret =3D sg_alloc_table(sg, nents, GFP_KERNEL);
>  	if (ret < 0)
>  		goto err_alloc;
>=20
> -	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> -		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> +	sgl =3D sg->sgl;
> +	for (i =3D 0; i < ubuf->pagecount; i +=3D run) {
> +		run =3D udmabuf_folio_nr_pages(ubuf, i);
> +		sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
>  			     ubuf->offsets[i]);
> +		sgl =3D sg_next(sgl);
> +	}
>=20
>  	ret =3D dma_map_sgtable(dev, sg, direction, 0);
>  	if (ret < 0)
>=20
> --
> 2.53.0-Meta


