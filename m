Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5806951E2
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 21:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjBMUbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 15:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjBMUbo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 15:31:44 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4DB1BC0
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 12:31:42 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id cr22so15228155qtb.10
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 12:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ynunebNv3/ClzLadrcGUSHlvKNNIjn4cGACot/T4j8M=;
        b=iIwgS+KpMsPRwG23PsszTNQdCJxbQu+yrGM+n3tIPedQo6TMhtAj5MxErwVVvJraLO
         ZwYUqU7nq6+lbF/TWwWhTaLTWRf33CkI6b/eyZyG7J+sH3nfkauyaaDKj8mLh3KzVJJT
         mDc/Y6+fWU3eiCSR3V0YKWDUMspYba/gifOEEj6gyC+f1dAYSzu7Cdy7qz1n7SCypUII
         avkLlavLXiLxfqgwdkmXaU3ijEN8ANyWgXxP+BB3NX8JPYkUXGcp0UGlfRdM6eYJwerg
         hdl/fKfsjSU6TB5zG6eG/Ws7vT3Mc8z3WJnFyLHZt+lxRflZbkFTdcIAW8eQy51WHrIp
         t0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynunebNv3/ClzLadrcGUSHlvKNNIjn4cGACot/T4j8M=;
        b=m/LyjO+tCgzxYygGunyVHDjQdkhLNn2TmN2OYAp2INjBjXHuuC9+drBmcTx2+xy4Ug
         GI/p/KGuD1wxr0/U7i5RgHvK2u9b6dwIwgi70owT3RdCCJn7aEm5M404hZuj7Va9zA8C
         nkF8tmWUv9Ehd8u68dZlpa/Zv75Z+Aw9gjk+T4i5uRSu+GnlUeJ0GbiPx36FSKFtU5uT
         jhLEAeP6jlbf/JA534H6B4NPAPwSWtR4e2DjXojZ0CwOFHS/5+NUPllEZcsz6mRhFExd
         yxnUSGNcOdA8Fuw5JS0xEQ8FAffP8n9ykU8AIpqo4bWkORVCA/XA/s59xVbqYNxPJc+K
         5mUA==
X-Gm-Message-State: AO0yUKU5mB9r+yUyNZ3qJT/1tQuFKLfRrH+8x98CujbuSwTmXyIbPA48
        C7GvG0XdIzGRMx6dz5VO1nsgpQ==
X-Google-Smtp-Source: AK7set9SwbGRjxfDykykr3N6yx3rUtZpATxZQq5gooFFAeKWSm+8pGkZ7Q9DTz8hoFAVZbCwxNxIiw==
X-Received: by 2002:ac8:7f8e:0:b0:3b8:629e:afd1 with SMTP id z14-20020ac87f8e000000b003b8629eafd1mr42115868qtj.53.1676320301700;
        Mon, 13 Feb 2023 12:31:41 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id 66-20020a370545000000b00725fd2aabd3sm10386454qkf.1.2023.02.13.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:31:40 -0800 (PST)
Message-ID: <dbfeb82e7d3854e70a0dc12ab0d36097738855fe.camel@ndufresne.ca>
Subject: Re: Mainline zyncmp vcu driver: support for the video decoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurenz Eschwey <laurenz.eschwey@brainlab.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     Deji Aribuki Ext <deji.aribuki.ext@brainlab.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Date:   Mon, 13 Feb 2023 15:31:39 -0500
In-Reply-To: <FR2P281MB2669449FD1DE98CB047453C48FDD9@FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM>
References: <FR2P281MB28166C9AD7111B3488BCE297A8D99@FR2P281MB2816.DEUP281.PROD.OUTLOOK.COM>
         <20230209135444.GB30549@pengutronix.de>
         <e1bf1a456ef83eeca9ad4dd18c55f7e423105be8.camel@ndufresne.ca>
         <20230210174004.GB29504@pengutronix.de>
         <FR2P281MB2669449FD1DE98CB047453C48FDD9@FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le lundi 13 f=C3=A9vrier 2023 =C3=A0 07:17 +0000, Laurenz Eschwey a =C3=A9c=
rit=C2=A0:
> The decoder does use the same message box type interface as the encoder,
> reference implementation would be available here:
> https://github.com/Xilinx/vcu-ctrl-sw
> We are currently investigating on what needs to be done, first issue was =
a
> change in the interface with the later firmware images, we will start wit=
h the
> older firmware since the encoder is working for that one.

thanks for sharing, I was convince the vcu-ctrl-sw was still private. Note
though, careful with the licence, its not open source, so whatever we do, w=
e
must not copy code from it since it has "to be used on Xilinx hardware only=
",
which isn't GPL compatible.

If this is the lib app are using, the lib_decode implementation seems like =
its
stateless indeed:

https://github.com/Xilinx/vcu-ctrl-sw/blob/master/lib_decode/AvcDecoder.c

On the positive side, we have API for these now.

Nicolas

>=20
> -----Original Message-----
> From: Michael Tretter <m.tretter@pengutronix.de>=20
> Sent: Freitag, 10. Februar 2023 18:40
> To: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Deji Aribuki Ext <deji.aribuki.ext@brainlab.com>; linux-media@vger.ke=
rnel.org; Laurenz Eschwey <laurenz.eschwey@brainlab.com>; kernel@pengutroni=
x.de
> Subject: Re: Mainline zyncmp vcu driver: support for the video decoder
>=20
> [You don't often get email from m.tretter@pengutronix.de. Learn why this =
is important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> On Fri, 10 Feb 2023 10:58:01 -0500, Nicolas Dufresne wrote:
> > Le jeudi 09 f=C3=A9vrier 2023 =C3=A0 14:54 +0100, Michael Tretter a =C3=
=A9crit :
> > > Hi Deji,
> > >=20
> > > On Thu, 09 Feb 2023 10:03:19 +0000, Deji Aribuki Ext wrote:
> > > > I would like to know if there is a plan (or if there is already=20
> > > > have a
> > > > patch-set) for adding support for allegro dvt video decoder.
> > >=20
> > > I currently don't have any plans or patches to add decoder support.
> > >=20
> > > A while ago, there was a bit of interest in decoder support, but I=
=20
> > > haven't heard of anything new for a long time.
> > >=20
> > > Are you interested in adding decoder support to the driver? I would=
=20
> > > be happy to review and test patches.
> >=20
> > Isn't the decoder side stateless ? That could be difficult to achieve=
=20
> > without reference code or documentation.
>=20
> There is at least some firmware running on the decoder. And I am pretty s=
ure that it provides a similar mailbox interface as the encoder that the dr=
iver must use.
>=20
> However, I don't know, what messages the firmware expects. Thus, the deco=
der maybe stateless. Maybe it even keeps some state in the firmware, but st=
ill requires the software to parse the stream and explicitly set the stream=
 parameters.
>=20
> Michael

