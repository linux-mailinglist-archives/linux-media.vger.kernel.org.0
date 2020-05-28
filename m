Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723241E6DD4
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 23:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436624AbgE1Vjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 17:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436581AbgE1Vjv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 17:39:51 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D393C08C5C6
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 14:39:51 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x202so158463oix.11
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 14:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OfpLvfnX8lVDByHQBLU++09A6lqwgIjSdFJ0GhgD8hk=;
        b=hIVO7OwdAzZtChKnv8phSDuayJ+63ecs/81LzyUetJxvJGcNQl0EKlode3KULfZYA0
         WbFCk1e0mN5ekoaToQEaKxEZGUTfEMc2KOLVZVyXU8zETrxdHowGewLMsHqjyA90DtP5
         g16TOAaa0Kr64Dyept/QTpXdV0rmAAYO+aw9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OfpLvfnX8lVDByHQBLU++09A6lqwgIjSdFJ0GhgD8hk=;
        b=k/H0K3bmQrGq46WhdhkrroaxOslZU94YpPM244OCqyeJcYnBb95xzygYwHH0NtJNBu
         EjbX5xywh6H0nMR7ysni/aqavT3j8stlQ3ZS4IU/A39D0p1d8iTqt/u2eKhURe4Xh/rV
         UPG+j1QYRiF3zaYWUZBXa53Fy2bDGURemO7i54oYw1HheFnMQEF/uxiyHRtbj01vIWvd
         KzWML+25ufz3heSsKNyPBK9StavvWs1/lkDDTWi8hcoaG7bhJbK56kBEuoWhDx3/qP6z
         ZlbQT0+lsEVbF7FBc+fA9+ybb0uTrSWNR9CsmzJeMB7RetBONEI2XTdI7DylP9hHkzw5
         bVKw==
X-Gm-Message-State: AOAM533DPRXWwHOoGq/fa5ESAaiH/G0rcZTfqTGRMxftOYpGOVbXOLW1
        dX6b3e0gchXVp214hoxwcO8iHg==
X-Google-Smtp-Source: ABdhPJx1Ja1TbtJq4hRHGE828SF8s6kg5n3Pc0HsFwOSf1AlxMilKtg9NShPCTujKWJmEAj2a/LTkg==
X-Received: by 2002:aca:53ca:: with SMTP id h193mr3676158oib.12.1590701990596;
        Thu, 28 May 2020 14:39:50 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id g10sm1251573otn.34.2020.05.28.14.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 14:39:49 -0700 (PDT)
Subject: Re: [RFC, WIP, v6 00/10] media: vidtv: implement a virtual DVB driver
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4df08eaa-7a96-c769-d3ef-9cf4bae77454@linuxfoundation.org>
Date:   Thu, 28 May 2020 15:39:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/20/20 1:03 AM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> This series is work in progress. It represents the current work done on a
> virtual DVB driver for the Linux media subsystem. I am new to the media
> subsystem and to kernel development in general.
> 
> This driver aims to:
> 	- Serve as template for new DVB driver writers
> 	- Help userspace application writers in general
> 	- Push fake audio/video to userspace for testing
> 		purposes
> 	- Push debug information to userspace via debugfs
> 
> This should currently be able to feed PSI and PCM audio data to
> userspace.
> 
> I appreciate any feedback!
> 

Run checkpatch --strict on these. There are several warns and an error
which could improve the code as well as the improving Kconfig entry
as suggested below.

WARNING: please write a paragraph that describes the config symbol fully
#108: FILE: drivers/media/test-drivers/Kconfig:7:
+menuconfig DVB_TEST_DRIVERS

I will send review comments on individual patches.

thanks,
-- Shuah
