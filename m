Return-Path: <linux-media+bounces-60930-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE88NX8L/mm2mQAAu9opvQ
	(envelope-from <linux-media+bounces-60930-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:12:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 395344F943B
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D7C8304C625
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 16:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F9A3D75B1;
	Fri,  8 May 2026 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jxzzvv6G"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E16D238150
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778256624; cv=fail; b=k5dAFX5U90c7HlfY1W1sogB5BBDvcieNuav/aelPjS9xQWQa4miUnsukdtUUKJFSsaZp0isOutzS0M4B+E8NF/Ijk5HS7yUE+fXR0hRarxQ69P/QWTPl0VykEYlphzI//1knim3Eh+Bio+sgvIU3w4xXACN4tgMiBOU6avSVDag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778256624; c=relaxed/simple;
	bh=JVdtmrymK5vZCPx4aaJppRtXaDBkfnROEQ0nNIAQ/Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tJXwo+aaFAh8yt6pIXHO5ijrULVbuQkSLSeyUVlPvYaaBbLzQaWK3G7PxE6j32QCbU3rEFFJtG34QbhTp0oZbkGWNGcViB9Cyl/JuD8O9dQOUdE7huXQvfZaxz9ADrjUpSqpFUxAjg1Wtw2GFUGSfiEvpTFreIP06hX1Lf3kEW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jxzzvv6G; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+ANu/o4wCLK6X2E/UZFvjddLE1gC+Z9OL4/wYpkg3lDsiZp2Rad4bpRpnnh+jYgHSL/eVjDxi0N+hLHrx9gb3wwbFn7sJ5KcE57QbYugIkpYgBhSxTRoUmxGEOgoMl8Jgr0n+z+rWlHuLfgJUIQMXkmAg7lcOmUg8kZNJTVo7hULRyFPTR9XuXwrG0HVGWwXPMgMtsTSHTHepLxrCpP1uMuUM2sqgIbNavStjPoiXMMjzTv7Q8tJJKiFTep2lSKeTtT3fbgdIEPXnYoJrZ6xSzT7YOVjp69PYxjhRACkSpOmpcYbBdgnLTn5B8gLN49ULckaDLASL3R2dYI7zkPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZSEANkmfEJGi42Eb+G+O3pD5cJoTSGnI5WKs7TGi/E=;
 b=JC/RjGnrRX6F74lel7H3i+njc/m5W3hP4LlK0jrkZfE3qY/tQ+AaeoXDz5EdQEMqvpP/61gCg4t27fOScJpEG9K/YaQt198CwRt+XvsbqaWy2BhoTmkxOr0GWwfjRM/w549oWYjKtQtu5D0si/LxQYSID8kZHop0au3xSy3P6iH85kt4skEyFPC0Daz6MCKuGrg2i/eUWWjdGjaHIoHsMoEM9Q5cFpSZKlkbUYSzvN+8zhr5sSrBP8mQcuP7KIRspwiYso02bNP1tglk8OfgqMQ6jBZC9G//8l5nZowSreQn/jkkDkuEFOQenNsXCWpfqoSY40M6MrYt1BkZq6HHTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZSEANkmfEJGi42Eb+G+O3pD5cJoTSGnI5WKs7TGi/E=;
 b=Jxzzvv6G4DY2hST5ETi3KvSBlcZS9mXXktw6SN3GWHGjXhQnWFtGjhu1X+ojjrTDmh3pEPMvlxJskJUlBqH0ok7zD+VlQTsNXsOTSstZgl7BNW6VcGqlWYC4Ja7yVEH/aKYbFg4coA2KQsqFbVuPrWVrIZDh6T5yoUBl+mOs/a9DvVGChWnNjr3n1fqwlVzOz/XlzBH/PMqqGNvp/mt13+KKPdy7hFB4qx1GYWE8CBVWMeTlFiLZtB0XasyJWxkXwV+Wp6N3l6vFZqum2iRfkklTHX3O4PBA0KZVCjGPnP5ZiPcyArYxiNO3MxMAfe/QVyxervELjO921t2OPooSmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7463.eurprd04.prod.outlook.com (2603:10a6:10:1ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 8 May
 2026 16:10:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 16:10:18 +0000
Date: Fri, 8 May 2026 12:10:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/2] media: mc-entity: Fix documentation typo in function
 name
Message-ID: <af4K5RFxKAWkAcwf@lizhi-Precision-Tower-5810>
References: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: PH8PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:510:23c::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 364520dc-9fc6-460f-8292-08dead1c4c45
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 6i+64/2zPYtgCBcwhFf06YGA9uAC42J8tE7gN5W5MZCZRlJP3dAIaX5BtdWpPm9e40YsdDbuhVNPp2pqNOZUz1rcagr+cgvuAuVaTWXnMdhcvuMZ3ZDABi8CYilLhQOp0VuGoxrQJdhTAUeorlnEb/DnwzBjnOXPw8Y3aSfcOFuqw/hzjWwetLc8BODx9kThx795+3RtpGyLLvuWmI0U6850s8fEvc2k4Cgvuln0HtNu670gmr/r7SWG9QxbPOsqmAvwWpcToK6MvtzyMKmfCKM/7ddffRN+h7RdQ6I8ta6Zzby4zdT1LS8M4fd3/7iSoifo61vmk0s3UGsYmt1ZwyprU3WMpPmNQWCSQRtfwgJeaPgWfCp9FWobPDHHQ0tyv0L8aH0/KbpsojCbPg4g3BTzUZ2tr3pQ6xODqSJCPxbzaHza/RAuAnWhb1Jo026yMy7pShPkIJ/yxKCV968Xwh57rS42Yg7wFRfbFB3SU96lzrSs5hqX3VqecHhGQI8VNdrQf8owUDCZdXuwESzc8v3xihW9aIhAbqQVEMPLbCOGJ4d5HTddzG2nbfXOF4t1O1JPcYT6U3aaKt8g/NhPXcPERQDtGrGUsDw50/+hXErzhZjYspyJnnOnMBpjzaWdt+vu8gFp6EpL2bqzcokvzvBk0lUDmgMDvv8uXVuMgOa5xxAAYtTzcLDHQYBi+komsp5aOJqENYl1IIjZYAblH3+eZh9pzkCMSmRSx8JHbpelwfKQxBBQi+60AxHSqm0D
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?hOFZbxO6JebJxioJBUKRAtivw8V3KmctqEX622N/b6eiUjJWaCtkhQ7rY31F?=
 =?us-ascii?Q?sE93cWjk5+tqaCfvyVgYVUPUaUkykJbLaSN39hxWv1Govk2dVygNfW8De9Sv?=
 =?us-ascii?Q?dlhgQY4OZF89s+Q+6s9BNfLZzYlrl4CI+rDWSuCPAyo42vbnraFBUnI/mfNe?=
 =?us-ascii?Q?jfvGoaJ4hd/SScmIqczLAtwmolE2LrNE2akPQY8nRbeEzmWGZW+yHAEIsR1H?=
 =?us-ascii?Q?JHTKcwlcivh6r6t2ypTb4Aq2JvOisOSnmK4GKkecH/6u8LFmdWwQyzo6njaV?=
 =?us-ascii?Q?eDxORVIVAzX6lmvsynKW1W3Wt/v3PaoDWhqZ+wt8eufuVmneWlpG+Urr6WPp?=
 =?us-ascii?Q?klh1KTXnHzEOG6h76YVPgLanQUl6v/tNlj1ZVmP8cBaK0hHhmgVFXcjtEJ3C?=
 =?us-ascii?Q?IMbMUnDBm/c2H3KSDN/kxA5urY4+4xeu0v2CHJ2wq33RDxM/QVTtviWW8IsU?=
 =?us-ascii?Q?sw0rs3YPGkRDikEkVGSEazcPy51s1hVLet4J4luA2AX7SRe99burNMRK1lOK?=
 =?us-ascii?Q?QkPLm9W+/Rk4hg1PQMO/VLRojDw7wAMIYjo+y8cvYGOzKcyQNe/AytNdW7O4?=
 =?us-ascii?Q?lN/K7+DNxAlnmd/PxL1Vel89UfB2pVQBo4/c0vdGRwRpP542hFk9RORcZbLO?=
 =?us-ascii?Q?eHbOGXDG1qlw4VQAMEx9rmnn1AWT7slm8c8F/5fwk4e4QYSKjDrKgD2rRj5D?=
 =?us-ascii?Q?lrjPAH/ptTvZSPDozprtxWbdhhLxc2F+YEcoWoPr0HTstjJwJZYdhnZ3v2Wz?=
 =?us-ascii?Q?48Hv+lpmFJXBNleKKWaWSf3b6mleYzvdfj4z07sy9LQXBnZKn/s5VsSP7PSa?=
 =?us-ascii?Q?EBjB4afZus5fm4OxAT9k9jHwKxbghlcgYMOzvCuQhoH7Bu9oG3VirquoA+MT?=
 =?us-ascii?Q?YHS5v7i2G0mpqo9DxArVpPmW9b8t1h/d8zYPdY2z/puU+Ce9xnEQ/rlU70vz?=
 =?us-ascii?Q?ewkoUNcbalnje6XmGB7b2+zEldi+jh59xMyIeidvVKTg9fTPmJvDT5j8uIOX?=
 =?us-ascii?Q?cpEengoyPmyiyDE4eV4aKnmHfBj8fxjuUyXUw7vTod61mpJnD2gGfnPvieKW?=
 =?us-ascii?Q?lrhH45+NiQoXdt7lGqfwGFsgGPQR5Vbikqpo9fA28RKUvEfK7dkNeKKw28Jq?=
 =?us-ascii?Q?kPuehVvkpEBo0cYobQzhnMM2ziAROovBioRWXqA1LzpVCVkp4+RDPI4RzwQf?=
 =?us-ascii?Q?uuC/l7BK/ZpKzfrdiUUa6HS0VojGs769p8Ra6/0c5+gBY7fSv7mpWAegAnGh?=
 =?us-ascii?Q?4qaQkl18NplQAxLtuvtp0k7hyE8ph13+bQuqZsdeVd1vJy0AesAd6zR+Dpd3?=
 =?us-ascii?Q?7jI9zeOJHgOXfEX6GAtxdKNzd/cTCU1avHwdrkTchagAD2hSmjUOBbNncMGa?=
 =?us-ascii?Q?5nNw4RYBAYyED3iqWMmfumEOojM7VwTz9jaQmb/+v1u9sm4G5pyFm96zbZwR?=
 =?us-ascii?Q?tkxpgXfrkAWWAl0T1B3dPpvJHwP4Zk+r+fEset1t0N6dAuzDaoCLCdiWngh7?=
 =?us-ascii?Q?1hMxvimkwImfhcPaF6y0jGMWMLx3YklaAP9hOtb2zPYsitpwW7Y4jyUC51wi?=
 =?us-ascii?Q?NsPILq6YDY42u/hlYKUyFFnCaTyhGf0Tq/fw2DSHsmX7aWmHZ+vndUeqYCPf?=
 =?us-ascii?Q?iP8htdk0OxEhZL7I/FPhFltaTNQuNXrCw257pIk1oFcIi/uhQ3BkyNMLBZHU?=
 =?us-ascii?Q?LJ0uYdubfvO1N/dj5fIZPLzNHq8YxOMQ6Xp9KNzsvfI83RXBWNhq39pFXuLr?=
 =?us-ascii?Q?NFZRLk6rCg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364520dc-9fc6-460f-8292-08dead1c4c45
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 16:10:18.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4q04VzPHEblIgsUHKzEbVwgY5ApyvRNYNjygcNeTwFmMfhWwK7c66qVP8GY1tXwd18zxRXNjTS3KAPYLUbetwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7463
X-Rspamd-Queue-Id: 395344F943B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60930-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 07:54:37PM +0300, Laurent Pinchart wrote:
> The media_entity_pads_init() function name is misspelled. Fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Nit: suggest put real functions name in subject.

documentation typo in media_entity_pads_init()

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  include/media/media-entity.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index b91ff6f8c3bb..904f61c14dc1 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -726,7 +726,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>   * the entity (currently, it does nothing).
>   *
>   * Calling media_entity_cleanup() on a media_entity whose memory has been
> - * zeroed but that has not been initialized with media_entity_pad_init() is
> + * zeroed but that has not been initialized with media_entity_pads_init() is
>   * valid and is a no-op.
>   */
>  #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>
> base-commit: 3cd9b7011519c3fffffb7b6752fc7603be52dc1d
> --
> Regards,
>
> Laurent Pinchart
>

