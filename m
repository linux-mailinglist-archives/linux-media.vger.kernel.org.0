Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA54636143D
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 23:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236050AbhDOVjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 17:39:15 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:42706 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbhDOVjN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 17:39:13 -0400
Received: by mail-ot1-f48.google.com with SMTP id 101-20020a9d0d6e0000b02902816815ff62so18054816oti.9;
        Thu, 15 Apr 2021 14:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5I8wWABck31NV1m65PD34RBvrDHA/tjv8Ta7oFlJnKU=;
        b=QqADqdO+RFTG9Px6oBDw6Jui9uK23orPhm4SACo1bXxo8qKw0rvpEjqqGiIQZAfyhs
         zz6DaPOqIbS3x9vXYdZPxorIUiP2oxy3xpjXrFoEP721cWS+FRYUfECS1k+Xvgo6L1ER
         kUxkaBIq18ru2PbPuRw9aRQPYhZqaD2OSSotfgKbyXi8vXGBWJXF80WA9MhTW1P9NqKB
         n8TYWJAgVjmpbpXq6ewrHWfT6C0q6fsFXmOM2RKozFfv3sHErFuVegDSIXEx5KUTSaM0
         s0Gyd7g0jRgyFZ6Dey/kUqIKl69YXgcMl1qkbjt237lQ4Q9LFVA/wE0wk9svkaMK2blB
         aLHQ==
X-Gm-Message-State: AOAM531T8Rt8RN7rqBh+yqCKPutD5jcDmunsf/5PO0SEbdkRLoLKXoZv
        E/JErjBvRFAE10shCgpDmq2bPlZquw==
X-Google-Smtp-Source: ABdhPJxObK1IwxxoYH555Ot+Ucad9hQ4Ko2LY17PIKD6j25Co7RdJ/qjsfc2pioJIEJIziEYUzsiBQ==
X-Received: by 2002:a05:6830:1af6:: with SMTP id c22mr945850otd.291.1618522728662;
        Thu, 15 Apr 2021 14:38:48 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x3sm1029215otj.8.2021.04.15.14.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 14:38:48 -0700 (PDT)
Received: (nullmailer pid 1926355 invoked by uid 1000);
        Thu, 15 Apr 2021 21:38:47 -0000
Date:   Thu, 15 Apr 2021 16:38:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,csi2: Add r8a779a0
 support
Message-ID: <20210415213847.GA1926287@robh.at.kernel.org>
References: <20210413172041.2514916-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413172041.2514916-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 13 Apr 2021 19:20:41 +0200, Niklas Söderlund wrote:
> Add support for R-Car V3U.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
