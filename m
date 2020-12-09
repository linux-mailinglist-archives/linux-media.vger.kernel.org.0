Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFDA2D4E8C
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 00:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731849AbgLIXL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 18:11:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731795AbgLIXLW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 18:11:22 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0293C0613CF
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 15:10:41 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id c7so3456638edv.6
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 15:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=cSrrORNtcL4KjECI4Z2rdHmVfMLKTa9OaAEeZ/rb+zc=;
        b=B2Oarn0dLbCp7O8xushjh4uZOg7VX/+GguIvitF5tBa9GUKPoXIwHdOlswbh0p9D+C
         SriJqXnUsvfZ1sLDgal+M1IoXQL0klPkb2Ze3SwXfUdnXLZAv9UqRJYv712vEGOu9Yzr
         C9y9P3mIHyiuoRme0I/D8P3+vDcndSc21V5B4Tc8MtnKMFs/4V43Q7Pyu0AKh5TremZe
         Eg3wlzUx3/8lUXcDaEi06/YiuyuF/h/7JXtGdXBJyXOxdczNutf98SXpmSkNCEL+RsnA
         27RSFAUnKzd7rUlCfQT/1wVTzQhr79LOVEQ6tiZv9hcBUa0oiDBDOXmXWVVQS/R4972t
         Xf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=cSrrORNtcL4KjECI4Z2rdHmVfMLKTa9OaAEeZ/rb+zc=;
        b=kOzxOVhm/fABMm1iQgi7iQje6yLfIl0UdlXmlntj8N/U0aYND5deO8ViDIoDRx1ZO3
         dFp5WfzxL7Kg6MCIdvVc6p/O7gg5ZOpORauYKTx/xiiGUWIf7J+RePHdR4ra+35S+D87
         0TDnMtxpFtGcc07UMjbRZ1sJjBVuMCS05qTosKu/daGJdbkpt9/lf51FguFzL8tHC4+O
         rmZMRBhKyrukyiGQgEG35JuqT+7oaYPGXuY6ai1EULH1xzA2dyDf+ZEHivZBERc2sKJY
         T3jGQ/t35lXW5gnzo3yjgwVrqi3zYhpgiUWaMSy3+8kO9zFqYM44ObNL1VpBkxcKyGLr
         qEuw==
X-Gm-Message-State: AOAM5339V1UFqAXzie1slaqNGEhNY7PLkMNG7tbTWrh7aWbgZWIvlxo5
        7VerlX9Yp0uwAjG7b7C4Y0afXXmse50dXVbh
X-Google-Smtp-Source: ABdhPJzdaKXD7oQt7Rx64Fb0yEyoOa4squhN87Yz08+iUos8ZeNRSa6pb5phLHnalBPyQUInRbRDXQ==
X-Received: by 2002:aa7:d784:: with SMTP id s4mr4121860edq.215.1607555440339;
        Wed, 09 Dec 2020 15:10:40 -0800 (PST)
Received: from [192.168.1.9] (hst-221-61.medicom.bg. [84.238.221.61])
        by smtp.googlemail.com with ESMTPSA id qn4sm2786472ejb.50.2020.12.09.15.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 15:10:39 -0800 (PST)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: HEIC encoder/decoder
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Message-ID: <5c5cd205-5c7f-1450-1f84-7d0e573dc90f@linaro.org>
Date:   Thu, 10 Dec 2020 01:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I have to implement HEIC image encoder (and later decoder) in Venus
driver and I wonder how to distinguish image vs video encoding using
HEVC and possibly AVC codecs.

I could imagine those two options:

* introduce a new compressed format V4L2_PIX_FMT_HEVC_IMAGE and reuse
video encoder as of now, or

* make a separate video node which supports HEVC with profiles Main
Still Picture and Main 10 Still picture only. The problem here is that
AVC doesn't provide profiles for still pictures, and in this case the
driver cannot distinguish what the client wants video or image
encoding/decoding.

It is a bit more complicated but I'd like to receive comments / ideas at
what would be the best way.

-- 
regards,
Stan

[1] https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
[2] https://source.android.com/devices/camera/heif
