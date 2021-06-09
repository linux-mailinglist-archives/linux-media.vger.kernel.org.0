Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55383A1472
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 14:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhFIMau (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 08:30:50 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:41783 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhFIMat (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 08:30:49 -0400
Received: by mail-lf1-f50.google.com with SMTP id j20so8425886lfe.8
        for <linux-media@vger.kernel.org>; Wed, 09 Jun 2021 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BTJB1S5ExGvJdJQAtKtn58DjeMYhauL+VWrppub8qD8=;
        b=E4ij39tEzrPsi7ctjyMd9409f+3A11WF+VZm1E+4t6L7I9eXSyw7LJS29D5IDfELU7
         EGnJCxLok8hj7uZ8I/Co81qOr8Bv63xBCmnOUNuXWaofOtbpyxnYbYfZgHJAr8NSwGUh
         WPDKpwMvo6FWjsOUZQPt2Vt+0ymZMmWc2Kdo1aZz8/jSK8H8FirG8v0JgTt2gWC/bKEW
         0tTtyeOlHMC1l6qNH7PBPG9170hnJpZni03Rb8gReC4NKNLjfMTwS54PTI2pv2VkZTIx
         3x5RDqOBfbsU+iZmSdoDqjiup4oEjbpA4q1lW4t3cvZGWlMIXB1+cB/+cT78P5XZvp+F
         imxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BTJB1S5ExGvJdJQAtKtn58DjeMYhauL+VWrppub8qD8=;
        b=MEzo3jDTBgMbRIkh0B9IsZAweMmkJwimHutB/XxMcFvSLktMU0BxaA/hVZKD5VNIov
         fXsaM8yfUpykVchecMtcKHOp2fGbB0ONs2pR8iCeeiaZ9u8CRzSlqHDmrXfBs0JxvvaV
         EUeIKAb0zWpsaxp/EtRG4oa2TxmlZ6QmUPKjM5A46mlBMsFB6cr408M4d2obsaWGSepi
         ubTprU3q4OYqOCdlBMyI8xWAxI54JnbPFyAGSaOT5N1bM+cSMOlLsERxMX2gYboGPatd
         yrHXrxs83anrlVeG6JXX9CVzPHUBBQjUTZeXgMR+vrU0ExYnqoD8oyOq62tSgWLoHSnO
         ES/A==
X-Gm-Message-State: AOAM530FYqdjOlHLTZQJ3KIqUp6qEA/64XDozZXPzsAs/BKjbDYQFyM+
        /NgVnhu+A7yOe9l7szJmyAcSXeFnfI7g5RviUVw=
X-Google-Smtp-Source: ABdhPJzeqqyuxBN+6B+nfjiO733i9lI6qkYhEHwdEwm/swSK+l2Sa+bPMI0pCH5BMAQt5dGT75fzrAU2xqCOT9gLc2Y=
X-Received: by 2002:a19:c211:: with SMTP id l17mr5853489lfc.500.1623241663061;
 Wed, 09 Jun 2021 05:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
 <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
 <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
 <CAOMZO5CxDtPa_WYEJf9dkLa8x1UthicBqB=RBJUgxKud+srsDQ@mail.gmail.com> <a6322fe86be905c028ede9ee2abee278266e1b35.camel@pengutronix.de>
In-Reply-To: <a6322fe86be905c028ede9ee2abee278266e1b35.camel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 9 Jun 2021 09:27:31 -0300
Message-ID: <CAOMZO5CLOYGkWtmAOT=U4r4-eZ92JHsKh7iojZejFtsFZJcaWQ@mail.gmail.com>
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Wed, Jun 9, 2021 at 4:20 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:

> So now I wonder what happens between the first and second time (in
> s_stream? in s_power(0)?) that does put the lanes into LP-11 from
> whatever state they were in before. When you get the clock lane timeout,
> is phy_state = 0x610? Does it stay there when you repeat this again?

Yes, correct. I do see phy_state = 0x610 in the second time I run the
Gstreamer pipeline:

New clock: GstSystemClock
[   24.190274] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000610
[   24.197737] ipu1_ic_prpvf: upstream stream on failed: -110
[   24.204359] ipu1_ic_prpvf: pipeline start failed with -110

It stays there if I repeat it again.

Thanks,

Fabio Estevam
