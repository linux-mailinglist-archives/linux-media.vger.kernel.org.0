Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC048B5CE7
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 08:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbfIRGaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 02:30:01 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42572 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbfIRGaA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 02:30:00 -0400
Received: by mail-ed1-f65.google.com with SMTP id y91so5516118ede.9
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+i71jpCnA8KQ/6xZ+yhHZNo8pE9hXOQ1eqRSXMs79Vw=;
        b=PmvKyfqDWNzXz7UpA8op/g1dxRilOnEVH7raQ6TQNn7MfR7R2/ljmtiWQAJzF1L+Tt
         wCjPON2gN6DSteclXTz48eMoTaEuDyg+8cMYUzBPkPkO5XuESlh5RXjCEtG1HEkL3Zz0
         g1EzCTsnNK898cjC5G9FQYOX3PGe696YG96gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+i71jpCnA8KQ/6xZ+yhHZNo8pE9hXOQ1eqRSXMs79Vw=;
        b=uk1W8RIALXLQTMhJwg9T6J8ZKKr+adJl+BcPCCXMhdBnUGb9ODsSg5ceFfDdqC/iOK
         KW0wL5lCjteoYd7Cy9fDo/VOqN/yihWY4EBoS2W1sVuTJQ3HFMNPH3bfAO20FvDaQR0t
         j7tz+4NZiq0KTCYSqgoCDzR90CKFTGKj9zVdz9iuDmnSsI8e0jkaaVzNyVy/9Djys67K
         l+kYYTaOk0LJ3JGj02b23JZa2vJNrHZHFMs2oPbz4CJQ4/R3AxX3QHuqfqYkWmqF13rU
         9y4by3mOwg81EeyT75h+oJugorQDNxuhdFbjxERbSvhkzsOmXerL2p+5c05a5Mq6em9v
         eZGg==
X-Gm-Message-State: APjAAAVicAlbo8QUMOwPCUudjbfv5Qg++lloVqJ3DCAZIGLlPuhL3DZD
        9+Ims8rTGGwD/n3S0A0pqZCtiZTg2RlV+A==
X-Google-Smtp-Source: APXvYqzAr9ewx01qCP/Gx8RhDqOnSNN0T8+Ih6Vdf9sY+9NEV6NE0Et/Cz2JJGlTw/zUPpVFNoas4w==
X-Received: by 2002:a17:906:3615:: with SMTP id q21mr7485037ejb.201.1568788198189;
        Tue, 17 Sep 2019 23:29:58 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id r18sm857978edl.6.2019.09.17.23.29.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 23:29:57 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id i16so1051667wmd.3
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 23:29:56 -0700 (PDT)
X-Received: by 2002:a1c:c104:: with SMTP id r4mr1444373wmf.64.1568788196582;
 Tue, 17 Sep 2019 23:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190909072815.23981-1-boris.brezillon@collabora.com>
 <20190909072815.23981-3-boris.brezillon@collabora.com> <CABK_QF1kBNHkZDiOK8ZmXchGH87kwo8EnKDfS_HCw4qLQ8jLAw@mail.gmail.com>
In-Reply-To: <CABK_QF1kBNHkZDiOK8ZmXchGH87kwo8EnKDfS_HCw4qLQ8jLAw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 18 Sep 2019 15:29:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DAZ-Y_TxPJzXsrXAt=18Y_QnuONNsae4ucgySRHBJ5OA@mail.gmail.com>
Message-ID: <CAAFQd5DAZ-Y_TxPJzXsrXAt=18Y_QnuONNsae4ucgySRHBJ5OA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: hantro: h264: Fix the frame_num wraparound case
To:     Francois Buergisser <fbuergisser@google.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 18, 2019 at 2:04 PM Francois Buergisser
<fbuergisser@google.com> wrote:
>
> On Mon, Sep 9, 2019 at 4:28 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Step '8.2.4.1 Decoding process for picture numbers' was missing in the
> > reflist creation logic, leading to invalid P reflists when a
> > ->frame_num wraparound happens.
> >
> > Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
> > Reported-by: Francois Buergisser <fbuergisser@google.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Francois Buergisser <fbuergisser@chromium.org>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
