Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A82E430175
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 11:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243895AbhJPJWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Oct 2021 05:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235334AbhJPJWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Oct 2021 05:22:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E9AC061570
        for <linux-media@vger.kernel.org>; Sat, 16 Oct 2021 02:20:07 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g39so128935wmp.3
        for <linux-media@vger.kernel.org>; Sat, 16 Oct 2021 02:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aNno/DqrTXbZiTtc394XWKux0CU2qyE9rsTODh6ZCso=;
        b=iq97vqOMS0O5ksTO6nMVVej3hiX1e1d+//VWY4cdXOUzLgQOEyiaWL6t6ysaNzxbCb
         vuKEpUXlLowgElcOFDQyzE/sbbp97qvSuIRqxIj2oXhTWhdSOzwrSca1kxvspiDFLEGW
         Wez8J5fnCnJmoR4Eev7Jrsp2vt5yuQnNOCI5AP5sOk+mxbIOdMNdvsT2u1uh8xYBwqz1
         dFEIGD5X1BQ/cpsaydfCgk12S34lnYPIZUD6zLDTE6yCJtE4jU9MVMSN4wA7DjY2EZyh
         mmZWXF8u4bVVNmiyekSLGZeArWvMimV+zwTjRho1QjqctZ9RBHNs/8H2on75vIC9lxrT
         SrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aNno/DqrTXbZiTtc394XWKux0CU2qyE9rsTODh6ZCso=;
        b=M+ycQYyYHVgG6bljGyqKU/qD7EbjnG4bomgQq2ZXvOFr7VPyY2/XDk7J5jS6Ap7YPH
         SPzXy+rrpSo210KrlmA77Ht+chEJNUhjxDR4q1gDz1gC3jBhrk4Yttf3klkcemxn/ZZw
         OFvBDk3MFNF5oGuYcdXVThZCaOsi5ge2atIq87pLsxsn0xeXEzS8vUXCZKEG43Uw4EVG
         pb2eQ13vXX0pehWMYr64tHX/TXfGCb9X+VBdVqyjbTjRifFgFrTeQRRWTB9sVu4qR7Ij
         WIYQCe64KCZwKTf3tA157w3MoalPJsU9ZqVcgws/UNfVkGqIFNcQIyBJhN0tmJBTkT0V
         yWqQ==
X-Gm-Message-State: AOAM530OhH9RmqcLi0pSj7GOuONhNWpgJUldEqswVvtbzWb58svxSrnf
        S6BDY0TxfeyL3kQ+CRrimBY=
X-Google-Smtp-Source: ABdhPJyyvu0g612c5nKs0WGYf9fbxHygUiBQIUhgppaE3fYf1jhLb2LxLjQC4eM5YBjDwnj+KXyjuw==
X-Received: by 2002:a05:600c:4f53:: with SMTP id m19mr17815997wmq.118.1634376006472;
        Sat, 16 Oct 2021 02:20:06 -0700 (PDT)
Received: from [192.168.0.54] (ip5f5a5f0e.dynamic.kabel-deutschland.de. [95.90.95.14])
        by smtp.gmail.com with ESMTPSA id l13sm6976938wrn.79.2021.10.16.02.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Oct 2021 02:20:05 -0700 (PDT)
Message-ID: <80177e04-defb-89d8-1c14-ac86a550a1f1@googlemail.com>
Date:   Sat, 16 Oct 2021 11:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: v4l-utils: time for a new release?
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <379a9c95-c42e-0bf9-83b7-b62c9acfd598@xs4all.nl>
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <379a9c95-c42e-0bf9-83b7-b62c9acfd598@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 13.10.21 12:58, Hans Verkuil wrote:
> Hi Gregor,
> 
> I think it is a good idea if you can make a new release of v4l-utils. It's a long time since the last one.
> 
> Do you have time to do that?

Yesterday I released 1.22.0 but when updating the Debian package I 
noticed the -fvisibility=hidden flags are gone.

In this old build log you could see them in action:
https://buildd.debian.org/status/fetch.php?pkg=v4l-utils&arch=amd64&ver=1.20.0-4&stamp=1615811474&raw=0

I suspect something in the autoconf / automake setup changed. I miss the 
"checking for simple visibility declarations... yes" line in the current 
configure output.

Unfortunately I'll be traveling for the next few days and won't be able 
to work on a fix.

On the linuxtv host I moved the v4l-utils-1.22.0.tar.bz2* files into the 
"broken" subfolder.

Thanks,
Gregor
