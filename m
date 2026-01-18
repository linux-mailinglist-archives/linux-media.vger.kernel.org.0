Return-Path: <linux-media+bounces-50987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C768D3989A
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 18:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4EE6300B286
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 17:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F002F25E4;
	Sun, 18 Jan 2026 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jul9oPVN"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB521019E
	for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 17:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768757963; cv=fail; b=MKVlZcJKtGF0VlQkPL8TVrYCZ4G6QC3HUjFmJiAwKZGSTuAEnwWInEcHIBoHy7PKKBU0rz11xgP38MVq2in7P3DUyJ0CNb9nZccfMCyX5l4UbjOomKhOe//YlrZLLZNbA4fqYgcvAQkMW3ybUyERbl3K/EGNSVHFDbq06PYNm+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768757963; c=relaxed/simple;
	bh=OcXVD+HagNBiWsrSRAVntQQBptuuAiI+8Q4+6LR4CIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rDeiuYNv90cBjnyb2jDAkA8zJsoyTWUlhCuzlETTprl0s6syY45GQ65hIuoWkuksh10/Z1WNpwFF4cb+qv/PYh1HXS4PB6WVfP0hPOS9kCOvbU8YdPCoM9xSKQ32W4sfzF5jANiTaT5Aa2UYwRBmzf9s3lQLK6yWg33YKjYwSbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jul9oPVN; arc=fail smtp.client-ip=52.101.72.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpBGPV2IkoZCIEbQtFOAMN/MuNFixDjsLPDS93vD/VhpbI1spGUMulDtBA1qU4p0+eGAhcX1lmU3Y1+EbiKE+1kFuCc7ziqXDOrOgFUmtaAZaXvgK9jwBgC7ylxscUxmXaOvGv2mc+ee0THGoQQI1bCSXBTMiHDBzMLID6ltTWaFkhKVi9oXdp5nGU+DCZ+VGVQTX5MGNtcEFymX5nW7ZW+fSrLHo0npwSI+173ikln4soJroiq1j1Dhn5RbiOOB8qi+e7JDipUTEfNRUJbSxMwE/kwdFelF/0hfO40NAHkD7WKn2xoe8GsaakYJmI8faVuo8ZXehv4yZJxAMU9C1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkMMWc5CpA6sVVfC4iAmc5siR8ES1qkj1V4Hp5WqV/M=;
 b=ZjbQ8E96xasOZK3eM1pAEsSbPsy7W8fViwtkwBcn9/DaswJA6Mbxjm23BCU6aet56H7zpQ6a9kvZv9hgBHMAItS+XzjabmrTRaa/yV4GGmccihF6zHrS2D4Z6zfQxWF4FoUw+/6bQbz2iGtc/rEFb1+7rXmjZg9aUunmfP3zcTlEDZiBzQxCPCRalhn1OAsJUaI/XDAIS3CQPA17U73ZJ7I1999TTpAEPMt49vqXgd8dWZ8ztndZwLQ72RQ0Tq1ps4/tLO/jSMckZ1agZnD1KEcY5i9UD6/qn6sBAK4uYeuU9zirdOekn0YeZxIjxrYI6pVyjC6VZ+KsAX/QUKwWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkMMWc5CpA6sVVfC4iAmc5siR8ES1qkj1V4Hp5WqV/M=;
 b=jul9oPVNHKNjmRfFb7DxL4U/KqqZqgoQdfcDlhO8qhO0hqd036Wo1MduWD6ej8I77B/zqd95JpO/d3O79Z91XiLzELkG1IZISUH4AE/Rs0wXTtgy3GL/n0dEBS6r/8CHDJdmACLxQK7eyWw2w0Ei8Xf3L0N0YSOH3QKBYAbJT43xhAOOfrv72LdYS4B/R/sQduoDthw91hHAeMSGVmb1ZA6FLLqfVK3bRdQTa0XtILwSX+SozFTzfE0kcREutQqBUfyNjlVu09Jkmn0EfCg05wH97VHloZ4IMYTosFzU6M3+eqc5Ba7wGyaf3eme4o8SPKs+RY3oAFwWCHu0N98DXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DUZPR04MB10014.eurprd04.prod.outlook.com (2603:10a6:10:4db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 17:39:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 17:39:19 +0000
Date: Sun, 18 Jan 2026 12:39:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: ccs: Switch to guard and scoped_guard
Message-ID: <aW0awWgzsELqoEes@lizhi-Precision-Tower-5810>
References: <20260116110915.219262-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116110915.219262-1-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH7PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:510:23d::11) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DUZPR04MB10014:EE_
X-MS-Office365-Filtering-Correlation-Id: 809d9e9c-4bb4-4714-c8b9-08de56b8827d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fGsUYGP9ywK0tK39ULqS2SglOMuy4+Z/81ngviIeEjoBX04WlLIkY/+movLH?=
 =?us-ascii?Q?WkSlj61CDZ4R3z1LiEQ6pLTVo6C2cNEf9CEjctIIyQiQtOUy0jAmOSZsgnJK?=
 =?us-ascii?Q?vypOykvVYnZF88AquI4q2gkisykohDlsIpmg83puoIsQtg21FAHJzWQotTzW?=
 =?us-ascii?Q?kEJ/L18NrmUcqw7Z2Zu0OW7ubIrc9I7uz6vJ16u4vyP2HplhNBumEepfHCsK?=
 =?us-ascii?Q?S7xSLhben1Sv6RSUmJcXPfPkCEcpXlUIeGXrjs40biCrHdwMyl4Sux8Dy6sz?=
 =?us-ascii?Q?IDYZEe2rJNnUFqftI/1LTqiOopqojffa7KEsLu+xrXO6DHrmg7HwOi3jrAky?=
 =?us-ascii?Q?rk7XkYI+H/7YOVLIe9rV3mnrdvvUvADDFl5WzQ7Wzywxohau1+CaQSug8u6q?=
 =?us-ascii?Q?9zF/WLxL9njy5a7UCcSz1uAAEYLZsoON3sfMjztrw8TS8ibZ1jZGYFtQvuf3?=
 =?us-ascii?Q?6XEnv3HnwSgBvCfKb04ziFWveC/H9218v39QsRPibNqPlbZUBBv/oGY8rUtO?=
 =?us-ascii?Q?vVkPrDB4vtjiifHPpTOgOx/wI54uGSHUJlxUmrFc5aqtOtWlDXh1VVpxcQj9?=
 =?us-ascii?Q?Kn1WA3yJ8X4RND8mJqEc7SOt8GSi+HyO20VQ2q1kKBmiClk5lUJE04rPPT0e?=
 =?us-ascii?Q?yi8tTqM/3vlpyl10XXXXBj4IJjhZx/8DtnZggdTsqtKt+BfNb7rw3gGl1BaP?=
 =?us-ascii?Q?7qCANJKAZ0y0piGtt9R4zZfDQWaw9E2MsGNGu8JzzSxd9CJmaw38OiObiwA7?=
 =?us-ascii?Q?uTZIese5JIr69hSE7PgIKkehbt5hf3v5y/+7643mOlYBxTpGZ9IZhD8QjZTn?=
 =?us-ascii?Q?PZn8r+4H5z4OMRGRGXyIR+cWk+UbBf1OaHu40ZdClbg+ODwxLkHfJCuIKd8U?=
 =?us-ascii?Q?w6J9iQCLvg69GgnRZOID9Egcr7xN3gop1SzqD5zU2naoYWhanMeoWnWsxN4Q?=
 =?us-ascii?Q?+OhAb6Pz8dF586duLPXJPWy3qvZ52p9t+aw7RzPgvU9xVUceSDHdijtIGFwR?=
 =?us-ascii?Q?T3KqGPfOWOfF0zacTO+OJBKKyM/KkXKZmPd/+0xY8+8hB6TeOhlJDYE8ypqi?=
 =?us-ascii?Q?WJ+CjmYilyJ3zSrrZtwR8Lk+4/gfBxzWK4Pt2OgXc+1trUFDiDCsVolF3T/6?=
 =?us-ascii?Q?D8NNh3TUriY1r4d6TZvYaleCV7tUAW5dAnZCBPubLX1Dmw9zzFVzORq8k3Yl?=
 =?us-ascii?Q?M7/4qu0ywX9XGvjT7r6ASF0MK6VCX6vJTRJ0fxCS31tVwOt1RZvxpe9aTtEZ?=
 =?us-ascii?Q?S3jxNRpC/3mLx//33DDtz41UYDPrxFO1W+9NzBEAF77UzePUlLryfElF6tWZ?=
 =?us-ascii?Q?Ztsd0szWastKXKGheLZHCRi3damaMS7ev3RqQtXBqv/Incs1NSDK06vf+/2k?=
 =?us-ascii?Q?uQNhs0h26JxEgj2IYKIEX1K36hEUYDP2bsfdB37kj2GBWnhY4uQUIui+r9wB?=
 =?us-ascii?Q?o3WerjJAb4ZiG8U6IETWevOjZgFcXQCezRceKdYyq+vAcDZOR/1tBFrdqf55?=
 =?us-ascii?Q?IpbzxXmVkj2N8MJ9DY1nZIBT5lVWRrhOkE6F8qmHKRAhJ4WztMfJHTxYpXfB?=
 =?us-ascii?Q?I06Gktwi0Glkb8xur10yJJrCPyMiTncE9e7ZEJHQf5URZyg3Qo8muA2/PJLg?=
 =?us-ascii?Q?ANjsRitP83HiNuSWk+eiCc4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?re5dV7i5rccCGiH2vtrXjkxVwihiHezDggRtjwwOIuQTxAa5p8ZtZBF/Il6U?=
 =?us-ascii?Q?xuSdR91o8k8T/RWj7KjLuZ+D6CRvh7PQaVvTJGz0BAyfKIob67/XjAou+tit?=
 =?us-ascii?Q?4VZchMUGKsz1mnA054KaBzTrDfDcNT9xm5MsTkJpqNc8dDQm0zLv8ClSaptO?=
 =?us-ascii?Q?TnTC9gBFmmdu5JVFfZ6fj11ktjNpv5dEryzFDy59vYh9TrJZJSIlYx3r+BxD?=
 =?us-ascii?Q?E+CaUZZMiJ1KHYsBYsKhnDCWHsyNAzDLkeMBnvUUxBbWTTfrd46E8Fdn9u2M?=
 =?us-ascii?Q?BauighI4PY3e6iqKl/RIhj6nvYI1gXk2VYEsYwPIRpHOh2SZvc8EG8IusTAk?=
 =?us-ascii?Q?QpD1S5MZZuZZ7d+A+DqgEvy5HzxWabqaDQMN7XSgIml/78Y5czRtivvAoUsX?=
 =?us-ascii?Q?L2Ae46ZXGE+Gnze7tgBQiDtcVbUww6cjo4thdRGDDyQcpR3yQK0tWJzvIRG8?=
 =?us-ascii?Q?pQfIE9HCo0fAcGHY3LdrvO9BxtlQ5dLPbYvCuBXzImOncRwQ8fmDoPUUyLwF?=
 =?us-ascii?Q?J57hiStsdHW1lFkxR3QfYkUNCw6sgGCTC/sTVSbt0IijniVpgGZQqYAPQtMC?=
 =?us-ascii?Q?wY9aBJAf8TdGtfDxK65LCKk6HFOBfy/VwsC7S9XFrNXN0xcy2Ipps+r6tgzk?=
 =?us-ascii?Q?aKWDgCMub2oFz3dHHIgnlw0NBlFz/Ntu6Chw4WWdu1sYZAUyaGguZxSHlAOA?=
 =?us-ascii?Q?jRoKGtKre7cMBK0ctjFhsR8HTwkWy2co0ieq7j6mGpYj8jW7AjIIL3+YLKMr?=
 =?us-ascii?Q?goMCA/06NSlU8VoIY79ujJ7KQE1CsjQ9nH5dn0pY43SyE2srlJ1Bn34fN9tb?=
 =?us-ascii?Q?nTfAGcj3TMPAHOFmUTQjVe03gSIKI23ipyDLIQyeHx57WTq7FkiugFBov+of?=
 =?us-ascii?Q?2wXd5VAjmjN3LHc1e5qpi1YCxdwL+A4/uv6etVCyG9LPOBHHnm6QW9EzCLQv?=
 =?us-ascii?Q?KXU21S1appGjVDNV6kGJUsTv/IMjUiuCaGJw12GSF+ELnkUg4XE1L/x2ivJ0?=
 =?us-ascii?Q?+A0V6It377Sy5P+1FHWvtgrrCls6ln+o4MqCK1T42ZyFAtIgVb6WswbC5Y8Q?=
 =?us-ascii?Q?sZPlsloXBAoDRbSBTyPylx7oNqgKUJVC0F6+VlCL03L/2/AfJacO3vSa2twu?=
 =?us-ascii?Q?Oj4/S0JdXN0EtP6tqFbKMXAMahIBF0bKa3DAzR/ZSLtNwAQY62QXzwHRKhau?=
 =?us-ascii?Q?KnPbmAMV3NfyoQriBA4tt0hgAFbc+5EvNcY0HQp9FmpjmeJssUWh8U1QBQqK?=
 =?us-ascii?Q?eOTGOodzys0dI2AsFc56rGPDpgV5fzCDL8E6Md816NaoTCuQfGKtsVRrW+8k?=
 =?us-ascii?Q?hNok989K+azwe6xy9ZpyJraXU8qh+fMCrAyXbJUyv+fmOGYBplXBqdVkMK65?=
 =?us-ascii?Q?C/cW3yd8rfasNSqhFFnYQYGjsW5j9CpZZd9koN1/37B+H7639JYgFSEFoWyV?=
 =?us-ascii?Q?HgjvpkQlpgNEsg8cRzSFiwi+gGdcRQiU/PxVXbqDzuBC/bLcow65TLaDAmO0?=
 =?us-ascii?Q?youAlCJdsgPmpVUhLFBSsmOlKXGIfnHZJ9cOhT8EqHJkkAXosTlq5CFW8kpW?=
 =?us-ascii?Q?irfd11qLKRW3MBOB/Mf/OUVIROPniWyl/BasNWGuI5A/0ars7CgNmcLpsKbQ?=
 =?us-ascii?Q?DXl9kyL4SyPUPLHjVCJi3LWgIhUxkfGXY5pYHzxfuDagJlrmtjBiJZt2iIrH?=
 =?us-ascii?Q?FPs9Z6aIhlp+5DkqrPU16pyWsEXjHT4X5wIaGT+fJv8GJgeip6Y/T+EExlbV?=
 =?us-ascii?Q?2YTxCerJyA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809d9e9c-4bb4-4714-c8b9-08de56b8827d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 17:39:19.8218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMAgBrbDX/85jMFjmM0YbCi4STDAIJyEyZ79anGXHPRm8Oyk+kstnITQ/NIKbx8Nvo9wJgA7ugnWvP9sohqO5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10014

