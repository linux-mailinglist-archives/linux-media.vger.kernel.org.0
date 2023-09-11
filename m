Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CB379A452
	for <lists+linux-media@lfdr.de>; Mon, 11 Sep 2023 09:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbjIKHSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 03:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbjIKHSu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 03:18:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB4ACD1
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 00:18:46 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50091b91a83so6615396e87.3
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 00:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694416724; x=1695021524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7kvJ88hdcyZxn7BimPdJ7m6da9aZWKUxh8JNEoyIe8=;
        b=nLP2PsPviYlAvdgrmqk6DdX+mOafC3Lhg4HTGjNcvkGa2eV5eECgy+37TC8w3gafdC
         gfrJg6ujVuDtVobIm1Ve11cki57mJL9Rako27peOtzYElwFg+EmiZH5W0pO4xdltrYrc
         s3tQdDcS+npTpa+YtDicNtRV8xEfI8cXwhF2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694416724; x=1695021524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7kvJ88hdcyZxn7BimPdJ7m6da9aZWKUxh8JNEoyIe8=;
        b=rPidPxD/KMxO7aMyyV31kNlzwrsEx2PoBhMXvp4zOZRc8V1FwzoJ7E0u8ziuaA4dw3
         6rVapGvjbTqtRCSRwJuLis3elxnor9vc2JoSXQ4G3OFDYtPgSyP5ZldLrFLaH+F2PVp8
         TeSer2+MwXdfZ4Klhl0qqvahbpAvy0yWpgorPNnCIQ3oT3nssWbNYdZKW2KIsyMdEXBi
         WcpYHj1r0xFCmrmdoQZigFA47K+pAVtsolzk0Ujr0qmFXSzCGhdERqJ1OzMM7l29agu+
         Z0ARSJ/dBqhpb2xlnb7Bp8WoSGS5GiY1AE9M9O+cKIog3ncjI34mFojCF0MYUV6wfwIh
         Pdrg==
X-Gm-Message-State: AOJu0YxoZ0/dU4yAJJZFUjCCsHnTiVcoZ0HzXj18WuNY2gymN9TbPRDZ
        tuCpa4sOU+hd9LmXFoR3uQPwgRH/YQggivPjamfo8Q==
X-Google-Smtp-Source: AGHT+IEfwkrSD/W5aQfqkRsu93iH17HGzskopX5yylq6aylm+CrnHrISf+6jlWMFCw+UpNmLMMnSQNXHiOKXlloMF5U=
X-Received: by 2002:a05:6512:3194:b0:500:9a29:bcb8 with SMTP id
 i20-20020a056512319400b005009a29bcb8mr8495782lfe.4.1694416724107; Mon, 11 Sep
 2023 00:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230908132839.2034566-1-fshao@chromium.org>
In-Reply-To: <20230908132839.2034566-1-fshao@chromium.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 11 Sep 2023 15:18:32 +0800
Message-ID: <CAGXv+5EdXbQgnOBN=Jw-rUX-NYdPFybH_ev6MxrS3oLiWZq_Fw@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-jpegenc: Fix bug in JPEG encode quality selection
To:     Fei Shao <fshao@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 8, 2023 at 9:29=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote:
>
> The driver uses the upper-bound approach to decide the target JPEG
> encode quality, but there's a logic bug that if the desired quality is
> higher than what the driver can support, the driver falls back to using
> the worst quality.
>
> Fix the bug by assuming using the best quality in the beginning, and
> with trivial refactor to avoid long lines.
>
> Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
