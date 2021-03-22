Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 713A03448CD
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 16:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhCVPIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 11:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbhCVPIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 11:08:01 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0E9C061762
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 08:07:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i26so5984395lfl.1
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mg1bvxC19ldGtKzwsr6LQnpMK6Mw0R2LBTz1K+uGy34=;
        b=sNMkWt7PtSyL2JudvzV+P3BxhqPvNqXT4niTG4W6Iq3q62z7mSWbXP9ehrxPQsO7+8
         9kCgHNYRwuIZVCP3qVZvVmyazMw9/QgVdPGod6sBKv68uLve7eowo2WyfIM5JW8MBxtS
         PBOl5f6O8857ofxXHJIvAkfwh+YtIMAqlFAdpfn81QMvkHUtqkTGExX0kn6jviIrxVSk
         cD2BAxGTgf8CqaIDnCmNVhm2ZZY+uRoImHvVEfufIl5oLnsw+lylyCxXW2jkLJnjaX2a
         6ZF1FtodmSShJpaw2xcJr5GpZmT4HqcDug6M9vSSD90wWWO3qdWJvnRdpukcb+IQx4BJ
         Ot4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mg1bvxC19ldGtKzwsr6LQnpMK6Mw0R2LBTz1K+uGy34=;
        b=K3x1gidUlK3JQmmQJ5iQP388LbU9mx4EtR3fLdd2i9L+v1begNGhJ34Ytonkgb41cu
         G4jm2xo7k6Dp/35GyBvhDKWfOp84Q5Gs8aBvRpExIiQnOusqu5iq4yVmoClnphsrG4T2
         x6bikXHsJ1L+hAhSLIbKTmmxNlZv+LqS1j5J9in7jPncu5dWEM4KTMCLO6BqsiscRMKu
         Sg9CXtRWcA3p72gieckHWE+NJgXR9HoCUp3jmTI8FM+6BCDQyoGcueVWCI0YiTOVYFpz
         gR5kvG0xeNoHDTfafH2FZAwh6icM3EOiX/4kj86JbaPU53C/PMNQhTGJlsoTZd+Hp4h2
         wUFw==
X-Gm-Message-State: AOAM530WHubbjuoZjmHp2YQ7IQU0U4IQ4Reor5nIBK6os14yIcT6eLNP
        oHP3djHaTJrJbKScvCjiWDdM1bhZ1lmB885FQng=
X-Google-Smtp-Source: ABdhPJxDi5GGwzBDX+fRV6Gu6UfLTmRTJZn8AhDEIZfkBkkYlh1IiOCJMuT9geRRBOZrE3uiPqrceE6x+/OMcaLIHQY=
X-Received: by 2002:a05:6512:1031:: with SMTP id r17mr9102105lfr.583.1616425678227;
 Mon, 22 Mar 2021 08:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144408.31461-1-p.zabel@pengutronix.de>
In-Reply-To: <20210322144408.31461-1-p.zabel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 22 Mar 2021 12:07:46 -0300
Message-ID: <CAOMZO5AJ6G5bb5CwyK12kOFw7byfvngR-6-fYU7goVNq=AVCzQ@mail.gmail.com>
Subject: Re: [PATCH] media: video-mux: Skip dangling endpoints
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Mon, Mar 22, 2021 at 11:44 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> i.MX6 device tree include files contain dangling endpoints for the
> board device tree writers' convenience. These are still included in
> many existing device trees.
> Treat dangling endpoints as non-existent to support them.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

With your patch applied, I don't see the video-mux probe error anymore:

Reported-and-tested-by: Fabio Estevam <festevam@gmail.com>

It would be nice to add a Fixes tag too, so that it can be applied as
a fix for the final 5.12.

Thanks
