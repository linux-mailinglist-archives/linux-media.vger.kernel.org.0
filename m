Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E301EF1C3
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 09:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgFEHCR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 03:02:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42772 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgFEHCQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jun 2020 03:02:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591340536; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZIUioFGqsAGz4kjU7gMFcICmC9eQAnxqAo7nG9yOo60=;
 b=xkdZokXheR53NqaLWPHBFBl09D6t2pl8c2InvZokP8ECkMMdaeFNo/Krb5p72QMjA5fPFkAf
 2eABW/OfxKaxSLmotGkX9Rxon1hSUU1NqcAgUfrPYfQy2rIWAV+GmHCQFZDDXssVgHHD8TEB
 GA5GqtBjzt2uq7jpXH2Fh4Rlq5I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ed9edf74db551abdef10834 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Jun 2020 07:02:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30000C433CA; Fri,  5 Jun 2020 07:02:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BAC1FC433C6;
        Fri,  5 Jun 2020 07:02:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 05 Jun 2020 12:32:14 +0530
From:   dikshita@codeaurora.org
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        linux-media-owner@vger.kernel.org
Subject: Re: [RFC] METADATA design using V4l2 Request API
In-Reply-To: <ad61378b-e279-d161-adaa-17349adf183e@xs4all.nl>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
 <d1179bc1-662b-615f-0f9b-67693fe8c906@xs4all.nl>
 <fb96e2c09346e7831a0af99c0fe9f94c@codeaurora.org>
 <7be1070ee7aad1f48fc6de63523da8e1bc952dc8.camel@ndufresne.ca>
 <ad61378b-e279-d161-adaa-17349adf183e@xs4all.nl>
Message-ID: <5356c146a340d951b8d492373f349199@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Nicolas,

On 2020-05-29 13:01, Hans Verkuil wrote:
> On 29/05/2020 04:18, Nicolas Dufresne wrote:
>> Le jeudi 28 mai 2020 à 16:18 +0530, dikshita@codeaurora.org a écrit :
>>>> not allowed. So I need to know more about this.
>>>> Regards,
>>>>        Hans
>>> 
>>> we need this for use cases like HDR10+ where metadata info is part of
>>> the bitstream.
>>> 
>>> To handle such frame specific data, support for request api on 
>>> capture
>>> plane would be needed.
>> 
>> I have a bit of a mixed impression here. Considering how large the 
>> ioctl
>> interface overhead is, relying on HW parser to extract this medata 
>> woud be the
>> last thing I would consider.
>> 
>> Instead, I'm quite convince we can achieve greater and likely 
>> zero-copy
>> perfromance by locating this header in userspace. So everytime I see 
>> this kind
>> of API, were the HW is *needed* to parse a trivial bit of bistream, I 
>> ended
>> thinking that we simply craft this API to expose this because the HW 
>> can do it,
>> but no further logical thinking or higher level design seems to have 
>> been
>> applied.
>> 
>> I'm sorry for this open critic, but are we designing this because the 
>> HW
>> designer exposed that feature? This is so low complexity to extract in
>> userspace, with the bonus that we are not forced into expanding the
>> representation to another form immediatly, as maybe the display will 
>> be able to
>> handle that form directly (where converting to a C structure and then 
>> back to
>> some binary format to satisfy DRM property seems very sub-optimal).
>> 
>> Nicolas
>> 
> 
> Nicolas raises good questions: it would help if you can give more
> detailed information
> about the hardware. We had similar discussions with Xilinx about
> HDR10+ (see this
> thread: https://www.spinics.net/lists/linux-media/msg163297.html).
> 
> There is no clear answer at the moment on how to handle dynamic HDR 
> metadata.
> It will help if we have some more information how different SoCs handle 
> this
> in hardware.
> 
> Regards,
> 
> 	Hans

As per Widevine Level 1 requirement, it needs “Hardware Protected Video 
Path”.
Hence, in case of secure bitstream decoding, we need decoder metadata 
delivered from HW.
CPU cannot parse secure bitstream and extract them.
Apart from this, there are other metadata like "histogram" which is not 
part of the bitstream
and generated by hardware

Thanks,
Dikshita
