Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838DF1C6E22
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 12:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgEFKNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 06:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728306AbgEFKNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 06:13:11 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A12C061A0F;
        Wed,  6 May 2020 03:13:11 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f8so297799plt.2;
        Wed, 06 May 2020 03:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6WNtx/WWmmyn4FXsUEVTqUH4KJDR4nxrdnROOFWF/VA=;
        b=mzbUK3+wvDC/iKKVfsqO7JxEpc8wkfvQGmd9RVRS5IlAeErkoJfQAYkHrc1DhpRpYC
         fv8KQ3XglpbVR5p0mD/8GydupQlPSlIAP9MhVUOEkdqkpJDFKGlNtBk8yIsV2V7WoWDU
         jlT3QrOPU5GsdYKpmRZF2RDGBUzVWAOyYSFLdyXcg+YqzTVw1MG/nvw+NQ3B3mWSqmCU
         1JSsaxotmtp99Q4ASjOi9TT6zv1IQHlGvTlNSbMsPEaWbsotJ5DiLqIrR9fLy3XV6zt5
         q51Ff7cYqaJ6ebxxaB4HvaoFPqidAyJg+iybqAmB9R8jdS1+mp7m9gwEntmvhCc9PUx4
         aYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6WNtx/WWmmyn4FXsUEVTqUH4KJDR4nxrdnROOFWF/VA=;
        b=qYwF16IgHta35RlLJk0NX02ZLimRw20CxMBnMRvvt4THC7N06cCyDlhCNn2ZWvhndG
         zaSnX+8Uvs29a2Sk+53ub/fK55l0dvOK8s01jw+hkyqWS8NDY/0gL0pA5zIravvBT0Yr
         GbA1XUGjsGhz0oAWOarO66YQNQBk9tOxar1PiDHa/KmwmHkn70XRlz+DFjIi0vqUNaXu
         +0j7CReJfbGVamDgEShXncPspY9nlZXK2SaeccdVKXDma1ElIp3ZsxaOB9aVGcHoHAsA
         XRdPpR+GDfOsWHVR2CmZYz5qKiLTkqgz+UAg6of09+eFlo4MkOmgMxCvhcpnu34n6IZc
         wBRw==
X-Gm-Message-State: AGi0Pub2kO7uzjM9DPD9w0C/pvvc6dz53lWwFylxK2dCAO0jNfCWK0XE
        tZMK3MKAK7xJIJM8z2cbFs85duo1j50=
X-Google-Smtp-Source: APiQypLiiBZmSCG4wntUL7TaFVTjDm5EyQBD2qbPgRk0HPb182fxQ/EzgQf9njQfVxApmOk4Ctml4A==
X-Received: by 2002:a17:902:a989:: with SMTP id bh9mr7260346plb.44.1588759990559;
        Wed, 06 May 2020 03:13:10 -0700 (PDT)
Received: from [192.168.1.7] ([223.72.42.191])
        by smtp.gmail.com with ESMTPSA id q7sm1348750pgs.13.2020.05.06.03.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 03:13:09 -0700 (PDT)
Subject: Re: [PATCH] media: usb: ttusb-dec: avoid buffer overflow in
 ttusb_dec_handle_irq() when DMA failures/attacks occur
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     mchehab@kernel.org, kstewart@linuxfoundation.org,
        tomasbortoli@gmail.com, sean@mess.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200505142110.7620-1-baijiaju1990@gmail.com>
 <20200505181042.GD1199718@kroah.com>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <0e4a86ee-8c4e-4ac3-8499-4e9a6ed7bd1e@gmail.com>
Date:   Wed, 6 May 2020 18:13:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200505181042.GD1199718@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

Thanks for the reply :)

On 2020/5/6 2:10, Greg KH wrote:
> On Tue, May 05, 2020 at 10:21:10PM +0800, Jia-Ju Bai wrote:
>> In this case, "buffer[4] - 1 < ARRAY_SIZE(rc_keys)"
>> can be first satisfied, and then the value of buffer[4] can be changed
>> to a large number, causing a buffer-overflow vulnerability.
> Um, maybe.  I agree testing and then using the value can cause problems
> when userspace provides you with that data and control, but for
> DMA-backed memory, we are in so much other trouble if that is the case.
>
>> To avoid the risk of this vulnerability, buffer[4] is assigned to a
>> non-DMA local variable "index" at the beginning of
>> ttusb_dec_handle_irq(), and then this variable replaces each use of
>> buffer[4] in the function.
> I strongly doubt this is even possible.  Can you describe how you can
> modify DMA memory and if so, would you do something tiny like this?
>

I have never modified DMA memory in the real world, but an attacker can 
use a malicious device to do this.
There is a video that shows how to use the Inception tool to perform DMA 
attacks and login in the Windows OS without password:
https://www.youtube.com/watch?v=HDhpy7RpUjM

Besides, the Windows OS resists against DMA attacks by disabling DMA of 
external devices by default:
http://support.microsoft.com/kb/2516445

Considering that this patch is for a USB media driver, I think that an 
attacker can just insert a malicious USB device to modify DMA memory and 
trigger this bug.
Besides, not related to this patch, some drivers use DMA to send/receive 
data (such as the URB used in USB drivers and ring descriptors used in 
network drivers). In this case, if the data is malicious and used as an 
array index through DMA, security problems may occur.

In my opinion, similar to the data from userspace, the data from 
hardware may be also malicious and should be checked.

Maybe we could discuss this issue with DMA driver developers?


Best wishes,
Jia-Ju Bai
