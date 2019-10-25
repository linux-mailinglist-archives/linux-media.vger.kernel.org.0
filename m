Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87FB5E4116
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 03:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389073AbfJYBe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 21:34:59 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35364 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730006AbfJYBe7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 21:34:59 -0400
Received: by mail-io1-f66.google.com with SMTP id h9so557734ioh.2
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 18:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0+jYUwzBcrDjyleDY8ZEVUWpt9gu0WJNL2yV2OGkFH4=;
        b=d7JMCPeuUUEe4nO8AInexbAuQp0JFfdI8UanzLLZT53HqharP7kvy9aakUbNFto07N
         b09JTcPRa/rB3tKHQ+rLgyjkLVDlcPPElL6AHWYOcHyCm8lv1a6XL9/ptn3fwlvXpmfj
         iGfgQl7MzyjGDxjMipU1oJNE1bH9oVcJYY9hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0+jYUwzBcrDjyleDY8ZEVUWpt9gu0WJNL2yV2OGkFH4=;
        b=Jhrz17xZiSyuFnVr+UwKwAyIlQgvHvTnDT64TgvIwQRtAiACxuYT3NIo9SYyzsXVY6
         +3H3rU7IQigt7PO9cB7pOkM9oYnS6+eFAu9SemPRe3guE6eipJYbMxfHlTvHwbCDwZ3N
         9WrR+dyYAHGg+dVlIzy1NJnTgwSMdQQMBq5WNTMzOaRX63uOM0WDuU5wQb3rBb3QAfeb
         jHvbLYvWrOAdpHYrfEJbJ5eJt/4fIBVo2wvvQVmKwCaZuiWgHRwRbTkrBHHbo7JWY2KZ
         RVG77/THWEA10YyVbh/oWhDIenmFA4GT6vOIsZZap8kC58MpoCWu5EGul5eWVTeZWRIB
         e7GA==
X-Gm-Message-State: APjAAAXrSp053o80LUk5cljDo/69Zyy0ccCxxUFeZAP1tlXRx3h75iHr
        eAhsZoHYMmZSEKCeb5jnB9/2xlZrmTQ=
X-Google-Smtp-Source: APXvYqz5RuXp5jjZAnsPh5ojYS9aeq9R3W+Sndl4C8T3j5e7AOYopt/RUBP8jf2MdzyXp4KB41oBDw==
X-Received: by 2002:a6b:fa15:: with SMTP id p21mr1167797ioh.212.1571967296474;
        Thu, 24 Oct 2019 18:34:56 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f66sm153678ill.19.2019.10.24.18.34.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 18:34:55 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] media: vimc: upon streaming, check that the
 pipeline starts with a source entity
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     helen.koike@collabora.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <20191024093525.10059-1-dafna.hirschfeld@collabora.com>
 <20191024093525.10059-3-dafna.hirschfeld@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2251e81b-ab66-7740-2763-2005589c6383@linuxfoundation.org>
Date:   Thu, 24 Oct 2019 19:34:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024093525.10059-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/24/19 3:35 AM, Dafna Hirschfeld wrote:
> Userspace can disable links and create pipelines that
> do not start with a source entity. Trying to stream
> from such a pipeline should fail with -EPIPE
> currently this is not handled and cause kernel crash.
> 

Can you make the commit log lines closer to ~75 characters long. Easier
to read.

Also, it doesn't tell me anything about how you are fixing it. You are
fixing by adding a check. Would nice to see that here and makes it
easier to review. Also, does this fix the problem?

