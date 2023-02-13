Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C0A69489B
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 15:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjBMOuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 09:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjBMOuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 09:50:22 -0500
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3441BAD0
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 06:50:10 -0800 (PST)
X-KPN-MessageId: b588602f-abad-11ed-b20d-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id b588602f-abad-11ed-b20d-005056abbe64;
        Mon, 13 Feb 2023 15:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=4vd78FrAunKMahFkUBI2mMLywhVuK2NL6UOIGmWlwtI=;
        b=G1CmAf6mdoCuGQnkA+ISEXA9PR8Sza8JTyp5lpGPeqrBCzJLRwKZABQTQbbPgRGTcsi1ZeU1Utyh3
         u2dtUajgIu5fqfPpMout5QkSmD8WWRcFGMnfYZzLUHnWaoY6+Q9xvFxf4SKiTOLTkngRHzzbhdV+cL
         vmvsUsMqJZe1/ex+Kv8lFGp8QPfcgtx4FdWkCAE/ut+VJMNZJzafh7JCH9YNnOO2gjJChgK2onb34x
         86Qx38ecbujxISfLP1n5ympIMjVstwwqCcdjKHUq9xLIs1oVnx1kySZAwBaJKay1lVL2xiACTf8wYw
         Bh4V8pFfDi3BjyNI06c6lhTMS3l8tpw==
X-KPN-MID: 33|4KIHXpGmjLE2NA4VbruA+s31yRxbL/T4tzoIJ4mbAIWdkXITBuRIv3oBnAzhSAY
 BbpCladm6wikmaGx7XCQWWbDopxqrkAYTZOez7x5EUd8=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|jSGKP+DXxsCosAIUMbnPQOfnjovwVoVhjFa7lf7hapRlRK1cauNrIbV9vKSyoEy
 w07wpu62l0RY/VYke/4e1kA==
X-Originating-IP: 173.38.220.58
Received: from [10.47.77.219] (unknown [173.38.220.58])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id b5b1299d-abad-11ed-ae07-005056ab1411;
        Mon, 13 Feb 2023 15:50:08 +0100 (CET)
Message-ID: <4ca243f5-77eb-507b-f497-1ce317708896@xs4all.nl>
Date:   Mon, 13 Feb 2023 15:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] libv4lconvert: Don't ignore return value of ftruncate()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Gregor Jasny <gjasny@googlemail.com>
References: <20230211210841.20163-1-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230211210841.20163-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/11/23 22:08, Laurent Pinchart wrote:
> The ftruncate() function is declared with the warn_unused_result
> attribute, which generates a warning when compiling libv4lconvert:
> 
> [60/340] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/control_libv4lcontrol.c.o
> ../lib/libv4lconvert/control/libv4lcontrol.c: In function ‘v4lcontrol_create’:
> ../lib/libv4lconvert/control/libv4lcontrol.c:728:17: warning: ignoring return value of ‘ftruncate’ declared with attribute ‘warn_unused_result’ [-Wunused-result]
>   728 |                 ftruncate(shm_fd, V4LCONTROL_SHM_SIZE);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fix it by checking the return value and falling back to malloc-ed memory
> for controls, as done when mmap() fails.
> 
> While at it, fix a typo in a comment, and drop an unneeded "error" word
> from an error message.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  lib/libv4lconvert/control/libv4lcontrol.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/libv4lconvert/control/libv4lcontrol.c b/lib/libv4lconvert/control/libv4lcontrol.c
> index 7296de1d0fcb..676719372bb7 100644
> --- a/lib/libv4lconvert/control/libv4lcontrol.c
> +++ b/lib/libv4lconvert/control/libv4lcontrol.c
> @@ -725,16 +725,21 @@ struct v4lcontrol_data *v4lcontrol_create(int fd, void *dev_ops_priv,
>  
>  	if (shm_fd >= 0) {
>  		/* Set the shared memory size */
> -		ftruncate(shm_fd, V4LCONTROL_SHM_SIZE);
> +		int ret = ftruncate(shm_fd, V4LCONTROL_SHM_SIZE);
> +		if (ret) {
> +			perror("libv4lcontrol: shm ftruncate failed");
> +			close(shm_fd);
> +		} else {
> +			/* Retrieve a pointer to the shm object */
> +			data->shm_values = mmap(NULL, V4LCONTROL_SHM_SIZE,
> +						PROT_READ | PROT_WRITE,
> +						MAP_SHARED, shm_fd, 0);
> +			close(shm_fd);
>  
> -		/* Retreive a pointer to the shm object */
> -		data->shm_values = mmap(NULL, V4LCONTROL_SHM_SIZE, (PROT_READ | PROT_WRITE),
> -				MAP_SHARED, shm_fd, 0);
> -		close(shm_fd);
> -
> -		if (data->shm_values == MAP_FAILED) {
> -			perror("libv4lcontrol: error shm mmap failed");
> -			data->shm_values = NULL;
> +			if (data->shm_values == MAP_FAILED) {
> +				perror("libv4lcontrol: shm mmap failed");
> +				data->shm_values = NULL;
> +			}
>  		}
>  	} else
>  		perror("libv4lcontrol: error creating shm segment failed");

