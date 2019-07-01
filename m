Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087D45B7ED
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 11:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbfGAJUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 05:20:47 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:36103 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbfGAJUq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 05:20:46 -0400
Received: by mail-wr1-f50.google.com with SMTP id n4so12960747wrs.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=LLSPtTGOVlJaor/0jN6EAnEXPPpZwf3JG+8NK7WSmNg=;
        b=flBbXznqWuxBEEhd2zGJVlYqg3tybEH3Ost+2aLX1B5Z/sLXFIKeAdYC80yTSgrYt+
         5IuPdTTe0RvgoeCeU5zEUhaBu9/kcJGrwfaz/D7S/S9CSJQuLTs5WSZidmHLGlASDOC9
         INfViy7cZc47+r1KDBNchFbJcRhVgKjzyR3x2iQCw26Ju9pl25qVxvRBTJhIwHbt2Hoe
         d8102aEDMq/ylyBVTzGFozzh+J+7R3Cmwsx4/9wVpmRiyVvNVhIywm1V7QmxxcBIEvZf
         QySwcdGlofKkgNQ4Ei1PS4hSXUcFD2A/qDZj21ZcF2PJWGV7krmYu7X/tWbpazdLgkcR
         jIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=LLSPtTGOVlJaor/0jN6EAnEXPPpZwf3JG+8NK7WSmNg=;
        b=U5Es8A3iql24zw/QqG3t/RheKL2nudSSHywgYSeaIKLUVHMqaJwz6DFZBfcqWPA8G3
         zazwF3Owg2zPt/bfFP1akjd9TenWdZHjgsH46j6K4o96PSiCeZODLLiQrERR2rcz+fvI
         ylLJSviVibID8aNZefco5f95K3GefTPHdRb285hJojDYcr3JEPVPP7HmQrhxdUQ00b/W
         O7W7epMDvXwwIiFCHeAmqGfYsePVFk8625fInuEUXcv2wDdgH6IghjbzoXBAfYlNZpji
         v30dUZR7aGWpiZHeNml8oqGUVbQI29xwAKeANNw1GnNJAUXvwlvrFI1e1IjYUGtU+uJE
         ZdAw==
X-Gm-Message-State: APjAAAX6OzWhJnWrH6+aM1yT8CA1BUy+wsFH4DKFBKOIvWKfM4oEFY6T
        JnXfo9sFocZcVsKTYxPXnPsCmMpB
X-Google-Smtp-Source: APXvYqwNjSbcLevTuoNkJermO70qJVoc+I9NWr9M9iMMyaWGIxih5VOc+gCoVsHlIfXlVQF6iGXqfA==
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr16930300wru.161.1561972844387;
        Mon, 01 Jul 2019 02:20:44 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id i16sm6335843wrm.37.2019.07.01.02.20.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 02:20:43 -0700 (PDT)
References: <CAOMZO5A4zhpxf7PQV17vpi43M743Q0R5+ONpSc05-fxFbQDG0Q@mail.gmail.com> <CAOMZO5DktjDM-YE7g-bu+DgOZT2SA+FAta_cj2PZV0SLbiXK3g@mail.gmail.com> <20190629091239.yrjyxd56imytvedg@valkosipuli.retiisi.org.uk> <CAOMZO5BW3WJyKY1EnSFBstv_PehPJfHXDgyRqE4Wrxec_pzkyw@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: Setting up the links for imx7-mipi-csis
In-reply-to: <CAOMZO5BW3WJyKY1EnSFBstv_PehPJfHXDgyRqE4Wrxec_pzkyw@mail.gmail.com>
Date:   Mon, 01 Jul 2019 10:20:42 +0100
Message-ID: <m3r27aglg5.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guys,
On Sat 29 Jun 2019 at 12:42, Fabio Estevam wrote:
> Hi Sakari,
>
> On Sat, Jun 29, 2019 at 6:13 AM Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
>> What does media-ctp -p say?
>
> Thanks for this hint!
>
> I managed to fix the media-ctl failure by looking at media-ctl -p output.
>
> Documentation/media/v4l-drivers/imx7.rst mentions "csi_mux", but
> media-ctl says "csi-mux", so I needed to change it to:
>
> media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi-mux':1[1]"
>
> and then I see no errors after the media-ctl command.
>
> I will send a patch fixing Documentation/media/v4l-drivers/imx7.rst .
>

arriving late to the party. Thanks for the fix. yup, there is a
typo in there. Thanks Sakari.

---
Cheers,
	Rui

