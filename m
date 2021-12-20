Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E54E47AC01
	for <lists+linux-media@lfdr.de>; Mon, 20 Dec 2021 15:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235164AbhLTOkm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Dec 2021 09:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbhLTOji (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Dec 2021 09:39:38 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E555C06139B
        for <linux-media@vger.kernel.org>; Mon, 20 Dec 2021 06:39:36 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id k21so4047884lfu.0
        for <linux-media@vger.kernel.org>; Mon, 20 Dec 2021 06:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HDiDuqNW682LoVbTM9P8bs4XipqHvx5fTgwFFD0AUbo=;
        b=DEb1SFXTpflPIVSbUHj5vrLe1q1XS3kUXSbgDa2inv1xfm8yheENmz6wfrBG7KzmZL
         odxNIBpYuajZ4VPAGwuk+4rjmrznBds8n7kWNavLSxJ9BzvtEz2Rsz03Qti7GiDrTVpt
         e5trTyx4Z9GtDt6+lFxSL6mL0XwcQ9Xcw15nrgD+ipTJ7Bkds6depnjfbIX+uiUNtsPs
         wFYpigPOTbnSmJltO3vDnk20n4XAUMxsgTD8X0N9XV/gLd62hlHZ95VbQmnQe/gv5ofW
         j9TtIeUeCanJRnDSW6n+QnS2SilENIcDnG+xdP90c8+XxVCdOb4M2LXXcqlyN5c+rpgB
         LOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HDiDuqNW682LoVbTM9P8bs4XipqHvx5fTgwFFD0AUbo=;
        b=FiGruS8rjO3EXCSHA+C9arABl5LQDwVe7JFV5L9Jk1umjFmqPhlrNWWFH5HUkyDDRn
         H5VSN9Usg2DdU5urC5Ru9WRwLbxxfiutIAiAHi4Wu/iRDCXKKSwPuYp0+rKpEREQYhJP
         fQK5XnpdRN98i0oaZD8HoqBL6P2xmhapdN2nVQTM2rZM1ExzfEjKZ0eR8VKiMora+Lmj
         EgqBZs5QS18gHxk/gAi5rIBcMM9nC9hyUvHqDt5FsLvIP3yD7ExI2xdyCKT2V/acdNNv
         85pGple9VR5wrt+fKL+wkL45nCXzMpDWqiYOXCIQSAA7rXQFgIR+Ng2e53+BV13zWMs+
         QTlQ==
X-Gm-Message-State: AOAM533meQ7e2cM5oe3VgJuw4USY9hkzBtjMZ3BGzv5fAmeMQ9EEfnyz
        f6VmdGGr2bM0ZKf6qF5mTHg=
X-Google-Smtp-Source: ABdhPJy59Js09oKSpX2npQDzffYb/lctMT2Mp7zp4bSJr7yfEI2RkaVxRUb+0H+YmQosD86VJ38Rnw==
X-Received: by 2002:a05:6512:2355:: with SMTP id p21mr3709985lfu.640.1640011174924;
        Mon, 20 Dec 2021 06:39:34 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.239])
        by smtp.gmail.com with ESMTPSA id m28sm819723lfo.76.2021.12.20.06.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 06:39:34 -0800 (PST)
Message-ID: <c6dcf627-047f-8726-0c4e-aa2a9ae12da9@gmail.com>
Date:   Mon, 20 Dec 2021 17:39:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: en-US
To:     =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     hverkuil-cisco@xs4all.nl, sashal@kernel.org,
        linux-media@vger.kernel.org, Brad Love <brad@nextdimension.cc>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
 <45306193-deec-d1a3-d74d-41dc361b36d9@gmail.com>
 <e7c54b23-d163-ef33-3f62-c25b72e30aa8@elbmurf.de>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <e7c54b23-d163-ef33-3f62-c25b72e30aa8@elbmurf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/19/21 01:50, Maximilian Böhm wrote:
> Thanks Pavel (not Paul, I‘m sorry!),
> 
> we might be on the right track here. This patch does still trigger a kernel tracing event with usbreset after a resume from standby (and usbreset is hanging for about 2 mins), but afterwards the system is still running fine, the DVB card works again and I can reboot the machine without hangs. I’ve tried this with two reboots and attached a dmesg log.
> But this only works one time, a second try with usbreset in the same uptame seems to trigger the old total block, the adapter doesn’t get alive again and a proper reboot is impossible.
> 

Hi, Maximilian!

Ok, one down :) I will look at the second one today later or tomorrow. 
It looks like missing dvb_dmxdev_release() somewhere at first glance, 
but for now I have no idea where...




With regards,
Pavel Skripkin
