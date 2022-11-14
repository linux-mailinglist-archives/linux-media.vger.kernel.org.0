Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63FF56275D1
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 07:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbiKNGM7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 01:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235705AbiKNGM6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 01:12:58 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE85FDEEB
        for <linux-media@vger.kernel.org>; Sun, 13 Nov 2022 22:12:57 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id t5so10443138vsh.8
        for <linux-media@vger.kernel.org>; Sun, 13 Nov 2022 22:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GS5CjFgX03A69nfrKfxJXZ5fpQt8/TU8VVKE0FbaEp0=;
        b=W/2t4o/NOu/LOfgvVdB0xbock6syO+D+eGmXWOZRTkC6WD7SQqZ5PnS7URvq7ATXN9
         pqIlFlVqLbDE/hnEJI0oWYOrp+951c5THEaarKPZbgYHq2MtjnLgpzUxjd8ny4YiHbk/
         SiLDG8ildHQxdX6D8gqg9lEFGh2ZffmRV0g7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GS5CjFgX03A69nfrKfxJXZ5fpQt8/TU8VVKE0FbaEp0=;
        b=pj4S7nqfd/60rzKdTpWMZ6PK6BuQI5cTeYcc+DK8jwF9juI/pnbFWU694me1HeObka
         V4wyHZ/bDt84q7hXYwLepf/iiDqheQO1OV+qTwlnht6FguGQpxYWw6Ljya/ei2iYgvgT
         WGy44gHDoAWKyc+i2RAsTR4FneVW29IUDCvNKxKXjwUGT7go7aORRXIYI+zGMc/asZZ5
         5wXOQk4MfFRDcL9pH27NvAFGUR7hS3CXU4A7x16mtaRYbb7txeqqUSipa6LWfMaABGhR
         relYS6f2rytUcLftpU9o8dv4fQfbYCH42NHs+jDxDKoBeZQQqVddPHmFkFxqEc7MwBwI
         bKxw==
X-Gm-Message-State: ANoB5plwOs+mmLwI0PKDb0Rk9KKeK+Bv/020yqyT0nwAPt6Jk936HNzt
        2hItYPfp+FVVPNQUn3Juai/MhPgjaEAzEPtWKYYesw==
X-Google-Smtp-Source: AA0mqf41+D+Ta4oBw16Qp6PCDMGuKp6Gp9xsPVuyCFaDRWusJIXHR3jVRIru9gUnhrPd8Dy0Hma+yhUJEJjo6Xvq5cw=
X-Received: by 2002:a67:fd97:0:b0:3aa:19e1:eb2a with SMTP id
 k23-20020a67fd97000000b003aa19e1eb2amr5372752vsq.26.1668406376822; Sun, 13
 Nov 2022 22:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20221018114122.26785-1-yunfei.dong@mediatek.com>
In-Reply-To: <20221018114122.26785-1-yunfei.dong@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 14 Nov 2022 14:12:45 +0800
Message-ID: <CAGXv+5GsE1s3gYSt7u=sMZR=FhnpDfxq_XhxUTUrKw+EM423PA@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: fix h264 cavlc bitstream fail
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 18, 2022 at 7:41 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Some cavlc bistream will decode fail when the frame size is small than
> 20 bytes. Need to add pending data at the end of the bitstream.
>
> For the minimum size of mapped memory is 256 bytes(16x16), adding four bytes data
> won't lead to access unknown virtual memory.
>
> Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless H.264 decoding for mt8192")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
