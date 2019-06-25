Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B62B15252A
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 09:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbfFYHsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 03:48:19 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:49820 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfFYHsT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 03:48:19 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 3F21E20334;
        Tue, 25 Jun 2019 09:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1561448892; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1+Z9Y4WIqLmT6WhIMuHUCWK9emMZ3eSkGbqeQrupFHU=;
        b=LKN10hP4eR2HXs1MLiJKGMdyGz0Fv8+BmGD0xpf9IiDL5gwjuM2Lt8yGN62uuCCbChlViw
        2Un/agBQyclC8FpXDD7ejTU7wePUXGEuaj1jpZ8vltH+IBSD1twN/8QemiHLerPb589hA8
        23YZVUn91W0pkt9ZoqsQsYXVsCTP2+vDXi/TequUYjBJCcVcjNJeGYsF5Nq84MPlAX7eNP
        qgP7fzE1Mz6urIydb6hAgL6ERaDRliWBrM0QenXJAJ8liUfcZ+8m1bOhxhCzkz4FOw/6AI
        Sa47xP+CtJJrm48iI5m0suQR0kdhx/HZdsjJA4J0g8fPGZiUW/N1lJ0KXdIo1w==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id F2B9BBEEBD;
        Tue, 25 Jun 2019 09:48:11 +0200 (CEST)
Message-ID: <5D11D1BB.5070701@bfs.de>
Date:   Tue, 25 Jun 2019 09:48:11 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Colin King <colin.king@canonical.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: vivid: fix potential integer overflow on
 left shift
References: <20190624215804.12122-1-colin.king@canonical.com>
In-Reply-To: <20190624215804.12122-1-colin.king@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[xs4all.nl];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         RCPT_COUNT_FIVE(0.00)[6];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.999,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         FREEMAIL_CC(0.00)[xs4all.nl];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 24.06.2019 23:58, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a potential integer overflow when int 2 is left shifted
> as this is evaluated using 32 bit arithmetic but is being used in
> a context that expects an expression of type s64.  Fix this by
> shifting 2ULL to avoid a 32 bit overflow.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 8a99e9faa131 ("media: vivid: add HDMI (dis)connect RX emulation")
> Fixes: 79a792dafac6 ("media: vivid: add HDMI (dis)connect TX emulation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/platform/vivid/vivid-ctrls.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
> index 3e916c8befb7..8f340cfd6993 100644
> --- a/drivers/media/platform/vivid/vivid-ctrls.c
> +++ b/drivers/media/platform/vivid/vivid-ctrls.c
> @@ -1634,8 +1634,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  			0, V4L2_DV_RGB_RANGE_AUTO);
>  		dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
>  			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0,
> -			(2 << (dev->num_hdmi_inputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_inputs - 1)) - 1);
> +			(2ULL << (dev->num_hdmi_inputs - 1)) - 1, 0,
> +			(2ULL << (dev->num_hdmi_inputs - 1)) - 1);
>  
>  	}
>  	if (dev->num_hdmi_outputs) {
> @@ -1653,16 +1653,16 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  			&vivid_ctrl_display_present, NULL);
>  		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
>  			NULL, V4L2_CID_DV_TX_HOTPLUG, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
>  		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
>  			NULL, V4L2_CID_DV_TX_RXSENSE, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
>  		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
>  			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
>  	}
>  	if ((dev->has_vid_cap && dev->has_vid_out) ||
>  	    (dev->has_vbi_cap && dev->has_vbi_out))


To make this more readable for humans, it could help to store
 (2ULL << (dev->num_hdmi_outputs - 1)) - 1 in an intermediate.
like:
s64 hdmi=(2ULL << (dev->num_hdmi_outputs - 1)) - 1;

  		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
  			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
			hdmi, 0,hdmi);


just my 2 cents,

re,
 wh

