Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2864AF1F8
	for <lists+linux-media@lfdr.de>; Wed,  9 Feb 2022 13:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbiBIMji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Feb 2022 07:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbiBIMjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Feb 2022 07:39:31 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698C2C050CC8
        for <linux-media@vger.kernel.org>; Wed,  9 Feb 2022 04:39:22 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id l67-20020a1c2546000000b00353951c3f62so1450829wml.5
        for <linux-media@vger.kernel.org>; Wed, 09 Feb 2022 04:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=dGGW+Si8tfNYD6/BfzzHME7/stO4K1E+ZfJZEWLpVBc=;
        b=Q5H4WLDnOclqpMfl2ZojsQUREOdRFQlAlcRqjEe1ZMbP1jvgRhqMpe+ShGobYv9Ot4
         xTINMa2MEbm9wRu5IE35CkqHULbccYgQ6Wca4PsjNpx1I10HRK3oc3K29C+kj4Z4fBqA
         n3jw49usk/t7xVKloA2c0i0HmRE3ysM8v2tjHpOqMpCRxEOzX6soXJEhLW/wZGjSwbHP
         TRJuxObEntuiQZpSLksBgfZ03LLU0kETPg5/kyRHCb9bz6/yXv+kON1U6aJT3K2qtI3w
         v23OF1CrCaHMz5HRSn6G+fHtC4YwUQYkiF4yTFU/FiscbjB59ujp1ZForkJ+6hChoyFU
         QKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=dGGW+Si8tfNYD6/BfzzHME7/stO4K1E+ZfJZEWLpVBc=;
        b=R2xPVJZxXVogOkXIIvVlGmkSga3SUM8katQAEHrRaJEcdQR6ssKQ45cJcKNeiyoU8B
         aFC4V4kSBLxh3ZqotBMgf+UXob1znYl0jLYTfyCCiPeNGc5IorJCOiuE2TL45G43MwF+
         j7+n0LX1/ayDHYTZbwcNLlJBsbVMOAvwepKSMd5BIODUrD+tMZUbk7THmzJLPpqfNk3x
         dkkYg0j9ICVX6P+REua7AM428r52SJZA74fz+cnJwSVH6ruihRXmKJ5qM2wJUwZfI6v4
         Pp/2+Z6y0MiSGKHu9rYdKneDIkNx0JoNJBJZV2F7mIMBB79t7lvKsSa/UyYpod63nk39
         lyuA==
X-Gm-Message-State: AOAM532RwlbDEkkPygEwzxhl+0wlc+bKdUXZni316sU4N9K9ulTLfnYi
        VZIcUcNZi8H+Pn55xknA67kA/oE43yBwiQ==
X-Google-Smtp-Source: ABdhPJxyXIA8IniyVC8oRD8j/I+4Z+Jjgtqnpy2UE74PYzW4GUU4Ivi3dBCE09BGNrxdXiAJ08AF6g==
X-Received: by 2002:a7b:c085:: with SMTP id r5mr2482341wmh.97.1644410360844;
        Wed, 09 Feb 2022 04:39:20 -0800 (PST)
Received: from [192.168.1.6] (hst-221-22.medicom.bg. [84.238.221.22])
        by smtp.googlemail.com with ESMTPSA id j13sm15590852wrw.116.2022.02.09.04.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 04:39:20 -0800 (PST)
Message-ID: <34845dc1-b20f-645c-6442-780207c7b9b2@linaro.org>
Date:   Wed, 9 Feb 2022 14:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: VP9 SVC Feedback data in V4L2 encoders
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Daniel Almeida <daniel.almeida@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>
References: <0265202a22507d0c8dccc9d3985c2b8ec0b266ec.camel@ndufresne.ca>
Content-Language: en-US
In-Reply-To: <0265202a22507d0c8dccc9d3985c2b8ec0b266ec.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 2/4/22 22:17, Nicolas Dufresne wrote:
> Hi Stanimir,
> 
> I know you were looking for some ways to pass back data post encoding per frame
> in V4L2 a while ago, but I think I lost track. I *think* you were looking for a
> way to pass back HDR10+ metadata from the decoder. I'm currently trying design a

The size of HDR10plus metadata (taken from ffmpeg, ATSC 2094-40) is
~12KB.  The other encoder metadata which I want also to have is encoder
ROI which depends on the encoding resolution and my calculations shows
up that for 8k resolution I need metadata buffer of 272KB (h264) and
68KB for hevc. With the numbers above I want to say that we need some
scalable solution for input/output metadata. V4L2 controls are not such
solution. My experiments with passing through v4l2 compound control raw
data (16/32KB) shows that the copy to/from userspace is interrupted many
times which impacts badly performance on higher framerates (>= 460 fps).

> a way to pass back SVC encoded frame info (layer(s)_id and references). This itis
> somewhat similar, for each frames being encoded I need some information from the
> encoder, so I can pass it back to the RTP payloader. This issue was fixed in
> AV1, but VP9 is still pretty important.
> 
> On my side, I was thinking that a driver could stack the data per encoded buffer
> internally, and update a control state at DQBUF(capture) time. This should not
> be racy, as the next update will stay pending till the next DQBUF, but I'm
> worried of the overhead and maybe complexity.

What is the size of the data you want to pass from kernel to userspace?

Even that it is not racy on 60fps, on becoming actual 460fps and beyond
it will be. That's why I think v4l2 controls is not an option for the
near future.  The only clean option (not adding additional complexities
in client for synchronization data <-> metadata is to have a metadata
buffer attached to data buffer. The other option is a separate video
node for metadata but I'm not happy with this - this complicates driver
and client implementations. And the third option is to change request
API and v4l2 controls framework to deal with dmabuf instead of copy
to/from user.

> 
> your feedback would be welcome,
> Nicolas

-- 
regards,
Stan
