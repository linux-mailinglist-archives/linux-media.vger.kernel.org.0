Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993DE1BFD97
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 16:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgD3ONm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 10:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgD3ONl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 10:13:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F81C035494;
        Thu, 30 Apr 2020 07:13:40 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id t11so1344693lfe.4;
        Thu, 30 Apr 2020 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OnNu0d4kBuNgtMDcTSpGxIZJGwHHHkKLCR/X38FoToI=;
        b=E47cdC2LjQCfk4jercI9wU26vj6Ul3VxmudH5l5SAv6doIVinVVxuJeQBKaerKo/mS
         zM2+xfjOVb6S3A6nWai/F/Yb5JRJUZzCqWuD1F+oqKHVGIOJG4dr7UCE+NKygEug54wY
         Z6+kf82RB/TtCjzaounEBhPWA689NeR6/g6rKvWxGbF8w/q/PjnaGHjf1tuVQZS3L/si
         5b6tntpaSKhoW0GYVkfNtJ6YN344tOm2WXpRq43XeaQ4XfJJhJTE7VlWYzYMX7LpohwM
         RPsBwCHcBXXy7tVqT51Xj6B4a0QZ68JFYfTb/9PrkO8ChU5bSBED3pcMAsU3heEF+fHV
         kj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OnNu0d4kBuNgtMDcTSpGxIZJGwHHHkKLCR/X38FoToI=;
        b=roi0B06KIK+PmGkECF0c4R0EoEYVlal9EYwSF+fyK+p4EKSvwXsxsov9WnrkNe7kuc
         odYhVUCuegJIInHc/+8aPLi6YEaD3dWXRVKhSp22TF214vRgIvhpAWzuYe+G9OeMUhkQ
         0SJVwSHBHh476fRhTm3xjzQeHSLfrOKBN0PB5wv14Ots8wdvFWh9Q1BbdpNxYK+9UuX7
         klXEX98WGKho2VeyJkrJjTbZAfOA77gBrp2+i/j0O+b/qu+NISyrQwecL8miNqOlNcL4
         B+8UNySu0w8lRgdeSilneT2Q0pSJK+UYTVVxseYhldCCI2zXvK5lUyTmWRy3wdGVObBF
         Bjcw==
X-Gm-Message-State: AGi0PuZrKiIarkFqpyD/9aM744O6ZI1t/4Ka+s4zH9xkmYT3Az2B23CL
        6fJZ5J9jbPy0j6boY6lkyYbcRpn2
X-Google-Smtp-Source: APiQypK7XRTZTlWVytKER1dcQ9yptU8BEQg7/anoFsos760OayR5hyrzgtTYVk8H1M7YcG3tWoKeoQ==
X-Received: by 2002:ac2:530e:: with SMTP id c14mr2387989lfh.154.1588256019126;
        Thu, 30 Apr 2020 07:13:39 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id q16sm4296014ljj.23.2020.04.30.07.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 07:13:38 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
Message-ID: <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
Date:   Thu, 30 Apr 2020 17:13:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.04.2020 17:02, Dmitry Osipenko пишет:
> 30.04.2020 16:56, Dmitry Osipenko пишет:
>> 30.04.2020 01:00, Sowjanya Komatineni пишет:
>>> +static int chan_capture_kthread_finish(void *data)
>>> +{
>>> +	struct tegra_vi_channel *chan = data;
>>> +	struct tegra_channel_buffer *buf;
>>> +
>>> +	set_freezable();
>>> +
>>> +	while (1) {
>>> +		try_to_freeze();
>>
>> I guess it won't be great to freeze in the middle of a capture process, so:
>> 		if (list_empty(&chan->done))
>> 			try_to_freeze();
> 
> And here should be some locking protection in order not race with the
> chan_capture_kthread_start because kthread_finish could freeze before
> kthread_start.

Or maybe both start / finish threads should simply be allowed to freeze
only when both capture and done lists are empty.

if (list_empty(&chan->capture) &&
    list_empty(&chan->done))
	try_to_freeze();
