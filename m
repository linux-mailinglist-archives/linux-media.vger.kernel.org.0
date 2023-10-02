Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D357F7B5185
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 13:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236756AbjJBLhd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 07:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbjJBLhb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 07:37:31 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2051.outbound.protection.outlook.com [40.107.8.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20662D8
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 04:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1c1K7D3mglgGYsE+0flpwX1g5aYu2oAMymdKACvGPzVTc3iKwbjuj8MMnhLXnFUN/z7GcNclhJpMHxq+Eb0ZhywYGJkdUgzKOeMHqMK85l7rEYkhtey6BDr+39iFU09sUyLs4vRAzivkYVvgBTvUuFcVAKva9eG8isTmqA/JWg116PSM7MABzl2xSVs4L1s/MOrgoXY3X2bxDeKEXHVtA6hw3XZvJ2DDSC2U7j/zqUGH/egc9F1OseLm5cr7A8FJWJVoa4GsT3pA9itaf6LZjv6ZZq7qEpWec/p6W2Qdl99kTBSQq6N7NU7kxULr/AgLGHylAxBVhnD4K6+oA2wPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uectt+UilDl/IsyimOu0Uq44UrkcmhSLg/3mltVnfTo=;
 b=Rm85nwKmqXRz9lz8y23j3yrjTS6c/pWDd19Nt4SyglXChYGFvQZvg68849o+HoLx0GJaSeah48AVEOrvGbZ7w/cIuwM669e2YYjQPMiYxjUBMQKLY+ie6+TkCfuQlxcLkEpYkPER5esQypnT6prDLVSz4vQF/L3PpDaBlk3iWP+CxLlLVQW7nQWInW9rO3cVqIqSMPVOtUlcPj5ayRQh95G2hHlhKGijOqsY4Oev2kqGghCJMeRwugdU9i6zHkXLDaow2mCOt4zroZXjzDRPDSm+IBBe97BzpssGW6NZzv5AAhAi0smIz9j8OevwdaHCoAtH8KsUjTec9uuLoqZNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uectt+UilDl/IsyimOu0Uq44UrkcmhSLg/3mltVnfTo=;
 b=v2H2xWENTAqonCTfF+qUmE++sGQWIMm6CexD7UpH2tI8WDNL2fSeWmBDM0qQ3sFQTF86z93CeWcKaP820xoK8MLgUv4Ry7TOKZdiYQnCz5gZ4x9g5pa1tcGtCLS7YLrVHVSpFLE4O37D+FsySYCBV5RT/ZETbv83Ytl3benXWWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AM8PR08MB6516.eurprd08.prod.outlook.com (2603:10a6:20b:363::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 2 Oct
 2023 11:37:25 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::8c2e:9706:f4c0:e3f4]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::8c2e:9706:f4c0:e3f4%4]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 11:37:24 +0000
