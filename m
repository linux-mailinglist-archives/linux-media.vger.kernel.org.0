Return-Path: <linux-media+bounces-29913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1538A8424E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 13:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E6216B8FB
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 11:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B572857C9;
	Thu, 10 Apr 2025 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AjFLg7sn"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F56285418;
	Thu, 10 Apr 2025 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286094; cv=fail; b=c6QTQEtLDSSG4VTKPDioo4eOcFWQFY2Ufu5N0pAPemTBmnkMUbgnww4GDEbkQkNOGNYEiJilbx/x7r7W6R+RJioSMI1KAtLNHZdlHRbyY7it5uGpyoN9BGpwes8MxPFB46cVKMsQIhnWkTTdlwJ+GpkYY6jUJ0Ko55FAVlxn5BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286094; c=relaxed/simple;
	bh=eBU78YFNuQQdWhN29RGijb3DVZIh8d4e7mtX6Nmqjzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WU4mCoyuWcjd7igG5WvmsSzP2sMsb2TREKZYGBqK6Wp7xTEGOUa66aImcvHnwAv1+bsCaUy0O91EuW7FXu8eF9Eg9UFn4XuS7Mzu/1VNbI+RqG78dW9xGRp6+Jqep5lB9P9NpXFZg0Lb3Tun86RcNDB6U+tgdCvR9Wdbgo1JG9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AjFLg7sn; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slFejnNn+DqW8CIx3MYMYWZWaoEmNNM3qFHt3EGDlGP5zo86qYKvvwX5ug5P/pp/+xMBRN9z44Yr0Ojc8K9IFBv+sRA8BR95jmt0VDks6IuNCr694H11vlGJ0V8vMYWZsRTwur30I94rqoohzU4aF0gMNoo6mHMYSQjHOvqzizrZ2fwl1kcy/u6qIn7GgeSx3+oN71422nDuvp2hm4FWDGwTkR7Qt1FZQH1Jz8gzUVodS7zW40Q1a9DUHfpcfiAK8eN4eKtxoLNdFCs182wCZippxpVXd8DP0HZmT6OEe8T09JzSVyzgl13suiCjX4OOq0sTW3YVj2TQxD61WxuHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdrS1eclmd8AGvkSUiXwy+TYEENbod13WOU1HqwKxns=;
 b=c63wfoqgZcXuXe2SJebIzbO5FSXMJO8oNuLWQp2Up8xlmYaIWiE8A34PH/R8YLjoEoNyMId3Go0Pqz5Hn/G6qBO3vRleVDutQl92miRbJaOYBJY7VlKmk+T+JQVC8XOYHkXmPBJ2z9QIHCob0XSBLHfdLcrNrey3I0UqqVBV/yanzUvLsY9l2D62hbGrmuwU5FsJQZxRaK57CLxxaICEgKIsnBa6gePFP0IgXDnwpfNAecFYYA8rQdT5BCBVRxLDS1JqbFwXxJUF9BIPJ9OIptxnvj+sKJfIjuqM1shAcdw70rUhNqks7W1FqoGlwMEodxPbXMeISqSvZSjLrKy7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdrS1eclmd8AGvkSUiXwy+TYEENbod13WOU1HqwKxns=;
 b=AjFLg7snXvJXhjMjayTUyeyly7e3ThZYizWQJhRdKpNLiZ3Y2Zov9YK/Ql6sCh7hiwU2fO8gxIlfAG7BD/8lA/pwtA7nDt5/qRw3F8RMNhLx3rRTdB8GiuldlmfIjSAF2niexLBW+uxcFCeRfCZtOeUDlclVW2YDgOtRYMNmqwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB10993.jpnprd01.prod.outlook.com (2603:1096:400:3a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 11:54:43 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 11:54:43 +0000
Date: Thu, 10 Apr 2025 13:54:26 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/17] media: rzg2l-cru: Add register mapping support
Message-ID: <Z_exclFsFse2z3Mr@tom-desktop>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
 <20250410081300.3133959-12-tommaso.merciai.xr@bp.renesas.com>
 <20250410113625.GB27797@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410113625.GB27797@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR3P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB10993:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bb111e-f525-4208-e484-08dd78267bb9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?bYEBCupDdYeeuJAW8+OoBknpkgoKhW2eMNhxqrW4NgKsNlDFWB+ivXBiPa0r?=
 =?us-ascii?Q?Thbfp0G28l9luDyJFc8NOv63af9cNNyO2FIcwGpSzl7kq/6O/ROkWLehfEGm?=
 =?us-ascii?Q?3fHtGL+U9V4KNdlnYAbRXKKYEWF6yJSUjq/ADuWAXvXqrG0cibM+Kf+ZMIEK?=
 =?us-ascii?Q?5wY7cgZc5KXbJ3Rqh5LUQONfLzaIRFSEfP2exGsaKoulAf5sjmEVcwdmCWLv?=
 =?us-ascii?Q?f40M6PrzK648YUVYmmbe5edVgbeVC5qvsYcIidpQEM8fv+GarcOFca4Ib0kU?=
 =?us-ascii?Q?qxkTmAvqQTr3o9IDuvwQmyFj666XyMwc+TwjdWSrV2LPfsGGkZXCLmzyCsLQ?=
 =?us-ascii?Q?pjuG5DrO/9d+Kj8qjqFjuAHE2+NxFO/7wRy8YL98uWIczH4dxo7gAhag8/0e?=
 =?us-ascii?Q?FzMy9UHnrbUk+7FXZDIRaXSuZfU+Z1NyvtVG9/MAEX5B8a6w+JOAZnQ5igOK?=
 =?us-ascii?Q?nbE0J16rbo29PDddbz6EDp7v7JztmoVs0fwmq1j4H5FJG1aa6O5ONUeT9ryX?=
 =?us-ascii?Q?yN5/qeymUb66rU+Px51XbCki/ceh/KBTnfm/QMAk3ixyPDdKtBVQjg9gNq1s?=
 =?us-ascii?Q?c45CqmTfMzLKn18Jn7oIQQRbKB4sO11b4cxTHR8TmdRrHQ1FUC6ZY+pA9KZV?=
 =?us-ascii?Q?I9oOEBiiYHhO4jbVepEhxmX/vTlChUnyoTSILlpiNZ7JLxG7xde16hQJelfv?=
 =?us-ascii?Q?WxvPn3PXUkDRSsb8qUYPb8kJv2Zt5iFkyN0juVyZhMeq9AT/PiKoHjZoEk3O?=
 =?us-ascii?Q?2vE687rfBXQmwverYRaMEaY268iqSdn7cDeYSzzc3PzN7WPMGL0RFdf/cdrv?=
 =?us-ascii?Q?RqZvJ0O6Xvjdq3YPtAWjtTYohmEHuJDXMrcpfpC0hF7kKFaIH/BQvMLVdLZ7?=
 =?us-ascii?Q?81tTmUQpoFB9K2Quw95jEa6O4jHiErX5YKil/c4V8QSaTYLw18kTwr1zC5Nx?=
 =?us-ascii?Q?V/vBxAWUZSeBwYg6Z+7O3dUDrPzILVz+crzgeGN0BYE2bx+D+YwUr77ucmJ3?=
 =?us-ascii?Q?8dDcmgO2QJ2jgJowQsFbckZ5mxvcXQ6iNv09smtueTPA0Ge+IaBSY6bfGWW7?=
 =?us-ascii?Q?HgMS9q1/mjIP0kwSxdnJpXj0nj65CC+/p3aPx2VQn8TmthvjBdhrxanXHF+E?=
 =?us-ascii?Q?OAMTtFkij5adGFcUC7PIiid0oxQOU70dKAaKw0s+rOF5rJK2FCDwf1GZXWo3?=
 =?us-ascii?Q?8/WriXiiqVmvDQlm3Xe1NXgndfNP61PLFMLWsQ/uYnLmJOSFURdlrFj2BtsR?=
 =?us-ascii?Q?EQRhCtebLWxYVw2XIcyNbuyn5LAEdw1oUtAlVl+MO+2MdDWOTFeuMauboS9s?=
 =?us-ascii?Q?BjXtFcB3RC8i7SGl9pN8+XX1XqxBJxSvxR8TYObmWegu0yvghVKKycFU7fRp?=
 =?us-ascii?Q?6ZMA0owEkd6rzTx9a5jT9rFIpovalYnVQygV1jnDj7s8/dG8sjhsutoCxC38?=
 =?us-ascii?Q?bYJQ6HTqyjclcX3MIO/HXpR1136kouL6?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?HCD3UPTFg7AbW9PZKKE8n67I8MJUdD1zY1Xtlk8A10b0Z95YQNH9bNJv6meb?=
 =?us-ascii?Q?XcC7h9wSww+2iwJREjUXL7zoXYJrEIw77Ib9gVLfPSFHSb7VidvSggBIQ9w4?=
 =?us-ascii?Q?E+9ywwKDLXPrF/+HVz6bRp4qhISXQ4b8U3z+XcJHPvt1rUmAIE1FMS4IgNoY?=
 =?us-ascii?Q?a+lRZj2TfmFhdhZhAjpqBhR77C/MuB1Yz0PXJWJEi2t1cOwIybuzzkBX8bCO?=
 =?us-ascii?Q?9lFqf1RQdkLtA9FnVtBGQgTrvOmAO6tcDqMeBrpAQndj+iC8Xim1ST6l91NL?=
 =?us-ascii?Q?mIBh9jaZqV3rNYJo4ZlbZnjDv3ukXvD3glDU1K+Ndpl//JE5qisuQChN0lJq?=
 =?us-ascii?Q?Dnbtf0n4USmwhyqn0x7uq1INzpduuNB6Ira+hSztomVnHq8PJS/4ptK4VcTO?=
 =?us-ascii?Q?vElEuM9nfhxwL4khntxkQL4G1fKaLK/EL6v+l6UJASVi7RvRlmkmvk580I0/?=
 =?us-ascii?Q?V0dHmLbLdx6EezRNZm6cvrI5erI4z7RLDWMbuBPhgDM6V1gh83yBuRIMPgaE?=
 =?us-ascii?Q?zjNZML9esQovRX0RybAhx2ueefMQPzCqq0z7sAi+q7hBJn4PA9682zj4io8f?=
 =?us-ascii?Q?6KC2QAAhR6/dp4BfwsKJBOmnqdRE7u9EMSCUNYENgp3H4KAUDKPf5oFwobeD?=
 =?us-ascii?Q?Le0s7qT+j08+rGXBDYjFiroCRBjzL2FLwyWqaxmGwNWsOeE8LLzkJemgNJL4?=
 =?us-ascii?Q?N3hm9Mw8EmbjGe9LDZxZa5tCrNctCgJW6huwscrYRTulrmns52Mj3okrADOt?=
 =?us-ascii?Q?Jl3tXF8ugxPy8POkDXuvuFIHOXT1jK3zwjNU9kNszSLlq9fDrnaB4wIjsv7p?=
 =?us-ascii?Q?Cf840QMzjM7etxZ/dVB/ApyyDnCAHnXbehnEH5CGWZOo5VEacHI2RHnyxdHE?=
 =?us-ascii?Q?lc7CDnOCO/CLr82G3q8LaIhlFA7Y28/4Sn1Gt2Ur1vpTzuCkDfbFDOHFMa3w?=
 =?us-ascii?Q?Tb8ayQeYbBXQzlqYvU15tVuRZ+gGnu4cClVzZodik5gkDpYe58NBmdFg18Vx?=
 =?us-ascii?Q?UuVyjbbSiMkVKqxLYWEgfbRHl/26iLIRURK6jF0zyX3zEef2LABH53JR+wQH?=
 =?us-ascii?Q?8r/oFBij2LANNX5ocR9RxOi/Y0mHKZ/tgpbvJlL02fK5z2iEgDBa+r5IgRDA?=
 =?us-ascii?Q?i/Ix8Gk9hI72jcHlVMjXqxVHD0cm8GAyu2L59PgFzGZ2YSm1OAjuJJ9Mb7vp?=
 =?us-ascii?Q?6DfJcqwXEn7zgD+ARjCxBoHyu3BWMiwAK5CovF11iXRs0Y/h7Wr7n1nLkucu?=
 =?us-ascii?Q?CjLtGZq32OvyRiIFMUxc1wi0p4G2Klwd0k4sFAeP8v4BrG0zc3N6wtyyxHDr?=
 =?us-ascii?Q?Cua+wFr00nMMuyySjqOZowGzgzWOUUysDqhRiiGToLJLKA5/KgYcTjZcbZib?=
 =?us-ascii?Q?fQb/+HMyDW64Ga8+rkdP8bNHGTW4AQy1Eza5sG1PPTIZNZ7GsNY4UfsVovKn?=
 =?us-ascii?Q?rZWk7Ci3czxgx/13xOWB1QVwknSCOwPGQetK/5URAU1zYXBmWXeOUiRzTnzW?=
 =?us-ascii?Q?BGtQO+4Rttc0j5eUYVh5qaql9rhT8LkNb1vou8uxk9mfrXtWY4hJ+ZOVx40D?=
 =?us-ascii?Q?dtgqo8nGD1Kz8bIwnDzdXxPGtvVfVNvJOAI+xgF3VWj4qtyD1TWY9JtpmME/?=
 =?us-ascii?Q?nTV4sKlcxer/Ecxkx86c3sk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bb111e-f525-4208-e484-08dd78267bb9
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 11:54:43.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xect7N3qGZljHaI2SncAyWmLCnYm6CCVUM508t5G8X9nT2YQ0RB9ubP7FfAUJPqLzyA1nO2xd7Ngp+CJZuG3W6LXtkIVtpmeRwTKxB2Dd4R68otBy0DB0uuCup6dyiRe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10993

