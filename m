Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3146718260D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 00:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731530AbgCKXyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 19:54:39 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37843 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731399AbgCKXyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 19:54:39 -0400
Received: by mail-pf1-f195.google.com with SMTP id p14so2261116pfn.4
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 16:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8aa3VbfYvsZsaOnvHAClwet0b5DN6/vyfQby/ceUlvU=;
        b=o/xNsKnZa0ZBfoXAenHovZ/FSnayOvxFcQMrXnYKBisYmXKmlSLLbCGR3mM8gMrbVf
         a3wHrCoI23+ZhI7z+1lqi8/0vup2J11aujRMTZnFr7HlUaNDr29QxEOwljFNIvI/F/rn
         devSrHhuh7U5QevxgILQ4OdwtjR7ajKC2SURJvH1cbb4xVYB8XbAKPc80sWWxqW7mLQJ
         exD/bKQ/WGSwTdkCrfU0KN2TuyySLBFrl4Gxm+n7zZ6q1hmV15aXLrSDtah6CJOv5Dww
         36pVET8Nc8Qj7yKvGRB2KDiI7Q38NzwP1ftmOhZxqvLf19nl8XFYw8CtUK8tJPLTKi4F
         +Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8aa3VbfYvsZsaOnvHAClwet0b5DN6/vyfQby/ceUlvU=;
        b=eozLyWu4RpxAr2NA85MvS15NgrkoFAWxyALtoYnhoXmWBcYZof20yrUSSV50gYueNc
         089AlL23GN2l05jiLGw4V7TZiAsyFtaxEQhG71DPe0eyC/6Wrep6TPugb3+2GlsWVPoV
         VHzGkFMxbYvr0+v25sjHp/WRAY0b/Cdp7oA6G6KM6CdWTAL/Nsktvij8PqU0H0WxaYk1
         qJ/tXTleA4VeleiDZn0kxTEDR+O4v1KjUZplhsvyUNQVnm66KC4vn0nmgOHcVMC22q4G
         xUDNkZJhoJnPvX8OiMBXXZgXC8D+HMR2wd3FVl9JNXOsxzIno7ng5hdAHQ+DIrciqHgl
         C38w==
X-Gm-Message-State: ANhLgQ2ntnF9poRHBmyLWFDIs6rr50tMoNx4wzXGxTnMySeuhRln8pXD
        x4rWrADnQ8injLW9GyQ57Lag8P+ecV8=
X-Google-Smtp-Source: ADFU+vs5XE1XmRlaS9pycut/i+PDgcfjA4ZnKL/oRs1Ol+aiheHAA7YOSZsRF4JKtci3KpjGg8MwHw==
X-Received: by 2002:a62:2f82:: with SMTP id v124mr3969635pfv.120.1583970877728;
        Wed, 11 Mar 2020 16:54:37 -0700 (PDT)
Received: from ?IPv6:2605:e000:d445:6a00:a54b:c8f0:3b71:1a5b? ([2605:e000:d445:6a00:a54b:c8f0:3b71:1a5b])
        by smtp.gmail.com with ESMTPSA id u23sm52047726pfm.29.2020.03.11.16.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 16:54:37 -0700 (PDT)
Subject: Re: [PATCH 7/7] media: imx: imx7-media-csi: Fix video field handling
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-8-laurent.pinchart@ideasonboard.com>
 <3d979bfa-0bb2-0dde-9bc7-83ee3923d33a@gmail.com>
 <20200309205238.GH4916@pendragon.ideasonboard.com>
 <ed913970-573e-4bee-ce84-28513a7869a9@gmail.com>
 <20200310154937.GA32319@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <e981b9cd-c5ab-1771-5b7f-2cd087215d79@gmail.com>
Date:   Wed, 11 Mar 2020 16:54:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310154937.GA32319@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,


On 3/10/20 8:49 AM, Laurent Pinchart wrote:
> Hi Steve and Rui,
>
> I've spent more time on the i.MX7 support in the i.MX media staging
> driver today, and I've reached a point where I'm not comfortable moving
> forward without your ack.
>
> I found format handling to be very broken, the driver enumerates formats
> that are not supported by the device, and doesn't properly handle the
> supported formats. While trying to fix that, I found out that the common
> i.MX6 and i.MX7 helpers (imx-media-capture.c and imx-media-utils.c) get
> in the way, as i.MX6 and i.MX7 format support are very entangled. I
> would like to split the two in order to clean up the i.MX7 code, which
> would also give an opportunity to later clean the i.MX6 code if desired.
>
> Before moving in that time-consuming direction, I want to make sure this
> will be accepted, as I don't want to spend days of work for nothing. If
> you want to discuss this in real time, I'm available in the #v4l channel
> on Freenode (nickname pinchartl).

I'm on vacation returning March 16, maybe we can chat on irc when I 
return. I'm in California (PDT).

Steve

