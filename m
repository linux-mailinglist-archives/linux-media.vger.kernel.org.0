Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 321D9E28CE
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 05:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408341AbfJXD1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 23:27:25 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38506 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403962AbfJXD1Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 23:27:25 -0400
Received: by mail-pl1-f194.google.com with SMTP id w8so11131195plq.5
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2019 20:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DsLE+3SZLbWY+kpUVFckTo9aDTHrL6Xyo+e/ykGdN1k=;
        b=WKE5VuBjaHpCgRW0m2tvgUa0A+L+dZHKYCw5rFu4W9RkSo2wuFEpAn6nNQsgpBYSE2
         qgy6e+p0WRbQwieo7Cng7W8DGNsGznC3lj/690nBB09eInU2eJVgIWzWv3OJnYBZL2Eb
         SiFAymDJWHoqA6AEwmBgfAeJEiycqajzZVSy7NMUdiT74+At0y2LjZGqKZ3LYfaVb2eg
         +9Ly3ZkMi8m+o1EZ9G9QQAP+kSS5ZC9xxlSv7O+17x8un9bEWE9XPSy8L2Q6zp23nwap
         A0wZyE6pavnluDcxKbct1ja5oHdwFObBOpeAkajygbMMbI5CG7owZu+Pp5oF8YQy3ZlB
         MuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DsLE+3SZLbWY+kpUVFckTo9aDTHrL6Xyo+e/ykGdN1k=;
        b=fbObmViGnE/luo8km5Xp6z32NtwXN7eizYGrXE4VO76MHmjB23mIog5wc82CBelsxE
         lp/xGNrTc+h2BzNL1Cs8cS9ceNab/E9XD4DLWJBUCBRN5iGrFwPZuO53r53xZCeezwjE
         gDzfJ+wHoRsXsH/KimW1LBQplCbM5tK+ydIOiAj1RAq6Pv88LFktiq6csRfYu7W40Kpi
         jHHfGgw6OPCSYPNgjaY0vg3Na13Mk6r5ftFS2YWT0onOmZHvzbsQlSfP5PeIUC5lG21T
         Il7b9BbBqqieyaYKaUC3xLA6NuRT/tyZSV+mcfcpmw7JTYoQYZbjImPHrIp+wiq9pkug
         Ljuw==
X-Gm-Message-State: APjAAAUjYuiFwo7OhoJb/XxlWRJItvktTm/k+GwhLXlZKwx2IUxzmftO
        39fDuft7AtIz+7HI/DiJDG0=
X-Google-Smtp-Source: APXvYqy+6VDGlXAOc9r9O8cF5VMJIPodolpZt0cpFnIyfJbOSayJcD0yi0PL4HY1L5N/FgIgkr9ebA==
X-Received: by 2002:a17:902:8a94:: with SMTP id p20mr13455616plo.150.1571887644468;
        Wed, 23 Oct 2019 20:27:24 -0700 (PDT)
Received: from [192.168.1.59] (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id v3sm24163891pfn.18.2019.10.23.20.27.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 20:27:23 -0700 (PDT)
Subject: Re: [PATCH 7/7] media: imx: imx7-media-csi: Fix video field handling
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-8-laurent.pinchart@ideasonboard.com>
 <1bce458b-8e80-1ceb-2f6d-39a0f2856f87@gmail.com>
Message-ID: <a617461d-c516-db4d-d26c-b80a99f4807f@gmail.com>
Date:   Wed, 23 Oct 2019 20:27:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1bce458b-8e80-1ceb-2f6d-39a0f2856f87@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/23/19 8:25 PM, Steve Longerbeam wrote:
> Hi Laurent,
>
> On 10/23/19 5:41 PM, Laurent Pinchart wrote:
>> Commit 4791bd7d6adc ("media: imx: Try colorimetry at both sink and
>> source pads") reworked the way that formats are set on the sink pad of
>> the CSI subdevice, and accidentally removed video field handling.
>> Restore it by defaulting to V4L2_FIELD_NONE if the field value isn't
>> supported, with the only two supported value being V4L2_FIELD_NONE and
>> V4L2_FIELD_ALTERNATE.
>
> I think you mean the only two supported field values being 
> V4L2_FIELD_NONE and V4L2_FIELD_INTERLACED.
>
> For this driver to support ALTERNATE, it would have to detect the 
> captured field type and place that type in the returned vb2 
> buf->field, which it is not doing.

So the code change is correct, only the commit description is wrong.

Steve

>
>
>
>>
>> Fixes: 4791bd7d6adc ("media: imx: Try colorimetry at both sink and 
>> source pads")
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   drivers/staging/media/imx/imx7-media-csi.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/staging/media/imx/imx7-media-csi.c 
>> b/drivers/staging/media/imx/imx7-media-csi.c
>> index ac07f55a63e3..0db6473caf13 100644
>> --- a/drivers/staging/media/imx/imx7-media-csi.c
>> +++ b/drivers/staging/media/imx/imx7-media-csi.c
>> @@ -1017,6 +1017,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>>           sdformat->format.width = in_fmt->width;
>>           sdformat->format.height = in_fmt->height;
>>           sdformat->format.code = in_fmt->code;
>> +        sdformat->format.field = in_fmt->field;
>>           *cc = in_cc;
>>             sdformat->format.colorspace = in_fmt->colorspace;
>> @@ -1031,6 +1032,9 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>>                                false);
>>               sdformat->format.code = (*cc)->codes[0];
>>           }
>> +
>> +        if (sdformat->format.field != V4L2_FIELD_INTERLACED)
>> +            sdformat->format.field = V4L2_FIELD_NONE;
>>           break;
>>       default:
>>           return -EINVAL;
>