On Fri, Jan 16, 2026 at 01:09:15PM +0200, Sakari Ailus wrote:
> Replace the use of mutex_{,un}lock() by guard() and scoped_guard() where
> it makes sense (i.e. everywhere).
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/media/i2c/ccs/ccs-core.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index a99921849d59..73f6cfda7d24 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2006,9 +2006,8 @@ static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
>  		}
>  	}
>
> -	mutex_lock(&sensor->mutex);
> -	rval = ccs_pm_get_init(sensor);
> -	mutex_unlock(&sensor->mutex);
> +	scoped_guard(mutex, &sensor->mutex)
> +		rval = ccs_pm_get_init(sensor);
>  	if (rval)
>  		return rval;
>
> @@ -3045,7 +3044,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
>  		v4l2_subdev_state_get_crop(sd_state, pad);
>  	bool is_active = !sd->active_state || sd->active_state == sd_state;
>
> -	mutex_lock(&sensor->mutex);
> +	guard(mutex)(&sensor->mutex);
>
>  	ccs_get_native_size(ssd, crop);
>
> @@ -3054,11 +3053,8 @@ static int ccs_init_state(struct v4l2_subdev *sd,
>  	fmt->code = sensor->internal_csi_format->code;
>  	fmt->field = V4L2_FIELD_NONE;
>
> -	if (ssd == sensor->pixel_array) {
> -		mutex_unlock(&sensor->mutex);
> -
> +	if (ssd == sensor->pixel_array)
>  		return 0;
> -	}
>
>  	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC);
>  	fmt->code = ssd == sensor->src ?
> @@ -3067,8 +3063,6 @@ static int ccs_init_state(struct v4l2_subdev *sd,
>
>  	ccs_propagate(sd, sd_state, is_active, V4L2_SEL_TGT_CROP);
>
> -	mutex_unlock(&sensor->mutex);
> -
>  	return 0;
>  }
>
> @@ -3553,9 +3547,8 @@ static int ccs_probe(struct i2c_client *client)
>  		goto out_cleanup;
>  	}
>
> -	mutex_lock(&sensor->mutex);
> -	rval = ccs_pll_blanking_update(sensor);
> -	mutex_unlock(&sensor->mutex);
> +	scoped_guard(mutex, &sensor->mutex)
> +		rval = ccs_pll_blanking_update(sensor);
>  	if (rval) {
>  		dev_err(&client->dev, "update mode failed\n");
>  		goto out_cleanup;
> --
> 2.47.3
>

