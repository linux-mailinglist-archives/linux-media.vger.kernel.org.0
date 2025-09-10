Return-Path: <linux-media+bounces-42239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13073B5243B
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 00:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B28DF3B9318
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 22:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B6F2D0618;
	Wed, 10 Sep 2025 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SZYbeYnA"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54871329F35;
	Wed, 10 Sep 2025 22:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757543479; cv=fail; b=lJdaHkm7zd8ZkhxYfZMV+eGx3dHalipOnMJVLhc00YqiR2wlGPU962/HErw+pMBEOcOoi4mHRM8QXpbHePNfpWf0dr/9EE2E/WWpLHCX3umRqh3v9+uTSo4k/20ew28CKzx19A4ASeWO3UKMA2pVcQGfGG3bF+U1nOmIhEQgEq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757543479; c=relaxed/simple;
	bh=VfxJZMJWUebSrVdnxAWJxtwl9p/ngMQLbh/6P7zWx30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q0wwve3S7C9pB4UnsO8pCtXZ9HnOUD0nANspPTSznxsF1GBeMf2LkHNZ4liTbi+LxkzBQuB8XDbstEQMLtMyMxUd+qb4guGBGULzaWTfJLHHZnrblOOQNI33F2BEyUtEE4n3RRcnY/+bTtRkZiDMkkwqButj7QOmwrpyMVMRKxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SZYbeYnA; arc=fail smtp.client-ip=40.107.159.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvTRHI1K8RPcaigWlnLv/NU1bC0nrGu5JZZ4s6j2E8eDh0BIfG29p/hyEdU6NS1UbiPi9WokzrK1lFNmpoG6/S2zqavWyMkNHuxcvBPVMQDH9+wPTx+8dQX5wDCsAWOTHeJYGBxty0mEcu9YSyL6+ID89jWACpoDerQv5vC+pyHIj1T9axEhLRaLGBrFlVAhWsKoi+TYF5G/s8tqVvTQYIkjyuk1J1o+Jgj+ZPwidfn7OLUMfOthpNk6pGMpKCAku5O1P+0nFR+EWgdONbQN91VsSE1f4Hyai1at2f2XpIA2NOfqZLM1x/R+WR91cgfzqsDMUM6B/ZWDg1ntLSlwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej8xgNKBMQ8aRsuLlHB1TRRrqFTTKN539f3xZLN/4Xw=;
 b=jfNNiKSxIQm62ifTCoqOdPW5nvEUqnRrd3Bs4VYB/g/nwVjBKLLIXFJ93a3kc98Iz06ycPq/reluSeCM/6rE9ErC8exWs8Y+4XJnxON386OeUpM0f/+wJRcwtz196zVJt++UxzEeP5P2rS4nhJW+iWc0H5OLeSSNsvUmJrtAkL3MDCocjrSI0Y9/5A3NMBo7O/OsraTVerZi0hftU/hjsnMs2mibMhNxwPLOuw2mO7LOHIizMNBYYQmcmfpX1ByYYZPRDxjJDDAlytXH+FcxP6H7Eo34acVDHSkPrrxEFnwPznPA9F7Mov1l2LN/kv9hNRGAiJnVavkuYaV9kYG9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej8xgNKBMQ8aRsuLlHB1TRRrqFTTKN539f3xZLN/4Xw=;
 b=SZYbeYnAC2C63qTB+gQNliKSK7DMJzC7z26DYDyIuQh7ewDYszz4BYqw+7iBBnTe78Lxd1xwHaiMrLav9zbq0EuewDerwrl166osH/9aBbdT9RHEpJXf6QTqL+jod5sPKvrcDDDZShBT0RymMoy5gMFfUw18g8tlQ1J4f7m+lIFUJwt9SGfA+uJ1qXenhX6/86A51nm2uNPHGyilgEfpfmTp7OfEdsClksm0Xbip3WOtk5OvVqy2JM6r4KYqLFozX4HQH95HtMX/P8suazZaD87GyDn5m2LVMnrS12o4HcovJ+B3NsPo4cu2AmmatDAXSVYrirpp0NxjY5YiTBtf6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB7606.eurprd04.prod.outlook.com (2603:10a6:20b:23e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 22:31:12 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 22:31:12 +0000
Date: Wed, 10 Sep 2025 18:31:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: i2c: ds90ub953: use guard() to simplify code
Message-ID: <aMH8KRdUZ0OQIyY8@lizhi-Precision-Tower-5810>
References: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
 <20250910-ds90ub953-v1-4-a7813ffbdf11@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-ds90ub953-v1-4-a7813ffbdf11@nxp.com>
X-ClientProxiedBy: PH7P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::26) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: fb71e7ab-13d3-4b7e-c154-08ddf0b9bf05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JDVAsOVEbGTqaVHo0o3+Pbsh+cJsV10W5wwgmnCjjki6WW+cHHwBW3RF1Xpy?=
 =?us-ascii?Q?zxO7eh6/vEvb6Tj78PThr2+Cf8M4Fj5hAoGZiDhHD7eplnf1WdwaxDkzdwMC?=
 =?us-ascii?Q?O0azGfokaHMtZtOcjn6FWmU/q2OqQL/FLZftcI8JWo5Ro8/wwvRw9KeLRQ5A?=
 =?us-ascii?Q?+a/gz0FBqcMAALfWdncIg9wJ1itikYIzf40h3cl+Bj9mDqJONPJZdvMKQAi6?=
 =?us-ascii?Q?vMO1/3ct6w8Gv7UXd3zolJeHOKUKewxMhVVNNh6NBiDgKA1AYZc7P9Bg+aS7?=
 =?us-ascii?Q?uLsDpY0LbdEWvapQA3Y8045fZe+i8d0/oBuLumx+L0vJDm0+PP/qsD9xLvud?=
 =?us-ascii?Q?tejPfAV2RUnUQh7OiREOSeEJSy3OTODukQfLBQ4QbtW7XPfe3Cny+JnwFcma?=
 =?us-ascii?Q?qjWDz5CqsyyRg/3XHANRP+OBjcoVg1Z5/eZ+7idYRLnvTi/unI24Db0NeM9V?=
 =?us-ascii?Q?SlFas2FRy3We5YsYSzJ0NiPoj6ni4uXB5dkLc/dt8+2IHhGPn9kWN7XfB8VJ?=
 =?us-ascii?Q?+IBSMmajFhUwmrJyBUg6md7n3oOddZ9p1XzLgSIvRnoJQeZvhycJfVOh4cRU?=
 =?us-ascii?Q?CQM8saStMEtkvL9g2kHfNHLhdkwf8ds2G5eAwmZp3QD2OMEzEM95+I03/jlY?=
 =?us-ascii?Q?97+Bq/4B27J2itPoIfeDCjQ7dhf0U5q1jqsZ2f2W7SwPxMtV2vqbjLst0+uQ?=
 =?us-ascii?Q?YYxy3yxGd3Ou934pq0jbVe9dTfTjUM6vOiiQrcitMRyGWhGBgr34uTRJsfsq?=
 =?us-ascii?Q?cIbzORG7DEHb/nh46h01a3XTSaxmkHO73XQfFZLCs9JcMkw2gTI5+YBlE1Pq?=
 =?us-ascii?Q?d1u9f4KA2ONDZ/i4C69jw5yqzBYxi3aILZVTBUAYM92iYnAJ5XnoQ8+mDzVM?=
 =?us-ascii?Q?XyOEoBeCHcdMdruPmAysYINdryA9hQYtsai4TVuy+9c1ylphsJI8j0kI+oHi?=
 =?us-ascii?Q?cahxMsO24wPoS0PjrQlwZYISuYrOKPdZL3HG3BhUMdwM8+dnLtwV9b8LnXaz?=
 =?us-ascii?Q?eZGQo4J7F9R2DNcROgXhK+njQbA8U5e15RJ+PLYS+Ze45bcSeL8XoPQqccj9?=
 =?us-ascii?Q?PsUhK+PGGsruc7TbldeL47Mj2hhJ66B+uJL5sI2xMidxJoGRKJgokWsR7Zyf?=
 =?us-ascii?Q?LgMBi+9uxyBcT/FZL8uOTMuKsaJ3zNdcE3c+kqdeQIo/s4VUznbZHsNiRG+c?=
 =?us-ascii?Q?+xsY3Gw5XmXxvi2j8NWgHK2x3LL6d4EUwWEdk7DTa/jt+ATypE9xInt2SHom?=
 =?us-ascii?Q?TDCMeUn8WKbIc1g4sYV9DnT5+gBgJZb1z1dq1HQNBmtBcqesOZEGWkYZLaPY?=
 =?us-ascii?Q?wjZK19hW+FL8e/cRTSpDMdD5YwU74An6sSuaw3EYGARi+YsY5fl3pOmz++P1?=
 =?us-ascii?Q?V2k3a56HZwhwkjT3tQbo1Q8wtK2x8i38uOtKZrYvBqgH6VVPMyfJx/4PegvJ?=
 =?us-ascii?Q?27Bxz8VG8qt2svzd2TVRq76F63B4igrTm+bYsSXFQFVMirhahAc/s9GsmAOP?=
 =?us-ascii?Q?13sPz0AscOk0RhQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hr/RPYGDrzNoOnSAwpUeOnJfkA2Qiw5x4doD5Y60nVY2hge9aa9951rGSEt/?=
 =?us-ascii?Q?hP4mUVOqh/lXamb2Rkg+6R4yp0T7mRsi1L0cqacEvnBzZIWQUYPApc2/Qzyk?=
 =?us-ascii?Q?TvHK2G1+jmNO0ru9AWb/vLzGEZCCFTAWCpY0XP/OxQeY38xr/KbLKXB0lqRT?=
 =?us-ascii?Q?k5Z1DyMNAig8CHtR7l+uI3fKdyPO7BD8msYDfkl7uoRkZWglF0Bliw+Umg0Z?=
 =?us-ascii?Q?oZrYt4qODBDz7peBMUzrmuCzQHXdJLA8l+wtHiSY3YtVVcN7FB8hMRClwdon?=
 =?us-ascii?Q?jWfHgClpnTaudW1ZxU7FgkvgkPjfF50k3bc/0wt76RU78rDN8aVdYTjPbDUd?=
 =?us-ascii?Q?RFfyy7rCvyyrIpl5K99lSnTua4jcVpzxQu1jgAlQDR2E9Nw1y/LmNdN3pQ0/?=
 =?us-ascii?Q?yUXoyjTxDZih3xl3N9GAE6jW2lO+2xl/QK5NBKjSqqZ0b8RGV6VrwGHxE/Uq?=
 =?us-ascii?Q?iK3fUg8cEMs/ZJnyy4IFdLZBQyG7v/rnRpbv9XejnNU2TVb9oyY5j3a0IOa5?=
 =?us-ascii?Q?9INqmuZngTWZRJx+wcG5rPwVwb2WGwcktoKCCJwrPrSQMfYILP6ETGyZb9cZ?=
 =?us-ascii?Q?5HCX7iEOndXOxSBTdozjrlyiVeORHWtvZIAjKGTG8llU5dL5b8jCFBzESyoA?=
 =?us-ascii?Q?kXGHKywfrObbX5acZUMGOLJ3JHVL5vmzELaNlxuaw38EcihovLzCcobss3y4?=
 =?us-ascii?Q?vL5js3ScrlRk4ZXCJ4qInJyKhd++jAGfL3IV1xQ6ZR7Cec4GzTL49AGvYTql?=
 =?us-ascii?Q?u2qqzKhD/ZyEgOF5pNJoJqEbwj4PNIRlMXZ2OdwoJTUsfXgYdZVVQ3Px7/eD?=
 =?us-ascii?Q?l9H1uR38XqjU4DzeharZYELyyajEkXBX3vmBpiY3I3b9JrIx0kzHkJrL3PxQ?=
 =?us-ascii?Q?MHuoAMxMqJ4OljoFMpfN0JjnjcLykowrWkILMlfwnOthQRIHjG31nXafeeJV?=
 =?us-ascii?Q?2qHf8j2eHFdOYtWDVcwlTAxy6aR2oPbQL5zI14SbOzAOedIsphR5Egx/4PoO?=
 =?us-ascii?Q?WD/mioj/+V+jj/+i2pHgM2dyRef93K1MaJPDqFmwiKDYpdE3H352W5asQaNX?=
 =?us-ascii?Q?D0QEBks1Sz3cKrOx4jvv5SN8VQhiMT5Q6yHUmoendCI9qVIfJLeR5AujzCoW?=
 =?us-ascii?Q?ap57a4FexfG2OMyq4d0gPZtIuO0Y7pn1OAzBgvbAAdfJYbNXQ6Tsq/iAodoX?=
 =?us-ascii?Q?bLq8wQHKqRVD79G3oYB64c/X+ZRu1ODS8dTZBuA1Ugu6tlE72mPmfY6W6a4y?=
 =?us-ascii?Q?iRG9IajNWS7IgRTvr5MTq13+nDRnLr9dGqd+6AIfRqmVlsZl0Wu0Hm7ivAmE?=
 =?us-ascii?Q?xg7UTus14SN+NDW8z8zIn5crA96CFffr41NaMwHrArpwON2FHH4Qs/c5qKxz?=
 =?us-ascii?Q?x6fvofmwoXbUNhNJS3PCcydCqgwzeZfcwu7HOEwLmHrxrtlRmChGSLVNIG1R?=
 =?us-ascii?Q?AUqb7Cr1PuizZYpIlIXcHtezw7RYZ3wA952Lwxx9yAv0mkasePOAAIJsY2M3?=
 =?us-ascii?Q?W5/s0/3R4BzA3lIPlRwjazlONzPMAzyfNr4VBVrzYUBPtBhOtU2AfjtL3ObP?=
 =?us-ascii?Q?HtxL3UQ6Uu6mvxvoKjCPCD/qlCurkPORH5SOdAab?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb71e7ab-13d3-4b7e-c154-08ddf0b9bf05
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 22:31:12.2981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVwc9UZdrddUN1Ad4MkUWXLec6wxDMrHvT7o03k7vrWjbrK3TB9GZzEcTO/Fokbkah6DNvIQ5OABcEULQqzMxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7606

