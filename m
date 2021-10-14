Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66DA42E10F
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 20:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhJNSXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 14:23:00 -0400
Received: from mail-oo1-f49.google.com ([209.85.161.49]:44966 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhJNSW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 14:22:59 -0400
Received: by mail-oo1-f49.google.com with SMTP id w10-20020a4a274a000000b002b6e972caa1so2160967oow.11;
        Thu, 14 Oct 2021 11:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rzVS59fW6JCw4SUUlrSov5r2dgobGpDKLwKZFjJWyKs=;
        b=kgi3kNdu/C3lYiLqkN1YTnhMyw2k/xgj73DFZonfmOFKiYDM42gVeiiaM0c6hEZ/La
         rf2mZCN6BA0BU7BNk/Rvdksk+jO1b3ujmJbZrTKj6vXZUwW8Dtxo+cNgFLXASrw2Coky
         D96NNWj+oYzfqjH2ZaILEOUCh/CD2jSgh28yLv7+sLfB5zSUvKAKKV70NiIBT/FxZqZY
         Ys27CrNZVVJvfqgrPKO23dZIBwCp0PfiQoKnxJMQsZ55gpLp0n+EckXujPNTFa7Sqtn8
         gMlZhh49DIVF8UtvgqzTFO7i2mBlUQRqnd9psS9/qa2SkGFSMK2Kmv9F5CJbjIeHiUoW
         exiw==
X-Gm-Message-State: AOAM533zOpQgmfHES3XyL4bPbvdXRNuQp7zRO47kPlgg0iP2WeXRAFhT
        2HdwVD24EvAe2Ie675Q+kA==
X-Google-Smtp-Source: ABdhPJyOzMcPgnyUJRAN6oGdKsVkNB6TEcwQIooRYpkJvRAgay8ieGxivez25FP7BXpYYMh4S4iKDA==
X-Received: by 2002:a4a:b881:: with SMTP id z1mr5521653ooo.68.1634235654549;
        Thu, 14 Oct 2021 11:20:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c3sm701000otr.42.2021.10.14.11.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 11:20:54 -0700 (PDT)
Received: (nullmailer pid 3670138 invoked by uid 1000);
        Thu, 14 Oct 2021 18:20:53 -0000
Date:   Thu, 14 Oct 2021 13:20:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Add ADV7610 support for adv7604 driver - DT docs.
Message-ID: <YWh1BYWwLHJCqsyO@robh.at.kernel.org>
References: <m31r4yoge5.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m31r4yoge5.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 06 Oct 2021 07:45:38 +0200, Krzysztof Hałasa wrote:
> ADV7610 is another HDMI receiver chip, very similar to
> the ADV7611. Tested on TinyRex BaseBoard Lite.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> 

Acked-by: Rob Herring <robh@kernel.org>