> Reproducing the crash:
> media-ctl -d0 -l "5:1->21:0[0]" -v
> v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
> v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
> 
> Panic message:
> [   39.078841][  T248] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [   39.079338][  T248] #PF: supervisor read access in kernel mode
> [   39.079704][  T248] #PF: error_code(0x0000) - not-present page
> [   39.080071][  T248] PGD 0 P4D 0
> [   39.080279][  T248] Oops: 0000 [#1] SMP PTI
> [   39.080546][  T248] CPU: 0 PID: 248 Comm: vimc-streamer t Not tainted 5.4.0-rc1+ #17
> [   39.081030][  T248] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-0-ga698c8995f-prebuilt.qemu.org 04/01/2014
> [   39.081779][  T248] RIP: 0010:vimc_sca_process_frame+0xdb/0x210 [vimc]
> [   39.082191][  T248] Code: 44 8d 0c 28 8b 93 a4 01 00 00 48 8b 8b 98 01 00 00 85 d2 74 40 48 8b 74 24 10 8d 7a ff 4c 01 c9 31 d2 4c 01 fe eb 03 4c 89 c2 <44> 0f b6 04 16 44 88 04 11 4c 8d 42 01 48 39 fa 75 eb 8b 93 a4 01
> [   39.083436][  T248] RSP: 0018:ffffb15a005abe90 EFLAGS: 00010246
> [   39.083808][  T248] RAX: 0000000000000000 RBX: ffffa3fdc46d2e00 RCX: ffffb15a02579000
> [   39.084298][  T248] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
> [   39.084792][  T248] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> [   39.085280][  T248] R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
> [   39.085770][  T248] R13: ffffa3fdc46d2ee0 R14: 0000000000000000 R15: 0000000000000000
> [   39.086258][  T248] FS:  0000000000000000(0000) GS:ffffa3fdc7800000(0000) knlGS:0000000000000000
> [   39.086806][  T248] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   39.087217][  T248] CR2: 0000000000000000 CR3: 0000000003c92005 CR4: 0000000000360ef0
> [   39.087706][  T248] Call Trace:
> [   39.087909][  T248]  ? vimc_streamer_pipeline_terminate+0x90/0x90 [vimc]
> [   39.088318][  T248]  vimc_streamer_thread+0x7c/0xe0 [vimc]
> [   39.088663][  T248]  kthread+0x10d/0x130
> [   39.088919][  T248]  ? kthread_park+0x80/0x80
> [   39.089205][  T248]  ret_from_fork+0x35/0x40
> [   39.089475][  T248] Modules linked in: vimc videobuf2_vmalloc videobuf2_memops v4l2_tpg videobuf2_v4l2 videobuf2_common videodev mc
> [   39.090208][  T248] CR2: 0000000000000000
> [   39.090463][  T248] ---[ end trace 697650fefbf78bee ]---
> [   39.090796][  T248] RIP: 0010:vimc_sca_process_frame+0xdb/0x210 [vimc]
> [   39.091209][  T248] Code: 44 8d 0c 28 8b 93 a4 01 00 00 48 8b 8b 98 01 00 00 85 d2 74 40 48 8b 74 24 10 8d 7a ff 4c 01 c9 31 d2 4c 01 fe eb 03 4c 89 c2 <44> 0f b6 04 16 44 88 04 11 4c 8d 42 01 48 39 fa 75 eb 8b 93 a4 01
> [   39.092417][  T248] RSP: 0018:ffffb15a005abe90 EFLAGS: 00010246
> [   39.092789][  T248] RAX: 0000000000000000 RBX: ffffa3fdc46d2e00 RCX: ffffb15a02579000
> [   39.093278][  T248] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
> [   39.093766][  T248] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> [   39.094254][  T248] R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
> [   39.094742][  T248] R13: ffffa3fdc46d2ee0 R14: 0000000000000000 R15: 0000000000000000
> [   39.095309][  T248] FS:  0000000000000000(0000) GS:ffffa3fdc7800000(0000) knlGS:0000000000000000
> [   39.095974][  T248] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   39.096372][  T248] CR2: 0000000000000000 CR3: 0000000003c92005 CR4: 0000000000360ef0
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>   drivers/media/platform/vimc/vimc-common.c   | 10 +++++++
>   drivers/media/platform/vimc/vimc-common.h   |  5 ++++
>   drivers/media/platform/vimc/vimc-streamer.c | 29 ++++++++++++++-------
>   3 files changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index a3120f4f7a90..e8ad3199ffbf 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -164,6 +164,16 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>   	},
>   };
>   
> +bool vimc_is_source(struct media_entity *ent)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ent->num_pads; i++)
> +		if (ent->pads[i].flags & MEDIA_PAD_FL_SINK)
> +			return false;
> +	return true;
> +}
> +

