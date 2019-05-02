Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4B8123CE
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 23:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEBVEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 17:04:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39638 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725962AbfEBVEt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 17:04:49 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x42KqHeT121696
        for <linux-media@vger.kernel.org>; Thu, 2 May 2019 17:04:48 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2s83w1htvn-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Thu, 02 May 2019 17:04:48 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-media@vger.kernel.org> from <eajames@linux.ibm.com>;
        Thu, 2 May 2019 22:04:47 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
        by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 2 May 2019 22:04:43 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x42L4gqc31784966
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 2 May 2019 21:04:42 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3755B12405B;
        Thu,  2 May 2019 21:04:42 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BD5CF124052;
        Thu,  2 May 2019 21:04:41 +0000 (GMT)
Received: from [9.85.142.14] (unknown [9.85.142.14])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu,  2 May 2019 21:04:41 +0000 (GMT)
Subject: Re: [PATCH 7/7] media: aspeed: refine interrupt handling logic
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
 <20190502191317.29698-8-jae.hyun.yoo@linux.intel.com>
From:   Eddie James <eajames@linux.ibm.com>
Date:   Thu, 2 May 2019 16:04:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502191317.29698-8-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050221-0064-0000-0000-000003D5B388
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011037; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01197665; UDB=6.00628187; IPR=6.00978521;
 MB=3.00026704; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-02 21:04:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050221-0065-0000-0000-00003D4C4D94
Message-Id: <21bfb564-785b-24ad-4f03-d6762cc58a46@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-02_12:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=876 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905020131
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/2/19 2:13 PM, Jae Hyun Yoo wrote:
> There are cases that interrupt bits are cleared by a 500ms delayed
> work which causes unnecessary irq calls. Also, the current
> interrupt handler returns IRQ_HANDLED always but it should return
> IRQ_NONE if there is any unhandled interrupt. So this commit
> refines the interrupt handling logic to fix these issues.


Thanks Jae, looks good.

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/media/platform/aspeed-video.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 8d0bb395e46d..98944a911998 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -488,6 +488,7 @@ static void aspeed_video_off(struct aspeed_video *video)
>   
>   	/* Disable interrupts */
>   	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
> +	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>   
>   	/* Turn off the relevant clocks */
>   	clk_disable(video->vclk);
> @@ -556,7 +557,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   					    VE_INTERRUPT_MODE_DETECT, 0);
>   			aspeed_video_write(video, VE_INTERRUPT_STATUS,
>   					   VE_INTERRUPT_MODE_DETECT);
> -
> +			sts &= ~VE_INTERRUPT_MODE_DETECT;
>   			set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
>   			wake_up_interruptible_all(&video->wait);
>   		} else {
> @@ -601,12 +602,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   				    VE_INTERRUPT_COMP_COMPLETE, 0);
>   		aspeed_video_write(video, VE_INTERRUPT_STATUS,
>   				   VE_INTERRUPT_COMP_COMPLETE);
> -
> +		sts &= ~VE_INTERRUPT_COMP_COMPLETE;
>   		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>   			aspeed_video_start_frame(video);
>   	}
>   
> -	return IRQ_HANDLED;
> +	return sts ? IRQ_NONE : IRQ_HANDLED;
>   }
>   
>   static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)

