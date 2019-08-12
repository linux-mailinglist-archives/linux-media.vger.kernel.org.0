Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00BE89906
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 10:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfHLIxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 04:53:37 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46733 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfHLIxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 04:53:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id z1so103858602wru.13;
        Mon, 12 Aug 2019 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=seSi3n95uUD8W4p/6j5kcYSqF/k8upBA9PgsWMWJ7bo=;
        b=gL1S3cqaH2kcFGJ+D0mmDlLbZNLWmyvKbnXOS3cN+w2qXfmjF6ORunVFU3P5LrNb4v
         2fG8te6m8bi+vV6geLz39oHTVCPBZNrtBu6kQHNo9wVxIHuLfcRiSQVjbM5Ukyk4cTTl
         RG6IJtRV79vTLhpLqOLTf6hkPxW52XEBx8UAYsF5HW9CNh2YlIusPHzj/PK5mQDnPoL1
         92pQgCtFLsWx29TEhrMOI31ucZ21t1AhMzZpSDk9/vBdot2fzFHDur6+vOLzfu9jfiMs
         42ZUHIs0EjQu3InmSY0/l8XH35Q2XuNCmvMjBGtNnlUwQuNuqjcZsM9/SPRLaNyDUNQ0
         zYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=seSi3n95uUD8W4p/6j5kcYSqF/k8upBA9PgsWMWJ7bo=;
        b=B9UmRfsXX7jGpEb5guAXQZVyLl6bF5UIQ+lrfnl9ZlAKUdCsPaOlR/w5ypmWubdwXN
         DfBim6JofAayAJdLJNURawmjAsrh5Sb2lGT6kpit8fDBhZ8Lf9odEGv9dbhrE9iA20X2
         8SAGu4ug9HdJDnU+0CZiKdCawrn20dqDOFFgv2rHzCsM8Ift8913HJiDDMsDc4lkQUv5
         Wnuk5tWcRfrv9wTDvzDyLxzW/52FHBvVVNJ5/MO09GBz/BC+OMpY/m2+GT+xYzfp6Uqr
         81a5TKVUlcxL4kb5UhbFzxpsmQPaEkyZ8HqGOeT/qJ/ScSYWH3SJnPwn+DX7ProPymrF
         oYbw==
X-Gm-Message-State: APjAAAUy7Q39ixxyfs7bI/geuGuOsO887oO6Jy13NKvMf0i5WO5NNO2C
        WdGkdsNgkQF2RhVs/+pWqxccytQJ
X-Google-Smtp-Source: APXvYqwdVmUaxgGtGQM8j0YJJLJuWAoTqInIoMHALirw91ZoA/TbTRW80piD15HwmOFiqFp8ZbLhig==
X-Received: by 2002:a05:6000:14b:: with SMTP id r11mr39722594wrx.196.1565600015270;
        Mon, 12 Aug 2019 01:53:35 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:1c64:3600:ef32:9810:b6a2:ebe? ([2a00:23c4:1c64:3600:ef32:9810:b6a2:ebe])
        by smtp.googlemail.com with ESMTPSA id o9sm1305900wrj.17.2019.08.12.01.53.34
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 01:53:34 -0700 (PDT)
Subject: Re: [PATCH] media: docs-rst: Clarify duration of LP-11 mode
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190811173621.20454-1-slongerbeam@gmail.com>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <3f31cde6-8faf-f9a0-626e-dc995260a640@gmail.com>
Date:   Mon, 12 Aug 2019 09:53:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190811173621.20454-1-slongerbeam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On 11/08/2019 18:36, Steve Longerbeam wrote:
> Add a sentence that makes it more clear when the CSI-2 transmitter
> must, if possible, exit LP-11 mode. That is, maintain LP-11 mode
> until stream on, at which point the transmitter activates the clock
> lane and transition to HS mode.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>   Documentation/media/kapi/csi2.rst | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/media/kapi/csi2.rst b/Documentation/media/kapi/csi2.rst
> index a7e75e2eba85..6cd1d4b0df17 100644
> --- a/Documentation/media/kapi/csi2.rst
> +++ b/Documentation/media/kapi/csi2.rst
> @@ -49,9 +49,13 @@ where
>   
>   The transmitter drivers must, if possible, configure the CSI-2
>   transmitter to *LP-11 mode* whenever the transmitter is powered on but
> -not active. Some transmitters do this automatically but some have to
> -be explicitly programmed to do so, and some are unable to do so
> -altogether due to hardware constraints.
> +not active, and maintain *LP-11 mode* until stream on. Only until

s/until/at/ perhaps?

Regards,
Ian
> +stream on should the transmitter activate the clock on the clock lane
> +and transition to *HS mode*.
> +
> +Some transmitters do this automatically but some have to be explicitly
> +programmed to do so, and some are unable to do so altogether due to
> +hardware constraints.
>   
>   Stopping the transmitter
>   ^^^^^^^^^^^^^^^^^^^^^^^^
> 
