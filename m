Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57A522000A
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 09:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfEPHPa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 16 May 2019 03:15:30 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:45013 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfEPHP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 03:15:29 -0400
Received: by mail-vs1-f67.google.com with SMTP id j184so1617227vsd.11;
        Thu, 16 May 2019 00:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vBPaoFAauCH5+iqFfyzqNMHD69Jtgjzqknm8ZGh1Rho=;
        b=fGSAUOgg65uvbuXBnBbxz44Dkmu0LWLRVCHUJRLuvv89bK3ZJbI5pNQVABTwxE4LE7
         o++8qeiHfRLWAivZEtVrSXjo2AArWhHiABEr/uOX0aPrjVAT2NeCof/jzfdLrDGDDWXI
         r72Lt+iGWLHjZlVQEmkQUUv41go249S8RiAs9ZGuymG9fKsfRNZdp3qWhyquTOzq5sGV
         F8wE3bvZX/llb3d8Sgv3hAs8tMj/0Wfcjs6OZ1OCH1BhZg/TKWBc6mo4BetWKzbMa7uC
         cYgbiXGrxPo98vyCVG5qAJtb7gk9Aoz/xLphc+rVn1yHP/H0KWi6AeVL3T7vtXyjLzwA
         2iJw==
X-Gm-Message-State: APjAAAWsUgcO4lMN7L+O1QvrO6Zd5HoZi9pvd0+HFN6Gpq0pFBdJRvAs
        30Z0XQGswteFODDvbG1WfVgiQnl//Biht6hpvBKsF+Ht
X-Google-Smtp-Source: APXvYqx3lubdb4zhS3ZD+mCp84RPS/GM5QyWhtoYpBVTrzLxaHp6HAB4gJ/WpOZhyHhmWae1oCBKMGqHKgMGV9Tgg58=
X-Received: by 2002:a67:fdd4:: with SMTP id l20mr18208599vsq.63.1557990928358;
 Thu, 16 May 2019 00:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190516003803.808-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190516003803.808-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 May 2019 09:15:16 +0200
Message-ID: <CAMuHMdVU5WhL66Lve1qjZx7OGYWbkUmC9JNvYye0SGvtWmawVQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 16, 2019 at 3:49 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> pattern.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
