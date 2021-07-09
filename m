Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB60C3C20CD
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 10:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhGII3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 04:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbhGII3u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 04:29:50 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46471C0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 01:27:07 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id x16so8062875pfa.13
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 01:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yU9Twe5lXj23b1mNka/5xOrpyF7ZSTRqoQCTkjEokB4=;
        b=LIfVVMZPNUHjO9GLLsf57mvnfsctNvpBsj6fgEhwtEMYU2QPQ6BXihMW4SZkVW2q16
         Qxmr/bSKL2oMkgNy53y7JgditJt9aOU8Cd84q4+Vrqw63I36+wpNdi9w+PutgmATOf8b
         7XabHAsqBzIS7zS4SnDN9sLqcex4HGp2Xy17w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yU9Twe5lXj23b1mNka/5xOrpyF7ZSTRqoQCTkjEokB4=;
        b=X7Msl7klXeHLIZDLu95y/zfRB613BE7zAPRQwJTvHmi9XG9rsR/l1vPkEeMUmEdKQi
         X1zSYnU/DFMimaOcOsWK5MCEkicN6kkyy4FeA39JZ9Rg5iud0clsNamN9SyURWtiIqBk
         6ElVKA3gZlnIb72FDFSdK2K+HpY5Zx20C83Lu9W2O60JNUKPklEiizjSdx539uz7NI9h
         kTtsA+pMWC9RO8IzLjFHz/s0jJTDRC5ifY622vXfDa7ei9BkqWu+eMCa8I91LPzfGHOn
         lVKnb0nwTDQyouCarj0PNuX1KsJ7giRN39lhO4vyQ3UBb1bPprPueHepUPBOrr6/kkre
         OxlQ==
X-Gm-Message-State: AOAM533lhlAnpzrdfE0eqOv1+W5lxfL3+rcZ2fUWB7+S8ghuBS6RjoDo
        llcqn00GR948QhPyvydLDZ8hEQ==
X-Google-Smtp-Source: ABdhPJxk6FrpXb7jO30ZusT2cxQ16M60gq3kw3CbQwTLoJvyedQynzhdP7rkgXhS7oB7FCkbYSPS2A==
X-Received: by 2002:a62:1750:0:b029:328:9c55:4f5b with SMTP id 77-20020a6217500000b02903289c554f5bmr3424022pfx.6.1625819226849;
        Fri, 09 Jul 2021 01:27:06 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:735b:c3cc:6957:ae6d])
        by smtp.gmail.com with ESMTPSA id cx4sm4143678pjb.53.2021.07.09.01.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 01:27:06 -0700 (PDT)
Date:   Fri, 9 Jul 2021 17:27:02 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     "kyrie.wu" <kyrie.wu@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Subject: Re: [PATCH v2,0/9] Support jpeg encode for MT8195
Message-ID: <YOgIVnhdZeK/FR2q@chromium.org>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <CA+Px+wVQFK1MXbq6=x7gSfRu8uRp5hbiNgSWtJ-9ok3Lt+vz8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Px+wVQFK1MXbq6=x7gSfRu8uRp5hbiNgSWtJ-9ok3Lt+vz8A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 06, 2021 at 07:00:17PM +0800, Tzung-Bi Shih wrote:
> On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> > add component framework to using multi-HW for MT8195 jpeg encode.
> Could you add some summary for each patch for getting an overview of the series?
> 
> >   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
> >   media: mtk-jpegenc: Add MT8195 JPEG venc driver
> >   media: mtk-jpegenc: remove redundant code of irq
> >   media: mtk-jpegenc: Refactor jpeg clock interface
> >   media: mtk-jpegenc: Generalize jpeg encode irq interfaces
> >   media: mtk-jpegenc: Generalize jpegenc HW timeout interfaces
> >   media: mtk-jpegenc: Use component framework to manage each hardware
> >     information
> >   media: mtk-jpegenc: Generalize jpegenc HW operations interfaces
> >   media: mtk-jpegenc: Refactor jpegenc device run interface
> The series has some consistency issues which would make readers feel
> uncomfortable.
> 
> For example:
> - Whether to capitalize the first characters in the commit messages/titles.
> - Whether to add a period at the end of English sentences.

FWIW, it's not customary to add a period at the end of a patch subject.

Best regards,
Tomasz

