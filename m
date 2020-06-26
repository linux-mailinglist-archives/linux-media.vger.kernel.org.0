Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD10820B653
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 18:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgFZQwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 12:52:46 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:45401 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbgFZQwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 12:52:45 -0400
Received: by mail-qv1-f65.google.com with SMTP id u8so4769472qvj.12
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 09:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=anX6wLWO6KKzgvLUJu6wAnoLzNUqDS2FiwIyJR4/5oI=;
        b=TTp5oSVUTduki3pX0zjaAoyAvgLt9ShWO8flbryCxcz/CuWT0KDoOuivbzFry77fhC
         mdeNoq7AF5WzuL4r4o824Tk62v4DBX5cpX8sSAihpZyy0eguJeDXdHBZa8i7fdld+Gm5
         COxU/oXLv0WuQkY9VXYJeYD7i04ru2E0xBjrqBdJZtLu0szqJhtF62zaImOLL3FaxuVb
         5+gsRyfDo7zEjNH3+hNps8/9q2KoNtwDXpyb8IYWyUn0ANRJENRCRTgJI86Mari5Uivu
         xffJ2Hg0FNUlyh8sC7vM2yxRCkz2iS0oMmdhbdGcbp0H0LVBzWiz/c4s/CIME0GqgG6Z
         5qoQ==
X-Gm-Message-State: AOAM533pSpR5wUqOutGjC+7d7XyKdHxYYbD/BtvBR3vBOfgj5SLrKZts
        Q1P2Tw5qkJE73svU7OIEWoI=
X-Google-Smtp-Source: ABdhPJykT7WfPrlgZQDTX1stS1FLN0Y64If0iHdtylwka7e5J7RtZyLvpNyAy3pAJv6aECCf39m9fw==
X-Received: by 2002:a0c:83e6:: with SMTP id k93mr3933463qva.112.1593190362961;
        Fri, 26 Jun 2020 09:52:42 -0700 (PDT)
Received: from [192.168.1.113] ([179.159.57.232])
        by smtp.gmail.com with ESMTPSA id w45sm9376195qtj.51.2020.06.26.09.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 09:52:42 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] media: staging: rkisp1: stats: read the stats in
 the isr
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200626085141.7646-1-dafna.hirschfeld@collabora.com>
 <20200626085141.7646-5-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen@koikeco.de>
Message-ID: <44a640ad-62a7-b8f1-dffa-5f7a432cc10f@koikeco.de>
Date:   Fri, 26 Jun 2020 13:52:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200626085141.7646-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 6/26/20 5:51 AM, Dafna Hirschfeld wrote:
> Currently the stats are read in a work queue. Defering the
> reading of the stats is not needed and it is fine to read them
> inside the irq handler.
> This patch fixes and remove the TODO item:
> 'Use threaded interrupt for rkisp1_stats_isr(), remove work queue.'
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

