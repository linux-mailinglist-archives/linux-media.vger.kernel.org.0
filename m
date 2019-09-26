Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 796EFBEF8A
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 12:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfIZKZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 06:25:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36793 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfIZKZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 06:25:53 -0400
Received: by mail-ot1-f68.google.com with SMTP id 67so1539163oto.3
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 03:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9205qtO5rgO+Mc9mMWRmhXHMcT/ZxeEQONhYJXwNaFs=;
        b=X86fH9V2DVlPhvWYrbe+2r19VAvs4Q6cIpB3ow/EzWzFTuRjdkwM1P+3yVX7m0dXfz
         mYBLMaMtyUbUcb/pKse2TYF1laYEwyA5PrkpQpv0rmiwbti/pnD95GjXz760bY/y9Qda
         zPWItmBuQdorrk/MGXYHBM9JBjwUpCU2asx2For15sW8QRibFTqThWHMs3cvA1AegbWl
         LyrVfMFtnU35/Fb8KniUzrY2DCghBQMF+1fI5keGq4muislTj4UmXZPiiEuNsSMRZY2D
         7DggiuuaDI6v7A3Iq1vjpB9GaSycegx4lSAneKheu0gJyUcrMpuLGFG+xSkXtqG9FunY
         Ojfw==
X-Gm-Message-State: APjAAAUrELDh8yJYhSPeSvuLL7jgDapnzm0J5EQPcI4+g7N+fP3AmrgE
        oUzpSivMcsHssc+0upAEJxRkpVfBi96GCyB2V0Ss/Q==
X-Google-Smtp-Source: APXvYqwHxy2CYz+AYJ5n9ZsnqqBlqfBnV5GpDthBdqi4SizNdhD/pAKBLd8d7hDV5Sa3/oi6FfEcqewcyRUD0Cc8bps=
X-Received: by 2002:a9d:193:: with SMTP id e19mr1917568ote.107.1569493552703;
 Thu, 26 Sep 2019 03:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com> <20190918105728.24e7eb48@coco.lan>
 <20190919065447.GF2959@kadam> <5d71311232fd6d4aa0fab038512eab933c13a722.camel@perches.com>
In-Reply-To: <5d71311232fd6d4aa0fab038512eab933c13a722.camel@perches.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 12:25:41 +0200
Message-ID: <CAMuHMdUcTKFmfFm_S+PXWVeS=pnFag832_W7asyvZ+TxP1yGAg@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile documentation
To:     Joe Perches <joe@perches.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,

On Wed, Sep 25, 2019 at 7:32 PM Joe Perches <joe@perches.com> wrote:
> On Thu, 2019-09-19 at 09:56 +0300, Dan Carpenter wrote:
> > When I sent a patch, I use get_maintainer.pl then I add whoever the
> > wrote the commit from the Fixes tag.  Then I remove Colin King and Kees
> > Cook from the CC list because they worked all over the tree and I know
> > them.  I also normally remove LKML if there is another mailing list but
> > at least one subsystem uses LKML for patchwork so this isn't safe.
> >
> > So the safest instructions are "Use get_matainer.pl and add the person
> > who wrote the commit in the Fixes tag".
>
> Maybe add this:
>
> Add the signers of any commit referenced in a "Fixes: <commit>" line
> of a patch description.
>
> ---
>  scripts/get_maintainer.pl | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)

Thanks! I gave it a quick try for my first fix after returning from ER, and it
did the right thing.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
