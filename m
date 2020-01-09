Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDF013553E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 10:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgAIJL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 04:11:56 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40805 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728565AbgAIJLz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jan 2020 04:11:55 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pTr2ifgi8T6sRpTr5iJl9k; Thu, 09 Jan 2020 10:11:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578561114; bh=UlqesI6gSSS8++9yX65c9DLlbuwVIyDHmf34kZcOyL4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Wz+A7AsssyI+AgNTcJXvnwnJpdVvcctnq4MxkNvG+/mILYF7xU4FFmkvPLnrc82Un
         kIUIZCFqGI/b8F7Q8fM/1PkJC7KDRVQ8VW893tqj7iuku+kSVfl611X1wpfeXYAhtO
         PSRPsJQcZd4tzeRFImchQO31f4DtBiIfpjGmEMx6lqK/lmq8YOT+qXqu3LoIzWKcUn
         9hG6VefXu7XNQi6/oTHcJ+W/LYAV0DOp1S42YlU1p19TB1J/vWNiXy5IeLUIeFZPgZ
         M0w6DkJ2r4Odl9KGSHuQtGktUnBXiB619FQPzTFmnzBQz2GjPxhJd8EWk/xQGXDbxq
         PnsecslZSKH2A==
Subject: Re: [PATCH] drm/Kconfig: add missing 'depends on DRM' for DRM_DP_CEC
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
 <bbbef09d-6c90-75ba-e480-28365474b1a5@xs4all.nl>
 <20200108174236.GH43062@phenom.ffwll.local>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <008645fc-29e0-6cf1-5871-dc01898449f0@xs4all.nl>
Date:   Thu, 9 Jan 2020 10:11:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200108174236.GH43062@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAIjQxO9UiwegK3KQxRkG+HbFATzpReCspiJv1i5JIGYSCLcLqTC315jR0IxEoBzhXAlRR9XEBGpp6t/zJj3XLAdCCM3I2r8IlLn+IV+Pfaii967TpkX
 1jww40g26M0mcSkBlGmQ1Xa2MrdLI8de6BP61Xksd2nL9Nj5uXkRB9P+SR6VA4Ra1CrDdDk77bCUlUVpMO93ME7y3QxWgv6Gi5go6hUKH+zYB5wYdML2OUxG
 0ueICpt3yJO8M7o73URd3g5UyOHWG2kaDT6SK03kSOKnq5yaoC4C6Trj3IRtFs/S
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/8/20 6:42 PM, Daniel Vetter wrote:
> On Wed, Jan 08, 2020 at 01:08:47PM +0100, Hans Verkuil wrote:
>> On 12/6/19 12:26 PM, Hans Verkuil wrote:
>>> Add a missing 'depends on DRM' for the DRM_DP_CEC config
>>> option. Without that enabling DRM_DP_CEC will force CEC_CORE
>>> to =y instead of =m if DRM=m as well.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> Daniel, can you review this? It's annoying that the cec core is
>> compiled as part of the kernel when it can just be a module.
> 
> Why did we even make this optional? Really worth it to compile out 4
> functions and some change?

It's not about those few functions, it's because this enables the CEC
framework as well (drivers/media/cec).

If CEC is not needed, then disabling this saves a lot more code than the
few functions in drm_dp_cec.c.

CEC is an optional HDMI feature, so CEC support for HDMI input/output
drivers is optional as well in the kernel config.

Regards,

	Hans

> 
> Anyway the one you really want here is CONFIG_DRM_KMS_HELPER, but that is
> a selected variable, and you can't mix select and depends on because that
> breaks Kconfig in hilarious ways. Or so I thought, but other public
> symbols like this (e.g. DRM_FBDEV_EMULATION) do the same trick. So I guess
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> But really, is all this complexity?
> -Daniel
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> ---
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 1168351267fd..e8e478d6da9c 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -163,6 +163,7 @@ config DRM_LOAD_EDID_FIRMWARE
>>>
>>>  config DRM_DP_CEC
>>>  	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
>>> +	depends on DRM
>>>  	select CEC_CORE
>>>  	help
>>>  	  Choose this option if you want to enable HDMI CEC support for
>>>
>>
> 

