Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED14F7BE183
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 15:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377358AbjJINvC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 09:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377362AbjJINvB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 09:51:01 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 143BBCF
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 06:50:59 -0700 (PDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399DlQpn004790;
        Mon, 9 Oct 2023 13:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pw+QQksQadWIgnFZNk+Puxy7QV1QN65+aZdJTCJHqL0=;
 b=EZ0CRI7w68lI6zyNV88ta/P3spp/w3opYEhPt91FP+yxWfQ615I3XTiRKDmgAS0KqyDM
 3udZ9apSxLuMPSmwJIa6ZE8hItLUbUUGdT7ekKS8GKXTRNIQXBErgzNeja0DOjaOvioN
 f+Gmh2vG4Uy8Dk+OA8iQPISl1YwAkF0bvWZ5DFM0tXlZIed/RoEqmZ1B7dxPFD3LnZmr
 ucmPSTpGtM84M+twdSOtNFLTRqThYb0VHVxJd7U/UuJz/in+gHuSP6ALpeeWx8KC8jDX
 tjw2UgKYWrkKTKsGeWI1gupsyGsTWfgFk4TqvZ4NBIQ0hivHpK5mUwoshi55NqSfzp4a Ig== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmjq8840b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Oct 2023 13:50:25 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
        by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 399CkiDM000693;
        Mon, 9 Oct 2023 13:50:24 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
        by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5k94xk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Oct 2023 13:50:24 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
        by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 399DoNNX63832530
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 9 Oct 2023 13:50:23 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 538C95806C;
        Mon,  9 Oct 2023 13:50:23 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 15C425806E;
        Mon,  9 Oct 2023 13:50:23 +0000 (GMT)
Received: from [9.61.118.13] (unknown [9.61.118.13])
        by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Mon,  9 Oct 2023 13:50:23 +0000 (GMT)
Message-ID: <a606fd9a-5cc0-1158-e72e-f675f19c9dd8@linux.ibm.com>
Date:   Mon, 9 Oct 2023 08:50:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: aspeed: Drop unnecessary error check for
 debugfs_create_file()
To:     Jinjie Ruan <ruanjinjie@huawei.com>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jammy Huang <jammy_huang@aspeedtech.com>
References: <20231007084339.3160130-1-ruanjinjie@huawei.com>
Content-Language: en-US
From:   Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20231007084339.3160130-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j128ooKeKZHll53gcka645iUhCJJqyIV
X-Proofpoint-ORIG-GUID: j128ooKeKZHll53gcka645iUhCJJqyIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_11,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011 phishscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090113
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 10/7/23 03:43, Jinjie Ruan wrote:
> debugfs_create_file() return ERR_PTR and never return NULL.
>
> When calling debugfs functions, there is no need to ever check the
> return value. The function can work or not, but the code logic should
> never do something different based on this.


Thanks!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Fixes: 52fed10ad756 ("media: aspeed: add debugfs")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> v2:
> - Remove the err check instead of using IS_ERR to replace NULL check.
> - Add suggested-by.
> - Update the commit title and message.
> ---
>   drivers/media/platform/aspeed/aspeed-video.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index a9c2c69b2ed9..d08aa7f73d4f 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -1970,22 +1970,15 @@ static void aspeed_video_debugfs_remove(struct aspeed_video *video)
>   	debugfs_entry = NULL;
>   }
>   
> -static int aspeed_video_debugfs_create(struct aspeed_video *video)
> +static void aspeed_video_debugfs_create(struct aspeed_video *video)
>   {
>   	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
>   					    video,
>   					    &aspeed_video_debugfs_fops);
> -	if (!debugfs_entry)
> -		aspeed_video_debugfs_remove(video);
> -
> -	return !debugfs_entry ? -EIO : 0;
>   }
>   #else
>   static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
> -static int aspeed_video_debugfs_create(struct aspeed_video *video)
> -{
> -	return 0;
> -}
> +static void aspeed_video_debugfs_create(struct aspeed_video *video) { }
>   #endif /* CONFIG_DEBUG_FS */
>   
>   static int aspeed_video_setup_video(struct aspeed_video *video)
> @@ -2198,9 +2191,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   		return rc;
>   	}
>   
> -	rc = aspeed_video_debugfs_create(video);
> -	if (rc)
> -		dev_err(video->dev, "debugfs create failed\n");
> +	aspeed_video_debugfs_create(video);
>   
>   	return 0;
>   }
