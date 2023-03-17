Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836D86BF19B
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 20:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjCQTVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 15:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjCQTVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 15:21:32 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B86E7ED8
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 12:21:09 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id p4so5376716wre.11
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 12:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679080867;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xDgGD9JqvaKLuvRV7fRNK6jC+CQ90lvvKb1lDMKZaYQ=;
        b=lIt5ROn7dM4mLQbXxtFaT+ibz7HLQMfUX6XKWqw32y8ramERbeCzsHZgBPWpmn/ION
         7cjf3yP5VxIKZPmhWn3eEyXTZxTC7xfB9Ww6VKaCMy+mKUv4ERh3Ml0KpPT+y410JGCm
         2zpBFyvu6oEHXGYkaykeH4jTforrMhmmnvvkkHSpcaP3urr8QcLs9OfO3GpAXQhXGrMs
         nKWQGZfNJPLV8/c0lEv3WA/Zat+Or5kxCxtxytBN06Ax10nIF4brlcxU5iQPdWxjbVsP
         61SJTLMhH/G6F22HAp96R0ssyv2XqdqPJveRrAYNVfYyfutn3cdvU/iMMmbIwQ9K/1b1
         i3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080867;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDgGD9JqvaKLuvRV7fRNK6jC+CQ90lvvKb1lDMKZaYQ=;
        b=a45se43EvDCykEXYmOUoWaCwwLmvm6eiNeKWtKGDfu4SQmI3fYvFjzjwoXukZIuDbZ
         k1NqI9Ua7LaZswAlr4mF9w9JrQQnv78KVxkHRedO3ezJk8oProafVMqjqte+t/84Wtlj
         qQD4cbW7sjwk+H5LJXQy2fZDkJxO0S1eAcGrEGO9Q9K7OeSH+seH3TOptdK6x09aieDp
         aNi4gQ6vfwQWXIMIAI2Nc0NOWwW6cdX4NOjz7OoGa2hZPReyD1ffa65X7gg+pju4iizF
         m959QSz9wYL/fI+stwcHUBWdNQ72mxWHutuRql8Oi370QfKJY+HF5tWKvYnNAGzNj//V
         whTg==
X-Gm-Message-State: AO0yUKW86B97C2rbp7UEG3UHWnOkYoxGYvem4YsiBBt7KqQa6HS3NIaF
        xa1g5aPWKC6QP51Mc98j2aY=
X-Google-Smtp-Source: AK7set9wl8HMItHIv7EuOF4Ugnm9G7eBifkGEcKWx1mR9Hr8rWOlN4y5AJk/0zNlMj1vAdjoy6FeNw==
X-Received: by 2002:a5d:43d1:0:b0:2ca:f86a:9643 with SMTP id v17-20020a5d43d1000000b002caf86a9643mr7703391wrr.0.1679080867370;
        Fri, 17 Mar 2023 12:21:07 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d4305000000b002c3f81c51b6sm2602937wrq.90.2023.03.17.12.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:21:06 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: imx: imx7-media-csi: Fail on invalid type in
 VIDIOC_G_SELECTION
In-Reply-To: <20230317183213.GC28322@pendragon.ideasonboard.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
 <20230316143829.499039-3-alexander.stein@ew.tq-group.com>
 <20230317183213.GC28322@pendragon.ideasonboard.com>
Date:   Fri, 17 Mar 2023 19:21:06 +0000
Message-ID: <m3edpngp5p.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> Hi Alexander,
>
> Thank you for the patch.
>
> On Thu, Mar 16, 2023 at 03:38:28PM +0100, Alexander Stein wrote:
>> This device only supports video capture, so bail out if invalid
>> selection type is passed.
>> 
>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
  Rui
>
>> ---
>>  drivers/media/platform/nxp/imx7-media-csi.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
>> index 3e97b9f2ff69..389d7d88b341 100644
>> --- a/drivers/media/platform/nxp/imx7-media-csi.c
>> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
>> @@ -1214,6 +1214,9 @@ static int imx7_csi_video_g_selection(struct file *file, void *fh,
>>  {
>>  	struct imx7_csi *csi = video_drvdata(file);
>>  
>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>>  	switch (s->target) {
>>  	case V4L2_SEL_TGT_COMPOSE:
>>  	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
>
> -- 
> Regards,
>
> Laurent Pinchart
