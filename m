Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4B4711E79
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 05:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235081AbjEZDfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 23:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjEZDfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 23:35:42 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B88135
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 20:35:37 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-53033a0b473so193774a12.0
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 20:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685072136; x=1687664136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=md4q6xAJZvpkaxB0vqNHl2ChwExYGesgVJmOsgpRuAs=;
        b=QhpvanNvv4oqBHjON7FqRIkqVstAhZI7KGS/EPT+T5eLMxVZTvXtPOeoEHdV7Yxpq+
         BEjAfO+dd1uSdL4rkfv9pTA48LCD7Row+pxBhVT8IlEWy8IkIYGBhsgMbM3i8l0HKzuS
         3+huyjbqrgIczik5pYx3kVKm3b6Gph3nempY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685072136; x=1687664136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md4q6xAJZvpkaxB0vqNHl2ChwExYGesgVJmOsgpRuAs=;
        b=dCzMWp1HmfJEsG8OQuAmrRwT3nzUK4In5x6tdwCzBSEkplZ9XHrokGPNpHzgwh4Agw
         lddAXoVoakAy2eJVGvRLMe9ZYn7Q/CHloevIPTt/d/26jEEm7PcvlBBeyIi/VevYWmMk
         smpPX7Nj+iDZ/HulrPOmTw1ChkvF9KJ+/nGuvFcWN4qySJP+CJEniJmvFXJYQXo5wjVF
         C6F3CrNw2f2BDmGM/hSz6Dw3VPzOoduQSa1gATe9M/ni5Zs/AE4zWUnBKEI02RFy+VhK
         4eoou48LTHANg4gJFJSXscw8WSSP4PObz0TxivCvq/xYiGowbJbeNPxg9x+QmNSBIM6i
         eYUQ==
X-Gm-Message-State: AC+VfDxC26IYZPy8VIah8K7nS05tQ35ykGChUueTfVCg9CdaBLEnlZZ4
        PuawkUuPYw92XklWgEeLOMA7Ww==
X-Google-Smtp-Source: ACHHUZ7GEZUsaOUUADgdvWI5C5JjX/D0eMR1NmLyZ07/GBoKXnSJKtf546ppu2umWTJIytUnVQz42Q==
X-Received: by 2002:a05:6a20:7486:b0:10c:4ff5:38b7 with SMTP id p6-20020a056a20748600b0010c4ff538b7mr682689pzd.6.1685072136627;
        Thu, 25 May 2023 20:35:36 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:54ba:3de1:6fc1:4b25])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78682000000b00640d80c8a2bsm1813183pfo.50.2023.05.25.20.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 20:35:36 -0700 (PDT)
Date:   Fri, 26 May 2023 12:35:31 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv3] media: venus: provide video device lock
Message-ID: <20230526033531.GA2810326@google.com>
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
 <20230524141312.2558810-1-senozhatsky@chromium.org>
 <2c732d80-1a18-7a34-03a8-16afb0de5ea2@linaro.org>
 <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
 <83cd3dc7-455d-0f26-d2a8-3ebe92d9e33f@quicinc.com>
 <20230525005312.GC30543@google.com>
 <3e395f16-79f0-501f-21f1-70645d6137c2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e395f16-79f0-501f-21f1-70645d6137c2@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/05/25 16:32), Vikash Garodia wrote:
> >   * @sequence_out:	a sequence counter for output queue
> >   * @m2m_dev:	a reference to m2m device structure
> >   * @m2m_ctx:	a reference to m2m context structure
> > + * @ctx_queue_lock:	a lock to serialize video device ioctl calls
> suggestion: we can keep this as ctx_q_lock.

Ack

> >  	v4l2_fh_init(&inst->fh, core->vdev_dec);
> >  
> > +	inst->m2m_ctx->q_lock = &inst->ctx_queue_lock;
> Better to do this in queue_init callback i.e "m2m_queue_init" in vdec.c.
> src_vq->lock = &inst->ctx_q_lock;
> ...
> dst_vq->lock = src_vq->lock;

Ack

> > @@ -1483,6 +1484,7 @@ static int venc_open(struct file *file)
> >  
> >  	v4l2_fh_init(&inst->fh, core->vdev_enc);
> >  
> > +	inst->m2m_ctx->q_lock = &inst->ctx_queue_lock;
> Same comment applies here. This can be moved to "m2m_queue_init" in venc.c.

Ack
