Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CC4330104
	for <lists+linux-media@lfdr.de>; Sun,  7 Mar 2021 13:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhCGMsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Mar 2021 07:48:07 -0500
Received: from mail-lj1-f175.google.com ([209.85.208.175]:43175 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhCGMsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Mar 2021 07:48:07 -0500
Received: by mail-lj1-f175.google.com with SMTP id m11so11372652lji.10;
        Sun, 07 Mar 2021 04:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=pS91TVubDXPfoLE+zHFY8up3UAZ9cKyAzw2iFYtmJDs=;
        b=tzLyui6P6jLu9hKxGpKfFjLL8OTKSDRxvATcwVfIDqIzyFZvyVI3e9wLeRS7bXqcZD
         KZhEkCaR+YwXVmHScpCZifDqH1f9xpo8fb/3HzTwT7O45DJ8KEm785YRCcAlusXYuFot
         MzHkhVz0Art3tuJDoaoPmRWIoFLcsTFZbRjjKvaB4D5ff+Ap/BJDFDYKqiCLdxlaW9DF
         X4VUMq2MkCrnph8gu4U/hkrkmBb3twwYiRzpAcJwJcnwhGa/9O1hlNKhJjYXOYPNpS8X
         cWo2hBj8INWJnMKFfXx9+drtzI0f21chjkFPCm1UJX1jXjLhx9P7yrhZLNTAtYNYZaiR
         4nWQ==
X-Gm-Message-State: AOAM531hPlH5XI29JP3FWIArO7KCKrtAX9hJCzmEyj8kJp7jMYiNpkud
        FnPkVaoFXfZpmeJDuKCE3sOrxceCpHvNLg==
X-Google-Smtp-Source: ABdhPJwl6T4EABq4ZegT2Vo1E8BSommGW7fJmYqOF2zTXzp3Tkd3k/7mNwPiQwEqL3nEAKvjHOjeLQ==
X-Received: by 2002:a2e:9791:: with SMTP id y17mr10475704lji.343.1615121285388;
        Sun, 07 Mar 2021 04:48:05 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 192sm1073773ljj.95.2021.03.07.04.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 04:48:04 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id f1so14945059lfu.3;
        Sun, 07 Mar 2021 04:48:04 -0800 (PST)
X-Received: by 2002:a19:2216:: with SMTP id i22mr11229884lfi.57.1615121284671;
 Sun, 07 Mar 2021 04:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20210306141528.18925-1-baijiaju1990@gmail.com>
In-Reply-To: <20210306141528.18925-1-baijiaju1990@gmail.com>
Reply-To: wens@csie.org
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Sun, 7 Mar 2021 20:47:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v660_jsK565dN4D2wSTmGjt1WUnHRkMOG7vzaqgZwY-Zeg@mail.gmail.com>
Message-ID: <CAGb2v660_jsK565dN4D2wSTmGjt1WUnHRkMOG7vzaqgZwY-Zeg@mail.gmail.com>
Subject: Re: [PATCH] media: platform: sunxi: sun6i-csi: fix error return code
 of sun6i_video_start_streaming()
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Mar 6, 2021 at 10:15 PM Jia-Ju Bai <baijiaju1990@gmail.com> wrote:
>
> When sun6i_video_remote_subdev() returns NULL to subdev, no error return
> code of sun6i_video_start_streaming() is assigned.
> To fix this bug, ret is assigned with -EINVAL in this case.
>
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>

This should have the tag:

Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")

Please try to add them when fixing bugs. And this should also be tagged
for stable, so

Cc: <stable@kernel.org>

Otherwise,

Acked-by: Chen-Yu Tsai <wens@csie.org>
