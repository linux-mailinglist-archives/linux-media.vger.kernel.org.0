Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0F12E672E
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2019 22:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbfJ0VSp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Oct 2019 17:18:45 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43642 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731301AbfJ0VSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Oct 2019 17:18:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id b19so3108817otq.10;
        Sun, 27 Oct 2019 14:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fumAfoD2Cgq/W1me+bNa2XFuOCsUJ9eItZbMC35oeBg=;
        b=QeZOjxjfOH9PUYOggfNU2A9vl3Zr8boDGZVyvn49g6bHIsS5z9orvLmPrK6NZAnO8V
         gXfAgX3a3+WHBgs4bkwdyXYaLrs1H80D6Xu0mPe6vWioWo+aQdXnSEpSsazLqDx0/lX6
         gA+vXsyblPGwkE1gq6qLESm1KSd+XVxMOAQ5gMO2O0KtPnbzHHNRbX3x/uM4s0fRKwgz
         XItE76HCESOCp0A6AwVlJBgvTFKFSzmKbSn+Lj/VEYB+J0ALMQW/Tdo1kSGxziwKBQzq
         3neLZ7CdOWQUYx5khb1xcAVH6cCdRR2lUA9x9tpkp6mCI9XbYr0/ua3ymg2daDb1MApb
         rOWQ==
X-Gm-Message-State: APjAAAVsGE9v099IXwpgmFobaS9zMloSMLg923IP/pwAoD2CkwkPNi30
        4hQ1owu4RH92+P3DzqATfQ==
X-Google-Smtp-Source: APXvYqzG8ppYlt5HgNNVMSLWpbai9B37LgrsOvjc5cRBt5wj6xqVDeDqtmmzOElGsRgYOH6eefweag==
X-Received: by 2002:a9d:4c07:: with SMTP id l7mr380968otf.206.1572211121743;
        Sun, 27 Oct 2019 14:18:41 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y4sm2498157oig.32.2019.10.27.14.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 14:18:40 -0700 (PDT)
Date:   Sun, 27 Oct 2019 16:18:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 1/4] media: dt-bindings: rcar-vin: Add R8A774B1 support
Message-ID: <20191027211840.GA498@bogus>
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
 <1571137078-28922-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571137078-28922-2-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 15 Oct 2019 11:57:55 +0100, Biju Das wrote:
> Document support for the VIN module in the Renesas RZ/G2N (R8A774B1) SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
