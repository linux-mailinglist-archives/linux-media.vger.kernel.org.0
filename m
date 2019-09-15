Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32F1B32B5
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 01:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfIOXwb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 19:52:31 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40410 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfIOXwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 19:52:31 -0400
Received: by mail-io1-f66.google.com with SMTP id h144so74576252iof.7
        for <linux-media@vger.kernel.org>; Sun, 15 Sep 2019 16:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OMEng1dD6mbfK8lrN505N4uVQ1mgym5lt3dseXptiRU=;
        b=Ez08UaTY15c4Ih7ylIrfCET1PvR8hL84h6rlrrfa4tb9/nLxFka/MOmH8xulAXgGFO
         pfd59Zuh2pmu+/Ak9BWEuS6qTgPJD+/+Fcr50of6+XRyw4gDskSqC+/YI+jpWScyQBaF
         ncxLpX+3KAsP+C3AJNBcgy3Ky6DsZkfqfo7VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OMEng1dD6mbfK8lrN505N4uVQ1mgym5lt3dseXptiRU=;
        b=esr2gVpQRYTL52BrQOtm1v09RkC10G2Vo9mUplQS2ZgCOutAySGCHLRWuZUxXhmnZy
         mqdzP1ofCpFyCmLcAXpTPePEHnteoHAlK+OxZ87vkkFODzTbTwXI1sUiub1cnwoOpEeZ
         t9Ch28SzcHDMxxa4DwxKw4ej2jbS/W8o/GK9K0MLWfuQp+Sse4A0Ln9vyUOnQxOSQQfZ
         qBVqsmBE68slrEl09Bh5fU+TvZy4YdLAAQAQ4mFyAcG4+Xq5n65MqyY2elkAI19DwVQm
         hEOso3TOZw3SSHJCyHw7MmsBS8GUJBnMfaMBwT5wHDN77/mPwTV7RtIB6XV8YJs3GqAH
         6HEw==
X-Gm-Message-State: APjAAAXoSnh3f2ZA9HIorOxXjdJGQQUD25wjquL5bB12dVomgDj9wagA
        pph0b5hw5zPhPSrZLnf/G6lpXLyn3MQ=
X-Google-Smtp-Source: APXvYqy4Dq00Lwww63fO8cWIOl3thAdOe56DRE7CvMS/exs+R+1tGCmp247IAN5yAZIA0MnroamoWA==
X-Received: by 2002:a5d:814d:: with SMTP id f13mr13472419ioo.162.1568591549261;
        Sun, 15 Sep 2019 16:52:29 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id w22sm14670354ior.79.2019.09.15.16.52.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Sep 2019 16:52:28 -0700 (PDT)
Subject: Re: [PATCH v4 3/5] vimc: move duplicated IS_SRC and IS_SINK to common
 header
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        andrealmeid@collabora.com, dafna.hirschfeld@collabora.com,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1567822792.git.skhan@linuxfoundation.org>
 <8dbc93c2a7291d942d2d37491833444d77316211.1567822793.git.skhan@linuxfoundation.org>
 <cac58f55-6d0f-d69f-6bba-474eedb0f80e@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <124fe9af-5540-770e-d124-99e2b3b4e39a@linuxfoundation.org>
Date:   Sun, 15 Sep 2019 17:52:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cac58f55-6d0f-d69f-6bba-474eedb0f80e@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/15/19 1:25 PM, Helen Koike wrote:
> Hi Shuah,
> 
> On 9/6/19 11:42 PM, Shuah Khan wrote:
>> Move duplicated IS_SRC and IS_SINK dfines to common header. Rename
>> them to VIMC_IS_SRC and VIM_IS_SINK.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   drivers/media/platform/vimc/vimc-common.h  |  4 ++++
>>   drivers/media/platform/vimc/vimc-debayer.c | 11 ++++-------
>>   drivers/media/platform/vimc/vimc-scaler.c  |  8 +++-----
>>   3 files changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>> index 87ee84f78322..236412ad7548 100644
>> --- a/drivers/media/platform/vimc/vimc-common.h
>> +++ b/drivers/media/platform/vimc/vimc-common.h
>> @@ -27,6 +27,10 @@
>>   
>>   #define VIMC_FRAME_INDEX(lin, col, width, bpp) ((lin * width + col) * bpp)
>>   
>> +/* Source and sink pad checks */
>> +#define VIMC_IS_SRC(pad)	(pad)
>> +#define VIMC_IS_SINK(pad)	(!(pad))
> 
> This is true now, but it might not be true in the future.
> In the output video device (that was sent by André but not yet upstream) for instance, only have a single
> source pad (which I suppose the index will be 0), and this macro won't be true.
> 

> Maybe we could check pad flags in sd->entity->pads[index].flags ?
> 

I think this change should be done in André's patch?

thanks,
-- Shuah
