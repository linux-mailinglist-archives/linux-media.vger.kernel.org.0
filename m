Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FB9CC96C
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 12:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727603AbfJEKqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 06:46:10 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33057 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfJEKqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 06:46:09 -0400
Received: by mail-ua1-f67.google.com with SMTP id u31so2792555uah.0
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2019 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8NBau6UJ6WL2ddYtAYMdA80zmZN/G42WesJCt0Zydss=;
        b=rgjWKlxW9tafdD4yyJKlyJ3fDSeUYo3JZw3SUJ0LHcNajjFT4Wa47p58hsp3+NL64T
         6KBk/fGyySiX5MNzTu6tWQSHsKgdN5WgcaRrbJYdrv24bE1eWk2I8xdAXDbk96a4tosK
         RmtzUENrWXv/rqlDhVEwKMJeogEs5cW+gyDBGsJs35G+95cS4+7qYrqCMpjL0Xjz5xOz
         bME61cVek/zFyDevyHVLeXU6RbY5hjFdbbqKNuRWFzsFcD8TA3iCmkr3nGAYlVns2D7l
         Dyet9QXEy/VF+wDG6WVXCsZYucQag63sGLRjhnkK3PHtGWeca/je8frl4HErW1Z+8dty
         zWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8NBau6UJ6WL2ddYtAYMdA80zmZN/G42WesJCt0Zydss=;
        b=tqLwu8gB2UsWKOxGsinoxrTZJQXCEazB4I6+ijEuLMOE4CahziXjDIida+giM81d7a
         Ff9HXYiWiPg0sipaq6RIbT0jjrn0c2HTnmCRfNvCyRvFxo8rmFAV1WAqlBmTBibfQj/t
         zAKpegxXVgb7ykUcbx+US+xFKjozZ1+iqaeUs03uyNUmBKEc8thA5sqGrRq8WUj+cyAC
         3X5BzEQRMBAxHfiTtAakvxQG/OYFyHMMPZX06e1thMwHLPIlnDRVVnlqsFbA0bLqVy0T
         I+0xGbcaNVk9b8kbR3e9UFEMyt4v5l9eSf0W3jTeNU7mgzq+fwZjJfAEOzmTVJeknEf7
         sb0Q==
X-Gm-Message-State: APjAAAVyhVx9zjeggsOGoZ4J9DZJ30pZHRpdDh7rVHxyITJd9MBnYn5e
        acd7GmuqtgogQ35bvCPzQjhQVRpsZtTe+qJyikIZjw==
X-Google-Smtp-Source: APXvYqxEOr3RSt51beUrP7OY3vmj41VQD6z59rmXEAfyCOygVKLMa/biB9kSbotTKpovb5quSuYbWvEfv8AdENWlImg=
X-Received: by 2002:ab0:7415:: with SMTP id r21mr1893206uap.77.1570272368324;
 Sat, 05 Oct 2019 03:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
 <20191003115154.6f2jgj3dnqsved2y@gilmour>
In-Reply-To: <20191003115154.6f2jgj3dnqsved2y@gilmour>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Sat, 5 Oct 2019 16:15:57 +0530
Message-ID: <CAHLCerNoLyQ-e70=1VMPO_J_amA+-2vtHwfoUabo4dhUWj-H0A@mail.gmail.com>
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

On Thu, Oct 3, 2019 at 5:22 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Thu, Oct 03, 2019 at 04:52:24PM +0530, Amit Kucheria wrote:
> > This new binding fails dt_binding_check due to a typo. Fix it up.
> >
> > linux.git/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
> > linux.git/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts' failed
> > make[2]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > linux.git/Makefile:1284: recipe for target 'dt_binding_check' failed
> > make[1]: *** [dt_binding_check] Error 2
> >
> > Fixes: c5e8f4ccd7750 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
>
> Thanks for your patch.
>
> It has already been submitted though:
> https://lore.kernel.org/linux-arm-kernel/1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com/
>
> I'm not sure why it hasn't been applied yet though :/

Perhaps a Fixes tag will allow more attention to it?
