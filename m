Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6082F651415
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 21:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbiLSUjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 15:39:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbiLSUiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 15:38:54 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF0611A10
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 12:38:29 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id h26so5491083qtu.2
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 12:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=31vbTCJ1FQ88+HdPn1SShRJyYwZ+oGDNLQOaB4qvNNE=;
        b=Kyk28UvNHJ3WQw7Y/VpDQu+2aC8AudzzBO83Zr9Gidt0t+KRAi/CLxxrlP59GNPcuy
         1VcHPLxDHkj3BpzGE/71h0fHb/oiQrXedbzTAUo21W9FtH1Z6hDNMkiR4dUGHkv1XZRX
         wO26I+UOEqxvIt9i9RDg/gQAxMP3wixPvv9lem0A3POU5MmrFa1HJJieAKHGm3b+Ec/3
         hu6Qi6Bw9XDvqCHg4D9HReFM6RdOLugPN0ZMlVN3Q+BS3DbixX51efJRmWbICqISPpXE
         FE6/5GZj5GmYpp6ewjcXwIfAWWZXCRTq2gLUBrTrDIm9hvnkBw5baNveltdi72yKST3X
         m2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31vbTCJ1FQ88+HdPn1SShRJyYwZ+oGDNLQOaB4qvNNE=;
        b=czHCYSLXKoPy4YCQXFxwlKrWmH1asCz0Zt/geS99N8uhb7gY8p+FF/RQZQjGzJ6kMs
         AGEIUXw5q/nsjtbuhDZa8VafDluwJ7yY3CoEoYrAIFvlB5fJPOm2XM5HH1CYRTFGRj0G
         qeIIvtBBiyiDYbiUcK+CVniUsrQ+mNvFTR3W9z/S/l71vrMbhUhB4nrDHw+5QI3UtuGp
         PcXK29HMcl3oSKhHAk/PtvJpZHjaGBFhlOS8MmIx2yTfXaujHL5anfnY9OIoD5lkD05a
         vjbVsl/M0jIN9rhx/lhqFOshuPcHD1S4fPYYyQzyEaYtVoXVFn+sOB78w0TQWWoioFD4
         N5Pg==
X-Gm-Message-State: ANoB5pnCAPISos96rIVSEgpLa8L1c5Y9LBALt8aDa59UivjI2dkcE9X0
        ur6KTpse49e3mj2BHd0pRucyDQ==
X-Google-Smtp-Source: AA0mqf4Vb8phNbzN6HOEYP2ewvTSUBFN6wLEe8bPdtAoynvoW6bPty3w7YRsCBqndO+1K9AFPO8+XA==
X-Received: by 2002:ac8:75d0:0:b0:3a8:2b87:9fd8 with SMTP id z16-20020ac875d0000000b003a82b879fd8mr36696351qtq.48.1671482305620;
        Mon, 19 Dec 2022 12:38:25 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id v9-20020a05622a188900b003a826e25bc4sm6683526qtc.64.2022.12.19.12.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 12:38:25 -0800 (PST)
Message-ID: <e3663c85c75d09259a3135cb6ccfe7d6231bd752.camel@ndufresne.ca>
Subject: Re: [PATCH v1 4/9] media: verisilicon: Check AV1 bitstreams bit
 depth
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        daniel.almeida@collabora.com, nicolas.dufresne@collabora.co.uk
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Date:   Mon, 19 Dec 2022 15:38:23 -0500
In-Reply-To: <20221219155616.848690-5-benjamin.gaignard@collabora.com>
References: <20221219155616.848690-1-benjamin.gaignard@collabora.com>
         <20221219155616.848690-5-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 19 d=C3=A9cembre 2022 =C3=A0 16:56 +0100, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> The driver supports 8 and 10 bits bitstreams, make sure to discard
> other cases.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 8e93710dcfed..e10fc59634dd 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -282,7 +282,13 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>  		/* We only support profile 0 */
>  		if (dec_params->profile !=3D 0)
>  			return -EINVAL;
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_AV1_SEQUENCE) {
> +		const struct v4l2_ctrl_av1_sequence *sequence =3D ctrl->p_new.p_av1_se=
quence;
> +
> +		if (sequence->bit_depth !=3D 8 && sequence->bit_depth !=3D 10)
> +			return -EINVAL;

As you state in the cover letter, should this just be this for now ?


> +		if (sequence->bit_depth !=3D 8)
> +			return -EINVAL;


>  	}
> +
>  	return 0;
>  }
> =20

