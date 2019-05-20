Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF29232C8
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 13:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733282AbfETLjB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 07:39:01 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32955 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbfETLjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 07:39:00 -0400
Received: by mail-wr1-f67.google.com with SMTP id d9so1246115wrx.0
        for <linux-media@vger.kernel.org>; Mon, 20 May 2019 04:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=//ZD23GlUg0Rjx9kaggXyZtUpXWU1ALeFH1wLQZKmk0=;
        b=dYH9cYybET2urMILgdKSoxQcLSBWo8B5v28wSCrEBTTKiUUD4az7j3yjGnaCGmaFPA
         vFvqoiV1KkwWAmh9+KSh9Xx/FCl1+nZcMWtConLmzsHWvL+C/kZkaiOFzq3qznFe4zv1
         6un/r8vZPqP5NjoNlm05SIAgQoLFnunm8RziI4Xa6Rl3Xsp/QEVNQXSKkfbQLrZVGM28
         Wc16Ep6c/H3jEP/HKhIjmjp0gLTAz8t+gEYVaC0kZhO6hBFXMyC2HffxgJQ9XVqII5Ty
         abY6C77YLgxWwx4Wzx3kNYnJOTt41pzEAMCCwvwUCMP7tHHr5QbK/zjltpJd+rdfTlsD
         0vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=//ZD23GlUg0Rjx9kaggXyZtUpXWU1ALeFH1wLQZKmk0=;
        b=KTaAtXX0wJH6YIFLfXuYbjGRypVfCHTzqG9bvovYDJEf4qT1Hn8zGlUBQGdGpiDSEj
         NKCXvgyOrlbZW98pKlaxPdh4CHNBd5gdcgQ0dkGKxpF7dwt9qbsYp5tLQOvGW9D2RqXS
         /yfWapXFVPKwaQMhHUhKxejZUOcqrRTQOoZgYdl4qFZnd43zgCEJlxcaJDg/mG4CUuJI
         kAfkIrJY7Dxrzu4Yu8GC+AYMDKvE63Ol3sdKwfUhREPE27gQpMnDNl3RhpctrK/8VaT2
         oMhFswSpvMSYcD73qDpGULnJAX5nXWB+JR0i/J9sUJ2GtIjuE20PB8jPRa99ZYZQ8w9w
         7jyw==
X-Gm-Message-State: APjAAAXbsgdmj9ZuBmVk1m+ROnBrbMJqtvSobcKO0+DNv1GDDqs56Ff/
        1yIGKcsZHvVD5vy6fxQ8PLc=
X-Google-Smtp-Source: APXvYqw5QnmOM4cfYsPamwlaWlURmkvSiofI1qTGdKmW3afeOmg8KkuE7wXIdf7TDKytTADBX3eQEA==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr150013wru.183.1558352338841;
        Mon, 20 May 2019 04:38:58 -0700 (PDT)
Received: from drswgregorj02.drs.expertcity.com (ent-nat1.drs.expertcity.com. [78.108.113.1])
        by smtp.gmail.com with ESMTPSA id y1sm15064315wma.14.2019.05.20.04.38.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 04:38:57 -0700 (PDT)
Subject: Re: Bug#929262: libv4l-dev: pac207 cam(s) give frame decode errors
To:     folkert@vanheusden.com, 929262@bugs.debian.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <155834073601.757.12828508994068038463.reportbug@scrollert>
From:   Gregor Jasny <gjasny@googlemail.com>
Message-ID: <c2d8869f-4ca5-7f70-1c0e-44d4c1e094f4@googlemail.com>
Date:   Mon, 20 May 2019 13:38:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155834073601.757.12828508994068038463.reportbug@scrollert>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 20.05.19 10:25, folkert@vanheusden.com wrote:
> Trying to get a pac207 camera to work with constatus.
> 
> 2019-05-20 10:22:34.864900  INFO constatus [1-1] source v4l2 thread started
> libv4l2: error got 4 consecutive frame decode errors, last error: v4l-convert: error unknown pac207 row header: 0x0000
> 2019-05-20 10:22:35.597949 ERROR cs:src_v4l2 [1-1] VIDIOC_DQBUF failed: Input/output error
> ioctl(VIDIOC_QBUF) failed
> errno: 22 (Invalid argument)
> 
> To verify that it is not a constatus-problem I also tried a raspberry-pi camera via its video4linux-interface and that works fine.

According to the Linux Kernel Maintainers file the device driver is 
maintained by Hans, which I CC'ed on this bug report:

GSPCA PAC207 SONIXB SUBDRIVER
M:	Hans Verkuil <hverkuil@xs4all.nl>
L:	linux-media@vger.kernel.org
T:	git git://linuxtv.org/media_tree.git
S:	Odd Fixes
F:	drivers/media/usb/gspca/pac207.c

Did your camera ever work on another Kernel, CPU architecture, or 
v4l-utils version? Do you have anything suspicious in dmesg output?

Thanks,
Gregor
