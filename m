Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D937175B81A
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 21:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjGTTgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 15:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjGTTgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 15:36:19 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573C6171E
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 12:36:16 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3a1e6022b93so838458b6e.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 12:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1689881775; x=1690486575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fCqX5B+zhrDKpuRs62rqJnb0R5l0ogRH2YoLWX5OaQA=;
        b=gBvnOr0JgrI4Dpx6IeCG+XoztX5r7UPzUiCZayttjCeC30JvGQP/fnrsVY+yPQC7Xx
         66P/cPQ15cxNQAVLUu9GCJF04177/8/aqMo3TYFW4ZE+bCa6ymRHaBnjK0oLSEVvtVFR
         55K9fJWVvnLDmnQae84RYQ0KGoAGdziG2cMTs+z/rkV4Up++17DfbpKDznFvucJkqBbj
         xfumbcznFXLAPm7PUG7DrPO6vYoe8ZhwjPguIS7tG4Yul9w0+JlYzOf55ooXM7lOfcpN
         X1hwb4vQtWs61YLpxPLc0YbYMHdVPnjoE+7aQ1mCUQmXCIl7j0qctLSIWwsTeae1j2Kc
         xJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881775; x=1690486575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCqX5B+zhrDKpuRs62rqJnb0R5l0ogRH2YoLWX5OaQA=;
        b=jCzyKjSYqcE70Uvl+VZ6tYnAQk1ge//pzoyLAk5PP6otrfS0mOApB8Wt9O6yyrGO2R
         fTe+HHpmRep7TrKYJiwvjE0SztRgCZkcmgljd+wh5v89jUlMCSYUy5vahhUpITBWRREN
         JfqB8rNHcPWq2AzodOlSu0oAL4E9nUCZ/Ju26OZs1BYuWm5sfGYAOZOlTwrCu5ye2RYV
         HXbdpfdWWjSWUPfITqXzMdlN8x0GXGZQr3Bw3C+4rBtk0bDH2B6NrCUNigUt1DAPZ2Wo
         OBpdv+kYjITDjG4kmTwLhrE9/phCLWHlc1acRoAA1GI5bQx9Ppam48oPfBw7P/WmWMKj
         IuPg==
X-Gm-Message-State: ABy/qLY+sxHaARF+nw+DaAyU8sU8I43EV/BpFfLRykbG0QOSsgv6Ekz+
        ypSnXv2XTAQaBui0tjf9ZPOAMQ==
X-Google-Smtp-Source: APBJJlH8IvwexnwlfEPCulJnc+7Fldt5647O/XARhg5vn5qnzYg42szoNWOVisXdIJl623o51CAajQ==
X-Received: by 2002:a05:6808:1394:b0:3a3:ed19:8a25 with SMTP id c20-20020a056808139400b003a3ed198a25mr521806oiw.3.1689881775665;
        Thu, 20 Jul 2023 12:36:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:83d4::7a9])
        by smtp.gmail.com with ESMTPSA id i26-20020ac860da000000b00403efa1c143sm651001qtm.38.2023.07.20.12.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 12:36:15 -0700 (PDT)
Message-ID: <694dcc89ec4ff01ff240a1b924dac98fc1b64ac0.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: fix potential double free
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Date:   Thu, 20 Jul 2023 15:36:14 -0400
In-Reply-To: <ca491aaa-cfc4-4a84-b7fc-b64f3adc6550@moroto.mountain>
References: <ca491aaa-cfc4-4a84-b7fc-b64f3adc6550@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Just a reminder to Yunfei that this change was originally addressed to him,=
 and
a review was to be expected. Over a month is a bit too long for fixes.

Le mercredi 14 juin 2023 =C3=A0 16:05 +0300, Dan Carpenter a =C3=A9crit=C2=
=A0:
> The "lat_buf->private_data" needs to be set to NULL to prevent a
> double free.  How this would happen is if vdec_msg_queue_init() failed
> twice in a row and on the second time it failed earlier than on the
> first time.
>=20
> The vdec_msg_queue_init() function has a loop which does:
> 	for (i =3D 0; i < NUM_BUFFER_COUNT; i++) {
>=20
> Each iteration initializes one element in the msg_queue->lat_buf[] array
> and then the clean up function vdec_msg_queue_deinit() frees each
> element of the msg_queue->lat_buf[] array.  This clean up code relies
> on the assumption that every element is either initialized or zeroed.
> Leaving a freed pointer which is non-zero breaks the assumption.
>=20
> Fixes: b199fe46f35c ("media: mtk-vcodec: Add msg queue feature for lat an=
d core architecture")

Unbalanced calls to deinit/init would be unfortunate, but I like keeping it=
 safe
and aligned with the fact everything is clears to 0/null otherwise.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/dr=
ivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> index f555341ae708..92ac82eb444e 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> @@ -231,6 +231,7 @@ void vdec_msg_queue_deinit(struct vdec_msg_queue *msg=
_queue,
>  			mtk_vcodec_mem_free(ctx, mem);
> =20
>  		kfree(lat_buf->private_data);
> +		lat_buf->private_data =3D NULL;
>  	}
> =20
>  	cancel_work_sync(&msg_queue->core_work);

