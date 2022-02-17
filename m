Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BBB4BA35E
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 15:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241792AbiBQOoQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 09:44:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbiBQOoP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 09:44:15 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE541207FF5
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 06:44:00 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id de39so4850828qkb.13
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7Dm8/9xh+wmDmQBhMFT43NJgXO5tbOXeBqNcPHzywpk=;
        b=ZICFIWA9Sbi45aOvx4dcDKut/wdPr6VMVnR4U4cb/kJNSc5ETL1ImhYOA8svydp4va
         RzN0pqQOm5Dq4JA7d4pON7G9eyLMCXEsZuWHjnT9Fj9mCm+TUeulRj9lF2p9y2RbrWcw
         Zdpbnbp0nBhk0+kYOrKKXdR396nWX9LG40kL5OO0Sx5HRmFULTOjGINNiVDkIXxd4+xP
         TOWJ3oYmeQRu60z0DluHgDjZgUZAXTPIUOGK3h/aHozSzMAyMRLTYmepfzaIg3ggnHGr
         dP2iJfjIiPWmJy73uFUWoYnY+wyUm1t2ktREy2fqVLd/EgvXbdq9nYV+GFUVOklwgQKe
         rgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7Dm8/9xh+wmDmQBhMFT43NJgXO5tbOXeBqNcPHzywpk=;
        b=TOoRCNVlJywaPqUEMLmcRxjmpIxmqNknDf/+EU5lrux3wS5jIfpjwtieW9jBSXUs25
         pLmbBUVdsQHzTHYSN0eeL0J5S6UCHP0nJ5fJxyisTRXsK0KycbzG3qASUcGVJpCmFhE8
         ySeHw7X1cBN9oTdWpwPsHL+SoNZYjh7IlhgNAcZTgmAw46/qCsGNG7Z97bH7ngJlF2yr
         HTnkb+kgLhhCbiN3vWqPaHWe+5Bz6jLSDnbGwIAvpboenClliwhpnhEq0PLUmsOuS5jY
         BXCHbZ65SkvUEbJMXSp5cQ5xeTorNFlPkxTCJVfor4cd0ovDNZnqeEgTh3M0WNtWJit6
         VYXA==
X-Gm-Message-State: AOAM531B2eO8YwcpZKepp+hlw97ANv08gukbegg1iQOIxaPVfDliCF7h
        Tfy7ylVJErfl46BlZP+tRzAtqQ==
X-Google-Smtp-Source: ABdhPJxLj1ldRMkUKspCf3+BTfjxi/lSWLS/APEjil4eZvdWbgL26ckX1Mt84cdeQha/7dTmRgmWsw==
X-Received: by 2002:ae9:edc6:0:b0:60c:8807:712f with SMTP id c189-20020ae9edc6000000b0060c8807712fmr1821761qkg.14.1645109039947;
        Thu, 17 Feb 2022 06:43:59 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h19sm13099450qtx.12.2022.02.17.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 06:43:59 -0800 (PST)
Message-ID: <20a43338009164be793abb9fedd002f2e4c9a293.camel@ndufresne.ca>
Subject: Re: [PATCH v6, 06/15] media: mtk-vcodec: Refactor get and put
 capture buffer flow
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Date:   Thu, 17 Feb 2022 09:43:54 -0500
In-Reply-To: <353328c24f92a0690c8461a9b18c62166b769a40.camel@mediatek.com>
References: <20220122035316.18179-1-yunfei.dong@mediatek.com>
         <20220122035316.18179-7-yunfei.dong@mediatek.com>
         <b07ac9bebb1d2ecef8ddb1426f16f4ff3218a131.camel@ndufresne.ca>
         <353328c24f92a0690c8461a9b18c62166b769a40.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 17 février 2022 à 17:03 +0800, yunfei.dong@mediatek.com a écrit :
> > > -	ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
> > > +	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
> > >   	if (ret) {
> > >   		mtk_v4l2_err(" <===[%d], src_buf[%d] sz=0x%zx pts=%llu
> > > vdec_if_decode() ret=%d res_chg=%d===>",
> > >   			     ctx->id, vb2_src->index, bs_src->size,
> > > @@ -220,12 +266,9 @@ static void mtk_vdec_worker(struct work_struct
> > > *work)
> > >   		}
> > >   	}
> > >   
> > > -	mtk_vdec_stateless_set_dst_payload(ctx, dst_buf);
> > > -
> > > -	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx-
> > > > m2m_ctx,
> > > -					 ret ? VB2_BUF_STATE_ERROR :
> > > VB2_BUF_STATE_DONE);
> > > -
> > > +	mtk_vdec_stateless_out_to_done(ctx, bs_src, ret);
> > 
> > v4l2_m2m_buf_done_and_job_finish() was specially crafted to prevent
> > developer
> > from implementing the signalling of the request at the wrong moment.
> > This patch
> > broke this strict ordering. The relevant comment in the helper
> > function:
> > 
> > 
> As we discussed in chat, please help to check whether it's possible to
> let lat and core decode in parallel.

Thanks, Benjamin is looking into that. For the mailing list here, here's some
prior art for a similar problem found by downstream RPi4 HEVC driver developer.
The general problem here is that we don't want to signal the request until the
decode have complete, yet we want to pick and run second (concurrent job) so
that parallel decoding is made possible. For RPi4 it is not multi-core, but the
decoding is split in 2 stages, and the decoder run both stages concurrently,
which basically means, we need to be able to run two jobs at the same time
whenever possible.

https://github.com/raspberrypi/linux/commit/964be1d20e2f1335915a6bf8c82a3199bfddf8ac

This introduce media_request_pin/unpin, but being able to pin a request and not
have it bound to any other object lifetime anymore seems a bit error prone in
comparison to the current restrictions. Comments welcome !

> 
> I will continue to fix h264 issue.

Thanks.

> 
> Thanks for your help.
> 
> Best Regards,
> Yunfei Dong

