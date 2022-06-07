Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28BC53F88E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 10:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238623AbiFGIsg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 04:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238652AbiFGIs2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 04:48:28 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEF05D195
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 01:47:47 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id k16so23125462wrg.7
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mW5BAob+Ce6/ArUYFS1H5IXVEuyOq+PLivJogSC1Okk=;
        b=BBsxlsInAGOYuyRYUyvi+T0vMlGPMs/vL96nCdpXo2BcX6fHeNXmX3vF5DFjyzyh+x
         kieLeTml9xxzUeZIAyRJlIb9suf9NvFABKmlIzcm9+MpypWAQaalqzzeILXr0wVVrHGJ
         xvDBjcSabPhPZO/M3mX4tRFvlAN8fhTWlnglrqeA0IPYKPDjZfEwEZ2DoJXY2SN9cclC
         jGdXV0iOFwjGrdhhIu5avUs88e2ktBn83o/cnOxz58sFZUT56V0E7cip/2+UctEhJUQu
         HNSIqJqd4QjitrIY5PW0vIxtBzlmSdo6OFkOpKr/Y8MEurvKM7TMMJKEdj7UhcQ+dFpf
         46Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mW5BAob+Ce6/ArUYFS1H5IXVEuyOq+PLivJogSC1Okk=;
        b=iIkyE+aJDkyRMFwzxv3tv8FSdHJiXsxBSS/ek5FSwTt2TswhXQTlEE2A7664LqUlQb
         ZsETgeYIINUqYxoWgxVHRf9Y0Iy3Z0UUKULkqpb6XOjEAkZOmlvwD5OPV3C+MWHmjxKX
         wqhNVAmSw4Sig9fMzHP2gm7wPNNTlamlrf3kD+CKBHFvUT0mWI0nE1EEezv0WpLsaFCz
         p+cX6D1nCvylwWjZpoaURkyH8+QJ+B1gmUgzOW/hnjUJUhMVyhNflps/9hFSIjVNpGaa
         XGB858azAXbgO7Nmofi2R8+bpZAtF71kckyaSll+QSHGgW7afvs3YarbGlYexRrgNcQR
         diSg==
X-Gm-Message-State: AOAM5317tZeeny0octLaTu/Sf8kjJ8tRuTh9HULSfnJoviYvfUm/ecLK
        231LzRW2If1aNYiRc0BqAts=
X-Google-Smtp-Source: ABdhPJyYpSY4G6a4M6DcBTH4gsLoAHrgYFSdvpf9V88mQvYoBwSidYoIAV0Kt0ZSo9lbBfSOJacERw==
X-Received: by 2002:a05:6000:2a8:b0:213:ba0c:fef8 with SMTP id l8-20020a05600002a800b00213ba0cfef8mr21787496wry.485.1654591665565;
        Tue, 07 Jun 2022 01:47:45 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d5045000000b0020d07d90b71sm17117327wrt.66.2022.06.07.01.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 01:47:45 -0700 (PDT)
Message-ID: <c6e48046-7b75-0efe-4117-5e6f659ddc4f@gmail.com>
Date:   Tue, 7 Jun 2022 09:47:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: ipu3-cio2: Move functionality from .complete() to
 .bound()
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com
References: <20220506211555.1364864-1-djrscally@gmail.com>
 <d0a7b646-deae-1c05-5833-eaf2394956d8@gmail.com>
 <165458734700.4123576.298830375612187304@Monstersaurus>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <165458734700.4123576.298830375612187304@Monstersaurus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Morning Kieran

On 07/06/2022 08:35, Kieran Bingham wrote:
> Quoting Daniel Scally (2022-06-06 18:04:40)
>> Hello all
>>
>> On 06/05/2022 22:15, Daniel Scally wrote:
>>> Creating links and registering subdev nodes during the .complete()
>>> callback has the unfortunate effect of preventing all cameras that
>>> connect to a notifier from working if any one of their drivers fails
>>> to probe. Moving the functionality from .complete() to .bound() allows
>>> those camera sensor drivers that did probe correctly to work regardless.
>>>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>> ---
>>>
>>> This results in v4l2_device_register_subdev_nodes() being called multiple times
>>> but since it's a no-op where the devnode exists already, I think that it's ok.
>>
>> There ended up being a problem with this. If a camera sensor driver
>> registers a notifier via v4l2_async_register_subdev_sensor(), the
>> devnodes for any device that bound to that notifier (a lens controller
>> for example) would be created where v4l2_device_register_subdev_nodes()
>> is called by the ipu3-cio2 driver's .complete() callback. This is
>> because it won't be called until the lens controller's driver has
>> probed. On the other hand, if the lens controller's driver probes late
>> (after all the camera sensor drivers) then its devnodes _won't_ be
>> created because it'll miss the calls to
>> v4l2_device_register_subdev_nodes() when ipu3-cio2's .bound() is
>> triggered as their drivers probe. The effect of this is that we still
>> need a call to v4l2_device_register_subdev_nodes() in .complete() to
>> make sure we catch anything that's bound to a notifier registered by one
>> of the camera sensor drivers. This kinda defeats the purpose of the
>> patch as if an ISP has one sensor linked to a lens controller and one
>> one sensor without a lens controller, failure during probe of the driver
>> for the lens-less sensor will mean .complete() is never called, and so
>> the devnodes for the lens controller won't get created, and so the
>> sensor with a lens won't work properly anyway.
>>
>>
>> So - more thought needed on this I think. I still think it's the right
>> approach to refactor such that a failure in one sensor driver's probe
>> does not prevent any other sensors present from working provided _they_
>> probe correctly, but I'm not sure the best way to achieve it now.
>
> As highlighted by Jacopo, I've proposed [0] that we talk more about this and
> really figure out a path to solving this (and planning to get it done I
> hope) at the media summit which will hopefully be held in Dublin.
>
> I last discussed this at the media summit in 2018! (life moves fast...)
> and my slides are at [1].  I guess we've had time to think about it all
> a bit more now since 2018, ... And certainly more usecases for this have
> come up since.
>
> Of course, ELCE/Summit is in September, so we can still work on this
> topic before then too!


