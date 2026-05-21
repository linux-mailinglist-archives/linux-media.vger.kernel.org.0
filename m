Return-Path: <linux-media+bounces-62541-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oATVA/ZSD2qpJAYAu9opvQ
	(envelope-from <linux-media+bounces-62541-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 20:46:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 690105AB38F
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 20:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73C87301DCFD
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 18:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B373FC5B1;
	Thu, 21 May 2026 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HBfX4hrW"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418133905E0;
	Thu, 21 May 2026 18:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779389160; cv=fail; b=IvgfZoeQXnHXObOQyH7A2UxRUPpkuOnJaNglStbe0WXN+DYXzheZtPx0uMrnlxlVc78GdRYroBjGFe6akckHmdgH0fu0qjFj6er8R1ztx6UkyZTYrFjvP0C5ntoh0Pdk5kFjuzQBP+ijzFO1NGJYmTAr+Yu/qERi/rqc8JV6tr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779389160; c=relaxed/simple;
	bh=f28ceKSWpZqTk6Vl6/x5+QR/c1br3yRORyld42yr4EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gb8GoUxT83H4k87PmfXfjF24VUs133BU2YF7i/LedmFmSGLgpxx9HFcmRM7PZtUojZ5O+jkT9h5k6kD1zMWpWmxpZqeiw+j/0IVf7hksdPOoRmer2uIIzub/3/VhElEN7z3jMS7MIpnq0xvPxO2GWC005h/Tm4Fd78KA5g7qEOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HBfX4hrW; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvoB2BPJNpEd5u0mi/uQzKWuy2Y23FPCGdpWB5p+gMnhlLELRhQvz72o02Th8DqwkALKEYayhkpt2UGSNSrqjY90M965IxK3X4nVRHJmW+LvfyUAHe0nm3iCVmXraU20X7jTcFWm5COpYNZb5XZFPFGaq97hTNVxPRfdbm4HwnCRAb6rRivxgyLocHFEBk+quMehvvhSHtJoJAdSpv/ZIiDugnV3ErnMkLROmghYq7oKVD5k8QHgpyazzYXmlRfZGrvZQ6S0pIF1UbU7NLQLd0cRQ2/QEOmeJEhwH/OMpNcJ7Kv+eYKywG7WaJTa62833clPfsWaDYZITGIqBfGeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XLJ1HO1f90ZVl+2fPMsyW69ijeQthUHjoCvix+JNPk=;
 b=eJmZcxai4glLA7d97Wz3dAGDh9nx76GHlOwbHQO17AiU1a3VNnqxsw8zICRIy1WnfRY+t4inwDE+WLOm/aexGjjOXvQcmlhzXX0M7NfyASHW0Wcemlc0ewQ7P5D4ZLXHF8tUDfYa5CkGVmRC70T91BfkSid9/JiUjOd81uKG1m3qXeV89ms5WGXVHEvX8kSy7ZcqUWUfDAva+RgLH8SlysPyJdyHbvhTYOtFhqZPISBIZDpQxTiadZaiYs6s1//JzOxkb+Rm2ipT3evkpO9l8sABK1hfNlhoVGy4RCZpSrHUNjpYhiE1d9Z/94D7RoilzpUFe2l3jgoYi78/M3VcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XLJ1HO1f90ZVl+2fPMsyW69ijeQthUHjoCvix+JNPk=;
 b=HBfX4hrWwwFsQHa+MAKJvlXl//o8C1A9TxQySXuYNPyep3yta33mvJLSTDClp2LfISEUIGr90TsIGNomv9bZV0PlrEygcLtE2HasbbMpGs3WDT7Q/Uz9Gwytdoeko7WhDad4iUiGpiw1C3Y6h4XasUpJYCf9rzUfi8k6kiUQHG1nebBzOowEArJm+iCJpNdDJ3kamAPzxE9FWc2E5PQdzaG2muLdd5UB7LxNFBKXfh0dxqGJX760HhYfeaam5vPgonq8k9u9C4zrmDYzpHnkWbZXZdf21VAKOOSSkp/3fHYctS14yhv+XRPv3QbDUfaqKAo7j+dDmvcVOWXqhdMhDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DUZPR04MB10062.eurprd04.prod.outlook.com (2603:10a6:10:4e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 18:45:55 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 18:45:55 +0000
Date: Thu, 21 May 2026 14:45:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com, guoniu.zhou@nxp.com,
	robby.cai@nxp.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] media: v4l2-fwnode: Fix subdev owner overwritten in
 v4l2_async_register_subdev_sensor()
