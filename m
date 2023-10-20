Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E247D092F
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 09:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376382AbjJTHH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 03:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376379AbjJTHH1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 03:07:27 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82A51A3
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 00:07:25 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7b7115a3e7fso211777241.3
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ribalda-com.20230601.gappssmtp.com; s=20230601; t=1697785644; x=1698390444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IK/RRLIe/hxouNAb6WRUSJAoLaakncyrIiV6V98QQKI=;
        b=NguvVG5dx0lNLMlr7mMtDVVSA8/sSOkTrJowaBy3yszIxYCY07Iybrue0tU3wXDjmZ
         UZlsrxe4b64OAxk18pb9gmvmHdwrKeQgDIL426ojnLRNhqM98zPzoW7rbJ/SHONQhQyk
         WYqlbS6xD4Mkx1HCig2JckzVJ3bMXkiOJYUbulue1CjzK8O36SwloX9EKqcEoAJLOk1Q
         B7J9PnsVBg55SdMuLaStB0l1XsDFGuFF006VVEota4p7jmzyYx3ThIwax1W+kFnDwlyi
         Snz9ROfYeBRAh+xEqQqN6pz5h1p/vgSXBEbhBSaYMdDXyc08EsEjBluMkM76W8l0ICHH
         EWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697785644; x=1698390444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IK/RRLIe/hxouNAb6WRUSJAoLaakncyrIiV6V98QQKI=;
        b=uzvyeE740WwHy9j+VQ+LkrIzhrH+xE4HGNTvNAXQnl8uyQZaiPc6sBkksu0cI19xs0
         QLxwSy+xEG4mMPQASF2du8UeYewYYaJhcVqLdAJ3zCQVbSo9oRaz1QlTKb0BATnmQ+Au
         EWZHVEjrvVUwWjM/vEti7xLl+h9mItZuiwgSd8fwVsezQJEV3mM4uUjC+3DDjX0/lEyI
         wQ2fXrrCZ1IgetVrC8zrVyqAPEQmZcXGGdTqzBU2c817gcyekOFal2yTeJZSygfGKLAT
         4eftzLpAItrhQ+/Tlm/SbexmDw+5yQVR+1MJ+/KFxaehNVHNwu7KPJ2uNpGdHGiujaTK
         V7hA==
X-Gm-Message-State: AOJu0Yyh3VADT4hFoUPV43WPqMOAiexecXycz8U7nU9tdqSowLly2hbp
        qY6/QwOzbw9ynkF0N8nsYnoHq1ET/J9LPYtoqck=
X-Google-Smtp-Source: AGHT+IHwedZcSTkTkyuvrhnuFTc6si00SQBdws5F0o+vGeVbzExXogCrZ3BGXFV3w6kcFxuws7N3lA==
X-Received: by 2002:a67:c38f:0:b0:452:4e56:5e19 with SMTP id s15-20020a67c38f000000b004524e565e19mr1139534vsj.13.1697785644565;
        Fri, 20 Oct 2023 00:07:24 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id bi15-20020a05610234ef00b00452539f5ea8sm142336vsb.19.2023.10.20.00.07.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 00:07:23 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-457c4e4a392so178399137.0
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 00:07:23 -0700 (PDT)
X-Received: by 2002:a67:cb8c:0:b0:452:67fd:e5c1 with SMTP id
 h12-20020a67cb8c000000b0045267fde5c1mr1077449vsl.4.1697785643505; Fri, 20 Oct
 2023 00:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230920125939.1478-1-ricardo@ribalda.com> <ZQruPPVjqbWXAGmL@valkosipuli.retiisi.eu>
In-Reply-To: <ZQruPPVjqbWXAGmL@valkosipuli.retiisi.eu>
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date:   Fri, 20 Oct 2023 16:07:07 +0900
X-Gmail-Original-Message-ID: <CAPybu_04iU75nFm3Misv9qQajzGKu9jmLvTX2nwsLn3AAZcdtg@mail.gmail.com>
Message-ID: <CAPybu_04iU75nFm3Misv9qQajzGKu9jmLvTX2nwsLn3AAZcdtg@mail.gmail.com>
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

@Laurent Pinchart

Friendly Ping :)

On Wed, Sep 20, 2023 at 10:06=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi>=
 wrote:
>
> Hi Ricardo,
>
> Thanks for the update.
>
> On Wed, Sep 20, 2023 at 02:59:39PM +0200, Ricardo Ribalda wrote:
> > mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenght=
s
> > for long long ints, which result in some compilation errors.
> >
> > Lets add some castings and inttypes macros to help the compiler deal wi=
th
> > this.
> >
> > We have to use the castings, because kernel types (__u64 et al) does no=
t
> > seem to be compatible with inttypes macros.
> >
> > Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
>
> It'd be great to address this in the kernel. The kernel UAPI integer type=
s
> have been around for a very long time so there could be issues in doing
> that, too.
>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> --
> Kind regards,
>
> Sakari Ailus
