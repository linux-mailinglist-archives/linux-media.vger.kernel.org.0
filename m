Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7476234DAD
	for <lists+linux-media@lfdr.de>; Sat,  1 Aug 2020 00:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgGaWnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 18:43:15 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40332 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgGaWnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 18:43:14 -0400
Received: by mail-io1-f67.google.com with SMTP id l17so33186304iok.7;
        Fri, 31 Jul 2020 15:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1B+vyO+R8quuszNhtOVeeWCkKlu3aOesury3x/oHRpU=;
        b=EcReuUdawrJllYwPSiyEFtFRPY/9Jg55O0PTxsB1KD6Uhp+rXnNXTY5iCZzF+fH87C
         nkx8FGBbfdmt6aNlaPLROn1aXq0vAu0nOdjOl2/d3CtYPF6mSLN9BUqIKTcsfaLez9AL
         0dPp3h4yZHVwuk9I5W3axbTKFvRvQJoO97rAeTlCKwq3Fd7JpJB91TBiG7U2S7uZcewr
         UhsRppJi5nDXUAqTteVezInLiPTpM4+Qj6E5gVISVotPsf0TRw/Lm+V2wWG4Wtobf9vl
         i7nU5osUcc3W2Vi8swR3LFfnZzey44/KwHz3r2wfTH0XZOzbStBy9lO58e/fu20q5prg
         RoXQ==
X-Gm-Message-State: AOAM533ZiTVqq/X0HaDNfMbWwd2nVkDsRBXZKxYpAFQCdj9e4LMOZcvL
        w9+tEMgg0Re51gLuydAwsw==
X-Google-Smtp-Source: ABdhPJz2Svj2E53KRDqoGx4JA4V4fWumeWvZbSTFi+n69Ey9ghRgN1SmkWE3+pqiF//EmqPn6wrunw==
X-Received: by 2002:a05:6638:1649:: with SMTP id a9mr7746090jat.115.1596235393792;
        Fri, 31 Jul 2020 15:43:13 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y8sm5242818iom.26.2020.07.31.15.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 15:43:13 -0700 (PDT)
Received: (nullmailer pid 943315 invoked by uid 1000);
        Fri, 31 Jul 2020 22:43:10 -0000
Date:   Fri, 31 Jul 2020 16:43:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     robh+dt@kernel.org, mchehab@kernel.org, s.nawrocki@samsung.com,
        kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org,
        kgene@kernel.org, krzk@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] dt-bindings: media: Correct samsung-fimc
 parallel port numbering
Message-ID: <20200731224310.GA943204@bogus>
References: <20200730230114.8572-1-xc-racer2@live.ca>
 <BN6PR04MB0660B938349CA15DE7BCC5BBA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660B938349CA15DE7BCC5BBA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 30 Jul 2020 16:01:14 -0700, Jonathan Bakker wrote:
> The parallel port nodes should be numbered 1 and 2, not 0 and 1
> for A and B respectively.  The driver has always implemented 1
> and 2 and the in-tree Goni DTS uses 1 as port A as well.  Update
> the documentation to match this behaviour.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
> Changes from v1:
> - New patch replacing patch modifying driver to match documentation
> ---
>  Documentation/devicetree/bindings/media/samsung-fimc.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