lgtm

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/TODO            |  1 -
>  drivers/staging/media/rkisp1/rkisp1-common.h |  3 -
>  drivers/staging/media/rkisp1/rkisp1-stats.c  | 87 ++------------------
>  3 files changed, 7 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> index c0cbec0a164d..bdb1b8f73556 100644
> --- a/drivers/staging/media/rkisp1/TODO
> +++ b/drivers/staging/media/rkisp1/TODO
> @@ -1,5 +1,4 @@
>  * Fix pad format size for statistics and parameters entities.
> -* Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
>  * Fix checkpatch errors.
>  * Review and comment every lock
>  * Handle quantization
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index c92ae1b7093f..45e554169224 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -180,7 +180,6 @@ struct rkisp1_capture {
>   *
>   * @lock: locks the buffer list 'stat' and 'is_streaming'
>   * @stat: stats buffer list
> - * @readout_wq: workqueue for statistics information read
>   */
>  struct rkisp1_stats {
>  	struct rkisp1_vdev_node vnode;
> @@ -190,8 +189,6 @@ struct rkisp1_stats {
>  	struct list_head stat;
>  	struct v4l2_format vdev_fmt;
>  	bool is_streaming;
> -
> -	struct workqueue_struct *readout_wq;
>  };
>  
>  /*
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index 58329e6b0598..87e4104d20dd 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -18,21 +18,6 @@
>  #define RKISP1_ISP_STATS_REQ_BUFS_MIN 2
>  #define RKISP1_ISP_STATS_REQ_BUFS_MAX 8
>  
> -enum rkisp1_isp_readout_cmd {
> -	RKISP1_ISP_READOUT_MEAS,
> -	RKISP1_ISP_READOUT_META,
> -};
> -
> -struct rkisp1_isp_readout_work {
> -	struct work_struct work;
> -	struct rkisp1_stats *stats;
> -
> -	unsigned int frame_id;
> -	unsigned int isp_ris;
> -	enum rkisp1_isp_readout_cmd readout;
> -	struct vb2_buffer *vb;
> -};
> -
>  static int rkisp1_stats_enum_fmt_meta_cap(struct file *file, void *priv,
>  					  struct v4l2_fmtdesc *f)
>  {
> @@ -154,14 +139,8 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
>  	struct rkisp1_buffer *buf;
>  	unsigned int i;
>  
> -	/* Make sure no new work queued in isr before draining wq */
>  	spin_lock_irq(&stats->lock);
>  	stats->is_streaming = false;
> -	spin_unlock_irq(&stats->lock);
> -
> -	drain_workqueue(stats->readout_wq);
> -
> -	spin_lock_irq(&stats->lock);
>  	for (i = 0; i < RKISP1_ISP_STATS_REQ_BUFS_MAX; i++) {
>  		if (list_empty(&stats->stat))
>  			break;
> @@ -324,8 +303,7 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>  }
>  
>  static void
> -rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
> -			      struct rkisp1_isp_readout_work *meas_work)
> +rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>  {
>  	struct rkisp1_stat_buffer *cur_stat_buf;
>  	struct rkisp1_buffer *cur_buf = NULL;
> @@ -333,21 +311,12 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
>  		atomic_read(&stats->rkisp1->isp.frame_sequence);
>  	u64 timestamp = ktime_get_ns();
>  
> -	if (frame_sequence != meas_work->frame_id) {
> -		dev_warn(stats->rkisp1->dev,
> -			 "Measurement late(%d, %d)\n",
> -			 frame_sequence, meas_work->frame_id);
> -		frame_sequence = meas_work->frame_id;
> -	}
> -
> -	spin_lock_irq(&stats->lock);
>  	/* get one empty buffer */
>  	if (!list_empty(&stats->stat)) {
>  		cur_buf = list_first_entry(&stats->stat,
>  					   struct rkisp1_buffer, queue);
>  		list_del(&cur_buf->queue);
>  	}
> -	spin_unlock_irq(&stats->lock);
>  
>  	if (!cur_buf)
>  		return;
> @@ -355,18 +324,18 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
>  	cur_stat_buf =
>  		(struct rkisp1_stat_buffer *)(cur_buf->vaddr[0]);
>  
> -	if (meas_work->isp_ris & RKISP1_CIF_ISP_AWB_DONE)
> +	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE)
>  		rkisp1_stats_get_awb_meas(stats, cur_stat_buf);
>  
> -	if (meas_work->isp_ris & RKISP1_CIF_ISP_AFM_FIN)
> +	if (isp_ris & RKISP1_CIF_ISP_AFM_FIN)
>  		rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
>  
> -	if (meas_work->isp_ris & RKISP1_CIF_ISP_EXP_END) {
> +	if (isp_ris & RKISP1_CIF_ISP_EXP_END) {
>  		rkisp1_stats_get_aec_meas(stats, cur_stat_buf);
>  		rkisp1_stats_get_bls_meas(stats, cur_stat_buf);
>  	}
>  
> -	if (meas_work->isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY)
> +	if (isp_ris & RKISP1_CIF_ISP_HIST_MEASURE_RDY)
>  		rkisp1_stats_get_hst_meas(stats, cur_stat_buf);
>  
>  	vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
> @@ -376,24 +345,9 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
>  	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>  }
>  
> -static void rkisp1_stats_readout_work(struct work_struct *work)
> -{
> -	struct rkisp1_isp_readout_work *readout_work =
> -		container_of(work, struct rkisp1_isp_readout_work, work);
> -	struct rkisp1_stats *stats = readout_work->stats;
> -
> -	if (readout_work->readout == RKISP1_ISP_READOUT_MEAS)
> -		rkisp1_stats_send_measurement(stats, readout_work);
> -
> -	kfree(readout_work);
> -}
> -
>  void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
>  {
> -	unsigned int frame_sequence =
> -		atomic_read(&stats->rkisp1->isp.frame_sequence);
>  	struct rkisp1_device *rkisp1 = stats->rkisp1;
> -	struct rkisp1_isp_readout_work *work;
>  	unsigned int isp_mis_tmp = 0;
>  
>  	spin_lock(&stats->lock);
> @@ -406,23 +360,8 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
>  
>  	if (!stats->is_streaming)
>  		goto unlock;
> -	if (isp_ris & RKISP1_STATS_MEAS_MASK) {
> -		work = kzalloc(sizeof(*work), GFP_ATOMIC);
> -		if (work) {
> -			INIT_WORK(&work->work,
> -				  rkisp1_stats_readout_work);
> -			work->readout = RKISP1_ISP_READOUT_MEAS;
> -			work->stats = stats;
> -			work->frame_id = frame_sequence;
> -			work->isp_ris = isp_ris;
> -			if (!queue_work(stats->readout_wq,
> -					&work->work))
> -				kfree(work);
> -		} else {
> -			dev_err(stats->rkisp1->dev,
> -				"Could not allocate work\n");
> -		}
> -	}
> +	if (isp_ris & RKISP1_STATS_MEAS_MASK)
> +		rkisp1_stats_send_measurement(stats, isp_ris);
>  
>  unlock:
>  	spin_unlock(&stats->lock);
> @@ -476,19 +415,8 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
>  		goto err_cleanup_media_entity;
>  	}
>  
> -	stats->readout_wq = alloc_workqueue("measurement_queue",
> -					    WQ_UNBOUND | WQ_MEM_RECLAIM,
> -					    1);
> -
> -	if (!stats->readout_wq) {
> -		ret = -ENOMEM;
> -		goto err_unreg_vdev;
> -	}
> -
>  	return 0;
>  
> -err_unreg_vdev:
> -	video_unregister_device(vdev);
>  err_cleanup_media_entity:
>  	media_entity_cleanup(&vdev->entity);
>  err_release_queue:
> @@ -502,7 +430,6 @@ void rkisp1_stats_unregister(struct rkisp1_stats *stats)
>  	struct rkisp1_vdev_node *node = &stats->vnode;
>  	struct video_device *vdev = &node->vdev;
>  
> -	destroy_workqueue(stats->readout_wq);
>  	video_unregister_device(vdev);
>  	media_entity_cleanup(&vdev->entity);
>  	vb2_queue_release(vdev->queue);
> 
