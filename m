Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3863F55DC78
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236579AbiF0Roz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 13:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239401AbiF0Roy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 13:44:54 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56873CE32
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 10:44:50 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id y77so13849815oia.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v+dkrP2udNa9sOxtusDdTPKwT59IDya3j7lSRZunhgo=;
        b=hq0YjRdG9AhL2dAGsQRZXNGTdvU4mcLdbhoK6/QbH1g+a5rBIVlYtl9tqXCIkSN4U7
         gtiV3/f9XovWSBq7G2K/20G4aSKDGIAEMqx5wtUkiv9cyWQFtBf72eEAFyJs7jTlNHZQ
         VITvQB+1q0n+jtiPp7xYaVdO7JZ2APg24MQxs0ZeTqGMaGDwQCYywXfru6wL/haAQPy+
         EEHt0s7ggb3g21vp3p+IGbKiZ243SeRZandqU9a2nIooRpNeR++J0jsS02uulYlsX5dq
         bec4pW4+j4Zxz4vHNfKpFxciD8P/KaR+1qBhctFCb7IUiRQ1Rz2mHZqrXV5sgdpPiOim
         lofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v+dkrP2udNa9sOxtusDdTPKwT59IDya3j7lSRZunhgo=;
        b=VFy0tBrbmZDTGzkrmzgdEHZZFs278VAzaenrreEbQVN8OpCh9Yyh6vgdUnLfiGijU/
         DKfbeZSBeYXTjKZTsMnq5GnjcfNTUmMWhXu0SghsRx5nj90zutaTON9rAxPVv/D/RT7Q
         BAFeCovnwRVFY9kY9FWytQSczhDzEV6d67Ruu3GzxF4fTviF6pxUQmDINpgpD+NryAuU
         N5d96uXb0oBbSsXVwvbEhOTnKrK0OE20o19exefQZNM6p4kwbCYcTl8WHzq5j8PU8e31
         g6GSaQIvQ82rPphr7oXpX9+GRKdox2MFRPNlVIHQz7+5l0+fxqkTmOscar1cojf4OlZq
         9E2w==
X-Gm-Message-State: AJIora/A5caFWjftJrZuAjxibRyrmNOhGCe9jUUzQlFQRNE92gXYN05p
        sTZwiZvLdOJ4oreKiTZ5IozzaKRCjwLLqnQv
X-Google-Smtp-Source: AGRyM1tcFw++OyIJoIgcqrFORwWhgAzwJoCx66v4j6E9ylGaKiz54nY3UYOhi5uhQbmV96+7sensEA==
X-Received: by 2002:aca:f03:0:b0:335:4760:d9c8 with SMTP id 3-20020aca0f03000000b003354760d9c8mr8262390oip.128.1656351889745;
        Mon, 27 Jun 2022 10:44:49 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id k19-20020a056870d39300b0010200e2828fsm7424768oag.30.2022.06.27.10.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 10:44:48 -0700 (PDT)
Date:   Mon, 27 Jun 2022 14:44:43 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Brian Norris <briannorris@chromium.org>
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@collabora.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] media: rkvdec: Disable H.264 error detection
Message-ID: <Yrnsi2lbtYEDgTEk@eze-laptop>
References: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
 <20220610125215.240539-2-nicolas.dufresne@collabora.com>
 <YqNzt9T9BaYu8tgb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqNzt9T9BaYu8tgb@google.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jun 10, 2022 at 09:39:19AM -0700, Brian Norris wrote:
> On Fri, Jun 10, 2022 at 08:52:11AM -0400, Nicolas Dufresne wrote:
> > Quite often, the HW get stuck in error condition if a stream error
> > was detected. As documented, the HW should stop immediately and self
> > reset. There is likely a problem or a miss-understanding of the self
> > self reset mechanism, as unless we make a long pause, the next command
> > will then report an error even if there is no error in it.
> > 
> > Disabling error detection fixes the issue, and let the decoder continue
> > after an error. This patch is safe for backport into older kernels.
> > 
> > Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> This is effectively how ChromeOS previously was using this hardware for
> years. When moving to the upstream/staging driver, this started giving
> us problems. This fix is helpful; we'd rather sacrifice error detection
> for now, to avoid hanging the hardware in error cases ;)
> 
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Tested-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Given this is stable material, looks like we should queue it,
while the rest of the series is still being discussed.

Thanks,
Ezequiel
