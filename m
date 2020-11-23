Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76BF2C0115
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 09:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgKWIFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 03:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgKWIFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 03:05:13 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20177C0613CF;
        Mon, 23 Nov 2020 00:05:13 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id j205so22451896lfj.6;
        Mon, 23 Nov 2020 00:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eLljWSgGiGsEsCe0OP/i8K31z4Uq+7sMKfcQv5nsZ10=;
        b=BFGwcI9VMwyKFNuqmY3YMuYKykH7gxkzpbV+hL38wvF2tpxO1Z36P9CZwu0OhB7rsP
         imyVqIm4KZ/E7DcptZu733v7yonjifg66wVBd2AmaSaFkZJrcG43dkLEixOupjWm4ZXd
         nzASSeE3D1mTFCaCJdeJXrTW9wrc8I9GjvXBdeq1pCY8/CJu/QRSfcfWtkveJyiUhfXs
         uMQlrLDMBTKEMrXIH+vVVrhnUTggWQ0qDo1HrACOuk+N47d02TthrTepOEMAe6kFFnNY
         4Hg+gH90VJW2n7RkHYG8gzO9g8Kw0pPa8ILxLr4CtOrvZA5Wm7T2z7QIG2GI7I5+LXfp
         E85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eLljWSgGiGsEsCe0OP/i8K31z4Uq+7sMKfcQv5nsZ10=;
        b=ad+IbrDDhdLfIR/jIZXHt0U4Qo4sq7yzOK9PRBcKqLJEurW4soZduCj+NL6uw4dnsM
         40L/TKpVuNYxbxTg9drhObNx29e2X55+DChf4S+UYwW85Ek1iyIoz2VKPG8IGA1/kbAn
         YvXcMTkOCRZHZJF5HyH7nt5xNvhyRr2wgpjusIMsbFzJf7jrTwCyAmjJc7eUAFt26z2h
         n6WE9NDe3ejf7y1uVaSfx1qvbNO/3AxY8/rOkg24iASDydPqryNnF01K00G2RrNmvuyd
         fgQ11pBcDGIck7TTAgRQsILtozR64AyZBBFKSAV5hJgCiLqR2fC1wqonzrHTvAgd93/L
         xHBw==
X-Gm-Message-State: AOAM530QQFp1pM1IK+xSwPUa6XF0Rc1YS2yF6s5AXtqKc/MwwRVWOEH2
        YJQBBwIt/arA5nhbjbAAXDa3prUlCdY=
X-Google-Smtp-Source: ABdhPJzEHrrGnaePe/qcC505gcwoR3Blzx9uJHktXYD2I3O4ubvAGBEFZK+eNjz+/8RD7BdnSSoV/w==
X-Received: by 2002:a19:c897:: with SMTP id y145mr13549269lff.214.1606118711437;
        Mon, 23 Nov 2020 00:05:11 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:462f:9843:a5e7:af08:6dde:94bd? ([2a00:1fa0:462f:9843:a5e7:af08:6dde:94bd])
        by smtp.gmail.com with ESMTPSA id f27sm244945lfq.188.2020.11.23.00.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 00:05:10 -0800 (PST)
Subject: Re: [PATCH 0/3] adv748x: Add support for s2ram
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <dec49ee3-3643-2516-c117-95918d0102ee@gmail.com>
Date:   Mon, 23 Nov 2020 11:05:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22.11.2020 19:36, Niklas Söderlund wrote:

> This series enables usage of the ADV748x after the system have been
> suspended to ram. During s2ram the ADV748x may be powered down and thus
> lose its configuration from probe time. The configuration contains
> among other things the i2c slave address mappings for the different
> blocks inside the ADV748x. If this is lost the hardware listens to the
> "wrong" i2c addresses and becomes inaccessible.
> 
> Example trying to read the analog standard before and after s2ram with
> and without this this series.
> 
> Without this series,
> 
>    # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
>    # v4l2-ctl --get-detected-standard -d $subdev
>    Video Standard = 0x000000ff
>            PAL-B/B1/G/H/I/D/D1/K
>    # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
>    ** flipp SW23 off **

    flip?

>    # echo mem > /sys/power/state
>    ** flipp SW23 on **

    flip?

>    # v4l2-ctl --get-detected-standard -d $subdev
>    [  502.753723] adv748x 4-0070: error reading 63, 02
>    [  502.866437] adv748x 4-0070: error reading 63, 02
>    VIDIOC_QUERYSTD: failed: No such device or address
> 
> With this series,
> 
>    # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
>    # v4l2-ctl --get-detected-standard -d $subdev
>    Video Standard = 0x000000ff
>            PAL-B/B1/G/H/I/D/D1/K
>    # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
>    ** flipp SW23 off **
>    # echo mem > /sys/power/state
>    ** flipp SW23 on **

    Here as well...

>    # v4l2-ctl --get-detected-standard -d $subdev
>    Video Standard = 0x000000ff
>            PAL-B/B1/G/H/I/D/D1/K
[...]

MBR, Sergei
