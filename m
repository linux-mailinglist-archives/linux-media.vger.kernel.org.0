Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0ED26B33DF
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 02:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCJB5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 20:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjCJB5k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 20:57:40 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4F01009FB
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 17:57:38 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id x11so4050568pln.12
        for <linux-media@vger.kernel.org>; Thu, 09 Mar 2023 17:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678413458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AINsso/1nGWpylvRZysZpHpkc1hF9w6btxanv5Q+RsI=;
        b=SmRmGUxn5AqsjLXkXQVQpSKKYK1jqYxR9FdS6qniYoarR1m+4OwUHCPblk2sZkzvgx
         Gm1By906Yqd6lnwfO9XiCd8xbK8XouQprqldAMWRYs2DOvcvgUwu1PBh3HCp1Z8uu2/g
         rHtoUpmkuoJh4eTlkB+eLdamY8ZCsDLevx9Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678413458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AINsso/1nGWpylvRZysZpHpkc1hF9w6btxanv5Q+RsI=;
        b=Jt3IUj/OBnz4M8MKFCCd2pkeM5QDff982eCKTK4PconAmRuvaBO5CswlF7UKs0rUUj
         nSUAe1FOEUTmfSaf4VXm+hWXwEzxqz7fu/arPj8R/HwoA1ItJB4VyZ93ptszE9hcnPK/
         zrO4wcH+a1Gg1aRoclbg4ZHuW9Dmp51C5wCuqdrFdR4oFAFA1iOEcqAv9dhC4Ru1e49C
         LoUPUWSWJMJaZRNc3dZlk3zoKx/3munbc9AzMPC2DCGoj3ZYoGyIXiAbG5YLhG4tGTfX
         D1/gGD8Z9fCV7n06s/3V28+0IawRJWkvs1saAeWHJhwxihS2hPoN0d0dd9dEjtmvUqrz
         Xmow==
X-Gm-Message-State: AO0yUKUNHTJ6Wh7BHHLhHyFNi+m0/c+F3ZvXtdXSBeeydFU3pNHzw/Y6
        1GP0xC91h4Ejn+wwQZRJSIjtXA==
X-Google-Smtp-Source: AK7set+Ev59eq3ySavYY0JZXgbWZjdfRqL4ZA/3SjnAaHI1Ez3kMNOErxL9lIPZCSAxPNjUm9xQySA==
X-Received: by 2002:a05:6a20:4b0f:b0:cf:71ee:6329 with SMTP id fp15-20020a056a204b0f00b000cf71ee6329mr15387315pzb.7.1678413458390;
        Thu, 09 Mar 2023 17:57:38 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id r1-20020a62e401000000b005a817ff3903sm232370pfh.3.2023.03.09.17.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 17:57:37 -0800 (PST)
Date:   Fri, 10 Mar 2023 10:57:34 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>
Subject: Re: [PATCH v6 1/5] media: uvcvideo: Ignore empty TS packets
Message-ID: <20230310015734.GE1045797@google.com>
References: <20220920-resend-hwtimestamp-v6-0-c7a99299ec35@chromium.org>
 <20220920-resend-hwtimestamp-v6-1-c7a99299ec35@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-hwtimestamp-v6-1-c7a99299ec35@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/03/09 13:55), Ricardo Ribalda wrote:
> Some SunplusIT cameras took a borderline interpretation of the UVC 1.5
> standard, and fill the PTS and SCR fields with invalid data if the
> package does not contain data.
> 
> "STC must be captured when the first video data of a video frame is put
> on the USB bus."
> 
> Eg:
> 
> buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> buffer: 0xa7755c00 len 000668 header:0x8c stc 73779dba sof 070c pts 7376d37a
> 
> This borderline/buggy interpretation has been implemented in a variety
> of devices, from directly SunplusIT and from other OEMs that rebrand
> SunplusIT products. So quirking based on VID:PID will be problematic.
> 
> All the affected modules have the following extension unit:
> VideoControl Interface Descriptor:
>   guidExtensionCode         {82066163-7050-ab49-b8cc-b3855e8d221d}
> 
> But the vendor plans to use that GUID in the future and fix the bug,
> this means that we should use heuristic to figure out the broken
> packets.
> 
> This patch takes care of this.
> 
> lsusb of one of the affected cameras:
> 
> Bus 001 Device 003: ID 1bcf:2a01 Sunplus Innovation Technology Inc.
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.01
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 ?
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1bcf Sunplus Innovation Technology Inc.
>   idProduct          0x2a01
>   bcdDevice            0.02
>   iManufacturer           1 SunplusIT Inc
>   iProduct                2 HanChen Wise Camera
>   iSerial                 3 01.00.00
>   bNumConfigurations      1
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

[..]
> +
> +	/*
> +	 * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
> +	 * standard states that it "must be captured when the first video data
> +	 * of a video frame is put on the USB bus".
> +	 * Most of the vendors, clear the `UVC_STREAM_SCR` bit when the data is
> +	 * not valid, other vendors always set the `UVC_STREAM_SCR` bit and
> +	 * expect that the driver only samples the stc if there is data on the
> +	 * packet.
> +	 * Ignore all the hardware timestamp information if there is no data
> +	 * and stc and sof are zero.
> +	 */
[..]

Thanks!
