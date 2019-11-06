Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF8CF1789
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 14:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730165AbfKFNoP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 08:44:15 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfKFNoP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 08:44:15 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id A500326D150
Subject: Re: [PATCH v6] media: vimc: upon streaming, check that the pipeline
 starts with a source entity
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     andre.almeida@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
References: <20191101205312.9539-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <ed698bcd-4a78-aa84-a819-9b96a6cbe194@collabora.com>
Date:   Wed, 6 Nov 2019 10:44:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191101205312.9539-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/1/19 5:53 PM, Dafna Hirschfeld wrote:
> Userspace can disable links and create pipelines that
> do not start with a source entity. Trying to stream
> from such a pipeline should fail with -EPIPE
> currently this is not handled and cause kernel crash.
> 
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

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks!
Helen

> ---
> Changes since v5:
> 1. change the documentation of vimc_is_source
> 2. rewrite the patch so that it has the minimal code that fixes the crash
> 
> drivers/media/platform/vimc/vimc-common.c   | 10 ++++++++++
>  drivers/media/platform/vimc/vimc-common.h   |  8 ++++++++
>  drivers/media/platform/vimc/vimc-streamer.c | 13 +++++++++++--
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 2a0c40e9ae88..64aa71230522 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -164,6 +164,16 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  	},
>  };
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
>  const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
>  {
>  	if (i >= ARRAY_SIZE(vimc_pix_map_list))
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index c75401a36312..91375c5cdc2b 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -139,6 +139,14 @@ struct vimc_ent_config {
>  	void (*rm)(struct vimc_device *vimc, struct vimc_ent_device *ved);
>  };
>  
> +/**
> + * vimc_is_source - returns true if the entity has only source pads
> + *
> + * @ent: pointer to &struct media_entity
> + *
> + */
> +bool vimc_is_source(struct media_entity *ent);
> +
>  /* prototypes for vimc_ent_config add and rm hooks */
>  struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  				     const char *vcfg_name);
> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> index 1349be188a5b..cd6b55433c9e 100644
> --- a/drivers/media/platform/vimc/vimc-streamer.c
> +++ b/drivers/media/platform/vimc/vimc-streamer.c
> @@ -104,9 +104,18 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  		}
>  
>  		entity = vimc_get_source_entity(ved->ent);
> -		/* Check if the end of the pipeline was reached*/
> -		if (!entity)
> +		/* Check if the end of the pipeline was reached */
> +		if (!entity) {
> +			/* the first entity of the pipe should be source only */
> +			if (!vimc_is_source(ved->ent)) {
> +				dev_err(ved->dev,
> +					"first entity in the pipe '%s' is not a source\n",
> +					ved->ent->name);
> +				vimc_streamer_pipeline_terminate(stream);
> +				return -EPIPE;
> +			}
>  			return 0;
> +		}
>  
>  		/* Get the next device in the pipeline */
>  		if (is_media_entity_v4l2_subdev(entity)) {
> 
