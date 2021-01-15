Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FC72F843C
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 19:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730730AbhAOSX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 13:23:27 -0500
Received: from mail-dm6nam12on2073.outbound.protection.outlook.com ([40.107.243.73]:9433
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727711AbhAOSX0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 13:23:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vu3Z/4TCBuBvJ2SQAH1uN4pRyWKYQnOBqbUFv3sMo7F7IChobjYr+QplpIbDqhTuZh3TMg92s6fjZj5uQxroiRWCxhn4g/EROEPDMJNxdOqroFJUJfkaUJzyi3tmv2vhh2Kf01OZid3lXBjkhQryuAT9Of6A1+sqJ3uxDDPo8Hb/ikKkmGjJZfggDuF9mhWHZwRuZlpTjN5tidPIFtXP/ODEXVkDzVgu6qtg06Z10GRqN249e98DGexOzweViLNqqDghVV6SAxOK7pyk6VmBFdF8pxPqThV2CezVk+/iA5OhZil3d2/bw58wKSBj/iQC8phH8f3xSnIYTb34gsqygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/2fFwjIRoHddH4VhReQ51unUjRKXwyb3bfqCJxi4Ns=;
 b=eH+JV5P5ZoQCqfquTpm/a4wI/ylPQ7evhKFtYAiU75Kfv8yIEYg1LikmFBcrsksqJb6l42H9U6as1A5cvg8g98Y+f05LDAjbJ9KQSWpA2sMcCAUcJ4OHTrZxtfJTpUT2a8DMb0AWS4pywWx6rfEdLfjzX4DimVbNlX0Hv0H+IyWMV2p8kkVkMcildkbPneSNMgZkzdOjQ87Gyr1HN4YhwnOlFh++O/7iGRY8GWxUFSlypanKhu8fZKzlNaQDFkACcp7YyymzUpgyF5vog4FxKr7DcPoFKCTcMAA5x3rl/Ln4JjJhnEJcbwlzS0LkFOi194+ElK2FcHh0aAImotcVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/2fFwjIRoHddH4VhReQ51unUjRKXwyb3bfqCJxi4Ns=;
 b=sZTvBt3RHHAH+PSI/tkzBAXbdJBVtMvdkG+9/+S9AlpcOJJKN4v+W2wBLJmSlcAMuNCyuGi4xTNoCVfxJc2bZWNyxmCorRiI/6rgDKHHJE/ZO6+Epe3ik0KxTpfiBZJMcd7oW3KKUTRBoIoF6+rP1vWuP1nvOI4aCWS+kbfoNaI=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by MN2PR05MB6767.namprd05.prod.outlook.com (2603:10b6:208:180::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.6; Fri, 15 Jan
 2021 18:22:24 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6%7]) with mapi id 15.20.3763.010; Fri, 15 Jan 2021
 18:22:24 +0000
From:   Zack Rusin <zackr@vmware.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alan Cox <alan@linux.intel.com>,
        Benjamin Defnet <benjamin.r.defnet@intel.com>,
        =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Eric Anholt <eric@anholt.net>,
        Jesse Barnes <jesse.barnes@intel.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rajesh Poornachandran <rajesh.poornachandran@intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Subject: Re: [PATCH 00/40] [Set 14] Rid W=1 warnings from GPU
