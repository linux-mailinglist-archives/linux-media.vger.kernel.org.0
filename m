Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE66338C865
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbhEUNkR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235937AbhEUNj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:39:58 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4F3C0613ED
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:30 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id o9so18249073ilh.6
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QraQWaDbrIyFsDMVDfzA8DAF+rb0LcMH/Egy8Qs4g6M=;
        b=R461x5DK6Oy+M09t3cWQkEm9qrL5KcZdvIqarLkvpajChuPAlkpVwHWArHhhag+kNN
         ZUbfsrYK7Xo22UI7ZiYZaBIwArR64x21Fic42DI3jbRhffIJB6XaXyDhNrFyv+2Qs4zm
         iN+3hDGEbZIQeXEgXuMmoikSuWstvPWPqHHKuoy/kWqnlNiLKV2i+/zd6hVP7BJYpRDO
         mGC7GcQ0zYXUp5zqpipVO4ojdGqa7D2LcsNFt3SpdYFOECkDUgX08qSsOdqTDNJlvgX2
         rj5EMMWMo678I40ElCFzUaPcLoMmQL+dkfUzWc3IxeAE6JUDaf+SgmXSBY7QQwAQ2c3j
         XSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QraQWaDbrIyFsDMVDfzA8DAF+rb0LcMH/Egy8Qs4g6M=;
        b=RMN4IckwU37kB4vJmdODbuhL1938gpTLw8PZLk786IPZeqy6tPaqVmu3YILIsQlOBk
         qevemeJzpOgVDo0buGdhmM24tw3JvahcLj9Gs9GzQmGsT2EBXoSnwLVDgr5MXgfXNhaM
         w//i3PUaMLCORMvF5RXSnpfZNbak+v1EBkMObg7wZJDJaJFWBbq1/XAhcGzN1Q0sRuFd
         /977s3n+ph/+A1xDCDho5NyLkuDaCoI4Mn4ytpGL/U9bBUBG4kHjOlT8zNxlX5mod3PV
         yN4ieNMZkeIvRFVKCTI9q3KjAf3KM1xzgnUdThgdP+3v9bB/D6oAYBN5Dq/5wuKsmPEW
         EUmg==
X-Gm-Message-State: AOAM53173KYNfXDSJwuYoL61POaIma1ylW3t2goV8XWUoofFvbqMkgPq
        LvAyg1z8RROo+QEzb2RZEUMU1wCxymIdDPWgTSIu8w==
X-Google-Smtp-Source: ABdhPJyIr36lrjSTCZAWI/wXVI6gkeLvcx9vdH9kY86wAPm6nJ+y4Bqp9zyM3RNpCdzm4Ydp/VZdmrTH0prPxSxav1g=
X-Received: by 2002:a05:6e02:92f:: with SMTP id o15mr13051528ilt.127.1621604309819;
 Fri, 21 May 2021 06:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-13-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-13-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:38:18 +0800
Message-ID: <CA+Px+wUBJ9xxf709Ze3npnUV-NOp1DT969GWQsGTg-WuVkF+nA@mail.gmail.com>
Subject: Re: [PATCH v5 12/14] media: mtk-vcodec: vdec: add media device if
 using stateless api
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
