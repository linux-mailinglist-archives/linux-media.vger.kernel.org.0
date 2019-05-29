Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 799482DF53
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 16:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfE2OKh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 10:10:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59546 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727086AbfE2OKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 10:10:37 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4TE7mmE002591
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 10:10:36 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2sssn0wnsm-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 10:08:47 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-media@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 29 May 2019 15:08:38 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
        by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 29 May 2019 15:08:34 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x4TE7IM833227118
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 14:07:18 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 836E8B2064;
        Wed, 29 May 2019 14:07:18 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D45AFB2066;
        Wed, 29 May 2019 14:07:17 +0000 (GMT)
Received: from [9.41.103.158] (unknown [9.41.103.158])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 29 May 2019 14:07:17 +0000 (GMT)
Subject: Re: [PATCH v2 11/11] media: aspeed: add a workaround to fix a silicon
 bug
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
 <20190524231725.12320-12-jae.hyun.yoo@linux.intel.com>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Date:   Wed, 29 May 2019 09:07:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524231725.12320-12-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052914-0064-0000-0000-000003E678F1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011179; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210292; UDB=6.00635860; IPR=6.00991325;
 MB=3.00027101; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 14:08:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052914-0065-0000-0000-00003DA886A4
Message-Id: <03a3cf74-3fd3-982e-ec37-014ed4a13b47@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-29_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290094
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/24/19 6:17 PM, Jae Hyun Yoo wrote:
> AST2500 silicon revision A1 and A2 have a silicon bug which causes
> extremly long capturing time on specific resolutions (1680 width).
> To fix the bug, this commit adjusts the capturing window register
> setting to 1728 if detected width is 1680. The compression window
> register setting will be kept as the original width so output
> result will be the same.


This is a bit curious, why 1728 in particular? And what is the behavior 
of the VE when the capture window is larger than the actual source 
resolution?

Thanks,

Eddie


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> v1 -> v2:
>   New.
>
>   drivers/media/platform/aspeed-video.c | 26 +++++++++++++++++++-------
>   1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index b05b073b63bc..f93989f532d6 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -824,8 +824,27 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   	struct v4l2_bt_timings *act = &video->active_timings;
>   	unsigned int size = act->width * act->height;
>   
> +	/* Set capture/compression frame sizes */
>   	aspeed_video_calc_compressed_size(video, size);
>   
> +	if (video->active_timings.width == 1680) {
> +		/*
> +		 * This is a workaround to fix a silicon bug on A1 and A2
> +		 * revisions. Since it doesn't break capturing operation on A0
> +		 * revision, use it for all revisions without checking the
> +		 * revision ID.
> +		 */
> +		aspeed_video_write(video, VE_CAP_WINDOW,
> +				   1728 << 16 | act->height);
> +		size += (1728 - 1680) * video->active_timings.height;
> +	} else {
> +		aspeed_video_write(video, VE_CAP_WINDOW,
> +				   act->width << 16 | act->height);
> +	}
> +	aspeed_video_write(video, VE_COMP_WINDOW,
> +			   act->width << 16 | act->height);
> +	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
> +
>   	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
>   	if (size < DIRECT_FETCH_THRESHOLD) {
>   		aspeed_video_write(video, VE_TGS_0,
> @@ -842,13 +861,6 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>   	}
>   
> -	/* Set capture/compression frame sizes */
> -	aspeed_video_write(video, VE_CAP_WINDOW,
> -			   act->width << 16 | act->height);
> -	aspeed_video_write(video, VE_COMP_WINDOW,
> -			   act->width << 16 | act->height);
> -	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
> -
>   	size *= 4;
>   
>   	if (size == video->srcs[0].size / 2) {

