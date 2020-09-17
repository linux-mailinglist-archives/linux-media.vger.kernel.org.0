Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C3526D70E
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 10:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgIQIsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 04:48:13 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51185 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726556AbgIQIsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 04:48:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IpaEkLCPNPTBMIpaFklCV0; Thu, 17 Sep 2020 10:48:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600332484; bh=4VhwuLp/SbrHUrzAhfNsXAksjGlQvOKMViYOgZ0wqNM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XRu5NC1EWt3YyfMyWi4cQluaC5s7eJjoYsojE2hGPZ2AsxrIu6zn2wpGgcASVsyUL
         RTC9pHXN6pLg/GMEj9G6nnLym7QeNnhgKETRIl38HQVPs9AjoIOKDrYz8cy8fe/Lhh
         ak1AtHzcWvI3IaWdTQI4lfih8j8s94CpIH6ic+5eOct3az4QOOdwLqGCdAre+lTf5X
         Kkgkfz/2B8gOQ42UAfbX6lCSpYzdxkwvwZQGgSp96zPrBFE/v/hXzqL6Y9nEPVzVKj
         q/AqHBqrjfO0t8zXzRTPFDltuNgfqNGlP8wbXZ8f2NnaTw3Rv+B1q6hC4lqXJSYeRF
         tzYH9+tN9WpOA==
Subject: Re: [PATCH] media: s5p-mfc: set V4L2_BUF_FLAG_LAST flag on final
 buffer
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Andriy Gelman <andriy.gelman@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200502194052.485-1-andriy.gelman@gmail.com>
 <21733d1ad3c2f79a5646b4f1c541dfabda0978be.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b69fadc2-8e73-2a1b-55b3-2d7cecf877de@xs4all.nl>
Date:   Thu, 17 Sep 2020 10:48:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <21733d1ad3c2f79a5646b4f1c541dfabda0978be.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHqwfJ/lb3oXykvNrL2kZnTDxJs7gEazphwNbLF7H/+ZHoV1Y6RhyJDpWoozZf39sHJku0uf/e/jIgRH6zK7cWkhITPT2eatS0ZlpS/RuwhqaksIhXWR
 yyVQQGakRs58V5Nwm+l68a2/uiIWWZzBT92CZb1rSUN8g7Eu5SnBrpNuIABgixomWiSj5UvT8e6bTc3P/QkadllDb/HgPixtrgFUEFNySaAVY/PR4g4qjhuB
 GqBoj3P2Tb8NOe2J5lBJyNCsfvQXvgyVoEaa1vgACCwfOtOzxTJvrBmB7ZdcrQgPLNvnAEgShyFf+xEczWJj+8DrFnbV+OD5G1xnFKWy12DedMbT9lT70b6G
 c5bSkZI7X0iQBY74XymYo9RqbsqLYsMl4+1Qy/+Ee9BRAP5JLrbSj2r0ctS1WqCnqVKAvQaOSIrhLVQ8KbZt5rofr6tQoTdRfJ6aIJU2/lYGQFNBG5HXas6M
 nIE4J7eX9K80ZOgDfJaPP0IaIdzIoTusesnuSlKLvyQcOoz3OB6Glh+knQxwARAbOtfMrHiOsxJoqu1uj3bpcWmUFqP5WacRBxArobu+EDjHyzcDA+p2cuq7
 gHU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2020 17:09, Nicolas Dufresne wrote:
> Hi Andriy,
> 
> thanks for you patch.
> 
> Le samedi 02 mai 2020 à 15:40 -0400, Andriy Gelman a écrit :
>> From: Andriy Gelman <andriy.gelman@gmail.com>
>>
>> As per V4L2 api, the final buffer should set V4L2_BUF_FLAG_LAST flag.
>>
>> Signed-off-by: Andriy Gelman <andriy.gelman@gmail.com>
>> ---
>>  drivers/media/platform/s5p-mfc/s5p_mfc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
>> index 5c2a23b953a4..b3d9b3a523fe 100644
>> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
>> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
>> @@ -614,6 +614,7 @@ static void s5p_mfc_handle_stream_complete(struct s5p_mfc_ctx *ctx)
>>  		list_del(&mb_entry->list);
>>  		ctx->dst_queue_cnt--;
>>  		vb2_set_plane_payload(&mb_entry->b->vb2_buf, 0, 0);
>> +		mb_entry->b->flags |= V4L2_BUF_FLAG_LAST;
>>  		vb2_buffer_done(&mb_entry->b->vb2_buf, VB2_BUF_STATE_DONE);
> 
> The empty buffer is only there for backward compatibility. As the spec
> says, userspace should completely ignore this buffer. I bet it will
> still have the effect to set last_buffer_dequeued = true in vb2,

Actually, no. It only tests for V4L2_BUF_FLAG_LAST, not for empty buffers.

Regards,

	Hans

> unblocking poll() operations and allowing for the queue to unblock and
> return EPIPE on further DQBUF.
> 
> Perhaps you should make sure the if both the src and dst queues are
> empty/done by the time cmd_stop is called it will still work. Other
> drivers seems to handle this, but this one does not seems to have a
> special case for that, which may hang userspace in a different way.
> 
> What you should do to verify this patch is correct, and that your
> userpace does not rely on legacy path is that it should always be able
> to detect the end of the drain with a EPIPE on DQBUF. LAST_BUF is just
> an early signalling, but may not occur if there was nothing left to
> produce (except for MFC which maybe be crafting a buffer in all cases,
> but that's going a roundtrip through the HW, which is not clear will
> work if the dst queue was empty).
> 
> As shared on IRC, you have sent these patch to FFMPEG:
> 
> https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200429212942.28797-2-andriy.gelman@gmail.com/
> 
> This should have been clarified as supporting legacy drivers / older
> kernel with Samsung driver. Seems like a fair patch. And you added:
> 
> https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200429212942.28797-1-andriy.gelman@gmail.com/
> 
> This one should maybe add the clarification that this is an
> optimization to skip an extra poll/dqbuf dance, but that end of
> draining will ultimately be catched by EPIPE on dqbuf for the described
> cases. Remains valid enhancement to ffmpeg imho.
> 
>>  	}
>>  
> 

