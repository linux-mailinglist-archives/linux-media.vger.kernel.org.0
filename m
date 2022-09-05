Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D345AD591
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 16:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238449AbiIEO4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 10:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbiIEO4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 10:56:40 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4C613E84
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 07:56:39 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id lx1so17567505ejb.12
        for <linux-media@vger.kernel.org>; Mon, 05 Sep 2022 07:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=q+WiNFy4D/XRGy9nFLXsms8N2vXDiFFW6YaWoNG7ZQg=;
        b=T++vjiei6rfOrl4hR0jLPbCZw2V5iqceCkLtXgTkJA02niZbs2FSOlN5se+y5WpJWE
         BpbHEz3ZB4BBxX6auO25iX0iMX3Zy/vmZvY1obDLZUH0jnpLLxmbLGc74TMqQbgABaq6
         odIc3jXuacFB6UCLadbJ26mIjAVxdKVUkM8NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=q+WiNFy4D/XRGy9nFLXsms8N2vXDiFFW6YaWoNG7ZQg=;
        b=2Oslsf8/3MaTFid9epUfVmsgp/9Jm10oGNfDCDlzTbGTJ5cRJZBCL+C1rs35qGmkYh
         dMHhTqO6KksQ72geDB/IcgHuUGJIj34tD55Q7gJlo+jmMIny3N6C/uZac9MmhvQIwLB2
         +XC050SUXqzKGZzMjVFaLi2niA4WMROpsuc627vyT2dRYqwpG/HJdx2uIT9BszU8p/RN
         ahBtgLCrSmg3r4Y8+VOLE4F7BfPxex3SdPeGrbaKKEYQIr4Aa6gO67U//SgMT7kH7U3W
         z8+Z0j3p6APx54v0IDTKF8ZWd5jUJnwYftt8lZStqyOEI/k702chtnUoMYa+lMTaEBod
         91Bg==
X-Gm-Message-State: ACgBeo2fSlyHIDgrArLTxWhaUo044CbA+rvwCqEm9/cUubcvuqpPCr0L
        tUhzJYqG9jbAHtmBKv7zvPOzuOazdpLtwg==
X-Google-Smtp-Source: AA6agR4H7NIQggJWPtszoiqbbwwUquvVvDoNgerPfFN0+l2Nxplm32vbkeF2/FqyklWvM/RXcARXbQ==
X-Received: by 2002:a17:907:3e8b:b0:741:9b21:f2a5 with SMTP id hs11-20020a1709073e8b00b007419b21f2a5mr25142170ejc.320.1662389797495;
        Mon, 05 Sep 2022 07:56:37 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id by12-20020a0564021b0c00b00445e1489313sm6527384edb.94.2022.09.05.07.56.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 07:56:35 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id kk26so17571821ejc.11
        for <linux-media@vger.kernel.org>; Mon, 05 Sep 2022 07:56:35 -0700 (PDT)
X-Received: by 2002:a17:907:2cc1:b0:73d:c2d9:3232 with SMTP id
 hg1-20020a1709072cc100b0073dc2d93232mr37011376ejc.763.1662389794946; Mon, 05
 Sep 2022 07:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com> <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
In-Reply-To: <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 5 Sep 2022 16:56:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCs8hj3h-Th0Hwo_Pjt1S428eUuuRwJRvnMNN0s7S_4W=w@mail.gmail.com>
Message-ID: <CANiDSCs8hj3h-Th0Hwo_Pjt1S428eUuuRwJRvnMNN0s7S_4W=w@mail.gmail.com>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good initiative! Thanks for organizing

On Mon, 5 Sept 2022 at 16:44, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > 16:45-18:00 Anything else?
> >
> > I think it'd be great to have a GPG key signing party at the end of the
> > meeting.
>
> It's a good idea. Could everybody please send their GPG key fingerprint
> in an e-mail reply to prepare for that ? It can easily be retrieved with
> 'gpg -K' (make sure to pick the right key if you have multiple of them).
> I'll start:
>
> sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
>       94231B980100EC619AC10E10F045C2B96991256E
> uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ideasonboard.com>

sec#  rsa4096 2018-10-19 [SC] [expires: 2026-05-20]
      9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
uid           [ultimate] Ricardo Ribalda Delgado <ricardo@ribalda.com>
uid           [ultimate] Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
uid           [ultimate] Ricardo Ribalda Delgado <ribalda@kernel.org>



>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