Message-ID: <b2faf524-a6c8-f8df-7831-0c2688ba2c38@wolfvision.net>
Date:   Mon, 2 Oct 2023 13:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: i2c: imx415: Replace streaming flag with runtime
 PM check
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
References: <20230914174600.850-1-laurent.pinchart@ideasonboard.com>
From:   Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20230914174600.850-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0170.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::27) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AM8PR08MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 809d0352-3658-404b-b3a6-08dbc33bf2d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8TASqHw6KOA9lErh+FGDdHMpvH1OfHUnarzMgobvTkUzYQvrhSMZwcs5sHrUtTJ7XQzctAGKwrKPqqEU6jao52spcqlRl4EYYN2roHBsvabj+j0oipbr7HTcQriYDcfYEbOYkxzodcnP2QHx3RjReAn+QTLO1sqzOjSkTt43Tw+jdUD29geOglWnjDM1ZoS/m4QkXuwh7q+mxR25GCpQ6fkD9OYJcOv7TZLQ6vVlRSiNiHLRZvRKnZeYEWDbOEYNYRADVpDhO4B4703ew738BDGQvN16d6riii08LIBqub+6QS2PLbLg+mRzKJyxz0hRshe0JY0CGhCsoX9yM9rJD3/ga1I4XxrhiIcDs7EDSYwZHvhZZmclq0ZyMecLDIxIzv0IFlfrfP3AKzf6gAhNaiM+KOs1fzHiGJgFKZXqD5iA53ewGqV6HuoyoEM61qzEUced6yG7LzSOF/Qi3CbY1hBszWqRHQMcRnK35tenQQerJZ3a5wi7/vbRSuN/z7tYnt438qPdegBmwhSeJ8hBl+/RGD5OkLitkd3N8eQeZaQ2xxCdJ8fuLnJhuX8fEnfngu6a/Hgz4qbQO3TSudQWR10UG57S3VvJBQnD+Hf7ufsCKmW4jgsB3/qQYgfgvgb26fLnbc3T20FvdtaP8dmIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39840400004)(136003)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(31686004)(478600001)(6486002)(36916002)(6512007)(6506007)(53546011)(38100700002)(86362001)(2906002)(31696002)(316002)(83380400001)(26005)(2616005)(36756003)(8676002)(44832011)(66946007)(66556008)(8936002)(4326008)(5660300002)(66476007)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkFEay8xQWErc1d5T2VRVExhVWY5bFZmTFNKVVkxdnlBUVY4WjBVYStnV1Ir?=
 =?utf-8?B?ZXZPeE9vakYrOVBQeUtTOGFJd3hhMXdnSGhGMTB3NU11WUFGNVZCWWRuMnJp?=
 =?utf-8?B?eUxVSUdFRzZiQ2wvQzFIVXA2UGtOVE9ScnVJZEYwaXhoM2pqalFaZkE4Wlg3?=
 =?utf-8?B?elVtV0puTHJrQm5HU1pxMW9VZ1B1N2kyd0NCRXVWNTFRemh0bDhpZ3k1aHpL?=
 =?utf-8?B?cDZScmFIWGVQanBueW9hY1Q1VjR6MDMyVE11S2I0OVRvNlVFQTdQd1ovOWV5?=
 =?utf-8?B?OHZsOWVmNUNqbXlxZ01tMlRYQU9wdHFxWE1JNzhHYkQ4QkhUT0FzelFsc0Zi?=
 =?utf-8?B?MXhVM1l3amUyOUZLYnR5VVpJOTJpMlFLZ2tXN3lmdStqb0hZdHFoc3M0dEhM?=
 =?utf-8?B?VmFMK3htbnI0dndsLzBBcytVUk9NOW1iKzcxQU1xM0pENk40NUpKSm92WGR2?=
 =?utf-8?B?WGhJZlYyOHdrNmJ0MTFEb2tGUHhGVGNxMVNiUWhFY200ZzBsUjBOV1pmUGJt?=
 =?utf-8?B?djg0clhrNHlXN2JSNDJxbHZZUVgwOHhWeWsrK21qZklVM0o4bXQ5Q2h6dVY0?=
 =?utf-8?B?VUl4ZDlZY0NuM09Dak1ibTRSUWVIT1VBRGhZQ1VQY0E3M0FmQ1dETVZJaVFR?=
 =?utf-8?B?Yno4L1BHaFJHODNGWFB6VGdWN1JlaTZsWXRYZHJqbnA1VXdJT0ZIbHBXNWVD?=
 =?utf-8?B?M05lQWRxSHFPaThSL1JQNUw1aGNZUjZadThOMmVBZFFFVnIyeUgrRENVc1VQ?=
 =?utf-8?B?aEk4K2RKa3cvNzdWdUE4YWpOMVZIL1JQNFpUNCtnVTBZbXhtWldTWkEzNUlF?=
 =?utf-8?B?UmJyYTZtd3JvcGt5aEZqL0VDR25IVmViTzgyeE9LQmEzYXJVcUNVOVNpN3ZM?=
 =?utf-8?B?L0JDUlkxMmpuZGUvaGl3ZG1uSmQza1lJbXlCTE8vYTc0QTBqbGpDM1ZnRno3?=
 =?utf-8?B?cHlYUFhSYkxrTSthMEhkcnp1QlRNUmppMVIweUxDSUlzVUQyQ2dWaE1uNjdG?=
 =?utf-8?B?NzFEZEttYzZQYjRpZFVvcWZSYTBGWVd2bVRIbFVYakh6ZHIwWm8wM2pVYXNi?=
 =?utf-8?B?S1NUUFVKN1pIeEtHbWpFcktYdkF3Yy9GbjJvYjMrNTAxcHBDK0c5eDBEZXVa?=
 =?utf-8?B?SGE2UFhwS2RQbGtISGZGUExpczBPdzN4MkphM0pUWkw1eFpHTnNkaERuQnVw?=
 =?utf-8?B?QVNEY1MvUnJNUkpEK1JLVmQ4Z0EzRnNrUGdzWlBmK0wvT3pYaGhhR0RNc3gw?=
 =?utf-8?B?c0RxTlNGc0dNSExvdXNjNE9aL3ovcUtXQmxHeU1WNVJ3MUhQZjhrdmM2ZkVN?=
 =?utf-8?B?eWg4VURhbEoydGlRcm43bWxvZXhYcFlOZE1MQnNnT0NueFllVml6TUs2ZXht?=
 =?utf-8?B?ZHJaMU9oS0FNekVVcEFibzdXK1EzT2NSNVZsQVJVQmxlYlRXQ0xmTXNRcEJp?=
 =?utf-8?B?eFZFRlNxaWtHWWhUcWU4Zk0zZGhadFRYc0VXZ2liMjhnN0hrbzhXcjdaTHhh?=
 =?utf-8?B?RmlUZnpxRzRxNnZ5cmpPWHIyYWtRTVdCUHhUakRCQWN5aVRBZWJJeVRzb1Qy?=
 =?utf-8?B?V2Fya2VWUit3Y1lDd005ZGRSSFpMZlVPNjkwc2xoMUZobUNjUDVMSVMzdUhU?=
 =?utf-8?B?RkswQnZhQWdMaVNLQUpCYnlxc3lablNYamhZM3hOa0NaTGgyRXVuRGVoMWlJ?=
 =?utf-8?B?bitzYThpemRqbzVycEl2dTJwQmh2eDdBTEtBVXVRSnV6NXVXNUkzcUZzMkdK?=
 =?utf-8?B?UkVHZXN0YWxxeXI0bDVjOXI4UGIwUjMwdXBMNWljREpMczN3VjdVNmViNk0z?=
 =?utf-8?B?U2JGQ1NmbVdtUjdFWEYwTWhYUkdxYjhKd1NjVmJRQjN6K3ZPQ0orS0NNMkN2?=
 =?utf-8?B?QTczOUhITEI4S1JiSDJCTXRZTEIvajA3VDN2dkJvSEJXWHhxUnhJM3EyYysy?=
 =?utf-8?B?M1NRS3Jqa2xxU2lzSmRTMXFENlVmbXRsWXJMVW83TDJPUFY4eURqblc1UGh1?=
 =?utf-8?B?bExQcmNpY2hzWStWc3F3NHJEUGxzYVpheGxaY01Za24yWXVWTURBNzhYbkFP?=
 =?utf-8?B?SFlycG1RWWpYWVkxek9OSDlNbDJmRTRlV1ZIem83N04xUHl6NGxaMGRzYkpv?=
 =?utf-8?B?L0JYNjQ1eXVLUEZQZGp1Vm0zVitjZUM4bjR1YWtoVnpRd1VwZENFY1ZnMWlI?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 809d0352-3658-404b-b3a6-08dbc33bf2d8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 11:37:24.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlF9hWQQRSAJBSbzI6wxhoJcf/2I8aytDge8dsZjisK4mp8p6WxUIJAjceJ+A4vS0pLvccf1+vGC48M4drwsGym2ChPp+XgW3OVrUG+R2ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6516
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 9/14/23 19:46, Laurent Pinchart wrote:
> The streaming flag in the driver private structure is used for the sole
> purpose of gating register writes when setting a V4L2 control. This is
> better handled by checking if the sensor is powered up using the runtime
> PM API. Do so and drop the streaming flag.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

