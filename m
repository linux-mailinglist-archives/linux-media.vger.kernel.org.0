Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B094A7442F9
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 21:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbjF3Ty4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 15:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjF3Tyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 15:54:54 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C32107
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 12:54:53 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-be30cbe88b3so2221143276.1
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688154893; x=1690746893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwJVEajk6sjD7pKhMJ8nLrUS9jcG5+GhwtGSJo7hXhE=;
        b=tMKxA1rvuVOfttdgJoZv6MaLRnwVg8j+/TriQO8mdTDOazSNrNi+WwUi/Gc1aPop/Q
         U5lyBwHF2Pk0gd/bvRv9zHYMvRDFntewjNDT1HtD4ZzrqkZMDoIyRWK/obI/N2yKBfmN
         lJpSYB7jO6SRcGocpniDZqWmTKW4Ztx5SXeoLT60DQcH82IfKlOxlFt7ntLGgi6/3856
         G+2R/94O+RPc8LvSRFH7hymsPvDQbs+sYiTuTBzPR5gMz5VTJN8uhHDfIRGRyGqkPfgv
         3MTlbtcKL+5CdJgViSLzkPHkLbXjOJkwyUUHaNvp2xegLtSvJY8YjXt3PdY9Rk6tm1FK
         nKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688154893; x=1690746893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwJVEajk6sjD7pKhMJ8nLrUS9jcG5+GhwtGSJo7hXhE=;
        b=jmuGCwEqW7xYWI6Y6UDdTOF7qJ2Tm1BMzcDmcxDNqqrtqZepVtNipq5Ok6Z+d58w6h
         SrIWlN/DT81kJqoNXXBYTmFsNyFwMYkN6laBllPuflaIeV11sDVbfS7Z7x35+G1KZKGo
         4Hh24NKNsDXWTBfEA/ZmDCfQhomc1JbmIrOkLlJy4Gj1iVrQ8XJVRinWbwGCwBYky/SA
         q8lglvjjFylxYV+1X+1vGy0cLvlbMvDVuMI7xBsivrzVAEKhqXFwA7/pKq5AhaVdAM66
         E3y75jYC9ogAN5LG4stBx+93VdU9s2CHlck/nYtpxloUzDLAialBILKVpQYusPpEWEpF
         McJw==
X-Gm-Message-State: ABy/qLZeJn0GPHHoH4ICymPoKPL5JNqYu7JD0OlQ9vrQGezXAkhvlfzq
        vu7BPDe+i7ff6kqvme1l53rsFdcAcPjl2inG0eii6g==
X-Google-Smtp-Source: APBJJlEQ1nYLUOhJ/Uuqs45GkvzI1ma7uVmZgBTHXjG9xRnpwZWNf4CfnE8yBJ7BW9uSQfZJSO3GHFjEeUi7rjPlsK4=
X-Received: by 2002:a25:add0:0:b0:c01:55d:91d with SMTP id d16-20020a25add0000000b00c01055d091dmr3427876ybe.45.1688154892929;
 Fri, 30 Jun 2023 12:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230630162111.3051783-1-jstultz@google.com>
In-Reply-To: <20230630162111.3051783-1-jstultz@google.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Fri, 30 Jun 2023 12:54:42 -0700
Message-ID: <CABdmKX1qpMTaT=NaG5B+43gaWtoNK=jR5yysKNXMyeyYW10uDQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Laura Abbott from DMA-BUF HEAPS FRAMEWORK
To:     John Stultz <jstultz@google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Laura Abbott <labbott@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 30, 2023 at 9:21=E2=80=AFAM John Stultz <jstultz@google.com> wr=
ote:
>
> Laura's email address has not been valid for quite awhile now,
> so wanted to clean up the reviewer list here.
>
> I reached out to Laura who said it made sense to drop her from
> the list, so this patch does that.
>
> I do want to recognize Laura's long time contribution to this
> area and her previous ION maintainership, as this couldn't
> have gone upstream without her prior efforts. Many thanks!
>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: T.J. Mercier <tjmercier@google.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: John Stultz <jstultz@google.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: kernel-team@android.com
> Acked-by: Laura Abbott <labbott@kernel.org>
> Signed-off-by: John Stultz <jstultz@google.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
