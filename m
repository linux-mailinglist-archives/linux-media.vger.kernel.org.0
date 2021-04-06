Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F179135530C
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 14:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbhDFMBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 08:01:46 -0400
Received: from alln-iport-5.cisco.com ([173.37.142.92]:54480 "EHLO
        alln-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235453AbhDFMBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 08:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6107; q=dns/txt; s=iport;
  t=1617710498; x=1618920098;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=RKEe82fyy3x7Q6bBqZUQ4fQsgguLMYyPXrQ0idwnDR0=;
  b=f3sEOeiA2OMtbgxUtqW6/FH1nG11jUqW4pVdBULywUQ/E9+6LS8w/J6G
   3fUEcg+ktX6C+0z/zgkjdsRbmsNYnYLi7KRgRnmyV+nLGqIZjyfJassld
   xIe2IiByXs01jNiALBJxuuZ/JYdWO79rvUc5ReeGTJ45WoGIAKA/xnws1
   8=;
X-IPAS-Result: =?us-ascii?q?A0AYAgB5S2xgmI9dJa1aHgEBCxIMQIFHC4FTUYFYNjGIC?=
 =?us-ascii?q?gOFOYhNA5k3gS6BJQNUCwEBAQ0BATICBAEBgRYBgzkCgXYCJTQJDgIDAQEBA?=
 =?us-ascii?q?wIDAQEBAQEFAQEBAgEGBBQBAQEBAQEBAWiFUA2GRAEBBAEnEwYBATcBEQEIG?=
 =?us-ascii?q?B5CJwQBDQUIgmmCVgMOIQGgFwKKH3WBATOBAYIEAQEGhR0YghMJgTmCdop9H?=
 =?us-ascii?q?IFJQoETQ4JfPoRAAoNKgiuCRAeBD4EwVCkCnRKeJwqDCp0bpHGVFZ5hhEgCB?=
 =?us-ascii?q?AIEBQIOAQEGgVQ4gVtwFYMkUBcCDo4fCRAJg06KWXM4AgYKAQEDCXyMTgEB?=
IronPort-PHdr: A9a23:48e84RIHbBQ5RyOquNmcuZ0yDhhPgJ39IxIV55w7irlHbqWk+dH4M
 VfC4el25HfCWoHf4vhDkeOQuKflCiQM4peE5XYFdpEEFxoIkt4fkAFoBsmZQVb6I/jnY21ff
 oxCWVZp8mv9PR1TH8DzNFbVpnm75zkIE1P0Mg8mbujwE5TZ2sKw0e368pbPYgJO0Ty6Z746L
 Bi/oQjL8McMho43IacqwRyPqXxNKIxr
IronPort-HdrOrdr: A9a23:cYk8OKrFRy8Eqpbj064ktLwaV5t7K9V00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQV3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIBg/I
 9aWexFBNX0ZGIUse/T6gO1Cstl5dGB/ryhi+u29QYRcShBQchbnmBEIyycFVB7QxQDIJI/Go
 aV6MYvnUvdRV08aMOnCn4ZG9XZr9rQm578JTIADRgr6A6B5AnYp4LSOR6ewxsYTndz0a4vmF
 K13zDRy4eCl7WAyhHa33LO9Jg+orvc4/ZKGcDksLlvFhzCkQCtDb4RPoGqmBAQjKWR5E0xkN
 /Kyi1Qcfhbz3/KZGm6rV/M9mDboUwTwkTvw1OZnnfvyPaRLFlRZqYx5vM6TjLi90EisNtguZ
 g7uV6xiptNARvM2AT76tTYPisa7nacnHs4neYfy0FYSIsVAYUh1LA3wUU9KuZlIAvKrKQcVM
 V+BsDV4/hbNXmAaWrCg2VpyNuwGlwuAxavWCE5y42o+gkTuEo841oTxcQZkHtF3ok6UYN46+
 PNNbktvK1ST/URcbl2CI46MIuKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvX5AU0p0omt
 DkXElDvWA/P2LiYPf+n6Fjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQgiM2lr/IDAtDKWv
 q6NZ5MasWTaFfGKMJs5UnTSpNSIX4RXIk+odAgQW+DpcrNN8nru4XgAbLuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUX3vsf0f47I9hCaSyxZlV9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71qWhpWe3+m7M535zOgVUC1tU5LmIaQIJmSY6d2fPNZoTsdSWfm5fmFGdIAVkcs/QGA
 lD40hs9bmvNJyWzyA6A9ehOmaX5kFj4k6iftM5oOmu9M3lcpQ3AtIaQ6R3DxzMDAEwsx1tsn
 1/ZAgNQVL/Gjvihb6+toEdAPjSerBH8V6WCP8RjUialE2H4ekzW3MQXleVILGqqDdrYwARu3
 pc3Os0hqGalTOmNG0l6d5ITmFkWSCwG7JJDAOMeYNOvKvkETsAFVuitHi9lww5fHbs+gE0gG
 HsRBfkI83jMx56pm1S1Lrs/RdPUlilO2h0anx8rORGZD/7k35uzO6GYbey2WONal0EhvoQKi
 3BfCF6GHIe+/mnkBGSgzqMDnMg29EnOfHcFq0qd/XJ1mqqM5Dgr9BMI9ZEuJJkPsvpqOkFTK
 aWfBKUNirxD4oSqkWoj2dgPCl/s38/l/z0nBXj8WijxXY6Rf7fOk5vSb1eI9aS6QHfNr61+Y
 Q8idI+pu2rNGrtLtaA1KHMdjZGbgrJvnTedZBdlblE+aYp8LdjFZjSVjXFkHlBwRUlNc/x0E
 cTWr5y7rzNMpJmFvZiMR5x7x4sjpCCPUErugv5DqslcVYhg2TSMtmJ77DLwIBfdHGptU/1Ix
 2S4idd9/DKU2+fzrYcEbs3OnkTZ04m6nhuldnyOrH4GUGvbaVE81W7OHPmL+MYR6iBBLkKrh
 F1p9uPhPSaciLk2AbW+Tt3S5g+gVqPUIe3GkaLH+UN7tmxfVKLiaGu6NSojDj2RSCgAn5o8r
 FtZAgVdIBbljImjIcrySC8Raz8v1I9nzJlkEJav0+o3pLj/XzSEk5HOxDIm5laXTFcNX6TkM
 TOmNLooUjV8XxCwpnMFEBZY9FIFZwRV+HMXldTFfQ=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,309,1610409600"; 
   d="scan'208";a="692925700"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 11:54:32 +0000
Received: from mail.cisco.com (xbe-aln-006.cisco.com [173.36.7.21])
        by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 136BsW7q029701
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 6 Apr 2021 11:54:32 GMT
Received: from xfe-aln-003.cisco.com (173.37.135.123) by xbe-aln-006.cisco.com
 (173.36.7.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:54:32 -0500
Received: from xfe-aln-003.cisco.com (173.37.135.123) by xfe-aln-003.cisco.com
 (173.37.135.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:54:31 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-003.cisco.com (173.37.135.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3
 via Frontend Transport; Tue, 6 Apr 2021 06:54:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gd4+RzbMWiQ1ML+ZYPF29XiUiINkri+dnMH+5RQIQSWkh6YiM8Jx4vpGNuAXbxq1mStaOx9UJjh9NfgOglTnaySiJUmcv8qlcqExKvK65m4YS9uzRZ2DjE1OLowsUKJ6ng2oMBizGeXTv6OaCck2hefpT/TnnSxsRkVRwV/DdPhvuv3LYGJhffhSYMjcG7zSdD7QQmsXRpGt6STDAHyBfQztd6P7brgDQ9OAtDfBhvNJx3Uqp4CbS/lr2k9Mnht8pKxg0iY/wApeg6xQPzSjkmB3xQw43ZyJ7h1LXPOTMAsMR2RQ3kTskJQe1rUSYam42omFSWs5xlZRUbd/YBgZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGvp2R6ha8wPowl3eLex8vL/EBkdGpqg77r7ogpjHmc=;
 b=VoQ5vxP5OfX5m7c0F0WklN9gOPjIuNynquriKrjImq/D/S5Et3RoybiBO4NcH0rWaossAS+iFaNLNa6njTus6DPnX6pay7hE63ERBtd6OfaOlImmsV82SaVmyBc9l0o1ehwoalM87URl+ah+A2OrVB6HBf3P3j+pAQsuy/mSn9JYhLTzpaUqCBgmVrvImNcB3uTfBztXhdIWWasceBudU4OscgxmWW/LzigwLyN3YrikkmFteH8kXzOPXxcbKPfctbkAXdejJwFcRY+ZMEWysWwiQuWvAd10HII2WBdE0yn/T7Wh4FlYfCR4EIxM9faNDsSWZaXOUMfb6m4qSzr1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGvp2R6ha8wPowl3eLex8vL/EBkdGpqg77r7ogpjHmc=;
 b=h4VVU5uL4eZo1URQTmqVzsTJAsmff/f8jEQU/NzeFNfhPCQN190d6EqYr/s/cOhicKb77I7bIFKg6UU5l72pQEqBSVCRA4qPZIAGdE5HaxLmEwcT6+0ZSNvQfQXzVCVSeY9nokPSskyCTiBstn5+GtBhQq184xz38sCUxVi+3ss=
Received: from DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24)
 by DM5PR1101MB2105.namprd11.prod.outlook.com (2603:10b6:4:51::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:54:30 +0000
Received: from DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32]) by DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:54:30 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v8 11/13] media: hantro: Introduce G2/HEVC decoder
Thread-Topic: [PATCH v8 11/13] media: hantro: Introduce G2/HEVC decoder
Thread-Index: AQHXKtuabz2KHB59xEuRngzTxKesHA==
Date:   Tue, 6 Apr 2021 11:54:30 +0000
Message-ID: <DM6PR11MB4625B0908E8D8A1843404847DE769@DM6PR11MB4625.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c0:1002::b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bb56b2d-bfd8-49b9-7c3d-08d8f8f2bcde
x-ms-traffictypediagnostic: DM5PR1101MB2105:
x-microsoft-antispam-prvs: <DM5PR1101MB210517EE6FB73473F369EBA7DE769@DM5PR1101MB2105.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:321;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gj1Y9abNKRISJZnGWI+4pyCuGmY1p5KGqOd2ioiGBGLAt76QZOnpWSxiamAizh1knvAkibE2jAb6EDBxoqMG3osVxC1yHdCIiFa3bU3lfRatSp4QZYaUwTLCBSe9+dgkek8VmC7xoErNbarhXm9sUmZTRvnEMWbWhpRs4SCiIVmq/1LrvVbsVwGxCQ5gJ2XUA6rysyOc2LgopSyLHtHjAxYomIQvRW/jFSDQdWTdJw1SI/VDkzBtN0/4PxRQqzzXP47INDQ6S1zb9lCcq96i4zp/ug09rBdqXiIuzn29gNXbWEbzwVwgL7F6ol1/Wk9rmAdAD9fyVdD1z/FRd8SNCRCLSr6voWqszfNbt4PZYEQMVPEPE8Xc2DdUDu+2/O4c1/3cRyK9fxwCHM/iXDqRaBCB0JPuiB5x8SNSXYSp9vMLOVd+S/X9Cxr40o4sjzYy37sQ0KHtDhuK2xKMXU6G5+BsDXt43FTu2Gnu2qqyiYgw+4ro3N8D7gL7dFSkQdermYgWT7Ij5lWOCfhB6Xd6oiH2WVIFQH77gMRmrDnuf9Ts9JOMYciN9crNLq4fj9XU+gsoJFVLEMv6x7mratM5GwIm7JnK5tJsr2rupAui3vEFUZYYPvgvZfMz7cEpsw7mW2KxnlZKLvslYDy8fvmg5AeN6tSJGmnWs9UROWaob4w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(366004)(136003)(396003)(38100700001)(33656002)(7696005)(110136005)(9686003)(55016002)(478600001)(91956017)(54906003)(4326008)(8936002)(8676002)(5660300002)(66476007)(66446008)(64756008)(66946007)(316002)(186003)(76116006)(83380400001)(86362001)(53546011)(71200400001)(2906002)(6506007)(52536014)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?lZujUrY8otC1PHGEbT0gKSfPiR2Y6xilHH7fOYpf/6vOjFWkdFtjuLei8H3p?=
 =?us-ascii?Q?I9cnKkDB2xIQNebRnvFqGI3UEVwokG3paSDMD2GayQY7CGJOKuNPB4qyM87P?=
 =?us-ascii?Q?21GQK3+833rbMNq1Fm/sPfIw6hDZkkoXiTL+xhowDp5xFKsw6IlvgLNbcljL?=
 =?us-ascii?Q?xPu3LmbM2NdZlLplIT8ixTFPxj8rv2bMkeub6Er+VlL6eE5p4FK06ieN46nq?=
 =?us-ascii?Q?NiKJSeQfTVhhDUZGm2X8JUtWfwjXmXKLIhMMCPGmBXZ5Rk48s4hS+IToyyIM?=
 =?us-ascii?Q?jmNqRuHPG17ZCeKUmrvoCMJNXr2uvFpcRNg5CLWc46fYUT1iGAlsdVzntHTY?=
 =?us-ascii?Q?ucfqxyEQ9hm9jRmZg7JgSrJMl2ZoWY/IiDyNrdD7qy7lqQXGnd1jiIyMs+cP?=
 =?us-ascii?Q?Dp2/WK3a1BYPP4rhEVMrsN1+9FmN4jS22BwuNXCOwe8UJNJlSBR9/SyAQ+l3?=
 =?us-ascii?Q?UdTiDDVh5PanVnszIVX267TlM2vrpkLEgFgfzOEZKjjQB9P7h78eyLtga+dk?=
 =?us-ascii?Q?4fRx4Q98xkvKwYAhzlJaYlPyQCrcDCnD6+ht/9vMbXg4Z7xNXQSnPCqIn0iz?=
 =?us-ascii?Q?ulcvpFnIxYrVCohS7E/Ngwf+9wT/PjtliG/KRWQu4byTiAwJ3ZP2txm59oOe?=
 =?us-ascii?Q?iEmJD2/evAktBi9StqRj6ihjatq3JLVkWRR5YcE4FuPrOU0mFpJfHNm5OF5q?=
 =?us-ascii?Q?yyRf8Xpvl0+jycVvccF/yg20cHCQ/sUx4gtWhn15LgWDfP0B7uLRK+QkPqun?=
 =?us-ascii?Q?7nM9PkVB5usoBW4Cvbjldfu+gi73ut1V6NgYLR9OWypFIovpiRb6eY2THGcV?=
 =?us-ascii?Q?nOL35fzS6bj0yVm1UJX4yq3NQ6zpTx0N1yoYChoUdc14BoONs0xopxQKEqyX?=
 =?us-ascii?Q?Up5BgR6AGiFrXAN2+vJWKm6MzPLF9w2ojIJWy+INuTo7EM5vLyaJVS19Vp0u?=
 =?us-ascii?Q?LGEuIDvtRNhXzKBaDrfPD/TggUckGEayFauC5EzXwDdEZ89AnmtM1W4DIa1y?=
 =?us-ascii?Q?YSOG79awSpV9deiNPTm3RZDfly6C7vXBb+5u0i8cJu8sl+1uDOzCFT3KsgWr?=
 =?us-ascii?Q?X5UySLYkNeimLudqVNuUc+C8FwBZyAb7iNkfQ9T8RBe4Xs5xBqIitWOgOl5T?=
 =?us-ascii?Q?2n3ci+w8eqBWH9pY2NHV2Vb5U1a2XZKVX7HOiW1kykUzBaGzZeTkk6A1ls1T?=
 =?us-ascii?Q?KceED5G4wvvRpQ7pQWM3s5WllheDXgGXNv9RBR66O0h9r+G3V8CadW+3OOgV?=
 =?us-ascii?Q?MLDwo7o1rwHUQPGBmRP2b0oWFbWieI3vSUBk0/nckssTpPRgWuAluXbjOV2c?=
 =?us-ascii?Q?WxNBmUBhqzn+/Fft8VZ06kUcCZ5xIzaDgnBfrXLc+uEjzaeT4whQ9vg1x82q?=
 =?us-ascii?Q?Q/pRIgA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb56b2d-bfd8-49b9-7c3d-08d8f8f2bcde
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 11:54:30.5953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: so0MutRxllfHrzdKi/JzWaa/HZQtaBm0UwOGxqbsnZ7rrcCSCYkk3kGgPK+nOdhuccnVXx22br85hEP1sI/u8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2105
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.21, xbe-aln-006.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 18:00, Benjamin Gaignard wrote:=0A=
 > > Implement all the logic to get G2 hardware decoding HEVC frames.=0A=
 > > It support up level 5.1 HEVC stream.=0A=
=0A=
support -> supports=0A=
=0A=
 > > It doesn't support yet 10 bits formats or scaling feature.=0A=
=0A=
scaling -> the scaling=0A=
=0A=
 > >=0A=
 > > Add HANTRO HEVC dedicated control to skip some bits at the beginning=
=0A=
 > > of the slice header. That is very specific to this hardware so can't=
=0A=
 > > go into uapi structures. Compute the needed value is complex and =0A=
require=0A=
=0A=
Compute -> Computing=0A=
require -> requires=0A=
=0A=
 > > information from the stream that only the userland knows so let it=0A=
 > > provide the correct value to the driver.=0A=
 > >=0A=
 > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>=0A=
 > > Co-developed-by: Adrian Ratiu <adrian.ratiu@collabora.com>=0A=
 > > Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>=0A=
 > > Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>=0A=
 > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>=0A=
 > > ---=0A=
 > > version 8:=0A=
 > >  - Fix compilation warnings=0A=
 > >=0A=
 > > version 7:=0A=
 > >  - Improve motion vectors requested memory size computation.=0A=
 > >=0A=
 > >  drivers/staging/media/hantro/Makefile         |   2 +=0A=
 > >  drivers/staging/media/hantro/hantro.h         |   2 +=0A=
 > >  drivers/staging/media/hantro/hantro_drv.c     |  36 ++=0A=
 > >  .../staging/media/hantro/hantro_g2_hevc_dec.c | 587 +++++++++++++++++=
+=0A=
 > >  drivers/staging/media/hantro/hantro_g2_regs.h | 198 ++++++=0A=
 > >  drivers/staging/media/hantro/hantro_hevc.c    | 325 ++++++++++=0A=
 > >  drivers/staging/media/hantro/hantro_hw.h      |  49 ++=0A=
 > >  7 files changed, 1199 insertions(+)=0A=
 > >  create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c=
=0A=
 > >  create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h=0A=
 > >  create mode 100644 drivers/staging/media/hantro/hantro_hevc.c=0A=
 > >=0A=
 > > diff --git a/drivers/staging/media/hantro/Makefile =0A=
b/drivers/staging/media/hantro/Makefile=0A=
 > > index 743ce08eb184..0357f1772267 100644=0A=
 > > --- a/drivers/staging/media/hantro/Makefile=0A=
 > > +++ b/drivers/staging/media/hantro/Makefile=0A=
 > > @@ -9,12 +9,14 @@ hantro-vpu-y +=3D \=0A=
 > >  		hantro_h1_jpeg_enc.o \=0A=
 > >  		hantro_g1_h264_dec.o \=0A=
 > >  		hantro_g1_mpeg2_dec.o \=0A=
 > > +		hantro_g2_hevc_dec.o \=0A=
 > >  		hantro_g1_vp8_dec.o \=0A=
 > >  		rk3399_vpu_hw_jpeg_enc.o \=0A=
 > >  		rk3399_vpu_hw_mpeg2_dec.o \=0A=
 > >  		rk3399_vpu_hw_vp8_dec.o \=0A=
 > >  		hantro_jpeg.o \=0A=
 > >  		hantro_h264.o \=0A=
 > > +		hantro_hevc.o \=0A=
 > >  		hantro_mpeg2.o \=0A=
 > >  		hantro_vp8.o=0A=
 > >=0A=
 > > diff --git a/drivers/staging/media/hantro/hantro.h =0A=
b/drivers/staging/media/hantro/hantro.h=0A=
 > > index 7a5ad93466c8..6a21d1e95b34 100644=0A=
 > > --- a/drivers/staging/media/hantro/hantro.h=0A=
 > > +++ b/drivers/staging/media/hantro/hantro.h=0A=
 > > @@ -222,6 +222,7 @@ struct hantro_dev {=0A=
 > >   * @jpeg_enc:		JPEG-encoding context.=0A=
 > >   * @mpeg2_dec:		MPEG-2-decoding context.=0A=
 > >   * @vp8_dec:		VP8-decoding context.=0A=
 > > + * @hevc_dec:		HEVC-decoding context.=0A=
 > >   */=0A=
 > >  struct hantro_ctx {=0A=
 > >  	struct hantro_dev *dev;=0A=
 > > @@ -248,6 +249,7 @@ struct hantro_ctx {=0A=
 > >  		struct hantro_jpeg_enc_hw_ctx jpeg_enc;=0A=
 > >  		struct hantro_mpeg2_dec_hw_ctx mpeg2_dec;=0A=
 > >  		struct hantro_vp8_dec_hw_ctx vp8_dec;=0A=
 > > +		struct hantro_hevc_dec_hw_ctx hevc_dec;=0A=
 > >  	};=0A=
 > >  };=0A=
 > >=0A=
 > > diff --git a/drivers/staging/media/hantro/hantro_drv.c =0A=
b/drivers/staging/media/hantro/hantro_drv.c=0A=
 > > index d9a3a5ef9330..33b8bd38eac1 100644=0A=
 > > --- a/drivers/staging/media/hantro/hantro_drv.c=0A=
 > > +++ b/drivers/staging/media/hantro/hantro_drv.c=0A=
 > > @@ -281,6 +281,26 @@ static int hantro_jpeg_s_ctrl(struct v4l2_ctrl =
=0A=
*ctrl)=0A=
 > >  	return 0;=0A=
 > >  }=0A=
 > >=0A=
 > > +static int hantro_hevc_s_ctrl(struct v4l2_ctrl *ctrl)=0A=
 > > +{=0A=
 > > +	struct hantro_ctx *ctx;=0A=
 > > +=0A=
 > > +	ctx =3D container_of(ctrl->handler,=0A=
 > > +			   struct hantro_ctx, ctrl_handler);=0A=
 > > +=0A=
 > > +	vpu_debug(1, "s_ctrl: id =3D %d, val =3D %d\n", ctrl->id, ctrl->val)=
;=0A=
 > > +=0A=
 > > +	switch (ctrl->id) {=0A=
 > > +	case V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP:=0A=
 > > +		ctx->hevc_dec.ctrls.hevc_hdr_skip_length =3D ctrl->val;=0A=
 > > +		break;=0A=
 > > +	default:=0A=
 > > +		return -EINVAL;=0A=
 > > +	}=0A=
 > > +=0A=
 > > +	return 0;=0A=
 > > +}=0A=
 > > +=0A=
 > >  static const struct v4l2_ctrl_ops hantro_ctrl_ops =3D {=0A=
 > >  	.try_ctrl =3D hantro_try_ctrl,=0A=
 > >  };=0A=
 > > @@ -289,6 +309,10 @@ static const struct v4l2_ctrl_ops =0A=
hantro_jpeg_ctrl_ops =3D {=0A=
 > >  	.s_ctrl =3D hantro_jpeg_s_ctrl,=0A=
 > >  };=0A=
 > >=0A=
 > > +static const struct v4l2_ctrl_ops hantro_hevc_ctrl_ops =3D {=0A=
 > > +	.s_ctrl =3D hantro_hevc_s_ctrl,=0A=
 > > +};=0A=
 > > +=0A=
 > >  static const struct hantro_ctrl controls[] =3D {=0A=
 > >  	{=0A=
 > >  		.codec =3D HANTRO_JPEG_ENCODER,=0A=
 > > @@ -409,6 +433,18 @@ static const struct hantro_ctrl controls[] =3D {=
=0A=
 > >  		.cfg =3D {=0A=
 > >  			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,=0A=
 > >  		},=0A=
 > > +	}, {=0A=
 > > +		.codec =3D HANTRO_HEVC_DECODER,=0A=
 > > +		.cfg =3D {=0A=
 > > +			.id =3D V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP,=0A=
 > > +			.name =3D "Hantro HEVC slice header skip bytes",=0A=
 > > +			.type =3D V4L2_CTRL_TYPE_INTEGER,=0A=
 > > +			.min =3D 0,=0A=
 > > +			.def =3D 0,=0A=
 > > +			.max =3D 0x7fffffff,=0A=
=0A=
This seems an insanely high number.=0A=
=0A=
 > > +			.step =3D 1,=0A=
 > > +			.ops =3D &hantro_hevc_ctrl_ops,=0A=
 > > +		},=0A=
 > >  	},=0A=
 > >  };=0A=
=0A=
Regards,=0A=
=0A=
	Hans=0A=
=0A=
