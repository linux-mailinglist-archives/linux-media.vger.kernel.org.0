Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A712322B82B
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 22:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgGWUwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 16:52:01 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:34067 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgGWUwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 16:52:01 -0400
Received: by mail-il1-f196.google.com with SMTP id t4so5511650iln.1;
        Thu, 23 Jul 2020 13:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zTq964IoNeUTXAyCqG6dY3TvoVtuKMh1a1pVzxzpE84=;
        b=slCFGeymxGF0/CqGPcX9mhRK+hyIR2EyEiudxB3OeXss57yKuZz0k+PIpfJwztvijk
         Dlpk48J7IER/mlu0VQvZ18540ATCFN2Ghpk623MHOQbUi+utoAPSe3DqhOfsKH22x2hH
         7I/rQfv7qO5xF0X3lscHYrRhXQOAUtFLvFjNsPSG1yRr0fBfv8WCHeHui4yq17HdBNBf
         CE1/Ui59BlJWPz2mFc0zIXx50p/qJ6I0FQMSTXt3yIhqfzdrnc6gqw1Q/lJH7wP9wobl
         QNc66SRZwzWRiH1rzkGh1lRwlfTAvR1HsJHQOs41shL38wRgGVSn9QVphf6ICKEG1KQc
         GDeQ==
X-Gm-Message-State: AOAM531dzufdmm+2/vUamaWQaW7Xz4/5sqgqgf7xnPWBA8YmzIuLwSwo
        UeEDD5msIhNycOKfMAdf4Q==
X-Google-Smtp-Source: ABdhPJyz6S5X17upMQkTR7yW1Zxee++QAdF6rRUOSZHXYbUwt0EVLRTs3W50xQlB5nkWQcHNfh7FKA==
X-Received: by 2002:a92:d2c6:: with SMTP id w6mr6476819ilg.24.1595537520467;
        Thu, 23 Jul 2020 13:52:00 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a11sm2182430iow.26.2020.07.23.13.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 13:51:59 -0700 (PDT)
Received: (nullmailer pid 839307 invoked by uid 1000);
        Thu, 23 Jul 2020 20:51:57 -0000
Date:   Thu, 23 Jul 2020 14:51:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Santiago Hormazabal <santiagohssl@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 2/3] media: kt0913: device tree binding
Message-ID: <20200723205157.GA839277@bogus>
References: <20200717004441.116248-1-santiagohssl@gmail.com>
 <20200717004441.116248-3-santiagohssl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717004441.116248-3-santiagohssl@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 16 Jul 2020 21:44:40 -0300, Santiago Hormazabal wrote:
> Document bindings for the kt0913 AM/FM radio tuner.
> 
> Signed-off-by: Santiago Hormazabal <santiagohssl@gmail.com>
> ---
>  .../bindings/media/i2c/ktm,kt0913.yaml        | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
