Return-Path: <linux-media+bounces-57626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM+oMgGCymkW9gUAu9opvQ
	(envelope-from <linux-media+bounces-57626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:00:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0251E35C7B1
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FD4D30763F6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC713CFF4C;
	Mon, 30 Mar 2026 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZT1n+TJy"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F893A3839;
	Mon, 30 Mar 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878770; cv=fail; b=oWicx5uffHXD42F7wJ/f5rIY5Xf07vyBAqfX8Dg5Wkz7q+cLWOa2JjK32Qu4xXs5fye2PIugUcVYlhRNfFPb5sapHg0n1OAbyTaMkPVEWCxwEJi+BO1tiVCeQwyVF1XOiWc2JXd+6bZD26nAVBOBkN7b0QlYOyXgpZLTIacwfgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878770; c=relaxed/simple;
	bh=8I03IcIdl9PkVe2k9kNDjFbWvgzESpLVtur+rCQsVRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P7H/cZ7nxSFBHyyzRj1PrPCLSJqNrT7aQFDX65zWIzAF1yT5rnPsMtysmTTvLF8jcoJ0Dek1rZD2jYhRAJarAxbMaXRoyyaz4JArlnV3BLnzdZVtcc94DzW6km16t9R8ZnKVZTozoPZ8BACirQxVnHUko86BK/OMkGpKj2jnzk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZT1n+TJy; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlNVFVHHmqfEw4SC42mFhLY2rfJrMmNXzZF/+AL6IWbfJww9nJzqj6eg51zny5OwQEO+ksxdjwZBOG/Y6ut7Z6uF9kbohrATrBXVLwYlWT1Oz47/FjxNsDXoU2Ic1idOZ32nfyPfR2mIZVQnpSmjrmIvEDQX3SqiK9u6DvYTEWV2QhZYXUyrObTtyKQ4I0uB+JTld8jPSYIRNaoKyWj861bjfmR5VkOLf66O8ev+XA4VWspu9VGHmG6t7ZnWQLGytYDdrT2DMkhSmS6SQTk4x5OrZr7O1YTkfMPrqtGmcVNj4owZPdUAYNZCSZVdU1IrwaT3BMd6nc7bSVDVF6GIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLXOpt45+wCpkZ2mdPQOwmBZ1SNHhNUkieKNiDEbxkM=;
 b=CqdVEhmrX89meLORa+N9KCewYp9WeweuNOsDGnkGCYOs7yrKV26ytyTIhF45fQKnuC2zPso4QgDwZG8O+9ubWK+dd0ukcM2iAR8S+dGDiSRofTauty9jyqLam1KY3hbsmzFiYGHH7YkYQMtSHXCMkjB7eYYuZfRfn1QU90XC3RjuGx0LZ406eeLVPzp4XZmTL5HuGXHBD46SfMZXVDeiECYTTJPx8+7D09/AHhh80PTFLHPCkUWVsKFFWr/aURa1NspcNzy73ALVaQHtLS5jbOleg5Zjxk08u/iOTskjBuNKZgVVCo91QNjzyYyECauqOVdGvb9oVKJ+L3uKAAsuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLXOpt45+wCpkZ2mdPQOwmBZ1SNHhNUkieKNiDEbxkM=;
 b=ZT1n+TJyrwPhhJF9w64F1GlbjvdG85TVL9i4APhSrwk+8KrE5+VPIvKiZIEijNVYOpCqa3AxmLLeyPwzH3Cc7x8CtEdU2rI3HFp1toWn9XnM/Q3keHrY+g+eCP2Sg5H1QdpOlHLimQPn0+eVR1U9hISS69aChFZ9ewfBYpG10Rw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16332.jpnprd01.prod.outlook.com (2603:1096:604:3f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 13:52:39 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 13:52:39 +0000
Date: Mon, 30 Mar 2026 15:52:28 +0200
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
Subject: Re: [PATCH 06/14] media: rzg2l-cru: Do not use irqsave when not
 needed
Message-ID: <acqAHMObxIud6JbB@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-6-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-cru-rework-v1-6-3b7d0430f538@ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16332:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be93219-489d-4d44-f59d-08de8e639b4a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UY1sAInymryBg4YPpQ+7tphyW2JvzzQ7Zi1lCe6uxdrvd+Am9ubxHy+dj6WEG5bHgOZy/UdYeGNqAYCn4CrP3VRtOkO3KKK8AU8M5hDWOCAI3CJWS2lloXpDLLeinqwI4OEB/pnfS+M+3B8uVkBKtVw5CAkl2WLVLnp5KoaP2wtgYfypRyTrAlUUHb8YYD7eTaZ6j9x1W3y0wrBIfGotEWAEc3G6dA3Te+9PgUDEq8Da+ra7MzHM8pObl9HnFewSnq4sL/qJsTYiqBviClNj0qjOxeIU5aLxoAR3KzOZngT2ONa4LKq+bJoO5hP6Y/NVndZ/MKYuhvbQR1ZnIThTF1BzxaLZNte77jsVG6vLOcoXM9OFLV4qxZxAjrpx+4qSmajXJGAzSncTRt1bYu3ZWl+0iTPjxe/gfhRwmOEg16BN5TCfJFxt4T0yKIciXHD1RMCTeJQhW+Ppsf3RRknzi6fcrgqOg2Y9UEfvtCiPiIgY41aj33W2l2Vzb/yhoUzQRifrdw9wK3G7Y26fD0mXE3Zgek40PAyTpIljqT6T0fW5FMvQZmZ81O79e4HvIugMfqHrTvanvsrsshKzWSARtwS+VcCSYgEMjPilgT32wCn52NfbRvhlqjl/iwleyi7MEwIW9HBIPB6fqMs0t+H6a0Jo3fB88i2kDnbvZ/oHf0+k4vSQ1/S3g6zqwwqfIZfiHeSckhPFWgsCE9iHA+onyStCO5zMYig8GJNQAIvxsrKIWKm6xvylKN+X1vxTPFX6VJYsK4Kc+f5sKMJcf/WuwYCimZP7ApYsvyP+Rb2qRjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wBvtPL5Qfk3SYBsZGpTsnFIJFP9uSoXjLcgR1JBwPVeS24J2fHbtg6bY7/nU?=
 =?us-ascii?Q?tJBFeKU+qWmNIjCeZJvPObeHYCzrVHj+e/6Pe0sIvHfTiZc1p+OYroyFx8PE?=
 =?us-ascii?Q?FOcHwhKKYP7lcvFQFpMlM236UWlPyvp0YwqsH6COqBdnh5B4CjFXGWmrLB43?=
 =?us-ascii?Q?SmXmjudr6e1PPyS4y0JK5ITKj73r5fjt3ImLhhnbXsxChiqMZxP3sqmqd5QC?=
 =?us-ascii?Q?b3HX8XnHEhDnMddSkt/8SFwFImqWrq8x/gop/dRH/nGuJWBwtuSgkVG0hlM2?=
 =?us-ascii?Q?pTrWZezrnLJielCb8JtvEdH3D4RYrw5KVv15fM7l6PTouNxMPHvtjgWrSPme?=
 =?us-ascii?Q?ZrZbLmYzuVU0PLeG5jaHpmmY0UOw24EEm4f0q8WAIPmwYBy+8x6Sw1skczkT?=
 =?us-ascii?Q?SLWeh/9ubATt3NOACGCBSe4LVtZaRBS7WpVbfpxWFuz9P6ATC84lfgtNyYTm?=
 =?us-ascii?Q?+F1iq5+0VtZnLTOdYGWN2A9N/QNQOpcMSqUWDJktP/cQF+Pmxi6Ndu1CjEl1?=
 =?us-ascii?Q?cGhmiK9rWDVChl2nX0XsenLhau8fihyJeQLpoS+38+tENIgjPP1yXyee+ElJ?=
 =?us-ascii?Q?SmW4HOMIOaCXn8pfH+kCmKdXMJYwJ7FWazyhprkQybBoQncCWApPeVBJ+wXo?=
 =?us-ascii?Q?uLB3yzi7aGxQYVeidPXMClDnLit0f4ptW/vu8vylG4EYF+SCb1Gtahie0p1k?=
 =?us-ascii?Q?ceW22eNgQa0ZSi6Hu2JNmUW4k6XC3ekFc9d8T+855YEd0+uF09JGHv/47GS+?=
 =?us-ascii?Q?p2orFBV5kOCkKGXing/K02pzDsAvL3Ic8Ks5w0fWxlseZWl9g3NveGpMDe8I?=
 =?us-ascii?Q?kb1VvF+2Vd6+kSA3/YhCgQxE0ZXxoc1YuxlOCSo4kuwHYCF4qs7TulUla3l3?=
 =?us-ascii?Q?+5uEOdzRTcH8nfa57sM6pRz99FbL2xLHgXV7vs8i80983xtoFKYMTyt4HGPQ?=
 =?us-ascii?Q?MOuGUYlDRoO/8KMku9+ODuDvphdluBTC9PXrRf1OwWczhK8/3BUn/3MsgYee?=
 =?us-ascii?Q?dhoaBpdnT2R2Z+VfHzpsrKyPljFkEBhSaNRRbYKFZwEGmkso+RM0dbK9Wz6r?=
 =?us-ascii?Q?eY/V5LYGW8XQL9y+YQHrNgGEyp7gEy18pbIY8FLFb6VCEWWCZeJ8aRnYbrMS?=
 =?us-ascii?Q?5n4AjlWDkc3U36d+wdz7R5sgNhhOv4ptazTZ6I2Sm7x5munKWByrrrzjcqbd?=
 =?us-ascii?Q?vUdVnO0SSuaUedJCYX0oeHXJetr9eZPoM/Y7465n9YSMgm33JjcTShStadZm?=
 =?us-ascii?Q?Ro2yQyQaoPi6WgUOK6gGeBovDq5u4zUfLXzlaoBAwLx4h8QXJcTeiN0qzHQ6?=
 =?us-ascii?Q?JHq0qtAmLypyaMb03HNai4zEHXqs/gGK6xXNwImPlpZ5RRVn6o1G1w2Vg2AF?=
 =?us-ascii?Q?Y6glDGSgRCyIxZxUHoX/bVs1VRClqnNXA4Rlox6nNLSyhXbIOSUCtVkl3uNE?=
 =?us-ascii?Q?ZZcFTNhvksw9cHHuEWzirgi7DdtYahaPJdetC1Rh27Sz7ioJ/c7kz+o8UbQf?=
 =?us-ascii?Q?VYMZCDxViLFBQVlBvX7IFuoZBXfx3rQ3lswlU3o88BnAldvOljKK78w+Z7w1?=
 =?us-ascii?Q?SfaX1LHy6P4Q+EGJiRY1hlJsVlMTny9BXFZq6GjnkHbAPjq/Ti4q/Ch/hBcI?=
 =?us-ascii?Q?0vbAEjW14yX12BXw4t+SgL6gqJ+GXxtLJSyTvA8M6DxKihjvWcQB+xCRRhye?=
 =?us-ascii?Q?gJvoXIOSrgDOZkYYt+BpsTHmD9pmrAeq/4chWmXs+ykaBajlRR9WquQILs/7?=
 =?us-ascii?Q?2xSW2yMbX/wX4irJLq6dv/TM1zh7EuzqJwzwVPnl95nE93PwLJ63?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be93219-489d-4d44-f59d-08de8e639b4a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:52:39.4726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSwaaD34u71B3LZvfUlz1LKNhfCjfBYg/7pTn11dUSv7D3HNVpYlcXC1pgiibZ/kkJwG5LCUkN04NSzuIEXhQD9az7IS9eJ0XHQvpSF7jkVYkEitU1ABHGa528gsrGHJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16332
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57626-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 0251E35C7B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 06:10:11PM +0100, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The return_unused_buffers() and rzg2l_cru_buffer_queue() functions
> are never called from an interrupt context, hence they do not need to
> use the irqsave version of the spinlock primitives.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

LGTM.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 43b1d35fb963..2e94788c3a13 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -113,7 +113,7 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>  	struct rzg2l_cru_buffer *buf, *node;
>  	unsigned int i;
>  
> -	guard(spinlock_irqsave)(&cru->qlock);
> +	guard(spinlock_irq)(&cru->qlock);
>  
>  	for (i = 0; i < cru->num_buf; i++) {
>  		if (cru->queue_buf[i]) {
> @@ -166,7 +166,7 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
>  
> -	guard(spinlock_irqsave)(&cru->qlock);
> +	guard(spinlock_irq)(&cru->qlock);
>  	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
>  }
>  
> 
> -- 
> 2.53.0
> 

