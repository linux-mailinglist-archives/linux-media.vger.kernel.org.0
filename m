Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1C739CF15
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 14:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731678AbfHZMI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 08:08:58 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:32995 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727182AbfHZMI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 08:08:57 -0400
Received: from [IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4] ([IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2DnoivsWpzaKO2DnpiEt5c; Mon, 26 Aug 2019 14:08:55 +0200
Subject: Re: [PATCH] [media] pvrusb2: qctrl.flag will be uninitlaized if
 cx2341x_ctrl_query() returns error code
To:     Yizhuo <yzhai003@ucr.edu>
Cc:     csong@cs.ucr.edu, zhiyunq@cs.ucr.edu, Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190821210931.9621-1-yzhai003@ucr.edu>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <afa0a08e-30ff-7958-fb09-3e3d58d47f0e@xs4all.nl>
Date:   Mon, 26 Aug 2019 14:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190821210931.9621-1-yzhai003@ucr.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDwcIT6tNO9/GVDrH0sRQt0aTUwH+fPlmRTpdVHKBckIdbH3YFr1Z6AGBVTpS6cyuw4jyZe/AcLv8ZZcWI4XxcqxmmbJNOyr6sAAKaEg9G6QwnMcR+MF
 u+awvo0OMh1LJe2MDzkot0Og+T5QbaD/nfMECZVsvyN3lzBwXKD7o2UTmubNJrDPdH9HCrVX7ARgH/HjHU1dxWz7KrJgS9hMeq1G9UA0yOoNEoqhNgeb9Pb2
 fXhZWsir13gThVeCSgW2pQnKilpd90B2ANJw5vfwd1foeVMB88PymS7D7xZbNP80GN/QUpZKDqiE2wAT4Mk5c+toYq9qjY2qf9FpFn3I1Ylj+hlfD1en7Pu8
 xnWizPNnbLOSWibg/YShLaVCoKLwnLGqAWZpUCmm1WjHBaJl3eyKYQKNeZox+UijyMq8q5chqBr6CsW6mOsIdcRCzVy433ZrP1YQTdFgfE9j/apPOKo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/21/19 11:09 PM, Yizhuo wrote:
> Inside function ctrl_cx2341x_getv4lflags(), qctrl.flag
> will be uninitlaized if cx2341x_ctrl_query() returns -EINVAL.
> However, it will be used in the later if statement, which is
> potentially unsafe.
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index ad5b25b89699..1fa05971316a 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -793,6 +793,7 @@ static unsigned int ctrl_cx2341x_getv4lflags(struct pvr2_ctrl *cptr)
>  	struct v4l2_queryctrl qctrl;
>  	struct pvr2_ctl_info *info;
>  	qctrl.id = cptr->info->v4l_id;
> +	memset(&qctr, 0, sizeof(qctrl))

Please compile test your patches! This doesn't compile due to a typo
(qctr -> qctrl).

Also, this would overwrite qctrl.id with 0, not what you want.

Instead, just do:

  	struct v4l2_queryctrl qctrl = {};

to initialize the struct with all 0.

Regards,

	Hans

>  	cx2341x_ctrl_query(&cptr->hdw->enc_ctl_state,&qctrl);
>  	/* Strip out the const so we can adjust a function pointer.  It's
>  	   OK to do this here because we know this is a dynamically created
> 