Ah great, thanks. And nice summary of the problem too - much better than
my attempts! Well, I'll keep it in mind and see if I can come up with a
better way of handling this, as it's a bit of a pain when parts of the
media graph are still in development, but a wider discussion about it
sounds like a great idea to me.

> [0] https://lore.kernel.org/linux-media/165337661126.402452.10107682065782670158@Monstersaurus/
> [1] https://docs.google.com/presentation/d/1Vdydt46QQtcYC0Sb7pn4qpL-ifnQdaCl0AkTSUIKE3U
>
> --
> Kieran
>
>
>
>>>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 65 +++++++------------
>>>  1 file changed, 23 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>>> index 93cc0577b6db..6a1bcb20725d 100644
>>> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>>> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>>> @@ -1387,7 +1387,10 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
>>>  {
>>>       struct cio2_device *cio2 = to_cio2_device(notifier);
>>>       struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
>>> +     struct device *dev = &cio2->pci_dev->dev;
>>>       struct cio2_queue *q;
>>> +     unsigned int pad;
>>> +     int ret;
>>>  
>>>       if (cio2->queue[s_asd->csi2.port].sensor)
>>>               return -EBUSY;
>>> @@ -1398,7 +1401,26 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
>>>       q->sensor = sd;
>>>       q->csi_rx_base = cio2->base + CIO2_REG_PIPE_BASE(q->csi2.port);
>>>  
>>> -     return 0;
>>> +     for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
>>> +             if (q->sensor->entity.pads[pad].flags &
>>> +                                     MEDIA_PAD_FL_SOURCE)
>>> +                     break;
>>> +
>>> +     if (pad == q->sensor->entity.num_pads) {
>>> +             dev_err(dev, "failed to find src pad for %s\n",
>>> +                     q->sensor->name);
>>> +             return -ENXIO;
>>> +     }
>>> +
>>> +     ret = media_create_pad_link(&q->sensor->entity, pad, &q->subdev.entity,
>>> +                                 CIO2_PAD_SINK, 0);
>>> +     if (ret) {
>>> +             dev_err(dev, "failed to create link for %s\n",
>>> +                     q->sensor->name);
>>> +             return ret;
>>> +     }
>>> +
>>> +     return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
>>>  }
>>>  
>>>  /* The .unbind callback */
>>> @@ -1412,50 +1434,9 @@ static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
>>>       cio2->queue[s_asd->csi2.port].sensor = NULL;
>>>  }
>>>  
>>> -/* .complete() is called after all subdevices have been located */
>>> -static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
>>> -{
>>> -     struct cio2_device *cio2 = to_cio2_device(notifier);
>>> -     struct device *dev = &cio2->pci_dev->dev;
>>> -     struct sensor_async_subdev *s_asd;
>>> -     struct v4l2_async_subdev *asd;
>>> -     struct cio2_queue *q;
>>> -     unsigned int pad;
>>> -     int ret;
>>> -
>>> -     list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
>>> -             s_asd = to_sensor_asd(asd);
>>> -             q = &cio2->queue[s_asd->csi2.port];
>>> -
>>> -             for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
>>> -                     if (q->sensor->entity.pads[pad].flags &
>>> -                                             MEDIA_PAD_FL_SOURCE)
>>> -                             break;
>>> -
>>> -             if (pad == q->sensor->entity.num_pads) {
>>> -                     dev_err(dev, "failed to find src pad for %s\n",
>>> -                             q->sensor->name);
>>> -                     return -ENXIO;
>>> -             }
>>> -
>>> -             ret = media_create_pad_link(
>>> -                             &q->sensor->entity, pad,
>>> -                             &q->subdev.entity, CIO2_PAD_SINK,
>>> -                             0);
>>> -             if (ret) {
>>> -                     dev_err(dev, "failed to create link for %s\n",
>>> -                             q->sensor->name);
>>> -                     return ret;
>>> -             }
>>> -     }
>>> -
>>> -     return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
>>> -}
>>> -
>>>  static const struct v4l2_async_notifier_operations cio2_async_ops = {
>>>       .bound = cio2_notifier_bound,
>>>       .unbind = cio2_notifier_unbind,
>>> -     .complete = cio2_notifier_complete,
>>>  };
>>>  
>>>  static int cio2_parse_firmware(struct cio2_device *cio2)
