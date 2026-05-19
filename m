Return-Path: <linux-media+bounces-62189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBV7ESvcDGp5owUAu9opvQ
	(envelope-from <linux-media+bounces-62189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 23:54:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA36585561
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 23:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B523230221EF
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 21:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B633E63BD;
	Tue, 19 May 2026 21:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kkQKGdSA"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140053DB309
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 21:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779227648; cv=fail; b=ns1IpTlkjQx7UQbRzc3leqa8AnOpVf4pE9cmpZ42lSih0AvYGbipwgonEj3tD1LFUR/kIr1CsS4TgyBUW4YsVkGt5QEEpODNZki9eBiRk6KB9VyjRwGWNKs82LuvOdsQc35EJecfdoctvBbPC6tr0lZVkIvItuboHoAGBTvBPk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779227648; c=relaxed/simple;
	bh=8BOYw4y3Pr02dOrtcqZj4+wh2LgZ8BOn7b76hzURf6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SCDQoKvmlQ8LnKuSQY7EJASxsw5HnSheBBIhuTuBi1B3pD9nARi5ODuvLk+QNzmCAnmYKQtgbxdN1rCNuc13tdYrfhAE9+hTwGsu3Lj4ZrrySrS58X+W+Lsq+Q3XoFv7soaJlnbFytER7ezbDgYzIZaSYGwnQ35P1p2CW8fYMcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kkQKGdSA; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Skbr0gNFVL0SiSMXzgy3Nc/x9e3luVuobkIqKvP19qxQH0pcip1e6mN8n+4XYuxu8YMXfhboEcAigjVhwZJQf/j8sJAIVn1ByJT+zzOFWpCIdvIl25Ry53a67YiiWiVtVebWF9om50lSGdTP5q7Qx5PHNCqxneEwPkCu+us5fUP+qVYBakTQIuU3VI7negK/OT/+CV6Tusom51IXGlzcrNi5VbEMB+6Qpv37AgBXgasEZRwPWNJp9gqWe2y+raoAAIcixk+VR8g+Uyh9+7pSC0Ff+hNkKqvW7smDKZmdnqvT8UYqDhC+cJ+FeqTNOhqJc1UA2hH9jKZm8BYEJimbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9du0b8B1cE0pIAnE/NWBvHfAK69Q92T0uqKlkXiIrg=;
 b=E32LKzwxw+I4Q2RtPmR6Yy4RCsQbBAXrvDaJS0HdXq20MX0O987cxdMJvS8FNEtc1KkVim1Z6/6fzQDDgUdBreNwF5ZJ9Fpv8VXR7OVnybFa5hj+h0Sn8+SKAseXBv/T3NOm8LMY7Nt3j14Hdg9cCOmMxMO10ZuVCKS7YuyFwc32bxF/VcIOVbcmH2TFI6TdVAawdLebM0wXlbSHc6cZ4PGXaCD0Neg83AwXqeHLl+QIHQTYruMjrH3PZe6Z8cUZaCbWMW148DCbBXkuhJR9bgQMi3fIxYI6hFAHo7RdMAV5uBLbpmJpk3t22J2w7ZhnGIlpikKRZKr2Ch3xIhgjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9du0b8B1cE0pIAnE/NWBvHfAK69Q92T0uqKlkXiIrg=;
 b=kkQKGdSA/4qjcj+7VbvVIUoz09CEq+5rtBMaPFkty8/l/9jrF/Pa0lC1AS6sO0W9wEa1AOwLeTSna4gCgfGQ0xbdixd0CmIMzpgSBnOLSkJUQM5pBUT1v5HxSk3qwn+b5DKkTdx4+hnl10itgFeLJ3rK+bjuMaLdzfoilC9I4zHE9HgH+rqnlBkDtQ0ZMDUI7O07aPFkUKTbW/FVcaPPdbS9d3UdExKhkmH0GoDoYxMliUyDCWHK/9lq7Zxbaa6yJK5JuRiHM/0c3/R2VD6VPUjDms4RwHdvfNXbB0AChIZqXtfS9mk2I13g7kkEb093Ij6nqvP2tUXo9gJNw9IySg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7806.eurprd04.prod.outlook.com (2603:10a6:102:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 21:54:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 21:54:04 +0000
Date: Tue, 19 May 2026 17:53:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 05/17] media: v4l2-subdev: Allocate frame descriptors
 based on the need
Message-ID: <agzb9SisRMSsyhqH@lizhi-Precision-Tower-5810>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <20260518164318.3367888-6-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518164318.3367888-6-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH7P220CA0063.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f0adc8-ce8f-4676-0841-08deb5f1249c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|3023799007|38350700014|11063799006|18002099003|22082099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
 miQSV0Emi5hZ/o5A/IARzy2DmNVrTBmHho6mObfgxwJlly4n+Ocw0+4drbhZ2ukDMeLlHUgJQy3g/qSE/tCB3PP4Mb+ka5WBQiDiaP8V4WrNn+Hq5BQ74FxcHicKSXbiPIpP1tn0MQDENdAegxkbAtIL+OjA5IsvzhHrdTImCN8t7blxnju2+QHpWtvu1cTGPj3WXxLpeXeMQysbuPmQqjq0S6P+jLTYXUqT1m71H8vr/ilVdbhqqq2MpJn9ERHUrz5B3pfteDT90TPv0ZyOh+ogvFerPHQYsP/A6zLJmYwf5UZHu90Sl1aSmgRn5xfMB7bPwP4AO/8wIXCro8l7yl287PQNg+8avBQPDg/nXeLkDHDhyAs4K9/Bpsic73HA6JJ+si8ZSCcv0HUZlxQEX52QzSJLK50rwJ+HMz/OvJdIOTT6X+RyZN4zbD2xAgDqdJfBB8HDdsM8EGkjiWz9zxirbr/TDpD8H7BBG1a+ffCAwOPRczXNC+EBPs+wKge9SZMz/cVP1QZP/d6PojG95zjeWH+5ldOZ0p1wDQ6GaQDRM0JdAWJdtA8Y4642tt1fAWL6j5YTMKsb8KX0K2YjyPW1SrfTw8kd6Xcy/mMFMQZVnjoAbmKpC9XRpHtZoISVQQZ5KVPt4tkaB/umFfzL5bEIYZ+BjXhLNf+J3YdE/KWkGsxm5mCAxg4W3vi8D1ImHkaQxUOoGidLEg01JE2qRCJ07RDdB+e8ZBtmvrn2NwCEZsQvB2BysRO52wVJIShl
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(3023799007)(38350700014)(11063799006)(18002099003)(22082099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?165tj1zejuxWjqK38dxN6m/M71y2dj1RHCgWygZuPQrF7eP10cQy69zKyLrv?=
 =?us-ascii?Q?AQk2lboBFeqXxJ8GgIr9i+uE5BTuHFHsqQnBzwdG4ihOvh1/VTXKkEZ+LqET?=
 =?us-ascii?Q?2Ef1eCudxPr9pI/j2L1i376a94DhsDbxVHNTO4rjla4HC2XoZLhGbwusj655?=
 =?us-ascii?Q?FGdW5cGaBciaL2rA1jrMnznv+PvPxlw/NyRVXwqFL7au1+inPINf02SIx8VM?=
 =?us-ascii?Q?2CqLlbdzK3dtFFT62vqNlFKfWk5ocRCTV/bu9VBZc4l4Xc4hgQXxhitU4cqV?=
 =?us-ascii?Q?5ZgtWGaGDQc2KwFdBOfnFiVrN7lcuvxZAjka75y/Vy3Zx3Yiama5wKYx9fbL?=
 =?us-ascii?Q?TLyfyfRW/BPGvLzQKK/kujOFwt6YF/tVcLtd9OcomCxEEUVrh1Gh++/xbT9A?=
 =?us-ascii?Q?TbPVpooU0WFIAr4Jl+aU2Y4Wd+A8REieYZ8fTbOXS9kBUfbXod1G/nePPKzc?=
 =?us-ascii?Q?4qZR06bsdyQH2dA3hn1iFfl4Tsh00GEqMo9maEBjFdLtePpqf4z5j4mads5P?=
 =?us-ascii?Q?hpbSs7DiNwcfJTzO2YW2YSLYCN+KqKDSxUmqMB1UbX4qqtHEVfNkTDwzBQ15?=
 =?us-ascii?Q?qZm5mPlsiVP4VCQsVUq3IO99Tbmko2WGPRXh9k3rSG7nI0U1piedAE3fBTgh?=
 =?us-ascii?Q?p1o3Vh/XOOZ75fFlpXjTgpfzts4evKTtS4DBrEar80rrY3xY0TLo9R7MHuH1?=
 =?us-ascii?Q?AaYdWjjkHFEgBodfJC+61bbeBf/s3btOCoiC/lxZ442vo/DQ0LCX2X37ndua?=
 =?us-ascii?Q?ArxE6syKhZIOhaGocXlTmyzbRINvYTz9YZu5tuIMOAZcB3xMJq0bBsHhhw3m?=
 =?us-ascii?Q?pmlMQPtmg8mXySkNo0jzumduJe7BdWnYcItfnFBHHwLDx6Q9VJmtdpRjsyEI?=
 =?us-ascii?Q?0vKn01nMQfPfoMG6qo8CGyWVEVBc9GNgoiyw2lhT4i4PubuGldxfKxXXFSgb?=
 =?us-ascii?Q?G4zUtzT4dZU9KzsChxNFASQCVB5P9z9HrNLoAuCVpcFzU24vnnvq+/8X16OZ?=
 =?us-ascii?Q?Mh1xUozg8XjKMik8J8k66CYLszRdOhTeaFccT+QfB+pBfnU8Bgpx6ZCKdWv4?=
 =?us-ascii?Q?W8FUM0DP0BMaYtyh7AxoUSf8KcvnigsCDpyJOdmXJwP+Yj7yhRbyw324KpWk?=
 =?us-ascii?Q?uzQbL0LUjq4dg/hx5OsmoVWhnPy1MZusAjv70v/s7Krg9tmAj9Eb+NoJb2vc?=
 =?us-ascii?Q?/kvdxrQHNmExX+k6iWliopRuDlJ7cDEgXM/N2qR6KKZHzaSryZ8XM8nooEhS?=
 =?us-ascii?Q?GNtjn9RQGBushaXKDDbCXkryK+eBeZw6wCBe3E+7wV45YnKxu+RvUITg+aDJ?=
 =?us-ascii?Q?n4j6YTce2ld+oGY3Ie6nIJ09e6X4ZV/S91eyyt97O8tOb+DTXANMl3MY29IH?=
 =?us-ascii?Q?RqwOiVfY8SfNA5X4o+o/2hZzuvT0LzH03dapAf2vGERXyxD8bRNIsz+B6BhD?=
 =?us-ascii?Q?2VMSMAK72JbFx/UMmEheice9uzpr5G1uRZn7ky6Xq4uK/QpgbveQHuPfjZ2w?=
 =?us-ascii?Q?ccUHYgyCYE2Q232m2V7rJPoQJ+lgfrVvUQbqrS7FxQ5hoVCcNJp6Kt/IoU2c?=
 =?us-ascii?Q?LPcVbU8/W7wwvA/Zmk0Zko25QN2b9RYnY2QdPzkEtODGfMxlAiqy3MbjAppf?=
 =?us-ascii?Q?scgom0IE2EgCPT2/oPoi+9aY3P9iObJa4XgHx5RsqdbUtNYicmrjUyk+VI1E?=
 =?us-ascii?Q?HDy/idfXhbt8hXKWrEIeyvkSR6z+KNdcCh+IBA2LcZXvdNqlJMgBkRzgzC6o?=
 =?us-ascii?Q?NQUtP7P6lA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f0adc8-ce8f-4676-0841-08deb5f1249c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 21:54:04.0260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwQcMvuBntXlwE8JNZ9Rij4scCTKDQnPUYiS/GpmEfcmFvH29wJKm8M5fEosxobQs9CozxbDLrDXySqLlTMqjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7806
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62189-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim]
X-Rspamd-Queue-Id: 9DA36585561
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 07:43:05PM +0300, Sakari Ailus wrote:
> Frame descriptors entries require a small amount of memory per entry (20
> bytes), but if the number of entries in a frame descriptor is large, an
> unreasonably large amount of memory would need to be allocated in the
> stack. Therefore the number of entries has been limited to 8.
>
> Support larger frame descriptors by allocating as much memory as required.
> The get_frame_desc() op can now set the num_entries to a number larger
> than V4L2_FRAME_BUS_ENTRY_PREALLOC and return -ENOSPC. The caller,
> v4l2_subdev_get_frame_desc(), will then allocate memory for that amount of
> memory and call the get_frame_desc() op again.
>
> The caller is also responsible for releasing the allocated memory by
> calling v4l2_subdev_free_frame_desc().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
...
>  /**
>   * enum v4l2_mbus_frame_desc_type - media bus frame description type
> @@ -393,13 +395,17 @@ enum v4l2_mbus_frame_desc_type {
>  /**
>   * struct v4l2_mbus_frame_desc - media bus data frame description
>   * @type: type of the bus (enum v4l2_mbus_frame_desc_type)
> - * @entry: frame descriptors array
> - * @num_entries: number of entries in @entry array
> + * @entry_mem: memory for the frame descriptors (@entry)
> + * @entry: pointer to the frame descriptors
> + * @num_entries: number of entries in @entry
> + * @len_entries: number of entries allocated for @entry
>   */
>  struct v4l2_mbus_frame_desc {
>  	enum v4l2_mbus_frame_desc_type type;
> -	struct v4l2_mbus_frame_desc_entry entry[V4L2_FRAME_DESC_ENTRY_MAX];
> +	struct v4l2_mbus_frame_desc_entry entry_mem[V4L2_FRAME_DESC_ENTRY_PREALLOC];
> +	struct v4l2_mbus_frame_desc_entry *entry;
>  	unsigned short num_entries;
> +	unsigned short len_entries;

name is not direct reflect means and quite easy to confuse with num_entries.
Is it num_dym_entries or other names little better?

Frank
>  };
>
>  /**
> @@ -781,7 +787,14 @@ struct v4l2_subdev_state {
>   * @link_validate: used by the media controller code to check if the links
>   *		   that belongs to a pipeline can be used for stream.
>   *
> - * @get_frame_desc: get the current low level media bus frame parameters.
> + * @get_frame_desc: get the current low level media bus frame parameters. The
> + *		    callback is required to update the num_entries field to the
> + *		    total number of entries in the frame descriptor. The
> + *		    callback shall fill the first entries array up to
> + *		    len_entries, which signifies the number of entries
> + *		    allocated. If num_entries exceeds len_entries, the callback
> + *		    shall return -ENOSPC. Never call this directly in drivers,
> + *		    use v4l2_subdev_get_frame_desc() instead.
>   *
>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>   *                  may be adjusted by the subdev driver to device capabilities.
> @@ -1794,8 +1807,9 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>   *
>   * The caller is required to set @desc->type to the expected bus type.
>   *
> - * The caller is required to release the memory of the frame descriptor entries
> - * for each frame descriptor obtained by calling this function using
> + * The entries in the frame descriptor are allocated based on the need. The
> + * caller is required to release the memory of the frame descriptor entries for
> + * each frame descriptor obtained by calling this function using
>   * v4l2_subdev_free_frame_desc().
>   *
>   * Use __free() to release the frame descriptor automatically::
> @@ -1813,7 +1827,8 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   * v4l2_subdev_free_frame_desc() - Release the memory of a frame descriptor
>   * @desc: A pointer to a frame descriptor
>   *
> - * Release the frame descriptor.
> + * Release the frame descriptor entries in a frame descriptor as well as the
> + * frame descriptor itself.
>   */
>  void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
>
> --
> 2.47.3
>

