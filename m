Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF0462AEFF1
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 12:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgKKLsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 06:48:23 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47229 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725860AbgKKLsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 06:48:22 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cob8kms8XRiwVcobIkaEFp; Wed, 11 Nov 2020 12:48:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605095296; bh=WuBCWYKViMmUl8eqIdMbgwN9AJKK362w9I6qvWQiMdY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BHVG6w62dwFXec8XCS+BKWjhxWw9bZrzhR6ThYFAaD648Fv7qpXkEzLad/ozMnRLz
         pApJK+oRpcgZBzOu0soFqj+x+7bU6IEyTsK54xe3GEuSrQtbAbFdNhILTQ+ZACDb3g
         z0WgWCJNLXnTtLjyD+v0CtRnACHpz/TScR6RV+ZVoLU5HaTKrTzvIRHue4IfXSE+NQ
         h1Q4nPegk2qWADtpUCkt8JqL7QwKmgBtXgt6a6zvbcQoxv4XQNzWLMLFn7YNRdpaiX
         nJI71OE3yGjtM21qSI3QwZO8Ul6TVGd0Pl+Oas1Cii72tSAX8tnj0sLakVGvWGSgIB
         2tGNdWjWeTcGg==
Subject: Re: [PATCH v2 0/2] Add new controls for QP and layer bitrate
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, ezequiel@collabora.com,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org,
        majja@codeaurora.org
References: <1600693440-3015-1-git-send-email-dikshita@codeaurora.org>
 <871d369fc987ac7cc24bdab9bc9df9fadf939c01.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b871bb4d-34ae-6161-5901-8df7fd82c53b@xs4all.nl>
Date:   Wed, 11 Nov 2020 12:47:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <871d369fc987ac7cc24bdab9bc9df9fadf939c01.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLaXZhwqqjpGuIkCkVJcuv4yzjWUcdz0fKkQzXK6KLuUa7HMqlJ4UO0kEEgaAOeznOmX9Gs3ZRrf4mc+7C8hOeHkn0Gt+mqtEP1gHD/G3vGgxr3cFdL5
 uClKOdNAo2agjxXq9O+rjwnxXB4coUYjAHmU1sM4Elb/wikOaCWrJOuLzX5SEqnZd8O2vTEI5dh89DxEv+j54Qp6LCQJ69mb+ykUOwtVHrrI8WPbDx3YDODs
 t9rspCPjQn+TJZ0zdFWufnyxyO1dG5UUR7BmN82mjuyIH8uSUfmCMFGhkZFrqhFtbw6wrMRuzCgY9NJ/q97v/hvGV2/52Qr6NGSPosq7qmjoWJnCbEt7Xj0P
 9HSoLoSlkD3VcY04Ep1KAWMzJl0uUpJO4dqnyLZkQhl2cvcXqGwhUxv1U2itQa3XhoHtQTm68dxlQWPAux9BlFAd/NgiPjtjTVN4Yo8cNiQeW5ULQYIBVKnX
 NF+DfgY3pbLyEPot2OMvSbCIONpglv7AucpgOHyusM9j5EqlXDYJZh0IOUs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/09/2020 19:42, Nicolas Dufresne wrote:
> Le lundi 21 septembre 2020 à 18:33 +0530, Dikshita Agarwal a écrit :
>> This series adds frame specific min/max qp controls for hevc and layer
>> wise bitrate control for h264.
> 
> Any chance you could append your driver changes with this set ? I don't
> think new APIs ever make it without a driver using it.

Indeed. I'll mark this as 'Changes Requested' in patchwork: I do need a
version that actually uses these new controls in a driver.

Regards,

	Hans

> 
>>
>> Chnage since v1:
>>  corrected email.
>>
>> Dikshita Agarwal (2):
>>   media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
>>   media: v4l2-ctrl: Add layer wise bitrate controls for h264
>>
>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 74 +++++++++++++++++++++-
>>  drivers/media/v4l2-core/v4l2-ctrls.c               | 15 +++++
>>  include/uapi/linux/v4l2-controls.h                 | 17 +++++
>>  3 files changed, 104 insertions(+), 2 deletions(-)
>>
> 

