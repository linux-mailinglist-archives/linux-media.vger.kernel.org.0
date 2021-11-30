Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF347464160
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 23:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344592AbhK3Wkm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 17:40:42 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:36447 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344471AbhK3Wki (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 17:40:38 -0500
Received: by mail-ot1-f43.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so32348838otl.3;
        Tue, 30 Nov 2021 14:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qw3RdpSgeleuSiflU34NTnO23/282NpqqaqQkFDPC+U=;
        b=zoIgpNtRSRvxXUNmcQmBJlZFoGAeFq3jhzLamSqKZgmSflXw1YE7m1uVvzGT4Rhfmq
         OF5GLl+AX5+tuaXkCMtRs3O14D/6Fh9nM8N4ku9lMIl7OOSvb0iDoLt+ja5pMKjCAf57
         cfjEqKoQoZAzeNCzzXr2gM2V9gEDsQBzaMRE7+igl+54tnESIUyYtJ9xsFM+ZzbIGLOG
         3dhwLkyAtOxkTAGc7zpOGFIKxw0avDxjCIdGEtIHZLfbMb0LYqDVhidFIl9aNgKmf1a/
         ntaj24ujupaghV7Oh0hyd4ddNZ66HdTRD0y39Vh7MnDuj+IUVRNovXwWNCQ8Sw9ay7Kr
         hUPQ==
X-Gm-Message-State: AOAM533dvuXE2kg5PYItOCOnM5jGaTcwyf2OyPz5wtkQanFxeyJaYPCs
        iSe1sLqe0oP1L0mrhokjkbCf96N3ng==
X-Google-Smtp-Source: ABdhPJzXnw3uAcMBnl5vMUGNACtD+ZNjQrW+j2Iw8Mi5+5z+lYjcpJhD6SFMUjR6QC5tM+r6phqemA==
X-Received: by 2002:a05:6830:8:: with SMTP id c8mr2012372otp.115.1638311837835;
        Tue, 30 Nov 2021 14:37:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n22sm2990827oop.29.2021.11.30.14.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:37:17 -0800 (PST)
Received: (nullmailer pid 3137318 invoked by uid 1000);
        Tue, 30 Nov 2021 22:37:15 -0000
Date:   Tue, 30 Nov 2021 16:37:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: staging: media: i2c: Add bindings for Maxim
 Integrated MAX96712
Message-ID: <Yaanmxds2mxJnpil@robh.at.kernel.org>
References: <20211123214922.3981616-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211123214922.3981616-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 23, 2021 at 10:49:22PM +0100, Niklas Söderlund wrote:
> Add bindings for Maxim Integrated MAX96712 deserializer. The MAX96712
> deserializer converts GMSL2 or GMSL1 serial inputs into MIPI CSI-2 D-PHY
> or C-PHY formatted outputs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../staging/media/i2c/maxim,max96712.yaml     | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/staging/media/i2c/maxim,max96712.yaml

Drop 'staging'. We don't do staging bindings unless they are in 
drivers/staging/ and then I ignore them. Though a couple snuck in.

Rob
