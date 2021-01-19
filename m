Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E862FBC90
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 17:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731276AbhASQd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 11:33:58 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42469 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731235AbhASQdd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 11:33:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 1tvjlDTcDftvz1tvml5Vtf; Tue, 19 Jan 2021 17:32:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611073959; bh=wYhrTKH2t21lZXwyGmejDeHeKnkj/BWeXbuIqeryTwY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sqxZfDyTCVuNpKBAfPrrVkX3FiCztvM0zFgB1G8bRS76nGv9DFJZ9RvI3IwrFaBcr
         OL3txbj3XoNKHYVipxAm4CX+xlnyR2fRABeGohbkakItHMsqRplLUL4cf9L5IUCRvO
         UKqskQuyGCNGlUaQrSgSlqhkvvm2XIujrlGtg1zqKbWEm502YYIk23ZxM+L6YZJBQO
         pNDE2jVYqKHm2+Rb5ksLosHk1NTeKzOieabHU+VsoNkt0JkepTGfZerxaVBvzBIbar
         cja5MUsBYX5jDrSbtB3WQuWV3bIBkpj7GD+46Teeyrfuiypu7vXgp74Tihx36RCKlp
         h/DG9JzS+4REg==
Subject: Re: [PATCH] media: rkisp1: uapi: change hist_bins array type from
 __u16 to __u32
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        heiko@sntech.de
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20210119145341.29686-1-dafna.hirschfeld@collabora.com>
 <a8f8d9e9-30b1-b594-a9bc-f4a11924bf56@xs4all.nl>
 <fbe57350-f319-dbc7-f093-d3c1c76feb89@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2e48068e-fcc4-9288-a9a6-59f71d7f20ce@xs4all.nl>
Date:   Tue, 19 Jan 2021 17:32:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fbe57350-f319-dbc7-f093-d3c1c76feb89@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCmWMp1wb3CXvGZOfejdVwWN8GqWGVKh1SwWabgSPa5C4Cx1feifUUkWqOxtJoZQ8Ek8/VP3J1TPewAaowW6Ve5JiWU5UFxv8iXCby0q23rBlkKQymPj
 SjfyrJmr5GJtaQ1W5Bc/VZ+30T1kDOIWKhPXhrOEVQKI6PjQFYHXWEEJidOC/5fF6tEPT1sfWx6lAh40fqCjJYQETi2DtmIkbugQns7L/dE5IISCYY9yx3wu
 pTIUNGTYR/iRJKdI9iWttqhylpAOUjeq0Gq3EVxnSv7ADR0fwnUAgyvOto5oae0QxrUZUvc6DxPNGnPB6qz8mZ1Dj6cCATfT/c7VYSlp9mPnHVJdLp3jDRMP
 6jaoxnOMiyq+KH1lJ5I8CyteMSVtNSVk7L0SjD1qBsnTnWZpNOAo/2PXREruSL0luscHAGpWjmjOGnSOZ9DEwxw0w6fe+stdOz/IaaClss5fUrWBOfOZPB9G
 BmbRyL9NSF3ito2/qaSNG9Nz5hFL8aAMwzI8Qt32wUTck/2IFehJPgsiudrLSaFiFkuCo411fVqgbUgyaEN9XLRZF/gtoGry8YY1Kpsbxn4nNnhVaRXFgMMW
 cS3e3V07avlC23Qr+CfDNuEj
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/01/2021 16:32, Dafna Hirschfeld wrote:
> 
> 
> Am 19.01.21 um 16:00 schrieb Hans Verkuil:
>> On 19/01/2021 15:53, Dafna Hirschfeld wrote:
>>> Each entry in the array is a 20 bits value composed of 16
>>> bits unsigned integer and 4 bits fractional part. So the
>>> type should change to __u32.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>> This patch is applied on top of v6 of the patchset
>>> "Fix the rkisp1 userspace API for later IP versions"
>>>
>>>   include/uapi/linux/rkisp1-config.h | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>>> index 57ca3eea985f..47f6b84d7c56 100644
>>> --- a/include/uapi/linux/rkisp1-config.h
>>> +++ b/include/uapi/linux/rkisp1-config.h
>>> @@ -895,7 +895,8 @@ struct rkisp1_cif_isp_af_stat {
>>>   /**
>>>    * struct rkisp1_cif_isp_hist_stat - statistics histogram data
>>>    *
>>> - * @hist_bins: measured bin counters
>>> + * @hist_bins: measured bin counters. Each bin is a 20 bits value
>>> + *	       composed of a 16-bit unsigned integer and 4 bits fractional part.
>>
>> So bits 0-3 are the fractional part and bits 4-19 contain the integer part?
>> What goes where should be defined!
> 
> Actually I don't know, I just copied the docs in the datasheet.
> I can try figure it out. I can meanwhile send a patch without the doc until
> we are sure. Is that OK?

No, this should be documented properly.

Is this the only fractional type that is used in the rkisp1 uapi or are there
others? (Just checking).

> 
>>
>> Looking at rkisp1_stats_get_hst_meas() I see this:
>>
>>          for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
>>                  pbuf->params.hist.hist_bins[i] =
>>                          (u8)rkisp1_read(rkisp1,
>>                                          RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
>>
>> Here this is cast to a u8, so how does this work?
> 
> This seems to be a bug. I see that this cast is introduced in v12 of the patch
> "media: staging: rkisp1: add capture device for statistics".
> This cast does not exist in any of the downstream versions.

Clearly something that needs to be fixed as well.

Regards,

	Hans

> 
> Thanks,
> Dafna
> 
>>
>> There is something fishy here...
>>
>> Regards,
>>
>> 	Hans
>>
>>>    *
>>>    * The histogram values divided into 16 bins for V10/V11 and 32 bins
>>>    * for V12/V13. It is configured within the struct rkisp1_cif_isp_hst_config.
>>> @@ -909,7 +910,7 @@ struct rkisp1_cif_isp_af_stat {
>>>    * RKISP1_CIF_ISP_HIST_BIN_N_MAX is equal to the maximum of the two.
>>>    */
>>>   struct rkisp1_cif_isp_hist_stat {
>>> -	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>>> +	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>>>   };
>>>   
>>>   /**
>>>
>>

