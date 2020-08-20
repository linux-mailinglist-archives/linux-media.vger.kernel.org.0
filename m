Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3722B24AD47
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 05:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgHTDZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 23:25:32 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39894 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgHTDZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 23:25:31 -0400
Received: by mail-pj1-f67.google.com with SMTP id j13so371066pjd.4
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 20:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kIc8Uh16R4A2EJX3F2QTGOppfTWhNiFwAs8oA1hp+Kw=;
        b=X796DGthqFbIA3Or9XIqJG3cfKLyHQIQ5rk/IpUAUuB7fQdUe5A7PR2WiWWPmfKkn8
         Hu9XECfZHuHENo/0vypBRbY8s66Rm1TnwaSZpzWaZbvni+c2fpnRZKO66Ik83b7Q4pfG
         z9/y7PeiRRrd++MkQdekl9sDCJ1hGO+ta0ltzFo642yhIpXHZRsoKfg2nGgz27wWIg+X
         287GTemIn0BHd62UaGDkc9JUXHRdFNAMGuakTrElaZ1uHC6cG4X0QNhch1dKj/PcQ9+u
         OLKnxW0wcjC4PtM5Sj1dvV9bk+oRSLks2IferGqp2zm5NeYT+9fGsrw5nIXvLgs/ZZbI
         J56g==
X-Gm-Message-State: AOAM531y2VeMC4JdXbDqd5oobbI1+1I/3YIT2bJPQ3fiPDwoN3l3GH03
        eQVIKrAqarw9v6Fpkc7+d0E=
X-Google-Smtp-Source: ABdhPJxlVrcANb6StRifTvUKhhmM4G0edcRL1aoXvGu6BnMqXgtr+oY1vjtGYQTEjw0UjHwWaqYx0g==
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr1114946pla.18.1597893930055;
        Wed, 19 Aug 2020 20:25:30 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id x4sm704478pff.112.2020.08.19.20.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 20:25:28 -0700 (PDT)
Subject: Re: [PATCH] media: uvc: Silence shift-out-of-bounds warning
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Fabio Estevam <festevam@gmail.com>
References: <20200818235406.GE2360@pendragon.ideasonboard.com>
 <20200819000340.11616-1-laurent.pinchart@ideasonboard.com>
From:   Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
 mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
 LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
 fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
 AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
 3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
 AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
 igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
 Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
 jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
 macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
 CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
 RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
 PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
 eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
 lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
 T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
 ++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
 CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
 oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
 //x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
 mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
 goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <68984fef-1e18-9394-9e68-becabf83c85f@acm.org>
Date:   Wed, 19 Aug 2020 20:25:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819000340.11616-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-08-18 17:03, Laurent Pinchart wrote:
> UBSAN reports a shift-out-of-bounds warning in uvc_get_le_value(). The
> report is correct, but the issue should be harmless as the computed
> value isn't used when the shift is negative. This may however cause
> incorrect behaviour if a negative shift could generate adverse side
> effects (such as a trap on some architectures for instance).
> 
> Regardless of whether that may happen or not, silence the warning as a
> full WARN backtrace isn't nice.
> 
> Reported-by: Bart Van Assche <bvanassche@acm.org>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 6c37aa018ad5..b2cdee0f7763 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -773,12 +773,16 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
>  	offset &= 7;
>  	mask = ((1LL << bits) - 1) << offset;
>  
> -	for (; bits > 0; data++) {
> +	while (1) {
>  		u8 byte = *data & mask;
>  		value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
>  		bits -= 8 - (offset > 0 ? offset : 0);
> +		if (bits <= 0)
> +			break;
> +
>  		offset -= 8;
>  		mask = (1 << bits) - 1;
> +		data++;
>  	}
>  
>  	/* Sign-extend the value if needed. */

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Thanks for having addressed this quickly!

Bart.


