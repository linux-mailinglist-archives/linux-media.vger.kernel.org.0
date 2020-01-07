Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF931132F3B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 20:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgAGTRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 14:17:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22608 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728358AbgAGTRR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 14:17:17 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 007JH39b027071;
        Tue, 7 Jan 2020 14:17:04 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2xb925u3yr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 14:17:03 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 007JF3HH013079;
        Tue, 7 Jan 2020 19:16:59 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma01dal.us.ibm.com with ESMTP id 2xajb6n4nq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 19:16:59 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 007JGwek63046138
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 7 Jan 2020 19:16:58 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1090B6E04E;
        Tue,  7 Jan 2020 19:16:58 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A76E96E04C;
        Tue,  7 Jan 2020 19:16:57 +0000 (GMT)
Received: from [9.163.26.112] (unknown [9.163.26.112])
        by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue,  7 Jan 2020 19:16:57 +0000 (GMT)
Subject: Re: [PATCH 1/3] media: aspeed: Rework memory mapping in probe
To:     Joel Stanley <joel@jms.id.au>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20200107034324.38073-1-joel@jms.id.au>
 <20200107034324.38073-2-joel@jms.id.au>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <3237d298-066c-60f0-9912-b32f5bdecfd0@linux.ibm.com>
Date:   Tue, 7 Jan 2020 13:16:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200107034324.38073-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-07_06:2020-01-07,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070152
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/6/20 9:43 PM, Joel Stanley wrote:
> Use the recently introduced function devm_platform_ioremap_resource to
> save a few lines of code. This makes the driver match common platform
> device probe patterns.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


Thanks Joel!


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/media/platform/aspeed-video.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index d8593cb2ae84..8f849d9866af 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1655,14 +1655,17 @@ static int aspeed_video_init(struct aspeed_video *video)
>   
>   static int aspeed_video_probe(struct platform_device *pdev)
>   {
> +	struct aspeed_video *video;
>   	int rc;
> -	struct resource *res;
> -	struct aspeed_video *video =
> -		devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
>   
> +	video = devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
>   	if (!video)
>   		return -ENOMEM;
>   
> +	video->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(video->base))
> +		return PTR_ERR(video->base);
> +
>   	video->frame_rate = 30;
>   	video->dev = &pdev->dev;
>   	spin_lock_init(&video->lock);
> @@ -1671,13 +1674,6 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   	INIT_DELAYED_WORK(&video->res_work, aspeed_video_resolution_work);
>   	INIT_LIST_HEAD(&video->buffers);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	video->base = devm_ioremap_resource(video->dev, res);
> -
> -	if (IS_ERR(video->base))
> -		return PTR_ERR(video->base);
> -
>   	rc = aspeed_video_init(video);
>   	if (rc)
>   		return rc;
