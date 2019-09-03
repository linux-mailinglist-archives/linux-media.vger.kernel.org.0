Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB4CA690F
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 14:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfICMzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 08:55:24 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43888 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbfICMzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 08:55:24 -0400
Received: by mail-io1-f65.google.com with SMTP id u185so31767766iod.10
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xXXfF+BP1pkxaEeIfd5tf34OTBwH4aM/p3a2bJwD1PU=;
        b=igogQoDeX2H+I4Woipqlu0Qo9ejku4LeQgwB2Fp4c8tdVqy3RSap5LygcJRUx5UWBn
         4LoTLyH+qgQbxzisvs6hcrY21zb4+DzPRDpto2utwGtgRhLhMKtEiHkPpGsZyY1AtKaJ
         IRKXXdU75uefAXRP3m6lBAZjBAuGvTr9jl1zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xXXfF+BP1pkxaEeIfd5tf34OTBwH4aM/p3a2bJwD1PU=;
        b=AmhsqjjBxHXR41SuSeoa1ZyJ2VI208BHieG7p7G7etf7Ep6aYKpylGomPLMHK96oQ6
         Utk7dDWQXEZ0sbA314ZjWGL3bGXB6Ut4uEjOjRHiQRvoJiXGD4gGqTBsKHhZbWjoKWvG
         U6iNam4ojmxMKeKuoV3xsiqa1M8PRUv/cHKyJ8tvLAyl+qrJHwAv0a0LoIcjnX2piu2Y
         JtWxOWb9nUV/YAc7JwmMnat+B8b7D028L64VHfMIBEh+AzBfBD12NpsyJPIiqgiYjTwx
         eMCKhcj172b+tDhvkdpFOakFmXDN+dmWaBeFcIBYVg67G6xC7M51ykK0JNsIMgDrVbM3
         aX/g==
X-Gm-Message-State: APjAAAW9M292Y+ZLeMcjVfTzujFrWTQopbcKDnveyyIvQ79NIQfB88GS
        sFIqHTjyRXk9kgcqzsNYahMkzw==
X-Google-Smtp-Source: APXvYqxKaHcRm1F7gecWXyZPOBIQoF9Xm+B7IHtHtX+R40LM33bnpLjO1tceNHeXj9qaludehv/n5g==
X-Received: by 2002:a5d:8d12:: with SMTP id p18mr8329383ioj.251.1567515323453;
        Tue, 03 Sep 2019 05:55:23 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f7sm2873566ioc.31.2019.09.03.05.55.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 05:55:22 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] media: vimc: Collapse component structure into a
 single monolithic driver
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, andrealmeid@collabora.com,
        dafna3 <dafna3@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1566334362.git.skhan@linuxfoundation.org>
 <a7b877c08d0885fe7e8bffc9b24ef0a2d6236147.1566334363.git.skhan@linuxfoundation.org>
 <09c3ddad7122efb23201dff6e11aaf7455c748ea.camel@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <76c8489f-4c6f-27df-ce28-a7ce3e8b3843@linuxfoundation.org>
Date:   Tue, 3 Sep 2019 06:55:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <09c3ddad7122efb23201dff6e11aaf7455c748ea.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/3/19 6:50 AM, Dafna Hirschfeld wrote:
> Hi,
> Thank you for working on the patchset.
> 
> Since there is only one module now, the section in the vimc Documentation
> regarding module params should be changed:
> 
> In the file Documentation/media/v4l-drivers/vimc.rst
> The following text should be removed:
> 
> ```
> You should pass
> those arguments to each subdevice, not to the vimc module. For example::
> 
>          vimc_subdevice.param=value
> ```
> 
> (no inline comments)
> 

Thanks Dafna. Yes Documentation needs updates for other reasons and
the module params is on my list as well to fix.

thanks,
-- Shuah
