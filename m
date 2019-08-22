Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78C1198931
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 04:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbfHVCA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 22:00:56 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40602 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbfHVCA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 22:00:56 -0400
Received: by mail-pg1-f195.google.com with SMTP id w10so2491049pgj.7
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 19:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xIylgdlhhcF/L8P9mHrDrCTr8TTPDQvIVAWnvR3GTzU=;
        b=PqWTmdjfgCgAMEEtesjueNBVCM3p1BfpUmlce4BnKh9fTvgrg97WGrQI/UCPsNf6mx
         8jzq+8XuJb42y4olyVnEwl4OfyDu0sNe5HJInCm8AYIdq8sj/UuVm5ZYgPPnkazDWxq2
         iJJN7txfn7w3gQzlRuZfff8KrG9W442q5eQCZV+KWD0UpUzUtaIemj+ycoUCMkZcbqvA
         Mvi0TTPoJ5HCUJLbF0Jh6uSXA2QOYgKK7E/AEcHB+T4La6NNiiUWNkDLxIvcRq2wtcz4
         puiXeN8JZ1H7GIxVSKg/6XGNzz3ZbTysl3A1G5WN9033u3UR0UPvvm1+JRI0fZ4L6PAE
         P+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xIylgdlhhcF/L8P9mHrDrCTr8TTPDQvIVAWnvR3GTzU=;
        b=PFMWwsZJ3VVBcHJMmwbD948OIrl8MrQgHhD2yl0bBeILl5yQRJvqMyWjKek6ugvQ1y
         UEvqq+k/krkgojLr2AciRq1nt7+xjirKL3e9QkBncWacd3Y7b3HZKxuwTiq3SLLuI4Vs
         oze8FBDaCb2EH/Rx5Qndysc4AmOJ4WqCc6j2cIxqP9wm+wXDjTLvVvO7RClzWLCfrCug
         11pTVmlgg5rENsysYrTXfcu/+ZaGJYVrzn9J7wYQaYfw/nLgXawy3ifUB0mEpZKK8giu
         3v+9e02KmdTUYHVPCfNCYaMjDtZ74ngFd3crRPzDKBrT/65Au2SWU3y84utIkwoLGSzy
         pXbw==
X-Gm-Message-State: APjAAAUxyG1Y2nePdjBXlWTZpqhfYSsvp2cJnk/LVBT9dtJN5Ft4lCcQ
        mXD7PVprqRsGscXAceotxMI=
X-Google-Smtp-Source: APXvYqy1vxJ/mX5LcA4LfBm626872CxU45SOeVcuanrfRsmMI6kaksd2lVj3wxQyrzI/TqjlcRWsdg==
X-Received: by 2002:a17:90a:ae15:: with SMTP id t21mr2937173pjq.50.1566439255437;
        Wed, 21 Aug 2019 19:00:55 -0700 (PDT)
Received: from [192.168.3.4] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id ce7sm1059558pjb.16.2019.08.21.19.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2019 19:00:54 -0700 (PDT)
Subject: Re: [PATCH] dvb-usb-v2/gl861: fix wrong memcpy
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>
References: <98cb0a1c-0db8-951b-80e1-12756678db9a@xs4all.nl>
 <6c2806fe-f104-84bf-21b8-21df9b3112cf@gmail.com>
 <20190815220811.6ba32749@coco.lan>
 <df8060a6-9666-3dd1-e041-620891970e7c@gmail.com>
 <fe4da71a-c562-e58e-9b1c-acb6853d9005@iki.fi>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <ea96de1a-0f40-c044-ef2b-63de77da0412@gmail.com>
Date:   Thu, 22 Aug 2019 11:00:51 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fe4da71a-c562-e58e-9b1c-acb6853d9005@iki.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

> I suspect all whole friio_reset() function is not needed as it has
> worked even I/O has been broken.

It worked because the old driver
(that I rmmod'ed before installing the testing driver)
properly init'ed the device.
If I re-plug it (or reboot), it does not work.
So it is needed.

> Also tuner I2C adapter is implemented wrong (I think I mentioned that
> earlier). As tuner sits behind demod I2C-adapter/gate that whole logic
> should be on demod driver.

But according to USB packet capture logs of the windows version,
it makes eccentric use of USB messages ('bRequest' field),
that (I believe) necessitates the current implementation,
as I mentioned in the past thread.

Regards,
Akihiro
