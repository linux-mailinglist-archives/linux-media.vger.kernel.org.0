Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22F606B1AB3
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 06:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCIF06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 00:26:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjCIF0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 00:26:51 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39E8DAB86
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 21:26:38 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id l1so1080460pjt.2
        for <linux-media@vger.kernel.org>; Wed, 08 Mar 2023 21:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678339598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7PHhOk68Epn8sZnX7ndPf6NL58OBP8K6CT8Y40D6SQo=;
        b=Owc+CejdKAiIxpkuNN0LQAi/h98JsQFPO/Gl6NTildpWJk/MiskjPp1ADoY8Gncq0F
         VrY8pXBIEpE8R8gv8WabR5HMvv7AKQC/HTcewt8fZv3xBIF6VSMua8qbbIYIwFjFO+ku
         wm7fL9kjFyVXWBib+mp9jk7rGeKKWgxPGNpDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678339598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PHhOk68Epn8sZnX7ndPf6NL58OBP8K6CT8Y40D6SQo=;
        b=WGMIn6Jaj4tTTyCrF/v3pE+vkd/7LnO+/0H594/Piq5GEX0gWPf1+e53a/z4Uxk1zk
         iJmtv1lCzr+V8ADNcn1TsL+LHLiKD5y+OqLzvx2H92NVroQHhUMJix9S4AcClDBcv9ti
         Fe7uLGNvvPNo8Px4XPVUr70qPpfF6Ql6I3aWMWYtw278dnsTGL6H8NDOikMs2gRzvkBH
         cf7C4+8EAloj86IW6Mg9OM1gP1XIbRJNdzcODyfQarAcVVaxi/U3UUcUj1dsjQNIcIWJ
         bswXPtTqZ8AuJhnlb4tTVGr3jw9PkU74bw9OS2qnNjh1Ibjb7y2FIst7ZzlNYiDFjD7y
         smUg==
X-Gm-Message-State: AO0yUKVJ3P0uT3GRdLLVFuB9mu4KsZWN9Oxbq6oteP7fDdWsj6JgtYvX
        ouUs1qmxXzFaM6YHM3Ox2cCncQ==
X-Google-Smtp-Source: AK7set+5aarIJYSkwKmjQ0zp1CFKUeE/Ilhd8ehTbVzuM0qW9cCIsXCh/go4SPJpfZnVdPKGQULTkw==
X-Received: by 2002:a05:6a20:244f:b0:cc:7106:b84b with SMTP id t15-20020a056a20244f00b000cc7106b84bmr24983089pzc.29.1678339598231;
        Wed, 08 Mar 2023 21:26:38 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id 19-20020a631253000000b004fb171df68fsm9776967pgs.7.2023.03.08.21.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 21:26:37 -0800 (PST)
Date:   Thu, 9 Mar 2023 14:26:33 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "hn.chen" <hn.chen@sunplusit.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH RESEND v5 4/5] media: uvcvideo: Refactor clock circular
 buffer
Message-ID: <20230309052633.GA1045797@google.com>
References: <20220920-resend-hwtimestamp-v5-0-139d1a144614@chromium.org>
 <20220920-resend-hwtimestamp-v5-4-139d1a144614@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-hwtimestamp-v5-4-139d1a144614@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/03/08 23:45), Ricardo Ribalda wrote:
> 
> Isolate all the changes related to the clock circular buffer to its own
> function, that way we can make changes easier to the buffer logic.
> 
> Also simplify the lock, by removing the circular buffer clock handling
> from uvc_video_clock_decode().
> 
> And now that we are at it, unify the API of the clock functions.
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
