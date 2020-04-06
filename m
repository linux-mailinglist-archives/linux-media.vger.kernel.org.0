Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6004B19FD7D
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 20:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgDFSu6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 14:50:58 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37085 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgDFSu6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 14:50:58 -0400
Received: by mail-pl1-f196.google.com with SMTP id x1so189870plm.4
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 11:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QqCbo14zu5CndwLWHsbr4/dcYRGUBBgqOznF/m0XXlM=;
        b=m3krUeNjMDW9d7WhhIutSwOoyOPX2kT5AC1lWgERdBZFn1Kp/uac7XXjarCfC5/fgc
         Qx6B+9t/fj28TQa0y7qw3OU/pyLaOeJArTj0EzKPZJOt78IDgtWTpsAVJF9UdiCqOJKP
         AT2i9sJ7FgjEsAWFW8txqjAtE1UWHD2+/1XLJxxTYH1Zp+NkqyR90GF1C+Mp1rxfH2C3
         4YWRnE1nyCNHTfGfjYfy+/G4gvdf8tGrQsy6tc8ZZIO2pDoXAst2EcZwoclUBgp3s+qs
         v0+B1pYgI1WYcmtWhLuY0lLQcvPLp2VKhdhJ2cKcBcCu1jTp0XDcRnSFhDBhv+EejbGE
         6FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QqCbo14zu5CndwLWHsbr4/dcYRGUBBgqOznF/m0XXlM=;
        b=fiVgzWFt6HDwFQhbiC75ETv+JFNm5FkqXz8lEXhJd6NY/f7p/olN+WhETYGS9grIQc
         z/ajAb9u3RUyMMDqhxUIEDKHiOHSFU3M6rnZm6eHdBdDbvuJmGiGkrbp5/gQNxxNMRoT
         heflQqywCZ7EtWmF4EvPltn6IuLUcagiL4xLf7kGLXOSs1Sv93H2MbkiDKT1s9MIVW0R
         bQBE+Lj8eBuu0oJeKqjikHfG3L0TniIJDTF8iS1BUrQplZbvrFCoI9rJnX6gJJh4w0aL
         pqHa38WS7Z3eazJYf6nZFLDpf2OeZiL+iA0Vp2fCDQklbqVSAKvAw4ZvBljvbpXLAGZl
         PpwA==
X-Gm-Message-State: AGi0PubKezXamFJjiC9SrRsCQB3AHRtJm8qh0arldrIC1NqbiY5XKO/w
        z3u/ZiJTn4xybRL3emQ/81c=
X-Google-Smtp-Source: APiQypJHppEyF1y+X/MIR4PXGyaZBBqUuzQqNx77OWoWbTV1JhKe7ge5T9JhngsDfhkOfmHg9IPsDg==
X-Received: by 2002:a17:902:a9c7:: with SMTP id b7mr21449669plr.124.1586199055028;
        Mon, 06 Apr 2020 11:50:55 -0700 (PDT)
Received: from [172.30.88.191] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id d7sm12189945pfa.106.2020.04.06.11.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 11:50:54 -0700 (PDT)
Subject: Re: imx6: Cannot register mem2mem
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
References: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
 <77add588-5756-8684-3e8f-0f46cbb2442b@gmail.com>
 <CAOMZO5C32M-JzCtfd7_=HtyfMqyqYd6adUEj1XRB6SYGoq0a0Q@mail.gmail.com>
 <CAOMZO5Ask2GF7fA=K6_RYF7138YEhsg4ERqvyS5SRt6jkh8QvQ@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <65b57718-a60e-66bf-61ba-348457fc524f@gmail.com>
Date:   Mon, 6 Apr 2020 11:50:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAOMZO5Ask2GF7fA=K6_RYF7138YEhsg4ERqvyS5SRt6jkh8QvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/6/20 11:39 AM, Fabio Estevam wrote:
> Hi Steve,
>
> On Mon, Apr 6, 2020 at 2:46 PM Fabio Estevam <festevam@gmail.com> wrote:
>
>>>    &mipi_csi {
>>> -       status = "okay";
>>> +       status = "disabled";
>> I tried this suggestion and then mem2mem is successfully probed.
> Ok, so now I connected the ov5640 module as per your suggestion and
> this is what I get with a clean 5.6.2:
>
> [    6.618296] imx-media: ov5640 1-003c:0 -> imx6-mipi-csi2:0
> [    6.644522] imx-media: Registered ipu_ic_pp csc/scaler as /dev/video8

This shows that imx-media completed probe (v4l2 core called its probe 
complete callback).

>
> However,  the v4l2video8convert Gstreamer element is not detected:
>
> # gst-inspect-1.0 | grep convert
> video4linux2:  v4l2convert: V4L2 Video Converter
> audioconvert:  audioconvert: Audio converter
>
> If I do the kernel hack I mentioned previously then I can get v4l2video8convert:
>
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -213,10 +213,6 @@ v4l2_async_notifier_try_complete(struct
> v4l2_async_notifier *notifier)
>          if (!notifier->v4l2_dev)
>                  return 0;
>
> -       /* Is everything ready? */
> -       if (!v4l2_async_notifier_can_complete(notifier))
> -               return 0;
> -
>          return v4l2_async_notifier_call_complete(notifier);

That's very odd, because v4l2_async_notifier_call_complete() was 
definitely called on the imx-media root notifier from above.

Is there is another v4l2 driver that is not completing?

Steve

>   }
>
> # gst-inspect-1.0 | grep convert
> video4linux2:  v4l2video11convert: V4L2 Video Converter
> video4linux2:  v4l2video10convert: V4L2 Video Converter
> video4linux2:  v4l2video9convert: V4L2 Video Converter
> video4linux2:  v4l2convert: V4L2 Video Converter
> audioconvert:  audioconvert: Audio converter
>
> What am I missing in order to get the v4l2videoXconvert Gstreamer
> element without hacking the kernel?
>
> Thanks

