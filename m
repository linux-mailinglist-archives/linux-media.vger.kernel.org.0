Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3266448A0F8
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 21:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239991AbiAJUcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 15:32:19 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:41976 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239773AbiAJUcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 15:32:17 -0500
Received: by mail-oi1-f181.google.com with SMTP id q186so14823981oih.8;
        Mon, 10 Jan 2022 12:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q570n7xyGy4uMHiyCWHW6RXMndNAR/UhkuBbCnqT2YY=;
        b=ObIHOUrqllP+RuySn5SEJZ89x0txI0w46yP+50gsJgimqHtZT83VKoZjnVXYWddYhJ
         ElovC9nIBq4tSumOn1AHiB9wnwnU75yjKhHVX/Qest8S7EVetXslnm1ntRE5Wvlekn99
         Jp2UHqbJMoF8kfVbfZEQNddelkw0Jcggko9WuIkWzKra0d8msg4FSY3d95R5M6Cp+v2d
         3SH2SvoMMu/OXeQ766x4K82zSe/z1nML5eAmFiRv9MP4k+HHr5i+3dpas59uqYpKwJ3D
         WfL5hFjIJ0PPQhpSN5WQ92h2InDh7beP+EA8pnZfVs5OS4O8CC9GDbdjeHA0EH2Orkoj
         +s6A==
X-Gm-Message-State: AOAM532jVghYC3Pw6mv9nhD6zzhJR3i4LY1KLKIeUoac/7y3ZKMrEdOd
        7PQRZmXgJMdUUzRazcs7OkhTveP/tg==
X-Google-Smtp-Source: ABdhPJxWLeHJ7MJ7Q8WCxEm9qsuYu/OjdGMVktuzkoHYpjluTKqKmevHlXVH4pswLrBRtOjJSvbECA==
X-Received: by 2002:a54:4110:: with SMTP id l16mr3820549oic.79.1641846737353;
        Mon, 10 Jan 2022 12:32:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d1sm1493184oop.35.2022.01.10.12.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 12:32:16 -0800 (PST)
Received: (nullmailer pid 1454256 invoked by uid 1000);
        Mon, 10 Jan 2022 20:32:15 -0000
Date:   Mon, 10 Jan 2022 14:32:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: i2c: maxim,max96712: Add bindings for
 Maxim Integrated MAX96712
Message-ID: <YdyXz9CQwAhzmi62@robh.at.kernel.org>
References: <20211230123354.623876-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211230123354.623876-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 30 Dec 2021 13:33:54 +0100, Niklas Söderlund wrote:
> Add bindings for Maxim Integrated MAX96712 deserializer. The MAX96712
> deserializer converts GMSL2 or GMSL1 serial inputs into MIPI CSI-2 D-PHY
> or C-PHY formatted outputs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> * Changes since v1
> - Fixed spelling in binding description.
> - Drop 'staging' per Rob's suggestion.
> 
> * Changes since v2
> - Fix the $id file path.
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> 

Applied, thanks!
