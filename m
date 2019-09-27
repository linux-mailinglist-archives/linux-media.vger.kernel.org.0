Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46556C0B6F
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbfI0Skm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:40:42 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:39827 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727447AbfI0Skm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:40:42 -0400
Received: by mail-ot1-f45.google.com with SMTP id s22so3104906otr.6;
        Fri, 27 Sep 2019 11:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=An2P5iT1CBNCYQlfPrMZjr85dNdpAyD/YwKV5l1E+LA=;
        b=Q1CcFu89TRctOd9NXvP3wRSRR/TqMwNsRp//cD2g4ddCJogdGimdupmkSyTwyrmt54
         3dfRFjIn9hXOJvJxi/es5SFVsMCJRuoR03Ll7TgXL1Nyh77fPYXeeUktu/T0XZF3vch9
         zJUTZMGaxy9DJV2NJuNgXVgA69eEKuBMAhVUGoUp4nx5iIskPUSKs5A2Nhtimvyj20PS
         Mrnlvhd0JWkAKb9+cEZwzs0D6lWN062JdvCGSCtZNaUeUBEZdlQMYCuHI3GNMFReOY0o
         K/GQoFz1pU2Zc9BFEYXO6zjchK3N76YM6EdP9XpwdICZTbYlr25FvQZWvMauwQkAk8C2
         jLDA==
X-Gm-Message-State: APjAAAUng7nDQM1vmaR4iSJyQS/xLzKRP6LzyU33YOi+ecBktJ4kTA+2
        q3RcP0sgrVRakrA1b5PGTQ==
X-Google-Smtp-Source: APXvYqyDkN0I5DtMNFKpwzJlP0MrRg6dekOrLcLzXUk2JBbZWwsURxPDPXJkHhbQiq904JlUnD3Tyw==
X-Received: by 2002:a9d:760d:: with SMTP id k13mr4145699otl.96.1569609640923;
        Fri, 27 Sep 2019 11:40:40 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e61sm1138052ote.24.2019.09.27.11.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 11:40:40 -0700 (PDT)
Date:   Fri, 27 Sep 2019 13:40:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch v3 5/8] media: dt-bindings: ov2659: add
 powerdown/reset-gpios optional property
Message-ID: <20190927184039.GA825@bogus>
References: <20190924164414.21897-1-bparrot@ti.com>
 <20190924164414.21897-6-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924164414.21897-6-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 24 Sep 2019 11:44:11 -0500, Benoit Parrot wrote:
> Add powerdown-gpios and reset-gpios to the list of optional properties
> for the OV2659 camera sensor.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov2659.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
