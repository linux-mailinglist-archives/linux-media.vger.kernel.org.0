Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B7F60F2C8
	for <lists+linux-media@lfdr.de>; Thu, 27 Oct 2022 10:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235105AbiJ0IpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 04:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbiJ0IpW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 04:45:22 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E497B588
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 01:45:20 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id g62so811699pfb.10
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHK0d0+DTSltgpKGBcL7Bt7tyx09Lrl7MDMzO3t8/Gs=;
        b=E5A9cHvZuY9j4PwVDYHeC+xGme/yze2WmU/7immd2JuOOOTOZN9JRa46pBF5CmOczG
         NXDyNaMPQCYcs8/+/moMsAlUTeEZXQ05jaFd9zCGwIBz8oUEJJaqDCDyvwdo9Tl+1pQe
         AxN4idYfWS4xL5nUF0JkafbSxZiqJB7hjEXeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHK0d0+DTSltgpKGBcL7Bt7tyx09Lrl7MDMzO3t8/Gs=;
        b=ou+XEYlsD/hE60gJY8PvX6/HexQqwXxisnk0dWBcwIauGumnK15pbExkdphXkFf9ZU
         MaP8gTHRMJYOEj3qvetIieUW36gtspJe0aFzNlX2+r/BItS5dB1OwqNHVaX4zQFjsK3u
         KCEFAjGx8uHwAqSp3vc+XjBCrpCiFbecFMWhzK+bLNAFr49AltFBwGE1RB+WOLLbrSea
         fCPOYBbI0AmpGtH0bSGtgzqHbzgPRqGnLgPZElZjUig4ZH4tU5GY1arDsSqtL5/x4XjE
         az0vI2aBv/JWm0pyObJ1Pk82Zlx29g2XzBnVgwQcVsMKYjSiRMvZP14F4IbKrD1BmLnO
         rmKQ==
X-Gm-Message-State: ACrzQf1xU5aYQ67KHzu9YICe1EXLf9biZjldNJzjbcQmKF42CLrupppB
        k5hYG5qmCcIBT4iItizRzp9u2jDbBkDsSCAO148=
X-Google-Smtp-Source: AMsMyM4x555siUw6CJKl4TiCxEW9qvQS89XWebHZTqYHXDPe8Tbe2cAKHdaOh/ZoZVDR8+tsmM9QXg==
X-Received: by 2002:a05:6a00:13aa:b0:56b:c782:107f with SMTP id t42-20020a056a0013aa00b0056bc782107fmr20614262pfg.43.1666860320124;
        Thu, 27 Oct 2022 01:45:20 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:86f1:106e:aa39:419c? ([2401:fa00:8f:203:86f1:106e:aa39:419c])
        by smtp.gmail.com with ESMTPSA id d6-20020a170903230600b0017f61576dbesm646736plh.304.2022.10.27.01.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 01:45:19 -0700 (PDT)
Message-ID: <17d808c5-c1a2-680d-5841-e0d07b4a8da6@chromium.org>
Date:   Thu, 27 Oct 2022 17:45:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/7] [RESEND] media: uvcvideo: Implement granular power
 management
Content-Language: en-US
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <20220920-resend-powersave-v3-0-c47856d8757e@chromium.org>
From:   Max Staudt <mstaudt@chromium.org>
In-Reply-To: <20220920-resend-powersave-v3-0-c47856d8757e@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Ricardo!


I've reviewed v2 for locking issues etc., albeit without much background 
on V4L, UVC, USB yet.

If this is good enough, then please have a

Reviewed-by: Max Staudt <mstaudt@chromium.org>

