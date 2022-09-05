Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1AEF5AD5C2
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 17:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238243AbiIEPIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 11:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236214AbiIEPIs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 11:08:48 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E077357888
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 08:08:47 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id x73so4750313ede.10
        for <linux-media@vger.kernel.org>; Mon, 05 Sep 2022 08:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5JiPij3F0H10AuGHLZK/89u6sxMPBzVGQjEQ/EzGsVc=;
        b=HdbI+xz0tB7zEg0N+I5sxCSbSDZdf2xC92M/GpYnsznk7fJrkMrn3SXb0noe8CQFF8
         79MONFDtZ8GqeB7qiGvlvDievm+xMU9me8AdNF3LAsdb/skxpGSJROoxq3tq+wvf4+i9
         RXpgf3fPzXMz9AOSNgGaoS4KxkPCaljp7ZGaXiFnrx4lE2I06Usi1xY54A6FwJwvqXLL
         WpeQkc+/l/DcCfCg1a3lBuZgt+ufboUzjqIVz8hc1g0TONIh+esYWlzpHNGPwVZboRHH
         aQ86Bk2hs4bvQzoyUdrxA1K4ReV8JU8cSc0V/PfskpvmoE/JpguonKsSu0LpVwzG/PPq
         u/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5JiPij3F0H10AuGHLZK/89u6sxMPBzVGQjEQ/EzGsVc=;
        b=1nvLAS9PJaH7Te+sZZcOfiAMUJPloTjG0QOD2Sb9IkQcfjtSBKE9W9/9I5xFyoZFH5
         pEpROIvkE2aNyqL66VnPJgyk6oSPOQAbxcMPvF4GjjKbeh6ZJchJKE8zMRudmTNcPx/T
         +UkvZ1F/gJ2+GqZintpOMyRD3uhL5SjFC1V/qS84c81Abl1Tcn2xrNOhrAkSpl7T+d9G
         BBZI359UYXZInvo24k4WPrGNVcjuLV3cXL+c2LfpsEEpB0X0PuI7Lwh/KmNz3ygdQ9WM
         dtNg79Rxs37Sgq4H7lXvxetuOSBZFfEY6cpMgeZYQQUj+MyUF8N4ueich7jOSC0hpQJ9
         ihbA==
X-Gm-Message-State: ACgBeo1tKqZwgrwWiXdnrGksKVflOKqBPTBPGFgeL1IzB5KfDuj9etVY
        xBcQ8H/169AfJvzwpH10ugM=
X-Google-Smtp-Source: AA6agR7kgkXd6QYgUJ1cbGZaSMZhKTVb0ParQx50Aztp7EYm/5EuncTCmZ4vJJi/nrFR6wkBC0Ncsg==
X-Received: by 2002:a05:6402:2b8b:b0:43a:5475:f1ae with SMTP id fj11-20020a0564022b8b00b0043a5475f1aemr43507448edb.363.1662390526433;
        Mon, 05 Sep 2022 08:08:46 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id d16-20020a170906305000b0073dde7c1767sm5247081ejd.175.2022.09.05.08.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 08:08:46 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
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
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
Date:   Mon, 05 Sep 2022 17:08:44 +0200
Message-ID: <2644400.mvXUDI8C0e@kista>
In-Reply-To: <CANiDSCs8hj3h-Th0Hwo_Pjt1S428eUuuRwJRvnMNN0s7S_4W=w@mail.gmail.com>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl> <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com> <CANiDSCs8hj3h-Th0Hwo_Pjt1S428eUuuRwJRvnMNN0s7S_4W=w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 05. september 2022 ob 16:56:23 CEST je Ricardo Ribalda 
napisal(a):
> Good initiative! Thanks for organizing
> 
> On Mon, 5 Sept 2022 at 16:44, Laurent Pinchart
> 
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > > 16:45-18:00 Anything else?
> > > 
> > > I think it'd be great to have a GPG key signing party at the end of the
> > > meeting.
> > 
> > It's a good idea. Could everybody please send their GPG key fingerprint
> > in an e-mail reply to prepare for that ? It can easily be retrieved with
> > 'gpg -K' (make sure to pick the right key if you have multiple of them).
> > I'll start:
> > 
> > sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
> > 
> >       94231B980100EC619AC10E10F045C2B96991256E
> > 
> > uid                   [ultimate] Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com>
> sec#  rsa4096 2018-10-19 [SC] [expires: 2026-05-20]
>       9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
> uid           [ultimate] Ricardo Ribalda Delgado <ricardo@ribalda.com>
> uid           [ultimate] Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> uid           [ultimate] Ricardo Ribalda Delgado <ribalda@kernel.org>

sec#  rsa4096 2022-02-11 [C] [expires: 2072-01-30]
      A8BBA340E0940BC408AA839A76691E98F228D396
uid           [ultimate] Jernej Skrabec <jernej.skrabec@gmail.com>
uid           [ultimate] Jernej Skrabec <jernej@kernel.org>

> > --
> > Regards,
> > 
> > Laurent Pinchart
> 
> --
> Ricardo Ribalda


