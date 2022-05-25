Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82ABF5341BF
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 18:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245328AbiEYQxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 12:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241233AbiEYQxa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 12:53:30 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75238BD2B
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 09:53:29 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9so9740368ilq.6
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fMVWcc2Fcs7483YteKBUPyqdYcRTbwWYB0BIwDE1we8=;
        b=YOx2w5RWZAC5rYU2PF/0+u132PRXsDu/pAC5xU1ww08kUpv2U6Vc7fBfsXsujV78D+
         F5h0qSqa/CsgcWdayPNiq0tARPvWh1RUI0HbwWNdrVGKrmu+cQ50avwY46d9XHj0k92f
         tcZg8KTdmwjOpljIFzPdVxxUaOZiQe1c6GWoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fMVWcc2Fcs7483YteKBUPyqdYcRTbwWYB0BIwDE1we8=;
        b=Q4Gwlzv51PsLTDjMXsgDUBoqHBJLg/0jwtMCsC5WKbc41qXnlGyuQLNfFfz0Q+oaE3
         LN1oWzqTJSD+e8FmRbOrzfkAnxkXTQQgi2iHVJo2h9toYDL2XLxT3i6Kildv9U65ifGp
         ZyPhYiBz3Zk+3qCtT8wWDVmk1javfQtXXzUlloIjrB8AutXfdGNcgnX5MUtlebkrPQjN
         IVIc7yn7xQIqrg6+K0Tq6CjidnKELznW1eoYBUiDrn1SeBdjVhGZ+xjVotPFmgRRCjsA
         9dZpLRN24cTZLh6D41v5VuCVTICH3Mg7k7K4pAAkE2kdkTqg5HCym504b6g8ZXrQUGBE
         IRhw==
X-Gm-Message-State: AOAM532hR+8l4Jh4luoLRTRqSM+loou05wMwYK1O5TITawGz2xzHVote
        56gt12B3iizo2BWKOzpL/11E/AgxX5TzQemQ2JG5jA==
X-Google-Smtp-Source: ABdhPJzjWXZpGnlzxJBkLwmaUwyMbRcY9htKb0Lr01D9ZnZkV3/ycaF8VgIJvY6bFX7vQLmhQpYAdsIEQKl/R5j3RqI=
X-Received: by 2002:a05:6e02:1d1e:b0:2d1:6ef0:1777 with SMTP id
 i30-20020a056e021d1e00b002d16ef01777mr15531918ila.35.1653497608847; Wed, 25
 May 2022 09:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <Yo4qTnYYT+55vlQ9@gofer.mess.org>
In-Reply-To: <Yo4qTnYYT+55vlQ9@gofer.mess.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 25 May 2022 09:53:18 -0700
Message-ID: <CAADWXX-rcvHAXEn1PVScSmDf9kZRVf=Z2R3nyEuNdsqL+z3pEw@mail.gmail.com>
Subject: Re: [PATCH] media: lirc: revert removal of unused feature flags
To:     Sean Young <sean@mess.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 25, 2022 at 6:08 AM Sean Young <sean@mess.org> wrote:
>
> commit b2a90f4fcb14 ("media: lirc: remove unused lirc features") removed
> feature flags which were never implemented, but they are still used by
> the lirc daemon went built from source.
>
> Reinstate these symbols in order not to break the lirc build.

Applied directly to my tree. Thanks,

                  Linus