Thread-Topic: [PATCH 00/40] [Set 14] Rid W=1 warnings from GPU
Thread-Index: AQHW62obj0fVI1GcekyCGh+XaSu+xqoo/+iA
Date:   Fri, 15 Jan 2021 18:22:23 +0000
Message-ID: <328B978C-0A69-4220-BE63-7C4E4D627225@vmware.com>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50ee5bc2-0ad9-4c2a-57b1-08d8b9828163
x-ms-traffictypediagnostic: MN2PR05MB6767:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6767FFF876C9FAABC3BE1B7DCEA70@MN2PR05MB6767.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d5lMOAcSTCuPt2ObHfeoBLdvQ56cF/u+9Me9YtOeg3wuXemxpyhP0Ev97mDRrN4r7gxB5kupunWc4+SSIk3dlqDA0x9bZ8V+AnkIxXcLLjq+uNcgF8cVCI6NDDS35ihnwMtwCmniJ+/gdJ9oB5AFgnF1L96Prre//gIpKwVBUPb+AzgSH/g0BGPNHoNHLhlKM5vCBHsrnPOO4CZcwmzczGACMbuyLAE6Xk6C8leu/lrYSUujJVteSCnekHNr4VWtifAJ8W6ZKlinZ5i9ixcsRrDDdKu4ZZqn4eADrHVEyJmaOIyBxri8hPzjK5UX+62Lm8JDUZlb60TJzJxM742gupx6WOHG1VUYJez7afgwZ3QiHgPWLeDIVOqODC8zPJmFzys4TJBnPLwe8hM2b4Ao44YrAl0r3gsv9F0bnvEf38H1OoN/CwHHm2JkaCj7r0tr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR05MB5186.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(2616005)(6486002)(6916009)(478600001)(6512007)(26005)(7416002)(66946007)(8676002)(86362001)(76116006)(4744005)(71200400001)(66476007)(186003)(6506007)(83380400001)(4326008)(66446008)(64756008)(107886003)(66556008)(54906003)(2906002)(53546011)(316002)(36756003)(5660300002)(8936002)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?uLqClwNKBPRI9kkxcr8lfcRJVABBVsE1j3qgTUSKaExomJ7geyFGrgBq3l?=
 =?iso-8859-1?Q?/m75CLYsapemBA0zV4wnm3nY02jYw8+qsATe5LpSAyv6VlJIkG/APj0WPt?=
 =?iso-8859-1?Q?Pad0eIss3YpHP/kzhV2bV5AUP2N2pFCl5LOrr/xFsgobY3ngSXJk79ffRD?=
 =?iso-8859-1?Q?h4RT0SOWK+KvEu/r/fEl58Q/k5lQe5Z24SBFFRjfxccPiGieMNt5DmbYaZ?=
 =?iso-8859-1?Q?ywEHUbT3vihamRZhTF9jpwfjD52xxfA6miiOAJRFzu4zbj+RwSXvKR74Vg?=
 =?iso-8859-1?Q?pL+ajZdiU/XP8Og5VuXypF+GN3QWRLhyouZM78TGMgeUi+trskLwd+9LGK?=
 =?iso-8859-1?Q?ZU28uawhIjrpRP4WiUJGuVTulgIrnRCE6jrDjuGm61Jvcx0xNS4dabWGi8?=
 =?iso-8859-1?Q?OPgUxAQ8L2JT2l2MYwpGSDbLdl6a/0yDbsRehnRySWytMlTVzzNtj/TeIa?=
 =?iso-8859-1?Q?1rXfcrLrSmETp+QfikGYPVOabac72oKA9F9in0qHN7HQhDmUm6Xiv2MaIr?=
 =?iso-8859-1?Q?jtGFxqLtvCpAuQVByWdWsaBEVZ9JJm4cFP4AeWP6MY5M0Ip0x8Ix0Ma6tb?=
 =?iso-8859-1?Q?Qj8jNdd0/NqXxViUa404Opxgy0SB7AMJMYw/U6PAbVt8CreX5d3yqDCY6k?=
 =?iso-8859-1?Q?K+lBm6v7+ZW89W2Mguxo8AmO6YvKUP7ffHvcbf2MIpClIDvNNAyrzZYpSK?=
 =?iso-8859-1?Q?ilxnDUVMme7TcCwaRnHW11B6C7vdvNKYRNUkstwkSQGFFP0VgUH9QG5z8Y?=
 =?iso-8859-1?Q?cyXg/UKLV7YbpMZt25PNQU7Yz/I+hnaLckZx6nGbXjO3e9Sz6K6cf/5o4x?=
 =?iso-8859-1?Q?5GiuXW0TWXDfPJ5gKVl/MwufbcFrPGfqqzqA6WqXrs5+uGZjGhVAGZZf7R?=
 =?iso-8859-1?Q?RfqW+QMct/rK2AUX2NFWuZEOIgI3p30Cg1Lrdz80JubQyCMYrKlRwmpnIb?=
 =?iso-8859-1?Q?S+1zL91VT8hW+hyE02xTmG7EDtP7os/FJtREO1o6Y+RhdQbIX04K6rQqEJ?=
 =?iso-8859-1?Q?g/zbVbg6wXjGRwx3/xq8FqiXPrnwbWz86Bzb8l?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <36CCA5774A50AF498A8CBE711FA4BBA3@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ee5bc2-0ad9-4c2a-57b1-08d8b9828163
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 18:22:23.9933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cm4QIsyMV8IbBxLtVU04P9F/Oezo5+nZAuZ+/nygvHpX4T60X5r0vgZ3rQJQGqfwfGx0EN6UJYd5Whf676kjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6767
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On Jan 15, 2021, at 13:12, Lee Jones <lee.jones@linaro.org> wrote:
>=20
> This set is part of a larger effort attempting to clean-up W=3D1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>=20
> Penultimate set, promise. :)


Thank you for all that work. For all the vmwgfx bits:
Reviewed-by: Zack Rusin <zackr@vmware.com>

z
