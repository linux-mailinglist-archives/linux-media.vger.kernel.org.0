Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4428E309529
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 13:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbhA3Mpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jan 2021 07:45:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhA3Mpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jan 2021 07:45:45 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA894C061573
        for <linux-media@vger.kernel.org>; Sat, 30 Jan 2021 04:45:04 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id e15so8759329qte.9
        for <linux-media@vger.kernel.org>; Sat, 30 Jan 2021 04:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RXwWSoTjin/rivCZEFNW3zkm4/6/77xIUd9NLbXJWYo=;
        b=FsX6s7qDoTgqywowt4OScYk3lfhtZ/fGsN8vmwhtbVMa5yBF/XgOfgCNqc+H2IBz4O
         BOAnzjesuEK2I0VxpX0nAqQVVPS2nmippOZoAv+3iYORP/2747NkJEACuQ8rG4bG4vbZ
         Mb/XFQW6Yy3/zUR8V8RubXXcT9eUHi4yJrRYQLkE0MBHqYxBGXNL5SpibGBtLzBcRaeG
         yC7bGpIRnSJUvNj79AwQLw8AEZk8dYZ5RoHzxH9OcOGDDY6Zog3lmBesn3Ak9jGnI9PP
         eXI1dqM9zqyQ2wEsD5a7PhpMagc3W00aXVSAMLPlWkqLy/RJU8F7DgtHiHcw01JXQnW8
         Lcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RXwWSoTjin/rivCZEFNW3zkm4/6/77xIUd9NLbXJWYo=;
        b=klsIUGRqoNZdTECUOONJ7bxUjqJ+kOhZpbAHA67jTLXhfxEDM9exWSADxJswEPd2Cf
         1Po/CRYOfoP/g9hgtTeSqMwBYNqh3YN/ufkTM2g231TrEsNmxBTnziH2Wkk3TxzBNTKN
         O/SVI1OBFGICtTNTjpMmTNXrff5DllHDXG8JxrqFVYmLopkntCPB08iDswLdOZZ1sWFc
         2pgRcJcDWDF5t2sbdlAFBYtysNUJXR0AmaVDReA0N3t9o09sSsLPGlFWCkueD2bj3WIj
         6UmDQ+G3K1q4/G2tKGxHiNZJoOgdtnQyUiawbd9Go3p59VZ9Skb1TWVm/lsB/ISvoLHg
         1Q9Q==
X-Gm-Message-State: AOAM531mj4Kjj15GkkKZqN19MQ7iP74UeGG5XRPgprbXEu10/s02beSk
        XssAjtCa4+s6A1Ubf5hthXHyPufGG6xnTw==
X-Google-Smtp-Source: ABdhPJwz2erxFRDcaNzeLiDvh5Q3CpUFUsYYfTWlUGyBj8dFlG4MgXFm0j3vVOWfj6VPE5HrfuRJoQ==
X-Received: by 2002:ac8:6607:: with SMTP id c7mr1595664qtp.341.1612010703790;
        Sat, 30 Jan 2021 04:45:03 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:9d72:75bc:e42b:f19e? ([2804:14d:72b1:8920:9d72:75bc:e42b:f19e])
        by smtp.gmail.com with ESMTPSA id a203sm8651511qkb.31.2021.01.30.04.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 04:45:03 -0800 (PST)
Subject: Re: [RFC PATCH resend] vidtv: adapter->mdev was set too late
To:     Hans Verkuil <hverkuil@xs4all.nl>
References: <cfe1c825-bb11-ce78-be60-fedb69ef416f@xs4all.nl>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org
From:   Daniel Almeida <dwlsalmeida@gmail.com>
Message-ID: <69d47520-a2ed-0451-0d66-6192b0b7bc5a@gmail.com>
Date:   Sat, 30 Jan 2021 09:44:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cfe1c825-bb11-ce78-be60-fedb69ef416f@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans (sending this again since it also did not make it to the ML..)

 > (resend again, looks like the previous two attempts never reached the ML)
 >
 > Daniel, how did you test the media controller feature? I don't really
 > understand how your merged patch for MC support could ever work. It's
 > the reason I've marked my patch as an RFC since I wonder if something
 > accidentally got messed up along the way.
 >
 > Regards,
 >
 > 	Hans

I still have much to learn on the subsystem.. what I did to test it was 
trying out this command:
media-ctl -d platform:vidtv -p
Media controller API version 5.11.0

Media device information
------------------------
driver          vidtv
model           vidtv
serial
bus info        platform:vidtv
hw revision     0x0
driver version  5.11.0


I was under the impression that this was enough to show everything was 
in order with the patch.

-- Daniel


