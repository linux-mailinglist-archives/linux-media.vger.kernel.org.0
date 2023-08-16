Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF0377DD56
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 11:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242422AbjHPJcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 05:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243373AbjHPJcW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 05:32:22 -0400
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F24226A8
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 02:32:20 -0700 (PDT)
Received: from [IPV6:2001:250:4000:5113:35f8:42bb:79b2:4a4f] ([172.16.0.254])
        (user=dzm91@hust.edu.cn mech=PLAIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 37G9VuL5005439-37G9VuL6005439
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Wed, 16 Aug 2023 17:31:56 +0800
Message-ID: <ec8e251c-9fed-716b-6604-e760d8f17b43@hust.edu.cn>
Date:   Wed, 16 Aug 2023 17:31:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH -next] media: usb: siano: Use kmemdup to simplify kmalloc
 and memcpy logic
To:     Chen Jiahao <chenjiahao16@huawei.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, duoming@zju.edu.cn,
        linux-media@vger.kernel.org
References: <20230816022323.1921907-1-chenjiahao16@huawei.com>
From:   Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20230816022323.1921907-1-chenjiahao16@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2023/8/16 10:23, Chen Jiahao wrote:
> Using kmemdup() helper function rather than implementing it again
> with kmalloc() + memcpy(), which improves the code readability.
>
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>   drivers/media/usb/siano/smsusb.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
> index 8a39cac76c58..9d9e14c858e6 100644
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c
> @@ -279,10 +279,8 @@ static int smsusb1_load_firmware(struct usb_device *udev, int id, int board_id)
>   		}
>   	}
>   
> -	fw_buffer = kmalloc(fw->size, GFP_KERNEL);
> +	fw_buffer = kmemdup(fw->data, fw->size, GFP_KERNEL);
>   	if (fw_buffer) {
> -		memcpy(fw_buffer, fw->data, fw->size);
> -
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>   		rc = usb_bulk_msg(udev, usb_sndbulkpipe(udev, 2),
>   				  fw_buffer, fw->size, &dummy, 1000);
>   