Hi Laurent,

Thank you for the review.

On Thu, Apr 10, 2025 at 02:36:25PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Thu, Apr 10, 2025 at 10:12:15AM +0200, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
> > CRU-IP that is mostly identical to RZ/G2L but with different register
> > offsets and additional registers. Introduce a flexible register mapping
> > mechanism to handle these variations.
> > 
> > Define the `rzg2l_cru_info` structure to store register mappings and
> > pass it as part of the OF match data. Update the read/write functions
> > to check out-of-bound accesses and use indexed register offsets from
> > `rzg2l_cru_info`, ensuring compatibility across different SoC variants.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > Changes since v2:
> >  - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
> >    accesses as suggested by LPinchart.
> >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
> >  - Update commit body
> > 
> > Changes since v4:
> >  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
> >    as __always_inline
> > 
> >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
> >  4 files changed, 139 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index eed9d2bd08414..abc2a979833aa 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -22,6 +22,7 @@
> >  #include <media/v4l2-mc.h>
> >  
> >  #include "rzg2l-cru.h"
> > +#include "rzg2l-cru-regs.h"
> >  
> >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)
> >  {
> > @@ -269,6 +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> >  
> >  	cru->dev = dev;
> >  	cru->info = of_device_get_match_data(dev);
> > +	if (!cru->info)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "Failed to get OF match data\n");
> 
> Can this happen ?