Message-ID: <ag9S0pUw66MDUxRA@lizhi-Precision-Tower-5810>
References: <20260521122646.600179-1-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521122646.600179-1-mirela.rabulea@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To AS1PR04MB9382.eurprd04.prod.outlook.com
 (2603:10a6:20b:4da::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DUZPR04MB10062:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec8e184-bd1d-4f83-7bbb-08deb7693069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OinJIFA0bDaUiuijAa+X5jXlFMOhrXaEg9G2d9pF8HkW4RHFj1g8YIARhEu1ifgqbbl7eWvABw5MvnDSaXVeZZBXtf5DiVuwHP4xPKoqxazG/T1Akrt88h1PlhbkZbWMY4k8iZXxdsaM1FdN1Uy5gpXSBi3LqoUeHVlkoYIYfWm70AI7EGOFDM3dyVXQsT0OnED41m36IMfPq10LruqDjxop3nLu5HAEsI+58xli2SGLKLXr3YZj9gu+qzkcsCITf0Td89giKYBp1OxJrwEzvZ2e2YTZlTVChdiNX11WhinCEvDnHrhoOlGiyPOGyEaygwxwI2iCqL7EWsmSyG47varddIoIACPcBVeTOvRC5RxAyW4rsK9PkM4hiBbYwd7QnuW1rQWYvzcHogOk8sRDD8DkLi8pRVXxGKw/0FfDcWvar/nelXNXZPmJesyVc0n7JtP3Lh8ok+LNGSjldcWjwXBKjWnFXDk+R24cYC2MsJbhT5TKyZcT/tETAtNHhEX6xIHvyuUbIrLzCZ1sLUr59POt4cyqbY6LF9v3U63DZqBsqEHKbnrRUSHpEWIEhJmk/NPdh/ar+Bc+z9rUUb7pvVbXbb8+c7rAoHlDZJSxGBtRVZ6d1X8+ZSe/NId160rxHKyXFhLuzW0TawBHUcFAABXXC3qwjrInXPqm4lwYqTSdGG59JFhEBYIAqiIdeJlEligYObuC4h6MtAHHZg5DJewoq7hBws0GqB+o3hi6jsy7BSHPIrFCHffqaqjOItQQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?03dOEzccigiqvZmkW1WwGDFg5Ic5kvo//wY5DjXfo+1Xzi5+kvoqaA/niZIz?=
 =?us-ascii?Q?Bl4HBq26KcjynpKeFgZe61ZfO+dhBUv6hsfmM8b0etFy458UB3C4so4WF6FO?=
 =?us-ascii?Q?HMTT/Zw52pUoo8xkqPJjkZ00Jnq6GPg2zF9HlZtbnXhLWBqS9AdIpBVaRyhE?=
 =?us-ascii?Q?6OTsGXNu6bqzl1f3hH2RwC0/rUTJVzfuQCMcsY3cbd4vrU0r166FujYQzcrO?=
 =?us-ascii?Q?+gp7nViZnIR8EQTvusQcEd4TAAL/cYHD9mR0sOZtOgMrET9L38vB2N8vd7lr?=
 =?us-ascii?Q?Dtvs9CwZBoXNgNcKOJqk54n8F+K1B23ROvZ2PeYQEJLhsuKuIvjDu5di5P++?=
 =?us-ascii?Q?tBpC3QUP3X/S7HTj6gP8WRPfJCBWsiCquhzb5+YxUGTGTrRgpCVx5JnHE81E?=
 =?us-ascii?Q?Q7/m+dQern7BVKuLoqAfuy5KQtDJMPccxN20eErSt3WScNq6LolJ4vpJWRZH?=
 =?us-ascii?Q?4Bab3nbemzqCCRISvH4DI5t7WOua4mv5BNB0jHg+DkN3D7kagb6ieKcR2TYp?=
 =?us-ascii?Q?tUcV/lUyqqVfNE+wA03yMt3E2cjcTvDuDPwVfDOcWv9YkjVynsBmSn7F8jv0?=
 =?us-ascii?Q?0PDvyp3E6mfo92g5G+4NfxLv0JmTuJAttZ1gTwpzZQOzu9nx6QlGI8PEGW5F?=
 =?us-ascii?Q?hUZM+lEdMlRm+fwjcWAcnjujMa/sFMGtAoqhng74cHJIIwRykW7e0Ago2270?=
 =?us-ascii?Q?ccSt+Z2TuHyDp+Hqy+aPassVeprl1b6/+LxraiXv+lv4L454z37ARXrUriR3?=
 =?us-ascii?Q?1eGrF6mxVgf1XxSX5o/FKfN4Y5FxmZEWPM9A5Jk1A6sZpm0BZ+UQLp20hmph?=
 =?us-ascii?Q?7Wx263IXXMZUqzPsNrhoEI3vJ5dDoXNYq7X7YgbHvk6V16adQ1SG7hOHt6br?=
 =?us-ascii?Q?HPAg6O9drHgRiG0Hxi235XypkvUio3BIKrgjNv+V9XfK6sgQNhNoKijQrxPp?=
 =?us-ascii?Q?63MtoZ3UXl51NclhOL+nXlEFOGN9jn25CJy3N/JcKx7zeh276X5k+VI06vv0?=
 =?us-ascii?Q?Ypy3Y1jiKITgDxgoMQgDo4//9z3g0dKaW/gDWtkIzcWfZZOXkMOKJTUzp2X1?=
 =?us-ascii?Q?CwZzLxVXi6kTEAkkUilgbttuveRhbxqgsGiNKYOYE39COnXAYpVN59q8vPzv?=
 =?us-ascii?Q?WtaF7CuRLHjCStgMgtFvVvLQMwfcGRAe3faFlJ+NOcZiWsnZ/fu/KsGc/HkX?=
 =?us-ascii?Q?/2BQOoeWmMcftR+mE07+B/MvNrn2980Ty38ENBeeWZ35KCFR+qWR2EWs3XOS?=
 =?us-ascii?Q?k8IRSWLAO8VxnBQrbgBT7KxvQTxU0AIT1/51TZg3x7wEDpiPS4ocRRLe+O2c?=
 =?us-ascii?Q?eNJO41cWpa+pyKPvYX3DYXTsO/ZfMC3l8HwCJqQipfrfqefwFHe36EwXyDFY?=
 =?us-ascii?Q?YMNjeDj1bltrp9HB/UWLVJ8wRgRQSdeR4M8iGskfkHN36YM0/z1cy0Lw6lHs?=
 =?us-ascii?Q?mDahAttRxMdy83yWrWJ7rTvLDwBhZzWwv6sUC3sXiXzAGIJaHOPWSXuVjm46?=
 =?us-ascii?Q?QwB9ro7RQ6ctB0NIlkD5xm5AZrBupXmuncU34AQ6hUruEkBAgrR9PjttgM3p?=
 =?us-ascii?Q?SmJphZ8PMefKqsZ3NAdzwOuRnr2NjKPHcJHEhpoWrZeoKeHXeOE61anx1q5c?=
 =?us-ascii?Q?TpKkPNP3p/vH9OllOheU3yKebVvXPokOUkG4wxM/g/nQmGBhwgWu6ki+ReHH?=
 =?us-ascii?Q?FfmQ+/i81XtpJIiEYY6qmbS45j+NJGNL/JVvd3+IL7GJ+6bi++P/xQ7dfALB?=
 =?us-ascii?Q?gxwqTfGRyA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec8e184-bd1d-4f83-7bbb-08deb7693069
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 18:45:55.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2DekKLaRtUeJ0nYFQBpLR8zVlgPnUTXArwj/zoHMTF6/nOGYrLJcDDsUG+ydtsHa+GPBB3Jh/d84RPlIeW6uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10062
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62541-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 690105AB38F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 03:26:45PM +0300, Mirela Rabulea wrote:
> The v4l2 helper v4l2_async_register_subdev_sensor() calls
> v4l2_async_register_subdev(), which is a macro that expands to
> __v4l2_async_register_subdev(sd,THIS_MODULE). Since the macro is expanded
> inside v4l2-fwnode.c, THIS_MODULE resolves to the v4l2-fwnode module
> rather than the sensor driver module that originally set sd->owner. When
> v4l2-fwnode is built-in, THIS_MODULE evaluates to NULL, which then
> overwrites the sensor driver's owner with NULL.

This is problem. but this patch can't resolve problem 100% because
many sensor driver have not init sd->owner before call
v4l2_async_register_subdev_sensor()

suggest solution like what v4l2_async_register_subdev() did

rename v4l2_async_register_subdev_sensor() to
__v4l2_async_register_subdev_sensor(truct v4l2_subdev *sd, module *this)

#define v4l2_async_register_subdev_sensor(sd)
	__v4l2_async_register_subdev_sensor(sd, THIS_MODULE)

Frank

>
> This causes the problem that the sensor module's reference count is never
> incremented during async registration, so the module can be removed while
> the subdevice is still in use by a notifier (e.g., a CSI-2 receiver
> bridge driver).
>
> Fix this by calling __v4l2_async_register_subdev() directly with
> sd->owner, which preserves the module owner that the sensor driver set
> during probe via v4l2_i2c_subdev_init() or direct assignment.
>
> Fixes: aef69d54755d ("media: v4l: fwnode: Add a convenience function for registering sensors")
>
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 77f3298821b5..57284b7adddf 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -1282,7 +1282,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>  	if (ret < 0)
>  		goto out_cleanup;
>
> -	ret = v4l2_async_register_subdev(sd);
> +	ret = __v4l2_async_register_subdev(sd, sd->owner);
>  	if (ret < 0)
>  		goto out_unregister;
>
> --
> 2.43.0
>

