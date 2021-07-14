Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968983C7BA6
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 04:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237562AbhGNCW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 22:22:27 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:46817 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237555AbhGNCW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 22:22:27 -0400
Received: by mail-io1-f45.google.com with SMTP id p186so144252iod.13;
        Tue, 13 Jul 2021 19:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oi7Iv96uLnmSi4m8AHsi5ndCWlB4bxoKEn36ydgdGgY=;
        b=ERqbU16RuzZcq7xiaV27uG6mW2Nl2vATfKFrx2BsEk2wIn4A+uEPRuJHozhPalnr10
         vCXz6D79CVtFasz75U8x+rFMV7XtIoKA+ZHRMK62E6gcj8KFcS1UGAGu1d6Qgxl2Qem/
         BU9vrIJdAnMbEWr6jd7rBL5b7aCv45HIRcHgpvARO7wiTxd+L/qBFKkHVyJeGKXWvHTk
         uJMosKdQwLoz8FWOb5weyAJIfBZzORnKdzT65JOplmcV1IiqHuLD3qJF++mC+SEahFwe
         tXUCHQMqr4eTDfqLzDwhCaSAk1scug7uDVjEzqDz6VOg6GgwQBeHb0vXGkqfXNXhKWXY
         QTew==
X-Gm-Message-State: AOAM5308G6VCB6qNSgBQiEWxuvb8ENnPeZIrK4DBsBXg8ESx67O5v8zT
        CmYWL5PlZHgT6RvEV7DC99u3H9v3ew==
X-Google-Smtp-Source: ABdhPJxvzQSpzdIYwiscskZmM0NAT6/ND6QwbLxckamY1LNImoRxjpTptECdgf0QZFkRiPMYPt7nFw==
X-Received: by 2002:a02:b199:: with SMTP id t25mr1719375jah.35.1626229175026;
        Tue, 13 Jul 2021 19:19:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c7sm449977ilj.86.2021.07.13.19.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:19:34 -0700 (PDT)
Received: (nullmailer pid 1318547 invoked by uid 1000);
        Wed, 14 Jul 2021 02:19:31 -0000
Date:   Tue, 13 Jul 2021 20:19:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/6] media: dt-bindings: mt9p031: Add missing required
 properties
Message-ID: <20210714021931.GA1318494@robh.at.kernel.org>
References: <20210712085535.11907-1-s.riedmueller@phytec.de>
 <20210712085535.11907-7-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712085535.11907-7-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 12 Jul 2021 10:55:35 +0200, Stefan Riedmueller wrote:
> Add missing required clocks and supply regulator properties for the
> sensor input clock and vdd, vdd_io and vaa supply regulators.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  .../bindings/media/i2c/aptina,mt9p031.yaml    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
