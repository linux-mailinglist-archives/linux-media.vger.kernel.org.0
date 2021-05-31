Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B6D3967C7
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 20:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbhEaSX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 14:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbhEaSX4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 14:23:56 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D2FC061574
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 11:22:14 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso41358wmh.4
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TrkQp2TydsyPvjp7jtWl6VFFjAb52Ih2oDT5oPn+UDY=;
        b=J4TrJnc45FheRFYBDvuu1yowOQge9dP/ZrKeJPDdRAQjIH8Fi8DzhgxbAHFITceOVN
         NYX/y0jcSQLTld7urQu4e9qS2pc8cyGDSORRgiEiXtcvestkxOPIpUlQTHYzTFGsetFD
         9wtfqt+y7peL6+kdUeqYBaoL5K70YVBCsAG7oZwCY1qVJzQZHLHVU4tZ5t6gMF3xmd4w
         vxzr6+qqRS0xgqmJTN7qwMM3ykugVjBx5TmwxnCjaKenEBqmK1MQ1B+U7kyuwFl9Zdz8
         gAl0ZtSpUvT3LbZaYeIrbgaKpkEqmNonXiH6WwhnUnqAkIrbR7OfueTS4oOaru7WOHTU
         5NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TrkQp2TydsyPvjp7jtWl6VFFjAb52Ih2oDT5oPn+UDY=;
        b=dx6GdvF14kOwjeKkEtQ5prD5uoEJ+KLK1QM0mQM36HfDbDIHQtRHuQJdKWOSwiikJJ
         OfdaZUTeO/cD23znjDst02423+kTCx0IUvfGCc9YJMk/pncn2eXFWnrLnwvDMhVCUWwd
         kESwUm+G0tOznt405Bi4idiQ/q9cUlrHhWkMbRbDMHxeDPzF/k11M2TBLl4Aa99KgRRW
         qKCO/7zUmombsggd6VtdNOu395mkYy4djyZEEYLYl5y62mXdKUm59bOCpldvSDA2Qq/N
         JswexSMtLrX9WZU8jp2pkRfcQ/HhWs6crDt6QbPHSfcdpFkw85rP3ryIe7ydwZGKWPMc
         5/0Q==
X-Gm-Message-State: AOAM530hxRELs3nVAKCQ8FzhDSFQqUJ+53Ftspv0jKHJ/dJjTJL9CHMT
        vG6ju7IcenHAnXSXft0KqFA=
X-Google-Smtp-Source: ABdhPJzc5y0nBZSwrfmmkK0bA1uMWlywRwTlSsQb+8BsBF0lWyTMyq/ElfmxTe7LQsj0k9OTMdRCPA==
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr356289wmc.114.1622485333148;
        Mon, 31 May 2021 11:22:13 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:1c07:9700:6acb:61b6:ae46:2431? ([2a00:23c4:1c07:9700:6acb:61b6:ae46:2431])
        by smtp.googlemail.com with ESMTPSA id k6sm178003wmi.42.2021.05.31.11.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 11:22:12 -0700 (PDT)
Subject: Re: Implementing input IOCTLs for imx capture
To:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <CAOMZO5BLdB_iaGrxvaOCAd4jhX6TJt9qiQd5=BYKmJF3OBhTiQ@mail.gmail.com>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <838ee713-3bca-a6b2-0799-c0adb6800140@gmail.com>
Date:   Mon, 31 May 2021 19:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BLdB_iaGrxvaOCAd4jhX6TJt9qiQd5=BYKmJF3OBhTiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/05/2021 18:55, Fabio Estevam wrote:
> Hi,
> 
> On an imx6dl based board with an ADV7280, I can successfully capture
> from an analog camera using the following Gstreamer pipeline:
> 
> gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink
> 
> The next goal is to integrate it within the Qt multimedia application:
> https://github.com/qt/qtmultimedia/blob/5.15.2/src/gsttools/qgstutils.cpp#L631-L687
> 
> The Qt app uses the VIDIOC_ENUMINPUT and VIDIOC_S_INPUT ioctl's, but
> as these are not implemented by the imx-media-capture driver yet, it
> causes the camera to not be detected.

Seems to me (naively, without looking into it in depth) that the v4l2 
framework default should be to enumerate a single input, return that 
input with g_input and succeed in setting that input with s_input.

Maybe there's a reason why it doesn't?

Regards,
Ian

> 
> Does anyone have any suggestions as to how to add support for
> .vidioc_enum_input, .vidioc_g_input and .vidioc_s_input in
> drivers/staging/media/imx/imx-media-capture.c ?
> 
> I tried to look at how the other drivers implement these hooks, but my
> attempts to add support for them to the imx capture driver didn't
> work.
> 
> Thanks,
> 
> Fabio Estevam
> 
