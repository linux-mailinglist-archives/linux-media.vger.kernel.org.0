Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B4F5F73B
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 13:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfGDLbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 07:31:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39604 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfGDLbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 07:31:33 -0400
Received: by mail-lj1-f196.google.com with SMTP id v18so5811207ljh.6
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2019 04:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/jCL0uglLG3waaTjHMMEPQrkGWkmt0TdWEoFBWOcnA=;
        b=FlWM8KZg4oK6/w4JR6ryVfNOOwkP2LxyIlw/zrtDFCha86ABW2dpE0GphJHlCL48RU
         dvxGKRAmwqhokNvIF3jGIS6LOM/DzP2IIyrkJfyzuwKYocpv5Jk7Kvtd2p1WLk1KL5A1
         4waPs3ef5KozWtqKnUMiM1VjV3j3LllDSZOkKayrYfdN+l0jTw6KX5+cieOFWNVqTWRj
         GD/rKXXsjzmpc/Z4KPTp7HZnalk8lmWP716ckWlMMOfTNWJDbUt393KzSJPCqyMbriL4
         vogqE4DpQoRLCpd+2ihZ+y0WVPISfryF9KNUvVC0WQEFBkGZ4b9FnFW2x71JLPhJgDfG
         NSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/jCL0uglLG3waaTjHMMEPQrkGWkmt0TdWEoFBWOcnA=;
        b=qo/prO5cvxs3+f7MlRatblSYVe1XRHPlSNQ43rpgq++j7gIB1AjD4xRJAex6CTx8ia
         q+mLEngemqiv75jdoSSgTD/pQSf7yHRb3W5AG8qLH3frFTeUuUsoDK+1vRWZN22IRpT5
         7AEFoq9t4w7sgNojhRGZ6LjIwzpVS+1aI4GDr+hlfreguPKi+sayYdEOc8nm/PPscEkr
         DVdXI46TqdcDcI8Q9sREOeQ3yPhJ/8wpRJeOK8OTBbdCvQDsmnrpqGz9aAVRpkn1LLrl
         PocnckyxWjt9FyO2L0FIfdZR151wT8dFtFxV8se/jx/VWlq02q6DQstQI2qHlKgysEDF
         mnpQ==
X-Gm-Message-State: APjAAAUcTV6VTT17q0ECEPe7QkBYell9cgGQewiV6Ls7K5uITjuPrQBD
        RFuvcOS/OO6ChoWFEoWvSOawAj+dMEpKn8u5SfU=
X-Google-Smtp-Source: APXvYqzQSJVYWZ1WQTlGONeC9iuDdGMzyYNg0gxR5LtUcfv6gYjoBBPyaV1xsAPx2Py1mqctcg1NVSk7UbAlx9xecxA=
X-Received: by 2002:a2e:970a:: with SMTP id r10mr18166551lji.115.1562239891641;
 Thu, 04 Jul 2019 04:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190703131044.7656-1-ezequiel@collabora.com> <1562232849.6641.6.camel@pengutronix.de>
In-Reply-To: <1562232849.6641.6.camel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 4 Jul 2019 08:31:21 -0300
Message-ID: <CAOMZO5BGr0mV0XtyrLjNqcBsJA07-+8Qdyue3hAC8BE5dF8-dQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5645: Fix power up sequence
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@collabora.com, linux-media <linux-media@vger.kernel.org>,
        Todor Tomov <todor.tomov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Thu, Jul 4, 2019 at 6:34 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Could this just be added to the end of ov5645_global_init_setting?

Just tested your suggestion and it also works.

Thanks
