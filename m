Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D7134AE06
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 18:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhCZRyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 13:54:22 -0400
Received: from gateway22.websitewelcome.com ([192.185.47.48]:46608 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230236AbhCZRyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 13:54:09 -0400
X-Greylist: delayed 1405 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Mar 2021 13:54:09 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id A79BC432D
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 12:30:27 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id PqHzlXyCxPkftPqHzl4xdq; Fri, 26 Mar 2021 12:30:27 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UGfVewA7lNLQUq9EGe9XYyV9f0fWBj8alRALG5rzVp0=; b=ZWiNNhL/CIqzObOueT6rUYl82F
        qKwbglqLec+J1MHy7mSzlirgsz5aqNyD/STP1H0pRWKFfDO+jDedaF9b0FzcyluL0dZR4DLBg5DxZ
        SkVMn1skZhtCgOBurpbWmp418I2qVPjA4Q3nfTUF/bLReMDiw4Rqg9b2R/aTSKjLDzG0/5fizYXxo
        m9rBPnpKxf4qck5j0qKqTBc4hslGSTsxjjo1NDLIkpJfzhQuL0naVu6SUM8yn8f5GrPcIFSATKtkC
        eBEe9FmLoy/StqXI6F/6D3HU0ugbAbKHD0Ylik+qMB2cIkTgRFafmyt03zIDoiWaVmSASnagEnFuy
        fpJFZA9A==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:38142 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lPqHz-001PZl-AN; Fri, 26 Mar 2021 12:30:27 -0500
Subject: Re: [PATCH][next] media: siano: Fix multiple out-of-bounds warnings
 in smscore_load_firmware_family2()
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20210311021947.GA129388@embeddedor>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <b0e46b46-db9a-7e3d-cadb-e3855c68373e@embeddedor.com>
Date:   Fri, 26 Mar 2021 11:30:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311021947.GA129388@embeddedor>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lPqHz-001PZl-AN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:38142
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 3/10/21 20:19, Gustavo A. R. Silva wrote:
> Rename struct sms_msg_data4 to sms_msg_data5 and increase the size of
> its msg_data array from 4 to 5 elements. Notice that at some point
> the 5th element of msg_data is being accessed in function
> smscore_load_firmware_family2():
> 
> 1006                 trigger_msg->msg_data[4] = 4; /* Task ID */
> 
> Also, there is no need for the object _trigger_msg_ of type struct
> sms_msg_data *, when _msg_ can be used, directly. Notice that msg_data
> in struct sms_msg_data is a one-element array, which causes multiple
> out-of-bounds warnings when accessing beyond its first element
> in function smscore_load_firmware_family2():
> 
>  992                 struct sms_msg_data *trigger_msg =                                                  
>  993                         (struct sms_msg_data *) msg;                                                
>  994                                                                                                     
>  995                 pr_debug("sending MSG_SMS_SWDOWNLOAD_TRIGGER_REQ\n");                               
>  996                 SMS_INIT_MSG(&msg->x_msg_header,                                                    
>  997                                 MSG_SMS_SWDOWNLOAD_TRIGGER_REQ,                                     
>  998                                 sizeof(struct sms_msg_hdr) +                                        
>  999                                 sizeof(u32) * 5);                                                   
> 1000                                                                                                     
> 1001                 trigger_msg->msg_data[0] = firmware->start_address;                                 
> 1002                                         /* Entry point */                                           
> 1003                 trigger_msg->msg_data[1] = 6; /* Priority */                                        
> 1004                 trigger_msg->msg_data[2] = 0x200; /* Stack size */                                  
> 1005                 trigger_msg->msg_data[3] = 0; /* Parameter */                                       
> 1006                 trigger_msg->msg_data[4] = 4; /* Task ID */ 
> 
> even when enough dynamic memory is allocated for _msg_:
> 
>  929         /* PAGE_SIZE buffer shall be enough and dma aligned */
>  930         msg = kmalloc(PAGE_SIZE, GFP_KERNEL | coredev->gfp_buf_flags);
> 
> but as _msg_ is casted to (struct sms_msg_data *):
> 
>  992                 struct sms_msg_data *trigger_msg =
>  993                         (struct sms_msg_data *) msg;
> 
> the out-of-bounds warnings are actually valid and should be addressed.
> 
> Fix this by declaring object _msg_ of type struct sms_msg_data5 *,
> which contains a 5-elements array, instead of just 4. And use
> _msg_ directly, instead of creating object trigger_msg.
> 
> This helps with the ongoing efforts to enable -Warray-bounds by fixing
> the following warnings:
> 
>   CC [M]  drivers/media/common/siano/smscoreapi.o
> drivers/media/common/siano/smscoreapi.c: In function ‘smscore_load_firmware_family2’:
> drivers/media/common/siano/smscoreapi.c:1003:24: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>  1003 |   trigger_msg->msg_data[1] = 6; /* Priority */
>       |   ~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from drivers/media/common/siano/smscoreapi.c:12:
> drivers/media/common/siano/smscoreapi.h:619:6: note: while referencing ‘msg_data’
>   619 |  u32 msg_data[1];
>       |      ^~~~~~~~
> drivers/media/common/siano/smscoreapi.c:1004:24: warning: array subscript 2 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>  1004 |   trigger_msg->msg_data[2] = 0x200; /* Stack size */
>       |   ~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from drivers/media/common/siano/smscoreapi.c:12:
> drivers/media/common/siano/smscoreapi.h:619:6: note: while referencing ‘msg_data’
>   619 |  u32 msg_data[1];
>       |      ^~~~~~~~
> drivers/media/common/siano/smscoreapi.c:1005:24: warning: array subscript 3 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>  1005 |   trigger_msg->msg_data[3] = 0; /* Parameter */
>       |   ~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from drivers/media/common/siano/smscoreapi.c:12:
> drivers/media/common/siano/smscoreapi.h:619:6: note: while referencing ‘msg_data’
>   619 |  u32 msg_data[1];
>       |      ^~~~~~~~
> drivers/media/common/siano/smscoreapi.c:1006:24: warning: array subscript 4 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>  1006 |   trigger_msg->msg_data[4] = 4; /* Task ID */
>       |   ~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from drivers/media/common/siano/smscoreapi.c:12:
> drivers/media/common/siano/smscoreapi.h:619:6: note: while referencing ‘msg_data’
>   619 |  u32 msg_data[1];
>       |      ^~~~~~~~
> 
> Fixes: 018b0c6f8acb ("[media] siano: make load firmware logic to work with newer firmwares")
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/media/common/siano/smscoreapi.c | 22 +++++++++-------------
>  drivers/media/common/siano/smscoreapi.h |  4 ++--
>  2 files changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
> index 410cc3ac6f94..bceaf91faa15 100644
> --- a/drivers/media/common/siano/smscoreapi.c
> +++ b/drivers/media/common/siano/smscoreapi.c
> @@ -908,7 +908,7 @@ static int smscore_load_firmware_family2(struct smscore_device_t *coredev,
>  					 void *buffer, size_t size)
>  {
>  	struct sms_firmware *firmware = (struct sms_firmware *) buffer;
> -	struct sms_msg_data4 *msg;
> +	struct sms_msg_data5 *msg;
>  	u32 mem_address,  calc_checksum = 0;
>  	u32 i, *ptr;
>  	u8 *payload = firmware->payload;
> @@ -989,24 +989,20 @@ static int smscore_load_firmware_family2(struct smscore_device_t *coredev,
>  		goto exit_fw_download;
>  
>  	if (coredev->mode == DEVICE_MODE_NONE) {
> -		struct sms_msg_data *trigger_msg =
> -			(struct sms_msg_data *) msg;
> -
>  		pr_debug("sending MSG_SMS_SWDOWNLOAD_TRIGGER_REQ\n");
>  		SMS_INIT_MSG(&msg->x_msg_header,
>  				MSG_SMS_SWDOWNLOAD_TRIGGER_REQ,
> -				sizeof(struct sms_msg_hdr) +
> -				sizeof(u32) * 5);
> +				sizeof(*msg));
>  
> -		trigger_msg->msg_data[0] = firmware->start_address;
> +		msg->msg_data[0] = firmware->start_address;
>  					/* Entry point */
> -		trigger_msg->msg_data[1] = 6; /* Priority */
> -		trigger_msg->msg_data[2] = 0x200; /* Stack size */
> -		trigger_msg->msg_data[3] = 0; /* Parameter */
> -		trigger_msg->msg_data[4] = 4; /* Task ID */
> +		msg->msg_data[1] = 6; /* Priority */
> +		msg->msg_data[2] = 0x200; /* Stack size */
> +		msg->msg_data[3] = 0; /* Parameter */
> +		msg->msg_data[4] = 4; /* Task ID */
>  
> -		rc = smscore_sendrequest_and_wait(coredev, trigger_msg,
> -					trigger_msg->x_msg_header.msg_length,
> +		rc = smscore_sendrequest_and_wait(coredev, msg,
> +					msg->x_msg_header.msg_length,
>  					&coredev->trigger_done);
>  	} else {
>  		SMS_INIT_MSG(&msg->x_msg_header, MSG_SW_RELOAD_EXEC_REQ,
> diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
> index 4a6b9f4c44ac..f8789ee0d554 100644
> --- a/drivers/media/common/siano/smscoreapi.h
> +++ b/drivers/media/common/siano/smscoreapi.h
> @@ -624,9 +624,9 @@ struct sms_msg_data2 {
>  	u32 msg_data[2];
>  };
>  
> -struct sms_msg_data4 {
> +struct sms_msg_data5 {
>  	struct sms_msg_hdr x_msg_header;
> -	u32 msg_data[4];
> +	u32 msg_data[5];
>  };
>  
>  struct sms_data_download {
> 
