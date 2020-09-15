Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE80226A992
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 18:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbgIOQTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 12:19:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40431 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgIOQRf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 12:17:35 -0400
Received: by mail-pf1-f196.google.com with SMTP id x123so2220057pfc.7;
        Tue, 15 Sep 2020 09:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KSOAyNVWeqUE1eNb5fjGsEEoMGtp4LbwBVr7j3WH4jQ=;
        b=jvO0O19SkaY44+2hQWCn8iDuq5BTM0bhBPsLpNTtyldIFNFLwEyzet7mXzSqBnrV6Z
         LweGbEhXfHIN2+xXVsG+A4nxPcD2fyqA4r2yUC1PumNtZ3e3eEZqFwZ/P3JKD+zQO+cA
         HCzc2G29NVElrLmGFg2bNzwJRdu6guugu+MPqcqsF2Hct7hgkazjg0sT+qyUhllxCWqk
         aTtJwPhPSpB+DueEFGxgjawxSN2v6VagG5n3l4kilDOEjtZadTy+Mo4iJlsHxyMsgaPU
         6LUhKE04XaxQiSLwIjVw22gdlzQVu5hf0kII1wUlzqYB9xO+GZVAYK5BkMW/PJY5qlIZ
         iNVQ==
X-Gm-Message-State: AOAM533BCggrEnBP4lZMVMrRZK43f4DnRItIcKgHHU87E9rO2v0/qxDT
        Nb4VXX8UI6v5Ij4TGWPg09MucC3/jyiQ07I=
X-Google-Smtp-Source: ABdhPJyk0bNPAGNZuwTrEU4SGslz9cnXoPY9yjb2itUeNoFTxzwNacOA+ryWWOc0EJ4QK9zJ7ZuqfA==
X-Received: by 2002:a92:bad9:: with SMTP id t86mr16275837ill.308.1600185674993;
        Tue, 15 Sep 2020 09:01:14 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j62sm7842074iof.53.2020.09.15.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:01:14 -0700 (PDT)
Received: (nullmailer pid 2029905 invoked by uid 1000);
        Tue, 15 Sep 2020 16:01:12 -0000
Date:   Tue, 15 Sep 2020 10:01:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: renesas,vin: Add device tree
 support for r8a7742
Message-ID: <20200915160112.GA2029821@bogus>
References: <20200907144509.8861-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200907144509.8861-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907144509.8861-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 07 Sep 2020 15:45:08 +0100, Lad Prabhakar wrote:
> Add compatible string for r8a7742. No driver change is needed as
> "renesas,rcar-gen2-vin" will activate the right code.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