Why are we making so many changes to fix the panic? I would make minimal
changes to fix the bug and then move the code around in a separate
patch.

>   const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
>   {
>   	if (i >= ARRAY_SIZE(vimc_pix_map_list))
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 8349e3c68a49..112574bc3089 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -154,6 +154,11 @@ struct vimc_ent_config {
>   	void (*rm)(struct vimc_device *vimc, struct vimc_ent_device *ved);
>   };
>   
> +/**
> + * vimc_is_source - returns true iff the entity has only source pads

Typo - "iff" -> "if"

Please add doc header for this routine.

> + */
> +bool vimc_is_source(struct media_entity *ent);
> +
>   /* prototypes for vimc_ent_config add and rm hooks */
>   struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   				     const char *vcfg_name);
> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> index 37150c919fcb..e7554598b34f 100644
> --- a/drivers/media/platform/vimc/vimc-streamer.c
> +++ b/drivers/media/platform/vimc/vimc-streamer.c
> @@ -87,8 +87,10 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>   	stream->pipe_size = 0;
>   	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
>   		if (!ved) {

This won't be true the first time around. vimc_streamer_s_stream()
checks before calling this routine. Calling pipeline_terminate makes
sense.

> -			vimc_streamer_pipeline_terminate(stream);

Is there a need to call vimc_streamer_pipeline_terminate() if error
happens before any pipeline gets created.
> -			return -EINVAL;
> +			pr_err("%s: could not get vimc pointer of entity",
> +			       __func__);

This message doesn't look accurate. vimc entity pointer is null would
make more sense.

> +			ret = -EINVAL;
> +			break;

Please change this to a goto. That way it very clear that you are
returning with an error.

>   		}
>   		stream->ved_pipeline[stream->pipe_size++] = ved;
>   
> @@ -96,17 +98,25 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>   			sd = media_entity_to_v4l2_subdev(ved->ent);
>   			ret = v4l2_subdev_call(sd, video, s_stream, 1);
>   			if (ret && ret != -ENOIOCTLCMD) {
> -				dev_err(ved->dev, "subdev_call error %s\n",
> -				       ved->ent->name);
> -				vimc_streamer_pipeline_terminate(stream);


> -				return ret;
> +				dev_err(ved->dev, "s_stream of '%s' failed (%d)\n",
> +					ved->ent->name, ret);
> +				break;

Same here.

>   			}
>   		}
>   
>   		entity = vimc_get_source_entity(ved->ent); > -		/* Check if the end of the pipeline was reached*/
> -		if (!entity)
> +		/* Check if the end of the pipeline was reached */
> +		if (!entity) {
> +			/* the first entity of the pipe should be source only */
> +			if (!vimc_is_source(ved->ent)) {
> +				dev_err(ved->dev,
> +					"first entity in the pipe '%s' is not a source\n",
> +					ved->ent->name);
> +				ret = -EPIPE;
> +				break;

Same here.

> +			}
>   			return 0;
> +		}
>   
>   		/* Get the next device in the pipeline */
>   		if (is_media_entity_v4l2_subdev(entity)) {
> @@ -119,9 +129,8 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>   			ved = video_get_drvdata(vdev);
>   		}
>   	}
> -
>   	vimc_streamer_pipeline_terminate(stream);

I am not sure if vimc_streamer_pipeline_terminate() should be called if
error happens on first pass through the while loop.

Does this patch fix the problem you are seeing?

> -	return -EINVAL;
> +	return ret;
>   }
>   
>   /**
> 

thanks,
-- Shuah
