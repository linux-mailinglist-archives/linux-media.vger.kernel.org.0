Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6CFF7089B5
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 22:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjERUpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 16:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjERUo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 16:44:56 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B68E77
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 13:44:54 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96f50e26b8bso101770066b.2
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 13:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684442693; x=1687034693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxp/usaVw20e5cr4YAHYGVQhvDy/fYNeFaw790wIOpk=;
        b=VHyuu4CSMDkGakMg4WkM/wF0RvPw/rtrAvZX8raWPvw2JvRPZ/SviD1y7Z9ocx4bO7
         kp4l2zQMthmzz7i6hFdTxpC2JKbSyhCz/3JDVBHUi8U1JaZF5HIPM3Sbl5ACDLS0jUC8
         fUvHL6PQl5Z46BkocMc7+BavaTadgGW+qIatE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684442693; x=1687034693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxp/usaVw20e5cr4YAHYGVQhvDy/fYNeFaw790wIOpk=;
        b=KbWPo6NXUj0xu/Lkixts+MgFfoBQ07BV8Rnk+Mt2dDnKI3GD83qCfmLWqVTXlFqkmi
         w0TJ5ORSynYvpvA8QGS1yVlE7xfEjVkmC6HnMuDWqFHte1XCt3vElNqPQjX3L7JeDtU2
         6gtM+6I1K/J9bTwChmJA6sQgz1VWCiM/JjGYffNZqLREfgUFCdz3QT9EevSL6g8T3JEd
         mHb+EeesYxa0AmGF1JWSKcGDYHx2Q0RnhA0Im17NsvoYENiJhoMEMZjSu+iv4yd+3gcU
         pO8RDC2cQYaT3tw+um9dvY+HjLcD/Zif+Lm1BMX3sMuNPZDwSQoodqIcIbGYEaR5eAQs
         klrg==
X-Gm-Message-State: AC+VfDwb1phBq77Dri6EioQHyBr39xtqHxDbFUl1rwWzq53v2rxumwUS
        azALOnZiCw2KtppM/VUJHcI8X1AP2eN6sCOImDoM9Z9/
X-Google-Smtp-Source: ACHHUZ7vnci2jYZN4VBfoPakygihpQlckkBYUSGkQpXPyg075iRIDQuPzAlnwJ/WE6PNNRCEN1BSGg==
X-Received: by 2002:a17:907:3f1b:b0:96f:48ad:73be with SMTP id hq27-20020a1709073f1b00b0096f48ad73bemr503751ejc.44.1684442693038;
        Thu, 18 May 2023 13:44:53 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906749600b0096f4c9ce526sm615406ejl.225.2023.05.18.13.44.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 13:44:52 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-96aae59bbd6so474521866b.3
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 13:44:52 -0700 (PDT)
X-Received: by 2002:a17:907:3e2a:b0:96f:5f44:ea02 with SMTP id
 hp42-20020a1709073e2a00b0096f5f44ea02mr438181ejc.8.1684442691873; Thu, 18 May
 2023 13:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <ZElaVmxDsOkZj2DK@debian> <51cff63a-3a04-acf5-8264-bb19b0bee8a3@leemhuis.info>
 <CAHk-=wgzU8_dGn0Yg+DyX7ammTkDUCyEJ4C=NvnHRhxKWC7Wpw@mail.gmail.com> <a9a9017cceb65aeca285a06c7b46970788301ce8.camel@ndufresne.ca>
In-Reply-To: <a9a9017cceb65aeca285a06c7b46970788301ce8.camel@ndufresne.ca>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 18 May 2023 13:44:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjypw2PL-w5ZBxY97SgRWd21f2V2Cuyw-ebsiTpSNQjBg@mail.gmail.com>
Message-ID: <CAHk-=wjypw2PL-w5ZBxY97SgRWd21f2V2Cuyw-ebsiTpSNQjBg@mail.gmail.com>
Subject: Re: mainline build failure due to cf21f328fcaf ("media: nxp: Add
 i.MX8 ISI driver")
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Linux regressions mailing list <regressions@lists.linux.dev>,
        "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 18, 2023 at 12:53=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresn=
e.ca> wrote:
>
> I'm expected to be flamed for getting in the way, but whatever. To me thi=
s
> decision lacks any kind of consideration toward who will be affected. Thi=
s will
> hit those that makes the new features and are working hard to convince th=
eir
> customers to go mainline first.

I think the solution may be for those affected people to help Mauro & co.

Clearly the media maintenance doesn't have enough time. I'm not going
to pull from a tree where I know that it then may take six *weeks* and
one whole release for simple bugs to be fixed.

That is literally what happened. And if it had been once, that would
be one thing. But when the same thing starts happening again the very
next release, it's no longer a one-off. It's a pattern.

> Punishment and shame is not something I encourage or think is nice in gen=
eral.

This is NOT about punishment.,

It's very simple: if I cannot trust the tree to be maintained, I'm not
going to pull it.

That's not punishment, that is simply about kernel maintenance.

If you want to help fix the media maintenance issue, then by all means
help. But as things are now, if I cannot rely on the media tree
getting even simple build fixes in a timely manner, then I'm not
pulling it.

Please realize: to misquote Shakespeare, I have two options: to pull
or not to pull. And in order to pull a tree, I need to know that I can
expect any problems from that pull to be fixed.

Would you expect me to pull known-buggy trees? I sure hope you don't
expect that. Not pulling buggy trees isn't "punishment". It's the only
sane thing to do.

And the exact same thing is true when a tree isn't maintained
properly. Bugs happen. That's inevitable. And sometimes bugs can be
hard to find, or hard to fix. But when the maintainer has been sent a
fix, and that fix doesn't get handled for SIX WEEKS, then that tree is
buggy.

Something is very rotten in the state of media. It needs to get fixed.
Until it is fixed, I don't want to take random new code.

The fix *may* be as simple as more testing, and better automation. But
really, the thing that annoyed me enormously was that these bugs were
all found by automation and testing. And still they were left to rot.

                 Linus
