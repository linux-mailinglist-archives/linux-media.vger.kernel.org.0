Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37ED41C4FA9
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 09:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgEEHwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 03:52:43 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42873 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgEEHwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 03:52:43 -0400
Received: by mail-lf1-f66.google.com with SMTP id j14so562972lfg.9;
        Tue, 05 May 2020 00:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Y7Rnj17ii//R53Od+I3NriqOZPosXNwE7MSov+XlfY=;
        b=iy49VVYBUEbHpP6UrgjpJkUZ9YmV5EQ0njhXfazLAr96Fa7bWKaXJxqeMRFvMk7znX
         yWa7dAw3lCInQVa6tMN7Z03OsyZM7coB/EH6B8I+Q5rPLovDVAW5xiyf0Gc8fc8wj29F
         udlf2182CL+thE+BtNaFK7CPPkaJDpP/RqITce+h2GRgLw+9NGmIaqzZQZz5I1ee0ltG
         eKaEHip6bByoxEIB8x3kRo4lnYuFmtGB6fsHX1kA29hdNB4Cxb+buBUdAJqmgyTW405N
         M+ZZM+0+CVgGm44HMghlvGRZaGERJ2QzkyOuQ5CxrwRjWZiyA7b9L5UYg88lG0AFtfHC
         vnvg==
X-Gm-Message-State: AGi0PubbOec2tJWWyU2o3Br+KsmJ9+uZApxPMu0gEiTIYO4LpyfFevvw
        3U1cWc6ND+R5rbdxvZglf66OaomwZC0=
X-Google-Smtp-Source: APiQypKUJ47EMGE/ZFOvAQXjtRPtwqdPUM00s4u5xHsW9UqgxbtxmVXW8hY7TmeX9lb3F+2KGB550g==
X-Received: by 2002:a05:6512:108f:: with SMTP id j15mr831965lfg.19.1588665159309;
        Tue, 05 May 2020 00:52:39 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id u21sm1043048ljo.61.2020.05.05.00.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 00:52:38 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id a4so552747lfh.12;
        Tue, 05 May 2020 00:52:38 -0700 (PDT)
X-Received: by 2002:ac2:5290:: with SMTP id q16mr830193lfm.108.1588665158225;
 Tue, 05 May 2020 00:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200505075034.168296-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200505075034.168296-1-christophe.jaillet@wanadoo.fr>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 5 May 2020 15:52:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v65PhkepV=1RzKr7bmF_iyjOEM3iu2a772uYPYhy+7Db=Q@mail.gmail.com>
Message-ID: <CAGb2v65PhkepV=1RzKr7bmF_iyjOEM3iu2a772uYPYhy+7Db=Q@mail.gmail.com>
Subject: Re: [PATCH] media: sun8i: Fix an error handling path in 'deinterlace_runtime_resume()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 5, 2020 at 3:50 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> It is spurious to call 'clk_disable_unprepare()' when
> 'clk_prepare_enable()' has not been called yet.
> Re-order the error handling path to avoid it.
>
> Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Chen-Yu Tsai <wens@csie.org>
