Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 647B5139C9B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 23:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgAMWc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 17:32:57 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37501 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729160AbgAMWct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 17:32:49 -0500
Received: by mail-oi1-f196.google.com with SMTP id z64so9959851oia.4
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 14:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8OSe8nCMD8zFTJxmKCShhLga5sECo0uXyDP7h9INGG4=;
        b=D2aiMF7HOFA7G4+mJI21hvlD0wejsb9BXXEo/wiE9HE6sGSBjluOE0kyQKf4yolPoh
         vgpRtVjnfW10ODd4c2BhdB5c7v3ZgidfBz0BDKDRYMMqYLFj0M2jOZPWVmpwGgiPHvLs
         j1yOZFLUqG+q/gZ4G6G9bsNwpLIsvi7KjreuMMwK224eqMgg1qD5YHjU8so+AGGZIcax
         6s5g/ekLS03lWQFz6WO/2whGSKIShu8rzrrE+ecTuMRv52KKPac3nfGqZinjEftZT0cJ
         UTBUH3t4H5iCYmKTceuwZZePztpluhkCrsgf/nxsXNONIvsPnj6WTu+1VUcRVodGt9ps
         1SZw==
X-Gm-Message-State: APjAAAVtTNhEN79NZqg5V9kzgsspWBH5OcU8Jyr/jMsB4RQo2lP4SXRJ
        7c1GiLLbv00lQGRJnklqB3tPhB0=
X-Google-Smtp-Source: APXvYqw6/GljWBhYhpX5055920jVNUlVZYLqpmql2GzSdMb8WSZvbMD4JWqyzf/Da1NQTORa4M2yqw==
X-Received: by 2002:aca:e146:: with SMTP id y67mr13780872oig.93.1578954768708;
        Mon, 13 Jan 2020 14:32:48 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z12sm4643075oti.22.2020.01.13.14.32.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:32:47 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219d1
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:32:46 -0600
Date:   Mon, 13 Jan 2020 16:32:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alex Riesen <alexander.riesen@cetitec.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/8] dt-bindings: adv748x: add information about serial
 audio  interface (I2S/TDM)
Message-ID: <20200113223246.GA22019@bogus>
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141550.GH3606@pflmari>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113141550.GH3606@pflmari>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 13 Jan 2020 15:15:50 +0100, Alex Riesen wrote:
> As the driver has some support for the audio interface of the device,
> the bindings file should mention it.
> 
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> ---
>  .../devicetree/bindings/media/i2c/adv748x.txt       | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
