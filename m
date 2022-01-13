Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DF948D40D
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 09:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbiAMI4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 03:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbiAMI4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 03:56:10 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7213FC061748
        for <linux-media@vger.kernel.org>; Thu, 13 Jan 2022 00:56:10 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d19so8895627wrb.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jan 2022 00:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X0+ozbHcABk5ySvOTGmwVfjCMF9e3Hws3Q4P++iFDE8=;
        b=S22Oc+skUbJl8z4Eod43RO9F3hW0kpqZqXk2XXm9zJGVSdw2AUhvNhAUPHul3lPl8Q
         RFy8dnmfxWv/CExpTnXVLtglKBYj0e4gX00hWwARoRG3o8B1QJGzLOWzv/pz+rBGdXC+
         fqFm62wg98/bKx1VMw67IdnIp+Xe4jpUsMA0m4zmUGQdM+v0HReuxI+Qzuzrv69EdCbk
         GKB6EZgBjW0BPDWhwcPSCU0hIWi7Hhpi39F6zo39iR8IjUcq4AzkFUZW/qqi8fPlMAgN
         bz98GCBnzhg+5INS9L51bnJkPHD6IKm8FSrYrkg7OrGMb6pu8uR7uckiZ1xeBjk2IVdd
         o6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=X0+ozbHcABk5ySvOTGmwVfjCMF9e3Hws3Q4P++iFDE8=;
        b=HfU0cCvdLtMMSXdnKcbA4DXSmxekD9sn2bpjaGjE8KakZBSBgeBaA7ZtMBGzs/5qek
         AXEzmTM3lFwZLiM7RQNpuVaKJqnmNa9cGFGuNI/4uZXvrmowYvnksMvsnw2Jkc31X58h
         ZbUpSNT7h3+Z2syAMmxC7OSSm6Z2yifnC93r5xYHbWPF/y1/htkyR7Gb6sIhzR2FHQkv
         Bs5LfRQs+VUKEL33cMMhsUjnkwSDgpAiPVqr6Obdq9KYD+SyHWI1duajgtMPoLiWUrMv
         SRkQ21IRSNoyRL3WtObuPIqU7FX4sz6pVNUZ6YuDwCK2PF/FkhadkcVDSgkMzFRcC9Uq
         tU+w==
X-Gm-Message-State: AOAM530lDir0V/urUmGzHLa+S9Uuzuqc5LTMCGX6RAfYiZUm8QQlV7Jc
        q2e6zkvarGs3jDrpCdFz8xI/fbBB97MmVA==
X-Google-Smtp-Source: ABdhPJzCqB5Gaox46foEvNONiUieQzo54Bxv6HmJbs3dUXMjYORDT1Ec6Klm2nWfvI5HjO9SJyURXg==
X-Received: by 2002:a5d:6dc9:: with SMTP id d9mr3171002wrz.42.1642064168857;
        Thu, 13 Jan 2022 00:56:08 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bece:ab45:7469:4195? ([2001:861:44c0:66c0:bece:ab45:7469:4195])
        by smtp.gmail.com with ESMTPSA id u16sm1935832wrn.24.2022.01.13.00.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 00:56:08 -0800 (PST)
Subject: Re: [PATCH v3] media: meson: vdec: potential dereference of null
 pointer
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, p.zabel@pengutronix.de
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220113065928.1198125-1-jiasheng@iscas.ac.cn>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9790448d-53bb-cc61-655e-dda70ae97fa3@baylibre.com>
Date:   Thu, 13 Jan 2022 09:56:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113065928.1198125-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/01/2022 07:59, Jiasheng Jiang wrote:
> As the possible failure of the kzalloc(), the 'new_ts' could be NULL
> pointer.
> Therefore, it should be better to check it in order to avoid the
> dereference of the NULL pointer.
> Also, the caller esparser_queue() needs to deal with the return value of
> the amvdec_add_ts().
> 
> Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog
> 
> v1 -> v2
> 
> * Change 1. Change the return type of amvdec_add_ts from void to int.
> * Change 2. Return -ENOMEN if alloc fail and return 0 if not.
> * Change 3. Modify the caller to deal with the error.
> 
> v2 -> v3
> 
> * Change 1. Fix the indentation and refine the commit message.
> ---
>  drivers/staging/media/meson/vdec/esparser.c     | 7 ++++++-
>  drivers/staging/media/meson/vdec/vdec_helpers.c | 8 ++++++--
>  drivers/staging/media/meson/vdec/vdec_helpers.h | 4 ++--
>  3 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
> index db7022707ff8..86ccc8937afc 100644
> --- a/drivers/staging/media/meson/vdec/esparser.c
> +++ b/drivers/staging/media/meson/vdec/esparser.c
> @@ -328,7 +328,12 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>  
>  	offset = esparser_get_offset(sess);
>  
> -	amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
> +	ret = amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
> +	if (ret) {
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +		return ret;
> +	}
> +
>  	dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X flags = %08X\n",
>  		vb->timestamp, payload_size, offset, vbuf->flags);
>  
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index 203d7afa085d..7d2a75653250 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -227,13 +227,16 @@ int amvdec_set_canvases(struct amvdec_session *sess,
>  }
>  EXPORT_SYMBOL_GPL(amvdec_set_canvases);
>  
> -void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
> -		   struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
> +int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
> +		  struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
>  {
>  	struct amvdec_timestamp *new_ts;
>  	unsigned long flags;
>  
>  	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
> +	if (!new_ts)
> +		return -ENOMEM;
> +
>  	new_ts->ts = ts;
>  	new_ts->tc = tc;
>  	new_ts->offset = offset;
> @@ -242,6 +245,7 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>  	spin_lock_irqsave(&sess->ts_spinlock, flags);
>  	list_add_tail(&new_ts->list, &sess->timestamps);
>  	spin_unlock_irqrestore(&sess->ts_spinlock, flags);
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(amvdec_add_ts);
>  
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
> index 88137d15aa3a..4bf3e61d081b 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
> @@ -56,8 +56,8 @@ void amvdec_dst_buf_done_offset(struct amvdec_session *sess,
>   * @offset: offset in the VIFIFO where the associated packet was written
>   * @flags: the vb2_v4l2_buffer flags
>   */
> -void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
> -		   struct v4l2_timecode tc, u32 offset, u32 flags);
> +int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
> +		  struct v4l2_timecode tc, u32 offset, u32 flags);
>  void amvdec_remove_ts(struct amvdec_session *sess, u64 ts);
>  
>  /**
> 

Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
