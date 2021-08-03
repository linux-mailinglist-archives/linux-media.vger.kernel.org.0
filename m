Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE36F3DF5D6
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 21:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240146AbhHCTjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 15:39:19 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:44698 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240141AbhHCTjT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 15:39:19 -0400
Received: by mail-il1-f176.google.com with SMTP id i13so8632491ilm.11;
        Tue, 03 Aug 2021 12:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9d7Nsy8vIgaqzKWJd0frDxnN4W4+2XNOR6Rw6MLP7lc=;
        b=AMNcmzfRaMNwzgnXDKD5gTtTHWBRMXe0wtYYBxQgYuv67MM0kRGsuXEB/RVpSXilPO
         7i86dB4MFLicNMb5XKQGN5nZiB1jlGW5U4AfrfEeMGfipGgeyTqq13dw2LjRTZNJToBz
         gj3CrYRxQtZyB8x52/0W/EQkyTlxNGYfpC8tZIHhko4FmJriIQMK+xWkmgzlWDGBvNNU
         ArekUzC891/JjOvU9yxToFw52yCVM1m1n4y363gS5vMKGVG+KlZvDD77OmSoJEcUj2ae
         AyX+Rk4GotzR1IGeYKd/ulaDJR853HAchHZrGuz6RwRKZbepl2Gxgzfve8RqJjuyuAyb
         S1Ng==
X-Gm-Message-State: AOAM531dULGWk0CfRmTGESxFBPX6kHZWp78C0TUm0W2ZXPvAMsaGIRUU
        LmNmoGu2YeZjxXiLj8r4sQ==
X-Google-Smtp-Source: ABdhPJzT8M9UawMmeGyv4En4ZE287YQdMrdHlfDjny5V9ZaGYTzyb+y8uZ8fltBxT6amUkpCsUTq/Q==
X-Received: by 2002:a05:6e02:1a6d:: with SMTP id w13mr218949ilv.299.1628019546458;
        Tue, 03 Aug 2021 12:39:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a17sm11643ios.36.2021.08.03.12.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 12:39:05 -0700 (PDT)
Received: (nullmailer pid 3615314 invoked by uid 1000);
        Tue, 03 Aug 2021 19:39:03 -0000
Date:   Tue, 3 Aug 2021 13:39:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4] dt-binding: media: document ON Semi AR0521 sensor
 bindings
Message-ID: <YQmbV8BNvHZR55lV@robh.at.kernel.org>
References: <m3lf5o9s9l.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3lf5o9s9l.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 30 Jul 2021 09:26:30 +0200, Krzysztof Hałasa wrote:
> This file documents DT bindings for the AR0521 camera sensor driver.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Reviewed-by: Rob Herring <robh@kernel.org>
