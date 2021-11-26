Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CA145EA9B
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 10:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376443AbhKZJqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 04:46:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40643 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376447AbhKZJoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 04:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637919665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XQ8zhic8rwqFo80m/Z0mxtKZqdZaSQ8gA/tqkSNsYS4=;
        b=H1SU4reYbSfpGpmejdi8A9f/vDkv2xNdW85xlhy4MlbIwEVd7K6mDbk1HzcdVhArMUEewR
        32aJOMZRR5BFAqy9dFRpJ8USzsHHPR6VfBBX1q2YV2Fu8vR4ovzI4HQ/st4AS5UHsPntek
        R3C/pUHkF1QAF9S7NIgh3dVteKR8avs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-BscWzf8EMymu1DSxeN7EZw-1; Fri, 26 Nov 2021 04:41:04 -0500
X-MC-Unique: BscWzf8EMymu1DSxeN7EZw-1
Received: by mail-ed1-f69.google.com with SMTP id bx28-20020a0564020b5c00b003e7c42443dbso7531375edb.15
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 01:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XQ8zhic8rwqFo80m/Z0mxtKZqdZaSQ8gA/tqkSNsYS4=;
        b=54wdYhZcJwoAzL6enzidHxxjR/wPpxCm2S6JHlQG+pI6PKVW6/8wuRRyBRNGUL+WhM
         kQBmbCeWI+rVvNH8bvtd57pGzJCR19creMNMakCIKjtveC6QSEHh3prlEdF72Ft2hMF8
         Z6Wh4aD2F6GEYAv710iZ013TgtPCfZHbHYVhVXGHpC8DMeiT8FmF4aPaZKZbU+4KJ94k
         /kDopeI61A2A15n+SiaxUpKJwp3iEsZhsgt+PR6y2v4CvuNSvJKYOwg6BEvQYgZzMBM6
         8dM79990GYUT5hOaizbTEl/8bNmf7D2U/Kxm/FLuGMLrjEYUgx99hSrQHWbGr4SiBxtZ
         0oxA==
X-Gm-Message-State: AOAM533B97jdIA23oIIcPV1eyjlAy9Rs+k7JI8qbqc74GDQ1Hu8slQmP
        hWiaxdAq6aq6yffYPujEqBeuJSwQTgNjyHKacrDE6NRM1ZeN5fKCns92glafYOVPU8BpLb5GWxD
        GZTG2fzHDXv8LiIS/wlas5PA=
X-Received: by 2002:a17:907:9713:: with SMTP id jg19mr37186766ejc.364.1637919663307;
        Fri, 26 Nov 2021 01:41:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwySm9kypZw0/KND1Q6vdFrXBF9DznM4Uom9IUzAe6LcNHy1MVU1135+eTkzJJZlmRpFNhgNg==
X-Received: by 2002:a17:907:9713:: with SMTP id jg19mr37186751ejc.364.1637919663148;
        Fri, 26 Nov 2021 01:41:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id yc24sm2753029ejb.104.2021.11.26.01.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 01:41:02 -0800 (PST)
Message-ID: <f6982c60-3bf1-aa6c-2705-4d7315d77039@redhat.com>
Date:   Fri, 26 Nov 2021 10:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH 0/2] Introduce ancillary links
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hanlinchen@chromium.org, tfiga@chromium.org,
        kieran.bingham@ideasonboard.com
References: <20211126001603.41148-1-djrscally@gmail.com>
 <YaBNlpcr+i6s5rng@pendragon.ideasonboard.com>
 <de31fd62-b6f9-e042-9d26-6c3feb3faaa4@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <de31fd62-b6f9-e042-9d26-6c3feb3faaa4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 11/26/21 08:58, Daniel Scally wrote:
> 
> On 26/11/2021 02:59, Laurent Pinchart wrote:
>> On Fri, Nov 26, 2021 at 12:16:01AM +0000, Daniel Scally wrote:
>>> Hello all
>>>
>>> This series is not yet ready to merge, but I wanted to share it as I know some
>>> other folks are working in similar areas at the moment (and I am including the
>>> libcamera devel list for the same reason)
>> Seems you forgot to CC libcamera-devel :-) Let's fix that on v2.
> 
> 
> Argh! Sorry, will do

First of all, thank you very much for this RFC series as well
as for the matching libcamera series.

For v2 of the series can you please also add Kate Hsuan to the
Cc (I've added there to the To of this email). Kate is a colleague
of me working on adding auto-focus support for IPU3 based setups
to libcamera.

Regards,

Hans

