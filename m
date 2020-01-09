Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4965E136406
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 00:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbgAIXvC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 18:51:02 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:33359 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729158AbgAIXvC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 18:51:02 -0500
Received: by mail-io1-f67.google.com with SMTP id z8so108223ioh.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2020 15:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XmSLE2UFRfRMrqOUD2/xcSkD1bd36np80kHR612bvjA=;
        b=Tb+WHFX8eVVfPBC61iOxKAVASqGYU9JQWNVjQrlKLC+NAZ0qiXroclVl84ojhXiFVq
         z0D/fXSrR06QaET9gf62ySqcq2NGTVRTlyzYZ+Kwhb1CbYyYmIAoczVX8P/rIOhtSSe+
         9Vp8kh/Kw1Ujt3pz8MG6SMP+kwtFqpkD9LlLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XmSLE2UFRfRMrqOUD2/xcSkD1bd36np80kHR612bvjA=;
        b=Qb5WQb3W/d8d4ay8TUQx/gglxqgE6QqAEsurOB+vNDA00cDryPSCqV29JKRgpyF2xQ
         yD5oyHCKrg1aIvjXLMdQfiVPjb1Of9X1XiSwi8XLIPZv7WhcgkcGBJSwhugvgAcnhYyi
         3kVLivPpFxg6lFEVO0dok8EkPXEAgxv+W5zihNwl/zNR+GKKxYak3I4Uw87eZpdBYQ7d
         3l8SMVtArQtVL5s0SsHoDS2BNAGaFtUUeWstLIo4Q3ySVbBSogNnlcgzJ2BW2XeYkf/1
         mOv5KUw5VCATsFOcqCUrz5GFyHB+0iLKHqF8SYsbxI64jCWx46eQpEj7JXrV5EnXLD5l
         U0yg==
X-Gm-Message-State: APjAAAXHmy6VLi5BX3Vt18oniZYglROJpiZ1EusaJBbW0YYxq6+hIpsg
        AkQKkpwCAnZo1IupiEOsE/u7zw==
X-Google-Smtp-Source: APXvYqwQgkVIojpGrUKkXmQA4w8X/Zv+cpiI22CrfDWtEkvUmq5+SH0J8qNsc8FDqyGlkG6ReZ13cQ==
X-Received: by 2002:a6b:7117:: with SMTP id q23mr62004iog.153.1578613861421;
        Thu, 09 Jan 2020 15:51:01 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id u10sm130038ilq.1.2020.01.09.15.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 15:51:00 -0800 (PST)
Subject: Re: [PATCH v2] media: dvb_dummy_tuner: implement driver skeleton
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org,
        sean@mess.org, tglx@linutronix.de, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200109233757.734008-1-dwlsalmeida@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <74d3acbc-fa3c-7d5b-4132-42c47909c4b9@linuxfoundation.org>
Date:   Thu, 9 Jan 2020 16:50:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109233757.734008-1-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/9/20 4:37 PM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 

> Implement a dummy DVB tuner as part of ongoing work
> on a virtual DVB test driver under the 2020 Spring Linux
> Kernel Mentorship Program.
> 

Get rid of the above. Not relevant for the patch. No need to spin
v3 just for this change and you can make the with other changes
as you get comments from others.

> The virtual DVB test driver serves as a reference DVB driver and helps
> validate the existing APIs in the media subsystem. It can also aid developers
>   working on userspace applications.
> 
> This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> ISDB-T and ATSC when completed.
> 
> For now, only a basic skeleton is available, most functions do nothing
> whatsoever.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

thanks,
-- Shuah

