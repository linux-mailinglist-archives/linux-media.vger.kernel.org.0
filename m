Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2772C011E
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 09:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbgKWIHE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 03:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgKWIHD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 03:07:03 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8066AC0613CF;
        Mon, 23 Nov 2020 00:07:03 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id s30so22494756lfc.4;
        Mon, 23 Nov 2020 00:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nc/kyyI6zwqKWvOLg0XpcimVYyS5Hda1GY5MvOS8A/E=;
        b=Th8JadJ2MEzEdAzm+4DlA2FUuLqt48/+ncA8aoSiu+HQyA32eL5vX7UpPO7Tz6ATpY
         3EIqYsQkTYuAq0SwlWsQ61z/DQydEnELM3KNFH1o/BqWFQE3MxuGxgTetu1TZOLtBF7R
         oGx1r66itYlYgk/cA47Q3+qwDbZflsAVCpypWRPY3gtyeTg3SbWF615SZEhIErIUSyKJ
         ONZRzpa+zbjFjqt0bu7PubWt1kPLL3xMTut8wdVl9xQ/7Hm4bfYATKtefTekvS8htvJW
         qJBLQ826lQG+sRRJy0B5L6GWDyss1JkXR99mm++Mltd4Xdr1LPCkZViyopPtFS6uoWr5
         68IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Nc/kyyI6zwqKWvOLg0XpcimVYyS5Hda1GY5MvOS8A/E=;
        b=k08MPZtzPR/xl/WBbDjIsWBsgydb6gUIJKPnU/NyzMGYdu7QV7NhTay33XJfWXAL8a
         TT4lDGMXZUDd9yVRMzTQX5G5ozmAbhwIveTmD+iRsrsSS/rBtlnmJv31ZW1Hz3uA03mB
         8LiuDZcF7yAY1W5n8OdTzeofP4mvpycBH6sbxJ0cH59g3BqRTw8gchL4EvYR6kL7hcaV
         e/Pl2XLWQujIH0aGHQGIpP7fwt5VHpfRuw8UKlYYgLJx+E45qZ57m3oEzNPqojvJyytd
         FwLhBruW51gEouXE+2S33XdbwaCOwAPfx12qHUvgczSgtaegwzDaxS4Du+kd62Y/X5sA
         ObSA==
X-Gm-Message-State: AOAM530cXibaOSDzVFgx0AgXP7w0gpxv0Rmnl96kAc05O1+AvfpO0rBb
        YC3yEAj6563k3qTWeGZTfdVb+A68HXk=
X-Google-Smtp-Source: ABdhPJyskiPQwy4Mldj8F/wWerBl6Vj2wQ7aoeKRTmswIWjg8dGowQZPKr/U9A+F5hQ7M45F9ZLxgw==
X-Received: by 2002:ac2:568b:: with SMTP id 11mr11861301lfr.397.1606118821843;
        Mon, 23 Nov 2020 00:07:01 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:462f:9843:a5e7:af08:6dde:94bd? ([2a00:1fa0:462f:9843:a5e7:af08:6dde:94bd])
        by smtp.gmail.com with ESMTPSA id w16sm271113lfe.45.2020.11.23.00.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 00:07:01 -0800 (PST)
Subject: Re: [PATCH 2/3] adv748x: csi2: Set virtual channel when device is
 reset
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
 <20201122163637.3590465-3-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <05025d9c-bf69-4440-1293-35140022881d@gmail.com>
Date:   Mon, 23 Nov 2020 11:06:56 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201122163637.3590465-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22.11.2020 19:36, Niklas Söderlund wrote:

> It's not enough to set the CSI-2 virtual channel for TXA and TXB during
> probe it also needs to be set when the device is reset. Move the virtual
        ^ : or --?

> channel selection to adv748x_reset() that is called during probe and
> when the device needs to be reset.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
