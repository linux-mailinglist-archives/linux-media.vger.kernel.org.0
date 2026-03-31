Return-Path: <linux-media+bounces-57806-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADOTL4j/y2kJNQYAu9opvQ
	(envelope-from <linux-media+bounces-57806-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 19:08:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2166136DF13
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 19:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B72CB3150F08
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D154266B0;
	Tue, 31 Mar 2026 16:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="X1Jo0z3V"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50CF3E3C5C;
	Tue, 31 Mar 2026 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974749; cv=fail; b=pNdClVS5z0vFEPrUEa57O275a9Se3/1sL3SKBvTKZSvZqaqGDzpmffIKncudFkQ7YvBvL4ZiMlQecz5m4OrHCaV08vdrT2LEXUb9y9nGGNcRR3A9CLj4r0dS9Cz3OyRDXlQ68kgwFwO0eBDfBQuKUD+TmWSBj/CSXnJouZYf1js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974749; c=relaxed/simple;
	bh=oNaebwW3Uj+RRbwoWcnMLSjTJSedpf4c+GO6k4C8HCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BoBznybf6GpWjJggT6IxG1u+qPmOIrxyp6CiL15/qJhucK6vYFrzDmUHrW6hYH0xAJ7r+VdTgavLdn32XunomWLVt0njlVjkMY0wI2dQOYDg0M+y4EMPeFJXvjS2CiW3zp7/zY9uOXOhReIJrtB/OWWXFPPkqRmxajz+Ewh9/Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=X1Jo0z3V; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgMoTqUHsBjdyEgnjlB7odomgEmwwz3jC2LuvXxO7959op8Ou5A2J7iHo3ExQdysEnO+YCMSQ31GvRBKq076URSgmiqaSEzy+m/NhD5KO7jcITigKKdjYbscJnmAUg128lxnUe8QgfO2lm19nlEq+z7th1keqYCso/M3StlYegF7oKRd+Z6lsMIk9CKi3L8BxImkBwZO3soLhb7pZ9zIYewa22qXszX1U8c7COxeEYZrtjehnF45zJcx91O0NElCA5eeUXi2En3nYq3h52itgqzR9YuojZNzLIvbLA1Yvr5LjozWLBtMiqgTPIpNcCXk5kSkJknBHoTPKgO3KMOGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVLJCaWiXwXcErOx5CXNpblSZ6YIFm3mEukHhSLj3ro=;
 b=rQ4GG0iIhsTeOeuxKWK8Z+9AMSA3/q6khvW29HaT4feyAdU5JfOTkixg5IjWT7MhCRa0mboGfE8Vau2np19p9dNydE9EXcNNK3GeU3YAqAaUTo01aBoCQwEEAfajJBwEx1uVwFnjdMZsjl8L03/WUwVH1yk9ktlccRwJjEVoysDJb9s+CYBOLddrTQ6O+Ps+dCAT7cC9/qqkd6l66tnDZR0sGfo80y/cLq2qutAGaRTsrA8ain4QWT1XtqvGO2Sb3UUPPAHvQVTIz28mzKiUGq/ZPIhZkagditij1xY98y2Njv331eKMLZC9aaawga2e16byAGwoSG43JICSUNd0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVLJCaWiXwXcErOx5CXNpblSZ6YIFm3mEukHhSLj3ro=;
 b=X1Jo0z3VwMj4Sekpmv3fBoOHdKdzPELeVQWFZ/1d1ANTb0TU7CV6owCXvOlrJ1/iH6ixaCBHZuompzvj7KPokMvkqhtB2It8U0jIxAHgt/CPbQQ8RDg3UcCnOFycuTWml6J0EAn3INlFSwXytVFLM+THsZVq4uS6eqHxTleDVCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSRPR01MB11646.jpnprd01.prod.outlook.com (2603:1096:604:233::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 16:32:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 16:32:25 +0000
Date: Tue, 31 Mar 2026 18:32:14 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 13/15] media: rzg2l-cru: Remove the 'state' variable
Message-ID: <acv3DqFG3SxjyHY5@tom-desktop>
References: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
 <20260331-b4-cru-rework-v2-13-f94b238b35d4@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-b4-cru-rework-v2-13-f94b238b35d4@ideasonboard.com>
X-ClientProxiedBy: MR1P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::22) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSRPR01MB11646:EE_
X-MS-Office365-Filtering-Correlation-Id: 2535eeb8-bcad-468a-5084-08de8f431731
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cZkfcRpEBpba92y5fp86tTpdqdK3fCo+bVAH3lgNsiYySzZ5fY7wUltgW9ndM7CpF1cw42ylTsgLCtX6Fnb4n1hoFmSSxcAR08xTzrk5lXP3z5Xz43ewUdqQ0xdFMRedhN4irq0Tp6YT5/1VFjYDEtQhyK8clqduUSDFBV3XKdeq18wixkj+AcflztvNN1+eJ4TRwhiTIY5oIFH4hl/HeboSd3xqgkz+jV6VrM+lC7M0UBapADHuWdixp7SW2Qkfyi0jB2Akwyes+2Fvrsp0JrarBCPkige/Db5EACF/RUczak9YkFgqkQuWxNAdGPjLKXowkCiNmGBo1rKi1nhm8IHAMNs0yWRNrPEsFykZr/62qKWhwyehcmPlu4XLjQj9YwHRZ6wivrMtkgs3WsS4Zs6N/Fs/Ze8yHIuaNvB3xpp5HN7elIDjGK+z28QUyh1bCsg5oJqthgMLmu06WJBlqPlUppJ5bQoBHbD4A54XxWMNwTpWddi1sjS4iLYC6ei9pY9KQ86dp+TuGRSQjnD4bBGuzEJLNc3ef2dXQZbvOp0QKiwcDSHiROIEFzdf+cFMcFSFEkb5Xw4y3dHrytO6b0l0PsKKUB3WdDIoa0VWENBMe1xsarOfux6GhLVT6DLYVvge8Larc8AhPAjAkgX89+0Mkaj3/PfdOpWtAXbbxS3A9fdL2hCkd7K6C4Dy9d7MnqkD1kJOSRM6F8HLrv+7pOddcvpPgYihfkXce7scsfk4q0agUhsPv/QiIAOOl2T7c/hlZmySpxwAfxVYv7iLoLJD0qvYVcoQ0wbNr79HTEA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yfi6048RRtCcxz/szVRE/D70Dz8lDY+GggpB6hhSr0ZKwskL1pOkTIOTGUEW?=
 =?us-ascii?Q?+jyO1j85Z2cxXHarRBTRMQqIk5Nw6vxEDC1k0FeTvHnZGdlzz4OVWMtoy8Jj?=
 =?us-ascii?Q?P2UJXEcYf4HgqFtIq63iNrSodH/1rGdmyfgyAxeCQUsMdLj+eRUNbL6BGwJI?=
 =?us-ascii?Q?1EccQ0IlfyYVtNpIHm/Go1rH7Tp3IZaAfW3TyKpLNDljGarQ/gpFxpNWA33d?=
 =?us-ascii?Q?0xJVGY31kMPOkZ/PU5eqM4ms7TIhqZs1uJqbj0MPXVqBtnyEGcmiKGwaPEDf?=
 =?us-ascii?Q?gUhn4YNe1qkJ/FziJLfW+MKFA7RdNv0W/b3gsvJZDZkC/CM+9UcUOaabV1nt?=
 =?us-ascii?Q?psuZ/IlLlbIFGCSYdLOzp8i9OyzDTqpmO3sxnwcaUEJqlF/UOK+0WqUQimlw?=
 =?us-ascii?Q?OU9TLM0KV2l8bTueBdR8hEjVHen7H5+ByFmsnzq8ucBCbW7tUDgYArMQN3do?=
 =?us-ascii?Q?VR18y/xcykbsrw5hoHPihh1Y01VIEpW1MyVvM/m1yRqVpQipZ7zGJs6pLXZl?=
 =?us-ascii?Q?IkRDTbhQIBJvTABO9F38BeE8ZCwsgK+HthuAHVW0y6SOqQ+gVDFpjs2/JUdB?=
 =?us-ascii?Q?rQJkak8sIuc3/hK6e4uDKlVxl+UtaM0dw/19T0cghyordzl8RFQHBdInbUJQ?=
 =?us-ascii?Q?BzqdBI3l19VNqMOKcEB4FCnORKclCzc8LTLsMtQcZjpP7fNtX7/vPlNdulvG?=
 =?us-ascii?Q?doX9OzyUaXm2FuvJUA8YRYCzGGMF+Cx10UlIwXc2PwhGmPfW5G7cNyRc+k1e?=
 =?us-ascii?Q?tFVhlUF0TRWMwlumaOnWxQhCll8bOZwy+JJ0tL0g3zMXWfRmBSKDGyvpSrOv?=
 =?us-ascii?Q?DBuEm5Mf444G0xiQW4lz5hEA5T6jbkPjVqFyhOnRpaNDDr/n6c77XZlu1THd?=
 =?us-ascii?Q?CowKgrK8jOwJliQers+9QisJKgrDEa6PxWX7sGAqd9lOH6RVZwL3iadTJcTY?=
 =?us-ascii?Q?Fx0rY4xgt0U8PoSMTF1iTNuYfdFKyO5M/dYgaou9RcUPmsWQtdA/K+5R8E86?=
 =?us-ascii?Q?7NNz3nzkzlKG7yuOcFmKf90Iyx3Nr7CspGUTnDFJthqkSmBRobH+Qj0CsPlU?=
 =?us-ascii?Q?xI9EFc8O5pKgNnqFvptrbxLVDgIc3pxNTu4CQe7TtC8FUY5Zy4lwGOYkKY3d?=
 =?us-ascii?Q?uJJtHlQ4RHNoEK1LSXp69OF8yAuG+LgKiHyi/XXcRE8M46bWrRlkA7uBHNRF?=
 =?us-ascii?Q?zo1eDBpIO+gBHH2LLEBj3pLS3aLbRVCYxXOtU7Mpkw7pyqCkTIkhEL0GiLhO?=
 =?us-ascii?Q?I+f+Nsyf1hYf0PGORBi9pya9RP6WvwpIFmAp+tkqVXK09OSNG7Bn+GpObkUF?=
 =?us-ascii?Q?2AskvAIXxC5Z79Zn67WhgbI/eq4mQbg+BvEO9dKDtazEpjMMhdEXTSccTLhq?=
 =?us-ascii?Q?0Vyf1kx20yVgENkWnxOM/bDRPwxbj5CkNd0lOc9vVjZT7602M7zO2TIsR6bZ?=
 =?us-ascii?Q?60t9PHQdZde3CJTlTHySVrE8574ztGN1UJGvoO8AwYK0CWSgLRZfcWvhAMPI?=
 =?us-ascii?Q?EeAkiWjsB+GXXmUoDjTpmcNJYhFeu4WKUfbmg3n5rQNzdbwPG9qFdeh8EYDn?=
 =?us-ascii?Q?ngZ9XfB8+Kv2mHS+7gn+9G6pYDVHTz9G5Occu7p4ehF7Myn3CH4gxVGSWLA4?=
 =?us-ascii?Q?HUnJlUutzJqws0Blty+sSYBNQExTbdaKPUwilWnPAhunS79HuELw766b74LE?=
 =?us-ascii?Q?cXFufEzrBecRH2sIeAMLdhgHa3WKJihwUK3Is/3er8hoL/Vg/2y8/nzRlBxH?=
 =?us-ascii?Q?5AGEUtaDsT0u/z6DROQhanguUb9+VnOc0VzewHRkc5PAqQUejuwo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2535eeb8-bcad-468a-5084-08de8f431731
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 16:32:24.9858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjoL6GROXjJpnGrihWGP6ctSHkMysMr2D+eiBu2l/pVyGUeuvDTYcNVm1CMF0fq7DEiLduvs5BjvgeQRnuSU0vjU2wHC34+7Ew+y9IHGI3s09L8DKMjRtfl672YKNQBa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11646
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57806-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 2166136DF13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Tue, Mar 31, 2026 at 12:27:43PM +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The cru driver uses a 'state' variable for debugging purpose in the
> interrupt handler. The state is used to detect invalid usage conditions
> that are not meant to happen unless the driver has a bug in handling the
> stop and start conditions.
> 
> Remove the state variable which seems to be a debugging leftover.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 15 -----
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 71 +---------------------
>  2 files changed, 3 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 25f17069585c..5bf334e173d2 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -38,20 +38,6 @@ enum rzg2l_csi2_pads {
>  
>  struct rzg2l_cru_dev;
>  
> -/**
> - * enum rzg2l_cru_dma_state - DMA states
> - * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
> - * @RZG2L_CRU_DMA_STARTING:  Capture starting up
> - * @RZG2L_CRU_DMA_RUNNING:   Operation in progress have buffers
> - * @RZG2L_CRU_DMA_STOPPING:  Stopping operation
> - */
> -enum rzg2l_cru_dma_state {
> -	RZG2L_CRU_DMA_STOPPED = 0,
> -	RZG2L_CRU_DMA_STARTING,
> -	RZG2L_CRU_DMA_RUNNING,
> -	RZG2L_CRU_DMA_STOPPING,
> -};
> -
>  struct rzg2l_cru_csi {
>  	struct v4l2_async_connection *asd;
>  	struct v4l2_subdev *subdev;
> @@ -174,7 +160,6 @@ struct rzg2l_cru_dev {
>  	struct vb2_v4l2_buffer *queue_buf[RZG2L_CRU_HW_BUFFER_MAX];
>  	struct list_head buf_list;
>  	unsigned int sequence;
> -	enum rzg2l_cru_dma_state state;
>  
>  	struct v4l2_pix_format format;
>  };
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index f061bee51ea8..721057edca6b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -398,8 +398,6 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>  	if (icnms)
>  		dev_err(cru->dev, "Failed stop HW, something is seriously broken\n");
>  
> -	cru->state = RZG2L_CRU_DMA_STOPPED;
> -
>  	/* Wait until the FIFO becomes empty */
>  	for (retries = 5; retries > 0; retries--) {
>  		if (cru->info->fifo_empty(cru))
> @@ -587,8 +585,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
>  
>  static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
>  {
> -	cru->state = RZG2L_CRU_DMA_STOPPING;
> -
>  	rzg2l_cru_set_stream(cru, 0);
>  }
>  
> @@ -600,8 +596,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  	u32 amnmbs;
>  	int slot;
>  
> -	guard(spinlock_irqsave)(&cru->hw_lock);
> -
>  	irq_status = rzg2l_cru_read(cru, CRUnINTS);
>  	if (!irq_status)
>  		return IRQ_RETVAL(handled);
> @@ -610,20 +604,9 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  
>  	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
>  
> -	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> -	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> -		dev_dbg(cru->dev, "IRQ while state stopped\n");
> -		return IRQ_RETVAL(handled);
> -	}
> -
> -	/* Increase stop retries if capture status is 'RZG2L_CRU_DMA_STOPPING' */
> -	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> -		if (irq_status & CRUnINTS_SFS)
> -			dev_dbg(cru->dev, "IRQ while state stopping\n");
> -		return IRQ_RETVAL(handled);
> -	}
> +	/* Calculate slot and prepare for new capture. */
> +	guard(spinlock_irqsave)(&cru->hw_lock);
>  
> -	/* Prepare for capture and update state */
>  	amnmbs = rzg2l_cru_read(cru, AMnMBS);
>  	cru->active_slot = amnmbs & AMnMBS_MBSTS;
>  
> @@ -636,20 +619,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  	else
>  		slot = cru->active_slot - 1;
>  
> -	/*
> -	 * To hand buffers back in a known order to userspace start
> -	 * to capture first from slot 0.
> -	 */
> -	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> -		if (slot != 0) {
> -			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> -			return IRQ_RETVAL(handled);
> -		}
> -
> -		dev_dbg(cru->dev, "Capture start synced!\n");
> -		cru->state = RZG2L_CRU_DMA_RUNNING;
> -	}
> -
>  	/* Capture frame */
>  	if (cru->queue_buf[slot]) {
>  		cru->queue_buf[slot]->field = cru->format.field;
> @@ -677,49 +646,18 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  	u32 irq_status;
>  	int slot;
>  
> -	guard(spinlock)(&cru->hw_lock);
> -
>  	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
>  	if (!irq_status)
>  		return IRQ_NONE;
>  
> -	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
> -
>  	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
>  
> -	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> -	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> -		dev_dbg(cru->dev, "IRQ while state stopped\n");
> -		return IRQ_HANDLED;
> -	}
> -
> -	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> -		if (irq_status & CRUnINTS2_FExS(0) ||
> -		    irq_status & CRUnINTS2_FExS(1) ||
> -		    irq_status & CRUnINTS2_FExS(2) ||
> -		    irq_status & CRUnINTS2_FExS(3))
> -			dev_dbg(cru->dev, "IRQ while state stopping\n");
> -		return IRQ_HANDLED;
> -	}
> -
> +	guard(spinlock)(&cru->hw_lock);
>  	slot = cru->active_slot;
>  	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
>  
>  	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
>  
> -	/*
> -	 * To hand buffers back in a known order to userspace start
> -	 * to capture first from slot 0.
> -	 */
> -	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> -		if (slot != 0) {
> -			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> -			return IRQ_HANDLED;
> -		}
> -		dev_dbg(cru->dev, "Capture start synced!\n");
> -		cru->state = RZG2L_CRU_DMA_RUNNING;
> -	}
> -
>  	/* Capture frame */
>  	if (cru->queue_buf[slot]) {
>  		struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
> @@ -788,7 +726,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto out;
>  	}
>  
> -	cru->state = RZG2L_CRU_DMA_STARTING;
>  	dev_dbg(cru->dev, "Starting to capture\n");
>  	return 0;
>  
> @@ -861,8 +798,6 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>  	spin_lock_init(&cru->hw_lock);
>  	spin_lock_init(&cru->qlock);
>  
> -	cru->state = RZG2L_CRU_DMA_STOPPED;
> -
>  	for (i = 0; i < RZG2L_CRU_HW_BUFFER_MAX; i++)
>  		cru->queue_buf[i] = NULL;
>  
> 
> -- 
> 2.53.0
> 