On Wed, Sep 10, 2025 at 05:44:41PM +0800, Guoniu Zhou wrote:
> Use guard() to simplify mutex locking. No functional change.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/i2c/ds90ub953.c | 34 +++++++++++++---------------------
>  1 file changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index 6f09322553640384b1f43af0dbdf4f54b4ba004a..d7799531773ee32bf9f95eef30618cce9d479dd0 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -112,20 +112,18 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val, int *err)
>  	if (err && *err)
>  		return *err;
>
> -	mutex_lock(&priv->reg_lock);
> +	guard(mutex)(&priv->reg_lock);
>
>  	ret = regmap_read(priv->regmap, reg, &v);
>  	if (ret) {
>  		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
>  			reg, ret);
> -		goto out_unlock;
> +		goto err;
>  	}
>
>  	*val = v;
>
> -out_unlock:
> -	mutex_unlock(&priv->reg_lock);
> -
> +err:
>  	if (ret && err)
>  		*err = ret;
>
> @@ -139,15 +137,13 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val, int *err)
>  	if (err && *err)
>  		return *err;
>
> -	mutex_lock(&priv->reg_lock);
> +	guard(mutex)(&priv->reg_lock);
>
>  	ret = regmap_write(priv->regmap, reg, val);
>  	if (ret)
>  		dev_err(&priv->client->dev,
>  			"Cannot write register 0x%02x: %d\n", reg, ret);
>
> -	mutex_unlock(&priv->reg_lock);
> -
>  	if (ret && err)
>  		*err = ret;
>
> @@ -184,18 +180,18 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
>  	if (err && *err)
>  		return *err;
>
> -	mutex_lock(&priv->reg_lock);
> +	guard(mutex)(&priv->reg_lock);
>
>  	ret = ub953_select_ind_reg_block(priv, block);
>  	if (ret)
> -		goto out_unlock;
> +		goto err;
>
>  	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
>  	if (ret) {
>  		dev_err(&priv->client->dev,
>  			"Write to IND_ACC_ADDR failed when reading %u:0x%02x: %d\n",
>  			block, reg, ret);
> -		goto out_unlock;
> +		goto err;
>  	}
>
>  	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
> @@ -203,14 +199,12 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
>  		dev_err(&priv->client->dev,
>  			"Write to IND_ACC_DATA failed when reading %u:0x%02x: %d\n",
>  			block, reg, ret);
> -		goto out_unlock;
> +		goto err;
>  	}
>
>  	*val = v;
>
> -out_unlock:
> -	mutex_unlock(&priv->reg_lock);
> -
> +err:
>  	if (ret && err)
>  		*err = ret;
>
> @@ -226,18 +220,18 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
>  	if (err && *err)
>  		return *err;
>
> -	mutex_lock(&priv->reg_lock);
> +	guard(mutex)(&priv->reg_lock);
>
>  	ret = ub953_select_ind_reg_block(priv, block);
>  	if (ret)
> -		goto out_unlock;
> +		goto err;
>
>  	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
>  	if (ret) {
>  		dev_err(&priv->client->dev,
>  			"Write to IND_ACC_ADDR failed when writing %u:0x%02x: %d\n",
>  			block, reg, ret);
> -		goto out_unlock;
> +		goto err;
>  	}
>
>  	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
> @@ -247,9 +241,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
>  			block, reg, ret);
>  	}
>
> -out_unlock:
> -	mutex_unlock(&priv->reg_lock);
> -
> +err:
>  	if (ret && err)
>  		*err = ret;
>
>
> --
> 2.34.1
>

