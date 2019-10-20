Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB010DE0D2
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 00:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfJTWFx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Oct 2019 18:05:53 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37686 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfJTWFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Oct 2019 18:05:53 -0400
Received: by mail-lj1-f194.google.com with SMTP id l21so11225693lje.4
        for <linux-media@vger.kernel.org>; Sun, 20 Oct 2019 15:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=iUMa5QoMRlHLJqsynLbu/hpJbEC1VIDyLoIQW8s0r9s=;
        b=kbHe5OvbVNtkyq6JSWrrjlbEhmXrUq4zaQBlBOFRjwyxCKK6ARW14hoWM8SarEtNcs
         nRkkwzk/t7Q+wuaUSS9x0v8yg0EhCn6kBH6D4bZ09iXTpEYtHFB3SpGv/nkG71StkcJz
         2O9GbUsV6cZ66kN+Otifgq7EsguR/X2+dnAtV8C2zATib0+qicD4jjqr0BlRYbTrcgYw
         nF9R4Mq2J2KTr9h+/KTGTCG8IW+FoeAwI8eF4eU31xrRWMxlKcDpCvdSc2+R8s0+45Ez
         KWqIB82pkZjvvVsmgN+I24bHZkrqMq1fV206A5UK2Atc/wimC8opCYf9J0Sko3Zo+LmY
         vZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iUMa5QoMRlHLJqsynLbu/hpJbEC1VIDyLoIQW8s0r9s=;
        b=FiZ8VbLV3A0VCkUCcAX5imhgy9qHc2Rehs73DiKhfD4EjVSLRffIUfk1XFAxxX+7WS
         3+EArAMwIW5CjrAHQJUr9YRpXB9sD+rjEeWZO5rvSMVzZ7TTPgoIVPXydhg+RIzc0t7O
         LiPucoG2ff25sx1B2hZCDtsvDTQ64vrTxi+X+PBM5tdf7EuszVKATyEK2ntVs+QapDwS
         7qqjZVwGKhOvc6fxv25+x7oeX5hQ+SF4xCKz1Gf2vUyBNayerYjkfCDy2g369/pAdHsv
         PasRh2D/S13eUpwDLZs0AS4I+2fOybH+ux+V0PwqkuctkgXhBjJ9b2yZRpeN2boLIwIx
         6WKQ==
X-Gm-Message-State: APjAAAUeOHO5uzyvytjiiJh35Y4CdxrJ1Hve6SeihvV+mz1tpFmGDcJJ
        euJ5DbWz5+RncFeLcZaHKjkcRQ==
X-Google-Smtp-Source: APXvYqxPyuMIupeV/16Itd+J1ki2mprFeli1CjiyppU2YJniKudicVPAQI8wojvxnpK5GeVvGJnNmw==
X-Received: by 2002:a2e:8945:: with SMTP id b5mr8423266ljk.215.1571609149787;
        Sun, 20 Oct 2019 15:05:49 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id i11sm6465930ljb.74.2019.10.20.15.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 15:05:48 -0700 (PDT)
Date:   Mon, 21 Oct 2019 00:05:48 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 0/4] Add VIN/CSI-2 support
Message-ID: <20191020220548.GG13372@bigcity.dyn.berto.se>
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

Thanks for your work.

On 2019-10-15 11:57:54 +0100, Biju Das wrote:
> This patch series add VIN/CSI-2 driver support for RZ/G2N SoC.

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Biju Das (4):
>   media: dt-bindings: rcar-vin: Add R8A774B1 support
>   media: dt-bindings: rcar-csi2: Add R8A774B1 support
>   media: rcar-vin: Enable support for R8A774B1
>   media: rcar-csi2: Enable support for R8A774B1
> 
>  Documentation/devicetree/bindings/media/renesas,csi2.txt | 1 +
>  Documentation/devicetree/bindings/media/renesas,vin.txt  | 1 +
>  drivers/media/platform/rcar-vin/rcar-core.c              | 4 ++++
>  drivers/media/platform/rcar-vin/rcar-csi2.c              | 4 ++++
>  4 files changed, 10 insertions(+)
> 
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
