Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693BB24345C
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 09:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgHMHHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 03:07:21 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42465 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725982AbgHMHHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 03:07:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 67KXktTIyuuXO67KYkGQNS; Thu, 13 Aug 2020 09:07:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597302439; bh=UGlFFv7HbytGbkkikidK2sMtHAiyG+eFIqBJH2BEHKA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FNlNEMF/JJ3DxONZvgf39l8lUWN+Tu0lDuvUvb50W1fLg/Z0QoFGiJ+OTrPgmQZMJ
         qiLQkpXL4v7pvyK8FsJQEAQsKF6joqAP3/rlFfFyFhSWumncD4BY5eH3XL9BQWPkzP
         U4fwwzKBoQnoaK7ZQMpeF7WGptAxl1tC7EsX81/bohNYry23dDtmfj9bay15fhkLp8
         QW/9w+ykv7UAcSSx5EEM1dYM0fq6qP+7l985hQT4UF7XG8/0GGLe2CiPb2tqiqIev4
         7vQ96uC4z2aYJ82qNFuABUbGFTKxxq2udni7oFv2tHI24JAis7/Yj38jRpzHkPlgoM
         Gq+0ezH/f0Tnw==
Subject: Re: [PATCH for v5.8] vicodec: add missing v4l2_ctrl_request_hdl_put()
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <60cb280b-fb2a-86f6-aefb-cc12386b3adf@xs4all.nl>
 <CAAEAJfBAgpXpe7XR-y7uMLT2-O69+M+6Ri06zhum79VHUf+d_A@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <07dc02b8-ea31-af86-2182-55114b0a8a35@xs4all.nl>
Date:   Thu, 13 Aug 2020 09:07:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfBAgpXpe7XR-y7uMLT2-O69+M+6Ri06zhum79VHUf+d_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKwGI4tdXxBFkeT9fx7b9/xf+9oQjoc/8Vk9yAyZmWaF3GJFsMgSNSDKWyswhm2axYJT5SywR9c+j3PENCrD4L2PIVf++wkYTPCvbg2L7q03MC7mFFGt
 +4ONTL4ghcVuiYjLyLNTmU9WoAX7uAPkNMJcUMgh3r0nlEtYy3t44bmS2ugfeXCdOkOoXurwo3ZE4VB048Slup6RCRezJVNOCnWL2fs6wi6RGqhtiHdA/k6a
 fjXUTzSS9HPynDWgbdEmyXx8HwhfQGB+7m/Mw64yA2e947lBZWB79FLSgcru2K8Mtsi/awgFQibg4Ih9VNNlTg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/08/2020 21:53, Ezequiel Garcia wrote:
> On Wed, 12 Aug 2020 at 07:30, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> The check for a required control in the request was missing a call to
>> v4l2_ctrl_request_hdl_put(), so the control request object was never
>> released.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Fixes: 997deb811bf5 ("media: vicodec: Add support for stateless decoder.")
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Seems there's a similar leak in cedrus_request_validate error path,
> when v4l2_ctrl_request_hdl_ctrl_find fails.

Correct. Will you make a patch for that?

Regards,

	Hans

> 
> Cheers,
> Ezequiel
> 
>> ---
>> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
>> index 8941d73f6611..71928e30dae8 100644
>> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
>> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
>> @@ -1994,6 +1994,7 @@ static int vicodec_request_validate(struct media_request *req)
>>         }
>>         ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl,
>>                                                vicodec_ctrl_stateless_state.id);
>> +       v4l2_ctrl_request_hdl_put(hdl);
>>         if (!ctrl) {
>>                 v4l2_info(&ctx->dev->v4l2_dev,
>>                           "Missing required codec control\n");

