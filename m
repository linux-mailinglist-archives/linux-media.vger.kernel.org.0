Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB64CDEED
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 12:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbfJGKPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 06:15:42 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43925 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727515AbfJGKPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 06:15:41 -0400
Received: by mail-qt1-f195.google.com with SMTP id c4so5627542qtn.10
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TPPLQMuSu6DR9UAe1OhqK+m80xjV6LV1hWWVroNGqFA=;
        b=yB66vCs9Cik40sq835uj1MsY4wHAqv5W8JjN6PqW7YOH37xxQvXNWCYj41Pho4+PyR
         Y8DPckhhbr65rHf2nq0tuBTpSkDiSelP9Ho4vmy4RNWO/f36hfoiiAi/rKqbVx4PxHqI
         /aFTmZqUvm5vBF5P1HQSM4gD+dX0vfNdztWaw1JAzeanpTheKMOhh2JFMEQi13dSplrs
         qBvxjE7VsF3lNz/2fz/R6DcQQ3QuOmUMKjViFgerYx35CBcfWsCmiBehrtLh7ScyCuAf
         XhTUPuQvDaHL9Oht8yH+T0z4S7TWsiPlo6KbJQu85g9YSq8FQ5bo5vuxRpBTICJT+Ybn
         8Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TPPLQMuSu6DR9UAe1OhqK+m80xjV6LV1hWWVroNGqFA=;
        b=MOfbkoAk19sqpfkqoZNTnaM457H5drjTNZBQE0VdldRb+5y83TeyB9qtYpn3oPkWF2
         cVt/mlDsmRvpMnHEyPl1SmwOcmwqNLj8uihRJdRH6ka55urVbst0CvDKRU2+MBSBNajh
         V1hZvDPcVRVOfRSaVaCxUhB0MHwme6jm8QoeXdFHZiDvxQr94DJz+EEWVQGT72awHdm2
         OgjqmqN+M4GbB9OE09x5bWyAQlfuJX5QLltzZbmQaQSqs6paTp3ERa35/AjdUZwV2GD/
         8Wb8yPcA9EjEwrwQORVU+4JBLnyXUdgzSOB8BL9Aq01PqH/J9/6N4ZhO4PALvMSDm0I8
         4A1Q==
X-Gm-Message-State: APjAAAUDphe18dOE5yH31VHU45Bcg5v7T4673Ug2Em6OEHprCPpUdNZ+
        az6YAiO7pGjPQd9a5y63ii4Bjy8ufnbnTrw58nOgpQ==
X-Google-Smtp-Source: APXvYqyZ4UyJ3t8dKx1SfpG2DFjuSl5vNOC9Zb/ShAXmbBH8Ty9mfsbxI21wvZIfUh7XqPmc4q6jEhWPHz5Zh8JLkxk=
X-Received: by 2002:aed:2a3b:: with SMTP id c56mr29991747qtd.343.1570443340311;
 Mon, 07 Oct 2019 03:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
 <20191003115154.6f2jgj3dnqsved2y@gilmour> <CAHLCerNoLyQ-e70=1VMPO_J_amA+-2vtHwfoUabo4dhUWj-H0A@mail.gmail.com>
 <20191007100535.6gp6b3h6ueyeln3b@gilmour>
In-Reply-To: <20191007100535.6gp6b3h6ueyeln3b@gilmour>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 7 Oct 2019 15:45:29 +0530
Message-ID: <CAP245DXT=HL+m-LqoC25EBnOaPmF1pUW0fEZp6EZB-MdgOJoWw@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: media: Fixup Allwinner A10 CSI binding
To:     Maxime Ripard <mripard@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 7, 2019 at 3:35 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sat, Oct 05, 2019 at 04:15:57PM +0530, Amit Kucheria wrote:
> > On Thu, Oct 3, 2019 at 5:22 PM Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Oct 03, 2019 at 04:52:24PM +0530, Amit Kucheria wrote:
> > > > This new binding fails dt_binding_check due to a typo. Fix it up.
> > > >
> > > > linux.git/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
> > > > linux.git/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts' failed
> > > > make[2]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts] Error 1
> > > > make[2]: *** Waiting for unfinished jobs....
> > > > linux.git/Makefile:1284: recipe for target 'dt_binding_check' failed
> > > > make[1]: *** [dt_binding_check] Error 2
> > > >
> > > > Fixes: c5e8f4ccd7750 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > >
> > > Thanks for your patch.
> > >
> > > It has already been submitted though:
> > > https://lore.kernel.org/linux-arm-kernel/1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com/
> > >
> > > I'm not sure why it hasn't been applied yet though :/
> >
> > Perhaps a Fixes tag will allow more attention to it?
>
> I've added a fixes tag and merged it through the sunxi tree.
>
> Sorry for the time it took, and thanks for sending that fix!

Will it get merged for -rc2?
