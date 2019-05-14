Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4625A1D02C
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 21:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfENTuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 15:50:55 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34446 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfENTuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 15:50:54 -0400
Received: by mail-oi1-f196.google.com with SMTP id v10so59153oib.1;
        Tue, 14 May 2019 12:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R9p+114iMCLKbcYWbrKx2t0zEed2I4kEC9Y3wCX+xVY=;
        b=LibOGBS+hVLpR4nK8EI34JLmFbdUDQrEglIdGDH45m1N0eeGIg8LKaWnHSLmd0eDvP
         /JGgtuUI3N6Nvq8IkJgY0CFtqcsgIawsqWsbosMx0d7pU2y/dCQckdUv8WcXXGAVG1oS
         viDQ+m43OqJEuY14uHHbrk6VNPBzJmD/vlLsAFeZeJBKJwi/WljPVlprzRUWnZrO6p1+
         hN4SmUVm7O3c3aP/5HItNdfGqkvfQJfHo2+027AyvQ4DzPTTjugmK3Jpa+e99YXESTrc
         7dOpAOV4NiKdoIYQhodXbRK7I3+I7YovHp5xtMWmTzYE+25EAMa3WwKiTkXs6HGKPprh
         T5IQ==
X-Gm-Message-State: APjAAAUtAI4suu53QfkkwatQCIUN/ZdVLC+ZRQ3Ns/xSOtiJnyx6U/z1
        HSUcC1PDoet87zVsG2kI0Q==
X-Google-Smtp-Source: APXvYqzfUrboeaRa/tO2hasvJV3+3PJ668BmH2CS3HSxQeZZDMR4XkKbC/GW2Tv/2mi4yURpj3Heow==
X-Received: by 2002:aca:be46:: with SMTP id o67mr4052966oif.92.1557863454007;
        Tue, 14 May 2019 12:50:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n95sm4498183otn.73.2019.05.14.12.50.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 12:50:53 -0700 (PDT)
Date:   Tue, 14 May 2019 14:50:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     tfiga@chromium.org, hans.verkuil@cisco.com,
        laurent.pinchart+renesas@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        christie.yu@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com,
        seraph.huang@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org
Subject: Re: [RFC,V2,01/11] dt-bindings: mt8183: Add binding for ISP Pass 1
 reserved memory
Message-ID: <20190514195052.GA3314@bogus>
References: <jungo.lin@mediatek.com>
 <20190510015755.51495-2-jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510015755.51495-2-jungo.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 10, 2019 at 09:57:47AM +0800, Jungo Lin wrote:
> This patch adds the binding for describing the reserved
> shared memory used to exchange ISP configuration and tuning
> data between the co-processor and Pass 1 (P1) unit of the
> camera ISP system on Mediatek SoCs.
> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
>  .../mediatek,reserve-memory-cam-smem.txt      | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt

See my comments on the other 2 camera related reserved-memory bindings.

Rob
