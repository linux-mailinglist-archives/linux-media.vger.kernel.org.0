Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711E2D6777
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 18:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388130AbfJNQgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 12:36:43 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:47015 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731506AbfJNQgn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 12:36:43 -0400
Received: by mail-wr1-f67.google.com with SMTP id o18so20444109wrv.13
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2019 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=m/kpsCl5fH/xnMSH/o/7yqvnCC95sqSgN1LPI9dMCg0=;
        b=cewqaidw+x4+zQ+7Qr3ab/LZ7CYP96JJqrUrhlkS2Fi3U3kE/Ip9NfgjmMYyu0IT/e
         rsr2luwCOzXbE0kBdiVSON3rreuFowtRTluFIxN8e0A31sxoDXlUumkFw7IuxpjkTCH7
         JfNEGcr7penBmpM0u31CONq48HdgARdhn8WdNBo2JRjduAMq4b+Xj0dSaJt6XPz6jbjM
         wuxyWr1rklg+jR9RKdQq1cMr/gSe8brpGyDrU9RtOXfl0+zpjINdvK4vYUnL+jXmGCSm
         dki7YT70DmzS11609eIk5+QRuDmFdqRvvF+gYC/b3GXyQxhCt7H8itsCnOumjpZOQ9mm
         0J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=m/kpsCl5fH/xnMSH/o/7yqvnCC95sqSgN1LPI9dMCg0=;
        b=BDAl5NGkvLDpwPQ6i++o5x5otbI0FGJQwZ+mUGS6N0oFbLJg7x7olH+RpQrgBf1u9o
         pOcS+zsNG7LAaqVM0+G12azrGFXMHknz/maLtjj0UTPCYylmnNyjVvNJOJxfub3ZQGM+
         A4mhM0JTRvNtwnUeV3XXFvZOxQvmGG82vsCMVqThQPG+82IKXlSGWjEVstL9YN9f8uhs
         usHEvgqi2nePKVMrYsXeBCh+IM3xDQHU8Xix5Da09SXh7Up+1CvZVH+52w1+Ex+Ai57m
         I0h0P8BqDpvUaXmAYp3L0IVj9jpDARti4Ga1Lf1GJep3zCXq7Dqb4yNf8YRxLi49yzAV
         JhNA==
X-Gm-Message-State: APjAAAWJVgrEkQtM/Ah4LmisCxGTuxBxfL1y0dls2cTNqRg0CXBaREbL
        wwMpy8d331NOY/lnfuwH2VTq9oMA
X-Google-Smtp-Source: APXvYqwCQqVemGqIH62Qez30Y5+7jCzOVjEeymkLTBcT49N/2v83Rr0eIXHZZzH3t4OeXDmf0wVN8Q==
X-Received: by 2002:a5d:46d2:: with SMTP id g18mr9963569wrs.245.1571071000616;
        Mon, 14 Oct 2019 09:36:40 -0700 (PDT)
Received: from [172.30.89.1] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id t8sm17845367wrx.76.2019.10.14.09.36.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:36:39 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] media: imx.rst: Specify the sabreauto variant
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de, tharvey@gateworks.com,
        linux-media@vger.kernel.org
References: <20191014135424.7000-1-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <74250409-0be6-c012-9291-059c662bb0e8@gmail.com>
Date:   Mon, 14 Oct 2019 09:36:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014135424.7000-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/14/19 6:54 AM, Fabio Estevam wrote:
> Improve the documentation by specifying that the instructions
> are related to the i.MX6Q sabreauto variant.
>
> This avoids confusion if someone follows these steps on a i.MX6DL
> sabreauto, which has different numbering on the I2C bus and
> I2C muxes.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Steve Longerbeam <slongerbeam@gmail.com>

> ---
> Changes since v1:
> - New patch
>
>   Documentation/media/v4l-drivers/imx.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 1d7eb8c7bd5c..3d72e411b93d 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -515,10 +515,10 @@ Streaming can then begin independently on the capture device nodes
>   be used to select any supported YUV pixelformat on the capture device
>   nodes, including planar.
>   
> -SabreAuto with ADV7180 decoder
> -------------------------------
> +i.MX6Q SabreAuto with ADV7180 decoder
> +-------------------------------------
>   
> -On the SabreAuto, an on-board ADV7180 SD decoder is connected to the
> +On the i.MX6Q SabreAuto, an on-board ADV7180 SD decoder is connected to the
>   parallel bus input on the internal video mux to IPU1 CSI0.
>   
>   The following example configures a pipeline to capture from the ADV7180

