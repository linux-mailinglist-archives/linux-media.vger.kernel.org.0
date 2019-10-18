Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A660DCEDD
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 21:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443162AbfJRTAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 15:00:25 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:37559 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfJRTAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 15:00:24 -0400
Received: by mail-lj1-f175.google.com with SMTP id l21so7272736lje.4
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2019 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RlgWNGxnefi9SWNBTt8xIN+WQ90NbQg19ikMJx+vDlk=;
        b=rcGCfi/e/gtbU9fRd5tWiD6fubxQCjUN/lRkMUouhyoZNU88OjfHVN+mbu1sxcWMEA
         yyKgcNmuQvjHMygozlKEFCIEy9TxhhWyuvyMTNc9VF63byVL/rJIrlQgdMGLni+YDpMS
         qZy2vjbjd6e/ANZp07y90Lw31wrvQX7HV/43RpDL0XHXfYTq/absirogv0cTjUySp5Ou
         7SQPYssXJHrobpH2KG4Mm/kJ35luKqHdcFOuqLSbzumUZ6P4qU5bcFSNm3AlDErlbSAK
         Jb4h+8KvG2GDOljXVJueyjaFcIYC+fYNvNjviebUeQjlGbNbe7ZofNje5IDK4k0GUEjK
         7ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RlgWNGxnefi9SWNBTt8xIN+WQ90NbQg19ikMJx+vDlk=;
        b=DVhc5Ptju/zPLjSfSaC6Y2g8JrN79fzZeWiD2Ee/boVQ5R4J2m1mjL6MjGmpQlwCRX
         aERlcOq0Pr98dVTu+p8MZGaWz6pB/m8cHD0SzG5CMXzKVK3PMfD4a5ql/V72DsT4rTlY
         lQnOSzepr/XTwQ0WuqYYakVB3pZR+KD3U9McgAO6OiQh4nX7Yj8LdJAeSzf/HY2liMIg
         E6oRpY67/LwanZwmouQERfBA3AZ9rDGotqcgYMIiZ8vbYNs0Emg4g1bFKw/YV5kbFITs
         l3fHx6JwKyBfjmutDuv++34dFPFKkkwn/PCT8d+SXv6XTOZUy3YWm9zEfhPp17JSYX9H
         Iw/w==
X-Gm-Message-State: APjAAAV8Tv3VmYBYZsdnGQeKty0lmZ79iTml9vyCJZrvQXeMDpzs5CXJ
        fDYrpQ/rgYdYKDUzxnAYAcowrAKCDJzq7MQGWR0=
X-Google-Smtp-Source: APXvYqyrpKPJQhMb21OUcuJQTFhhbGjyreHnhWPmxA0LsNCdkLHgC5r7GqzAQHBtudg1KLxJuXskNfkhTDgAmCAASHE=
X-Received: by 2002:a2e:9205:: with SMTP id k5mr7232420ljg.202.1571425222584;
 Fri, 18 Oct 2019 12:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLQkJ=4kh+a9jcMu6DXxET5BHxz6vV1GjHkEq5LcmiiRA@mail.gmail.com>
In-Reply-To: <CAHCN7xLQkJ=4kh+a9jcMu6DXxET5BHxz6vV1GjHkEq5LcmiiRA@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 18 Oct 2019 16:00:13 -0300
Message-ID: <CAOMZO5C2O59PJAgAvNOVDP3=Nzzyp2fRRUDa2rnY7MbESXRmOA@mail.gmail.com>
Subject: Re: i.MX6Q + ov5640 CSI-2 Framerate (on 5.4-rc3)
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

Adding Steve and Philipp in case they can help.

On Tue, Oct 15, 2019 at 1:52 AM Adam Ford <aford173@gmail.com> wrote:
>
> I have an i.MX6Q with an ov5640 connected to the mipi-csi2 interface.
>
> I am routing ov5640 -> ipu1_csi0_mux -> ip1_csi0 -> ip1_csi0 capture.
>
> I am trying to go through the steps to attempt to get 60fps at
> 640x480, but the best I can appear to acheive is 30fps.
>
> v4l2-ctl --all
>
> Streaming Parameters Video Capture:
>         Capabilities     : timeperframe
>         Frames per second: 30.000 (30/1)
>         Read buffers     : 0
>
>  I have tried setting both the ov5640 and the ipu1_csi0 to 1/60 without success.
>
> Can someone tell me if it's even possible on this platform?  When I
> stream the video to the HDMI monitor, I am only using 3% of the ARM,
> so I don't think it's processor limited.
>
> adam