LGTM! With the fixup in the V4L2_CID_ANALOGUE_GAIN case you already
mentioned applied

Acked-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks and regards,
Michael

> ---
>  drivers/media/i2c/imx415.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 3f00172df3cc..346f623c1331 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -353,8 +353,6 @@ struct imx415 {
>  
>  	const struct imx415_clk_params *clk_params;
>  
> -	bool streaming;
> -
>  	struct v4l2_subdev subdev;
>  	struct media_pad pad;
>  
> @@ -542,8 +540,9 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct v4l2_subdev_state *state;
>  	unsigned int vmax;
>  	unsigned int flip;
> +	int ret;
>  
> -	if (!sensor->streaming)
> +	if (!pm_runtime_get_if_in_use(sensor->dev))
>  		return 0;
>  
>  	state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
> @@ -554,24 +553,33 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>  		/* clamp the exposure value to VMAX. */
>  		vmax = format->height + sensor->vblank->cur.val;
>  		ctrl->val = min_t(int, ctrl->val, vmax);
> -		return imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
> +		ret = imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
> +		break;
>  
>  	case V4L2_CID_ANALOGUE_GAIN:
>  		/* analogue gain in 0.3 dB step size */
>  		return imx415_write(sensor, IMX415_GAIN_PCG_0, ctrl->val);
> +		break;
>  
>  	case V4L2_CID_HFLIP:
>  	case V4L2_CID_VFLIP:
>  		flip = (sensor->hflip->val << IMX415_HREVERSE_SHIFT) |
>  		       (sensor->vflip->val << IMX415_VREVERSE_SHIFT);
> -		return imx415_write(sensor, IMX415_REVERSE, flip);
> +		ret = imx415_write(sensor, IMX415_REVERSE, flip);
> +		break;
>  
>  	case V4L2_CID_TEST_PATTERN:
> -		return imx415_set_testpattern(sensor, ctrl->val);
> +		ret = imx415_set_testpattern(sensor, ctrl->val);
> +		break;
>  
>  	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		break;
>  	}
> +
> +	pm_runtime_put(sensor->dev);
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_ctrl_ops imx415_ctrl_ops = {
> @@ -766,8 +774,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
>  		pm_runtime_mark_last_busy(sensor->dev);
>  		pm_runtime_put_autosuspend(sensor->dev);
>  
> -		sensor->streaming = false;
> -
>  		goto unlock;
>  	}
>  
> @@ -779,13 +785,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (ret)
>  		goto err_pm;
>  
> -	/*
> -	 * Set streaming to true to ensure __v4l2_ctrl_handler_setup() will set
> -	 * the controls. The flag is reset to false further down if an error
> -	 * occurs.
> -	 */
> -	sensor->streaming = true;
> -
>  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls);
>  	if (ret < 0)
>  		goto err_pm;
> @@ -807,7 +806,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
>  	 * likely has no other chance to recover.
>  	 */
>  	pm_runtime_put_sync(sensor->dev);
> -	sensor->streaming = false;
>  
>  	goto unlock;
>  }
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
