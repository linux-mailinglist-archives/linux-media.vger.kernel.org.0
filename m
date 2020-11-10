Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B011D2AD29B
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 10:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgKJJis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 04:38:48 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38363 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726690AbgKJJir (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 04:38:47 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id cQ6rkkm8ENanzcQ6uk5Cft; Tue, 10 Nov 2020 10:38:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605001125; bh=hv01Kk2652coHy4On3dL8LtUYjb1Cu0evmgcwltbS2g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=p43vMlCWUcY7EIwJd/zAboLnwAo21/JPQz2g63kIDXBoSX8mOoxPDFmGzXVgQ6uak
         fS2el7KGr76MErdLR0gjKS/h1JZ1SUNVZj/FKK2iTk5XyH1Mqxdbdr5f/RFz82Xl38
         LyQYhm5t39lhk0s+4XNpcIWTeLEa2oAR6agr+cw/lNVTfaxoxCEwzv5/1QIxxclShq
         R/L9Zr0uFS7r5rxHxs4Xz7SerodpmvDC3lOc1ZTQhZC4oXv/Vhd91Egxm56FRmD4eN
         K0QW3RwXq6VColiDNsWC/524JHEWTGt+XhWLRYuUERjZAWzZT44PNZz2OfmMwVndP4
         PCCagogYqiUTw==
Subject: Re: [PATCH 0/3] HDR10 static metadata
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
 <2f907743dbb77f4c2f871675070065dd372514be.camel@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <79148cf4-96dc-0c00-2864-183e526a65e9@xs4all.nl>
Date:   Tue, 10 Nov 2020 10:38:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2f907743dbb77f4c2f871675070065dd372514be.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfF7Kw0R/bZ69mWXhzR8X4MduX3aPBOFRa9O5RJOWe1Z4f1EQ6Vov5KtHbM1FIixAH3ZV55idg6X5TVwlT6pHfduWtQlT0g3/IQkeF2rgqepIIWv2ljd/
 2Kj6THfk7jm78ahdyMGIGqkJciIuutqgoVmltIO4/0LH4PlSw6rNCZYzkrM9+9YbW270iS66gXvxL9POYzWJU+cDDUz/t0GhDSOIRuAUyodbSrhig9i6VHDW
 PZXzCo/nMJTqu/7rmPHhRbbi+37t6OxP8uVT0kIe1AWmqeR/wD8HjWkXUK7MhzCY/UIri3UtVejW6lSlSJbZlM+23VIaFLDNTifo2wsCFCCVWbyfokVlmked
 aHFnh42iPVjpHKmioGDcWPtsvdTlxQ3/gD2jeVkobuEEpkJRu1lk2EuBsS2AXhhPfdDb+67B
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/11/2020 20:53, Nicolas Dufresne wrote:
> Le lundi 09 novembre 2020 à 19:31 +0200, Stanimir Varbanov a écrit :
>> Hello,
>>
>> This patchset adds two HDR10 HEVC v4l2 controls for Content Light Level
>> and Mastering display colour volume plus implenmentation in Venus encoder
>> driver.
>>
>> Comments are welcome!
> 
> It is not a formal review, but I did walked through the new API and
> everything looks fine to me. One question though, are you aware that
> the H.264/AVC equivalent is identical ? What is you plan for that ?

Not only that, but these structures are lifted straight from the
CTA-861-G standard: see "6.9 Dynamic Range and Mastering InfoFrame"
and "6.9.1 Static Metadata Type 1".

So this is equally useful for HDMI receivers and transmitters.

Actually, include/linux/hdmi.h contains a struct for that, but it seems
to be missing a lot of fields. But we need a v4l2 control anyway and hdmi.h
isn't a good fit for that.

Regards,

	Hans

> 
>>
>> regards,
>> Stan
>>
>> Stanimir Varbanov (3):
>>   v4l: Add HDR10 HEVC static metadata controls
>>   docs: media: Document CLL and Mastering display
>>   venus: venc: Add support for CLL and Mastering display controls
>>
>>  .../media/v4l/ext-ctrls-codec.rst             | 61 +++++++++++++++++++
>>  drivers/media/platform/qcom/venus/core.h      |  3 +
>>  drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 +++
>>  .../media/platform/qcom/venus/hfi_helper.h    | 20 ++++++
>>  drivers/media/platform/qcom/venus/venc.c      | 29 +++++++++
>>  .../media/platform/qcom/venus/venc_ctrls.c    | 16 ++++-
>>  drivers/media/v4l2-core/v4l2-ctrls.c          | 61 +++++++++++++++++++
>>  include/media/hevc-ctrls.h                    | 41 +++++++++++++
>>  include/media/v4l2-ctrls.h                    |  2 +
>>  9 files changed, 240 insertions(+), 1 deletion(-)
>>
> 

