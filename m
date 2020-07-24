Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AAA22D257
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 01:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgGXXn6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 19:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgGXXn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 19:43:58 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35F0C0619E4
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 16:43:57 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id y18so159983ilp.10
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 16:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1fir2Ti2vt4whQ7PfuONH4brXyBlFuZOiejdcjiZKP0=;
        b=TPrVIO1v++AChz4Bqi+RZcJGPZjnLyuwOFy5wr7UXmIl6+8cixWsmtRvpbClRNRyqF
         /dD3PyhMQemSRiMGdb7vCZRr7PkkVFypzKaDJ7lNgKmQOTQGEBpKDup9+nrpekm9AosR
         8c0ZmZg02o/3hhCf8AGCaWXK42gF/2hqYczHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1fir2Ti2vt4whQ7PfuONH4brXyBlFuZOiejdcjiZKP0=;
        b=VlJE56Xc+TN26tAXOESO0i0GoKCyPRCrmDKWQ/FSShcUy+kH13E3HeZlrlFpFEGGLL
         VB+JwwBZDNYOPp9mN929S/kiWSXHQOpf6MvkxgFiko7tMrPFgOg/iIg2I/dSeiGmVv9w
         qHTH8nWLcRpuOtrlxRi2Qq85OJ7QEpxt+oAwblMVNJv2j7Nl7cENa3HAqWQods4GU2bQ
         41UdKLKMdQcMisxY/ZtaPraW4x/aPxfk3JWH3gB+jP26oJcrLlP8c/bbE9XxCDYIIYwv
         QlvRkq15TjmawflmoKrqJaRhmmQNH/rAQPLzvZax77X0r5uIO1ncAeIpegBHXFQGdfxm
         Y5sA==
X-Gm-Message-State: AOAM533uU7NmADblivrA7hQt4/YfjFz7KwbpiMgCq0sZ2xE+jprmnSt+
        lo7E6MY3hcVAqMJlfzrgtXxSpg==
X-Google-Smtp-Source: ABdhPJwjWL78P+pBkbmROVcLBBLCbM5S7VGXisEEDMSKQJdGuhaMmSnHQaEqYio2dRLZciYoWMe4PA==
X-Received: by 2002:a05:6e02:e89:: with SMTP id t9mr9076460ilj.292.1595634236821;
        Fri, 24 Jul 2020 16:43:56 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l17sm3924984ilm.70.2020.07.24.16.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 16:43:56 -0700 (PDT)
Subject: Re: [RFC, WIP, v7 0/4] media: vidtv: implement a virtual DVB driver
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200608191333.1784963-1-dwlsalmeida@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1cd01ac5-55f7-68f5-791b-ae4955d916d7@linuxfoundation.org>
Date:   Fri, 24 Jul 2020 17:43:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200608191333.1784963-1-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 6/8/20 1:13 PM, Daniel W. S. Almeida wrote:
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
> The Virtual Digital TV Driver (vidtv)

Any feedback on this patch series for Daniel. He has been waiting for
reviews and feedback from media developers for a while now.

Please review the patches and give him feedback and help him with
next steps.

thanks,
-- Shuah
