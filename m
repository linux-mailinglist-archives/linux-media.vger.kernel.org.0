Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74EE2276280
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 22:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgIWUvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 16:51:25 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43351 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgIWUvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 16:51:25 -0400
Received: by mail-io1-f67.google.com with SMTP id z25so934768iol.10;
        Wed, 23 Sep 2020 13:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5ldngoDtoxSj7ZOzU0kahms2LRMVaYvHgT9m+snidDA=;
        b=YQQzQToUcnClK8eiGRwmTGjc79fvWtTno6F6gG9njfHdRjhHxmV7GrUEyzJT8L2Ut2
         5EsAV5l+sF7iF5HKYvNgdFWgwm1LZ/BSVmvUA9QCvDapqf+0wVp8LmbVNHfAIfdnnslb
         /aVkxdQ8CwZE2ZajE/ynsWSoeL1onJ3yHTA75lIlv8mkteOInprfv9caRXqZ1mjJBjRL
         r2F1H2yILNJ51W6JxUQPEZlCR0NDrzDGO0n5DS43+7DD6JE4Gu3NXnFH7yWqEH9xTWy7
         1cd8PP+eja71qF6wZF5zy4lyI+R/l5qlvD5DKbZf/0BlBfqm0OUIkB7cRDzyz3WCI6oK
         ikmQ==
X-Gm-Message-State: AOAM531E6ZCLZ3vh+1Ofzf1PFE3CAc00IIkNDGwvy6buKIbAdRjeuSWK
        xXLOHH1VhLbcvgy/Ygw+/ZjdzxDHWo9ozwc=
X-Google-Smtp-Source: ABdhPJy8s4B1pYhT5KD31vEMXW8bHFYcRN1qSyqAfh2eRaJOqHHjAj7UNLo+64UymDfoUt1jj9OeaQ==
X-Received: by 2002:a6b:7:: with SMTP id 7mr1060365ioa.190.1600894284260;
        Wed, 23 Sep 2020 13:51:24 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id r8sm411644iot.51.2020.09.23.13.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:51:23 -0700 (PDT)
Received: (nullmailer pid 1285267 invoked by uid 1000);
        Wed, 23 Sep 2020 20:51:22 -0000
Date:   Wed, 23 Sep 2020 14:51:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add techwell vendor
 prefix
Message-ID: <20200923205122.GA1285024@bogus>
References: <20200918142422.1086555-1-maxime.chevallier@bootlin.com>
 <20200918142422.1086555-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918142422.1086555-2-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Sep 2020 16:24:20 +0200, Maxime Chevallier wrote:
> Add prefix for Techwell, Inc.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