Well, in theory no.
Good catch.

Will drop the if (!cru->info) check in v7.
Meanwhile I will add your tag.

Thanks!

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Regards,
Tommaso

> 
> >  
> >  	irq = platform_get_irq(pdev, 0);
> >  	if (irq < 0)
> > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> >  	rzg2l_cru_dma_unregister(cru);
> >  }
> >  
> > +static const u16 rzg2l_cru_regs[] = {
> > +	[CRUnCTRL] = 0x0,
> > +	[CRUnIE] = 0x4,
> > +	[CRUnINTS] = 0x8,
> > +	[CRUnRST] = 0xc,
> > +	[AMnMB1ADDRL] = 0x100,
> > +	[AMnMB1ADDRH] = 0x104,
> > +	[AMnMB2ADDRL] = 0x108,
> > +	[AMnMB2ADDRH] = 0x10c,
> > +	[AMnMB3ADDRL] = 0x110,
> > +	[AMnMB3ADDRH] = 0x114,
> > +	[AMnMB4ADDRL] = 0x118,
> > +	[AMnMB4ADDRH] = 0x11c,
> > +	[AMnMB5ADDRL] = 0x120,
> > +	[AMnMB5ADDRH] = 0x124,
> > +	[AMnMB6ADDRL] = 0x128,
> > +	[AMnMB6ADDRH] = 0x12c,
> > +	[AMnMB7ADDRL] = 0x130,
> > +	[AMnMB7ADDRH] = 0x134,
> > +	[AMnMB8ADDRL] = 0x138,
> > +	[AMnMB8ADDRH] = 0x13c,
> > +	[AMnMBVALID] = 0x148,
> > +	[AMnMBS] = 0x14c,
> > +	[AMnAXIATTR] = 0x158,
> > +	[AMnFIFOPNTR] = 0x168,
> > +	[AMnAXISTP] = 0x174,
> > +	[AMnAXISTPACK] = 0x178,
> > +	[ICnEN] = 0x200,
> > +	[ICnMC] = 0x208,
> > +	[ICnMS] = 0x254,
> > +	[ICnDMR] = 0x26c,
> > +};
> > +
> > +static const struct rzg2l_cru_info rzgl2_cru_info = {
> > +	.regs = rzg2l_cru_regs,
> > +};
> > +
> >  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> > -	{ .compatible = "renesas,rzg2l-cru", },
> > +	{
> > +		.compatible = "renesas,rzg2l-cru",
> > +		.data = &rzgl2_cru_info,
> > +	},
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table);
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > index 1c9f22118a5d9..86c3202862465 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > @@ -10,71 +10,77 @@
> >  
> >  /* HW CRU Registers Definition */
> >  
> > -/* CRU Control Register */
> > -#define CRUnCTRL			0x0
> >  #define CRUnCTRL_VINSEL(x)		((x) << 0)
> >  
> > -/* CRU Interrupt Enable Register */
> > -#define CRUnIE				0x4
> >  #define CRUnIE_EFE			BIT(17)
> >  
> > -/* CRU Interrupt Status Register */
> > -#define CRUnINTS			0x8
> >  #define CRUnINTS_SFS			BIT(16)
> >  
> > -/* CRU Reset Register */
> > -#define CRUnRST				0xc
> >  #define CRUnRST_VRESETN			BIT(0)
> >  
> >  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > -#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> > +#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
> >  
> >  /* Memory Bank Base Address (Higher) Register for CRU Image Data */
> > -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> > +#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)
> >  
> > -/* Memory Bank Enable Register for CRU Image Data */
> > -#define AMnMBVALID			0x148
> >  #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
> >  
> > -/* Memory Bank Status Register for CRU Image Data */
> > -#define AMnMBS				0x14c
> >  #define AMnMBS_MBSTS			0x7
> >  
> > -/* AXI Master Transfer Setting Register for CRU Image Data */
> > -#define AMnAXIATTR			0x158
> >  #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> >  #define AMnAXIATTR_AXILEN		(0xf)
> >  
> > -/* AXI Master FIFO Pointer Register for CRU Image Data */
> > -#define AMnFIFOPNTR			0x168
> >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> >  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> >  
> > -/* AXI Master Transfer Stop Register for CRU Image Data */
> > -#define AMnAXISTP			0x174
> >  #define AMnAXISTP_AXI_STOP		BIT(0)
> >  
> > -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> > -#define AMnAXISTPACK			0x178
> >  #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
> >  
> > -/* CRU Image Processing Enable Register */
> > -#define ICnEN				0x200
> >  #define ICnEN_ICEN			BIT(0)
> >  
> > -/* CRU Image Processing Main Control Register */
> > -#define ICnMC				0x208
> >  #define ICnMC_CSCTHR			BIT(5)
> >  #define ICnMC_INF(x)			((x) << 16)
> >  #define ICnMC_VCSEL(x)			((x) << 22)
> >  #define ICnMC_INF_MASK			GENMASK(21, 16)
> >  
> > -/* CRU Module Status Register */
> > -#define ICnMS				0x254
> >  #define ICnMS_IA			BIT(2)
> >  
> > -/* CRU Data Output Mode Register */
> > -#define ICnDMR				0x26c
> >  #define ICnDMR_YCMODE_UYVY		(1 << 4)
> >  
> > +enum rzg2l_cru_common_regs {
> > +	CRUnCTRL,	/* CRU Control */
> > +	CRUnIE,		/* CRU Interrupt Enable */
> > +	CRUnINTS,	/* CRU Interrupt Status */
> > +	CRUnRST, 	/* CRU Reset */
> > +	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> > +	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> > +	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
> > +	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
> > +	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
> > +	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
> > +	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
> > +	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
> > +	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
> > +	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
> > +	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
> > +	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
> > +	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
> > +	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
> > +	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
> > +	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> > +	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> > +	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> > +	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> > +	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> > +	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> > +	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> > +	ICnEN,		/* CRU Image Processing Enable */
> > +	ICnMC,		/* CRU Image Processing Main Control */
> > +	ICnMS,		/* CRU Module Status */
> > +	ICnDMR,		/* CRU Data Output Mode */
> > +	RZG2L_CRU_MAX_REG,
> > +};
> > +
> >  #endif /* __RZG2L_CRU_REGS_H__ */
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 8b898ce05b847..00c3f7458e20a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
> >  	bool yuv;
> >  };
> >  
> > +struct rzg2l_cru_info {
> > +	const u16 *regs;
> > +};
> > +
> >  /**
> >   * struct rzg2l_cru_dev - Renesas CRU device structure
> >   * @dev:		(OF) device
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index cd69c8a686d35..c82db80c33552 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -42,16 +42,66 @@ struct rzg2l_cru_buffer {
> >  /* -----------------------------------------------------------------------------
> >   * DMA operations
> >   */
> > -static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> > +static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> >  {
> > -	iowrite32(value, cru->base + offset);
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	/*
> > +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> > +	 * rest of the registers have valid offset being set in cru->info->regs.
> > +	 */
> > +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > +		return;
> > +
> > +	iowrite32(value, cru->base + regs[offset]);
> > +}
> > +
> > +static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> > +{
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	/*
> > +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> > +	 * rest of the registers have valid offset being set in cru->info->regs.
> > +	 */
> > +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > +		return 0;
> > +
> > +	return ioread32(cru->base + regs[offset]);
> >  }
> >  
> > -static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> > +static __always_inline void
> > +__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> >  {
> > -	return ioread32(cru->base + offset);
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > +
> > +	iowrite32(value, cru->base + regs[offset]);
> >  }
> >  
> > +static __always_inline u32
> > +__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
> > +{
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > +
> > +	return ioread32(cru->base + regs[offset]);
> > +}
> > +
> > +#define rzg2l_cru_write(cru, offset, value) \
> > +	(__builtin_constant_p(offset) ? \
> > +	 __rzg2l_cru_write_constant(cru, offset, value) : \
> > +	 __rzg2l_cru_write(cru, offset, value))
> > +
> > +#define rzg2l_cru_read(cru, offset) \
> > +	(__builtin_constant_p(offset) ? \
> > +	 __rzg2l_cru_read_constant(cru, offset) : \
> > +	 __rzg2l_cru_read(cru, offset))
> > +
> >  /* Need to hold qlock before calling */
> >  static void return_unused_buffers(struct rzg2l_cru_dev *cru,
> >  				  enum vb2_buffer_state state)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

