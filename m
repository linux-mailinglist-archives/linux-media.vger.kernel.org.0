Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAA61C5B99
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 17:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730313AbgEEPim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 11:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730300AbgEEPil (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 11:38:41 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CF5C061A10
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 08:38:40 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z6so2867452wml.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 08:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AVa3piQpDFWYP9rYPGIqK+C1DDkybXP1NkoRObLJTTk=;
        b=r0LqwXqgQeRhxVrUgatEa8S/KzIgQK43oUS7Da70Pv/qZBQTn8NP6uYcZV4z/jjlXm
         KjvOE2Cq4ZR5eD6Kp/fj6BDm7X4Yvgp5gKCW9KM3VpdXy0pSkJ6lpdw0JXzZpE1Avf88
         xUh1bYlutknzuWBKHt16Jbd09BBP7bH29rhAUQy9cO4xS6EF6+2Pin+GsjZxXxbxke3z
         TDeMke2LVVjRtPCk/0dgR4OPMicSXJrHvqOq+jZyCYGKMlEw+HGBatsobifvXIcd0D0K
         2r8suaprvSAaclpAUctbiJYKbNkIUINn03Pbq7ClRXvwYUMZ7USOQBq+EW3xt1mnvMZv
         +lBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AVa3piQpDFWYP9rYPGIqK+C1DDkybXP1NkoRObLJTTk=;
        b=kMeaS07W5p9rBDPJHaydboxJbW+cwa8qCjuOGpxqGAsz0V5ZYn4kkHpr5ec1JRvCX4
         zKtEb5Rd2lvx9xsce25QL31iIGdkZi7ZnxFeFaKRpLPh5iCz5H4QG3ZeGsIsoZk3uk6G
         /2cav3O+zzn6YFBAH1KZnVHeWWtY8vdQrgJ9LoROYd7LjgDdrIysasGfDoM4gXXBXo+k
         b9Q1BwWCZwwTyQYAQheqVOo5ZnD/nfKZH8CYvRrSE889UBrYCuPCEwq8zhOeOlMa2Hnp
         ZZhnKar1btleCSAbdxAihRMXYlN7OvwJpog+GjM4/Ga3s8D43pTB56JsWMBJAM54QiXF
         txZA==
X-Gm-Message-State: AGi0PuYDSDvdv3VkNBNnIBIULS8FG06Rb3CW0w4mQeXMoGG/LFpf73/j
        pp9ahoN3PVgNSEK6RZoqvT9h/g==
X-Google-Smtp-Source: APiQypJPYPP+IYYmjVRGn//JzWiawsk0qntwn3Fqbpw+4CU/DyX93oedndRZGx5sGqdUHeD/EX/m8Q==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr4031191wmc.67.1588693118722;
        Tue, 05 May 2020 08:38:38 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:4460:3fd3:382:4a71? ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
        by smtp.gmail.com with ESMTPSA id b191sm4793927wmd.39.2020.05.05.08.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 08:38:37 -0700 (PDT)
Subject: Re: [PATCH 2/3] media: meson: vdec: fix another case of VP9 buffer
 shortage
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Maxime Jourdan <mjourdan@baylibre.com>
References: <20200428125036.9401-1-narmstrong@baylibre.com>
 <20200428125036.9401-3-narmstrong@baylibre.com>
 <20200505171840.48d89ccc@coco.lan>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <b8f5a2a2-d1d8-9b4f-df72-479adcac7277@baylibre.com>
Date:   Tue, 5 May 2020 17:38:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200505171840.48d89ccc@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2020 17:18, Mauro Carvalho Chehab wrote:
> Em Tue, 28 Apr 2020 14:50:35 +0200
> Neil Armstrong <narmstrong@baylibre.com> escreveu:
> 
>> From: Maxime Jourdan <mjourdan@baylibre.com>
>>
>> - Redo the logic where VP9 gets fresh CAPTURE buffers. The previous code
>>   could lead to a hardlock.
>> - Reserve 4 margin buffers instead of 3, as apparently there are corner
>>   cases where 3 is not enough.
>>
>> Fixes: e9a3eb4819ca ("media: meson: vdec: add VP9 input support")
>> Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
>> +static struct vb2_v4l2_buffer *get_free_vbuf(struct amvdec_session *sess)
>> +{
>> +	struct codec_vp9 *vp9 = sess->priv;
>> +	struct vb2_v4l2_buffer *vbuf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx);
>> +	struct vb2_v4l2_buffer *vbuf2;
>> +
>> +	if (!vbuf)
>> +		return NULL;
>> +
>> +	if (!codec_vp9_get_frame_by_idx(vp9, vbuf->vb2_buf.index))
>> +		return vbuf;
>> +
>> +	vbuf2 = get_free_vbuf(sess);
> 
> Huh!!!!
> 
> Never use recursive functions inside the Kernel! Kernel stack is too
> limited.
> 
> Also, even if Kernel stack would be unlimited, the above logic
> would endlessly be calling get_free_vbuf(sess).

Will rework this correctly, thanks for the review.

Neil

> 
> Thanks,
> Mauro
> 

