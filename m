Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5BB72DF16
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 16:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbfE2ODN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 10:03:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33028 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727106AbfE2ODN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 10:03:13 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4TE2enn052239
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 10:03:12 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2sst6hutgd-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 10:03:12 -0400
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-media@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 29 May 2019 15:03:11 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
        by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 29 May 2019 15:03:08 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x4TE373s29032940
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 May 2019 14:03:07 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6A462B205F;
        Wed, 29 May 2019 14:03:07 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C0FCBB2066;
        Wed, 29 May 2019 14:03:06 +0000 (GMT)
Received: from [9.41.103.158] (unknown [9.41.103.158])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 29 May 2019 14:03:06 +0000 (GMT)
Subject: Re: [PATCH v2 10/11] media: aspeed: fix an incorrect timeout checking
 in mode detection
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
 <20190524231725.12320-11-jae.hyun.yoo@linux.intel.com>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Date:   Wed, 29 May 2019 09:03:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524231725.12320-11-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052914-0072-0000-0000-00000434B7E5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011179; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210290; UDB=6.00635858; IPR=6.00991323;
 MB=3.00027101; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 14:03:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052914-0073-0000-0000-00004C68470D
Message-Id: <50abcb27-30af-9dfc-3a53-4261832f272d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-29_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290093
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/24/19 6:17 PM, Jae Hyun Yoo wrote:
> There is an incorrect timeout checking in mode detection logic so
> it misses resolution detecting chances. This commit fixes the bug.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> v1 -> v2:
>   New.
>
>   drivers/media/platform/aspeed-video.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 67f476bf0a03..b05b073b63bc 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -735,7 +735,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   	do {
>   		if (tries) {
>   			set_current_state(TASK_INTERRUPTIBLE);
> -			if (schedule_timeout(INVALID_RESOLUTION_DELAY))
> +			if (!schedule_timeout(INVALID_RESOLUTION_DELAY))
>   				return;


schedule_timeout returns 0 when the timer has expired otherwise the 
remaining time in  jiffies will be returned. So if it was interrupted (timer did not expire 
and it returns non-zero) then we should return, rather than keep trying. 
So I think it was correct before. Thanks, Eddie

>   		}
>   

