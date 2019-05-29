Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC7DC2E1F7
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 18:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfE2QHj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 12:07:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42438 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726062AbfE2QHi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 12:07:38 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4TFwaCZ058689
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 12:07:37 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ssvrs18r4-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 12:07:37 -0400
Received: from localhost
        by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-media@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 29 May 2019 17:07:37 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
        by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 29 May 2019 17:07:33 +0100
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x4TG7WVg25100572
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 16:07:32 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A7CF66A047;
        Wed, 29 May 2019 16:07:32 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 29A576A04D;
        Wed, 29 May 2019 16:07:32 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 29 May 2019 16:07:31 +0000 (GMT)
Subject: Re: [PATCH v2 09/11] media: aspeed: use different delays for
 triggering VE H/W reset
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
 <20190524231725.12320-10-jae.hyun.yoo@linux.intel.com>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Date:   Wed, 29 May 2019 11:07:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524231725.12320-10-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052916-8235-0000-0000-00000EA02D17
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011180; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210332; UDB=6.00635883; IPR=6.00991364;
 MB=3.00027104; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 16:07:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052916-8236-0000-0000-000045C51C28
Message-Id: <707fc473-0d99-018f-87b7-3f889851863c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-29_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290105
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/24/19 6:17 PM, Jae Hyun Yoo wrote:
> In case of watchdog timeout detected while doing mode detection,
> it's better triggering video engine hardware reset immediately so
> this commit fixes code for the case. Other than the case, it will
> trigger video engine hardware reset after RESOLUTION_CHANGE_DELAY.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> v1 -> v2:
>   New.
>
>   drivers/media/platform/aspeed-video.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 4647ed2e9e63..67f476bf0a03 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -522,7 +522,7 @@ static void aspeed_video_bufs_done(struct aspeed_video *video,
>   	spin_unlock_irqrestore(&video->lock, flags);
>   }
>   
> -static void aspeed_video_irq_res_change(struct aspeed_video *video)
> +static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>   {
>   	dev_dbg(video->dev, "Resolution changed; resetting\n");
>   
> @@ -532,7 +532,7 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video)
>   	aspeed_video_off(video);
>   	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
>   
> -	schedule_delayed_work(&video->res_work, RESOLUTION_CHANGE_DELAY);
> +	schedule_delayed_work(&video->res_work, delay);
>   }
>   
>   static irqreturn_t aspeed_video_irq(int irq, void *arg)
> @@ -545,7 +545,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   	 * re-initialize
>   	 */
>   	if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
> -		aspeed_video_irq_res_change(video);
> +		aspeed_video_irq_res_change(video, 0);
>   		return IRQ_HANDLED;
>   	}
>   
> @@ -563,7 +563,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   			 * Signal acquired while NOT doing resolution
>   			 * detection; reset the engine and re-initialize
>   			 */
> -			aspeed_video_irq_res_change(video);
> +			aspeed_video_irq_res_change(video,
> +						    RESOLUTION_CHANGE_DELAY);
>   			return IRQ_HANDLED;
>   		}
>   	}

