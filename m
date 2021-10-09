Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D645A427DDF
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 00:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhJIWUB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 18:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhJIWUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 18:20:00 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CA5C061570
        for <linux-media@vger.kernel.org>; Sat,  9 Oct 2021 15:18:03 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id r18so41761264wrg.6
        for <linux-media@vger.kernel.org>; Sat, 09 Oct 2021 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aSj4sr9lO7MNQwhh1ubV1VhiXzdw9gXzI6Cx5vHPu8g=;
        b=D4CBH9a8GwOMgCR6wpElEArNGoC4yBABhHp3jvGWvCfS9slbpN+ksizsK6RoWjEed4
         i7WY/hr+NZxpm7yh77Eepe9M3teRGihCWVww3zM5M+hW96IU/+BH7LFRavum2NUyLzQ6
         E4+wI+wA1eveRybafiDjk2+m254eKQBotjLisUzwypIZ+y4nZLOrlrD/SNt8bDh3CM4Z
         NZSvGsmyChPhEankhbIkT5lC3EdAXqdi2IspG/VAvZ+H1gPQJi8tW+6CUlk03AfZaWvs
         osJ9TuH52Btq+ISjyiQ4rWdwGrkpcq/ONEskFkp5B+2zTqa2epAveNpF5kBILoqZeaHK
         YZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aSj4sr9lO7MNQwhh1ubV1VhiXzdw9gXzI6Cx5vHPu8g=;
        b=FG2OxxrJ2+7F84KC8RVYY/OVTFDoMarY4SgeQmOH8HFuN7UGiH/4bMAL6MgWzHOvn/
         JNhesZ19kjE/Dnq60TckuRjtUGpYCpRkz8gC6Ucsq9K5inQC9e0OzOxqf2ZIGcduokmP
         sKslypDRujyrtvMgqiD78M55b3xXbLdHqDy2d/qGzwYXhBoNSJLFPPrfdFnWYLLFWAI8
         rvIOE986wbS2q1+BR/X/L2VQU5idJpMqIpxees3BqCNqa8W3oVWl75Oj4CayQcDD8kXk
         SCYSnKGYHI6GV+QIa5UdXRd7j69iSDxVDFbcniTuqa/RYOCEE4JsEn4hTZ5VyPInJqTk
         +JZw==
X-Gm-Message-State: AOAM532iPNMrufMUYieJBN4rp3M2Xo6O7zCudZyR5bnSzOe29FFKXsXF
        UAertlk7ZBOogfNmqhfdQqk=
X-Google-Smtp-Source: ABdhPJze5oOuPj/GM3PByqTIHI9Rd7RW7g6DzJXrmJjmvFfGJmPcDwbrhkwwfjkFIpI2tdy4QCeqEw==
X-Received: by 2002:adf:b748:: with SMTP id n8mr13384630wre.133.1633817882009;
        Sat, 09 Oct 2021 15:18:02 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w1sm15593886wmc.19.2021.10.09.15.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Oct 2021 15:18:01 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] media: ipu3-cio2: Toggle sensor streaming in pm
 runtime ops
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com
References: <61620df7.1c69fb81.2f253.48daSMTPIN_ADDED_MISSING@mx.google.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <a98be4b4-82e6-d7be-6c6a-63ad0842a2c1@gmail.com>
Date:   Sat, 9 Oct 2021 23:18:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <61620df7.1c69fb81.2f253.48daSMTPIN_ADDED_MISSING@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran

On 09/10/2021 22:47, Kieran Bingham wrote:
> Hi Dan,
>
> Quoting Daniel Scally (2021-10-09 00:05:13)
>> The .suspend() and .resume() runtime_pm operations for the ipu3-cio2
>> driver currently do not handle the sensor's stream. Setting .s_stream() on
>> or off for the sensor subdev means that sensors will pause and resume the
>> stream at the appropriate time even if their drivers don't implement those
>> operations.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since v3:
>>
>>         - None
>>
>>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>> index 47db0ee0fcbf..7bb86e246ebe 100644
>> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>> @@ -1973,12 +1973,19 @@ static int __maybe_unused cio2_suspend(struct device *dev)
>>         struct pci_dev *pci_dev = to_pci_dev(dev);
>>         struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
>>         struct cio2_queue *q = cio2->cur_queue;
>> +       int r;
>>  
>>         dev_dbg(dev, "cio2 suspend\n");
>>         if (!cio2->streaming)
>>                 return 0;
>>  
>>         /* Stop stream */
>> +       r = v4l2_subdev_call(q->sensor, video, s_stream, 0);
>> +       if (r) {
>> +               dev_err(dev, "failed to stop sensor streaming\n");
>> +               return r;
>> +       }
>> +
>>         cio2_hw_exit(cio2, q);
>>         synchronize_irq(pci_dev->irq);
>>  
>> @@ -2013,8 +2020,14 @@ static int __maybe_unused cio2_resume(struct device *dev)
>>         }
>>  
>>         r = cio2_hw_init(cio2, q);
>> -       if (r)
>> +       if (r) {
>>                 dev_err(dev, "fail to init cio2 hw\n");
>> +               return r;
>> +       }
>> +
>> +       r = v4l2_subdev_call(q->sensor, video, s_stream, 1);
>> +       if (r)
> If this fails, do we need to do anything to undo the effects of
> cio2_hw_init()?

Ah - thank you yes, I think I should be calling cio2_hw_exit() there.
I'll add that for v5.
>
> Should this always call s_stream, 1? Or should the streaming state be
> stored during cio2_suspend, and that stored state value be set here?
> I.e. we shouldn't necessarily call s_stream if it wasn't already
> streaming?


I think it's ok as is, on the grounds that in cio2_resume()  there's a
guard to do nothing if the cio2 isn't streaming:


if (!cio2->streaming)

    return 0;


And in cio2_vb2_start_streaming() (which sets that cio2->streaming flag
true) there's the same call to v4l2_subdev_call() to set s_stream(1) for
the sensor. So I think the only time we can reach this point, the sensor
is expected to be streaming.

>
>> +               dev_err(dev, "fail to start sensor streaming\n");
>>  
>>         return r;
>>  }
>> -- 
>> 2.25.1
>>
