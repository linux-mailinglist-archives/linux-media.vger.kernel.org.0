Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A38B373025
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 21:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbhEDTBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 15:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhEDTBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 15:01:18 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30CAC061574;
        Tue,  4 May 2021 12:00:21 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id w4so3819385ljw.9;
        Tue, 04 May 2021 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=z3UaSIP+6pHt6XPbkKJ5mwpLRpOXZMGzxlv2KRAxxrE=;
        b=me7Ahcc+ehybS1y7HX/8X9kTysUCgNA3nQuWu5CfAx5+qwSOonM7jNoxuGUaM02X1S
         EqbZkcmqo8lyE1scP9V0rAuNmQaYY0VH71ApzR6WjxZ/DF4baMP4fPJCAUxECnyGstXA
         c/Df1rLfjg6GIGpgvJ5JMKkwIlv/z4ifgAcSksdk95uo6TClM1CZEMSbuOEVuBF9X0sK
         9gjcjRASSiRA9ZFItAy9rS+OGDZHEgm6LLqJRC0siW0j9uE5a/VrxjeMw69TTmn7APcF
         v8ueYwn2gGRkxc4hkeJuqlcEgLyd1tq3gh/2l5iEetHR35tXTHvSFLZvVfIb7QB952a9
         m6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z3UaSIP+6pHt6XPbkKJ5mwpLRpOXZMGzxlv2KRAxxrE=;
        b=ERHG9pIfuf8UUA2HM4NQfiN9tEtn5wubGJuQ3KQej1NmzK+Mre5wXUZDZristR+N5X
         UrTbGuUukVgcJ2nKlV7uY4m30R2yoOMXBuqBBN4sVmOIbrb6TRyxiHrDMiqrgr3H1RYX
         5g0Ea7uc8JFKJir1k9fPY0D835kd24CWSQEgdxhshROUiGoD8fexZf7DJM/0uzrZaAWt
         S/5KuwDJ+PyTi+dlTtBXPP3tqokBR6RIkBEjVPlqY3OMGDZyHb4K+/sy5NTU+FNx7DrI
         Q/RhUl87VRfPt1iK11XlCetBva0zt58P+vNH/L83FnNPwtEP6zXdQNLzt8Tu9R6FqrFu
         li9w==
X-Gm-Message-State: AOAM533nlbmwXhnneQwnePtVMGFAVRsS+uysgccM/ClGTUj07SMLSFP3
        nKRHf7tgvgQyZZVzb6724kjfNpwnhPI=
X-Google-Smtp-Source: ABdhPJzMvkbPlViYc6C9hwjlgua6ImTE8/P6NK191PPkSs4aWBEe+cMLZ5c04/RgfjP4c7QN/PBb2w==
X-Received: by 2002:a2e:a606:: with SMTP id v6mr19020894ljp.289.1620154820257;
        Tue, 04 May 2021 12:00:20 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.77.191])
        by smtp.gmail.com with ESMTPSA id j16sm333016lfe.152.2021.05.04.12.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 12:00:19 -0700 (PDT)
Subject: Re: [PATCH 3/3] USB: serial: blacklist USB-UIRT when driver is
 selected
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
References: <cover.1620149665.git.sean@mess.org>
 <6df6e3c02c7f736e99799fca757056608ccaf6c0.1620149665.git.sean@mess.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <c8b4a545-a33f-6f7c-0c51-e6cca8fbb8d5@gmail.com>
Date:   Tue, 4 May 2021 22:00:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6df6e3c02c7f736e99799fca757056608ccaf6c0.1620149665.git.sean@mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/4/21 8:52 PM, Sean Young wrote:

> The USB-UIRT device has its own driver, so blacklist the fdti driver

   It's ftdi, right?

> from using it if the driver has been enabled.
> 
> Signed-off-by: Sean Young <sean@mess.org>
[...]

MBR, Sergei
