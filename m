Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186C870C69
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 00:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732449AbfGVWLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 18:11:37 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38425 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfGVWLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 18:11:37 -0400
Received: by mail-io1-f66.google.com with SMTP id j6so2354810ioa.5;
        Mon, 22 Jul 2019 15:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZZjeYarbm2uHTbPqEU/SfJr1OMvMhmzpfbxIokfphLg=;
        b=iyoViomBXRsT0hzKS5lfM4BtiPgou9p6Zud/l4XsJIq1hBWHBeyFdMDlEg2dwfZNE7
         RMcKkF4ZJ/txXK8zBJKQbOE3IVPrOsdfkjMoQTz/lDLC9d8AMAeoEuhZhHqScYW/Ij6c
         vdo/wurql6qxyys/W6qmt2gwB1IalzkttfTeaoqnuf/GxWndWulTt2NnW6C1plaFvqqE
         YM1OqsuGzED8+I79LWZBRPfUrsiDh+Micy1maHHyulta99TPyuDfmBqdLdz6PkDZqQu4
         bRzKzpboudriPzUJ9snGX3++EAPXRLd2XfqsCjZ0ug1FVPOZ6dpYUh/Ce7+xIUJ8RYGx
         8Ltg==
X-Gm-Message-State: APjAAAWrIo8/hbSy+hvVAv6sjCOsoC3omApqkfI2vyLX/WvidLHtqOf+
        mha7RHpJF0jKaJRM7oWMnw==
X-Google-Smtp-Source: APXvYqwybodqBsnRMzwxflKMmSxt7BwWQbvI4+93D/Ql0XrEVFvtTEtzmr5T6L7GyUnVm3y5riatKg==
X-Received: by 2002:a02:a581:: with SMTP id b1mr4163149jam.84.1563833496727;
        Mon, 22 Jul 2019 15:11:36 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id p10sm58670815iob.54.2019.07.22.15.11.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 15:11:36 -0700 (PDT)
Date:   Mon, 22 Jul 2019 16:11:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 07/11] dt-bindings: media: meson-ao-cec: add SM1 compatible
Message-ID: <20190722221135.GA32382@bogus>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-8-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701104705.18271-8-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  1 Jul 2019 12:47:01 +0200, Neil Armstrong wrote:
> Add AO-CEC compatible string for the Amlogic SM1 SoC family,
> a derivate of the G12A AO-CECB controller.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/media/meson-ao-cec.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
