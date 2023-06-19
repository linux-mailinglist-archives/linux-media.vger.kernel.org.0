Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D237351DB
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 12:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjFSKUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 06:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbjFSKTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 06:19:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9180610DB;
        Mon, 19 Jun 2023 03:19:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 265D360B46;
        Mon, 19 Jun 2023 10:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892B5C433C9;
        Mon, 19 Jun 2023 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687169979;
        bh=Ql8oZeiPv3Nsx9lfoBIsiA/5xPyBJlH0pHjr4hER5Sg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hZl3fmoF1JhP3Ist+qWejavEM/YR7wwlD0YS26Has4R8IOSP+/MKxB1vvjy/yaDgs
         ke4M5cgPdEapN45hnHsPld56xxsn21/V1MOdLrXRUBCwpDA9Z/4qcBdLvarojuc0H6
         qU8iyKnFNLuOuyeEoV7FUTcoO3UwGwlXup9MjgFOs0vBnZkKSEt6kxZdj0qFl8Re/s
         SY4HF1c3LiKxHB2Tkjo0RZjJhQwH09mK/fZGJlR3mi/XdCNNOseY6xMunRzbQOWIsH
         IBhUtCPeo2cTEYIh3KG50tRXjdAlGvCmrrPmGzSVD1sOV3K+lt5aIsH2PV3Gfy1mcK
         ELlu9eX+xcnAQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b4619ef079so32349061fa.2;
        Mon, 19 Jun 2023 03:19:39 -0700 (PDT)
X-Gm-Message-State: AC+VfDysPKFd0jY+9QK0QCN1mYh0V3WQlKIWjefanLqmrjCfj7dBy04C
        msxlph8RcqXop1dQl3tDMarTKMlIfyHjUf/jNRU=
X-Google-Smtp-Source: ACHHUZ7PTalzmKF7Cp+12G5Jv5NjTJY5Tl4rwUPo9156swI3VqtOp6tE/X9s8ABJSUnbGUhg//LFpe+/pYOhOyd9bdU=
X-Received: by 2002:a2e:3c16:0:b0:2b4:765b:f6ee with SMTP id
 j22-20020a2e3c16000000b002b4765bf6eemr1694734lja.41.1687169977592; Mon, 19
 Jun 2023 03:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230615143613.1236245-1-15330273260@189.cn> <20230615143613.1236245-2-15330273260@189.cn>
 <CAAhV-H704swbRxsZoJN5ef3X41n9Vw-js_73tptK3cAjCWP6tQ@mail.gmail.com> <f1f24be6-20c6-03de-a4a7-4ad874b8a0f5@loongson.cn>
In-Reply-To: <f1f24be6-20c6-03de-a4a7-4ad874b8a0f5@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Mon, 19 Jun 2023 18:19:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5_B5g5tkv29z2bPBeiuR-gaBgRMFPSmOp1U+bqrOGQPA@mail.gmail.com>
Message-ID: <CAAhV-H5_B5g5tkv29z2bPBeiuR-gaBgRMFPSmOp1U+bqrOGQPA@mail.gmail.com>
Subject: Re: [PATCH v15 1/2] drm: Add kms driver for loongson display controller
To:     Sui Jingfeng <suijingfeng@loongson.cn>
Cc:     Sui Jingfeng <15330273260@189.cn>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        loongson-kernel@lists.loongnix.cn, inux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Nathan Chancellor <nathan@kernel.org>,
        Liu Peibao <liupeibao@loongson.cn>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 19, 2023 at 6:07=E2=80=AFPM Sui Jingfeng <suijingfeng@loongson.=
cn> wrote:
>
> Hi,
>
>
> On 2023/6/19 17:18, Huacai Chen wrote:
> > This patch is too large to review, lsdc_benchmark.c, lsdc_benchmark.h
> > and their call sites can be split to a separate patch.
>
> Better not, large is not a problem.
My review was rejected by the maillist, this is a very big problem.

>
> Single patch is more easy to manage.
>
> The first patch of this driver should comes a whole.
Benchmarks and debugfs are not the very basic parts.

Huacai
>
> --
> Jingfeng
>
