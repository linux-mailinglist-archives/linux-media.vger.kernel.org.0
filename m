Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560711EBEC5
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 17:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgFBPJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 11:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgFBPJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 11:09:39 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31B7C08C5C0
        for <linux-media@vger.kernel.org>; Tue,  2 Jun 2020 08:09:37 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id j7so1927489qvp.2
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=j1hs0sbBhFcDQ7MR3XFZ4Ba55z2Q7IxLUQ5YveNBojk=;
        b=ObqB132WsPXJQaYMlGIcR0AVfl9JSbInH4CY0PmjmgmBn/u/f07H1aWiAeXK+tqPwK
         dsi2xIus1EfNIFc8TnKO12+MaLjeALY5mTkCc5jTuZWl2xxCvcIFOQtCaYTUUSSr5lFS
         irXV1vv7pUCClzlnyIvArLtNRtxquZeHjdA6yuYkQ/sOqdiyKEqcLJv7MP6Q+Ru1DIxB
         NDg/hPpNABJmZkiuJeiUcc3n/dq5qhmzBxCuETJkfQixY+1PkSml2NBXExJqUtaq0Q13
         NnEL7udrGjSMXHjfO0aAX4GwThwsArSj4m0rRa161hcPO0kqhqJKMKUh51pZA1Idf6f9
         Y+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j1hs0sbBhFcDQ7MR3XFZ4Ba55z2Q7IxLUQ5YveNBojk=;
        b=AlF/KBxgyo+XBpbXy9BfO1nZftEPckqQ/KJZ9jdpWRdfE7Q4BPaneCD2GTQ6UeAyYG
         T14OCEf4RLFWhgupM6jA6fJnMtK1IZ7nKnvHvy1GNDmNjMfIYY6SUwHDxG3RilpH9AVa
         5HzFCQ1WnDcN9ycpHtkl3aDc/ZPPI4oH+tzndPCdyunl2T4SPK4NBzCkR9vsOZPZttvp
         KkkJwob+SfnYX+43V+5lpOyH6WMUeJeN6z9/Jw9CPXV0x4b7EDt0kaN2w4Ej28KPnu6u
         2KELJ1GmnhLXIeB3lN3K3o6L7mGh7xJL0e1rIQHkRJWtDU+E3LA7t3i6rYaEKpmKcKnI
         B5IA==
X-Gm-Message-State: AOAM532to9IHfC58b/pfOrJLFSS/Ar++ykemoJ5aHCO34ldGGuYjt4cI
        afIjshFBuzc4K4k7HyXTrMGDEQ==
X-Google-Smtp-Source: ABdhPJz40ktC4+yWqh4CbuxGehjGDMZQSaC+ZGAuKWO/SoimNA3jsxKP6JWqviN4fsFr2AA2mux8bw==
X-Received: by 2002:a0c:9021:: with SMTP id o30mr23107357qvo.177.1591110576105;
        Tue, 02 Jun 2020 08:09:36 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id i94sm2871202qtd.2.2020.06.02.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 08:09:34 -0700 (PDT)
Message-ID: <21733d1ad3c2f79a5646b4f1c541dfabda0978be.camel@ndufresne.ca>
Subject: Re: [PATCH] media: s5p-mfc: set V4L2_BUF_FLAG_LAST flag on final
 buffer
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Andriy Gelman <andriy.gelman@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 02 Jun 2020 11:09:33 -0400
In-Reply-To: <20200502194052.485-1-andriy.gelman@gmail.com>
References: <20200502194052.485-1-andriy.gelman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andriy,

thanks for you patch.

Le samedi 02 mai 2020 à 15:40 -0400, Andriy Gelman a écrit :
> From: Andriy Gelman <andriy.gelman@gmail.com>
> 
> As per V4L2 api, the final buffer should set V4L2_BUF_FLAG_LAST flag.
> 
> Signed-off-by: Andriy Gelman <andriy.gelman@gmail.com>
> ---
>  drivers/media/platform/s5p-mfc/s5p_mfc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> index 5c2a23b953a4..b3d9b3a523fe 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> @@ -614,6 +614,7 @@ static void s5p_mfc_handle_stream_complete(struct s5p_mfc_ctx *ctx)
>  		list_del(&mb_entry->list);
>  		ctx->dst_queue_cnt--;
>  		vb2_set_plane_payload(&mb_entry->b->vb2_buf, 0, 0);
> +		mb_entry->b->flags |= V4L2_BUF_FLAG_LAST;
>  		vb2_buffer_done(&mb_entry->b->vb2_buf, VB2_BUF_STATE_DONE);

The empty buffer is only there for backward compatibility. As the spec
says, userspace should completely ignore this buffer. I bet it will
still have the effect to set last_buffer_dequeued = true in vb2,
unblocking poll() operations and allowing for the queue to unblock and
return EPIPE on further DQBUF.

Perhaps you should make sure the if both the src and dst queues are
empty/done by the time cmd_stop is called it will still work. Other
drivers seems to handle this, but this one does not seems to have a
special case for that, which may hang userspace in a different way.

What you should do to verify this patch is correct, and that your
userpace does not rely on legacy path is that it should always be able
to detect the end of the drain with a EPIPE on DQBUF. LAST_BUF is just
an early signalling, but may not occur if there was nothing left to
produce (except for MFC which maybe be crafting a buffer in all cases,
but that's going a roundtrip through the HW, which is not clear will
work if the dst queue was empty).

As shared on IRC, you have sent these patch to FFMPEG:

https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200429212942.28797-2-andriy.gelman@gmail.com/

This should have been clarified as supporting legacy drivers / older
kernel with Samsung driver. Seems like a fair patch. And you added:

https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200429212942.28797-1-andriy.gelman@gmail.com/

This one should maybe add the clarification that this is an
optimization to skip an extra poll/dqbuf dance, but that end of
draining will ultimately be catched by EPIPE on dqbuf for the described
cases. Remains valid enhancement to ffmpeg imho.

>  	}
>  

