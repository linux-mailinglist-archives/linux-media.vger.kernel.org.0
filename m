Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F182E17ECFF
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 01:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgCJAAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 20:00:07 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38646 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbgCJAAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 20:00:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id z5so704782pfn.5
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 17:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=niTunMmlPJduIlmanU9eN7BQYalVx8LAC2Od9cW+wO8=;
        b=ZnhIiQdmkKTxYdzqqhNRl159c2q5dDnycngdttpu2N1e5BizH6Ggwnw5p39/c3W8Hx
         sbQUwZfyYOH3M3YPc44GVCUTbU1P2feoLiweSaKdH94EhWwZbHbOnrYCgzej152m5QQ8
         TMtFPHhBqVbBGq9kHGdAfvjvcyw3GYWbeaarIswjQ7IF4HhPOs0CvhXDV7RvIDw4DE9O
         fRPyd/v/JImRZkvUaNcEbO3gcA4MMKtpKGH5uLi89AuB2lAvv+ks2fGeRlO9h/Q72o+w
         vUewjYw/Ud9DMh/yq81wNslxXB7Gw6BcpCqjfmf/V8y1bGz/veCkPbr9LcTEbLnl1qw4
         4SGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=niTunMmlPJduIlmanU9eN7BQYalVx8LAC2Od9cW+wO8=;
        b=ChXEqEHGR42pd52DmCtw6jcQcKKN2mdy9STawxxanjebHd2/Pqg3GQBTpiRNgihXRz
         ld9SxGEPPaNicII88HREsWFrGV3uVsQfCBNRZNmF1Re+2Mn2JuY5ZrrSv32aQOlM2fdC
         gAoFms1sBh/ZtQULLl4KX+I/pWxlblg2mIJtTi3zOMokXUPZhPT/HfSzs/CCjIY1iYGo
         VjJcqxz/529xA0pilyT3sxPRrEpAumqPbLh6JcPtiilsEXDD5+7OGY4PlJyEfKBT1cDW
         SzXAtgInhQfcRlEPeob9aXaozhCLQhuJt1JuTBbMBK4OKL/Vj3pCrWnbpbD/noHkigq/
         svMg==
X-Gm-Message-State: ANhLgQ3uINnEGaA+uQZeXXO/316+fcPsEoV9qo3GP1Jxgl3mOEClKSdS
        24X/oYMyc5hZvKOLMEBwXCsp9NvCk1g=
X-Google-Smtp-Source: ADFU+vtlWYofr/DVhgntaYUpTRSf6UEQ0H5hlaHk07Vuwk0n/oVFwYvLE6LiWTuCzbMcNeuKfcGDUQ==
X-Received: by 2002:a62:5544:: with SMTP id j65mr19671268pfb.121.1583798405068;
        Mon, 09 Mar 2020 17:00:05 -0700 (PDT)
Received: from ?IPv6:2605:e000:d445:6a00:8145:3904:f092:dd35? ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id h95sm582649pjb.48.2020.03.09.17.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 17:00:04 -0700 (PDT)
Subject: Re: [PATCH 7/7] media: imx: imx7-media-csi: Fix video field handling
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-8-laurent.pinchart@ideasonboard.com>
 <3d979bfa-0bb2-0dde-9bc7-83ee3923d33a@gmail.com>
 <20200309205238.GH4916@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <ed913970-573e-4bee-ce84-28513a7869a9@gmail.com>
Date:   Mon, 9 Mar 2020 17:00:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309205238.GH4916@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 3/9/20 1:52 PM, Laurent Pinchart wrote:
> Hi Steve,
>
> On Thu, Oct 24, 2019 at 08:11:20AM -0700, Steve Longerbeam wrote:
>> On 10/23/19 5:41 PM, Laurent Pinchart wrote:
>>> Commit 4791bd7d6adc ("media: imx: Try colorimetry at both sink and
>>> source pads") reworked the way that formats are set on the sink pad of
>>> the CSI subdevice, and accidentally removed video field handling.
>> Well, let me restate the problem. This driver never did have correct
>> field handling (as you demonstrate in this patch, the driver never
>> set/propagated the field type to its source pad). So it's not accurate
>> to say the patch is a fix. A better description is that it adds
>> rudimentary field handling.
> Didn't it ? The above commit removed a call to
> imx_media_fill_default_mbus_fields() from imx7_csi_try_fmt(), and that
> function had rudimentary field handling. The Fixes: tag isn't there to
> blame you :-)

Sorry, you're right, 4791bd7d6adc should have placed some sane field 
value back at sink pad in imx7_csi_try_fmt(). But the problem is that at 
the time, I didn't know what a sane field value for imx7 would be (your 
patch resolved that question, by stating only NONE and INTERLACED are 
supported). But I must stand by my statement that field was never 
propagated to source. I guess I was waiting for someone to implement 
basic field handling, instead of possibly doing the wrong thing myself. 
I should have clarified at the time that there needed to be basic field 
handling added.

Steve

>
>>> Restore it by defaulting to V4L2_FIELD_NONE if the field value isn't
>>> supported, with the only two supported value being V4L2_FIELD_NONE and
>>> V4L2_FIELD_ALTERNATE.
>>>
>>> Fixes: 4791bd7d6adc ("media: imx: Try colorimetry at both sink and source pads")
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>    drivers/staging/media/imx/imx7-media-csi.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
>>> index ac07f55a63e3..0db6473caf13 100644
>>> --- a/drivers/staging/media/imx/imx7-media-csi.c
>>> +++ b/drivers/staging/media/imx/imx7-media-csi.c
>>> @@ -1017,6 +1017,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>>>    		sdformat->format.width = in_fmt->width;
>>>    		sdformat->format.height = in_fmt->height;
>>>    		sdformat->format.code = in_fmt->code;
>>> +		sdformat->format.field = in_fmt->field;
>>>    		*cc = in_cc;
>>>    
>>>    		sdformat->format.colorspace = in_fmt->colorspace;
>>> @@ -1031,6 +1032,9 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>>>    							 false);
>>>    			sdformat->format.code = (*cc)->codes[0];
>>>    		}
>>> +
>>> +		if (sdformat->format.field != V4L2_FIELD_INTERLACED)
>>> +			sdformat->format.field = V4L2_FIELD_NONE;
>>>    		break;
>>>    	default:
>>>    		return -EINVAL;

