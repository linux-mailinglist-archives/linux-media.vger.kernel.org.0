Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 086B32E1FB
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 18:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfE2QIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 12:08:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46504 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726062AbfE2QIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 12:08:05 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4TFwqgS003343
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 12:08:04 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ssw6w8fbf-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 12:08:04 -0400
Received: from localhost
        by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-media@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 29 May 2019 17:08:03 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
        by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 29 May 2019 17:07:59 +0100
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x4TG7wKw11665914
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 16:07:59 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E151D6A047;
        Wed, 29 May 2019 16:07:58 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6017E6A04F;
        Wed, 29 May 2019 16:07:58 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 29 May 2019 16:07:58 +0000 (GMT)
Subject: Re: [PATCH v2 08/11] media: aspeed: remove source buffer allocation
 before mode detection
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
 <20190524231725.12320-9-jae.hyun.yoo@linux.intel.com>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Date:   Wed, 29 May 2019 11:07:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524231725.12320-9-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052916-0020-0000-0000-00000EF1AE5D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011180; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210332; UDB=6.00635883; IPR=6.00991364;
 MB=3.00027104; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 16:08:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052916-0021-0000-0000-000066039819
Message-Id: <9c99274c-5c7e-a97f-16b9-55f4f9d8d945@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-29_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290105
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/24/19 6:17 PM, Jae Hyun Yoo wrote:
> Mode detection doesn't require source buffer allocation so this
> commit removes that.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> v1 -> v2:
>   New.
>
>   drivers/media/platform/aspeed-video.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index c0b889141b8f..4647ed2e9e63 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -731,27 +731,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   	det->height = MIN_HEIGHT;
>   	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
>   
> -	/*
> -	 * Since we need max buffer size for detection, free the second source
> -	 * buffer first.
> -	 */
> -	if (video->srcs[1].size)
> -		aspeed_video_free_buf(video, &video->srcs[1]);
> -
> -	if (video->srcs[0].size < VE_MAX_SRC_BUFFER_SIZE) {
> -		if (video->srcs[0].size)
> -			aspeed_video_free_buf(video, &video->srcs[0]);
> -
> -		if (!aspeed_video_alloc_buf(video, &video->srcs[0],
> -					    VE_MAX_SRC_BUFFER_SIZE)) {
> -			dev_err(video->dev,
> -				"Failed to allocate source buffers\n");
> -			return;
> -		}
> -	}
> -
> -	aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
> -
>   	do {
>   		if (tries) {
>   			set_current_state(TASK_INTERRUPTIBLE);

