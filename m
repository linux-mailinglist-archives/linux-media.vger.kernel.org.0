Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 878BD710831
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 10:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240579AbjEYI7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 04:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240429AbjEYI7m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 04:59:42 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B0018D
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 01:59:42 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-53404873a19so965321a12.3
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685005181; x=1687597181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7YBEQ6R1TIgRBN3mvolYGu3wPOZcWcLTGAnbFnH6nA=;
        b=Tq0B7XZkfuEr0ASD5JJpKGvWu0AjQBARSENZPb3CRyrxqqndnrD6Mo/lEdigKLB3fn
         HvspIZ9kXobt2t4dFcgr7nl5KcghZ536zNL46YNvynlx2r5a7UB5Q0UbImGusEDETfZQ
         rzQEVMdQ6Sa36s3nMgS6+ZKUO6Q2ndALRJZ5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685005181; x=1687597181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7YBEQ6R1TIgRBN3mvolYGu3wPOZcWcLTGAnbFnH6nA=;
        b=XHWZMaHYWq0xR3c6os3KUSnfSAwJYI8zHrg/xvxQOpZ22+2tcngrniHXuXyrGPsMmI
         YWsa2R5p9X/Ta3rDPmXSyYOfoepdE4pbKtnJzSSZ+Z5UkTSGOVvgiMRGMKC6WQOBXlPP
         dQ51FTknaTa1xkNaq0DFcvDvdbo6mxs7n94/tb6pAwL/7cO7++Tbixuq7ZobPdjU1UtH
         raeoHJtja00k3EKC890sdoJmCplGcK8BvDrkwrvrKgUiILJCmjax+HIY1zwqOcEqAcMa
         2hPjNTzvhMrZlLkLkEMydt3wEVxdpu1i4BBbVPP1xj8vNlJo0JwIL6xXIZ3kmzI4VJS7
         xHAw==
X-Gm-Message-State: AC+VfDzcI+26ulDvXUkDOWPgy0//R1nUDkprAd7rVTs4uejjHTMTvXfs
        bnAaAH1TjuKtLSaVqlvQ2kTE7w==
X-Google-Smtp-Source: ACHHUZ5u7sTinyx3sOT0YjHbt/0pQYfKkcPkyUBACe9UhZnrYy2zn+Ck0CYRahDoRR6sABqNnV93fA==
X-Received: by 2002:a17:903:230c:b0:1af:fb59:6a5 with SMTP id d12-20020a170903230c00b001affb5906a5mr998976plh.10.1685005181452;
        Thu, 25 May 2023 01:59:41 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902db1100b001a65fa33e62sm891712plx.154.2023.05.25.01.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:59:40 -0700 (PDT)
Date:   Thu, 25 May 2023 17:59:36 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv3] media: venus: provide video device lock
Message-ID: <20230525085936.GD30543@google.com>
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
 <20230524141312.2558810-1-senozhatsky@chromium.org>
 <2c732d80-1a18-7a34-03a8-16afb0de5ea2@linaro.org>
 <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
 <83cd3dc7-455d-0f26-d2a8-3ebe92d9e33f@quicinc.com>
 <1eeb16e4-0812-b70b-df5a-1670c21a5221@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eeb16e4-0812-b70b-df5a-1670c21a5221@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/05/25 09:22), Hans Verkuil wrote:
> >> Since these are m2m devices, I think this should set vfh->m2m_ctx->q_lock
> >> instead.
> >>
> >> The vb2_queue is per filehandle for such devices, so by just setting
> >> vdev->lock you will have all vb2_queues use the same mutex.
> >>
> >> Instead the struct v4l2_m2m_ctx q_lock pointer, if set, will use that
> >> mutex for all vb2 operations.
> >>
> >> I think you can set it to the 'lock' mutex in struct venus_inst.
> > 
> > IIUC, the suggestion is to use the 'lock' in struct venus_inst while
> > initializing the queue. This might lead to deadlock as the same lock is used
> > during vb2 operations in driver. Might be introducing a new lock for this
> > purpose in struct venus_inst would do, unless we are trying to serialize at
> > video device (or core) context.
> 
> For the record, I have not analyzed how that lock is used in the driver,
> so if a new mutex has to be added to venus_inst rather than reusing the
> existing one, then that's fine by me.
> 
> But it should be a instance-specific mutex, not one at the device level.

Thanks for your help Hans. I added a per-instance queue mutex [1], so if
no one sees any problems with it then I can send a formal patch later on.

[1] https://lore.kernel.org/linux-media/20230525005312.GC30543@google.com
